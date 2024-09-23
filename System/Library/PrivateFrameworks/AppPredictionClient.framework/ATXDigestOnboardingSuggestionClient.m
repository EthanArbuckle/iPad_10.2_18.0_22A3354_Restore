@implementation ATXDigestOnboardingSuggestionClient

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_0 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_0, &__block_literal_global_2);
  return (id)sharedInstance__pasExprOnceResult_0;
}

void __53__ATXDigestOnboardingSuggestionClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXDigestOnboardingSuggestionClient)init
{
  ATXDigestOnboardingSuggestionClient *v2;
  NSObject *v3;
  uint64_t v4;
  NSHashTable *observers;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  id v9;
  uint64_t v10;
  NSUserDefaults *userDefaults;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATXDigestOnboardingSuggestionClient;
  v2 = -[ATXDigestOnboardingSuggestionClient init](&v13, sel_init);
  if (v2)
  {
    __atxlog_handle_notification_management();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ATXDigestOnboardingSuggestionClient init].cold.1(v3);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("ATXDigestOnboardingSuggestionClient.queue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v10 = objc_msgSend(v9, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v10;

    -[ATXDigestOnboardingSuggestionClient _setProbabilityOfShowingDigestOnboardingToUser](v2, "_setProbabilityOfShowingDigestOnboardingToUser");
  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__ATXDigestOnboardingSuggestionClient_registerObserver___block_invoke;
  v6[3] = &unk_1E4D57258;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __56__ATXDigestOnboardingSuggestionClient_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)registerForOnboardingSuggestions
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ATXDigestOnboardingSuggestionClient_registerForOnboardingSuggestions__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(queue, block);
}

void __71__ATXDigestOnboardingSuggestionClient_registerForOnboardingSuggestions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[10];

  +[ATXNotificationManagementMAConstants sharedInstance](ATXNotificationManagementMAConstants, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "digestOnboardingSuggestionHour");
  v4 = objc_msgSend(v2, "digestOnboardingSuggestionMinute");
  v5 = objc_msgSend(v2, "numPreviousDaysToCheckForNotificationProblemForDigestOnboardingSuggestion");
  objc_msgSend(v2, "thresholdForShowingDigestOnboardingSuggestionToSeedUsers");
  v7 = v6;
  objc_msgSend(v2, "thresholdForShowingDigestOnboardingSuggestion");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__ATXDigestOnboardingSuggestionClient_registerForOnboardingSuggestions__block_invoke_2;
  v9[3] = &unk_1E4D57568;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v3;
  v9[6] = v4;
  v9[7] = v5;
  v9[8] = v7;
  v9[9] = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __71__ATXDigestOnboardingSuggestionClient_registerForOnboardingSuggestions__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInteger:forKey:", *(_QWORD *)(a1 + 40), CFSTR("digestOnboardingSuggestionHour"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInteger:forKey:", *(_QWORD *)(a1 + 48), CFSTR("digestOnboardingSuggestionMinute"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInteger:forKey:", *(_QWORD *)(a1 + 56), CFSTR("numPreviousDaysToCheckForNotificationProblem"));
  objc_msgSend(*(id *)(a1 + 32), "_registerForKVOChangesOnMainQueue");
  objc_msgSend(*(id *)(a1 + 32), "_registerForLocaleChangeOnMainQueue");
  return objc_msgSend(*(id *)(a1 + 32), "_registerForOnboardingSuggestionOnMainQueueWithThresholdForShowingDigestOnboardingSuggestionToSeedUsers:thresholdForShowingDigestOnboardingSuggestion:", *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)_registerForOnboardingSuggestionOnMainQueueWithThresholdForShowingDigestOnboardingSuggestionToSeedUsers:(double)a3 thresholdForShowingDigestOnboardingSuggestion:(double)a4
{
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  int v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("probabilityOfShowingDigestOnboardingSuggestion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  __atxlog_handle_notification_management();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = a3;
    _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "Digest Onboarding Suggestion Threshold for seed user = %f", (uint8_t *)&v14, 0xCu);
  }

  __atxlog_handle_notification_management();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = a4;
    _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "Digest Onboarding Suggestion Threshold for GM = %f", (uint8_t *)&v14, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0D81588], "isBetaBuild"))
  {
    if (v9 >= a3)
    {
      __atxlog_handle_notification_management();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134217984;
        v15 = v9;
        v13 = "Not registering for digest onboarding suggestion for seed user since the random number %f assigned to devi"
              "ce is not less than threshold";
LABEL_13:
        _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
LABEL_10:
    -[ATXDigestOnboardingSuggestionClient _registerForTriggerOnMainQueueAtHour:minute:](self, "_registerForTriggerOnMainQueueAtHour:minute:", -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("digestOnboardingSuggestionHour")), -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("digestOnboardingSuggestionMinute")));
    return;
  }
  if (v9 < a4)
    goto LABEL_10;
  __atxlog_handle_notification_management();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = v9;
    v13 = "Not registering for digest onboarding suggestion since the random number %f assigned to device is not less than threshold";
    goto LABEL_13;
  }
