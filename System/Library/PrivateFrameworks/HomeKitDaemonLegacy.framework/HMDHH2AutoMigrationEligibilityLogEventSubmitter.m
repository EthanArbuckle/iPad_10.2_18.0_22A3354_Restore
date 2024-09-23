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
      -[NSUserDefaults setBool:forKey:](v12->_userDefaults, "setBool:forKey:", 1, CFSTR("HMDHH2AutoMigrationRunOnCurrentBuildStartedOnHH1Key"));
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

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDHH2AutoMigrationEligibilityLogEventSubmitter *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__HMDHH2AutoMigrationEligibilityLogEventSubmitter_didReceiveEventFromDispatcher___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)submitHH2AutoMigrationEligibilityStatus
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHH2AutoMigrationEligibilityLogEventSubmitter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)runDailyTask
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HMDHH2AutoMigrationEligibilityLogEventSubmitter_runDailyTask__block_invoke;
  block[3] = &unk_1E89C2730;
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

void __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  uint64_t v10;
  HMDHH2AutoMigrationEligibilityStatusLogEvent *v11;
  HMDHH2AutoMigrationEligibilityStatusLogEvent *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[4];
  NSObject *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  objc_msgSend(*(id *)(a1 + 32), "eligibilityStatusDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hh2AutoMigrationEligibilityChecker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__171167;
    v37 = __Block_byref_object_dispose__171168;
    v5 = MEMORY[0x1E0C809B0];
    v38 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke_6;
    v30[3] = &unk_1E89BEA88;
    v32 = &v33;
    v6 = v4;
    v31 = v6;
    objc_msgSend(v3, "fetchIsCurrentUserEligibleForAutoMigrationWithCompletion:", v30);
    dispatch_group_enter(v6);
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__171167;
    v28 = __Block_byref_object_dispose__171168;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__171167;
    v22 = __Block_byref_object_dispose__171168;
    v23 = 0;
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke_2;
    v14[3] = &unk_1E89BEAB0;
    v16 = &v24;
    v17 = &v18;
    v7 = v6;
    v15 = v7;
    objc_msgSend(v3, "fetchIsCurrentUserEligibleForMigrationByOwnerWithCompletion:", v14);
    v8 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "userDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("HMDHH2AutoMigrationRunOnCurrentBuildFlagKey"));

    v11 = [HMDHH2AutoMigrationEligibilityStatusLogEvent alloc];
    v12 = -[HMDHH2AutoMigrationEligibilityStatusLogEvent initWithAutoMigrationEligibilityResult:migrationByOwnerManualEligibilityResult:migrationByOwnerAutoEligibilityResult:didRunMigrationTaskOnCurrentBuild:currentBuildStartedOnHH1:](v11, "initWithAutoMigrationEligibilityResult:migrationByOwnerManualEligibilityResult:migrationByOwnerAutoEligibilityResult:didRunMigrationTaskOnCurrentBuild:currentBuildStartedOnHH1:", v34[5], v25[5], v19[5], v10, 1);
    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitLogEvent:", v12);

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v33, 8);
  }

}

void __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke_6(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __81__HMDHH2AutoMigrationEligibilityLogEventSubmitter_didReceiveEventFromDispatcher___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v8 = v3;

  v4 = v8;
  if (v8)
  {
    objc_msgSend(v8, "activityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.homed.hh2.auto.migration"));

    v4 = v8;
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "userDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBool:forKey:", 1, CFSTR("HMDHH2AutoMigrationRunOnCurrentBuildFlagKey"));

      v4 = v8;
    }
  }

}

@end
