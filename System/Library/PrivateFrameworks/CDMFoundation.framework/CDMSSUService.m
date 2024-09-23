@implementation CDMSSUService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMSSURequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)xpcActivitySupported
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.siri.cdm.xpc_activity.maintenance"), CFSTR("com.apple.siri.cdm.xpc_activity.post_install"), 0);
}

+ (id)xpcEventStreamsSupported
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDBCE30];
  +[XPCStreamEventRegistration registrationWithStream:eventName:dagServiceClass:](XPCStreamEventRegistration, "registrationWithStream:eventName:dagServiceClass:", CFSTR("com.apple.distnoted.matching"), CFSTR("com.apple.LaunchServices.applicationRegistered"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[XPCStreamEventRegistration registrationWithStream:eventName:dagServiceClass:](XPCStreamEventRegistration, "registrationWithStream:eventName:dagServiceClass:", CFSTR("com.apple.distnoted.matching"), CFSTR("com.apple.LaunchServices.applicationUnregistered"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[XPCStreamEventRegistration registrationWithStream:eventName:dagServiceClass:](XPCStreamEventRegistration, "registrationWithStream:eventName:dagServiceClass:", CFSTR("com.apple.notifyd.matching"), CFSTR("com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_NL"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[XPCStreamEventRegistration registrationWithStream:eventName:dagServiceClass:](XPCStreamEventRegistration, "registrationWithStream:eventName:dagServiceClass:", CFSTR("com.apple.notifyd.matching"), CFSTR("com.apple.siri.uaf.com.apple.siri.understanding"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[XPCStreamEventRegistration registrationWithStream:eventName:dagServiceClass:](XPCStreamEventRegistration, "registrationWithStream:eventName:dagServiceClass:", CFSTR("com.apple.notifyd.matching"), *MEMORY[0x24BEC1808], objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObjects:", v3, v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)isEnabled
{
  BOOL v2;
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = +[CDMFeatureFlags isSSUEnabled](CDMFeatureFlags, "isSSUEnabled");
  if (!v2)
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 136315138;
      v6 = "+[CDMSSUService isEnabled]";
    }

  }
  return v2;
}

+ (id)getSystemEventStreamQueue
{
  if (getSystemEventStreamQueue_once != -1)
    dispatch_once(&getSystemEventStreamQueue_once, &__block_literal_global_1012);
  return (id)SSUSystemEventStreamQueue;
}

+ (void)handleXPCEventApplicationRegistered:(id)a3 assetCollection:(id)a4
{
  objc_msgSend(a1, "handleXPCEventApplicationInner:assetCollection:block:", a3, a4, &__block_literal_global_250);
}

+ (void)handleXPCEventApplicationUnregistered:(id)a3 assetCollection:(id)a4
{
  objc_msgSend(a1, "handleXPCEventApplicationInner:assetCollection:block:", a3, a4, &__block_literal_global_251);
}

+ (void)handleXPCEventShortcutsDatabaseChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "+[CDMSSUService(SystemEvent) handleXPCEventShortcutsDatabaseChanged:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Handling shortcuts database changed notification", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buildSystemStateForSystemEventWithLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getMatcherWithAssetCollection:systemState:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "fetchVoiceShortcutsWithMatcher:assetCollection:block:", v8, v4, &__block_literal_global_253);
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "+[CDMSSUService(SystemEvent) handleXPCEventShortcutsDatabaseChanged:]";
      _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not get matcher. Aborting Trial asset update handling.", (uint8_t *)&v10, 0xCu);
    }

  }
}

+ (void)handleXPCEvent:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (+[CDMFeatureFlags isSSUEnableIndexingEnabled](CDMFeatureFlags, "isSSUEnableIndexingEnabled"))
  {
    +[XPCStreamEventUtils getXPCEventName:](XPCStreamEventUtils, "getXPCEventName:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      if (objc_msgSend(CFSTR("com.apple.notifyd.matching"), "isEqualToString:", v10)
        && ((objc_msgSend(CFSTR("com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_NL"), "isEqualToString:", v13) & 1) != 0
         || objc_msgSend(CFSTR("com.apple.siri.uaf.com.apple.siri.understanding"), "isEqualToString:", v13)))
      {
        objc_msgSend(a1, "handleTrialAssetUpdate:", v11);
      }
      else if (objc_msgSend(CFSTR("com.apple.distnoted.matching"), "isEqualToString:", v10)
             && objc_msgSend(CFSTR("com.apple.LaunchServices.applicationRegistered"), "isEqualToString:", v13))
      {
        objc_msgSend(a1, "handleXPCEventApplicationRegistered:assetCollection:", v9, v11);
      }
      else if (objc_msgSend(CFSTR("com.apple.distnoted.matching"), "isEqualToString:", v10)
             && objc_msgSend(CFSTR("com.apple.LaunchServices.applicationUnregistered"), "isEqualToString:", v13))
      {
        objc_msgSend(a1, "handleXPCEventApplicationUnregistered:assetCollection:", v9, v11);
      }
      else if (objc_msgSend(CFSTR("com.apple.notifyd.matching"), "isEqualToString:", v10)
             && objc_msgSend((id)*MEMORY[0x24BEC1808], "isEqualToString:", v13))
      {
        objc_msgSend(a1, "handleXPCEventShortcutsDatabaseChanged:", v11);
      }
      else
      {
        CDMOSLoggerForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = 136315650;
          v17 = "+[CDMSSUService(SystemEvent) handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
          v18 = 2112;
          v19 = v10;
          v20 = 2112;
          v21 = v13;
          _os_log_error_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Unhandled XPC event with streamName=%@, eventName=%@", (uint8_t *)&v16, 0x20u);
        }

      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = 136315394;
        v17 = "+[CDMSSUService(SystemEvent) handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
        v18 = 2048;
        v19 = v9;
        _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not extract XPC event name for event %p", (uint8_t *)&v16, 0x16u);
      }

      v13 = 0;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315138;
      v17 = "+[CDMSSUService(SystemEvent) handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s handleXPCEvent:fromStream:withAssets: called with SSU indexing FF disabled", (uint8_t *)&v16, 0xCu);
    }
  }

}