LABEL_14:

}

- (void)_registerForTriggerOnMainQueueAtHour:(int64_t)a3 minute:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSTimer *v15;
  NSTimer *trigger;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 60, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hour") > a3)
  {
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 1, v7, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:", 28, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  objc_msgSend(v9, "setHour:", a3);
  objc_msgSend(v9, "setMinute:", a4);
  objc_msgSend(v8, "dateFromComponents:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_management();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v12;
    _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "ATXDigestOnboardingSuggestionClient: scheduling trigger for %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v14 = objc_alloc(MEMORY[0x1E0C99E88]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__ATXDigestOnboardingSuggestionClient__registerForTriggerOnMainQueueAtHour_minute___block_invoke;
  v18[3] = &unk_1E4D575B8;
  objc_copyWeak(&v19, (id *)buf);
  v15 = (NSTimer *)objc_msgSend(v14, "initWithFireDate:interval:repeats:block:", v12, 1, v18, 86400.0);
  trigger = self->_trigger;
  self->_trigger = v15;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTimer:forMode:", self->_trigger, *MEMORY[0x1E0C99748]);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

void __83__ATXDigestOnboardingSuggestionClient__registerForTriggerOnMainQueueAtHour_minute___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_suggestDigestOnboardingIfApplicableOnMainQueue");

}

- (void)_invalidateTriggerOnMainQueue
{
  NSTimer *trigger;

  trigger = self->_trigger;
  if (trigger)
  {
    if (-[NSTimer isValid](trigger, "isValid"))
      -[NSTimer invalidate](self->_trigger, "invalidate");
  }
}

- (void)unregisterForOnboardingSuggestions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ATXDigestOnboardingSuggestionClient_unregisterForOnboardingSuggestions__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __73__ATXDigestOnboardingSuggestionClient_unregisterForOnboardingSuggestions__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_unregisterForLocaleChangeOnMainQueue");
  objc_msgSend(*(id *)(a1 + 32), "_unregisterForKVOChangesOnMainQueue");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTriggerOnMainQueue");
}

- (void)_suggestDigestOnboardingIfApplicableOnMainQueue
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "%@: No observers registered", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_3();
}

void __86__ATXDigestOnboardingSuggestionClient__suggestDigestOnboardingIfApplicableOnMainQueue__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  +[ATXNotificationManagementMAConstants sharedInstance](ATXNotificationManagementMAConstants, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "digestOnboardingSuggestionMinimumActiveNotifications");
  v8 = objc_msgSend(v6, "digestOnboardingSuggestionMinimumUniqueBundleIds");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__ATXDigestOnboardingSuggestionClient__suggestDigestOnboardingIfApplicableOnMainQueue__block_invoke_2;
  v10[3] = &unk_1E4D575E0;
  v9 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v12 = a2;
  v13 = a3;
  v14 = v7;
  v15 = v8;
  v11 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

