@implementation ATXOnboardingStackWidgetCacheManager

- (ATXOnboardingStackWidgetCacheManager)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXOnboardingStackWidgetCacheManager *v7;

  objc_msgSend(MEMORY[0x1E0CF94D8], "onboardingStackWidgetCacheFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "App");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "InFocus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXOnboardingStackWidgetCacheManager initWithPath:appLaunchStream:max3PWidgetsToSerialize:](self, "initWithPath:appLaunchStream:max3PWidgetsToSerialize:", v3, v6, 100);

  return v7;
}

- (ATXOnboardingStackWidgetCacheManager)initWithPath:(id)a3 appLaunchStream:(id)a4 max3PWidgetsToSerialize:(unint64_t)a5
{
  id v8;
  id v9;
  ATXOnboardingStackWidgetCacheManager *v10;
  uint64_t v11;
  NSString *cachePath;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXOnboardingStackWidgetCacheManager;
  v10 = -[ATXOnboardingStackWidgetCacheManager init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    cachePath = v10->_cachePath;
    v10->_cachePath = (NSString *)v11;

    objc_storeStrong((id *)&v10->_appLaunchStream, a4);
    v10->_max3PWidgetsToSerialize = a5;
  }

  return v10;
}

- (id)updateCacheWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  ATXOnboardingStackWidgetCache *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  ATXOnboardingStackWidgetCache *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  id v33;
  uint8_t buf[16];

  v4 = a3;
  if (!objc_msgSend(v4, "didDefer"))
  {
    +[ATXWidgetDescriptorCache sharedInstance](ATXWidgetDescriptorCache, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject homeScreenDescriptors](v5, "homeScreenDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    -[ATXOnboardingStackWidgetCacheManager _mapDescriptorsToAppLaunchData:error:](self, "_mapDescriptorsToAppLaunchData:error:", v7, &v33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v33;
    if (v8)
    {
      if (!objc_msgSend(v4, "didDefer"))
      {
        v17 = (void *)MEMORY[0x1A85A4F90]();
        v18 = (void *)MEMORY[0x1E0CB37E8];
        v19 = (void *)objc_opt_new();
        objc_msgSend(v18, "numberWithBool:", objc_msgSend(v19, "hasiCloudFamily"));
        v10 = objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v17);
        if (objc_msgSend(v4, "didDefer"))
        {
          __atxlog_handle_home_screen();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_DEFAULT, "ATXOnboardingStackWidgetCacheManager: Activity was deferred after fetching iCloud family state, stopping early", buf, 2u);
          }
          v6 = 0;
          v21 = v9;
        }
        else
        {
          -[ATXOnboardingStackWidgetCacheManager _sortAndFilterOutLeastUsed3PWidgets:](self, "_sortAndFilterOutLeastUsed3PWidgets:", v8);
          v20 = objc_claimAutoreleasedReturnValue();
          v22 = [ATXOnboardingStackWidgetCache alloc];
          v23 = objc_opt_new();
          v6 = -[ATXOnboardingStackWidgetCache initWithAppLaunchDictionary:cacheUpdateDate:hasiCloudFamily:](v22, "initWithAppLaunchDictionary:cacheUpdateDate:hasiCloudFamily:", v20, v23, v10);

          v32 = v9;
          LOBYTE(v23) = -[ATXOnboardingStackWidgetCacheManager _writeOnboardingWidgetStackCache:withError:](self, "_writeOnboardingWidgetStackCache:withError:", v6, &v32);
          v21 = v32;

          if ((v23 & 1) == 0)
          {
            __atxlog_handle_home_screen();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              -[ATXOnboardingStackWidgetCacheManager updateCacheWithActivity:].cold.2((uint64_t)v21, v24, v25, v26, v27, v28, v29, v30);

          }
        }

        v9 = v21;
        goto LABEL_21;
      }
      __atxlog_handle_home_screen();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXOnboardingStackWidgetCacheManager: Activity was deferred after fetching app launch data, stopping early", buf, 2u);
      }
    }
    else
    {
      __atxlog_handle_home_screen();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXOnboardingStackWidgetCacheManager updateCacheWithActivity:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
    v6 = 0;
LABEL_21:

    goto LABEL_22;
  }
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXOnboardingStackWidgetCacheManager: Activity was deferred, stopping early", buf, 2u);
  }
  v6 = 0;
