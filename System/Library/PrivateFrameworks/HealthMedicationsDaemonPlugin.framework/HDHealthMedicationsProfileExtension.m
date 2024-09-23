@implementation HDHealthMedicationsProfileExtension

- (HDHealthMedicationsProfileExtension)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDHealthMedicationsProfileExtension)initWithProfile:(id)a3
{
  id v4;
  HDHealthMedicationsProfileExtension *v5;
  HDHealthMedicationsProfileExtension *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDHealthMedicationsProfileExtension;
  v5 = -[HDHealthMedicationsProfileExtension init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    _HKInitializeLogging();
    HKLogMedication();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      objc_msgSend(v4, "profileType");
      HKStringFromProfileType();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B815E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded for profileType %{public}@", buf, 0x16u);

    }
  }

  return v6;
}

- (void)start
{
  NSUserDefaults *v3;
  NSUserDefaults *medicationUserDefaults;
  HDMedicationScheduleManager *v5;
  id WeakRetained;
  HDMedicationScheduleManager *v7;
  HDMedicationScheduleManager *medicationScheduleManager;
  HDMedicationDataDonator *v9;
  HDMedicationDataDonator *medicationsDataDonator;
  HDMedicationNotificationSyncManager *v11;
  HDMedicationNotificationSyncManager *medicationNotificationSyncManager;
  HDMedicationDoseEventObserver *v13;
  id v14;
  HDMedicationDoseEventObserver *v15;
  HDMedicationDoseEventObserver *medicationDoseEventObserver;
  HDMedicationPregnancyLactationStatusObserver *v17;
  id v18;
  HDMedicationPregnancyLactationStatusObserver *v19;
  HDMedicationPregnancyLactationStatusObserver *medicationPregnancyLactationStatusObserver;
  HDMedicationPregnancyListConceptObserver *v21;
  id v22;
  HDMedicationPregnancyListConceptObserver *v23;
  HDMedicationPregnancyListConceptObserver *medicationPregnancyListConceptObserver;
  HDMedicationSyncRequester *v25;
  HDMedicationSyncRequester *medicationSyncRequester;
  HDMedicationsDeviceScopedStorageManager *v27;
  id v28;
  HDMedicationsDeviceScopedStorageManager *v29;
  HDMedicationsDeviceScopedStorageManager *deviceScopedStorageManager;
  id v31;
  void *v32;
  void *v33;
  int v34;
  HDMedicationsWidgetSchedulingManager *v35;
  id v36;
  HDMedicationsWidgetSchedulingManager *v37;
  HDMedicationsWidgetSchedulingManager *widgetSchedulingManager;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  HDAnalyticsDailyEventManager *v44;
  HDAnalyticsDailyEventManager *medicationDailyAnalyticsManager;
  id v46;

  -[HDHealthMedicationsProfileExtension createMedicationUserDefaults](self, "createMedicationUserDefaults");
  v3 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue();
  medicationUserDefaults = self->_medicationUserDefaults;
  self->_medicationUserDefaults = v3;

  v5 = [HDMedicationScheduleManager alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = -[HDMedicationScheduleManager initWithProfile:userDefaults:](v5, "initWithProfile:userDefaults:", WeakRetained, self->_medicationUserDefaults);
  medicationScheduleManager = self->_medicationScheduleManager;
  self->_medicationScheduleManager = v7;

  v9 = -[HDMedicationDataDonator initWithProfile:]([HDMedicationDataDonator alloc], "initWithProfile:", self);
  medicationsDataDonator = self->_medicationsDataDonator;
  self->_medicationsDataDonator = v9;

  -[HDHealthMedicationsProfileExtension createMedicationNotificationSyncManager](self, "createMedicationNotificationSyncManager");
  v11 = (HDMedicationNotificationSyncManager *)objc_claimAutoreleasedReturnValue();
  medicationNotificationSyncManager = self->_medicationNotificationSyncManager;
  self->_medicationNotificationSyncManager = v11;

  v13 = [HDMedicationDoseEventObserver alloc];
  v14 = objc_loadWeakRetained((id *)&self->_profile);
  v15 = -[HDMedicationDoseEventObserver initWithProfile:notificationSyncManager:](v13, "initWithProfile:notificationSyncManager:", v14, self->_medicationNotificationSyncManager);
  medicationDoseEventObserver = self->_medicationDoseEventObserver;
  self->_medicationDoseEventObserver = v15;

  v17 = [HDMedicationPregnancyLactationStatusObserver alloc];
  v18 = objc_loadWeakRetained((id *)&self->_profile);
  v19 = -[HDMedicationPregnancyLactationStatusObserver initWithProfile:](v17, "initWithProfile:", v18);
  medicationPregnancyLactationStatusObserver = self->_medicationPregnancyLactationStatusObserver;
  self->_medicationPregnancyLactationStatusObserver = v19;

  v21 = [HDMedicationPregnancyListConceptObserver alloc];
  v22 = objc_loadWeakRetained((id *)&self->_profile);
  v23 = -[HDMedicationPregnancyListConceptObserver initWithProfile:](v21, "initWithProfile:", v22);
  medicationPregnancyListConceptObserver = self->_medicationPregnancyListConceptObserver;
  self->_medicationPregnancyListConceptObserver = v23;

  v25 = -[HDMedicationSyncRequester initWithProfileExtension:]([HDMedicationSyncRequester alloc], "initWithProfileExtension:", self);
  medicationSyncRequester = self->_medicationSyncRequester;
  self->_medicationSyncRequester = v25;

  v27 = [HDMedicationsDeviceScopedStorageManager alloc];
  v28 = objc_loadWeakRetained((id *)&self->_profile);
  v29 = -[HDMedicationsDeviceScopedStorageManager initWithProfile:](v27, "initWithProfile:", v28);
  deviceScopedStorageManager = self->_deviceScopedStorageManager;
  self->_deviceScopedStorageManager = v29;

  v31 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v31, "daemon");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "behavior");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "hkmd_supportsMedicationsWidget");

  if (v34)
  {
    v35 = [HDMedicationsWidgetSchedulingManager alloc];
    v36 = objc_loadWeakRetained((id *)&self->_profile);
    v37 = -[HDMedicationsWidgetSchedulingManager initWithProfile:](v35, "initWithProfile:", v36);
    widgetSchedulingManager = self->_widgetSchedulingManager;
    self->_widgetSchedulingManager = v37;

  }
  HKLogMedication();
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc(MEMORY[0x1E0CB62B8]);
  v40 = objc_loadWeakRetained((id *)&self->_profile);
  v41 = (void *)objc_msgSend(v39, "initWithLoggingCategory:healthDataSource:", v46, v40);

  v42 = objc_alloc(MEMORY[0x1E0D29410]);
  v43 = objc_loadWeakRetained((id *)&self->_profile);
  v44 = (HDAnalyticsDailyEventManager *)objc_msgSend(v42, "initWithProfile:eventSubmissionManager:logCategory:eventConstructor:", v43, v41, v46, &__block_literal_global_13);
  medicationDailyAnalyticsManager = self->_medicationDailyAnalyticsManager;
  self->_medicationDailyAnalyticsManager = v44;

}

