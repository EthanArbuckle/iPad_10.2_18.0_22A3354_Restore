@implementation _DKUserIsFirstBacklightOnAfterWakeupMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD block[4];
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x219A29278]();
  if (self->_enabled)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Notification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.springboard.lockstate"));

    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_State"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      if ((v9 & 1) == 0)
      {
        -[_DKMonitor queue](self, "queue");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = MEMORY[0x24BDAC760];
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __72___DKUserIsFirstBacklightOnAfterWakeupMonitor_receiveNotificationEvent___block_invoke;
        v15[3] = &unk_24DA66D10;
        v15[4] = self;
        v12 = v15;
        v13 = (void *)os_transaction_create();
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
        block[3] = &unk_24DA66E28;
        v17 = v13;
        v18 = v12;
        v14 = v13;
        dispatch_async(v10, block);

      }
    }
  }
  objc_autoreleasePoolPop(v5);

}

- (void)dealloc
{
  objc_super v3;

  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKUserIsFirstBacklightOnAfterWakeupMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("UserIsFirstBacklightOnAfterWakeup");
}

+ (id)prettyPrintDateAsLocalTime:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  objc_msgSend(v4, "setDateStyle:", 2);
  objc_msgSend(v4, "setTimeStyle:", 3);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "stringFromDate:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fetchMostRecentPastEventForStream:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("(startDate < %@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BE1B088]);
  objc_msgSend(v8, "setPredicate:", v6);
  v19[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventStreams:", v9);

  v18 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v10);

  objc_msgSend(v8, "setLimit:", 1);
  objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v11, "executeQuery:error:", v8, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[_DKUserIsFirstBacklightOnAfterWakeupMonitor fetchMostRecentPastEventForStream:].cold.1(v3);

    v15 = 0;
  }
  else
  {
    objc_msgSend(v12, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)isFirstBacklightOn
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v12;
  NSDateInterval *eligibleForNotification;
  int v14;
  void *v15;
  __int16 v16;
  NSDateInterval *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDateInterval containsDate:](self->eligibleForNotification, "containsDate:", v4))
  {
    objc_msgSend((id)objc_opt_class(), "fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "endDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceNow");
      if (v8 >= -14400.0)
        LOBYTE(v9) = 0;
      else
        v9 = !-[_DKUserIsFirstBacklightOnAfterWakeupMonitor didQualifyingScreenLockEndInEligibilityPeriod](self, "didQualifyingScreenLockEndInEligibilityPeriod");

    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "prettyPrintDateAsLocalTime:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      eligibleForNotification = self->eligibleForNotification;
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = eligibleForNotification;
      _os_log_debug_impl(&dword_219056000, v10, OS_LOG_TYPE_DEBUG, "%@ is not in \"First wakeup of the Day\" Eligible notification period %@", (uint8_t *)&v14, 0x16u);

    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)firstWakeupEventWithValue:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForFirstWakeupStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  if (a3)
    objc_msgSend(MEMORY[0x24BE1B048], "yes");
  else
    objc_msgSend(MEMORY[0x24BE1B048], "no");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "userIsFirstBacklightOnAfterWakeup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventWithStream:startDate:endDate:value:", v9, v10, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setupNotificationEligiblityPeriod
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_219056000, a2, a3, "Setup eligibleForNotification = %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)recordFirstWakeup:(id)a3
{
  if (a3)
    -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", a3, 1);
}

- (BOOL)isInternalBuild
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)MGCopyAnswer();
  v3 = v2;
  v4 = (const void *)*MEMORY[0x24BDBD270];
  if (v2)
    CFRelease(v2);
  return v4 == v3;
}

