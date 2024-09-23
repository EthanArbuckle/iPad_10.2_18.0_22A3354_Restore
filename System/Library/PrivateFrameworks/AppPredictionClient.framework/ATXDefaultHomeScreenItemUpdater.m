@implementation ATXDefaultHomeScreenItemUpdater

- (ATXDefaultHomeScreenItemUpdater)initWithSpotlightAppLaunchHistogram:(id)a3
{
  id v5;
  ATXDefaultHomeScreenItemUpdater *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  id v10;
  uint64_t v11;
  NSUserDefaults *userDefaults;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXDefaultHomeScreenItemUpdater;
  v6 = -[ATXDefaultHomeScreenItemUpdater init](&v14, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("ATXDefaultHomeScreenItemUpdater", v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_spotlightAppLaunchHistogram, a3);
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      v10 = objc_alloc(MEMORY[0x1E0C99EA0]);
      v11 = objc_msgSend(v10, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
      userDefaults = v6->_userDefaults;
      v6->_userDefaults = (NSUserDefaults *)v11;

      -[NSUserDefaults addObserver:forKeyPath:options:context:](v6->_userDefaults, "addObserver:forKeyPath:options:context:", v6, CFSTR("ATXWidgetsForceDayZeroAddSheet"), 0, 0);
    }
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, CFSTR("ATXWidgetsForceDayZeroAddSheet"));
  v3.receiver = self;
  v3.super_class = (Class)ATXDefaultHomeScreenItemUpdater;
  -[ATXDefaultHomeScreenItemUpdater dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("ATXWidgetsForceDayZeroAddSheet")))
  {
    __atxlog_handle_home_screen();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: force day zero add sheet toggled, refreshing suggestions", buf, 2u);
    }

    -[ATXDefaultHomeScreenItemUpdater updateDefaultsDueToRelevantHomeScreenConfigUpdate](self, "updateDefaultsDueToRelevantHomeScreenConfigUpdate");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ATXDefaultHomeScreenItemUpdater;
    -[ATXDefaultHomeScreenItemUpdater observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

+ (NSDictionary)assets
{
  return (NSDictionary *)+[ATXAssets2 dictionaryForClass:](ATXAssets2, "dictionaryForClass:", objc_opt_class());
}

- (void)updateDefaultsIfNeededWithSystemDescriptors:(id)a3 installDatesCache:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[ATXDefaultHomeScreenItemUpdater _retrieveLastUpdateDate](self, "_retrieveLastUpdateDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 16, -1, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11
      || (objc_msgSend(v14, "earlierDate:", v11),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v15 == v11))
    {
      -[ATXDefaultHomeScreenItemUpdater updateDefaultsWithSystemDescriptors:installDatesCache:reason:](self, "updateDefaultsWithSystemDescriptors:installDatesCache:reason:", v8, v9, v10);
    }
    else
    {
      __atxlog_handle_home_screen();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v11;
        _os_log_impl(&dword_1A49EF000, v16, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: Not updating stack and widget suggestions because last update was recent (%@)", (uint8_t *)&v17, 0xCu);
      }

    }
  }

}

- (void)updateDefaultsWithSystemDescriptors:(id)a3 installDatesCache:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *internalQueue;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: Updating default stack and widget suggestions", buf, 2u);
    }

    internalQueue = self->_internalQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __96__ATXDefaultHomeScreenItemUpdater_updateDefaultsWithSystemDescriptors_installDatesCache_reason___block_invoke;
    v13[3] = &unk_1E4D5A2A0;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    dispatch_async(internalQueue, v13);

  }
}

uint64_t __96__ATXDefaultHomeScreenItemUpdater_updateDefaultsWithSystemDescriptors_installDatesCache_reason___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_updateAllDefaultsOnQueueWithReason:", *(_QWORD *)(a1 + 56));
}

- (void)updateDefaultsDueToRelevantHomeScreenConfigUpdate
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ATXDefaultHomeScreenItemUpdater_updateDefaultsDueToRelevantHomeScreenConfigUpdate__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __84__ATXDefaultHomeScreenItemUpdater_updateDefaultsDueToRelevantHomeScreenConfigUpdate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    __atxlog_handle_home_screen();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: updating defaults due to relevant home screen config update", v5, 2u);
    }

    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_updateHomeScreenDefaultsOnQueueWithReason:appLaunchCounts:", CFSTR("Home Screen config update"), v4);
  }
}

- (void)updateDefaultsDueToAmbientConfigUpdate
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ATXDefaultHomeScreenItemUpdater_updateDefaultsDueToAmbientConfigUpdate__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __73__ATXDefaultHomeScreenItemUpdater_updateDefaultsDueToAmbientConfigUpdate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    __atxlog_handle_home_screen();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: updating defaults due to ambient config update", v5, 2u);
    }

    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_updateAmbientDefaultsOnQueueWithReason:appLaunchCounts:", CFSTR("Ambient config update"), v4);
  }
}

- (void)waitForPendingAsynchronousOperations
{
  dispatch_sync((dispatch_queue_t)self->_internalQueue, &__block_literal_global_59);
}

- (void)_updateAllDefaultsOnQueueWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: updating defaults with reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (-[NSSet count](self->_descriptors, "count"))
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXDefaultHomeScreenItemUpdater _updateHomeScreenDefaultsOnQueueWithReason:appLaunchCounts:](self, "_updateHomeScreenDefaultsOnQueueWithReason:appLaunchCounts:", v4, v7);
    -[ATXDefaultHomeScreenItemUpdater _updateAmbientDefaultsOnQueueWithReason:appLaunchCounts:](self, "_updateAmbientDefaultsOnQueueWithReason:appLaunchCounts:", v4, v7);

  }
}

