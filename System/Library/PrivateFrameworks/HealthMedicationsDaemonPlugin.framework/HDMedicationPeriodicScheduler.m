@implementation HDMedicationPeriodicScheduler

- (HDMedicationPeriodicScheduler)init
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

- (HDMedicationPeriodicScheduler)initWithDaemon:(id)a3
{
  id v4;
  HDMedicationPeriodicScheduler *v5;
  HDMedicationPeriodicScheduler *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationPeriodicScheduler;
  v5 = -[HDMedicationPeriodicScheduler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_daemon, v4);
    objc_msgSend(v4, "primaryProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerProfileReadyObserver:queue:", v6, 0);

  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  double v4;
  id v5;
  void *v6;
  void *v7;
  HDPeriodicActivity *v8;
  HDPeriodicActivity *periodicActivity;
  id WeakRetained;

  v4 = (double)(uint64_t)*MEMORY[0x1E0C807B8];
  v5 = objc_alloc(MEMORY[0x1E0D29540]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKLogMedication();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (HDPeriodicActivity *)objc_msgSend(v5, "initWithProfile:name:interval:delegate:loggingCategory:", v6, CFSTR("com.apple.healthd.medications.scheduler"), self, v7, v4);
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v8;

}

- (HDPeriodicActivity)activity
{
  return self->_periodicActivity;
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  HDMedicationPeriodicScheduler *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.healthd.medications.scheduler"));

  _HKInitializeLogging();
  HKLogMedication();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_1B815E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: configuring periodic activity %{public}@", (uint8_t *)&v13, 0x16u);

    }
    xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E0C80738], 1);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E0C808D8], 1);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E0C808B0], 1);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HDMedicationPeriodicScheduler periodicActivity:configureXPCActivityCriteria:].cold.1((uint64_t)self, v6, v11);

  }
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HDDaemon **p_daemon;
  id WeakRetained;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  HDMedicationPeriodicScheduler *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.healthd.medications.scheduler")) & 1) != 0)
  {
    p_daemon = &self->_daemon;
    WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(WeakRetained, "primaryProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), v13, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v33 = (void *)v16;
    objc_msgSend(v17, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v16, &v41, 300.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v41;

    if (!v18)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

      if (v21)
      {
        HKLogMedication();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v43 = self;
          v44 = 2114;
          v45 = v19;
          _os_log_impl(&dword_1B815E000, v22, OS_LOG_TYPE_INFO, "[%{public}@]: unable to take accessibility assertion: %{public}@", buf, 0x16u);
        }

      }
    }
    v23 = (void *)MEMORY[0x1E0D294D0];
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke;
    v36[3] = &unk_1E6E01358;
    v36[4] = self;
    v37 = v7;
    v38 = v18;
    v39 = v10;
    v40 = v6;
    v34[0] = v26;
    v34[1] = 3221225472;
    v34[2] = __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke_2;
    v34[3] = &unk_1E6E01380;
    v35 = v38;
    v27 = v38;
    v28 = v10;
    objc_msgSend(v23, "maintenanceOperationWithName:asynchronousBlock:canceledBlock:", v25, v36, v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_loadWeakRetained((id *)p_daemon);
    objc_msgSend(v30, "maintenanceWorkCoordinator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "enqueueMaintenanceOperation:", v29);

  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[HDMedicationPeriodicScheduler performPeriodicActivity:completion:].cold.1((uint64_t)self, (uint64_t)v7, v32);

    (*((void (**)(id, uint64_t, _QWORD, double))v6 + 2))(v6, 1, 0, 0.0);
  }

}

void __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v19 = v5;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_1B815E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: performing periodic activity %{public}@", buf, 0x16u);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0D294F0]);
  objc_msgSend(v7, "setCacheScope:", 1);
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v7, "addAccessibilityAssertion:");
  objc_msgSend(*(id *)(a1 + 56), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke_212;
  v15 = &unk_1E6E00490;
  v16 = *(id *)(a1 + 56);
  v9 = objc_msgSend(v8, "performWithTransactionContext:error:block:", v7, &v17, &v12);
  v10 = v17;

  objc_msgSend(*(id *)(a1 + 48), "invalidate", v12, v13, v14, v15);
  if (v9)
    v11 = 0;
  else
    v11 = 2;
  (*(void (**)(_QWORD, uint64_t, id, double))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v11, v10, 0.0);
  v3[2](v3);

}

uint64_t __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke_212(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "healthMedicationsProfileExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medicationScheduleManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "rescheduleMedicationsWithError:", a2))
    v8 = objc_msgSend(v4, "pruneAllScheduleItemsBeforeDate:createDoseEvents:error:", v7, 1, a2);
  else
    v8 = 0;

  return v8;
}

void __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(void);

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "invalidate");
  v3[2]();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

- (void)periodicActivity:(NSObject *)a3 configureXPCActivityCriteria:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_2_1(&dword_1B815E000, a3, v6, "[%{public}@]: periodic activity %{public}@ is not an expected activity, not configuring", (uint8_t *)&v7);

}

- (void)performPeriodicActivity:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_2_1(&dword_1B815E000, a3, (uint64_t)a3, "[%{public}@]: periodic activity %{public}@ is not an expected activity, not performing", (uint8_t *)&v3);
}

@end
