@implementation DNDNotificationsService

- (DNDNotificationsService)initWithClientIdentifier:(id)a3
{
  id v4;
  DNDNotificationsService *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  DNDModeAssertionService *notificationsAssertionService;
  uint64_t v11;
  DNDStateService *notificationsStateService;
  uint64_t v13;
  DNDSettingsService *notificationsSettingsService;
  uint64_t v15;
  DNDModeConfigurationService *notificationsModeConfigurationService;
  uint64_t v17;
  UNUserNotificationCenter *notificationsCenter;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DNDNotificationsService;
  v5 = -[DNDNotificationsService init](&v20, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.donotdisturb.kit.NotificationsService", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BE2D678], "serviceForClientIdentifier:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    notificationsAssertionService = v5->_notificationsAssertionService;
    v5->_notificationsAssertionService = (DNDModeAssertionService *)v9;

    objc_msgSend(MEMORY[0x24BE2D738], "serviceForClientIdentifier:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    notificationsStateService = v5->_notificationsStateService;
    v5->_notificationsStateService = (DNDStateService *)v11;

    objc_msgSend(MEMORY[0x24BE2D730], "serviceForClientIdentifier:", v4);
    v13 = objc_claimAutoreleasedReturnValue();
    notificationsSettingsService = v5->_notificationsSettingsService;
    v5->_notificationsSettingsService = (DNDSettingsService *)v13;

    objc_msgSend(MEMORY[0x24BE2D6B0], "serviceForClientIdentifier:", v4);
    v15 = objc_claimAutoreleasedReturnValue();
    notificationsModeConfigurationService = v5->_notificationsModeConfigurationService;
    v5->_notificationsModeConfigurationService = (DNDModeConfigurationService *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.donotdisturb"));
    notificationsCenter = v5->_notificationsCenter;
    v5->_notificationsCenter = (UNUserNotificationCenter *)v17;

    -[UNUserNotificationCenter setDelegate:](v5->_notificationsCenter, "setDelegate:", v5);
  }

  return v5;
}

- (void)resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__DNDNotificationsService_resume__block_invoke;
  block[3] = &unk_24CF51578;
  block[4] = self;
  dispatch_async(queue, block);
}

void __33__DNDNotificationsService_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setWantsNotificationResponsesDelivered");
  objc_msgSend(MEMORY[0x24BE040E8], "sharedInstance");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "registerObserver:sendingInitialChangeNotification:", *(_QWORD *)(a1 + 32), 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addStateUpdateListener:withCompletionHandler:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "queryCurrentStateWithError:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v5;

}

