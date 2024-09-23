@implementation ATXAppPanelLaunchRatioLogger

+ (void)logNonAppPanelAppLaunchFromDock
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (id)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(a1, "logNonAppPanelAppLaunchFromDockWithUserDefaults:", v4);

}

+ (void)logNonAppPanelAppLaunchWithSBPageIndex:(unint64_t)a3
{
  id v5;
  id v6;

  v5 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v6 = (id)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(a1, "logNonAppPanelAppLaunchWithSBPageIndex:userDefaults:", a3, v6);

}

+ (void)logAppPanelAppLaunchWithSBPageIndex:(unint64_t)a3
{
  id v5;
  id v6;

  v5 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v6 = (id)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(a1, "logAppPanelAppLaunchWithSBPageIndex:userDefaults:", a3, v6);

}

+ (void)logCountedAppLaunchesToEventTracker
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend(v4, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(a1, "logCountedAppLaunchesToEventTracker:homeScreenConfigCache:userDefaults:", v6, v3, v5);

}

+ (void)logNonAppPanelAppLaunchFromDockWithUserDefaults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(a1, "_getOrCreateDataDictionaryFromDefaults:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("dockLaunches"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue") + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &unk_1E4DC1BF0;
  }
  __atxlog_handle_metrics();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ATXAppPanelLaunchRatioLogger logNonAppPanelAppLaunchFromDockWithUserDefaults:].cold.1();

  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("dockLaunches"));
  objc_msgSend(a1, "_writeDataDictionaryToDefaults:dataDictionary:", v4, v5);

}

+ (void)logNonAppPanelAppLaunchWithSBPageIndex:(unint64_t)a3 userDefaults:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_getOrCreateDataDictionaryFromDefaults:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (!v11)
    v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "objectForKey:", CFSTR("staticAppLaunches"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
  if (v12)
  {
    v14 = (void *)objc_msgSend(v13, "initWithUnsignedInteger:", objc_msgSend(v12, "unsignedIntegerValue") + 1);

  }
  else
  {
    v14 = (void *)objc_msgSend(v13, "initWithUnsignedInteger:", 1);
  }
  __atxlog_handle_metrics();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v18;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v7;
    _os_log_debug_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEBUG, "%@ - ATXMPBHomeScreenAppPanelLaunchRatioTracker has new static app launch count of %@ with pageIndex: %@", (uint8_t *)&v19, 0x20u);

  }
  objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("staticAppLaunches"));
  objc_msgSend(v7, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, v16);

  objc_msgSend(a1, "_writeDataDictionaryToDefaults:dataDictionary:", v6, v8);
}

+ (void)logAppPanelAppLaunchWithSBPageIndex:(unint64_t)a3 userDefaults:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_getOrCreateDataDictionaryFromDefaults:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (!v11)
    v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "objectForKey:", CFSTR("appPanelLaunches"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
  if (v12)
  {
    v14 = (void *)objc_msgSend(v13, "initWithUnsignedInteger:", objc_msgSend(v12, "unsignedIntegerValue") + 1);

  }
  else
  {
    v14 = (void *)objc_msgSend(v13, "initWithUnsignedInteger:", 1);
  }
  __atxlog_handle_metrics();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v18;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v7;
    _os_log_debug_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEBUG, "%@ - ATXMPBHomeScreenAppPanelLaunchRatioTracker has new panel app launch count of %@ with pageIndex: %@", (uint8_t *)&v19, 0x20u);

  }
  objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("appPanelLaunches"));
  objc_msgSend(v7, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, v16);

  objc_msgSend(a1, "_writeDataDictionaryToDefaults:dataDictionary:", v6, v8);
}

+ (void)logCountedAppLaunchesToEventTracker:(id)a3 homeScreenConfigCache:(id)a4 userDefaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_getOrCreateDataDictionaryFromDefaults:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v9, "loadDockAppListWithError:", &v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v30;
  v14 = v13;
  if (v12 && !v13)
  {
    v29 = 0;
    objc_msgSend(v9, "loadHomeScreenPageConfigurationsWithError:", &v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v29;
    v14 = v16;
    if (v15 && !v16)
    {
      v23 = v15;
      v24 = v10;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v26 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(a1, "logCountedAppLaunchesToEventTracker:homeScreenPage:dataDictionary:", v8, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), v11, v23);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v19);
      }

      objc_msgSend(a1, "logCountedDockLaunchesToEventTracker:dockAppList:dataDictionary:", v8, v12, v11);
      v22 = (void *)objc_opt_new();
      v10 = v24;
      objc_msgSend(a1, "_writeDataDictionaryToDefaults:dataDictionary:", v24, v22);

      v15 = v23;
    }

  }
}

+ (void)logCountedDockLaunchesToEventTracker:(id)a3 dockAppList:(id)a4 dataDictionary:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v8 = a4;
  objc_msgSend(a5, "objectForKey:", CFSTR("dockLaunches"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "unsignedIntegerValue");
    if (v11)
    {
      v12 = v11;
      if (objc_msgSend(v8, "count"))
        objc_msgSend(a1, "_logRatioMetricToTracker:location:ratioType:numAppLaunches:numAppsShown:", v13, 6, 4, v12, objc_msgSend(v8, "count"));
    }
  }

}