+ (void)handleXPCActivity:(id)a3 withAssets:(id)a4 withSelfMetadata:(id)a5
{
  __CFString *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a3;
  v8 = a4;
  if (+[CDMFeatureFlags isSSUEnableIndexingEnabled](CDMFeatureFlags, "isSSUEnableIndexingEnabled"))
  {
    if (v7 == CFSTR("com.apple.siri.cdm.xpc_activity.maintenance"))
    {
      objc_msgSend(a1, "handleMaintenanceMode:", v8);
      goto LABEL_10;
    }
    if (v7 == CFSTR("com.apple.siri.cdm.xpc_activity.post_install"))
    {
      objc_msgSend(a1, "handlePostInstall:", v8);
      goto LABEL_10;
    }
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[CDMSSUService(SystemEvent) handleXPCActivity:withAssets:withSelfMetadata:]";
      v13 = 2112;
      v14 = v7;
      v10 = "%s [ERR]: Unhandled activity type: %@";
LABEL_12:
      _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[CDMSSUService(SystemEvent) handleXPCActivity:withAssets:withSelfMetadata:]";
      v13 = 2048;
      v14 = v7;
      v10 = "%s [ERR]: handleXPCActivity:withAssets: called for activity type %ld with SSU indexing FF disabled";
      goto LABEL_12;
    }
  }

LABEL_10:
}

+ (void)handleTrialAssetUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "+[CDMSSUService(SystemEvent) handleTrialAssetUpdate:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Handling Trial asset update event by adding a block to the event queue", buf, 0xCu);
  }

  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buildSystemStateForSystemEventWithLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getMatcherWithAssetCollection:systemState:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __53__CDMSSUService_SystemEvent__handleTrialAssetUpdate___block_invoke;
    v16 = &unk_24DCABBB8;
    v20 = a1;
    v17 = v8;
    v10 = v4;
    v18 = v10;
    v19 = v7;
    v11 = _Block_copy(&v13);
    objc_msgSend(a1, "dispatchAsyncWithTransaction:block:", v10, v11, v13, v14, v15, v16);

    v12 = v17;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "+[CDMSSUService(SystemEvent) handleTrialAssetUpdate:]";
      _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not get matcher. Aborting Trial asset update handling.", buf, 0xCu);
    }
  }

}

+ (void)handleMaintenanceMode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "+[CDMSSUService(SystemEvent) handleMaintenanceMode:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Handling maintenance mode event by adding a block to the event queue", buf, 0xCu);
  }

  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buildSystemStateForSystemEventWithLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getMatcherWithAssetCollection:systemState:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __52__CDMSSUService_SystemEvent__handleMaintenanceMode___block_invoke;
    v16 = &unk_24DCABBB8;
    v20 = a1;
    v17 = v8;
    v10 = v4;
    v18 = v10;
    v19 = v7;
    v11 = _Block_copy(&v13);
    objc_msgSend(a1, "dispatchAsyncWithTransaction:block:", v10, v11, v13, v14, v15, v16);

    v12 = v17;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "+[CDMSSUService(SystemEvent) handleMaintenanceMode:]";
      _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not get matcher. Aborting maintanence mode handling.", buf, 0xCu);
    }
  }

}

+ (void)handlePostInstall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "+[CDMSSUService(SystemEvent) handlePostInstall:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Handling post install event by adding a block to the event queue", buf, 0xCu);
  }

  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buildSystemStateForSystemEventWithLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getMatcherWithAssetCollection:systemState:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __48__CDMSSUService_SystemEvent__handlePostInstall___block_invoke;
    v16 = &unk_24DCABBB8;
    v20 = a1;
    v17 = v8;
    v10 = v4;
    v18 = v10;
    v19 = v7;
    v11 = _Block_copy(&v13);
    objc_msgSend(a1, "dispatchAsyncWithTransaction:block:", v10, v11, v13, v14, v15, v16);

    v12 = v17;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "+[CDMSSUService(SystemEvent) handlePostInstall:]";
      _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not get matcher. Aborting post install handling.", buf, 0xCu);
    }
  }

}

+ (void)fetchVoiceShortcutsWithMatcher:(id)a3 assetCollection:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "+[CDMSSUService(SystemEvent) fetchVoiceShortcutsWithMatcher:assetCollection:block:]";
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Fetching voice shortcuts", buf, 0xCu);
  }

  v12 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__CDMSSUService_SystemEvent__fetchVoiceShortcutsWithMatcher_assetCollection_block___block_invoke;
  v18[3] = &unk_24DCABBE0;
  v22 = v10;
  v23 = a1;
  v19 = v9;
  v20 = v8;
  v21 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v8;
  v17 = v9;
  objc_msgSend(v13, "getVoiceShortcutsWithCompletion:", v18);

}

