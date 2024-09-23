@implementation WDProfile

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (WDProfile)initWithHealthStore:(id)a3
{
  id v4;
  WDProfile *v5;
  WDProfile *v6;
  HKHealthStore *v7;
  HKHealthStore *healthStore;
  uint64_t v9;
  HKHealthRecordsStore *healthRecordsStore;
  uint64_t v11;
  HKDisplayTypeController *displayTypeController;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  HKUnitPreferenceController *unitController;
  uint64_t v18;
  HKUnitPreferenceController *v19;
  uint64_t v20;
  HKManualEntryValidationController *v21;
  HKManualEntryValidationController *manualEntryValidationController;
  WDUserDefaults *v23;
  WDUserDefaults *userDefaults;
  WDSourceOrderController *v25;
  WDSourceOrderController *sourceOrderController;
  HKSelectedTimeScopeController *v27;
  HKSelectedTimeScopeController *selectedTimeScopeController;
  id v29;
  void *v30;
  uint64_t v31;
  HKDateCache *dateCache;
  uint64_t v33;
  HKSampleTypeUpdateController *updateController;
  uint64_t v35;
  HKChartDataCacheController *dataCacheController;
  WDUserActivityManager *v37;
  WDUserActivityManager *userActivityManager;
  HKUCUMUnitDisplayConverter *v39;
  HKUCUMUnitDisplayConverter *ucumDisplayConverter;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)WDProfile;
  v5 = -[WDProfile init](&v42, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      v7 = (HKHealthStore *)v4;
    }
    else
    {
      -[WDProfile _createHealthStore](v5, "_createHealthStore");
      v7 = (HKHealthStore *)objc_claimAutoreleasedReturnValue();
    }
    healthStore = v6->_healthStore;
    v6->_healthStore = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3C28]), "initWithHealthStore:", v6->_healthStore);
    healthRecordsStore = v6->_healthRecordsStore;
    v6->_healthRecordsStore = (HKHealthRecordsStore *)v9;

    objc_msgSend(MEMORY[0x24BE4A5D8], "sharedInstanceForHealthStore:", v6->_healthStore);
    v11 = objc_claimAutoreleasedReturnValue();
    displayTypeController = v6->_displayTypeController;
    v6->_displayTypeController = (HKDisplayTypeController *)v11;

    -[HKHealthStore profileIdentifier](v6->_healthStore, "profileIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "type") == 3)
    {

    }
    else
    {
      -[HKHealthStore profileIdentifier](v6->_healthStore, "profileIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "type");

      if (v15 != 2)
      {
        v20 = objc_msgSend(objc_alloc(MEMORY[0x24BE4A910]), "initWithHealthStore:", v6->_healthStore);
        unitController = v6->_unitController;
        v6->_unitController = (HKUnitPreferenceController *)v20;
        goto LABEL_10;
      }
    }
    v16 = objc_alloc(MEMORY[0x24BE4A910]);
    unitController = (HKUnitPreferenceController *)objc_alloc_init(MEMORY[0x24BDD3C40]);
    v18 = objc_msgSend(v16, "initWithHealthStore:", unitController);
    v19 = v6->_unitController;
    v6->_unitController = (HKUnitPreferenceController *)v18;

LABEL_10:
    v21 = (HKManualEntryValidationController *)objc_alloc_init(MEMORY[0x24BE4A6E8]);
    manualEntryValidationController = v6->_manualEntryValidationController;
    v6->_manualEntryValidationController = v21;

    v23 = -[WDUserDefaults initWithHealthStore:]([WDUserDefaults alloc], "initWithHealthStore:", v6->_healthStore);
    userDefaults = v6->_userDefaults;
    v6->_userDefaults = v23;

    v25 = -[WDSourceOrderController initWithHealthStore:]([WDSourceOrderController alloc], "initWithHealthStore:", v6->_healthStore);
    sourceOrderController = v6->_sourceOrderController;
    v6->_sourceOrderController = v25;

    v27 = (HKSelectedTimeScopeController *)objc_alloc_init(MEMORY[0x24BE4A830]);
    selectedTimeScopeController = v6->_selectedTimeScopeController;
    v6->_selectedTimeScopeController = v27;

    v29 = objc_alloc(MEMORY[0x24BE4A5A8]);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "initWithCalendar:", v30);
    dateCache = v6->_dateCache;
    v6->_dateCache = (HKDateCache *)v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x24BE4A828]), "initWithHealthStore:", v6->_healthStore);
    updateController = v6->_updateController;
    v6->_updateController = (HKSampleTypeUpdateController *)v33;

    v35 = objc_msgSend(objc_alloc(MEMORY[0x24BE4A300]), "initWithHealthStore:unitController:updateController:", v6->_healthStore, v6->_unitController, v6->_updateController);
    dataCacheController = v6->_dataCacheController;
    v6->_dataCacheController = (HKChartDataCacheController *)v35;

    v37 = objc_alloc_init(WDUserActivityManager);
    userActivityManager = v6->_userActivityManager;
    v6->_userActivityManager = v37;

    v39 = (HKUCUMUnitDisplayConverter *)objc_alloc_init(MEMORY[0x24BDD4040]);
    ucumDisplayConverter = v6->_ucumDisplayConverter;
    v6->_ucumDisplayConverter = v39;

  }
  return v6;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (WDProfile)init
{
  return -[WDProfile initWithHealthStore:](self, "initWithHealthStore:", 0);
}