LABEL_22:

  return v6;
}

- (id)_sortAndFilterOutLeastUsed3PWidgets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t max3PWidgetsToSerialize;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXOnboardingStackWidgetCacheManager _splitDescriptorsIntoFirstPartyAndThirdParty:](self, "_splitDescriptorsIntoFirstPartyAndThirdParty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[ATXOnboardingStackWidgetCacheManager _sortWidgetsByDistinctDaysAppWasLaunched:withAppLaunchDictionary:](self, "_sortWidgetsByDistinctDaysAppWasLaunched:withAppLaunchDictionary:", v8, v4);
  v9 = objc_msgSend(v8, "count");
  max3PWidgetsToSerialize = self->_max3PWidgetsToSerialize;
  if (v9 > max3PWidgetsToSerialize)
    objc_msgSend(v8, "removeObjectsInRange:", max3PWidgetsToSerialize, objc_msgSend(v8, "count") - self->_max3PWidgetsToSerialize);
  v11 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v6, "first");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v14);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = v8;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v4, "objectForKeyedSubscript:", v24, (_QWORD)v27);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v21);
  }

  return v11;
}

- (void)_sortWidgetsByDistinctDaysAppWasLaunched:(id)a3 withAppLaunchDictionary:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __105__ATXOnboardingStackWidgetCacheManager__sortWidgetsByDistinctDaysAppWasLaunched_withAppLaunchDictionary___block_invoke;
  v7[3] = &unk_1E4D57070;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "sortWithOptions:usingComparator:", 16, v7);

}

uint64_t __105__ATXOnboardingStackWidgetCacheManager__sortWidgetsByDistinctDaysAppWasLaunched_withAppLaunchDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)(unint64_t)objc_msgSend(v7, "uniqueDaysLaunched");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (double)(unint64_t)objc_msgSend(v9, "uniqueDaysLaunched");
  v11 = -1;
  if (v8 <= v10)
    v11 = 1;
  if (v8 == v10)
    return 0;
  else
    return v11;
}

- (id)_splitDescriptorsIntoFirstPartyAndThirdParty:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "extensionBundleIdentifier", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12 || (v14 = objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple.")), v15 = v4, (v14 & 1) == 0))
          v15 = v5;
        objc_msgSend(v15, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v4, v5);
  return v16;
}

- (id)_mapDescriptorsToAppLaunchData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  ATXAppLaunches *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "_pas_mappedSetWithTransform:", &__block_literal_global);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAppLaunches initWithStream:]([ATXAppLaunches alloc], "initWithStream:", self->_appLaunchStream);
  -[ATXAppLaunches rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:](v7, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "extensionIdentity", (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "containerBundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v15);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  return v9;
}

id __77__ATXOnboardingStackWidgetCacheManager__mapDescriptorsToAppLaunchData_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "extensionIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_stackCache
{
  id v3;
  NSString *cachePath;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CF94C0]);
  cachePath = self->_cachePath;
  __atxlog_handle_home_screen();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCacheFilePath:loggingHandle:debugName:", cachePath, v5, CFSTR("onboarding widget stacks"));

  return v6;
}

- (BOOL)_writeOnboardingWidgetStackCache:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[ATXOnboardingStackWidgetCacheManager _stackCache](self, "_stackCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "storeSecureCodedObject:error:", v6, a4);

  return (char)a4;
}

- (id)fetchOnboardingStackWidgetCacheWithError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[ATXOnboardingStackWidgetCacheManager _stackCache](self, "_stackCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v8, a3, -1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchStream, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
}

- (void)updateCacheWithActivity:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "ATXOnboardingStackWidgetCacheManager: Unable to map descriptors to app launch data with error: %@", a5, a6, a7, a8, 2u);
}

- (void)updateCacheWithActivity:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "ATXOnboardingStackWidgetCacheManager: Unable to write onboarding widget stack cache with error: %{public}@", a5, a6, a7, a8, 2u);
}

@end
