@implementation HAENotificationCenterManager

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global);
  return (id)sharedInstance_instance;
}

void __46__HAENotificationCenterManager_sharedInstance__block_invoke()
{
  HAENotificationCenterManager *v0;
  void *v1;

  v0 = objc_alloc_init(HAENotificationCenterManager);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (HAENotificationCenterManager)init
{
  HAENotificationCenterManager *v2;
  NotificationCenter *v3;
  NotificationCenter *notificationCenter;
  dispatch_queue_t v5;
  OS_dispatch_queue *eventQueue;
  void *v7;
  double v8;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *sem;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HAENotificationCenterManager;
  v2 = -[HAENotificationCenterManager init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NotificationCenter);
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    v5 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.coreaudio.adam.hae.notification"), "UTF8String"), 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v5;

    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getLiveMonitoringThreshold");
    v2->_liveThresholdInDBA = v8;

    v9 = dispatch_semaphore_create(0);
    sem = v2->_sem;
    v2->_sem = (OS_dispatch_semaphore *)v9;

  }
  return v2;
}

- (id)addHAENotificationEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *eventQueue;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  HAENotificationCenterManager *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HAENotificationsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "HAENotificationCenterManager starting event: [%@]", buf, 0xCu);

  }
  HAENotificationsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  HAENotificationsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    objc_msgSend(v4, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_signpost_emit_with_name_impl(&dword_2144B3000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AddHAENotificationEvent", "%@", buf, 0xCu);

  }
  eventQueue = self->_eventQueue;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __56__HAENotificationCenterManager_addHAENotificationEvent___block_invoke;
  v21 = &unk_24D19F1B8;
  v13 = v4;
  v22 = v13;
  v23 = self;
  dispatch_sync(eventQueue, &v18);
  HAENotificationsLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    objc_msgSend(v13, "uuid", v18, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v16;
    _os_signpost_emit_with_name_impl(&dword_2144B3000, v15, OS_SIGNPOST_INTERVAL_END, v8, "AddHAENotificationEvent", "%@", buf, 0xCu);

  }
  -[HAENotificationCenterManager donateSignalToTipsKit:](self, "donateSignalToTipsKit:", v13);

  return 0;
}

void __56__HAENotificationCenterManager_addHAENotificationEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  +[HAENSystemSoundPlayer sharedInstance](HAENSystemSoundPlayer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__HAENotificationCenterManager_addHAENotificationEvent___block_invoke_2;
  v9[3] = &unk_24D19F190;
  v10 = v3;
  v4 = (id)objc_msgSend(v2, "playSystemSoundWithEvent:completion:", v10, v9);

  +[HAENVolumeControl sharedInstance](HAENVolumeControl, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "limitVolume:", *(_QWORD *)(a1 + 32));

  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "sendBannerNotificationWithEvent:volumeLoweringAction:", *(_QWORD *)(a1 + 32), v6);
  +[HAENStatistics sharedInstance](HAENStatistics, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processStatsForEvent:", *(_QWORD *)(a1 + 32));

}

void __56__HAENotificationCenterManager_addHAENotificationEvent___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  os_signpost_id_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  HAENotificationsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_signpost_emit_with_name_impl(&dword_2144B3000, v2, OS_SIGNPOST_INTERVAL_END, v4, "HAENSSPlayed", "%@", (uint8_t *)&v7, 0xCu);

  }
  HAENotificationsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2144B3000, v6, OS_LOG_TYPE_DEFAULT, "finished playing system sound...", (uint8_t *)&v7, 2u);
  }

}

- (id)sendBannerNotificationWithEvent:(id)a3 volumeLoweringAction:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HAENotificationsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_2144B3000, v7, OS_LOG_TYPE_DEFAULT, "HAENotificationCenterManager sendBannerNotificationWithEvent [%@]", (uint8_t *)&v13, 0xCu);

  }
  if (objc_msgSend(v6, "eventType") == 1818850917)
  {
    -[HAENotificationCenterManager sendLiveExposureEvent:volumeLoweringAction:](self, "sendLiveExposureEvent:volumeLoweringAction:", v6, v4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "eventType") == 2003133803)
  {
    -[HAENotificationCenterManager sendWeeklyExposureEvent:volumeLoweringAction:](self, "sendWeeklyExposureEvent:volumeLoweringAction:", v6, v4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HAENotificationsLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HAENotificationCenterManager sendBannerNotificationWithEvent:volumeLoweringAction:].cold.1(v6, v10);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HAENotficiationsError"), *(_QWORD *)"pyt!", 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;

  return v11;
}

