@implementation HDMedicationScheduleControlServer

- (void)remote_saveSchedule:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "healthMedicationsProfileExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "medicationScheduleManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v11 = objc_msgSend(v10, "insertMedicationSchedule:error:", v7, &v13);

  v12 = v13;
  v6[2](v6, v11, v12);

}

- (void)remote_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t, id);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v4 = a3;
  v6 = (void (**)(id, uint64_t, id))a4;
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "healthMedicationsProfileExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "medicationScheduleManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v10 = objc_msgSend(v9, "updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:error:", v4, &v12);
  v11 = v12;
  v6[2](v6, v10, v11);

}

- (void)remote_setTimeZoneTipAsDismissedWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = (void (**)(id, uint64_t, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "healthMedicationsProfileExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "medicationScheduleManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v8 = objc_msgSend(v7, "updateTimeZoneExperienceAsDismissedWithError:", &v10);
  v9 = v10;
  v4[2](v4, v8, v9);

}

- (void)remote_fetchScheduleWithMedicationIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v6 = (void (**)(id, _QWORD, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "healthMedicationsProfileExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "medicationScheduleManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = 0;
  LODWORD(v8) = objc_msgSend(v10, "medicationSchedule:medicationIdentifier:error:", &v15, v7, &v14);

  v11 = v15;
  v12 = v14;
  if ((_DWORD)v8)
    v13 = v11;
  else
    v13 = 0;
  ((void (**)(id, id, id))v6)[2](v6, v13, v12);

}

- (void)remote_fetchSchedulesWithMedicationIdentifiers:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  id v9;

  v9 = 0;
  v6 = (void (**)(id, void *, id))a4;
  -[HDMedicationScheduleControlServer medicationSchedulesForMedicationIdentifiers:error:](self, "medicationSchedulesForMedicationIdentifiers:error:", a3, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  v6[2](v6, v7, v8);

}

- (void)remote_fetchAllSchedulesWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void (**)(id, void *, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "healthMedicationsProfileExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "medicationScheduleManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  objc_msgSend(v7, "medicationSchedulesWithError:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  v4[2](v4, v8, v9);

}

- (void)remote_deleteSchedule:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "healthMedicationsProfileExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "medicationScheduleManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v11 = objc_msgSend(v10, "deleteMedicationSchedule:error:", v7, &v13);

  v12 = v13;
  v6[2](v6, v11, v12);

}

- (void)remote_rescheduleMedicationsWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = (void (**)(id, uint64_t, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "healthMedicationsProfileExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "medicationScheduleManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v8 = objc_msgSend(v7, "rescheduleMedicationsWithError:", &v10);
  v9 = v10;
  v4[2](v4, v8, v9);

}

- (void)remote_observeMedicationScheduleChanges:(BOOL)a3 completion:(id)a4
{
  os_unfair_lock_s *p_lock;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  id v10;

  p_lock = &self->_lock;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  os_unfair_lock_lock(p_lock);
  self->_shouldObserveChanges = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "healthMedicationsProfileExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "medicationScheduleManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_shouldObserveChanges)
    objc_msgSend(v10, "registerObserver:queue:", self, 0);
  else
    objc_msgSend(v10, "unregisterObserver:", self);
  os_unfair_lock_unlock(p_lock);
  v7[2](v7, 1, 0);

}

- (id)medicationSchedulesForMedicationIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "healthMedicationsProfileExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "medicationScheduleManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HDMedicationSchedulePredicateForMedicationIdentifiers((uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "medicationSchedulesWithPredicate:error:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDMedicationScheduleControlServer *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[HDMedicationScheduleControlServer initWithUUID:configuration:client:delegate:]([HDMedicationScheduleControlServer alloc], "initWithUUID:configuration:client:delegate:", v13, v12, v11, v10);

  return v14;
}

- (HDMedicationScheduleControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  HDMedicationScheduleControlServer *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDMedicationScheduleControlServer;
  result = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v7, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_shouldObserveChanges = 0;
  }
  return result;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0D2C490], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0D2C490], "clientInterface");
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0D2C490], "taskIdentifier");
}

- (void)scheduleManagerDidRescheduleMedications:(id)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL4 shouldObserveChanges;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  HDMedicationScheduleControlServer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  shouldObserveChanges = self->_shouldObserveChanges;
  os_unfair_lock_unlock(p_lock);
  if (shouldObserveChanges)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__HDMedicationScheduleControlServer_scheduleManagerDidRescheduleMedications___block_invoke;
    v10[3] = &unk_1E6E006D8;
    v10[4] = self;
    -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    HKLogMedication();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

    if (v8)
    {
      HKLogMedication();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v12 = self;
        _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_INFO, "%{public}@: Notify client for did reschedule medications", buf, 0xCu);
      }

    }
    objc_msgSend(v6, "client_notifyForDidRescheduleMedications");

  }
}

void __77__HDMedicationScheduleControlServer_scheduleManagerDidRescheduleMedications___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__HDMedicationScheduleControlServer_scheduleManagerDidRescheduleMedications___block_invoke_cold_1();

}