+ (void)logCountedAppLaunchesToEventTracker:(id)a3 homeScreenPage:(id)a4 dataDictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "pageIndex");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v11);
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("appPanelLaunches"));
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("staticAppLaunches"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v15;
    if (v15)
      v15 = (char *)objc_msgSend(v15, "unsignedIntegerValue", v15);
    if (v16)
      v17 = objc_msgSend(v16, "unsignedIntegerValue");
    else
      v17 = 0;
    if (&v15[v17])
    {
      v22 = v8;
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 0;
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0;
      objc_msgSend(v9, "leafIcons");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __98__ATXAppPanelLaunchRatioLogger_logCountedAppLaunchesToEventTracker_homeScreenPage_dataDictionary___block_invoke;
      v23[3] = &unk_1E4D5D128;
      v23[4] = &v28;
      v23[5] = &v24;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v23);

      objc_msgSend(a1, "_logRatioMetricToTracker:location:ratioType:numAppLaunches:numAppsShown:", v22, objc_msgSend(a1, "_homeScreenLocationFromPageIndex:", v11), 1, v15, 8);
      v19 = objc_msgSend(a1, "_homeScreenLocationFromPageIndex:", v11);
      objc_msgSend(a1, "_logRatioMetricToTracker:location:ratioType:numAppLaunches:numAppsShown:", v22, v19, 2, v17, v29[3]);
      v20 = objc_msgSend(a1, "_homeScreenLocationFromPageIndex:", v11);
      objc_msgSend(a1, "_logRatioMetricToTracker:location:ratioType:numAppLaunches:numAppsShown:", v22, v20, 3, v17, v25[3]);
      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(&v28, 8);
      v8 = v22;
    }

  }
}

void __98__ATXAppPanelLaunchRatioLogger_logCountedAppLaunchesToEventTracker_homeScreenPage_dataDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __98__ATXAppPanelLaunchRatioLogger_logCountedAppLaunchesToEventTracker_homeScreenPage_dataDictionary___block_invoke_2;
    v4[3] = &unk_1E4D5D100;
    v4[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "enumerateApps:", v4);
  }

}

uint64_t __98__ATXAppPanelLaunchRatioLogger_logCountedAppLaunchesToEventTracker_homeScreenPage_dataDictionary___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

+ (void)_logRatioMetricToTracker:(id)a3 location:(int)a4 ratioType:(int)a5 numAppLaunches:(unint64_t)a6 numAppsShown:(unint64_t)a7
{
  uint64_t v9;
  uint64_t v10;
  double v11;
  id v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  id v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a7)
  {
    v9 = *(_QWORD *)&a5;
    v10 = *(_QWORD *)&a4;
    v11 = (double)a6 / (double)a7;
    v12 = a3;
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setLocation:", v10);
    objc_msgSend(v13, "setRatioType:", v9);
    objc_msgSend(v12, "trackDistributionForMessage:value:", v13, v11);

    __atxlog_handle_metrics();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v13, "location");
      if ((v17 - 1) >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = off_1E4D5D148[(int)v17 - 1];
      }
      v19 = v18;
      v20 = objc_msgSend(v13, "ratioType");
      if ((v20 - 1) >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_1E4D5D178[(int)v20 - 1];
      }
      *(_DWORD *)buf = 138413570;
      v23 = v16;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v21;
      v28 = 2048;
      v29 = v11;
      v30 = 2048;
      v31 = a6;
      v32 = 2048;
      v33 = a7;
      _os_log_debug_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBHomeScreenAppPanelLaunchRatioTracker with location %@ ratioType %@ launchRatio %f numAppLaunches %lu numAppsShown %lu", buf, 0x3Eu);

    }
  }
}

+ (int)_homeScreenLocationFromPageIndex:(unint64_t)a3
{
  if (a3 < 4)
    return a3 + 1;
  else
    return 5;
}

+ (id)_getOrCreateDataDictionaryFromDefaults:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("ATXAppPanelLaunchRatioLoggerDataDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "mutableCopy");
  else
    v4 = objc_opt_new();
  v5 = (void *)v4;
  __atxlog_handle_metrics();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[ATXAppPanelLaunchRatioLogger _getOrCreateDataDictionaryFromDefaults:].cold.1();

  return v5;
}

+ (void)_writeDataDictionaryToDefaults:(id)a3 dataDictionary:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a4;
  v6 = a3;
  __atxlog_handle_metrics();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[ATXAppPanelLaunchRatioLogger _writeDataDictionaryToDefaults:dataDictionary:].cold.1();

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("ATXAppPanelLaunchRatioLoggerDataDictionary"));
}

+ (void)logNonAppPanelAppLaunchFromDockWithUserDefaults:.cold.1()
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

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_7(&dword_1A49EF000, v2, v3, "%@ - ATXMPBHomeScreenAppPanelLaunchRatioTracker has new dock launch count of %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

+ (void)_getOrCreateDataDictionaryFromDefaults:.cold.1()
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

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_7(&dword_1A49EF000, v2, v3, "%@ - ATXMPBHomeScreenAppPanelLaunchRatioTracker read dict %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

+ (void)_writeDataDictionaryToDefaults:dataDictionary:.cold.1()
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

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_7(&dword_1A49EF000, v2, v3, "%@ - ATXMPBHomeScreenAppPanelLaunchRatioTracker saving dict %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

@end