- (BOOL)isUINotificationEnabledForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  void *v19;
  char v20;
  id v22[5];

  v22[4] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  objc_msgSend(v5, "synchronize");
  objc_msgSend(MEMORY[0x24BE1AFC8], "instrumentationChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor isUINotificationEnabledForKey:].cold.5();

  objc_msgSend(v5, "objectForKey:", CFSTR("DKCFirstWakeUINotification"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_11;
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v12, v7, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22[0];
  if (v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor isUINotificationEnabledForKey:].cold.3();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[_DKUserIsFirstBacklightOnAfterWakeupMonitor isUINotificationEnabledForKey:].cold.2();

  }
  else
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[_DKUserIsFirstBacklightOnAfterWakeupMonitor isUINotificationEnabledForKey:].cold.1((uint64_t)self, v16);

    if (!v13)
      goto LABEL_16;
  }
  objc_msgSend(v13, "objectForKey:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
  {
LABEL_16:
    v20 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v13, "objectForKey:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

LABEL_17:
  return v20;
}

- (void)setUINotificationEligibility
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_219056000, v0, v1, "UI-Notifications for FirstBackLightAfterWakeup enabled\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)setInternalSettingsChangedNotficationHandler
{
  void *v3;
  const char *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  if (-[_DKUserIsFirstBacklightOnAfterWakeupMonitor isInternalBuild](self, "isInternalBuild"))
  {
    objc_initWeak(&location, self);
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __91___DKUserIsFirstBacklightOnAfterWakeupMonitor_setInternalSettingsChangedNotficationHandler__block_invoke;
    v9 = &unk_24DA66EA0;
    objc_copyWeak(&v10, &location);
    v3 = (void *)MEMORY[0x219A29428](&v6);
    v4 = (const char *)objc_msgSend(CFSTR("com.apple.CoreDuet.UINotificationsettingsChanged"), "UTF8String", v6, v7, v8, v9);
    -[_DKMonitor queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch(v4, &self->internalSettingChangedNotificationToken, v5, v3);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (BOOL)eligibleForFirstWakeUINotification
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  -[_DKMonitor currentEvent](self, "currentEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");
    objc_msgSend(MEMORY[0x24BE1B048], "yes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == objc_msgSend(v6, "integerValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)convertUTCToLocalTimeString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD1500];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("LLL d, yyyy - HH:mm:ss"));
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getNextSWUpdatePrediction
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v3 = objc_alloc_init(MEMORY[0x24BE1AFD8]);
  objc_msgSend(v3, "getUnlockAndSoftwareUpdateTimes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor getNextSWUpdatePrediction].cold.2(v4, v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "objectForKey:", CFSTR("su_start"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor convertUTCToLocalTimeString:](self, "convertUTCToLocalTimeString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("start_time"));

  objc_msgSend(v4, "objectForKey:", CFSTR("su_end"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor convertUTCToLocalTimeString:](self, "convertUTCToLocalTimeString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("end_time"));

  objc_msgSend(v4, "objectForKey:", CFSTR("unlock_start"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor convertUTCToLocalTimeString:](self, "convertUTCToLocalTimeString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("unlock_time"));

  objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor getNextSWUpdatePrediction].cold.1(v6, v13);

  return v6;
}

- (void)showUINotification:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  id v14;

  v3 = a3;
  dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66___DKUserIsFirstBacklightOnAfterWakeupMonitor_showUINotification___block_invoke;
  v10[3] = &unk_24DA66D10;
  v11 = v3;
  v6 = v10;
  v7 = v3;
  v8 = (void *)os_transaction_create();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_24DA66E28;
  v13 = v8;
  v14 = v6;
  v9 = v8;
  dispatch_async(v4, block);

}

- (void)showSoftwareUpdateUINotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor getNextSWUpdatePrediction](self, "getNextSWUpdatePrediction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "objectForKey:", CFSTR("start_time"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("end_time"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("unlock_time"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n%@ - %@\n %@ - %@\n %@ - %@\n\n %@"), CFSTR("Duet detected an opportunity for software update\n"), CFSTR("Update Start:"), v4, CFSTR("Update End:"), v5, CFSTR("Last Unlock:"), v6, CFSTR("Is this a good time for automatic software update to occur tonight?\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("alert_title"), v7, CFSTR("alert_msg"), CFSTR("Yes"), CFSTR("alert_option_one"), CFSTR("No"), CFSTR("alert_option_two"), CFSTR("Duet - Auto Software Update Prediction"), CFSTR("response_alert_title"), CFSTR("Please file a radar under component Duet | all"), CFSTR("response_alert_msg"), 0);
  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor showUINotification:](self, "showUINotification:", v8);

}

- (void)showFirstWakeupUINotification
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("alert_title"), CFSTR("Was this your first unlock of the day after waking up?\n\n [Internal Only - provided by CoreDuet]"), CFSTR("alert_msg"), CFSTR("Yes"), CFSTR("alert_option_one"), CFSTR("No"), CFSTR("alert_option_two"), CFSTR("First unlock after wakeup"), CFSTR("response_alert_title"), CFSTR("Please file a radar under component DuetExpertCenter | Magic Moments"), CFSTR("response_alert_msg"), 0);
  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor showUINotification:](self, "showUINotification:", v3);

}

