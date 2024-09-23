@implementation HMDLogEventBulletinNotificationsAnalyzer

- (HMDLogEventBulletinNotificationsAnalyzer)initWithDataSource:(id)a3 notificationSettingsProvider:(id)a4
{
  id v6;
  id v7;
  HMDLogEventBulletinNotificationsAnalyzer *v8;
  HMDLogEventBulletinNotificationsAnalyzer *v9;
  void *v10;
  uint64_t v11;
  HMDEventCounterGroup *aggregationEventGroup;
  void *v13;
  uint64_t v14;
  HMDEventCounterGroup *topicEventGroup;
  uint64_t v16;
  HMMLogEventSubmitting *logEventSubmitter;
  HMDCounterThresholdTTRTrigger *v18;
  void *v19;
  uint64_t v20;
  HMDCounterThresholdTTRTrigger *homeHubReachabilityTTRTrigger;
  void *v22;
  HMDCounterThresholdTTRTrigger *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  HMDCounterThresholdTTRTrigger *v27;
  void *v28;
  uint64_t v29;
  HMDCounterThresholdTTRTrigger *cameraReachabilityTTRTrigger;
  void *v31;
  HMDCounterThresholdTTRTrigger *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *);
  void *v41;
  id v42;
  id location;
  objc_super v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)HMDLogEventBulletinNotificationsAnalyzer;
  v8 = -[HMDLogEventBulletinNotificationsAnalyzer init](&v44, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationSettingsProvider, a4);
    objc_msgSend(v6, "legacyCountersManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "counterGroupForName:", CFSTR("BulletinAggregationEventGroup"));
    v11 = objc_claimAutoreleasedReturnValue();
    aggregationEventGroup = v9->_aggregationEventGroup;
    v9->_aggregationEventGroup = (HMDEventCounterGroup *)v11;

    objc_msgSend(v6, "legacyCountersManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "counterGroupForName:", CFSTR("BulletinTopicEventGroup"));
    v14 = objc_claimAutoreleasedReturnValue();
    topicEventGroup = v9->_topicEventGroup;
    v9->_topicEventGroup = (HMDEventCounterGroup *)v14;

    objc_msgSend(v6, "logEventSubmitter");
    v16 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v9->_logEventSubmitter;
    v9->_logEventSubmitter = (HMMLogEventSubmitting *)v16;

    if (isInternalBuild())
    {
      v18 = [HMDCounterThresholdTTRTrigger alloc];
      objc_msgSend(v6, "radarInitiator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HMDCounterThresholdTTRTrigger initWithThreshold:ttrCategory:radarInitiator:](v18, "initWithThreshold:ttrCategory:radarInitiator:", 20, CFSTR("Home Hub Reachability"), v19);
      homeHubReachabilityTTRTrigger = v9->_homeHubReachabilityTTRTrigger;
      v9->_homeHubReachabilityTTRTrigger = (HMDCounterThresholdTTRTrigger *)v20;

      objc_msgSend(v6, "legacyCountersManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v9->_homeHubReachabilityTTRTrigger;
      v24 = CFSTR("HomeHubReachability");
      objc_msgSend(v22, "addObserver:forEventName:requestGroup:", v23, CFSTR("HomeHubReachability"), CFSTR("BulletinTopicEventGroup"));

      objc_msgSend(v6, "cachedConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[HMDLogEventBulletinNotificationsAnalyzer cameraReachabilityThresholdFromConfiguration:](v9, "cameraReachabilityThresholdFromConfiguration:", v25);

      v27 = [HMDCounterThresholdTTRTrigger alloc];
      objc_msgSend(v6, "radarInitiator");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[HMDCounterThresholdTTRTrigger initWithThreshold:ttrCategory:radarInitiator:](v27, "initWithThreshold:ttrCategory:radarInitiator:", v26, CFSTR("Camera Reachability"), v28);
      cameraReachabilityTTRTrigger = v9->_cameraReachabilityTTRTrigger;
      v9->_cameraReachabilityTTRTrigger = (HMDCounterThresholdTTRTrigger *)v29;

      objc_msgSend(v6, "legacyCountersManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v9->_cameraReachabilityTTRTrigger;
      v33 = CFSTR("CameraReachability");
      objc_msgSend(v31, "addObserver:forEventName:requestGroup:", v32, CFSTR("CameraReachability"), CFSTR("BulletinTopicEventGroup"));

      objc_initWeak(&location, v9);
      v38 = MEMORY[0x1E0C809B0];
      v39 = 3221225472;
      v40 = __92__HMDLogEventBulletinNotificationsAnalyzer_initWithDataSource_notificationSettingsProvider___block_invoke;
      v41 = &unk_1E89A8428;
      objc_copyWeak(&v42, &location);
      objc_msgSend(v6, "addConfigurationChangedObserver:", &v38);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v6, "logEventDispatcher", v38, v39, v40, v41);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:forEventClasses:", v9, v35);

    objc_msgSend(v6, "dailyScheduler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "registerDailyTaskRunner:", v9);

  }
  return v9;
}

- (void)configurationChanged:(id)a3
{
  int64_t v4;
  id v5;

  v4 = -[HMDLogEventBulletinNotificationsAnalyzer cameraReachabilityThresholdFromConfiguration:](self, "cameraReachabilityThresholdFromConfiguration:", a3);
  -[HMDLogEventBulletinNotificationsAnalyzer cameraReachabilityTTRTrigger](self, "cameraReachabilityTTRTrigger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTargetThreshold:", v4);

}

- (int64_t)cameraReachabilityThresholdFromConfiguration:(id)a3
{
  int64_t v3;

  v3 = 30 * objc_msgSend(a3, "totalCameraAccessoriesRecordingEnabled");
  if (v3 <= 45)
    v3 = 45;
  if ((unint64_t)v3 >= 0xC8)
    return 200;
  else
    return v3;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v9;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDLogEventBulletinNotificationsAnalyzer aggregationEventGroup](self, "aggregationEventGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incrementEventCounterForEventName:", CFSTR("BulletinTotalCount"));

    -[HMDLogEventBulletinNotificationsAnalyzer topicEventGroup](self, "topicEventGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "incrementEventCounterForEventName:", v8);

  }
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMDLogEventBulletinNotificationsAnalyzer aggregationEventGroup](self, "aggregationEventGroup");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "fetchEventCounterForEventName:forDate:", CFSTR("BulletinTotalCount"), v6);

  objc_msgSend(v7, "setBulletinNotificationsPostedCount:", v8);
}

- (void)resetAggregationAnalysisContext
{
  id v2;

  -[HMDLogEventBulletinNotificationsAnalyzer aggregationEventGroup](self, "aggregationEventGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetEventCounters");

}

- (void)runDailyTask
{
  void *v3;
  _QWORD v4[5];

  -[HMDLogEventBulletinNotificationsAnalyzer notificationSettingsProvider](self, "notificationSettingsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__HMDLogEventBulletinNotificationsAnalyzer_runDailyTask__block_invoke;
  v4[3] = &unk_1E89A8450;
  v4[4] = self;
  objc_msgSend(v3, "notificationSettingsWithCompletionHandler:", v4);

}

- (HMDUserNotificationCenterSettingsProviding)notificationSettingsProvider
{
  return self->_notificationSettingsProvider;
}

- (HMDEventCounterGroup)aggregationEventGroup
{
  return self->_aggregationEventGroup;
}

- (HMDEventCounterGroup)topicEventGroup
{
  return self->_topicEventGroup;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDCounterThresholdTTRTrigger)homeHubReachabilityTTRTrigger
{
  return self->_homeHubReachabilityTTRTrigger;
}

- (HMDCounterThresholdTTRTrigger)cameraReachabilityTTRTrigger
{
  return self->_cameraReachabilityTTRTrigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraReachabilityTTRTrigger, 0);
  objc_storeStrong((id *)&self->_homeHubReachabilityTTRTrigger, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_topicEventGroup, 0);
  objc_storeStrong((id *)&self->_aggregationEventGroup, 0);
  objc_storeStrong((id *)&self->_notificationSettingsProvider, 0);
}

void __56__HMDLogEventBulletinNotificationsAnalyzer_runDailyTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HMDBulletinNotificationDailyTotalLogEvent *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDBulletinNotificationDailyTotalLogEvent *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "topicEventGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "summedEventCounters");

  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBulletinNotificationDailyTotalLogEvent initWithTopic:countForTopic:userNotificationSettings:]([HMDBulletinNotificationDailyTotalLogEvent alloc], "initWithTopic:countForTopic:userNotificationSettings:", CFSTR("AllTopics"), v5, v3);
  objc_msgSend(v6, "submitLogEvent:", v7);

  objc_msgSend(*(id *)(a1 + 32), "topicEventGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventCounters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedIntegerValue");

        objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[HMDBulletinNotificationDailyTotalLogEvent initWithTopic:countForTopic:userNotificationSettings:]([HMDBulletinNotificationDailyTotalLogEvent alloc], "initWithTopic:countForTopic:userNotificationSettings:", v15, v17, v3);
        objc_msgSend(v18, "submitLogEvent:", v19);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(*(id *)(a1 + 32), "topicEventGroup");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resetEventCounters");

}

void __92__HMDLogEventBulletinNotificationsAnalyzer_initWithDataSource_notificationSettingsProvider___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "configurationChanged:", v3);

}

+ (id)managedEventCounterRequestGroups
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("BulletinAggregationEventGroup");
  v3[1] = CFSTR("BulletinTopicEventGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
