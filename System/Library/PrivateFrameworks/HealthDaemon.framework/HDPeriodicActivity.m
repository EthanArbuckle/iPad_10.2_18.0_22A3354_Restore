@implementation HDPeriodicActivity

- (HDPeriodicActivity)initWithProfile:(id)a3 name:(id)a4 interval:(double)a5 delegate:(id)a6 loggingCategory:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HDPeriodicActivity *v16;
  HDPeriodicActivity *v17;
  id v18;
  uint64_t v19;
  HDXPCPeriodicActivity *activity;
  void *v21;
  NSObject *loggingCategory;
  id WeakRetained;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  id location;
  objc_super v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v32.receiver = self;
  v32.super_class = (Class)HDPeriodicActivity;
  v16 = -[HDPeriodicActivity init](&v32, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_profile, v12);
    objc_initWeak(&location, v17);
    v18 = objc_alloc(MEMORY[0x1E0D29908]);
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __77__HDPeriodicActivity_initWithProfile_name_interval_delegate_loggingCategory___block_invoke;
    v29 = &unk_1E6D0A618;
    objc_copyWeak(&v30, &location);
    v19 = objc_msgSend(v18, "initWithName:baseInterval:criteria:loggingCategory:handler:", v13, *MEMORY[0x1E0C80748], v15, &v26, a5);
    activity = v17->_activity;
    v17->_activity = (HDXPCPeriodicActivity *)v19;

    objc_storeWeak((id *)&v17->_delegate, v14);
    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager", v26, v27, v28, v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v17);

    _HKInitializeLogging();
    loggingCategory = v17->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v13;
      _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "Starting up XPC service scheduler (%@)", buf, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&v17->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "registerDaemonActivatedObserver:queue:", v17, 0);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __77__HDPeriodicActivity_initWithProfile_name_interval_delegate_loggingCategory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void (**v9)(id, uint64_t, _QWORD, double);
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id *WeakRetained;
  id v18;
  void (**v19)(id, uint64_t, _QWORD, double);

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v4);
  objc_msgSend(v6, "currentActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  v9 = (void (**)(id, uint64_t, _QWORD, double))v5;
  if (WeakRetained)
  {
    if (-[HDPeriodicActivity _requiresProtectedData]((uint64_t)WeakRetained)
      && (v10 = objc_loadWeakRetained(WeakRetained + 1),
          objc_msgSend(v10, "database"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isProtectedDataAvailable"),
          v11,
          v10,
          (v12 & 1) == 0))
    {
      v9[2](v9, 1, 0, 0.0);
      v14 = objc_loadWeakRetained(WeakRetained + 6);
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        v16 = objc_loadWeakRetained(WeakRetained + 6);
        objc_msgSend(v16, "unitTesting_runDeclinedForActivity:", WeakRetained);

      }
    }
    else
    {
      v13 = objc_loadWeakRetained(WeakRetained + 6);
      v19 = v9;
      v18 = v8;
      objc_msgSend(v13, "performPeriodicActivity:completion:");

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[HDXPCPeriodicActivity unregisterActivity](self->_activity, "unregisterActivity");
  v3.receiver = self;
  v3.super_class = (Class)HDPeriodicActivity;
  -[HDPeriodicActivity dealloc](&v3, sel_dealloc);
}

+ (void)registerDisabledPeriodicActivityWithName:(id)a3 loggingCategory:(id)a4
{
  objc_msgSend(MEMORY[0x1E0D29908], "registerDisabledPeriodicActivityWithName:loggingCategory:", a3, a4);
}

- (void)didPerformActivityWithResult:(int64_t)a3 minimumRetryInterval:(double)a4 activityStartDate:(id)a5 error:(id)a6
{
  HDXPCPeriodicActivity *activity;
  uint64_t v7;

  activity = self->_activity;
  if ((unint64_t)a3 > 3)
    v7 = 2;
  else
    v7 = qword_1B7F565A0[a3];
  -[HDXPCPeriodicActivity didPerformActivityWithResult:minimumRetryInterval:activityStartDate:error:](activity, "didPerformActivityWithResult:minimumRetryInterval:activityStartDate:error:", v7, a5, a6, a4);
}

- (NSString)name
{
  return (NSString *)-[HDXPCPeriodicActivity name](self->_activity, "name");
}

- (int64_t)errorCount
{
  return -[HDXPCPeriodicActivity errorCount](self->_activity, "errorCount");
}

- (BOOL)shouldDefer
{
  if (_HDIsUnitTesting)
    return self->_unitTest_shouldDefer;
  else
    return -[HDXPCPeriodicActivity shouldDefer](self->_activity, "shouldDefer");
}

- (BOOL)isWaitingToRun
{
  return -[HDXPCPeriodicActivity isWaiting](self->_activity, "isWaiting");
}

- (id)lastSuccessfulRunDate
{
  return (id)-[HDXPCPeriodicActivity lastSuccessfulRunDate](self->_activity, "lastSuccessfulRunDate");
}

- (void)updateCriteria
{
  void *v3;
  void *v4;

  -[HDPeriodicActivity currentActivity](self, "currentActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[HDPeriodicActivity _updateCriteriaForActivity:]((uint64_t)self, v3);
    v3 = v4;
  }

}

- (void)_updateCriteriaForActivity:(uint64_t)a1
{
  _xpc_activity_s *v3;
  double v4;
  double v5;
  xpc_object_t v6;
  void *v7;
  _xpc_activity_s *activity;

  v3 = a2;
  if (a1)
  {
    activity = v3;
    objc_msgSend(*(id *)(a1 + 16), "modifiedIntervalForCurrentState");
    v5 = v4;
    v6 = xpc_activity_copy_criteria(activity);
    -[HDPeriodicActivity _criteriaForInterval:](a1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || !xpc_equal(v6, v7))
      xpc_activity_set_criteria(activity, v7);

    v3 = activity;
  }

}

- (id)currentCriteria
{
  _xpc_activity_s *v2;
  _xpc_activity_s *v3;
  xpc_object_t v4;

  -[HDPeriodicActivity currentActivity](self, "currentActivity");
  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = xpc_activity_copy_criteria(v2);
  else
    v4 = 0;

  return v4;
}

- (void)resetInterval
{
  double v3;
  void *v4;

  if (self)
    -[HDXPCPeriodicActivity modifiedIntervalForCurrentState](self->_activity, "modifiedIntervalForCurrentState");
  else
    v3 = 0.0;
  -[HDPeriodicActivity _criteriaForInterval:]((uint64_t)self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDXPCPeriodicActivity setCriteria:](self->_activity, "setCriteria:", v4);

  -[HDXPCPeriodicActivity unregisterActivity](self->_activity, "unregisterActivity");
  -[HDXPCPeriodicActivity registerActivity](self->_activity, "registerActivity");
}

- (id)_criteriaForInterval:(uint64_t)a1
{
  xpc_object_t v4;
  void *v5;
  id WeakRetained;

  if (a1)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    v5 = v4;
    if (a2 > 0.0)
      xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C807A8], (uint64_t)a2);
    if (-[HDPeriodicActivity _requiresProtectedData](a1))
      xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808A8], 1);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "periodicActivity:configureXPCActivityCriteria:", a1, v5);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)reset
{
  -[HDXPCPeriodicActivity unitTest_reset](self->_activity, "unitTest_reset");
}