- (void)handleBacklightTurnedOffEvent
{
  NSObject *v3;
  id v4;

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor firstWakeupEventWithValue:](self, "firstWakeupEventWithValue:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor recordFirstWakeup:](self, "recordFirstWakeup:", v4);

}

- (void)handleBacklightTurnedOnEvent
{
  NSObject *v3;
  id v4;

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor firstWakeupEventWithValue:](self, "firstWakeupEventWithValue:", -[_DKUserIsFirstBacklightOnAfterWakeupMonitor isFirstBacklightOn](self, "isFirstBacklightOn"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor recordFirstWakeup:](self, "recordFirstWakeup:", v4);

}

- (void)handleScreenUnlockEvent
{
  NSObject *v3;
  id v4;

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor firstWakeupEventWithValue:](self, "firstWakeupEventWithValue:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_DKUserIsFirstBacklightOnAfterWakeupMonitor eligibleForFirstWakeUINotification](self, "eligibleForFirstWakeUINotification"))
  {
    if (-[_DKUserIsFirstBacklightOnAfterWakeupMonitor SoftwareUpdateUINotificationEnabled](self, "SoftwareUpdateUINotificationEnabled"))
    {
      -[_DKUserIsFirstBacklightOnAfterWakeupMonitor showSoftwareUpdateUINotification](self, "showSoftwareUpdateUINotification");
    }
    if (-[_DKUserIsFirstBacklightOnAfterWakeupMonitor FirstWakeUINotificationEnabled](self, "FirstWakeUINotificationEnabled"))
    {
      -[_DKUserIsFirstBacklightOnAfterWakeupMonitor showFirstWakeupUINotification](self, "showFirstWakeupUINotification");
    }
  }
  -[_DKUserIsFirstBacklightOnAfterWakeupMonitor recordFirstWakeup:](self, "recordFirstWakeup:", v4);

}

- (void)registerHandleBacklightEvents
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = dispatch_queue_create("com.apple.coreduetd.firstBacklightHandler", v4);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke;
  v7[3] = &unk_24DA66E50;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v6 = (void *)MEMORY[0x219A29428](v7);
  notify_register_dispatch((const char *)objc_msgSend(CFSTR("com.apple.iokit.hid.displayStatus"), "UTF8String"), &self->displayStatusNotifyToken, v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)unregisterHandleBacklightEvents
{
  int displayStatusNotifyToken;

  displayStatusNotifyToken = self->displayStatusNotifyToken;
  if (displayStatusNotifyToken)
  {
    notify_cancel(displayStatusNotifyToken);
    self->displayStatusNotifyToken = 0;
  }
}

