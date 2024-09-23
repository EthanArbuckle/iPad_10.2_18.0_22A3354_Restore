@implementation HDHealthAppDailyAnalyticsEvent

- (HDHealthAppDailyAnalyticsEvent)initWithProfile:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  HDHealthAppDailyAnalyticsEvent *v8;

  v4 = (objc_class *)MEMORY[0x24BDBCF50];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x24BDD45F0]);
  v8 = -[HDHealthAppDailyAnalyticsEvent initWithProfile:userDefaults:](self, "initWithProfile:userDefaults:", v5, v7);

  return v8;
}

- (HDHealthAppDailyAnalyticsEvent)initWithProfile:(id)a3 userDefaults:(id)a4
{
  id v6;
  id v7;
  HDHealthAppDailyAnalyticsEvent *v8;
  HDHealthAppDailyAnalyticsEvent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDHealthAppDailyAnalyticsEvent;
  v8 = -[HDHealthAppDailyAnalyticsEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
  }

  return v9;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.HealthApp.daily");
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL8 v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;

  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDHealthAppDailyAnalyticsEvent _approximateDaysSinceLastAppOpen](self, "_approximateDaysSinceLastAppOpen"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("daysSinceLastAppOpen"));

  -[HDHealthAppDailyAnalyticsEvent _isHealthAppOnboardedString](self, "_isHealthAppOnboardedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("isOnboarded"));

  -[HDHealthAppDailyAnalyticsEvent _welcomeFlowCompletedDate](self, "_welcomeFlowCompletedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v11;
  if (v11)
  {
    objc_msgSend(v11, "timeIntervalSinceNow");
    LODWORD(v13) = vcvtmd_s64_f64(v12 / -604800.0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDHealthAppDailyAnalyticsEvent _floorInteger:toSignificantFigures:](self, "_floorInteger:toSignificantFigures:", v13, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("weeksSinceOnboarded"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_250E836E8, CFSTR("weeksSinceOnboarded"));
  }
  -[HDHealthAppDailyAnalyticsEvent _supportsSecureContainer](self, "_supportsSecureContainer");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("supportsSecureContainer"));
  objc_msgSend(v7, "environmentDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activePairedDeviceProductType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDD27A8]);

  objc_msgSend(v7, "environmentDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activePairedDeviceOSBuildNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDD27A0]);

  -[HDHealthAppDailyAnalyticsEvent _deviceContextStoreManager](self, "_deviceContextStoreManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberOfDeviceContextsPerDeviceType:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v42);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BDD27C8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BDD27D8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BDD27E0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v27);
  v41 = (void *)v15;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BDD27D0]);

  v29 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "environmentDataSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberWithBool:", objc_msgSend(v30, "isImproveHealthAndActivityEnabled"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BDD27E8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HDHealthAppDailyAnalyticsEvent _areHealthAppNotificationsAuthorized](self, "_areHealthAppNotificationsAuthorized"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BDD27B8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HDHealthAppDailyAnalyticsEvent _areTrendNotificationsEnabled](self, "_areTrendNotificationsEnabled"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, CFSTR("hasTrendsNotification"));

  v34 = (void *)MEMORY[0x24BDD16E0];
  -[HDHealthAppDailyAnalyticsEvent _cloudSyncManager](self, "_cloudSyncManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "numberWithBool:", objc_msgSend(v35, "canPerformCloudSyncWithError:", 0));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v36, CFSTR("cloudSyncEnabled"));

  v37 = (void *)MEMORY[0x24BDD16E0];
  v38 = -[HDHealthAppDailyAnalyticsEvent _isTimeInDaylightEnabledForDataSource:](self, "_isTimeInDaylightEnabledForDataSource:", v7);

  objc_msgSend(v37, "numberWithBool:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, CFSTR("timeInDaylightEnabled"));

  return v8;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "healthDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "biologicalSexWithError:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HKAnalyticsPropertyValueForBiologicalSex();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD27C0]);

  objc_msgSend(v6, "environmentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "healthDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "ageWithCurrentDate:error:", v12, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD27B0]);

  return v7;
}

- (int64_t)_approximateDaysSinceLastAppOpen
{
  void *v2;
  void *v3;
  double v4;
  int64_t v5;

  -[NSUserDefaults hk_dateForKey:](self->_userDefaults, "hk_dateForKey:", *MEMORY[0x24BDD45F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    v5 = vcvtmd_s64_f64(v4 / -86400.0);
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (id)_supportsSecureContainer
{
  id WeakRetained;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[5];
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  if (WeakRetained)
  {
    v4 = dispatch_semaphore_create(0);
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__0;
    v31 = __Block_byref_object_dispose__0;
    v32 = 0;
    -[HDHealthAppDailyAnalyticsEvent _cloudSyncManager](self, "_cloudSyncManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __58__HDHealthAppDailyAnalyticsEvent__supportsSecureContainer__block_invoke;
    v24[3] = &unk_250E7E5D0;
    v24[4] = self;
    v6 = v4;
    v25 = v6;
    v26 = &v27;
    objc_msgSend(v5, "accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion:", v24);

    v7 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x24BDD3070];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
        -[HDHealthAppDailyAnalyticsEvent _supportsSecureContainer].cold.2((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
      v15 = 0;
    }
    else
    {
      v15 = (id)v28[5];
    }

    _Block_object_dispose(&v27, 8);
    return v15;
  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      -[HDHealthAppDailyAnalyticsEvent _supportsSecureContainer].cold.1((uint64_t)self, v16, v17, v18, v19, v20, v21, v22);
    return 0;
  }
}

void __58__HDHealthAppDailyAnalyticsEvent__supportsSecureContainer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __58__HDHealthAppDailyAnalyticsEvent__supportsSecureContainer__block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)_isHealthAppOnboardedString
{
  void *v3;
  int v4;
  id *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isiPad");
  v5 = (id *)MEMORY[0x24BDD45D8];
  if (!v4)
    v5 = (id *)MEMORY[0x24BDD45E0];
  v6 = *v5;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
    v9 = CFSTR("false");
    if (v8 > 0)
      v9 = CFSTR("true");
    v10 = v9;
  }
  else
  {
    v10 = CFSTR("nil");
  }

  return v10;
}

- (BOOL)_areHealthAppNotificationsAuthorized
{
  void *v2;
  void *v3;

  -[HDHealthAppDailyAnalyticsEvent _userNotificationCenter](self, "_userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "authorizationStatus") == 2;
  return (char)v2;
}

- (BOOL)_areTrendNotificationsEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD3E38], "primaryProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HealthSharingPreferences_%@_Notifications_%@"), v5, CFSTR("significantChanges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", v6);

  return (char)self;
}

- (id)_welcomeFlowCompletedDate
{
  return (id)-[NSUserDefaults hk_dateForKey:](self->_userDefaults, "hk_dateForKey:", CFSTR("HealthPluginHost.HealthWelcomeFlow.CompletionDate"));
}

- (int64_t)_floorInteger:(int)a3 toSignificantFigures:(int)a4
{
  int v6;
  double v7;
  double v8;

  if (!a3)
    return 0;
  if (a3 >= 0)
    v6 = a3;
  else
    v6 = -a3;
  v7 = log10((double)v6);
  v8 = __exp10((double)(int)(a4 - vcvtpd_s64_f64(v7)));
  return (uint64_t)((double)(uint64_t)floor(v8 * (double)a3) / v8);
}

- (BOOL)_isTimeInDaylightEnabledForDataSource:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCF50]);
  v5 = (void *)objc_msgSend(v4, "initWithSuiteName:", *MEMORY[0x24BDD46C0]);
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD46C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    objc_msgSend(v3, "environmentDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activePairedDeviceProductType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10 != 0;

  }
  return v8;
}