+ (void)handleVoiceShortcutsCompletion:(id)a3 voiceShortcuts:(id)a4 voiceShortcutsError:(id)a5 block:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, NSObject *);
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  os_signpost_id_t spid;
  unint64_t v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, NSObject *))a6;
  v13 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v14 = (id)CDMLogContext;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CDMSSUService+SystemEvent handle user shortcuts completion", ", buf, 2u);
  }

  CDMOSLoggerForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "+[CDMSSUService(SystemEvent) handleVoiceShortcutsCompletion:voiceShortcuts:voiceShortcutsError:block:]";
    _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Fetch voice shortcuts completion handler called", buf, 0xCu);
  }

  CDMOSLoggerForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v10)
  {
    spid = v13;
    v33 = v13 - 1;
    v34 = v11;
    v35 = v9;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v31 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 136315394;
      v42 = "+[CDMSSUService(SystemEvent) handleVoiceShortcutsCompletion:voiceShortcuts:voiceShortcutsError:block:]";
      v43 = 2048;
      v44 = v31;
      _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s Received %lu voice shortcuts. Extracting identifiers/phrases from these.", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v18 = objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v25 = objc_alloc(MEMORY[0x24BE9E3D8]);
          objc_msgSend(v24, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "phrase");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v25, "initWithIdentifier:phrase:", v26, v27);

          -[NSObject addObject:](v18, "addObject:", v28);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v21);
    }

    v9 = v35;
    ((void (**)(id, id, NSObject *))v12)[2](v12, v35, v18);
    v29 = (id)CDMLogContext;
    v30 = v29;
    if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v30, OS_SIGNPOST_INTERVAL_END, spid, "CDMSSUService+SystemEvent handle user shortcuts completion", ", buf, 2u);
    }

    v11 = v34;
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "+[CDMSSUService(SystemEvent) handleVoiceShortcutsCompletion:voiceShortcuts:voiceShortcutsError:block:]";
    v43 = 2112;
    v44 = (uint64_t)v11;
    _os_log_error_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Hit error fetching voice shortcuts: %@. Aborting handling.", buf, 0x16u);
  }

}

+ (id)buildSystemStateForSystemEventWithLocale:(id)a3
{
  return (id)objc_msgSend(a1, "buildSystemStateForServiceStateDirectory:locale:", 0, a3);
}

+ (void)performFullCacheUpdate:(id)a3 assetCollection:(id)a4 systemState:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "+[CDMSSUService(SystemEvent) performFullCacheUpdate:assetCollection:systemState:]";
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Performing full cache update", buf, 0xCu);
  }

  objc_msgSend(v8, "installedAppProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "lookupAllSSUEnabledApps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  CDMOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 136315394;
    v20 = "+[CDMSSUService(SystemEvent) performFullCacheUpdate:assetCollection:systemState:]";
    v21 = 2048;
    v22 = v16;
    _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s Found %lu SSU-enabled apps on device", buf, 0x16u);
  }

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__CDMSSUService_SystemEvent__performFullCacheUpdate_assetCollection_systemState___block_invoke;
  v17[3] = &unk_24DCABC08;
  v18 = v13;
  v15 = v13;
  objc_msgSend(a1, "fetchVoiceShortcutsWithMatcher:assetCollection:block:", v10, v9, v17);

}

+ (void)handleXPCEventApplicationInner:(id)a3 assetCollection:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[SSUXPCUtils isPlaceholder:](SSUXPCUtils, "isPlaceholder:", v8))
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationInner:assetCollection:block:]";
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Received placeholder application XPC event. We only want to action non-placeholder ones. Aborting XPC event handling.", buf, 0xCu);
    }
  }
  else
  {
    +[SSUXPCUtils extractSingleBundleId:](SSUXPCUtils, "extractSingleBundleId:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = os_signpost_id_generate((os_log_t)CDMLogContext);
      v13 = (id)CDMLogContext;
      v14 = v13;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CDMSSUService+SystemEvent enqueue for handling", ", buf, 2u);
      }

      objc_msgSend(v9, "languageCode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "buildSystemStateForSystemEventWithLocale:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "getMatcherWithAssetCollection:systemState:", v9, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __83__CDMSSUService_SystemEvent__handleXPCEventApplicationInner_assetCollection_block___block_invoke;
        v21[3] = &unk_24DCABC30;
        v25 = v10;
        v22 = v16;
        v23 = v17;
        v24 = v11;
        objc_msgSend(a1, "dispatchAsyncWithTransaction:block:", v9, v21);
        v18 = (id)CDMLogContext;
        v19 = v18;
        if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21A2A0000, v19, OS_SIGNPOST_INTERVAL_END, v12, "CDMSSUService+SystemEvent enqueue for handling", ", buf, 2u);
        }

        v20 = v25;
      }
      else
      {
        CDMOSLoggerForCategory(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationInner:assetCollection:block:]";
          _os_log_error_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not get matcher. Aborting XPC event handling.", buf, 0xCu);
        }
      }

    }
    else
    {
      CDMOSLoggerForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationInner:assetCollection:block:]";
        _os_log_error_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to extract app bundle ID from XPC event. Aborting XPC event handling.", buf, 0xCu);
      }
    }

  }
}

+ (id)getMatcherWithAssetCollection:(id)a3 systemState:(id)a4
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  objc_msgSend(a1, "acquireOrBuildMatcher:systemState:error:", a3, a4, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (!v4)
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v11 = "+[CDMSSUService(SystemEvent) getMatcherWithAssetCollection:systemState:]";
      v12 = 2112;
      v13 = v8;
      _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not acquire/build SNLPSSUMatcher instance: %@.", buf, 0x16u);

    }
  }

  return v4;
}

+ (void)dispatchAsyncWithTransaction:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "getSystemEventStreamQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__CDMSSUService_SystemEvent__dispatchAsyncWithTransaction_block___block_invoke;
  v11[3] = &unk_24DCAC4A0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  +[SSUXPCUtils dispatchAsyncWithTransaction:block:](SSUXPCUtils, "dispatchAsyncWithTransaction:block:", v8, v11);

}

uint64_t __65__CDMSSUService_SystemEvent__dispatchAsyncWithTransaction_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __83__CDMSSUService_SystemEvent__handleXPCEventApplicationInner_assetCollection_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "installedAppProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __81__CDMSSUService_SystemEvent__performFullCacheUpdate_assetCollection_systemState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v4 = objc_msgSend(a2, "performFullCacheUpdateWithUserShortcuts:applicationInfos:error:", a3, v3, &v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v10 = "+[CDMSSUService(SystemEvent) performFullCacheUpdate:assetCollection:systemState:]_block_invoke";
      v11 = 2112;
      v12 = v7;
      _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to perform full cache update with error: %@.", buf, 0x16u);

    }
  }

}