+ (id)fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(MEMORY[0x24BE1B130], "deviceIsLockedStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchMostRecentPastEventForStream:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  objc_msgSend(MEMORY[0x24BE1B048], "yes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v6 == v8)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[_DKUserIsFirstBacklightOnAfterWakeupMonitor fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked].cold.1();
  }
  else
  {
    if (!v4
      || (objc_msgSend(v4, "endDate"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(MEMORY[0x24BDBCE60], "date"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v10, "compare:", v11),
          v11,
          v10,
          v12 != 1))
    {
      v13 = v4;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[_DKUserIsFirstBacklightOnAfterWakeupMonitor fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked].cold.2();
  }

  v13 = 0;
LABEL_10:

  return v13;
}

- (BOOL)didQualifyingScreenLockEndInEligibilityPeriod
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  double v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  void *v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x24BE1B0F8];
  -[NSDateInterval startDate](self->eligibleForNotification, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->eligibleForNotification, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForEventsWithEndInDateRangeFrom:to:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(MEMORY[0x24BE1B048], "yes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForEventsWithCategoryValue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x24BE1B088]);
  v12 = (void *)MEMORY[0x24BDD14C0];
  v36[0] = v7;
  v36[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v14);

  objc_msgSend(MEMORY[0x24BE1B130], "deviceIsLockedStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEventStreams:", v16);

  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v18);

  objc_msgSend(v11, "setResultType:", 2);
  objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v19, "executeQuery:error:", v11, &v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v32;

  if (v21)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[_DKUserIsFirstBacklightOnAfterWakeupMonitor didQualifyingScreenLockEndInEligibilityPeriod].cold.1();
    LOBYTE(v23) = 0;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = v20;
    v23 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "duration", (_QWORD)v28);
          if (v26 > 14400.0)
          {
            LOBYTE(v23) = 1;
            goto LABEL_15;
          }
        }
        v23 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v23)
          continue;
        break;
      }
    }
  }
LABEL_15:

  return v23;
}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKUserIsFirstBacklightOnAfterWakeupMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v3, sel_instantMonitorNeedsActivation))
  {
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor setupNotificationEligiblityPeriod](self, "setupNotificationEligiblityPeriod");
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor registerHandleBacklightEvents](self, "registerHandleBacklightEvents");
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor setInternalSettingsChangedNotficationHandler](self, "setInternalSettingsChangedNotficationHandler");
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor setUINotificationEligibility](self, "setUINotificationEligibility");
    self->_enabled = 1;
  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKUserIsFirstBacklightOnAfterWakeupMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  if (self->displayStatusNotifyToken)
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor unregisterHandleBacklightEvents](self, "unregisterHandleBacklightEvents");
  self->_enabled = 0;
}

- (BOOL)FirstWakeUINotificationEnabled
{
  return self->_FirstWakeUINotificationEnabled;
}

- (void)setFirstWakeUINotificationEnabled:(BOOL)a3
{
  self->_FirstWakeUINotificationEnabled = a3;
}

- (BOOL)SoftwareUpdateUINotificationEnabled
{
  return self->_SoftwareUpdateUINotificationEnabled;
}

- (void)setSoftwareUpdateUINotificationEnabled:(BOOL)a3
{
  self->_SoftwareUpdateUINotificationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eligibleForNotification, 0);
}

+ (void)fetchMostRecentPastEventForStream:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_219056000, v2, v3, "Error querying for event in stream %@ : %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)isUINotificationEnabledForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_219056000, a2, v5, "[%@] : no known state.", v6);

  OUTLINED_FUNCTION_3();
}

- (void)isUINotificationEnabledForKey:.cold.2()
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

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_219056000, v2, v3, "[%@]: last state is %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)isUINotificationEnabledForKey:.cold.3()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_219056000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error unarchiving state: %@", v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)isUINotificationEnabledForKey:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_219056000, a3, (uint64_t)a3, "Incompatible state type: %@", (uint8_t *)a2);

}

- (void)isUINotificationEnabledForKey:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_219056000, v0, v1, "isUINotificationEnabledForKey defaults did synchronize.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)getNextSWUpdatePrediction
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_219056000, a2, v4, "Software update SPI returned %@\n", v5);

  OUTLINED_FUNCTION_3();
}

+ (void)fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_219056000, v0, v1, "most recent event in the DB is in future. Skipping over event = %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)didQualifyingScreenLockEndInEligibilityPeriod
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_219056000, v0, v1, "Error querying for lock events : %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
