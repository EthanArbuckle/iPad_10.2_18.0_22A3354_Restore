@implementation IRAnalyticsManager

+ (BOOL)logUiEvent:(id)a3 withService:(id)a4 forCandidateIdentifier:(id)a5 systemStateManager:(id)a6 candidatesContainer:(id)a7 inspections:(id)a8 statisticsManager:(id)a9 historyEventsContainer:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  char v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  NSObject *log;
  os_log_t loga;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v15 = a4;
  v41 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  objc_msgSend(v15, "clientIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a8) = +[IRAnalyticsManager _isClientAllowedCA:](IRAnalyticsManager, "_isClientAllowedCA:", v21);

  if ((a8 & 1) != 0)
  {
    IRCreateServicePackageAdapter(objc_msgSend(v15, "servicePackage"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();
    if ((v23 & 1) != 0)
    {
      v24 = (void *)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
      {
        log = v24;
        objc_msgSend(v15, "serviceIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "clientIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v38;
        v45 = 2112;
        v46 = v37;
        _os_log_impl(&dword_23FFBA000, log, OS_LOG_TYPE_DEFAULT, "#analytics, Starting ui event analytics for service: %@, client: %@", buf, 0x16u);

      }
      -[NSObject uiAnalyticsWithEvent:forCandidateIdentifier:systemStateManager:candidatesContainer:inspections:statisticsManager:service:historyEventsContainer:](v22, "uiAnalyticsWithEvent:forCandidateIdentifier:systemStateManager:candidatesContainer:inspections:statisticsManager:service:historyEventsContainer:", v42, v41, v16, v17, v18, v19, v15, v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clientIdentifier");
      loga = v22;
      v26 = v20;
      v27 = v19;
      v28 = v18;
      v29 = v17;
      v30 = v16;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[IRAnalyticsManager sendEventLazyForEventIdentifier:clientIdentifier:analytics:](IRAnalyticsManager, "sendEventLazyForEventIdentifier:clientIdentifier:analytics:", CFSTR("com.apple.com.apple.intelligentroutingd.CoreAnalyticsUiEvent"), v31, v25);

      v16 = v30;
      v17 = v29;
      v18 = v28;
      v19 = v27;
      v20 = v26;
      v22 = loga;

    }
  }
  else
  {
    v32 = (void *)*MEMORY[0x24BE5B270];
    v23 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      objc_msgSend(v15, "serviceIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clientIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v34;
      v45 = 2112;
      v46 = v35;
      _os_log_impl(&dword_23FFBA000, v33, OS_LOG_TYPE_DEFAULT, "#analytics, Skipping ui event analytics for service: %@, client: %@", buf, 0x16u);

      v23 = 0;
    }
  }

  return v23 & 1;
}

+ (void)sendEventLazyForEventIdentifier:(id)a3 clientIdentifier:(id)a4 analytics:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_23FFBA000, v10, OS_LOG_TYPE_DEFAULT, "#analytics, [%@]:[%@]: Preparing to submit analytics: %@", buf, 0x20u);
  }
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  AnalyticsSendEventLazy();

}

id __81__IRAnalyticsManager_sendEventLazyForEventIdentifier_clientIdentifier_analytics___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_23FFBA000, v2, OS_LOG_TYPE_DEFAULT, "#analytics, [%@]:[%@]: Submitting analytics: %@", (uint8_t *)&v7, 0x20u);
  }
  return *(id *)(a1 + 48);
}

+ (BOOL)_isClientAllowedCA:(id)a3
{
  return objc_msgSend(&unk_25105EF78, "containsObject:", a3);
}

- (IRAnalyticsManager)initWithBackgroundActivitiesManager:(id)a3
{
  id v4;
  IRAnalyticsManager *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  IRAnalyticsManager *v9;
  _QWORD v11[4];
  IRAnalyticsManager *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IRAnalyticsManager;
  v5 = -[IRAnalyticsManager init](&v13, sel_init);
  if (v5)
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coreAnalyticsXPCActivityInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "longLongValue");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__IRAnalyticsManager_initWithBackgroundActivitiesManager___block_invoke;
    v11[3] = &unk_251044310;
    v9 = v5;
    v12 = v9;
    objc_msgSend(v4, "registerForRepeatingBackgroundXPCActivityWithIdentifier:interval:isDiskIntensive:isMemoryIntensive:handler:", CFSTR("com.apple.intelligentroutingd.CoreAnalyticsXPCActivityIdentifier"), v8, 1, 1, v11);

    -[IRAnalyticsManager setBackgroundActivitiesManager:](v9, "setBackgroundActivitiesManager:", v4);
  }

  return v5;
}

uint64_t __58__IRAnalyticsManager_initWithBackgroundActivitiesManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCoreAnalyticsXPCActivity");
}

- (void)_handleCoreAnalyticsXPCActivity
{
  void *v2;
  id v3;

  -[IRAnalyticsManager backgroundActivitiesManager](self, "backgroundActivitiesManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performXPCActivityUnderServerContext:", &__block_literal_global_22);

}