void __83__CDMSSUService_SystemEvent__fetchVoiceShortcutsWithMatcher_assetCollection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 64);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v6, "handleVoiceShortcutsCompletion:voiceShortcuts:voiceShortcutsError:block:", v5, a2, a3, v7);

}

void __48__CDMSSUService_SystemEvent__handlePostInstall___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "+[CDMSSUService(SystemEvent) handlePostInstall:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Handling post install event (inner block)", (uint8_t *)&v8, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "[CDMSSUService+SystemEvent handlePostInstall]", ", (uint8_t *)&v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 56), "performFullCacheUpdate:assetCollection:systemState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (id)CDMLogContext;
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v7, OS_SIGNPOST_INTERVAL_END, v3, "[CDMSSUService+SystemEvent handlePostInstall]", ", (uint8_t *)&v8, 2u);
  }

}

void __52__CDMSSUService_SystemEvent__handleMaintenanceMode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "+[CDMSSUService(SystemEvent) handleMaintenanceMode:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Handling maintenance mode event (inner block)", (uint8_t *)&v8, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "[CDMSSUService+SystemEvent handleMaintenanceMode]", ", (uint8_t *)&v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 56), "performFullCacheUpdate:assetCollection:systemState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (id)CDMLogContext;
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v7, OS_SIGNPOST_INTERVAL_END, v3, "[CDMSSUService+SystemEvent handleMaintenanceMode]", ", (uint8_t *)&v8, 2u);
  }

}

void __53__CDMSSUService_SystemEvent__handleTrialAssetUpdate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "+[CDMSSUService(SystemEvent) handleTrialAssetUpdate:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Handling Trial asset update event (inner block)", (uint8_t *)&v8, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMSSUService+SystemEvent handle Trial asset update", ", (uint8_t *)&v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 56), "performFullCacheUpdate:assetCollection:systemState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (id)CDMLogContext;
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v7, OS_SIGNPOST_INTERVAL_END, v3, "CDMSSUService+SystemEvent handle Trial asset update", ", (uint8_t *)&v8, 2u);
  }

}

void __69__CDMSSUService_SystemEvent__handleXPCEventShortcutsDatabaseChanged___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v3 = objc_msgSend(a2, "handleUserShortcutsDatabaseChanged:error:", a3, &v7);
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v9 = "+[CDMSSUService(SystemEvent) handleXPCEventShortcutsDatabaseChanged:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Error handling shortcuts database changed notification: %@.", buf, 0x16u);

    }
  }

}

void __84__CDMSSUService_SystemEvent__handleXPCEventApplicationUnregistered_assetCollection___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  NSObject *v6;
  id v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = CDMLogContext;
  v7 = a3;
  v8 = os_signpost_id_generate(v6);
  v9 = (id)CDMLogContext;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "[CDMSSUService+SystemEvent handleXPCEventApplicationUnregistered]", ", buf, 2u);
  }

  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationUnregistered:assetCollection:]_block_invoke";
    v24 = 2112;
    v25 = v5;
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Handling SSUXPCStreamEventTypeApplicationUnregistered for bundleId: %@", buf, 0x16u);
  }

  v21 = 0;
  v12 = objc_msgSend(v7, "deregisterApp:error:", v5, &v21);

  v13 = v21;
  v14 = v13;
  if ((v12 & 1) == 0)
  {
    v15 = objc_msgSend(v13, "code");
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 == 3)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationUnregistered:assetCollection:]_block_invoke";
        v24 = 2112;
        v25 = v5;
        _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s App %@ is not registered. Doing nothing.", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationUnregistered:assetCollection:]_block_invoke";
      v24 = 2112;
      v25 = v5;
      v26 = 2112;
      v27 = v20;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Error deregistering app %@: Error: %@.", buf, 0x20u);

    }
  }
  v18 = (id)CDMLogContext;
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v19, OS_SIGNPOST_INTERVAL_END, v8, "[CDMSSUService+SystemEvent handleXPCEventApplicationUnregistered]", ", buf, 2u);
  }

}

void __82__CDMSSUService_SystemEvent__handleXPCEventApplicationRegistered_assetCollection___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = CDMLogContext;
  v9 = a2;
  v10 = os_signpost_id_generate(v8);
  v11 = (id)CDMLogContext;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "[CDMSSUService+SystemEvent handleXPCEventApplicationRegistered]", ", buf, 2u);
  }

  CDMOSLoggerForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationRegistered:assetCollection:]_block_invoke";
    v24 = 2112;
    v25 = v7;
    _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Handling SSUXPCStreamEventTypeApplicationRegistered for bundleId: %@", buf, 0x16u);
  }

  objc_msgSend(v9, "lookupSSUEnabledAppByBundleId:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v21 = 0;
    v15 = objc_msgSend(v6, "registerApp:error:", v14, &v21);
    v16 = v21;
    if ((v15 & 1) == 0)
    {
      CDMOSLoggerForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationRegistered:assetCollection:]_block_invoke";
        v24 = 2112;
        v25 = v7;
        v26 = 2112;
        v27 = v20;
        _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Error registering app %@: Error: %@.", buf, 0x20u);

      }
    }
    v18 = (id)CDMLogContext;
    v19 = v18;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v19, OS_SIGNPOST_INTERVAL_END, v10, "[CDMSSUService+SystemEvent handleXPCEventApplicationRegistered]", ", buf, 2u);
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationRegistered:assetCollection:]_block_invoke";
      v24 = 2112;
      v25 = v7;
      _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Could not lookup SSU app info for the bundle ID: %@. This is likely because the app is not SSU-enabled. Aborting.", buf, 0x16u);
    }
  }

}