- (void)_updateHomeScreenDefaultsOnQueueWithReason:(id)a3 appLaunchCounts:(id)a4
{
  id v5;
  void *v6;
  ATXHomeScreenConfigCache *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  ATXDefaultHomeScreenItemProducer *v13;
  NSSet *descriptors;
  NSDictionary *descriptorInstallDates;
  _BOOL8 v16;
  ATXDefaultHomeScreenItemProducer *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)os_transaction_create();
  v7 = objc_alloc_init(ATXHomeScreenConfigCache);
  v23 = 0;
  -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsWithError:](v7, "loadHomeScreenPageConfigurationsWithError:", &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  if (v9)
  {
    __atxlog_handle_home_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[ATXDefaultHomeScreenItemUpdater _updateHomeScreenDefaultsOnQueueWithReason:appLaunchCounts:]";
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: %s error fetching home screen config: %@", buf, 0x16u);
    }

  }
  v13 = [ATXDefaultHomeScreenItemProducer alloc];
  descriptors = self->_descriptors;
  descriptorInstallDates = self->_descriptorInstallDates;
  v16 = -[ATXDefaultHomeScreenItemUpdater _isDayZeroExperience](self, "_isDayZeroExperience");
  v17 = -[ATXDefaultHomeScreenItemProducer initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:appLaunchCounts:](v13, "initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:appLaunchCounts:", descriptors, descriptorInstallDates, v11, v16, objc_msgSend(MEMORY[0x1E0D81588], "isiPad"), self->_spotlightAppLaunchHistogram, v5);

  -[ATXDefaultHomeScreenItemProducer update](v17, "update");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemManager sharedInstance](ATXDefaultHomeScreenItemManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __94__ATXDefaultHomeScreenItemUpdater__updateHomeScreenDefaultsOnQueueWithReason_appLaunchCounts___block_invoke;
  v21[3] = &unk_1E4D59210;
  v22 = v6;
  v20 = v6;
  objc_msgSend(v19, "writeHomeScreenUpdate:completionHandler:", v18, v21);

}

void __94__ATXDefaultHomeScreenItemUpdater__updateHomeScreenDefaultsOnQueueWithReason_appLaunchCounts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v2 = a2;
  if (v2)
  {
    __atxlog_handle_home_screen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __94__ATXDefaultHomeScreenItemUpdater__updateHomeScreenDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v3 = objc_msgSend(v10, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v3, "setObject:forKey:", v11, CFSTR("AddWidgetSuggestionsLastUpdateDate"));

  }
  __atxlog_handle_home_screen();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: Finished updating home screen default stack and widget suggestions", v13, 2u);
  }

}

- (void)_updateAmbientDefaultsOnQueueWithReason:(id)a3 appLaunchCounts:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a4;
  v6 = (void *)os_transaction_create();
  v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke;
  v10[3] = &unk_1E4D5A978;
  v10[4] = self;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "readStacksWithCompletion:", v10);

}

void __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2;
  block[3] = &unk_1E4D5A950;
  block[1] = 3221225472;
  v13 = v6;
  v14 = v5;
  v15 = v7;
  v16 = v8;
  v17 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, block);

}

void __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  ATXDefaultHomeScreenItemProducer *v13;
  ATXDefaultHomeScreenItemProducer *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    __atxlog_handle_home_screen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 40), "_pas_mappedArrayWithTransform:", &__block_literal_global_37_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStacks:", v11);

  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [ATXDefaultHomeScreenItemProducer alloc];
  v14 = -[ATXDefaultHomeScreenItemProducer initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:appLaunchCounts:](v13, "initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:appLaunchCounts:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24), v12, 0, objc_msgSend(MEMORY[0x1E0D81588], "isiPad"), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40), *(_QWORD *)(a1 + 56));
  -[ATXDefaultHomeScreenItemProducer update](v14, "update");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemManager sharedInstance](ATXDefaultHomeScreenItemManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_38;
  v17[3] = &unk_1E4D59210;
  v18 = *(id *)(a1 + 64);
  objc_msgSend(v16, "writeAmbientUpdate:completionHandler:", v15, v17);

}

id __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_35(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "widgets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_74);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWidgets:", v5);

  return v3;
}

void __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_38(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v2 = a2;
  if (v2)
  {
    __atxlog_handle_home_screen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_38_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
  __atxlog_handle_home_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: Finished updating ambient default stack and widget suggestions", v11, 2u);
  }

}

- (BOOL)_isDayZeroExperience
{
  NSObject *v3;
  BOOL v4;
  void *v5;
  double v6;
  uint8_t v8[16];

  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild")
    && -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("ATXWidgetsForceDayZeroAddSheet")))
  {
    __atxlog_handle_home_screen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: on day zero path because of user default to force day zero preference", v8, 2u);
    }

    return 1;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "uniqueAppsLaunchedOverLast28Days");
    v4 = v6 < 15.0;

  }
  return v4;
}

- (id)_retrieveLastUpdateDate
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "objectForKey:", CFSTR("AddWidgetSuggestionsLastUpdateDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightAppLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_descriptorInstallDates, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __94__ATXDefaultHomeScreenItemUpdater__updateHomeScreenDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "ATXDefaultHomeScreenItemUpdater: Error writing home screen defaults to file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "ATXDefaultHomeScreenItemUpdater: Error reading ambient config stacks: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_38_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "ATXDefaultHomeScreenItemUpdater: Error writing ambient defaults to file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
