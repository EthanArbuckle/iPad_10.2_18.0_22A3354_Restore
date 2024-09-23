@implementation HMDHH2AutoMigrationEligibilityLogEventSubmitter

- (HMDHH2AutoMigrationEligibilityLogEventSubmitter)initWithEligibilityStatusDataSource:(id)a3 analyzerDataSource:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDHH2AutoMigrationEligibilityLogEventSubmitter *v11;
  HMDHH2AutoMigrationEligibilityLogEventSubmitter *v12;
  uint64_t v13;
  HMMLogEventSubmitting *logEventSubmitter;
  uint64_t v15;
  NSUserDefaults *userDefaults;
  uint64_t v17;
  HMMDateProvider *dateProvider;
  void *v19;
  void *v20;
  char v21;
  NSUserDefaults *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMDHH2AutoMigrationEligibilityLogEventSubmitter;
  v11 = -[HMDHH2AutoMigrationEligibilityLogEventSubmitter init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_eligibilityStatusDataSource, v8);
    objc_msgSend(v9, "logEventSubmitter");
    v13 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v12->_logEventSubmitter;
    v12->_logEventSubmitter = (HMMLogEventSubmitting *)v13;

    objc_msgSend(v9, "userDefaults");
    v15 = objc_claimAutoreleasedReturnValue();
    userDefaults = v12->_userDefaults;
    v12->_userDefaults = (NSUserDefaults *)v15;

    objc_msgSend(v9, "dateProvider");
    v17 = objc_claimAutoreleasedReturnValue();
    dateProvider = v12->_dateProvider;
    v12->_dateProvider = (HMMDateProvider *)v17;

    objc_storeStrong((id *)&v12->_workQueue, a5);
    -[NSUserDefaults stringForKey:](v12->_userDefaults, "stringForKey:", CFSTR("HMDHH2AutoMigrationRunOnCurrentBuildSoftwareVersionKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19
      || (objc_msgSend(v9, "currentSoftwareVersion"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v19, "isEqualToString:", v20),
          v20,
          (v21 & 1) == 0))
    {
      v22 = v12->_userDefaults;
      objc_msgSend(v9, "currentSoftwareVersion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](v22, "setObject:forKey:", v23, CFSTR("HMDHH2AutoMigrationRunOnCurrentBuildSoftwareVersionKey"));

      -[NSUserDefaults setBool:forKey:](v12->_userDefaults, "setBool:forKey:", 0, CFSTR("HMDHH2AutoMigrationRunOnCurrentBuildFlagKey"));
      -[NSUserDefaults setBool:forKey:](v12->_userDefaults, "setBool:forKey:", 0, CFSTR("HMDHH2AutoMigrationRunOnCurrentBuildStartedOnHH1Key"));
    }
    objc_msgSend(v9, "logEventDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:forEventClass:", v12, objc_opt_class());

    objc_msgSend(v9, "dailyScheduler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "registerDailyTaskRunner:", v12);

  }
  return v12;
}

- (void)submitHH2AutoMigrationEligibilityStatus
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  HMDHH2AutoMigrationEligibilityStatusLogEvent *v7;
  void *v8;
  HMDHH2AutoMigrationEligibilityResult *v9;

  v9 = -[HMDHH2AutoMigrationEligibilityResult initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:]([HMDHH2AutoMigrationEligibilityResult alloc], "initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:", 2048, 0, 0, 0, 0, 0, 0);
  -[HMDHH2AutoMigrationEligibilityLogEventSubmitter userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("HMDHH2AutoMigrationRunOnCurrentBuildFlagKey"));

  -[HMDHH2AutoMigrationEligibilityLogEventSubmitter userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("HMDHH2AutoMigrationRunOnCurrentBuildStartedOnHH1Key"));

  v7 = -[HMDHH2AutoMigrationEligibilityStatusLogEvent initWithAutoMigrationEligibilityResult:migrationByOwnerManualEligibilityResult:migrationByOwnerAutoEligibilityResult:didRunMigrationTaskOnCurrentBuild:currentBuildStartedOnHH1:]([HMDHH2AutoMigrationEligibilityStatusLogEvent alloc], "initWithAutoMigrationEligibilityResult:migrationByOwnerManualEligibilityResult:migrationByOwnerAutoEligibilityResult:didRunMigrationTaskOnCurrentBuild:currentBuildStartedOnHH1:", v9, v9, v9, v4, v6);
  -[HMDHH2AutoMigrationEligibilityLogEventSubmitter logEventSubmitter](self, "logEventSubmitter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitLogEvent:", v7);

}

- (void)runDailyTask
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDHH2AutoMigrationEligibilityLogEventSubmitter_runDailyTask__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDHH2AutoMigrationEligibilityLogEventSubmitterDataSource)eligibilityStatusDataSource
{
  return (HMDHH2AutoMigrationEligibilityLogEventSubmitterDataSource *)objc_loadWeakRetained((id *)&self->_eligibilityStatusDataSource);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_eligibilityStatusDataSource);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __63__HMDHH2AutoMigrationEligibilityLogEventSubmitter_runDailyTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "submitHH2AutoMigrationEligibilityStatus");
}

@end