void __55__CDMSSUService_SystemEvent__getSystemEventStreamQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.siri.cdm.CDMSSUService", attr);
  v2 = (void *)SSUSystemEventStreamQueue;
  SSUSystemEventStreamQueue = (uint64_t)v1;

}

+ (id)getCDMServiceAssetConfig
{
  CDMServiceAssetConfig *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v8 = CFSTR("ssu_encoder");
  v9[0] = CFSTR("com.apple.siri.nl.ssu.encoder");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("com.apple.siri.nl.ssu.datasets");
  v10[0] = v3;
  v7 = CFSTR("ssu_datasets");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v5, 0);

  -[CDMServiceAssetConfig setIsAssetRequiredForSetup:](v2, "setIsAssetRequiredForSetup:", 0);
  return v2;
}

+ (id)buildMatcherRequestQueue
{
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.siri.cdm.CDMSSUService", v3);

  return v4;
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  CDMSSUResponseCommand *v11;
  NSObject *v12;
  id v13;
  CDMSSUResponseCommand *v14;
  uint64_t v15;
  id v16;
  CDMSSUResponseCommand *v17;
  void *v18;
  void *v19;
  double matcherRequestTimeoutSec;
  uint64_t v22;
  _QWORD aBlock[5];
  id v24;
  __int128 *p_buf;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint8_t v34[4];
  const char *v35;
  __int16 v36;
  double v37;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CDMSSUService handle:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Running [CDMSSUService handle:]", (uint8_t *)&buf, 0xCu);
  }

  if (self->super.super._serviceState == 2)
  {
    objc_msgSend(v4, "parserRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
    {
      v33 = 0;
      v7 = +[CDMNluLogUtil writeSSURequestToDisk:error:](CDMNluLogUtil, "writeSSURequestToDisk:error:", v6, &v33);
    }
    -[CDMSSUService forceAppsRescanIfEnabled](self, "forceAppsRescanIfEnabled");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__2642;
    v41 = __Block_byref_object_dispose__2643;
    v42 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__2642;
    v31 = __Block_byref_object_dispose__2643;
    v32 = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __24__CDMSSUService_handle___block_invoke;
    aBlock[3] = &unk_24DCABE28;
    p_buf = &buf;
    aBlock[4] = self;
    v8 = v6;
    v24 = v8;
    v26 = &v27;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (+[CDMUserDefaultsUtils isSSURequestTimeoutDisabled](CDMUserDefaultsUtils, "isSSURequestTimeoutDisabled"))
    {
      CDMOSLoggerForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v34 = 136315138;
        v35 = "-[CDMSSUService handle:]";
        _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Executing [CDMSSUService handle] without a timeout because user defaults flag is enabled.", v34, 0xCu);
      }

      v9[2](v9);
    }
    else if (-[CDMSSUService executeMatcherRequestBlockWithTimeout:](self, "executeMatcherRequestBlockWithTimeout:", v9))
    {
      CDMOSLoggerForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        matcherRequestTimeoutSec = self->__matcherRequestTimeoutSec;
        *(_DWORD *)v34 = 136315394;
        v35 = "-[CDMSSUService handle:]";
        v36 = 2048;
        v37 = matcherRequestTimeoutSec;
        _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: The call to [SNLPSSUMatcher responseForRequest:error:] timed out after %f seconds. Returning empty parse list.", v34, 0x16u);
      }

      v13 = objc_alloc_init(MEMORY[0x24BE9E2D8]);
      v14 = -[CDMSSUResponseCommand initWithSSUResponse:]([CDMSSUResponseCommand alloc], "initWithSSUResponse:", v13);
      goto LABEL_20;
    }
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
      {
        v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        v22 = 0;
        v16 = +[CDMNluLogUtil writeSSUResponseToDisk:error:](CDMNluLogUtil, "writeSSUResponseToDisk:error:", v15, &v22);
      }
      v17 = [CDMSSUResponseCommand alloc];
      v11 = -[CDMSSUResponseCommand initWithSSUResponse:](v17, "initWithSSUResponse:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      goto LABEL_21;
    }
    v18 = (void *)MEMORY[0x24BDD17C8];
    +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v28[5]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Cannot handle request since the underlying SNLPSSUMatcher instance encountered an error: %@"), v19);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[CDMSSUService abortHandleWithErrorCode:description:](self, "abortHandleWithErrorCode:description:", 4, v13);
    v14 = (CDMSSUResponseCommand *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v11 = v14;

LABEL_21:
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&buf, 8);
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot handle request since CDMSSUService is in non-READY state: %tu"), self->super.super._serviceState);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CDMSSUService abortHandleWithErrorCode:description:](self, "abortHandleWithErrorCode:description:", 1, v8);
  v11 = (CDMSSUResponseCommand *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v11;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *matcherRequestQueue;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SSUSystemState *v20;
  SSUSystemState *systemState;
  void *v22;
  void *v23;
  void *v24;
  SSUSystemState *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[CDMSSUService setup:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Running [CDMSSUService setup:]", buf, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "graphName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {
    objc_msgSend(v4, "dynamicConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "languageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMUAFAssetsManager subscribeToSsuAssetsForLocale:](CDMUAFAssetsManager, "subscribeToSsuAssetsForLocale:", v12);

  }
  self->__matcherRequestTimeoutSec = 0.5;
  objc_msgSend((id)objc_opt_class(), "buildMatcherRequestQueue");
  v13 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  matcherRequestQueue = self->__matcherRequestQueue;
  self->__matcherRequestQueue = v13;

  v15 = (void *)objc_opt_class();
  objc_msgSend(v4, "dynamicConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "serviceStateDirectory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dynamicConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "languageCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "buildSystemStateForServiceStateDirectory:locale:", v17, v19);
  v20 = (SSUSystemState *)objc_claimAutoreleasedReturnValue();
  systemState = self->__systemState;
  self->__systemState = v20;

  v22 = (void *)objc_opt_class();
  objc_msgSend(v4, "dynamicConfig");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "assetCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self->__systemState;
  v33 = 0;
  objc_msgSend(v22, "acquireOrBuildMatcher:systemState:error:", v24, v25, &v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v33;

  if (v26)
  {
    objc_storeStrong((id *)&self->__matcher, v26);
    -[CDMSSUService forceFullCacheUpdateIfEnabled](self, "forceFullCacheUpdateIfEnabled");
    -[CDMSSUService performAppRescanForSandboxInstalledApps](self, "performAppRescanForSandboxInstalledApps");
    self->super.super._serviceState = 2;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = (void *)MEMORY[0x24BDD17C8];
    +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Could not acquire/build SNLPSSUMatcher instance: %@"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[CDMSSUService errorSetupWithErrorDescription:](self, "errorSetupWithErrorDescription:", v31);
    else
      -[CDMSSUService failSetupWithErrorDescription:](self, "failSetupWithErrorDescription:", v31);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v28;
}

- (BOOL)executeMatcherRequestBlockWithTimeout:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  dispatch_time_t v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__CDMSSUService_executeMatcherRequestBlockWithTimeout___block_invoke;
  v9[3] = &unk_24DCAC4A0;
  v9[4] = self;
  v10 = v4;
  v5 = v4;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async((dispatch_queue_t)self->__matcherRequestQueue, v6);
  v7 = dispatch_time(0, (uint64_t)(self->__matcherRequestTimeoutSec * 1000000000.0));
  LOBYTE(self) = dispatch_block_wait(v6, v7) != 0;

  return (char)self;
}

- (id)abortHandleWithErrorCode:(int64_t)a3 description:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  CDMSSUResponseCommand *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315394;
    v12 = "-[CDMSSUService abortHandleWithErrorCode:description:]";
    v13 = 2112;
    v14 = v6;
    _os_log_error_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: Aborting [CDMSSUService handle:] due to error: %@", (uint8_t *)&v11, 0x16u);
  }

  -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CDMSSUResponseCommand initWithCmdError:]([CDMSSUResponseCommand alloc], "initWithCmdError:", v8);

  return v9;
}