- (WDNotificationManager)notificationManager
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  WDNotificationManager *notificationManager;
  WDNotificationManager *v8;
  void *v9;
  WDNotificationManager *v10;
  WDNotificationManager *v11;
  WDNotificationManager *v12;
  NSObject *v13;

  -[WDProfile healthStore](self, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3C48], "primaryStoreIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    notificationManager = self->_notificationManager;
    if (!notificationManager)
    {
      v8 = [WDNotificationManager alloc];
      -[WDProfile healthStore](self, "healthStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WDNotificationManager initWithHealthStore:](v8, "initWithHealthStore:", v9);
      v11 = self->_notificationManager;
      self->_notificationManager = v10;

      notificationManager = self->_notificationManager;
    }
    v12 = notificationManager;
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_FAULT))
      -[WDProfile notificationManager].cold.1(v13);
    v12 = 0;
  }
  return v12;
}

- (id)_createHealthStore
{
  void *v2;
  void *v3;
  os_log_t *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("HealthProfileIdentifierKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (os_log_t *)MEMORY[0x24BDD2FE8];
  if (!v3)
    goto LABEL_6;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v3);
  if (!v5)
    goto LABEL_6;
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDD3E38], "_profileWithUUID:type:", v5, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v8 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v7, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v10;
    _os_log_impl(&dword_215814000, v9, OS_LOG_TYPE_DEFAULT, "WDProfile: Using healthstore for profile: %@", (uint8_t *)&v14, 0xCu);

  }
  v11 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  objc_msgSend(v11, "setProfileIdentifier:", v7);
  objc_msgSend(v11, "resume");

  if (!v11)
  {
LABEL_6:
    _HKInitializeLogging();
    v12 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
      -[WDProfile _createHealthStore].cold.1(v12);
    v11 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  }

  return v11;
}

- (NSString)presentationContext
{
  return (NSString *)CFSTR("App");
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache
{
  return (_HKWheelchairUseCharacteristicCache *)-[HKDisplayTypeController wheelchairUseCharacteristicCache](self->_displayTypeController, "wheelchairUseCharacteristicCache");
}

- (HKSampleTypeDateRangeController)sampleTypeDateRangeController
{
  os_unfair_lock_s *p_lock;
  HKSampleTypeDateRangeController *sampleTypeDateRangeController;
  HKSampleTypeDateRangeController *v5;
  HKSampleTypeDateRangeController *v6;
  HKSampleTypeDateRangeController *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sampleTypeDateRangeController = self->_sampleTypeDateRangeController;
  if (!sampleTypeDateRangeController)
  {
    v5 = (HKSampleTypeDateRangeController *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A820]), "initWithHealthStore:", self->_healthStore);
    v6 = self->_sampleTypeDateRangeController;
    self->_sampleTypeDateRangeController = v5;

    sampleTypeDateRangeController = self->_sampleTypeDateRangeController;
  }
  v7 = sampleTypeDateRangeController;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (HKManualEntryValidationController)manualEntryValidationController
{
  return self->_manualEntryValidationController;
}

- (HKUCUMUnitDisplayConverter)ucumDisplayConverter
{
  return self->_ucumDisplayConverter;
}

- (HKChartDataCacheController)dataCacheController
{
  return self->_dataCacheController;
}

- (HKSelectedTimeScopeController)selectedTimeScopeController
{
  return self->_selectedTimeScopeController;
}

- (HKSampleTypeUpdateController)updateController
{
  return self->_updateController;
}

- (WDSourceOrderController)sourceOrderController
{
  return self->_sourceOrderController;
}

- (WDUserActivityManager)userActivityManager
{
  return self->_userActivityManager;
}

- (WDUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_userActivityManager, 0);
  objc_storeStrong((id *)&self->_sourceOrderController, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_selectedTimeScopeController, 0);
  objc_storeStrong((id *)&self->_dataCacheController, 0);
  objc_storeStrong((id *)&self->_ucumDisplayConverter, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_manualEntryValidationController, 0);
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_sampleTypeDateRangeController, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
}

- (void)notificationManager
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_215814000, log, OS_LOG_TYPE_FAULT, "Notification manager should only be bounded to the primary health store", v1, 2u);
}

- (void)_createHealthStore
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215814000, log, OS_LOG_TYPE_DEBUG, "WDProfile: Using default healthstore", v1, 2u);
}

@end