id __86__ATXDigestOnboardingSuggestionClient__suggestDigestOnboardingIfApplicableOnMainQueue__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_suggestDigestOnboardingIfApplicableOnMainQueueGivenNumberOfActiveNotifications:numberOfUniqueBundleIds:minActive:minUnique:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  return (id)objc_opt_self();
}

- (void)_suggestDigestOnboardingIfApplicableOnMainQueueGivenNumberOfActiveNotifications:(unint64_t)a3 numberOfUniqueBundleIds:(unint64_t)a4 minActive:(unint64_t)a5 minUnique:(unint64_t)a6
{
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  NSHashTable *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_notification_management();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v39 = v13;
    v40 = 2048;
    v41 = a3;
    v42 = 2048;
    v43 = a5;
    v44 = 2048;
    v45 = a4;
    v46 = 2048;
    v47 = a6;
    _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "%@: Active notifications: %ld (min: %ld); unique apps: %ld (min: %ld)",
      buf,
      0x34u);

  }
  __atxlog_handle_notification_management();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (a3 < a5 || a4 < a6)
  {
    if (v15)
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v22;
      _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "%@: We do not have the minimum active notifications and unique apps", buf, 0xCu);

    }
  }
  else
  {
    if (v15)
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v17;
      _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "%@: We have the minimum active notifications and unique apps", buf, 0xCu);

    }
    v14 = objc_opt_new();
    if (-[NSObject digestSetupComplete](v14, "digestSetupComplete"))
      -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 1, CFSTR("hasSetUpDigestBefore"));
    if (-[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("hasSetUpDigestBefore"))
      || -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("digestOnboardingSuggestionShown")))
    {
      __atxlog_handle_notification_management();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v20;
        _os_log_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_DEFAULT, "%@: Digest Onboarding has already been suggested", buf, 0xCu);

      }
    }
    else
    {
      __atxlog_handle_notification_management();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v25;
        _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEFAULT, "%@: Suggesting Digest Onboarding to client", buf, 0xCu);

      }
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v26 = self->_observers;
      v27 = -[NSHashTable countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v34;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v34 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v30);
            v32 = (void *)objc_opt_new();
            objc_msgSend(v31, "digestOnboardingSuggestionClient:didSuggestOnboarding:", self, v32, (_QWORD)v33);

            ++v30;
          }
          while (v28 != v30);
          v28 = -[NSHashTable countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v28);
      }

      -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 1, CFSTR("digestOnboardingSuggestionShown"));
      -[ATXDigestOnboardingSuggestionClient unregisterForOnboardingSuggestions](self, "unregisterForOnboardingSuggestions");
    }
  }

}

