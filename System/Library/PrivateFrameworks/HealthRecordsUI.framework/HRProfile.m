@implementation HRProfile

- (HRProfile)initWithHealthStore:(id)a3 profileIdentifier:(id)a4
{
  id v7;
  id v8;
  HRProfile *v9;
  HRProfile *v10;
  id *p_healthStore;
  void *v12;
  char v13;
  uint64_t v14;
  HKHealthRecordsStore *healthRecordsStore;
  uint64_t v16;
  HKClinicalAccountStore *clinicalAccountStore;
  uint64_t v18;
  HKClinicalIngestionStore *ingestionStore;
  WDClinicalSourcesDataProvider *v20;
  WDClinicalSourcesDataProvider *clinicalSourcesDataProvider;
  uint64_t v22;
  HKSampleTypeUpdateController *updateController;
  id v24;
  void *v25;
  uint64_t v26;
  HKDateCache *dateCache;
  UTCDateFormatter *v28;
  UTCDateFormatter *utcDateFormatter;
  HKUCUMUnitDisplayConverter *v30;
  HKUCUMUnitDisplayConverter *ucumDisplayConverter;
  WDClinicalOnboardingManager *v32;
  WDClinicalOnboardingManager *onboardingManager;
  HRHealthRecordsMigrator *v34;
  HRHealthRecordsMigrator *migrator;
  NSObject *v36;
  uint8_t v38[16];
  objc_super v39;

  v7 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)HRProfile;
  v9 = -[HRProfile init](&v39, sel_init);
  v10 = v9;
  if (v9)
  {
    p_healthStore = (id *)&v9->_healthStore;
    objc_storeStrong((id *)&v9->_healthStore, a3);
    if (v8)
    {
      objc_msgSend(*p_healthStore, "profileIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v8);

      if ((v13 & 1) == 0)
      {
        objc_msgSend(*p_healthStore, "setProfileIdentifier:", v8);
        objc_msgSend(*p_healthStore, "resume");
      }
    }
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6768]), "initWithHealthStore:", v10->_healthStore);
    healthRecordsStore = v10->_healthRecordsStore;
    v10->_healthRecordsStore = (HKHealthRecordsStore *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D2EE98]), "initWithHealthStore:", v10->_healthStore);
    clinicalAccountStore = v10->_clinicalAccountStore;
    v10->_clinicalAccountStore = (HKClinicalAccountStore *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D2EEB8]), "initWithHealthStore:", v10->_healthStore);
    ingestionStore = v10->_ingestionStore;
    v10->_ingestionStore = (HKClinicalIngestionStore *)v18;

    v20 = -[WDClinicalSourcesDataProvider initWithHealthRecordsStore:]([WDClinicalSourcesDataProvider alloc], "initWithHealthRecordsStore:", v10->_healthRecordsStore);
    clinicalSourcesDataProvider = v10->_clinicalSourcesDataProvider;
    v10->_clinicalSourcesDataProvider = v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D2F838]), "initWithHealthStore:", v10->_healthStore);
    updateController = v10->_updateController;
    v10->_updateController = (HKSampleTypeUpdateController *)v22;

    v24 = objc_alloc(MEMORY[0x1E0D2F6D8]);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "initWithCalendar:", v25);
    dateCache = v10->_dateCache;
    v10->_dateCache = (HKDateCache *)v26;

    v28 = -[UTCDateFormatter initWithDateCache:]([UTCDateFormatter alloc], "initWithDateCache:", v10->_dateCache);
    utcDateFormatter = v10->_utcDateFormatter;
    v10->_utcDateFormatter = v28;

    v30 = (HKUCUMUnitDisplayConverter *)objc_alloc_init(MEMORY[0x1E0CB6CC8]);
    ucumDisplayConverter = v10->_ucumDisplayConverter;
    v10->_ucumDisplayConverter = v30;

    v32 = -[WDClinicalOnboardingManager initWithProfile:]([WDClinicalOnboardingManager alloc], "initWithProfile:", v10);
    onboardingManager = v10->_onboardingManager;
    v10->_onboardingManager = v32;

    v34 = -[HRHealthRecordsMigrator initWithHealthStore:]([HRHealthRecordsMigrator alloc], "initWithHealthStore:", v10->_healthStore);
    migrator = v10->_migrator;
    v10->_migrator = v34;

    _HKInitializeLogging();
    v36 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_1BC30A000, v36, OS_LOG_TYPE_INFO, "Health Records migration started.", v38, 2u);
    }
    -[HRHealthRecordsMigrator migrateIfNeededWithCompletion:](v10->_migrator, "migrateIfNeededWithCompletion:", &__block_literal_global_6);
  }

  return v10;
}