- (void)activitySuggestionClient:(id)a3 didSuggestSettingUpActivity:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__DNDNotificationsService_activitySuggestionClient_didSuggestSettingUpActivity___block_invoke;
  v8[3] = &unk_24CF515C0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __80__DNDNotificationsService_activitySuggestionClient_didSuggestSettingUpActivity___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isActive");
  v3 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v28 = 138543618;
    v29 = v4;
    v30 = 1024;
    v31 = v2;
    _os_log_impl(&dword_21314A000, v3, OS_LOG_TYPE_DEFAULT, "Did receive setup suggestion for activity; suggestion=%{public}@, focus=%{BOOL}d",
      (uint8_t *)&v28,
      0x12u);
  }
  if ((v2 & 1) == 0 && (v5 = *(void **)(a1 + 40)) != 0 && (objc_msgSend(v5, "location") & 2) != 0)
  {
    MEMORY[0x2199AC9B0](objc_msgSend(*(id *)(a1 + 40), "activityType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    DNDModeSemanticTypeToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uppercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x24BDF8800]);
    objc_msgSend(v11, "setCategoryIdentifier:", CFSTR("suggestion.setup"));
    objc_msgSend(v11, "setInterruptionLevel:", 0);
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(CFSTR("NOTIFICATION_SUGGESTION_SETUP_TITLE_"), "stringByAppendingString:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedUserNotificationStringForKey:arguments:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v14);

    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(CFSTR("NOTIFICATION_SUGGESTION_SETUP_BODY_"), "stringByAppendingString:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedUserNotificationStringForKey:arguments:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBody:", v17);

    objc_msgSend(v11, "setShouldSuppressDefaultAction:", 1);
    objc_msgSend(v11, "setShouldDisplayActionsInline:", 1);
    v18 = (void *)MEMORY[0x24BDF8850];
    DNDSystemImageNameForModeSemanticType();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iconForSystemImageNamed:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIcon:", v20);

    v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("semanticType"));

    objc_msgSend(*(id *)(a1 + 40), "suggestionUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bs_setSafeObject:forKey:", v23, CFSTR("suggestionUUID"));

    objc_msgSend(v11, "setUserInfo:", v21);
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    objc_msgSend(*(id *)(a1 + 40), "suggestionUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "didShowActivitySetUpSuggestionWithSuggestionUUID:location:", v25, 1);

    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("setup"), v11, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addNotificationRequest:withCompletionHandler:", v27, &__block_literal_global_0);

  }
  else
  {
    v6 = DNDLogNotifications;
    if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 67109120;
      LODWORD(v29) = v2;
      _os_log_impl(&dword_21314A000, v6, OS_LOG_TYPE_DEFAULT, "Did not post suggestion notifiction; focus=%{BOOL}d",
        (uint8_t *)&v28,
        8u);
    }
  }
}

void __80__DNDNotificationsService_activitySuggestionClient_didSuggestSettingUpActivity___block_invoke_254(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_21314A000, v3, OS_LOG_TYPE_DEFAULT, "Notification posted: error=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)activitySuggestionClient:(id)a3 didSuggestTriggersForConfiguredActivity:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __92__DNDNotificationsService_activitySuggestionClient_didSuggestTriggersForConfiguredActivity___block_invoke;
  v8[3] = &unk_24CF515C0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __92__DNDNotificationsService_activitySuggestionClient_didSuggestTriggersForConfiguredActivity___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void **v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isActive");
  v3 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v36 = v4;
    v37 = 1024;
    v38 = v2;
    _os_log_impl(&dword_21314A000, v3, OS_LOG_TYPE_DEFAULT, "Did receive triggers suggestion for activity; suggestion=%{public}@, focus=%{BOOL}d",
      buf,
      0x12u);
  }
  if ((v2 & 1) == 0)
  {
    v6 = (void **)(a1 + 40);
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      if ((objc_msgSend(v5, "location") & 2) != 0)
      {
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "uuidString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_modeForIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v20 = (void *)DNDLogNotifications;
          if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR))
            __92__DNDNotificationsService_activitySuggestionClient_didSuggestTriggersForConfiguredActivity___block_invoke_cold_1(v6, v20);
          goto LABEL_17;
        }
        v11 = objc_msgSend(v10, "semanticType");
        DNDModeSemanticTypeToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uppercaseString");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v14 = objc_alloc_init(MEMORY[0x24BDF8800]);
        objc_msgSend(v14, "setCategoryIdentifier:", CFSTR("suggestion.trigger"));
        objc_msgSend(v14, "setInterruptionLevel:", 1);
        if (v11)
        {
          if (v11 == -1)
          {
            v15 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(CFSTR("NOTIFICATION_SUGGESTION_START_TITLE_"), "stringByAppendingString:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v17;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "localizedUserNotificationStringForKey:arguments:", v16, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setTitle:", v19);

LABEL_16:
            objc_msgSend(*(id *)(a1 + 40), "localizedTriggerSuggestionText");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setBody:", v22);

            objc_msgSend(v14, "setShouldSuppressDefaultAction:", 1);
            objc_msgSend(v14, "setShouldDisplayActionsInline:", 1);
            v23 = (void *)MEMORY[0x24BDF8850];
            objc_msgSend(v10, "symbolImageName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "iconForSystemImageNamed:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setIcon:", v25);

            v32 = CFSTR("suggestionUUID");
            objc_msgSend(*(id *)(a1 + 40), "suggestionUUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v26;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setUserInfo:", v27);

            v28 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
            objc_msgSend(*(id *)(a1 + 40), "suggestionUUID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "didShowTriggerSuggestionWithSuggestionUUID:location:", v29, 1);

            v30 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
            objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("start"), v14, 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addNotificationRequest:withCompletionHandler:", v31, &__block_literal_global_263);

LABEL_17:
            return;
          }
        }
        else
        {

          v13 = CFSTR("DEFAULT");
        }
        v21 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(CFSTR("NOTIFICATION_SUGGESTION_START_TITLE_"), "stringByAppendingString:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedUserNotificationStringForKey:arguments:", v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTitle:", v17);
        goto LABEL_16;
      }
    }
  }
  v7 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = v2;
    _os_log_impl(&dword_21314A000, v7, OS_LOG_TYPE_DEFAULT, "Did not post suggestion notifiction; focus=%{BOOL}d",
      buf,
      8u);
  }
}