- (void)averageNumberOfNotifications:(id)a3
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
  v7[2] = __68__ATXDigestOnboardingSuggestionClient_averageNumberOfNotifications___block_invoke;
  v7[3] = &unk_1E4D57678;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __68__ATXDigestOnboardingSuggestionClient_averageNumberOfNotifications___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, -7, v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "notificationStreamPublisherForStartDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__ATXDigestOnboardingSuggestionClient_averageNumberOfNotifications___block_invoke_3;
  v13[3] = &unk_1E4D57650;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  v7 = (id)objc_msgSend(v5, "sinkWithCompletion:receiveInput:", &__block_literal_global_19, v13);
  v8 = v17[3];
  __atxlog_handle_notification_management();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v8 / 7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v10;
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "Average Number of notifications being sent to client = %lu", buf, 0xCu);
  }

  (*(void (**)(_QWORD, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10, v11, v12);
  _Block_object_dispose(&v16, 8);

}

void __68__ATXDigestOnboardingSuggestionClient_averageNumberOfNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(a2, "eventBody");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v10, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
    v9 = v8;

    if (v7 >= v9)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

- (BOOL)hasNotificationProblemForPreviousNumDays:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  char *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  NSObject *v28;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  int64_t v38;
  _QWORD v39[4];
  id v40;
  _BYTE *v41;
  uint8_t v42[4];
  const char *v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  uint64_t v47;
  _BYTE buf[24];
  char v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -a3, v6, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)objc_opt_new();
  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v32;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: Checking for notification problem from start date: %@", buf, 0x16u);
  }

  v8 = (void *)objc_opt_new();
  if (a3 >= 1)
  {
    v9 = a3;
    do
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v8, "addObject:", v10);

      --v9;
    }
    while (v9);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v49 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestOnboardingSuggestionClient notificationStreamPublisherForStartDate:](self, "notificationStreamPublisherForStartDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __80__ATXDigestOnboardingSuggestionClient_hasNotificationProblemForPreviousNumDays___block_invoke_2;
  v39[3] = &unk_1E4D576A0;
  v30 = v5;
  v40 = v30;
  v41 = buf;
  v14 = (id)objc_msgSend(v12, "sinkWithCompletion:shouldContinue:", &__block_literal_global_23, v39);

  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[ATXDigestOnboardingSuggestionClient notificationStreamPublisherForStartDate:](self, "notificationStreamPublisherForStartDate:", v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __80__ATXDigestOnboardingSuggestionClient_hasNotificationProblemForPreviousNumDays___block_invoke_2_28;
    v33[3] = &unk_1E4D576C8;
    v34 = v32;
    v35 = v30;
    v36 = v31;
    v38 = a3;
    v16 = v8;
    v37 = v16;
    v17 = (id)objc_msgSend(v15, "sinkWithCompletion:receiveInput:", &__block_literal_global_27, v33);

    v18 = 0;
    do
    {
      v19 = objc_msgSend(v16, "count");
      v20 = v18 >= v19;
      if (v18 >= v19)
        break;
      objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_notification_management();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (char *)(id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");
        *(_DWORD *)v42 = 138412802;
        v43 = v24;
        v44 = 2048;
        v45 = v18 + 1;
        v46 = 2048;
        v47 = v26;
        _os_log_impl(&dword_1A49EF000, v22, OS_LOG_TYPE_DEFAULT, "%@: Number of apps receving notifications on day %lu: %lu", v42, 0x20u);

      }
      v27 = (unint64_t)objc_msgSend(v21, "count") > 5;

      ++v18;
    }
    while (v27);

    v28 = v34;
  }
  else
  {
    __atxlog_handle_notification_management();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v42 = 136315138;
      v43 = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]";
      _os_log_impl(&dword_1A49EF000, v28, OS_LOG_TYPE_DEFAULT, "%s: Not suggesting digest onboarding because there likely isn't enough data in the notification database.", v42, 0xCu);
    }
    v20 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v20;
}

BOOL __80__ATXDigestOnboardingSuggestionClient_hasNotificationProblemForPreviousNumDays___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "absoluteTimestamp");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v5, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "day");
    if (v9 >= 0)
      v10 = v9;
    else
      v10 = -v9;
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315906;
      v17 = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]_block_invoke";
      v18 = 2048;
      v19 = v10;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "%s: First valid notification event in the stream occurred %ld days ago on %@ from %@", (uint8_t *)&v16, 0x2Au);

    }
    __atxlog_handle_notification_management();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10 > 0xE)
    {
      if (v14)
      {
        v16 = 136315138;
        v17 = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]_block_invoke";
        _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "%s: There's enough notification data on the device to show the digest onboarding suggestion.", (uint8_t *)&v16, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      if (v14)
      {
        v16 = 136315394;
        v17 = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]_block_invoke";
        v18 = 2048;
        v19 = 14;
        _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "%s: Not enough notification data to show digest onboarding suggestion since first valid notification event in the stream was less than %ld days old. This means we likely don't have enough data in the notification database to return a correct list of apps ranked by non-time-sensitive / non-message notification counts.", (uint8_t *)&v16, 0x16u);
      }

    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]_block_invoke_2";
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s: Event didn't have bundleId, continuing.", (uint8_t *)&v16, 0xCu);
    }
  }

  return v4 == 0;
}