void __53__IRAnalyticsManager__handleCoreAnalyticsXPCActivity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  os_log_t *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  +[IRPreferences shared](IRPreferences, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coreAnalyticsEnable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)os_transaction_create();
    v10 = (os_log_t *)MEMORY[0x24BE5B270];
    v11 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_DEFAULT, "#analytics, Handling weekly analytics", buf, 2u);
    }
    if ((objc_msgSend(v4, "connectToStore") & 1) != 0)
    {
      +[IRServiceStore fetchAllServicesWithPersistenceManager:](IRServiceStore, "fetchAllServicesWithPersistenceManager:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        +[IRPreferences shared](IRPreferences, "shared");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "coreAnalyticsWeeklyMobileAssetVersion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        +[IRPreferences shared](IRPreferences, "shared");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mobileAssetVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v16 || (objc_msgSend(v14, "isEqual:", v16) & 1) != 0)
        {
          v17 = 1;
        }
        else
        {
          v21 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v14;
            v29 = 2112;
            v30 = v16;
            _os_log_impl(&dword_23FFBA000, v21, OS_LOG_TYPE_DEFAULT, "#analytics, Skipping weekly analytics due to mobile asset versioning missmatch: prev: %@, new: %@", buf, 0x16u);
          }
          +[IRPreferences shared](IRPreferences, "shared");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "updateAndNotifyKey:withObject:", CFSTR("coreAnalyticsWeeklyMobileAssetVersion"), v16);

          v17 = 0;
        }
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __53__IRAnalyticsManager__handleCoreAnalyticsXPCActivity__block_invoke_25;
        v23[3] = &unk_2510457F8;
        v24 = v4;
        v25 = v5;
        v26 = v17;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v23);

      }
      else
      {
        v20 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23FFBA000, v20, OS_LOG_TYPE_DEFAULT, "#analytics, 0 services found during weekly analytics", buf, 2u);
        }
      }

    }
    else
    {
      v19 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        __53__IRAnalyticsManager__handleCoreAnalyticsXPCActivity__block_invoke_cold_1(v19);
    }

  }
  else
  {
    v18 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23FFBA000, v18, OS_LOG_TYPE_DEFAULT, "#analytics, Weekly analytics disabled", buf, 2u);
    }
  }

}

void __53__IRAnalyticsManager__handleCoreAnalyticsXPCActivity__block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  IRServiceStore *v11;
  uint64_t v12;
  void *v13;
  IRServiceStore *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  IRCreateServicePackageAdapter(objc_msgSend(v3, "servicePackage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[IRAnalyticsManager _isClientAllowedCA:](IRAnalyticsManager, "_isClientAllowedCA:", v5))
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = (void *)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        objc_msgSend(v3, "serviceIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "clientIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v9;
        v29 = 2112;
        v30 = v10;
        _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_DEFAULT, "#analytics, Starting weekly analytics for service: %@, client: %@", buf, 0x16u);

      }
      v11 = [IRServiceStore alloc];
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "serviceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:](v11, "initWithPersistenceManager:serviceIdentifier:", v12, v13);

      v15 = *(void **)(a1 + 40);
      objc_msgSend(v3, "serviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "getStatistics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "clearStatistics");
      }
      else
      {
        -[IRServiceStore fetchStatistics](v14, "fetchStatistics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[IRStatisticsDO statisticsDOWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:](IRStatisticsDO, "statisticsDOWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRServiceStore updateStatistics:](v14, "updateStatistics:", v24);

      }
      if (*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(v4, "weeklyAnalyticsWithServiceStore:statistics:service:", v14, v18, v3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "clientIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[IRAnalyticsManager sendEventLazyForEventIdentifier:clientIdentifier:analytics:](IRAnalyticsManager, "sendEventLazyForEventIdentifier:clientIdentifier:analytics:", CFSTR("com.apple.intelligentroutingd.CoreAnalyticsWeekly"), v26, v25);

      }
      goto LABEL_14;
    }
  }
  else
  {

  }
  v19 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    objc_msgSend(v3, "serviceIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v21;
    v29 = 2112;
    v30 = v22;
    _os_log_impl(&dword_23FFBA000, v20, OS_LOG_TYPE_DEFAULT, "#analytics, Skipping weekly analytics for service: %@, client: %@", buf, 0x16u);

  }
LABEL_14:

}

- (IRBackgroundActivitiesManager)backgroundActivitiesManager
{
  return (IRBackgroundActivitiesManager *)objc_loadWeakRetained((id *)&self->_backgroundActivitiesManager);
}

- (void)setBackgroundActivitiesManager:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundActivitiesManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundActivitiesManager);
}

void __53__IRAnalyticsManager__handleCoreAnalyticsXPCActivity__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23FFBA000, log, OS_LOG_TYPE_ERROR, "#analytics, [ErrorId - DB access on analytics] Could not connect to DB during weekly analytics", v1, 2u);
}

@end