- (void)scheduleManager:(id)a3 didPruneScheduleItems:(id)a4
{
  id v5;
  _BOOL4 shouldObserveChanges;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  HDMedicationScheduleControlServer *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  shouldObserveChanges = self->_shouldObserveChanges;
  os_unfair_lock_unlock(&self->_lock);
  if (shouldObserveChanges)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__HDMedicationScheduleControlServer_scheduleManager_didPruneScheduleItems___block_invoke;
    v11[3] = &unk_1E6E006D8;
    v11[4] = self;
    -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    HKLogMedication();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      HKLogMedication();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v13 = self;
        _os_log_impl(&dword_1B815E000, v10, OS_LOG_TYPE_INFO, "%{public}@: Notify client for didPruneScheduleItems", buf, 0xCu);
      }

    }
    objc_msgSend(v7, "client_notifyForDidPruneSchduleItems:", v5);

  }
}

void __75__HDMedicationScheduleControlServer_scheduleManager_didPruneScheduleItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__HDMedicationScheduleControlServer_scheduleManager_didPruneScheduleItems___block_invoke_cold_1();

}

- (void)scheduleManager:(id)a3 didAddOrModifySchedules:(id)a4
{
  id v5;
  _BOOL4 shouldObserveChanges;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint8_t buf[4];
  HDMedicationScheduleControlServer *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  shouldObserveChanges = self->_shouldObserveChanges;
  os_unfair_lock_unlock(&self->_lock);
  if (shouldObserveChanges)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__HDMedicationScheduleControlServer_scheduleManager_didAddOrModifySchedules___block_invoke;
    v12[3] = &unk_1E6E006D8;
    v12[4] = self;
    -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    HKLogMedication();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      HKLogMedication();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 138543618;
        v14 = self;
        v15 = 2048;
        v16 = v11;
        _os_log_impl(&dword_1B815E000, v10, OS_LOG_TYPE_INFO, "%{public}@: Notify client for didAddOrModifySchedules %ld", buf, 0x16u);
      }

    }
    objc_msgSend(v7, "client_notifyForAddOrModifySchedules:", v5);

  }
}

void __77__HDMedicationScheduleControlServer_scheduleManager_didAddOrModifySchedules___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__HDMedicationScheduleControlServer_scheduleManager_didAddOrModifySchedules___block_invoke_cold_1();

}

- (void)remote_saveScheduleItems:(id)a3 completion:(id)a4
{
  void (**v6)(id, _BOOL8, id);
  _BOOL8 v7;
  id v8;
  id v9;

  v9 = 0;
  v6 = (void (**)(id, _BOOL8, id))a4;
  v7 = -[HDMedicationScheduleControlServer insertMedicationScheduleItems:error:](self, "insertMedicationScheduleItems:error:", a3, &v9);
  v8 = v9;
  v6[2](v6, v7, v8);

}

- (BOOL)insertMedicationScheduleItems:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__HDMedicationScheduleControlServer_insertMedicationScheduleItems_error___block_invoke;
  v11[3] = &unk_1E6DFFFA8;
  v12 = v6;
  v9 = v6;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDMedicationScheduleItemEntity, "performWriteTransactionWithHealthDatabase:error:block:", v8, a4, v11);

  return (char)a4;
}

uint64_t __73__HDMedicationScheduleControlServer_insertMedicationScheduleItems_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        +[HDMedicationScheduleItemEntity insertMedicationScheduleItem:transaction:error:](HDMedicationScheduleItemEntity, "insertMedicationScheduleItem:transaction:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), v5, a3, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = 0;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)remote_updateNotificationSent:(BOOL)a3 scheduleItemIdentifier:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, uint64_t, id);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v6 = a3;
  v8 = (void (**)(id, uint64_t, id))a5;
  v9 = a4;
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "healthMedicationsProfileExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "medicationScheduleManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v13 = objc_msgSend(v12, "updateNotificationSent:scheduleItemIdentifier:error:", v6, v9, &v15);

  v14 = v15;
  v8[2](v8, v13, v14);

}

- (void)remote_logUnloggedMedicationsWithScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5 completion:(id)a6
{
  void (**v10)(id, uint64_t, id);
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;

  v10 = (void (**)(id, uint64_t, id))a6;
  v11 = a5;
  v12 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "healthMedicationsProfileExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "medicationScheduleManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v16 = objc_msgSend(v15, "logUnloggedDoseEventsForScheduledItemIdentifier:status:logDate:error:", v12, a4, v11, &v18);

  v17 = v18;
  v10[2](v10, v16, v17);

}

void __77__HDMedicationScheduleControlServer_scheduleManagerDidRescheduleMedications___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "%{public}@: Unable to notify client for did reschedule medications: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __75__HDMedicationScheduleControlServer_scheduleManager_didPruneScheduleItems___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "%{public}@: Unable to notify client for didPruneScheduleItems: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __77__HDMedicationScheduleControlServer_scheduleManager_didAddOrModifySchedules___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "%{public}@: Unable to notify client for didAddOrModifySchedules: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