- (id)errorSetupWithErrorDescription:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->super.super._serviceState = 3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315394;
    v10 = "-[CDMSSUService errorSetupWithErrorDescription:]";
    v11 = 2112;
    v12 = v4;
    _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Error [CDMSSUService setup:] due to error: %@", (uint8_t *)&v9, 0x16u);
  }

  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCmdError:", v7);

  return v6;
}

- (id)failSetupWithErrorDescription:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->super.super._serviceState = 4;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315394;
    v10 = "-[CDMSSUService failSetupWithErrorDescription:]";
    v11 = 2112;
    v12 = v4;
    _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Aborting [CDMSSUService setup:] due to error: %@", (uint8_t *)&v9, 0x16u);
  }

  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCmdError:", v7);

  return v6;
}

- (void)performAppRescanForSandboxInstalledApps
{
  void *v3;
  char isKindOfClass;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  SNLPSSUMatcher *matcher;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[SSUSystemState installedAppProvider](self->__systemState, "installedAppProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[CDMSSUService performAppRescanForSandboxInstalledApps]";
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Performing app rescan due to service state directory apps", buf, 0xCu);
    }

    -[SSUSystemState installedAppProvider](self->__systemState, "installedAppProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lookupAllSSUEnabledApps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          v12 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v11);
          matcher = self->__matcher;
          v18 = 0;
          v14 = -[SNLPSSUMatcher registerApp:error:](matcher, "registerApp:error:", v12, &v18);
          v15 = v18;
          if ((v14 & 1) == 0)
          {
            CDMOSLoggerForCategory(0);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v24 = "-[CDMSSUService performAppRescanForSandboxInstalledApps]";
              v25 = 2112;
              v26 = v17;
              _os_log_error_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to register app: %@. We will continue processing, despite this failure.", buf, 0x16u);

            }
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v9);
    }

  }
}

- (void)forceFullCacheUpdateIfEnabled
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  SNLPSSUMatcher *matcher;
  char v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (+[CDMFeatureFlags isSSUCacheUpdateOnEveryRequestEnabled](CDMFeatureFlags, "isSSUCacheUpdateOnEveryRequestEnabled"))
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CDMSSUService forceFullCacheUpdateIfEnabled]";
      _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Forcing full cache update due to feature flag", buf, 0xCu);
    }

    -[SSUSystemState installedAppProvider](self->__systemState, "installedAppProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lookupAllSSUEnabledApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 136315394;
      v15 = "-[CDMSSUService forceFullCacheUpdateIfEnabled]";
      v16 = 2048;
      v17 = v11;
      _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s Found %lu SSU-enabled apps on device", buf, 0x16u);
    }

    matcher = self->__matcher;
    v13 = 0;
    v8 = -[SNLPSSUMatcher performFullCacheUpdate:error:](matcher, "performFullCacheUpdate:error:", v5, &v13);
    v9 = v13;
    if ((v8 & 1) == 0)
    {
      CDMOSLoggerForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v15 = "-[CDMSSUService forceFullCacheUpdateIfEnabled]";
        v16 = 2112;
        v17 = (uint64_t)v12;
        _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to perform full cache update with error: %@. We will continue processing, despite this failure.", buf, 0x16u);

      }
    }

  }
}

