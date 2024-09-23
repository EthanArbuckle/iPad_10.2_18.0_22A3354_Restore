@implementation HDHRCardioFitnessAnalyticsDailyEventActivity

- (HDHRCardioFitnessAnalyticsDailyEventActivity)initWithProfile:(id)a3
{
  id v4;
  HDHRCardioFitnessAnalyticsDailyEventActivity *v5;
  HDHRCardioFitnessAnalyticsDailyEventActivity *v6;
  double v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  HDHRCardioFitnessAnalyticsSignalSource *v10;
  uint64_t v11;
  HKHRCardioFitnessAnalyticsManager *analyticsManager;
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v13;
  HDHRCardioFitnessAnalyticsDailyEventDataSource *dataSource;
  id WeakRetained;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDHRCardioFitnessAnalyticsDailyEventActivity;
  v5 = -[HDHRCardioFitnessAnalyticsDailyEventActivity init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = (double)(uint64_t)*MEMORY[0x1E0C807C0];
    v6->_calculationPeriod = (double)(uint64_t)*MEMORY[0x1E0C807B8];
    v6->_retryPeriod = v7;
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = -[HDHRCardioFitnessAnalyticsSignalSource initWithProfile:]([HDHRCardioFitnessAnalyticsSignalSource alloc], "initWithProfile:", v4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBC8]), "initWithSignalSource:", v10);
    analyticsManager = v6->_analyticsManager;
    v6->_analyticsManager = (HKHRCardioFitnessAnalyticsManager *)v11;

    v13 = -[HDHRCardioFitnessAnalyticsDailyEventDataSource initWithProfile:]([HDHRCardioFitnessAnalyticsDailyEventDataSource alloc], "initWithProfile:", v4);
    dataSource = v6->_dataSource;
    v6->_dataSource = v13;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerDaemonReadyObserver:queue:", v6, v6->_queue);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HDAssertion invalidate](self->_preparedDatabaseAccessibilityAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDHRCardioFitnessAnalyticsDailyEventActivity;
  -[HDHRCardioFitnessAnalyticsDailyEventActivity dealloc](&v3, sel_dealloc);
}

- (void)daemonReady:(id)a3
{
  id v4;
  HDPeriodicActivity *v5;
  HDPeriodicActivity *periodicActivity;
  id v7;

  v4 = objc_alloc(MEMORY[0x1E0D29540]);
  -[HDHRCardioFitnessAnalyticsDailyEventActivity profile](self, "profile");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDHRCardioFitnessAnalyticsDailyEventActivity calculationPeriod](self, "calculationPeriod");
  v5 = (HDPeriodicActivity *)objc_msgSend(v4, "initWithProfile:name:interval:delegate:loggingCategory:", v7, CFSTR("com.apple.healthd.cardiofitness.HDHRCardioFitnessAnalyticsDailyEventActivity"), self, *MEMORY[0x1E0CB52E8]);
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v5;

}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  const char *v4;
  xpc_object_t xdict;

  v4 = (const char *)*MEMORY[0x1E0C80738];
  xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808B0], 1);

}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 0;
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v5;
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *queue;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  HDHRCardioFitnessAnalyticsDailyEventActivity *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  HDHRCardioFitnessAnalyticsDailyEventActivity *v28;
  id v29;
  _QWORD block[5];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x1E0CB52E8];
  v7 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    *(_DWORD *)buf = 138543362;
    v32 = (id)objc_opt_class();
    v9 = v32;
    _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_INFO, "[%{public}@] Received periodic activity trigger.", buf, 0xCu);

  }
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v10 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke;
  block[3] = &unk_1E87EF6F0;
  block[4] = self;
  dispatch_sync(queue, block);
  _HKInitializeLogging();
  v12 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v32 = self;
    _os_log_impl(&dword_1CC29C000, v12, OS_LOG_TYPE_INFO, "[%{public}@] maintenance operation enqueued", buf, 0xCu);
  }
  v13 = (void *)MEMORY[0x1E0D294D0];
  v23 = self;
  v24 = v10;
  v25 = 3221225472;
  v26 = __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_198;
  v27 = &unk_1E87F0558;
  v28 = self;
  v29 = v5;
  v19 = v10;
  v20 = 3221225472;
  v21 = __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_202;
  v22 = &unk_1E87EFEC8;
  v14 = v5;
  objc_msgSend(v13, "maintenanceOperationWithName:asynchronousBlock:canceledBlock:", CFSTR("HDHRCardioFitnessAnalyticsDailyEventActivity"), &v24, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "maintenanceWorkCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "enqueueMaintenanceOperation:", v15);

}

