@implementation HeartRateStore

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_0);
  return (id)sharedStore_store;
}

void __29__HeartRateStore_sharedStore__block_invoke()
{
  HeartRateStore *v0;
  void *v1;

  v0 = objc_alloc_init(HeartRateStore);
  v1 = (void *)sharedStore_store;
  sharedStore_store = (uint64_t)v0;

}

- (HeartRateStore)init
{
  HeartRateStore *v2;
  HeartRateStore *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  HeartRateStore *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HeartRateStore;
  v2 = -[HeartRateStore init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HeartRateStore _updateHeartRateEnabled](v2, "_updateHeartRateEnabled");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_heartRateEnabledPreferenceChangeNotification, CFSTR("NanoLifestylePrivacyEnableHeartRateNotification"), 0, CFNotificationSuspensionBehaviorDrop);
    v5 = v3;
  }

  return v3;
}

- (void)recentHeartRateWithCompletion:(id)a3
{
  void (**v4)(id, unint64_t);
  double v5;
  unint64_t recentHeartRate;
  void (**v7)(id, unint64_t);
  void (**v8)(id, unint64_t);

  v4 = (void (**)(id, unint64_t))a3;
  if (v4)
  {
    v8 = v4;
    v5 = CFAbsoluteTimeGetCurrent() - self->_recentHeartRateTime;
    recentHeartRate = 85;
    if (self->_heartRateEnabled)
    {
      v7 = v8;
      if (v5 <= 660.0)
        recentHeartRate = self->_recentHeartRate;
    }
    else
    {
      v7 = v8;
    }
    v7[2](v7, recentHeartRate);
    v4 = v8;
    if (self->_heartRateEnabled && v5 > 660.0 && !self->_heartRateQuery)
    {
      -[HeartRateStore _updateHeartRateWithCompletion:](self, "_updateHeartRateWithCompletion:", v8);
      v4 = v8;
    }
  }

}

- (void)_updateHeartRateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HKQuery *v14;
  HKQuery *heartRateQuery;
  HKHealthStore *healthStore;
  HKHealthStore *v17;
  HKHealthStore *v18;
  HKHealthStore *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  _QWORD v28[3];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_heartRateEnabled && objc_msgSend(MEMORY[0x24BDD3C40], "isHealthDataAvailable"))
  {
    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke;
    v24[3] = &unk_24F6E6D88;
    objc_copyWeak(&v26, &location);
    v25 = v4;
    v5 = (void *)MEMORY[0x22E2FF82C](v24);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -660.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %@"), *MEMORY[0x24BDD32E8], v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDD35B8];
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD35B8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3710], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDD3F00]);
    v28[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (HKQuery *)objc_msgSend(v12, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v10, v8, 1, v13, v5);
    heartRateQuery = self->_heartRateQuery;
    self->_heartRateQuery = v14;

    healthStore = self->_healthStore;
    if (healthStore)
    {
      -[HKHealthStore executeQuery:](healthStore, "executeQuery:", self->_heartRateQuery);
    }
    else
    {
      v17 = (HKHealthStore *)objc_alloc_init(MEMORY[0x24BDD3C40]);
      v18 = self->_healthStore;
      self->_healthStore = v17;

      v19 = self->_healthStore;
      v20 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithObject:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke_3;
      v23[3] = &unk_24F6E6DB0;
      v23[4] = self;
      -[HKHealthStore requestAuthorizationToShareTypes:readTypes:completion:](v19, "requestAuthorizationToShareTypes:readTypes:completion:", 0, v22, v23);

    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

void __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke_2;
    block[3] = &unk_24F6E6D60;
    v7 = v4;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    v8 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v9);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setHeartRateQuery:", 0);

  }
}

void __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "quantity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", CFSTR("count/min"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = (uint64_t)v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setRecentHeartRate:", v5);

  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v11, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "setRecentHeartRateTime:");

  v9 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v9, "setHeartRateQuery:", 0);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v5);

}

uint64_t __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "executeQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)_updateHeartRateEnabled
{
  int AppBooleanValue;
  char v4;
  BOOL v5;
  BOOL v6;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("EnableHeartRate"), CFSTR("com.apple.nanolifestyle.privacy"), &keyExistsAndHasValidFormat);
  v4 = objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode");
  v5 = 0;
  if ((v4 & 1) == 0)
  {
    if (keyExistsAndHasValidFormat)
      v6 = AppBooleanValue == 0;
    else
      v6 = 0;
    v5 = !v6;
  }
  self->_heartRateEnabled = v5;
}

- (HKQuery)heartRateQuery
{
  return self->_heartRateQuery;
}

- (void)setHeartRateQuery:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateQuery, a3);
}

- (unint64_t)recentHeartRate
{
  return self->_recentHeartRate;
}

- (void)setRecentHeartRate:(unint64_t)a3
{
  self->_recentHeartRate = a3;
}

- (double)recentHeartRateTime
{
  return self->_recentHeartRateTime;
}

- (void)setRecentHeartRateTime:(double)a3
{
  self->_recentHeartRateTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateQuery, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