- (id)sendLiveExposureEvent:(id)a3 volumeLoweringAction:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  NSObject *v10;
  double liveThresholdInDBA;
  void *v12;
  NotificationCenter *notificationCenter;
  double v14;
  double v15;
  void *v16;
  double v17;
  int v19;
  double v20;
  uint64_t v21;

  v4 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HAENotificationsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = *(double *)&v8;
    _os_log_impl(&dword_2144B3000, v7, OS_LOG_TYPE_DEFAULT, "HAENotificationCenterManager sendLiveExposureEvent [%@]", (uint8_t *)&v19, 0xCu);

  }
  objc_msgSend(v6, "level");
  if (v9 >= self->_liveThresholdInDBA + -2.22044605e-16)
  {
    notificationCenter = self->_notificationCenter;
    objc_msgSend(v6, "level");
    v15 = v14;
    objc_msgSend(v6, "dateInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "duration");
    -[NotificationCenter sendNotificationWithExposureLevel:duration:eventType:volumeLoweringAction:](notificationCenter, "sendNotificationWithExposureLevel:duration:eventType:volumeLoweringAction:", 1818850917, v4, v15, v17);

    v12 = 0;
  }
  else
  {
    HAENotificationsLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      liveThresholdInDBA = self->_liveThresholdInDBA;
      v19 = 134217984;
      v20 = liveThresholdInDBA;
      _os_log_impl(&dword_2144B3000, v10, OS_LOG_TYPE_INFO, "live exposure level did not reach threshold %.2f", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HAENotficiationsError"), *(_QWORD *)"lbel", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)sendWeeklyExposureEvent:(id)a3 volumeLoweringAction:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  NotificationCenter *notificationCenter;
  double v10;
  double v11;
  void *v12;
  double v13;
  int v15;
  void *v16;
  uint64_t v17;

  v4 = *(_QWORD *)&a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HAENotificationsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_2144B3000, v7, OS_LOG_TYPE_DEFAULT, "HAENotificationCenterManager sendWeeklyExposureEvent [%@]", (uint8_t *)&v15, 0xCu);

  }
  notificationCenter = self->_notificationCenter;
  objc_msgSend(v6, "level");
  v11 = v10;
  objc_msgSend(v6, "dateInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "duration");
  -[NotificationCenter sendNotificationWithExposureLevel:duration:eventType:volumeLoweringAction:](notificationCenter, "sendNotificationWithExposureLevel:duration:eventType:volumeLoweringAction:", 2003133803, v4, v11, v13);

  return 0;
}

- (void)donateSignalToTipsKit:(id)a3
{
  int v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;

  v3 = objc_msgSend(a3, "eventType");
  if (v3 == 1818850917)
  {
    v4 = CFSTR("com.apple.coreaudio.hae.notifications.loud");
    goto LABEL_5;
  }
  if (v3 == 2003133803)
  {
    v4 = CFSTR("com.apple.coreaudio.hae.notifications.weekly");
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE0CDB8], "discoverabilitySignal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CB78]), "initWithIdentifier:bundleID:context:", v4, v10, 0);
    objc_msgSend(v7, "sendEvent:", v8);

    return;
  }
  HAENotificationsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[HAENotificationCenterManager donateSignalToTipsKit:].cold.1(v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

- (void)sendBannerNotificationWithEvent:(void *)a1 volumeLoweringAction:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "eventType");
  _os_log_error_impl(&dword_2144B3000, a2, OS_LOG_TYPE_ERROR, "Unknown event type %u", (uint8_t *)v3, 8u);
}

- (void)donateSignalToTipsKit:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144B3000, log, OS_LOG_TYPE_ERROR, "unknown event type", v1, 2u);
}

@end