void __92__DNDNotificationsService_activitySuggestionClient_didSuggestTriggersForConfiguredActivity___block_invoke_262(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_21314A000, v3, OS_LOG_TYPE_DEFAULT, "Notification posted: error=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_21314A000, v6, OS_LOG_TYPE_DEFAULT, "Did receive state update; stateUpdate=%{public}@",
      buf,
      0xCu);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__DNDNotificationsService_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v9[3] = &unk_24CF515C0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

void __74__DNDNotificationsService_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "state");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

}

- (void)settingsService:(id)a3 didReceiveUpdatedBehaviorSettings:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_21314A000, v6, OS_LOG_TYPE_DEFAULT, "Did receive updated behavior settings; settings=%{public}@",
      buf,
      0xCu);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__DNDNotificationsService_settingsService_didReceiveUpdatedBehaviorSettings___block_invoke;
  v9[3] = &unk_24CF515C0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

void __77__DNDNotificationsService_settingsService_didReceiveUpdatedBehaviorSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  DNDModeAssertionService *notificationsAssertionService;
  int v44;
  NSObject *v45;
  id v46;
  _QWORD v47[5];
  void *v48;
  void (**v49)(_QWORD);
  _QWORD v50[5];
  void *v51;
  void (**v52)(_QWORD);
  _QWORD v53[5];
  void *v54;
  void (**v55)(_QWORD);
  _QWORD block[4];
  void *v57;
  DNDNotificationsService *v58;
  id v59;
  void (**v60)(_QWORD);
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  objc_msgSend(v7, "actionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "categoryIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v62 = v13;
    v63 = 2114;
    v64 = v9;
    _os_log_impl(&dword_21314A000, v14, OS_LOG_TYPE_DEFAULT, "Did receive notification response; categoryIdentifier = %{public}@; actionIdentifier: %{public}@",
      buf,
      0x16u);
  }
  if (!objc_msgSend(v13, "isEqualToString:", CFSTR("suggestion.setup"))
    || !objc_msgSend(v9, "isEqualToString:", CFSTR("suggestion.setup.accept")))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("suggestion.setup"))
      && ((objc_msgSend(v9, "isEqualToString:", CFSTR("suggestion.setup.decline")) & 1) != 0
       || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDF8A70])))
    {
      objc_msgSend(v7, "notification");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "request");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "content");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "userInfo");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "objectForKey:", CFSTR("suggestionUUID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = DNDLogNotifications;
      if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v28;
        _os_log_impl(&dword_21314A000, v29, OS_LOG_TYPE_DEFAULT, "Decline setup suggestion; suggestionUUID=%{public}@",
          buf,
          0xCu);
      }
      dispatch_get_global_queue(25, 0);
      v30 = objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_266;
      v53[3] = &unk_24CF51630;
      v53[4] = self;
      v54 = v28;
      v55 = v8;
      v22 = v28;
      dispatch_async(v30, v53);

      v24 = v54;
      goto LABEL_25;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("suggestion.trigger"))
      && objc_msgSend(v9, "isEqualToString:", CFSTR("suggestion.trigger.accept")))
    {
      objc_msgSend(v7, "notification");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "request");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "content");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "userInfo");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "objectForKey:", CFSTR("suggestionUUID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = DNDLogNotifications;
      if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v34;
        _os_log_impl(&dword_21314A000, v35, OS_LOG_TYPE_DEFAULT, "Accept start suggestion always; suggestionUUID=%{public}@",
          buf,
          0xCu);
      }
      dispatch_get_global_queue(25, 0);
      v36 = objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_267;
      v50[3] = &unk_24CF51630;
      v50[4] = self;
      v51 = v34;
      v52 = v8;
      v22 = v34;
      dispatch_async(v36, v50);

      v24 = v51;
      goto LABEL_25;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("suggestion.trigger"))
      && ((objc_msgSend(v9, "isEqualToString:", CFSTR("suggestion.trigger.decline")) & 1) != 0
       || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDF8A70])))
    {
      objc_msgSend(v7, "notification");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "request");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "content");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "userInfo");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "objectForKey:", CFSTR("suggestionUUID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = DNDLogNotifications;
      if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v40;
        _os_log_impl(&dword_21314A000, v41, OS_LOG_TYPE_DEFAULT, "Decline suggestion; suggestionUUID=%{public}@",
          buf,
          0xCu);
      }
      dispatch_get_global_queue(25, 0);
      v42 = objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_272;
      v47[3] = &unk_24CF51630;
      v47[4] = self;
      v48 = v40;
      v49 = v8;
      v22 = v40;
      dispatch_async(v42, v47);

      v24 = v48;
      goto LABEL_25;
    }
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("stop")))
      goto LABEL_27;
    notificationsAssertionService = self->_notificationsAssertionService;
    v46 = 0;
    v44 = -[DNDModeAssertionService invalidateAllActiveModeAssertionsWithError:](notificationsAssertionService, "invalidateAllActiveModeAssertionsWithError:", &v46);
    v23 = v46;
    v45 = DNDLogNotifications;
    if (v44)
    {
      if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21314A000, v45, OS_LOG_TYPE_DEFAULT, "Invalidated all assertions", buf, 2u);
        if (!v8)
          goto LABEL_26;
        goto LABEL_35;
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR))
    {
      -[DNDNotificationsService userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:].cold.1();
      if (!v8)
        goto LABEL_26;
      goto LABEL_35;
    }
    if (!v8)
      goto LABEL_26;