HDMedicationDailyAnalyticsEvent *__44__HDHealthMedicationsProfileExtension_start__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDMedicationDailyAnalyticsEvent *v3;

  v2 = a2;
  v3 = -[HDMedicationDailyAnalyticsEvent initWithProfile:]([HDMedicationDailyAnalyticsEvent alloc], "initWithProfile:", v2);

  return v3;
}

- (id)createMedicationUserDefaults
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  return (id)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0D2C388]);
}

- (id)createMedicationNotificationSyncManager
{
  return -[HDMedicationNotificationSyncManager initWithProfileExtension:]([HDMedicationNotificationSyncManager alloc], "initWithProfileExtension:", self);
}

- (id)createMedicationsDonatorWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D42BD0], "donatorWithItemType:originAppId:error:", 19, CFSTR("Health"), a3);
}

- (id)createMedicationsWidgetTimelineController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDMedicationsWidgetSchedulingManager defaultMedicationsWidgetTimelineControllerForProfile:](HDMedicationsWidgetSchedulingManager, "defaultMedicationsWidgetTimelineControllerForProfile:", WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createMedicationsWidgetRelevanceController
{
  return +[HDMedicationsWidgetSchedulingManager defaultMedicationsWidgetRelevanceController](HDMedicationsWidgetSchedulingManager, "defaultMedicationsWidgetRelevanceController");
}

- (HDPrimaryProfile)profile
{
  return (HDPrimaryProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (NSUserDefaults)medicationUserDefaults
{
  return self->_medicationUserDefaults;
}

- (HDMedicationNotificationSyncManager)medicationNotificationSyncManager
{
  return self->_medicationNotificationSyncManager;
}

- (HDMedicationScheduleManager)medicationScheduleManager
{
  return self->_medicationScheduleManager;
}

- (HDMedicationDoseEventObserver)medicationDoseEventObserver
{
  return self->_medicationDoseEventObserver;
}

- (HDMedicationSyncRequester)medicationSyncRequester
{
  return self->_medicationSyncRequester;
}

- (HDMedicationsDeviceScopedStorageManager)deviceScopedStorageManager
{
  return self->_deviceScopedStorageManager;
}

- (HDMedicationsWidgetSchedulingManager)widgetSchedulingManager
{
  return self->_widgetSchedulingManager;
}

- (HDMedicationPregnancyLactationStatusObserver)medicationPregnancyLactationStatusObserver
{
  return self->_medicationPregnancyLactationStatusObserver;
}

- (HDMedicationPregnancyListConceptObserver)medicationPregnancyListConceptObserver
{
  return self->_medicationPregnancyListConceptObserver;
}

- (HDMedicationDataDonator)medicationsDataDonator
{
  return self->_medicationsDataDonator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicationsDataDonator, 0);
  objc_storeStrong((id *)&self->_medicationPregnancyListConceptObserver, 0);
  objc_storeStrong((id *)&self->_medicationPregnancyLactationStatusObserver, 0);
  objc_storeStrong((id *)&self->_widgetSchedulingManager, 0);
  objc_storeStrong((id *)&self->_deviceScopedStorageManager, 0);
  objc_storeStrong((id *)&self->_medicationSyncRequester, 0);
  objc_storeStrong((id *)&self->_medicationDoseEventObserver, 0);
  objc_storeStrong((id *)&self->_medicationScheduleManager, 0);
  objc_storeStrong((id *)&self->_medicationNotificationSyncManager, 0);
  objc_storeStrong((id *)&self->_medicationUserDefaults, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_medicationDailyAnalyticsManager, 0);
}

@end