void __80__ATXDigestOnboardingSuggestionClient_hasNotificationProblemForPreviousNumDays___block_invoke_2_28(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(a2, "eventBody");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v17, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
    v9 = v8;

    if (v7 >= v9)
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v17, "absoluteTimestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:toDate:options:", 16, v11, *(_QWORD *)(a1 + 48), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "day");
      if (v13 >= 0)
        v14 = v13;
      else
        v14 = -v13;
      if (v14 < *(_QWORD *)(a1 + 64))
      {
        objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bundleID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v16);

      }
    }
  }

}

- (id)notificationStreamPublisherForStartDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Usage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "atx_publisherFromStartDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXDigestOnboardingSuggestionClient _notificationStreamFilterBlock](self, "_notificationStreamFilterBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterWithIsIncluded:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_notificationStreamFilterBlock
{
  return &__block_literal_global_29;
}

uint64_t __69__ATXDigestOnboardingSuggestionClient__notificationStreamFilterBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;

  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      __atxlog_handle_notification_management();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __69__ATXDigestOnboardingSuggestionClient__notificationStreamFilterBlock__block_invoke_cold_1((uint64_t)v4, v6);

      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99768];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", v8, CFSTR("Encountered event in ATXDigestOnboardingSuggestionClient that was of unknown class. Expected BMNotificationUsage. Received: %@"), v10);

    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_unregisterForLocaleChangeOnMainQueue
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

}

- (void)_registerForLocaleChangeOnMainQueue
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleLocaleChange, *MEMORY[0x1E0C99720], 0);

}

- (void)_handleLocaleChange
{
  -[ATXDigestOnboardingSuggestionClient unregisterForOnboardingSuggestions](self, "unregisterForOnboardingSuggestions");
  -[ATXDigestOnboardingSuggestionClient registerForOnboardingSuggestions](self, "registerForOnboardingSuggestions");
}

- (void)_setProbabilityOfShowingDigestOnboardingToUser
{
  void *v3;
  double v4;
  NSObject *v5;
  NSUserDefaults *userDefaults;
  void *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("probabilityOfShowingDigestOnboardingSuggestion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0;
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = v4;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "Random number being assigned for digest onboarding suggestion = %f", (uint8_t *)&v8, 0xCu);
    }

    userDefaults = self->_userDefaults;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v7, CFSTR("probabilityOfShowingDigestOnboardingSuggestion"));

  }
}

+ (void)resetDigestOnboardingSuggestionsAtHour:(id)a3 minute:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v7 = (void *)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
  objc_msgSend(v7, "setBool:forKey:", 0, CFSTR("hasSetUpDigestBefore"));
  objc_msgSend(v7, "setBool:forKey:", 0, CFSTR("digestOnboardingSuggestionShown"));
  if (v8)
    objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v8, "integerValue"), CFSTR("digestOnboardingSuggestionHour"));
  if (v5)
    objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "integerValue"), CFSTR("digestOnboardingSuggestionMinute"));

}

+ (void)removeRandomizedSelectionForDigestOnboardingSuggestion
{
  id v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
  objc_msgSend(v3, "setObject:forKey:", &unk_1E4DC2DE0, CFSTR("probabilityOfShowingDigestOnboardingSuggestion"));
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "Removed randomized selection for digest onboarding suggestion", v5, 2u);
  }

}

+ (void)resetRandomizedSelectionForDigestOnboardingSuggestion
{
  id v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("probabilityOfShowingDigestOnboardingSuggestion"));
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "Resetting randomized selection for digest onboarding suggestion", v5, 2u);
  }

}

+ (void)changeNumPreviousDaysToCheckForNotificationProblemToNumDays:(unint64_t)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend(v4, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
  objc_msgSend(v5, "setInteger:forKey:", a3, CFSTR("numPreviousDaysToCheckForNotificationProblem"));
  __atxlog_handle_notification_management();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "Change number of previous days to check for notification problem to %lu", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_registerForKVOChangesOnMainQueue
{
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    if (!self->_hasRegisteredKVO)
    {
      -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_userDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("digestOnboardingSuggestionHour"), 0, 0);
      -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_userDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("digestOnboardingSuggestionMinute"), 0, 0);
      -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_userDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("probabilityOfShowingDigestOnboardingSuggestion"), 0, 0);
      self->_hasRegisteredKVO = 1;
    }
  }
}