LABEL_35:
    v8[2](v8);
    goto LABEL_26;
  }
  objc_msgSend(v7, "notification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "content");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "objectForKey:", CFSTR("suggestionUUID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v19;
    _os_log_impl(&dword_21314A000, v20, OS_LOG_TYPE_DEFAULT, "Accept setup suggestion; suggestionUUID=%{public}@",
      buf,
      0xCu);
  }
  dispatch_get_global_queue(25, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  block[3] = &unk_24CF51608;
  v57 = v18;
  v58 = self;
  v59 = v19;
  v60 = v8;
  v22 = v19;
  v23 = v18;
  dispatch_async(v21, block);

  v24 = v57;
LABEL_25:

LABEL_26:
LABEL_27:

}

void __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("semanticType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "dnd_setupURLWithSemanticType:", objc_msgSend(v2, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE38320];
  v14[0] = *MEMORY[0x24BE38310];
  v14[1] = v5;
  v15[0] = MEMORY[0x24BDBD1C8];
  v15[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v4, "openSensitiveURL:withOptions:error:", v3, v6, &v11);
  v8 = v11;

  v9 = DNDLogNotifications;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v3;
      _os_log_impl(&dword_21314A000, v9, OS_LOG_TYPE_DEFAULT, "Launched URL %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR))
  {
    __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_cold_1();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "userDidAcceptActivitySetUpSuggestionWithSuggestionUUID:location:", *(_QWORD *)(a1 + 48), 1);
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

uint64_t __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_266(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 96), "userDidRejectActivitySetUpSuggestionWithSuggestionUUID:location:", a1[5], 1);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_267(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD *v31;
  id v32;
  id obj;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v1 = a1;
  v48 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 96), "suggestionWithUUID:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "triggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1[4] + 96), "triggersToDNDModeConfigurationTriggers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v1[4];
    objc_msgSend(v6, "uuidString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_modeConfigurationForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v29 = v7;
      v30 = v6;
      v31 = v1;
      v32 = v4;
      v27 = (void *)objc_msgSend(v11, "mutableCopy");
      v28 = v11;
      objc_msgSend(v11, "triggers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v12, "mutableCopy");

      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = v8;
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v36)
      {
        v34 = *(_QWORD *)v43;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v43 != v34)
              objc_enumerationMutation(obj);
            v37 = v13;
            v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v13);
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v16 = v35;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v39;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v39 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v22 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v22);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = objc_msgSend(&unk_24CF53C88, "containsObject:", v23);

                    if (v24)
                      objc_msgSend(v15, "addObject:", v21);
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
              }
              while (v18);
            }

            objc_msgSend(v16, "removeObjectsInArray:", v15);
            objc_msgSend(v16, "addObject:", v14);

            v13 = v37 + 1;
          }
          while (v37 + 1 != v36);
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v36);
      }

      v25 = (void *)objc_msgSend(v35, "copy");
      objc_msgSend(v27, "setTriggers:", v25);

      v1 = v31;
      objc_msgSend((id)v31[4], "_setModeConfiguration:", v27);

      v4 = v32;
      v7 = v29;
      v6 = v30;
      v11 = v28;
    }
    objc_msgSend(*(id *)(v1[4] + 96), "userDidAcceptTriggerSuggestionWithSuggestionUUID:acceptedTriggers:location:", v1[5], v8, 1);

  }
  v26 = v1[6];
  if (v26)
    (*(void (**)(void))(v26 + 16))();

}