void __51__HRProfile_initWithHealthStore_profileIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52D8];
  v4 = *MEMORY[0x1E0CB52D8];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__HRProfile_initWithHealthStore_profileIdentifier___block_invoke_cold_1((uint64_t)v2, v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BC30A000, v3, OS_LOG_TYPE_INFO, "Health Records migration completed successfully.", v5, 2u);
  }

}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HRProfile healthStore](self, "healthStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HRProfile *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HRProfile *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HRProfile healthStore](v4, "healthStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "profileIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRProfile healthStore](self, "healthStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "profileIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)_initWithHealthStore:(id)a3
{
  return -[HRProfile initWithHealthStore:profileIdentifier:](self, "initWithHealthStore:profileIdentifier:", a3, 0);
}

+ (id)userProfileWithProfileIdentifier:(id)a3
{
  id v3;
  HRProfile *v4;
  id v5;
  HRProfile *v6;

  v3 = a3;
  v4 = [HRProfile alloc];
  v5 = objc_alloc_init(MEMORY[0x1E0CB6780]);
  v6 = -[HRProfile initWithHealthStore:profileIdentifier:](v4, "initWithHealthStore:profileIdentifier:", v5, v3);

  return v6;
}

- (HRWDUserActivityManager)userActivityManager
{
  return 0;
}

- (HKConceptStore)conceptStore
{
  HRProfile *v2;
  HKConceptStore *conceptStore;
  id v4;
  void *v5;
  uint64_t v6;
  HKConceptStore *v7;
  HKConceptStore *v8;

  v2 = self;
  objc_sync_enter(v2);
  conceptStore = v2->_conceptStore;
  if (!conceptStore)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB64D0]);
    -[HRProfile healthStore](v2, "healthStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithHealthStore:", v5);
    v7 = v2->_conceptStore;
    v2->_conceptStore = (HKConceptStore *)v6;

    conceptStore = v2->_conceptStore;
  }
  v8 = conceptStore;
  objc_sync_exit(v2);

  return v8;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (HKClinicalAccountStore)clinicalAccountStore
{
  return self->_clinicalAccountStore;
}

- (HKClinicalIngestionStore)ingestionStore
{
  return self->_ingestionStore;
}

- (HKUCUMUnitDisplayConverter)ucumDisplayConverter
{
  return self->_ucumDisplayConverter;
}

- (WDClinicalSourcesDataProvider)clinicalSourcesDataProvider
{
  return self->_clinicalSourcesDataProvider;
}

- (HKSampleTypeUpdateController)updateController
{
  return self->_updateController;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (UTCDateFormatter)utcDateFormatter
{
  return self->_utcDateFormatter;
}

- (WDClinicalSampleAccountsLoader)clinicalSampleAccountsLoader
{
  return (WDClinicalSampleAccountsLoader *)objc_loadWeakRetained((id *)&self->_clinicalSampleAccountsLoader);
}

- (void)setClinicalSampleAccountsLoader:(id)a3
{
  objc_storeWeak((id *)&self->_clinicalSampleAccountsLoader, a3);
}

- (WDClinicalOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_destroyWeak((id *)&self->_clinicalSampleAccountsLoader);
  objc_storeStrong((id *)&self->_utcDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_clinicalSourcesDataProvider, 0);
  objc_storeStrong((id *)&self->_ucumDisplayConverter, 0);
  objc_storeStrong((id *)&self->_ingestionStore, 0);
  objc_storeStrong((id *)&self->_clinicalAccountStore, 0);
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_conceptStore, 0);
}

void __51__HRProfile_initWithHealthStore_profileIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BC30A000, a2, OS_LOG_TYPE_ERROR, "Health Records migration failed: %@.", (uint8_t *)&v2, 0xCu);
}

@end