void __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v5, &v12, 300.0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1CC29C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] unable to get accessibilityAssertion before enqueing maintenance operation: %{public}@", buf, 0x16u);
    }
  }

}

void __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_198(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_INFO, "[%{public}@] maintenance operation running", buf, 0xCu);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_199;
  block[3] = &unk_1E87F0530;
  block[4] = v6;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_sync(v8, block);

}

void __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_199(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_2;
  v4[3] = &unk_1E87F0508;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_queue_submitAnalyticsWithActivityCompletion:", v4);

}

void __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_2(_QWORD *a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void (*v7)(uint64_t);
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a1[5];
  v7 = *(void (**)(uint64_t))(v6 + 16);
  v8 = a4;
  v7(v6);
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_INFO))
  {
    v10 = a1[4];
    v13 = 138543362;
    v14 = v10;
    _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_INFO, "[%{public}@] maintenance operation finished", (uint8_t *)&v13, 0xCu);
  }
  objc_msgSend(*(id *)(a1[4] + 8), "invalidate");
  v11 = a1[4];
  v12 = *(void **)(v11 + 8);
  *(_QWORD *)(v11 + 8) = 0;

  (*(void (**)(double))(a1[6] + 16))(a2);
}

void __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_202(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(void);

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = a2;
  objc_msgSend(v2, "invalidate");
  v3[2]();

}

- (void)_queue_submitAnalyticsWithActivityCompletion:(id)a3
{
  void (**v4)(id, uint64_t, void *, double);
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  os_log_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  void *v30;
  os_log_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, double))a3;
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x1E0CB52E8];
  v6 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543362;
    v39 = (id)objc_opt_class();
    v8 = v39;
    _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Attempting to send daily event.", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "deviceContextManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v10, "numberOfDeviceContextsPerDeviceType:", &v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v37;

  if (v12)
  {
    _HKInitializeLogging();
    v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v39 = v15;
      v40 = 2112;
      v41 = v12;
      v16 = v15;
      _os_log_impl(&dword_1CC29C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device contexts found with error %@", buf, 0x16u);

    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBD0]), "initWithStatus:error:", 1, v12);
  }
  else
  {
    -[HKHRCardioFitnessAnalyticsManager submitDailyEventWithSource:deviceContextsDict:](self->_analyticsManager, "submitDailyEventWithSource:deviceContextsDict:", self->_dataSource, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  v19 = objc_msgSend(v17, "status");
  switch(v19)
  {
    case 2:
      _HKInitializeLogging();
      v24 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v39 = v26;
        v27 = v26;
        _os_log_impl(&dword_1CC29C000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Should not send daily event, will ignore.", buf, 0xCu);

      }
      -[HDHRCardioFitnessAnalyticsDailyEventActivity retryPeriod](self, "retryPeriod");
      v29 = v28;
      objc_msgSend(v18, "error");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 1, v30, v29);
      goto LABEL_20;
    case 1:
      _HKInitializeLogging();
      v31 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v32 = v31;
        v33 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v39 = v33;
        v34 = v33;
        _os_log_impl(&dword_1CC29C000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unsuccessfully sent daily event will request retry.", buf, 0xCu);

      }
      -[HDHRCardioFitnessAnalyticsDailyEventActivity retryPeriod](self, "retryPeriod");
      v36 = v35;
      objc_msgSend(v18, "error");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 2, v30, v36);
LABEL_20:

      break;
    case 0:
      _HKInitializeLogging();
      v20 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        v22 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v39 = v22;
        v23 = v22;
        _os_log_impl(&dword_1CC29C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully sent daily event.", buf, 0xCu);

      }
      -[HDHRCardioFitnessAnalyticsDailyEventActivity retryPeriod](self, "retryPeriod");
      ((void (*)(void (**)(id, uint64_t, void *, double), _QWORD, _QWORD))v4[2])(v4, 0, 0);
      break;
  }

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (double)calculationPeriod
{
  return self->_calculationPeriod;
}

- (double)retryPeriod
{
  return self->_retryPeriod;
}

- (HDPeriodicActivity)periodicActivity
{
  return self->_periodicActivity;
}

- (void)setPeriodicActivity:(id)a3
{
  objc_storeStrong((id *)&self->_periodicActivity, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HKHRCardioFitnessAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (HDHRCardioFitnessAnalyticsDailyEventDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_preparedDatabaseAccessibilityAssertion, 0);
}

@end