- (void)synthesizeActivityFire
{
  -[HDXPCPeriodicActivity unitTest_synthesizeActivityFireWithCompletion:](self->_activity, "unitTest_synthesizeActivityFireWithCompletion:", &__block_literal_global_243);
}

- (void)unitTest_setShouldDefer:(BOOL)a3
{
  self->_unitTest_shouldDefer = a3;
}

- (void)daemonActivated:(id)a3
{
  id WeakRetained;
  void *v5;
  double v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addProtectedDataObserver:", self);

  if (self)
    -[HDXPCPeriodicActivity modifiedIntervalForCurrentState](self->_activity, "modifiedIntervalForCurrentState");
  else
    v6 = 0.0;
  -[HDPeriodicActivity _criteriaForInterval:]((uint64_t)self, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDXPCPeriodicActivity setCriteria:](self->_activity, "setCriteria:", v7);
  -[HDXPCPeriodicActivity registerActivity](self->_activity, "registerActivity");

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
    -[HDXPCPeriodicActivity externalConditionsChanged](self->_activity, "externalConditionsChanged", a3);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDXPCPeriodicActivity name](self->_activity, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDXPCPeriodicActivity baseInterval](self->_activity, "baseInterval");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ (%0.2lfs)>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (uint64_t)_requiresProtectedData
{
  id *v2;
  id WeakRetained;
  char v4;
  id v5;
  uint64_t v6;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  v5 = objc_loadWeakRetained(v2);
  v6 = objc_msgSend(v5, "periodicActivityRequiresProtectedData:", a1);

  return v6;
}

void __51__HDPeriodicActivity__fireWithActivity_completion___block_invoke(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  char v8;
  id v9;

  v4 = a1[6];
  if (a2 > 3)
    v5 = 2;
  else
    v5 = qword_1B7F565A0[a2];
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
  v6 = (void *)a1[4];
  if (v6)
    -[HDPeriodicActivity _updateCriteriaForActivity:](a1[5], v6);
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 48));
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)(a1[5] + 48));
    objc_msgSend(v9, "unitTesting_didPerformActivityWithResult:", a2);

  }
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDXPCPeriodicActivity name](self->_activity, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDXPCPeriodicActivity lastSuccessfulRunDate](self->_activity, "lastSuccessfulRunDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDXPCPeriodicActivity baseInterval](self->_activity, "baseInterval");
  v7 = v6;
  -[HDXPCPeriodicActivity earliestRunDate](self->_activity, "earliestRunDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Activity: '%@'\nLast Successful Run: %@\nBase Interval: %lfs\nEarliest Run Date: %@\nError Count: %ld"), v4, v5, v7, v8, -[HDXPCPeriodicActivity errorCount](self->_activity, "errorCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (double)interval
{
  return self->_interval;
}

- (HDPeriodicActivityDelegate)delegate
{
  return (HDPeriodicActivityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_xpc_object)currentActivity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