- (void)forceAppsRescanIfEnabled
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  SNLPSSUMatcher *matcher;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (+[CDMFeatureFlags isSSUCacheUpdateOnEveryRequestEnabled](CDMFeatureFlags, "isSSUCacheUpdateOnEveryRequestEnabled"))
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CDMSSUService forceAppsRescanIfEnabled]";
      _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Forcing app rescan due to feature flag", buf, 0xCu);
    }

    -[SSUSystemState installedAppProvider](self->__systemState, "installedAppProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lookupAllSSUEnabledApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v6);
          v10 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9);
          matcher = self->__matcher;
          v16 = 0;
          v12 = -[SNLPSSUMatcher registerApp:error:](matcher, "registerApp:error:", v10, &v16);
          v13 = v16;
          if ((v12 & 1) == 0)
          {
            CDMOSLoggerForCategory(0);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v22 = "-[CDMSSUService forceAppsRescanIfEnabled]";
              v23 = 2112;
              v24 = v15;
              _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to register app: %@. We will continue processing, despite this failure.", buf, 0x16u);

            }
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v7);
    }

  }
}

- (double)_matcherRequestTimeoutSec
{
  return self->__matcherRequestTimeoutSec;
}

- (void)set_matcherRequestTimeoutSec:(double)a3
{
  self->__matcherRequestTimeoutSec = a3;
}

- (OS_dispatch_queue)_matcherRequestQueue
{
  return self->__matcherRequestQueue;
}

- (SSUSystemState)_systemState
{
  return self->__systemState;
}

- (SNLPSSUMatcher)_matcher
{
  return self->__matcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__matcher, 0);
  objc_storeStrong((id *)&self->__systemState, 0);
  objc_storeStrong((id *)&self->__matcherRequestQueue, 0);
}

uint64_t __55__CDMSSUService_executeMatcherRequestBlockWithTimeout___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "_matcherRequestQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __24__CDMSSUService_handle___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_matcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "responseForRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (id)buildSystemStateForServiceStateDirectory:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_8;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v15 = 136315138;
    v16 = "+[CDMSSUService(SystemState) buildSystemStateForServiceStateDirectory:locale:]";
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Service state directory supplied: looking for CDMSSUService subdirectory", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(a1, "lookupSSUSandboxDirectories:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315138;
      v16 = "+[CDMSSUService(SystemState) buildSystemStateForServiceStateDirectory:locale:]";
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Building SSU system state from sandbox directories", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(a1, "buildSystemStateForSsuSandboxDirectories:locale:", v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315138;
      v16 = "+[CDMSSUService(SystemState) buildSystemStateForServiceStateDirectory:locale:]";
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Building device SSU system state", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(a1, "buildDeviceSystemStateLocale:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)lookupSSUSandboxDirectories:(id)a3
{
  __CFString *v3;
  void *v4;
  int v5;
  BOOL v6;
  SSUSandboxDirectories *v7;
  objc_class *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  char v24;
  char v25;
  char v26;
  char v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v27 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v27);

  if (v5)
    v6 = v27 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingPathComponent:](v3, "stringByAppendingPathComponent:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v10, &v26);

    if ((v12 & 1) != 0)
    {
      if (v26)
      {
        -[NSObject stringByAppendingPathComponent:](v10, "stringByAppendingPathComponent:", CFSTR("installed_apps"));
        v13 = objc_claimAutoreleasedReturnValue();
        v25 = 0;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v13, &v25);

        if (!v15 || !v25)
        {
          CDMOSLoggerForCategory(0);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
            v30 = 2112;
            v31 = v10;
            v32 = 2112;
            v33 = CFSTR("installed_apps");
            _os_log_error_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: The given service state directory %@ folder does not have a %@ subdirectory. Ignoring service state directory and falling back on device state.", buf, 0x20u);
          }
          v7 = 0;
          goto LABEL_32;
        }
        -[NSObject stringByAppendingPathComponent:](v10, "stringByAppendingPathComponent:", CFSTR("cache"));
        v16 = objc_claimAutoreleasedReturnValue();
        v24 = 0;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "fileExistsAtPath:isDirectory:", v16, &v24);

        if (v18)
        {
          if (v24)
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
            v7 = objc_alloc_init(SSUSandboxDirectories);
            objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v13);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SSUSandboxDirectories setInstalledAppsDirectoryURL:](v7, "setInstalledAppsDirectoryURL:", v22);

            -[SSUSandboxDirectories setCacheDirectoryURL:](v7, "setCacheDirectoryURL:", v19);
LABEL_32:

            goto LABEL_33;
          }
          CDMOSLoggerForCategory(0);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
            v30 = 2112;
            v31 = v10;
            v32 = 2112;
            v33 = CFSTR("cache");
            _os_log_error_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: The given service state directory %@ folder has a non-folder cache subdirectory %@. Ignoring it.", buf, 0x20u);
          }

        }
        else
        {
          CDMOSLoggerForCategory(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
            _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s Optional SSU cache subdirectory does not exist in the service state directory", buf, 0xCu);
          }

        }
        v19 = 0;
        goto LABEL_31;
      }
      CDMOSLoggerForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
        v30 = 2112;
        v31 = v10;
        _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: The given service state directory has a non-directory file: %@. Ignoring service state directory and falling back on device state.", buf, 0x16u);
      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
        v30 = 2112;
        v31 = v9;
        v32 = 2112;
        v33 = v3;
        _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s The given service state directory does not contain a %@ subdirectory: %@. Ignoring service state directory and falling back on device state.", buf, 0x20u);
      }
    }
    v7 = 0;
LABEL_33:

    goto LABEL_34;
  }
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
    v30 = 2112;
    v31 = v3;
    _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: The given service state directory does not exist or is not a directory: %@. Ignoring service state directory and falling back on device state.", buf, 0x16u);
  }
  v7 = 0;
LABEL_34:

  return v7;
}