- (void)_unregisterForKVOChangesOnMainQueue
{
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    if (self->_hasRegisteredKVO)
    {
      -[NSUserDefaults removeObserver:forKeyPath:context:](self->_userDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("digestOnboardingSuggestionHour"), 0);
      -[NSUserDefaults removeObserver:forKeyPath:context:](self->_userDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("digestOnboardingSuggestionMinute"), 0);
      -[NSUserDefaults removeObserver:forKeyPath:context:](self->_userDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("probabilityOfShowingDigestOnboardingSuggestion"), 0);
      self->_hasRegisteredKVO = 0;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD block[4];
  id v15;
  ATXDigestOnboardingSuggestionClient *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("digestOnboardingSuggestionHour")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("digestOnboardingSuggestionMinute")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("probabilityOfShowingDigestOnboardingSuggestion")))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E4D57258;
    v15 = v10;
    v16 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ATXDigestOnboardingSuggestionClient;
    -[ATXDigestOnboardingSuggestionClient observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("probabilityOfShowingDigestOnboardingSuggestion")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", CFSTR("probabilityOfShowingDigestOnboardingSuggestion"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      objc_msgSend(*(id *)(a1 + 40), "_setProbabilityOfShowingDigestOnboardingToUser");
    __atxlog_handle_notification_management();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = "registering for onboarding suggestions again, since the random number has been changed";
LABEL_8:
      _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = "registering for onboarding suggestions again, since the suggestion time has been changed";
      goto LABEL_8;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "_invalidateTriggerOnMainQueue");
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v5 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke_38;
  block[3] = &unk_1E4D57590;
  block[4] = v5;
  dispatch_async(v6, block);
}

void __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke_38(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD block[7];

  +[ATXNotificationManagementMAConstants sharedInstance](ATXNotificationManagementMAConstants, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thresholdForShowingDigestOnboardingSuggestionToSeedUsers");
  v4 = v3;
  objc_msgSend(v2, "thresholdForShowingDigestOnboardingSuggestion");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  block[3] = &unk_1E4D57710;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v4;
  block[6] = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForOnboardingSuggestionOnMainQueueWithThresholdForShowingDigestOnboardingSuggestionToSeedUsers:thresholdForShowingDigestOnboardingSuggestion:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)dealloc
{
  objc_super v3;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[ATXDigestOnboardingSuggestionClient _unregisterForKVOChangesOnMainQueue](self, "_unregisterForKVOChangesOnMainQueue");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__ATXDigestOnboardingSuggestionClient_dealloc__block_invoke;
    block[3] = &unk_1E4D57590;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
  v3.receiver = self;
  v3.super_class = (Class)ATXDigestOnboardingSuggestionClient;
  -[ATXDigestOnboardingSuggestionClient dealloc](&v3, sel_dealloc);
}

uint64_t __46__ATXDigestOnboardingSuggestionClient_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterForKVOChangesOnMainQueue");
}

- (void)clientDidRejectOnboardingSuggestion
{
  NSObject *v3;
  uint8_t v4[16];

  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "ATXDigestOnboardingSuggestionClient: client rejected onboarding suggestion", v4, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "resetDigestOnboardingSuggestionsAtHour:minute:", 0, 0);
  -[ATXDigestOnboardingSuggestionClient unregisterForOnboardingSuggestions](self, "unregisterForOnboardingSuggestions");
  -[ATXDigestOnboardingSuggestionClient registerForOnboardingSuggestions](self, "registerForOnboardingSuggestions");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A49EF000, log, OS_LOG_TYPE_DEBUG, "Creating ATXDigestOnboardingSuggestionClient", v1, 2u);
}

void __69__ATXDigestOnboardingSuggestionClient__notificationStreamFilterBlock__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Encountered event in ATXDigestOnboardingSuggestionClient that was of unknown class. Expected BMNotificationUsage. Received: %@", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_3();
}

@end