uint64_t __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_272(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 96), "userDidRejectTriggerSuggestionWithSuggestionUUID:location:", a1[5], 1);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_modeForIdentifier:(id)a3
{
  id v4;
  DNDModeConfigurationService *notificationsModeConfigurationService;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  notificationsModeConfigurationService = self->_notificationsModeConfigurationService;
  v12 = 0;
  -[DNDModeConfigurationService availableModesReturningError:](notificationsModeConfigurationService, "availableModesReturningError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR))
      -[DNDNotificationsService _modeForIdentifier:].cold.1();
    v8 = 0;
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__DNDNotificationsService__modeForIdentifier___block_invoke;
    v10[3] = &unk_24CF51658;
    v11 = v4;
    objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __46__DNDNotificationsService__modeForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)_modeConfigurationForIdentifier:(id)a3
{
  id v4;
  DNDModeConfigurationService *notificationsModeConfigurationService;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  notificationsModeConfigurationService = self->_notificationsModeConfigurationService;
  v13 = 0;
  -[DNDModeConfigurationService modeConfigurationsReturningError:](notificationsModeConfigurationService, "modeConfigurationsReturningError:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR))
      -[DNDNotificationsService _modeConfigurationForIdentifier:].cold.1();
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__DNDNotificationsService__modeConfigurationForIdentifier___block_invoke;
    v11[3] = &unk_24CF51680;
    v12 = v4;
    objc_msgSend(v9, "bs_firstObjectPassingTest:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __59__DNDNotificationsService__modeConfigurationForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "mode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

- (void)_setModeConfiguration:(id)a3
{
  DNDModeConfigurationService *notificationsModeConfigurationService;
  id v4;
  id v5;

  notificationsModeConfigurationService = self->_notificationsModeConfigurationService;
  v5 = 0;
  -[DNDModeConfigurationService setModeConfiguration:error:](notificationsModeConfigurationService, "setModeConfiguration:error:", a3, &v5);
  v4 = v5;
  if (v4 && os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR))
    -[DNDNotificationsService _setModeConfiguration:].cold.1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySuggestionClient, 0);
  objc_storeStrong((id *)&self->_notificationsCenter, 0);
  objc_storeStrong((id *)&self->_currentBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_transitionDate, 0);
  objc_storeStrong((id *)&self->_notificationsModeConfigurationService, 0);
  objc_storeStrong((id *)&self->_notificationsSettingsService, 0);
  objc_storeStrong((id *)&self->_notificationsStateService, 0);
  objc_storeStrong((id *)&self->_notificationsAssertionService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __92__DNDNotificationsService_activitySuggestionClient_didSuggestTriggersForConfiguredActivity___block_invoke_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "uuidString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21314A000, v3, OS_LOG_TYPE_ERROR, "Unable to fetch find mode for suggestion; identifier=: %@",
    v5,
    0xCu);

}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21314A000, v0, v1, "Unable to invalidate all assertions; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

void __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_21314A000, v1, OS_LOG_TYPE_ERROR, "Failed to launch URL %{public}@: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_modeForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21314A000, v0, v1, "Unable to fetch available modes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_modeConfigurationForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21314A000, v0, v1, "Unable to fetch mode configurations: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setModeConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21314A000, v0, v1, "Unable to set mode configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