+ (id)buildSystemStateForSsuSandboxDirectories:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  SSUInstalledAppProviderSandbox *v7;
  void *v8;
  SSUInstalledAppProviderSandbox *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  SSUCacheDirectoryProviderSandbox *v13;
  void *v14;
  SSUCacheDirectoryProviderTemporary *v15;
  SSUSystemState *v16;
  SSUSystemState *v17;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = [SSUInstalledAppProviderSandbox alloc];
  objc_msgSend(v5, "installedAppsDirectoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SSUInstalledAppProviderSandbox initWithDirectory:locale:](v7, "initWithDirectory:locale:", v8, v6);

  objc_msgSend(v5, "cacheDirectoryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
    {
      v19 = 136315138;
      v20 = "+[CDMSSUService(SystemState) buildSystemStateForSsuSandboxDirectories:locale:]";
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Using SSU service state directory cache subdirectory via SSUCacheDirectoryProviderSandbox", (uint8_t *)&v19, 0xCu);
    }

    v13 = [SSUCacheDirectoryProviderSandbox alloc];
    objc_msgSend(v5, "cacheDirectoryURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SSUCacheDirectoryProviderSandbox initWithDirectory:](v13, "initWithDirectory:", v14);

    v16 = -[SSUSystemState initWithCacheDirectoryProviderSandbox:installedAppProviderSandbox:]([SSUSystemState alloc], "initWithCacheDirectoryProviderSandbox:installedAppProviderSandbox:", v15, v9);
  }
  else
  {
    if (v12)
    {
      v19 = 136315138;
      v20 = "+[CDMSSUService(SystemState) buildSystemStateForSsuSandboxDirectories:locale:]";
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Using temporary cache directory", (uint8_t *)&v19, 0xCu);
    }

    v15 = objc_alloc_init(SSUCacheDirectoryProviderTemporary);
    v16 = -[SSUSystemState initWithCacheDirectoryProviderTemporary:installedAppProviderSandbox:]([SSUSystemState alloc], "initWithCacheDirectoryProviderTemporary:installedAppProviderSandbox:", v15, v9);
  }
  v17 = v16;

  return v17;
}

+ (id)buildDeviceSystemStateLocale:(id)a3
{
  id v3;
  SSUCacheDirectoryProviderDevice *v4;
  SSUInstalledAppProviderDevice *v5;
  SSUSystemState *v6;

  v3 = a3;
  v4 = objc_alloc_init(SSUCacheDirectoryProviderDevice);
  v5 = -[SSUInstalledAppProviderDevice initWithLocale:]([SSUInstalledAppProviderDevice alloc], "initWithLocale:", v3);

  v6 = -[SSUSystemState initWithCacheDirectoryProviderDevice:installedAppProviderDevice:]([SSUSystemState alloc], "initWithCacheDirectoryProviderDevice:installedAppProviderDevice:", v4, v5);
  return v6;
}

+ (id)acquireOrBuildMatcher:(id)a3 systemState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  SSUMatcherBuildParams *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "getAssetsDirectory:factorName:error:", v8, CFSTR("com.apple.siri.nl.ssu.encoder"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getAssetsDirectory:factorName:error:", v8, CFSTR("com.apple.siri.nl.ssu.datasets"), a5);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = 0;
  if (v10 && v11)
  {
    objc_msgSend(v9, "cacheDirectoryProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v14, "lookupOrCreateCacheDirectory:", &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v25;

    if (v15)
    {
      +[SSUMatcherBuilder sharedBuilder](SSUMatcherBuilder, "sharedBuilder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SSUMatcherBuildParams initWithModelAssetsDirectoryURL:datasetAssetsDirectoryURL:cacheDirectoryURL:]([SSUMatcherBuildParams alloc], "initWithModelAssetsDirectoryURL:datasetAssetsDirectoryURL:cacheDirectoryURL:", v10, v12, v15);
      objc_msgSend(v17, "getMatcherForBuildParams:error:", v18, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!a5)
      {
        v13 = 0;
        goto LABEL_8;
      }
      v19 = *MEMORY[0x24BDD0FC8];
      v27[0] = CFSTR("Could not acquire/build SNLPSSUMatcher instance.");
      v20 = *MEMORY[0x24BDD0FD8];
      v26[0] = v19;
      v26[1] = v20;
      v21 = (void *)MEMORY[0x24BDD17C8];
      +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Could not lookup/create SSU cache directory: %@"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDMSSUServiceMatcherErrorDomain"), 1, v17);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_8:
  }

  return v13;
}

+ (id)assetDirectoryURLForServiceAssetBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  NSObject *v9;
  char v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "resourcePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v11);

  if (v11)
    v7 = v6;
  else
    v7 = 0;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v4, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "+[CDMSSUService(Matcher) assetDirectoryURLForServiceAssetBundle:]";
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: SSU assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)getAssetsDirectory:(id)a3 factorName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(a3, "getAssetBundlePathForFactorName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "assetDirectoryURLForServiceAssetBundle:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      v12 = v11;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "+[CDMSSUService(Matcher) getAssetsDirectory:factorName:error:]";
        v26 = 2112;
        v27 = v8;
        _os_log_error_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to get asset directory URL for factor: %@", buf, 0x16u);
      }

      if (a5)
      {
        v17 = *MEMORY[0x24BDD0FD8];
        v20[0] = *MEMORY[0x24BDD0FC8];
        v20[1] = v17;
        v21[0] = CFSTR("Could not acquire/build SNLPSSUMatcher instance.");
        v21[1] = CFSTR("Could not find SSU assets directory inside asset bundle");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDMSSUServiceMatcherErrorDomain"), 1, v18);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0;
      v12 = 0;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[CDMSSUService(Matcher) getAssetsDirectory:factorName:error:]";
      v26 = 2112;
      v27 = v8;
      _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to get asset bundle for factor: %@", buf, 0x16u);
    }

    if (!a5)
    {
      v12 = 0;
      goto LABEL_14;
    }
    v14 = *MEMORY[0x24BDD0FD8];
    v22[0] = *MEMORY[0x24BDD0FC8];
    v22[1] = v14;
    v23[0] = CFSTR("Could not acquire/build SNLPSSUMatcher instance.");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find SSU service asset bundle for factor %@"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDMSSUServiceMatcherErrorDomain"), 1, v11);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  return v12;
}

@end