- (id)_cloudSyncManager
{
  HDCloudSyncManager **p_unitTest_cloudSyncManager;
  id WeakRetained;
  void *v5;
  id v6;

  p_unitTest_cloudSyncManager = &self->_unitTest_cloudSyncManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_unitTest_cloudSyncManager);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_unitTest_cloudSyncManager);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v6, "cloudSyncManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_deviceContextStoreManager
{
  HDDeviceContextStoreManager **p_unitTest_deviceContextStoreManager;
  id WeakRetained;
  void *v5;
  id v6;

  p_unitTest_deviceContextStoreManager = &self->_unitTest_deviceContextStoreManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_unitTest_deviceContextStoreManager);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_unitTest_deviceContextStoreManager);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v6, "deviceContextManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_userNotificationCenter
{
  UNUserNotificationCenter **p_unitTest_userNotificationCenter;
  id WeakRetained;
  id v4;
  id v5;

  p_unitTest_userNotificationCenter = &self->_unitTest_userNotificationCenter;
  WeakRetained = objc_loadWeakRetained((id *)&self->_unitTest_userNotificationCenter);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_unitTest_userNotificationCenter);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDF88B8]);
    v4 = (id)objc_msgSend(v5, "initWithBundleIdentifier:", *MEMORY[0x24BDD4608]);
  }
  return v4;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HDCloudSyncManager)unitTest_cloudSyncManager
{
  return (HDCloudSyncManager *)objc_loadWeakRetained((id *)&self->_unitTest_cloudSyncManager);
}

- (void)setUnitTest_cloudSyncManager:(id)a3
{
  objc_storeWeak((id *)&self->_unitTest_cloudSyncManager, a3);
}

- (HDDeviceContextStoreManager)unitTest_deviceContextStoreManager
{
  return (HDDeviceContextStoreManager *)objc_loadWeakRetained((id *)&self->_unitTest_deviceContextStoreManager);
}

- (void)setUnitTest_deviceContextStoreManager:(id)a3
{
  objc_storeWeak((id *)&self->_unitTest_deviceContextStoreManager, a3);
}

- (UNUserNotificationCenter)unitTest_userNotificationCenter
{
  return (UNUserNotificationCenter *)objc_loadWeakRetained((id *)&self->_unitTest_userNotificationCenter);
}

- (void)setUnitTest_userNotificationCenter:(id)a3
{
  objc_storeWeak((id *)&self->_unitTest_userNotificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unitTest_userNotificationCenter);
  objc_destroyWeak((id *)&self->_unitTest_deviceContextStoreManager);
  objc_destroyWeak((id *)&self->_unitTest_cloudSyncManager);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_supportsSecureContainer
{
  OUTLINED_FUNCTION_0_0(&dword_23DB70000, a2, a3, "%{public}@: Timed out attempting to get secure container status.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __58__HDHealthAppDailyAnalyticsEvent__supportsSecureContainer__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_23DB70000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get secure container status with error %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
