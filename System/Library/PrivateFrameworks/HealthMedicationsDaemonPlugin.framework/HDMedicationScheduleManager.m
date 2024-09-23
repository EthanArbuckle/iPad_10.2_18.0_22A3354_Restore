@implementation HDMedicationScheduleManager

- (HDMedicationScheduleManager)initWithProfile:(id)a3 userDefaults:(id)a4
{
  id v6;
  id v7;
  HDMedicationScheduleManager *v8;
  HDMedicationScheduleManager *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HDMedicationScheduleObserver *observers;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HDMedicationScheduleSynchronousObserver *synchronousObservers;
  HDMedicationNotificationManager *v22;
  HDMedicationNotificationManager *notificationManager;
  HDMedicationTimeZoneManager *v24;
  HDMedicationTimeZoneManager *timeZoneManager;
  id v26;
  OS_dispatch_queue *v27;
  uint64_t v28;
  _HKDelayedOperation *rescheduleOperation;
  id WeakRetained;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37;
  id location;
  objc_super v39;

  v6 = a3;
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)HDMedicationScheduleManager;
  v8 = -[HDMedicationScheduleManager init](&v39, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc(MEMORY[0x1E0CB6988]);
    NSStringFromProtocol((Protocol *)&unk_1EF1A5D78);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogMedication();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithName:loggingCategory:", v13, v14);
    observers = v9->_observers;
    v9->_observers = (HDMedicationScheduleObserver *)v15;

    v9->_observersLock._os_unfair_lock_opaque = 0;
    v17 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    NSStringFromProtocol((Protocol *)&unk_1EF1A6548);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogMedication();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithName:loggingCategory:", v18, v19);
    synchronousObservers = v9->_synchronousObservers;
    v9->_synchronousObservers = (HDMedicationScheduleSynchronousObserver *)v20;

    v22 = -[HDMedicationNotificationManager initWithProfile:userDefaults:]([HDMedicationNotificationManager alloc], "initWithProfile:userDefaults:", v6, v7);
    notificationManager = v9->_notificationManager;
    v9->_notificationManager = v22;

    v24 = -[HDMedicationTimeZoneManager initWithProfile:]([HDMedicationTimeZoneManager alloc], "initWithProfile:", v6);
    timeZoneManager = v9->_timeZoneManager;
    v9->_timeZoneManager = v24;

    objc_initWeak(&location, v9);
    v26 = objc_alloc(MEMORY[0x1E0CB6F80]);
    v27 = v9->_queue;
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __60__HDMedicationScheduleManager_initWithProfile_userDefaults___block_invoke;
    v36 = &unk_1E6E003D0;
    objc_copyWeak(&v37, &location);
    v28 = objc_msgSend(v26, "initWithQueue:delay:block:", v27, &v33, 5.0);
    rescheduleOperation = v9->_rescheduleOperation;
    v9->_rescheduleOperation = (_HKDelayedOperation *)v28;

    v9->_isOperationRequiredOnNextUnlock = 0;
    v9->_operationLock._os_unfair_lock_opaque = 0;
    WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v9, v9->_queue, v33, v34, v35, v36);

    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v31, "isAppleWatch");

    if ((_DWORD)v26)
      -[HDMedicationScheduleManager _startObservingMedicationsNotificationSettingsDidChangeNotification]((int *)v9);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __60__HDMedicationScheduleManager_initWithProfile_userDefaults___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDMedicationScheduleManager _queue_rescheduleMedications]((uint64_t)WeakRetained);

}

- (void)_queue_rescheduleMedications
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1B815E000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] Adding accessibility assertion: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_startObservingMedicationsNotificationSettingsDidChangeNotification
{
  const char *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    val[24] = -1;
    v2 = (const char *)objc_msgSend(CFSTR("HKMedicationsNotificationSettingsDidChangeNotification"), "UTF8String");
    v3 = *((_QWORD *)val + 2);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __98__HDMedicationScheduleManager__startObservingMedicationsNotificationSettingsDidChangeNotification__block_invoke;
    v4[3] = &unk_1E6E005C0;
    objc_copyWeak(&v5, &location);
    notify_register_dispatch(v2, val + 24, v3, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  void *v3;
  int v4;
  int notificationSettingsDidChangeNotificationToken;
  objc_super v6;

  -[HDAssertion invalidate](self->_accessibilityAssertion, "invalidate");
  -[_HKDelayedOperation invalidate](self->_rescheduleOperation, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if (v4)
  {
    notificationSettingsDidChangeNotificationToken = self->_notificationSettingsDidChangeNotificationToken;
    if (notificationSettingsDidChangeNotificationToken != -1)
      notify_cancel(notificationSettingsDidChangeNotificationToken);
  }
  v6.receiver = self;
  v6.super_class = (Class)HDMedicationScheduleManager;
  -[HDMedicationScheduleManager dealloc](&v6, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  int isRescheduleRequiredOnNext;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProtectedDataObserver:queue:", self, self->_queue);

  objc_msgSend(v8, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isProtectedDataAvailable"))
  {
    isRescheduleRequiredOnNext = -[HDMedicationScheduleManager _isRescheduleRequiredOnNextUnlock]((uint64_t)self);

    if (isRescheduleRequiredOnNext)
      -[HDMedicationScheduleManager _runRescheduleDelayedOperation]((uint64_t)self);
  }
  else
  {

  }
  objc_msgSend(v8, "userDomainConceptManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addUserDomainConceptObserver:queue:", self, 0);

}

- (uint64_t)_isRescheduleRequiredOnNextUnlock
{
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = (os_unfair_lock_s *)(result + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(result + 80));
    v3 = *(_QWORD *)(v1 + 72);
    os_unfair_lock_unlock(v2);
    if (v3 == 1)
    {
      return 1;
    }
    else if (v3 == 2)
    {
      return 0;
    }
    else
    {
      return -[HDMedicationScheduleManager _hasPersistedRescheduleRequiredOnNextUnlockFlag](v1);
    }
  }
  return result;
}

- (void)_runRescheduleDelayedOperation
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  double v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "daemon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "healthMedicationsDaemonExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "medicationsBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "asyncMedicationReschedulesEnabled");

    if ((v6 & 1) != 0)
    {
      v7 = -[HDMedicationScheduleManager _rescheduleOperationDelayWithDefaultDelay:](a1, 5.0);
      v8 = *(NSObject **)(a1 + 16);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __61__HDMedicationScheduleManager__runRescheduleDelayedOperation__block_invoke;
      v10[3] = &unk_1E6E00468;
      v10[4] = a1;
      *(double *)&v10[5] = v7;
      dispatch_async(v8, v10);
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v12 = a1;
        _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Async reschedule of meds is disabled by medications behavior", buf, 0xCu);
      }

    }
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
  {
    if (-[HDMedicationScheduleManager _isRescheduleRequiredOnNextUnlock]((uint64_t)self))
      -[HDMedicationScheduleManager _runRescheduleDelayedOperation]((uint64_t)self);
  }
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
  -[HDMedicationScheduleManager _runRescheduleOperationIfListContainsActiveMedsListUDC:]((uint64_t)self, a4);
}

- (void)_runRescheduleOperationIfListContainsActiveMedsListUDC:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "hk_containsObjectPassingTest:", &__block_literal_global_4);
    v4 = v6;
    if (v5)
    {
      -[HDMedicationScheduleManager _runRescheduleDelayedOperation](a1);
      v4 = v6;
    }
  }

}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
  -[HDMedicationScheduleManager _runRescheduleOperationIfListContainsActiveMedsListUDC:]((uint64_t)self, a4);
}

BOOL __86__HDMedicationScheduleManager__runRescheduleOperationIfListContainsActiveMedsListUDC___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "listType") == 2;

  return v3;
}

- (BOOL)medicationSchedule:(id *)a3 medicationIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  BOOL v13;

  v8 = a4;
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    HKLogMedication();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[HDMedicationScheduleManager medicationSchedule:medicationIdentifier:error:].cold.1();

  }
  HDMedicationSchedulePredicateForMedicationIdentifier((uint64_t)v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDMedicationScheduleManager _fetchMedicationSchedule:predicate:error:]((uint64_t)self, a3, v12, (uint64_t)a5);

  return v13;
}

- (BOOL)_fetchMedicationSchedule:(void *)a3 predicate:(uint64_t)a4 error:
{
  id v7;
  _BOOL8 v8;
  NSObject *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v7 = a3;
  if (a1)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    v17 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__HDMedicationScheduleManager__fetchMedicationSchedule_predicate_error___block_invoke;
    v11[3] = &unk_1E6E004B8;
    v11[4] = &v12;
    v8 = -[HDMedicationScheduleManager _enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate:error:enumerationHandler:](a1, v7, a4, v11);
    if (v8)
    {
      if (a2)
        *a2 = objc_retainAutorelease((id)v13[5]);
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[HDMedicationScheduleManager _fetchMedicationSchedule:predicate:error:].cold.1();

    }
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)medicationSchedule:(id *)a3 identifier:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  BOOL v13;

  v8 = a4;
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    HKLogMedication();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[HDMedicationScheduleManager medicationSchedule:identifier:error:].cold.1();

  }
  HDMedicationSchedulePredicateForScheduleUUID((uint64_t)v8, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDMedicationScheduleManager _fetchMedicationSchedule:predicate:error:]((uint64_t)self, a3, v12, (uint64_t)a5);

  return v13;
}

- (id)medicationSchedulesWithError:(id *)a3
{
  return -[HDMedicationScheduleManager medicationSchedulesWithPredicate:error:](self, "medicationSchedulesWithPredicate:error:", 0, a3);
}

- (id)medicationSchedulesWithPredicate:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__HDMedicationScheduleManager_medicationSchedulesWithPredicate_error___block_invoke;
  v12[3] = &unk_1E6E00418;
  v9 = v8;
  v13 = v9;
  LODWORD(a4) = -[HDMedicationScheduleManager _enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate:error:enumerationHandler:]((uint64_t)self, v7, (uint64_t)a4, v12);

  if ((_DWORD)a4)
    v10 = (void *)objc_msgSend(v9, "copy");
  else
    v10 = 0;

  return v10;
}

uint64_t __70__HDMedicationScheduleManager_medicationSchedulesWithPredicate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (BOOL)_enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate:(uint64_t)a3 error:(void *)a4 enumerationHandler:
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  _BOOL8 v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __124__HDMedicationScheduleManager__enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate_error_enumerationHandler___block_invoke;
    v13[3] = &unk_1E6E004E0;
    v13[4] = a1;
    v14 = v7;
    v15 = v8;
    v11 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMedicationScheduleEntity, "performReadTransactionWithHealthDatabase:error:block:", v10, a3, v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)medicationSchedulesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  _HKInitializeLogging();
  HKLogMedication();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

  if (v11)
  {
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[HDMedicationScheduleManager medicationSchedulesWithPredicate:transaction:error:].cold.1();

  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__HDMedicationScheduleManager_medicationSchedulesWithPredicate_transaction_error___block_invoke;
  v18[3] = &unk_1E6E00418;
  v14 = v13;
  v19 = v14;
  v15 = -[HDMedicationScheduleManager _enumerateSchedulesInDescendingCreationOrderWithPredicate:includeDeleted:transaction:error:enumerationHandler:]((uint64_t)self, v8, 0, v9, (uint64_t)a5, v18);

  if (v15)
    v16 = (void *)objc_msgSend(v14, "copy");
  else
    v16 = 0;

  return v16;
}

uint64_t __82__HDMedicationScheduleManager_medicationSchedulesWithPredicate_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (BOOL)_enumerateSchedulesInDescendingCreationOrderWithPredicate:(char)a3 includeDeleted:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a4;
  v13 = a6;
  if (a1)
  {
    v14 = v11;
    if ((a3 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0D29890];
      HDMedicationSchedulePredicateForDeleted(0, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "compoundPredicateWithPredicate:otherPredicate:", v16, v14);
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v17;
    }
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("creation_date"), objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[HDMedicationScheduleEntity enumerateSchedulesWithPredicate:limit:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleEntity, "enumerateSchedulesWithPredicate:limit:orderingTerms:transaction:error:enumerationHandler:", v14, 0, v19, v12, a5, v13);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)enumerateMedicationSchedulesWithPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  id WeakRetained;
  void *v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  int64_t v31;
  uint8_t buf[4];
  HDMedicationScheduleManager *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  _HKInitializeLogging();
  HKLogMedication();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

  if (v16)
  {
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_opt_self();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = self;
      v34 = 2114;
      v35 = v25;
      v36 = 2114;
      v37 = v26;
      v38 = 2114;
      v39 = v13;
      _os_log_debug_impl(&dword_1B815E000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Enumerating medication schedules with predicate: %{public}@, limit: %{public}@, orderingTerms: %{public}@", buf, 0x2Au);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __118__HDMedicationScheduleManager_enumerateMedicationSchedulesWithPredicate_limit_orderingTerms_error_enumerationHandler___block_invoke;
  v27[3] = &unk_1E6E00440;
  v27[4] = self;
  v28 = v12;
  v30 = v14;
  v31 = a4;
  v29 = v13;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  v23 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMedicationScheduleEntity, "performReadTransactionWithHealthDatabase:error:block:", v19, a6, v27);

  return v23;
}

BOOL __118__HDMedicationScheduleManager_enumerateMedicationSchedulesWithPredicate_limit_orderingTerms_error_enumerationHandler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return a1[4]
      && +[HDMedicationScheduleEntity enumerateSchedulesWithPredicate:limit:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleEntity, "enumerateSchedulesWithPredicate:limit:orderingTerms:transaction:error:enumerationHandler:", a1[5], a1[8], a1[6], a2, a3, a1[7]);
}

- (BOOL)insertMedicationSchedule:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[HDMedicationScheduleManager insertMedicationSchedule:error:].cold.1();

  }
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDMedicationScheduleManager insertMedicationSchedules:error:](self, "insertMedicationSchedules:error:", v10, a4);

  return v11;
}

- (BOOL)insertMedicationSchedules:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  id WeakRetained;
  BOOL v11;

  v6 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[HDMedicationScheduleManager insertMedicationSchedules:error:].cold.1((uint64_t)self, v6, v9);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v11 = -[HDMedicationScheduleManager insertMedicationSchedules:syncProvenance:syncIdentity:error:](self, "insertMedicationSchedules:syncProvenance:syncIdentity:error:", v6, 0, objc_msgSend(WeakRetained, "currentSyncIdentityPersistentID"), a4);

  return v11;
}

- (BOOL)insertMedicationSchedules:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  HDMedicationScheduleInsertOperation *v12;
  id WeakRetained;
  BOOL v14;
  int v16;
  HDMedicationScheduleManager *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138544130;
    v17 = self;
    v18 = 2048;
    v19 = objc_msgSend(v10, "count");
    v20 = 2048;
    v21 = a4;
    v22 = 2048;
    v23 = a5;
    _os_log_impl(&dword_1B815E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserting %lld schedules provenance: %lld, syncIdentity: %lld", (uint8_t *)&v16, 0x2Au);
  }

  v12 = -[HDMedicationScheduleInsertOperation initWithMedicationSchedules:syncProvenance:syncIdentity:]([HDMedicationScheduleInsertOperation alloc], "initWithMedicationSchedules:syncProvenance:syncIdentity:", v10, a4, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v14 = -[HDJournalableOperation performOrJournalWithProfile:error:](v12, "performOrJournalWithProfile:error:", WeakRetained, a6);

  return v14;
}

- (BOOL)logUnloggedDoseEventsForScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  HDMedicationScheduleLogUnloggedMedicationsOperation *v12;
  id WeakRetained;

  v10 = a5;
  v11 = a3;
  v12 = -[HDMedicationScheduleLogUnloggedMedicationsOperation initWithScheduledItemIdentifier:status:logDate:]([HDMedicationScheduleLogUnloggedMedicationsOperation alloc], "initWithScheduledItemIdentifier:status:logDate:", v11, a4, v10);

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a6) = -[HDJournalableOperation performOrJournalWithProfile:error:](v12, "performOrJournalWithProfile:error:", WeakRetained, a6);

  return (char)a6;
}

- (BOOL)rescheduleMedicationsWithError:(id *)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  HDMedicationNotificationManager *notificationManager;
  _BOOL4 v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v22;
  uint8_t buf[4];
  HDMedicationScheduleManager *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    HKLogMedication();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[HDMedicationScheduleManager rescheduleMedicationsWithError:].cold.1((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);

  }
  notificationManager = self->_notificationManager;
  v22 = 0;
  v15 = -[HDMedicationNotificationManager rescheduleMedicationsWithError:](notificationManager, "rescheduleMedicationsWithError:", &v22);
  v16 = v22;
  v17 = v16;
  if (v15)
  {
    -[HDMedicationScheduleManager _setRescheduleRequiredOnNextUnlock:]((uint64_t)self, 0);
    -[HDMedicationScheduleManager _notifyObserversForDidRescheduleMedications]((uint64_t)self);
  }
  else if (objc_msgSend(v16, "hk_isDatabaseAccessibilityError"))
  {
    -[HDMedicationScheduleManager _setRescheduleRequiredOnNextUnlock:]((uint64_t)self, 1);
  }
  _HKInitializeLogging();
  HKLogMedication();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromBool();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = self;
    v25 = 2114;
    v26 = v19;
    v27 = 2114;
    v28 = v17;
    _os_log_impl(&dword_1B815E000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reschedule medications completed with success: %{public}@, error: %{public}@", buf, 0x20u);

  }
  v20 = v17;
  if (v20)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v20);
    else
      _HKLogDroppedError();
  }

  return v15;
}

- (void)_setRescheduleRequiredOnNextUnlock:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 72);
    v5 = (_DWORD)a2 ? 1 : 2;
    v6 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    *(_QWORD *)(a1 + 72) = v5;
    os_unfair_lock_unlock(v6);
    if (v5 != v4)
    {
      -[HDMedicationScheduleManager _deviceLocalKeyValueDomain]((id *)a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v9 = objc_msgSend(v7, "setNumber:forKey:error:", v8, CFSTR("rescheduleRequired"), &v13);
      v10 = v13;

      if ((v9 & 1) == 0)
      {
        _HKInitializeLogging();
        HKLogMedication();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          HKStringFromBool();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v15 = a1;
          v16 = 2114;
          v17 = v12;
          v18 = 2114;
          v19 = CFSTR("rescheduleRequired");
          v20 = 2114;
          v21 = v10;
          _os_log_error_impl(&dword_1B815E000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Unable to set value %{public}@ for key %{public}@: %{public}@", buf, 0x2Au);

        }
      }

    }
  }
}

- (uint64_t)_notifyObserversForDidRescheduleMedications
{
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];

  if (result)
  {
    v1 = result;
    _HKInitializeLogging();
    HKLogMedication();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

    if (v3)
    {
      HKLogMedication();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        -[HDMedicationScheduleManager _notifyObserversForDidRescheduleMedications].cold.1(v1);

    }
    v5 = *(void **)(v1 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__HDMedicationScheduleManager__notifyObserversForDidRescheduleMedications__block_invoke;
    v6[3] = &unk_1E6E00638;
    v6[4] = v1;
    return objc_msgSend(v5, "notifyObservers:", v6);
  }
  return result;
}

- (void)rescheduleMedicationsSynchronously:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  HDMedicationScheduleManager *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v3)
  {
    if (v6)
    {
      HKLogMedication();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v14 = self;
        _os_log_impl(&dword_1B815E000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Rescheduling medications synchronously", buf, 0xCu);
      }

    }
    v12 = 0;
    v8 = -[HDMedicationScheduleManager rescheduleMedicationsWithError:](self, "rescheduleMedicationsWithError:", &v12);
    v9 = v12;
    if (!v8)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[HDMedicationScheduleManager rescheduleMedicationsSynchronously:].cold.1();

    }
  }
  else
  {
    if (v6)
    {
      HKLogMedication();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v14 = self;
        _os_log_impl(&dword_1B815E000, v11, OS_LOG_TYPE_INFO, "[%{public}@] Rescheduling medications with delayed operation", buf, 0xCu);
      }

    }
    -[HDMedicationScheduleManager _runRescheduleDelayedOperation]((uint64_t)self);
  }
}

- (double)_rescheduleOperationDelayWithDefaultDelay:(uint64_t)a1
{
  uint64_t v4;
  void *v5;

  if (!a1)
    return 0.0;
  v4 = MEMORY[0x1BCCADA70](*(_QWORD *)(a1 + 112));
  v5 = (void *)v4;
  if (v4)
    a2 = (*(double (**)(uint64_t, uint64_t, double))(v4 + 16))(v4, a1, a2);

  return a2;
}

uint64_t __61__HDMedicationScheduleManager__runRescheduleDelayedOperation__block_invoke(uint64_t a1)
{
  return -[HDMedicationScheduleManager _queue_runRescheduleOperationWithDelay:](*(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

- (uint64_t)_queue_runRescheduleOperationWithDelay:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 16));
    -[HDMedicationScheduleManager queue_takeDBAccessAssertionIfRequired](v3);
    return objc_msgSend(*(id *)(v3 + 64), "executeWithDelay:", a2);
  }
  return result;
}

- (void)queue_takeDBAccessAssertionIfRequired
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (!*(_QWORD *)(a1 + 88))
    {
      v2 = (void *)MEMORY[0x1E0CB3940];
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@"), v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "database");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v9, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v7, &v16, 300.0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v16;
      v12 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v10;

      if (!*(_QWORD *)(a1 + 88))
      {
        _HKInitializeLogging();
        HKLogMedication();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

        if (v14)
        {
          HKLogMedication();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v18 = a1;
            v19 = 2114;
            v20 = v11;
            _os_log_impl(&dword_1B815E000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Unable to take accessibility assertion: %{public}@", buf, 0x16u);
          }

        }
      }

    }
  }
}

uint64_t __59__HDMedicationScheduleManager__queue_rescheduleMedications__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rescheduleMedicationsWithError:", a2);
}

- (void)queue_invalidateDBAccessAssertion
{
  OUTLINED_FUNCTION_7(&dword_1B815E000, a2, a3, "[%{public}@] Database accessibility assertion is invalidated", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_callTestHookdidRunRescheduleOperationWithSuccess:(void *)a3 error:
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (a1)
  {
    v5 = MEMORY[0x1BCCADA70](*(_QWORD *)(a1 + 120));
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v5 + 16))(v5, a1, a2, v7);

  }
}

- (uint64_t)_hasPersistedRescheduleRequiredOnNextUnlockFlag
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v10;

  if (!a1)
    return 0;
  -[HDMedicationScheduleManager _deviceLocalKeyValueDomain]((id *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "numberForKey:error:", CFSTR("rescheduleRequired"), &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = v4;
  if (!v3 && v4)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[HDMedicationScheduleManager _hasPersistedRescheduleRequiredOnNextUnlockFlag].cold.1();

  }
  v7 = objc_msgSend(v3, "BOOLValue");
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  v8 = 1;
  if (!(_DWORD)v7)
    v8 = 2;
  *(_QWORD *)(a1 + 72) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));

  return v7;
}

- (id)_deviceLocalKeyValueDomain
{
  id *v1;
  id v2;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0D294B8]);
    WeakRetained = objc_loadWeakRetained(v1 + 1);
    v1 = (id *)objc_msgSend(v2, "initWithCategory:domainName:profile:", 0, CFSTR("MedicationScheduleManager"), WeakRetained);

  }
  return v1;
}

uint64_t __72__HDMedicationScheduleManager__fetchMedicationSchedule_predicate_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

BOOL __124__HDMedicationScheduleManager__enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDMedicationScheduleManager _enumerateSchedulesInDescendingCreationOrderWithPredicate:includeDeleted:transaction:error:enumerationHandler:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0, a2, a3, *(void **)(a1 + 48));
}

- (BOOL)updateNotificationSent:(BOOL)a3 scheduleItemIdentifier:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  HDMedicationScheduleItemUpdateNotificationSentOperation *v12;
  id WeakRetained;
  BOOL v14;

  v6 = a3;
  v8 = a4;
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    HKLogMedication();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[HDMedicationScheduleManager updateNotificationSent:scheduleItemIdentifier:error:].cold.1();

  }
  v12 = -[HDMedicationScheduleItemUpdateNotificationSentOperation initWithScheduleItemIdentifier:notificationSent:]([HDMedicationScheduleItemUpdateNotificationSentOperation alloc], "initWithScheduleItemIdentifier:notificationSent:", v8, v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v14 = -[HDJournalableOperation performOrJournalWithProfile:error:](v12, "performOrJournalWithProfile:error:", WeakRetained, a5);

  return v14;
}

- (uint64_t)_insertMedicationSchedules:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v24;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v27 = a5;
  if (a1)
  {
    if (objc_msgSend(v10, "count"))
    {
      if (a4 == -1)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        objc_msgSend(WeakRetained, "syncIdentityManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "legacySyncIdentity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "entity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        a4 = objc_msgSend(v14, "persistentID");

      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      obj = v10;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v15)
      {
        v16 = v15;
        v24 = v10;
        v17 = *(_QWORD *)v29;
        v18 = (id *)(a1 + 8);
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            v21 = objc_loadWeakRetained(v18);
            LODWORD(v20) = +[HDMedicationScheduleEntity insertMedicationSchedule:syncProvenance:syncIdentity:profile:transaction:error:](HDMedicationScheduleEntity, "insertMedicationSchedule:syncProvenance:syncIdentity:profile:transaction:error:", v20, a3, a4, v21, v27, a6);

            if (!(_DWORD)v20)
            {
              v22 = 0;
              goto LABEL_15;
            }
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v16)
            continue;
          break;
        }
        v22 = 1;
LABEL_15:
        v10 = v24;
      }
      else
      {
        v22 = 1;
      }

    }
    else
    {
      v22 = 1;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (uint64_t)_crossReferenceScheduledItemsAndDoseEventsAndLogUnloggedWithScheduledItemIdentifier:(uint64_t)a3 status:(void *)a4 logDate:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v23;

  v12 = a2;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_opt_self();
  +[HDMedicationScheduleManager _fetchDoseEventsWithScheduledItemIdentifier:profile:error:](v16, v12, v14, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[HDMedicationScheduleManager _fetchScheduledItemsWithScheduledItemIdentifier:transaction:error:](v16, v12, v15, a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      +[HDMedicationScheduleManager _filteredDoseEventsThatNeedUpdatingFrom:scheduledItemIdentifier:status:logDate:](v16, v17, v12, a3, v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDMedicationScheduleManager _filterScheduledItemsThatNeedCorrespondinDoseEventsDroppingOnesWithAlreadyLoggedDoses:existingDoseEvents:scheduledItemIdentifier:status:logDate:](v16, v18, v17, v12, a3, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = +[HDMedicationScheduleManager _insertDoseEvents:profile:error:](v16, v20, v14, a7);

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)_fetchDoseEventsWithScheduledItemIdentifier:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  HDMedicationDoseEventEntityPredicateForScheduleItemIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6978], "medicationDoseEventTypeForIdentifier:", *MEMORY[0x1E0CB5418]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29578], "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v9, v6, 0, v8, 0, 0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_fetchScheduledItemsWithScheduledItemIdentifier:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  HDMedicationScheduleItemPredicateForIdentifier((uint64_t)v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__HDMedicationScheduleManager__fetchScheduledItemsWithScheduledItemIdentifier_transaction_error___block_invoke;
  v11[3] = &unk_1E6E00508;
  v11[4] = &v12;
  if (+[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleItemEntity, "enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:", v8, 0, v7, a4, v11))
  {
    v9 = (id)v13[5];
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)_filteredDoseEventsThatNeedUpdatingFrom:(void *)a3 scheduledItemIdentifier:(uint64_t)a4 status:(void *)a5 logDate:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  v8 = a3;
  v9 = a5;
  v10 = a2;
  objc_opt_self();
  objc_msgSend(v10, "hk_filter:", &__block_literal_global_301);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __110__HDMedicationScheduleManager__filteredDoseEventsThatNeedUpdatingFrom_scheduledItemIdentifier_status_logDate___block_invoke_2;
  v16[3] = &unk_1E6E00570;
  v17 = v8;
  v18 = v9;
  v19 = a4;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "hk_map:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_filterScheduledItemsThatNeedCorrespondinDoseEventsDroppingOnesWithAlreadyLoggedDoses:(void *)a3 existingDoseEvents:(void *)a4 scheduledItemIdentifier:(uint64_t)a5 status:(void *)a6 logDate:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v35 = a4;
  v33 = a6;
  objc_opt_self();
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v9;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v44;
    v11 = MEMORY[0x1E0C809B0];
    v12 = &unk_1E6E00598;
    v31 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v44 != v28)
          objc_enumerationMutation(obj);
        v30 = v13;
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v13);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v14, "doses");
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v40;
          do
          {
            v18 = 0;
            v36 = v16;
            do
            {
              if (*(_QWORD *)v40 != v17)
                objc_enumerationMutation(v37);
              v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v18);
              v38[0] = v11;
              v38[1] = 3221225472;
              v38[2] = __175__HDMedicationScheduleManager__filterScheduledItemsThatNeedCorrespondinDoseEventsDroppingOnesWithAlreadyLoggedDoses_existingDoseEvents_scheduledItemIdentifier_status_logDate___block_invoke;
              v38[3] = v12;
              v38[4] = v14;
              v38[5] = v19;
              if ((objc_msgSend(v10, "hk_containsObjectPassingTest:", v38) & 1) == 0)
              {
                objc_msgSend(v19, "medicationIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "dose");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "dose");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "scheduledDateTime");
                v23 = v12;
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = v36;
                v25 = (void *)+[HDMedicationScheduleManager _newDoseEventWithGeneratedMetadataLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:isLastScheduledDose:]((uint64_t)HDMedicationScheduleManager, 2, v35, v20, v21, v22, v24, v33, a5, objc_msgSend(v19, "isLastScheduledDose"));

                v12 = v23;
                v11 = MEMORY[0x1E0C809B0];

                v10 = v31;
                objc_msgSend(v34, "hk_addNonNilObject:", v25);

              }
              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v16);
        }

        v13 = v30 + 1;
      }
      while (v30 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v29);
  }

  return v34;
}

+ (uint64_t)_insertDoseEvents:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  +[HDMedicationsAppSourceSupport medicationsAppSourceEntityForProfile:error:](HDMedicationsAppSourceSupport, "medicationsAppSourceEntityForProfile:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "dataManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "insertDataObjects:sourceEntity:deviceEntity:sourceVersion:creationDate:error:", v6, v8, 0, 0, a4, CFAbsoluteTimeGetCurrent());

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __97__HDMedicationScheduleManager__fetchScheduledItemsWithScheduledItemIdentifier_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return 1;
}

BOOL __110__HDMedicationScheduleManager__filteredDoseEventsThatNeedUpdatingFrom_scheduledItemIdentifier_status_logDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "status") != 4 && objc_msgSend(v2, "status") != 5;

  return v3;
}

id __110__HDMedicationScheduleManager__filteredDoseEventsThatNeedUpdatingFrom_scheduledItemIdentifier_status_logDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "scheduleItemIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "scheduledDate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v13 = 0;
      goto LABEL_7;
    }
    v7 = (void *)v6;
    objc_msgSend(v3, "scheduledDoseQuantity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v3, "medicationIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scheduledDoseQuantity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "doseQuantity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scheduledDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)+[HDMedicationScheduleManager _newDoseEventWithGeneratedMetadataLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:isLastScheduledDose:]((uint64_t)HDMedicationScheduleManager, 2, v9, v5, v10, v11, v12, *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(v3, "isLastScheduledDose"));

LABEL_7:
      goto LABEL_8;
    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

+ (uint64_t)_newDoseEventWithGeneratedMetadataLogOrigin:(void *)a3 scheduleItemIdentifier:(void *)a4 medicationIdentifier:(void *)a5 scheduledDoseQuantity:(void *)a6 doseQuantity:(void *)a7 scheduledDate:(void *)a8 startDate:(uint64_t)a9 status:(unsigned __int8)a10 isLastScheduledDose:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v26;

  v26 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB68A8], "syncIdentifierForScheduleItemIdentifier:medicationIdentifier:", v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB68A8];
  objc_msgSend(MEMORY[0x1E0CB68A8], "syncVersionForStatus:", a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_metadataWithSyncIdentifier:syncVersion:isLastScheduledDose:", v20, v22, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB68A8], "medicationDoseEventWithLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:metadata:", a2, v19, v18, v17, v16, v15, v26, a9, v23);
  v24 = objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __175__HDMedicationScheduleManager__filterScheduledItemsThatNeedCorrespondinDoseEventsDroppingOnesWithAlreadyLoggedDoses_existingDoseEvents_scheduledItemIdentifier_status_logDate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a2;
  objc_msgSend(v4, "scheduleItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v17 = 0;
      goto LABEL_14;
    }
    v2 = (void *)v7;
    objc_msgSend(v4, "scheduleItemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v9))
    {
      v17 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v19 = v9;
    v21 = v8;
  }
  objc_msgSend(v4, "medicationIdentifier", v19, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "medicationIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)v11)
  {

    v17 = 1;
  }
  else
  {
    v12 = (void *)v11;
    objc_msgSend(*(id *)(a1 + 40), "medicationIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v4, "medicationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "medicationIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

    }
    else
    {

      v17 = 0;
    }
  }
  v9 = v20;
  v8 = v22;
  if (v5 != v6)
    goto LABEL_13;
LABEL_14:

  return v17;
}

void __98__HDMedicationScheduleManager__startObservingMedicationsNotificationSettingsDidChangeNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138543362;
    v6 = WeakRetained;

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDMedicationScheduleManager _queue_rescheduleMedications]((uint64_t)v4);

}

- (HDMedicationTimeZoneManager)timeZoneManager
{
  return self->_timeZoneManager;
}

- (BOOL)updateTimeZoneExperienceAsDismissedWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  HDProfile **p_profile;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v23;
  uint8_t buf[4];
  HDMedicationScheduleManager *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = self;
    _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] User dismissed timeZone experience", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0D294B8];
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v6, "hdmd_timeZoneDomainWithProfile:", WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "setNumber:forKey:error:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D2C350], a3))
  {
    v10 = *MEMORY[0x1E0D2C308];
    v11 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v11, "notificationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeDeliveredNotificationsWithIdentifiers:", v13);

    v14 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v14, "healthMedicationsProfileExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "medicationNotificationSyncManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "notificationSyncClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateByAddingTimeInterval:", 86400.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6920]), "initWithAction:categoryIdentifier:expirationDate:", 1, v10, v19);
    v21 = objc_msgSend(v17, "sendNotificationInstruction:criteria:error:", v20, 0, a3);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  BOOL v11;

  v5 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[HDMedicationScheduleManager updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:error:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDMedicationScheduleManager _updateSchedulesToTimeZone:maintainCalendarDatesAndTimes:error:](self, "_updateSchedulesToTimeZone:maintainCalendarDatesAndTimes:error:", v10, v5, a4);

  return v11;
}

- (BOOL)_updateSchedulesToTimeZone:(id)a3 maintainCalendarDatesAndTimes:(BOOL)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v24;
  id *v25;
  _QWORD v26[4];
  id v27;
  HDMedicationScheduleManager *v28;
  id v29;
  BOOL v30;
  uint8_t buf[4];
  HDMedicationScheduleManager *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    HKLogMedication();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HKStringFromBool();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = self;
      v33 = 2114;
      v34 = v8;
      v35 = 2114;
      v36 = v24;
      _os_log_debug_impl(&dword_1B815E000, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating schedules with time zone: %{public}@, maintainCalendarDatesAndTimes: %{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMedicationScheduleManager medicationSchedulesWithError:](self, "medicationSchedulesWithError:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __94__HDMedicationScheduleManager__updateSchedulesToTimeZone_maintainCalendarDatesAndTimes_error___block_invoke;
  v26[3] = &unk_1E6E005E8;
  v14 = v8;
  v27 = v14;
  v28 = self;
  v30 = a4;
  v15 = v12;
  v29 = v15;
  objc_msgSend(v13, "hk_map:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogMedication();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v25 = a5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v32 = self;
    v33 = 2114;
    v34 = v18;
    v35 = 2114;
    v36 = v19;
    v37 = 2114;
    v38 = v20;
    v39 = 2114;
    v40 = v21;
    _os_log_impl(&dword_1B815E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Time zone is updated for %{public}@ old schedules: %{public}@, to %{public}@ new schedules: %{public}@", buf, 0x34u);

    a5 = v25;
  }

  v22 = -[HDMedicationScheduleManager insertMedicationSchedules:error:](self, "insertMedicationSchedules:error:", v16, a5);
  return v22;
}

id __94__HDMedicationScheduleManager__updateSchedulesToTimeZone_maintainCalendarDatesAndTimes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "createdUTCOffset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v9;
      v51 = 2114;
      v52 = v10;
      _os_log_impl(&dword_1B815E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Abort update to the same time zone: %{public}@.", buf, 0x16u);

    }
LABEL_7:
    v12 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v3, "isUnavailable"))
  {
    _HKInitializeLogging();
    HKLogMedication();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v50 = v11;
      _os_log_impl(&dword_1B815E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Abort update to unavailable schedule.", buf, 0xCu);
    }
    goto LABEL_7;
  }
  objc_msgSend(v3, "timeIntervals");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "secondsFromGMT");
  objc_msgSend(v3, "createdUTCOffset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 - objc_msgSend(v15, "secondsFromGMT");

  objc_msgSend(v3, "startDateTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDateTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cycleStartDate");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (*(_BYTE *)(a1 + 56))
  {
    v42 = (void *)v19;
    objc_msgSend(v3, "startDateTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (double)-v16;
    objc_msgSend(v21, "dateByAddingTimeInterval:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "endDateTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dateByAddingTimeInterval:", v22);
    v25 = objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v8 = v13;
    v26 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v45 != v28)
            objc_enumerationMutation(v8);
          v30 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "startTimeComponent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setTimeZone:", v30);

        }
        v27 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v27);
    }

    v17 = (void *)v23;
    v43 = (void *)v25;
    v32 = v42;
  }
  else
  {
    v43 = v18;
    objc_msgSend(v3, "timeIntervals");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDMedicationScheduleManager _makeIntervalsWithStartTimeFromIntervals:byAddingTimeDifferenceDuration:calendar:timeZone:]((uint64_t)HDMedicationScheduleManager, v33, v16, *(void **)(a1 + 48), *(void **)(a1 + 32));
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "cycleStartDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDMedicationScheduleManager _makeDateComponentsFromCycleStartDate:byAddingTimeDifferenceSec:calendar:]((uint64_t)HDMedicationScheduleManager, v34, v16, *(void **)(a1 + 48));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v35 = objc_alloc(MEMORY[0x1E0D2C480]);
  objc_msgSend(v3, "UUID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medicationIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *(_QWORD *)(a1 + 32);
  v39 = objc_msgSend(v3, "scheduleType");
  objc_msgSend(v3, "note");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v35, "initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:", v36, v37, v38, v17, v43, v8, v39, v32, v40);

LABEL_19:
  return v12;
}

+ (id)_makeIntervalsWithStartTimeFromIntervals:(uint64_t)a3 byAddingTimeDifferenceDuration:(void *)a4 calendar:(void *)a5 timeZone:
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;

  v8 = a4;
  v9 = a5;
  v10 = a2;
  objc_opt_self();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __121__HDMedicationScheduleManager__makeIntervalsWithStartTimeFromIntervals_byAddingTimeDifferenceDuration_calendar_timeZone___block_invoke;
  v15[3] = &unk_1E6E00610;
  v17 = v9;
  v18 = a3;
  v16 = v8;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "hk_map:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_makeDateComponentsFromCycleStartDate:(uint64_t)a3 byAddingTimeDifferenceSec:(void *)a4 calendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a2;
  objc_opt_self();
  objc_msgSend(v7, "setCalendar:", v6);
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateByAddingTimeInterval:", (double)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCalendar:", v6);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("GMT"));
  objc_msgSend(v10, "setTimeZone:", v11);

  return v10;
}

id __121__HDMedicationScheduleManager__makeIntervalsWithStartTimeFromIntervals_byAddingTimeDifferenceDuration_calendar_timeZone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "startTimeComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[HDMedicationScheduleManager _durationForDayHourMinuteSecondComponents:]((uint64_t)HDMedicationScheduleManager, v4);
  +[HDMedicationScheduleManager _hrMinSecSinceMidnightWithDuration:calendar:]((uint64_t)HDMedicationScheduleManager, *(_QWORD *)(a1 + 48) + v5, *(void **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v6, "setTimeZone:");
  v8 = objc_alloc(MEMORY[0x1E0D2C4A0]);
  v9 = objc_msgSend(v3, "daysOfWeek");
  objc_msgSend(v3, "cycleIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cycleIntervalDays");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dose");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v8, "initWithStartTimeComponent:daysOfWeek:cycleIndex:cycleIntervalDays:dose:", v7, v9, v10, v11, v12);
  return v13;
}

+ (uint64_t)_durationForDayHourMinuteSecondComponents:(uint64_t)a1
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "day") == 0x7FFFFFFFFFFFFFFFLL)
    v3 = 0;
  else
    v3 = 86400 * objc_msgSend(v2, "day");
  if (objc_msgSend(v2, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    v3 += 3600 * objc_msgSend(v2, "hour");
  if (objc_msgSend(v2, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    v3 += 60 * objc_msgSend(v2, "minute");
  if (objc_msgSend(v2, "second") != 0x7FFFFFFFFFFFFFFFLL)
    v3 += objc_msgSend(v2, "second");

  return v3;
}

+ (id)_hrMinSecSinceMidnightWithDuration:(void *)a3 calendar:
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  double v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_self();
  v5 = a2 % 86400;
  v6 = a2 % 86400 / 3600;
  v7 = a2 % 86400 - 3600 * v6;
  v8 = (int)v7 / 60;
  v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v11 = v10;
  if ((v5 + 3599) >= 0x1C1F)
    objc_msgSend(v10, "setHour:", v6);
  v9 = (double)(v7 - 60 * v8);
  if ((v7 + 59) >= 0x77)
    objc_msgSend(v11, "setMinute:", v8);
  if ((uint64_t)v9)
    objc_msgSend(v11, "setSecond:", (uint64_t)v9);
  objc_msgSend(v11, "setCalendar:", v4);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("GMT"));
  objc_msgSend(v11, "setTimeZone:", v12);

  return v11;
}

- (BOOL)deleteMedicationSchedule:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "deletedSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HDMedicationScheduleManager insertMedicationSchedule:error:](self, "insertMedicationSchedule:error:", v6, a4);

  return (char)a4;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[HDMedicationScheduleObserver registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)unregisterObserver:(id)a3
{
  -[HDMedicationScheduleObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)registerSynchronousObserver:(id)a3
{
  -[HDMedicationScheduleSynchronousObserver registerObserver:](self->_synchronousObservers, "registerObserver:", a3);
}

- (void)unregisterSynchronousObserver:(id)a3
{
  -[HDMedicationScheduleSynchronousObserver unregisterObserver:](self->_synchronousObservers, "unregisterObserver:", a3);
}

uint64_t __74__HDMedicationScheduleManager__notifyObserversForDidRescheduleMedications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scheduleManagerDidRescheduleMedications:", *(_QWORD *)(a1 + 32));
}

- (void)_notifyObserversDidPruneScheduleItems:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      HKLogMedication();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[HDMedicationScheduleManager _notifyObserversDidPruneScheduleItems:].cold.1(a1);

    }
    v7 = *(void **)(a1 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__HDMedicationScheduleManager__notifyObserversDidPruneScheduleItems___block_invoke;
    v8[3] = &unk_1E6E00660;
    v8[4] = a1;
    v9 = v3;
    objc_msgSend(v7, "notifyObservers:", v8);

  }
}

uint64_t __69__HDMedicationScheduleManager__notifyObserversDidPruneScheduleItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scheduleManager:didPruneScheduleItems:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)pruneAllScheduleItemsBeforeDate:(id)a3 createDoseEvents:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  id v19;
  int v20;
  HDMedicationScheduleManager *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    HKLogMedication();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[HDMedicationScheduleManager pruneAllScheduleItemsBeforeDate:createDoseEvents:error:].cold.1();

  }
  -[HDMedicationNotificationManager pruneAllScheduleItemsBeforeDate:createDoseEvents:error:](self->_notificationManager, "pruneAllScheduleItemsBeforeDate:createDoseEvents:error:", v8, v6, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HKDiagnosticStringFromDate();
    v18 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v18;
    if (a5)
      v19 = *a5;
    else
      v19 = 0;
    v20 = 138543874;
    v21 = self;
    v22 = 2114;
    v23 = v18;
    v24 = 2114;
    v25 = v19;
    _os_log_error_impl(&dword_1B815E000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to prune schedule items before date %{public}@ with error: %{public}@", (uint8_t *)&v20, 0x20u);
    goto LABEL_10;
  }
  if (objc_msgSend(v12, "count"))
    -[HDMedicationScheduleManager _notifyObserversDidPruneScheduleItems:]((uint64_t)self, v13);
  _HKInitializeLogging();
  HKLogMedication();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKDiagnosticStringFromDate();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = self;
    v22 = 2112;
    v23 = (uint64_t)v15;
    v24 = 2114;
    v25 = v16;
    _os_log_impl(&dword_1B815E000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully pruned %@ schedule items before date %{public}@", (uint8_t *)&v20, 0x20u);

LABEL_10:
  }
LABEL_12:

  return v13 != 0;
}

- (void)batchNotifyObserversOnCommitOfTransaction:(id)a3 didAddOrModifySchedule:(id)a4 syncIdentity:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;

  v8 = a3;
  if (-[HDMedicationScheduleManager _addPendingSchedule:syncIdentity:]((uint64_t)self, a4, a5))
  {
    objc_msgSend(v8, "protectedDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke;
    v14[3] = &unk_1E6E00688;
    v14[4] = self;
    v11 = v8;
    v15 = v11;
    objc_msgSend(v9, "beforeCommit:", v14);

    v12[4] = self;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke_2;
    v13[3] = &unk_1E6E006B0;
    v13[4] = self;
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke_3;
    v12[3] = &unk_1E6E006D8;
    objc_msgSend(v11, "onCommit:orRollback:", v13, v12);

  }
}

- (BOOL)_addPendingSchedule:(uint64_t)a3 syncIdentity:
{
  id v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 48);
    v7 = v6 == 0;
    if (!v6)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v8;

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, v10);
    }
    objc_msgSend(v11, "addObject:", v5);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke(uint64_t a1)
{
  -[HDMedicationScheduleManager _handleBeforeCommitOfTransaction:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  return 1;
}

- (void)_handleBeforeCommitOfTransaction:(uint64_t)a1
{
  void *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    -[HDMedicationScheduleManager _pendingSchedulesBySyncIdentity]((os_unfair_lock_s *)a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v5 = objc_msgSend(WeakRetained, "currentSyncIdentityPersistentID");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      -[HDMedicationScheduleManager _notifySynchronousObserversInTransaction:willReschedule:](a1, v8, v7);
      objc_msgSend((id)a1, "rescheduleMedicationsSynchronously:", 1);
      -[HDMedicationScheduleManager _notifySynchronousObserversInTransaction:didReschedule:](a1, v8, v7);
    }
    else
    {
      objc_msgSend((id)a1, "rescheduleMedicationsSynchronously:", 0);
    }

  }
}

void __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke_2(uint64_t a1)
{
  -[HDMedicationScheduleManager _handleScheduleTransactionCommit](*(_QWORD *)(a1 + 32));
}

- (void)_handleScheduleTransactionCommit
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    v4 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    os_unfair_lock_unlock(v2);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v11 = *(void **)(a1 + 24);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__HDMedicationScheduleManager__handleScheduleTransactionCommit__block_invoke;
    v14[3] = &unk_1E6E00728;
    v14[4] = a1;
    v15 = v3;
    v16 = v5;
    v17 = sel_scheduleManager_didAddOrModifySchedulesBySyncIdentity_;
    v12 = v5;
    v13 = v3;
    objc_msgSend(v11, "notifyObservers:", v14);

  }
}

void __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke_3(uint64_t a1)
{
  -[HDMedicationScheduleManager _handleScheduleTransactionRollback](*(_QWORD *)(a1 + 32));
}

- (void)_handleScheduleTransactionRollback
{
  os_unfair_lock_s *v2;
  void *v3;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v3 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (id)_pendingSchedulesBySyncIdentity
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 10;
    os_unfair_lock_lock(a1 + 10);
    v1 = (id *)objc_msgSend(v1[6], "copy");
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)_notifySynchronousObserversInTransaction:(void *)a3 willReschedule:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __87__HDMedicationScheduleManager__notifySynchronousObserversInTransaction_willReschedule___block_invoke;
    v8[3] = &unk_1E6E00700;
    v8[4] = a1;
    v9 = v5;
    v10 = v6;
    objc_msgSend(v7, "notifyObservers:", v8);

  }
}

- (void)_notifySynchronousObserversInTransaction:(void *)a3 didReschedule:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__HDMedicationScheduleManager__notifySynchronousObserversInTransaction_didReschedule___block_invoke;
    v8[3] = &unk_1E6E00700;
    v8[4] = a1;
    v9 = v5;
    v10 = v6;
    objc_msgSend(v7, "notifyObservers:", v8);

  }
}

uint64_t __87__HDMedicationScheduleManager__notifySynchronousObserversInTransaction_willReschedule___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "scheduleManager:transaction:willReschedule:", a1[4], a1[5], a1[6]);
}

uint64_t __86__HDMedicationScheduleManager__notifySynchronousObserversInTransaction_didReschedule___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "scheduleManager:transaction:didReschedule:", a1[4], a1[5], a1[6]);
}

void __63__HDMedicationScheduleManager__handleScheduleTransactionCommit__block_invoke(_QWORD *a1, void *a2)
{
  char v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_opt_respondsToSelector();
  v4 = a1[4];
  if ((v3 & 1) != 0)
    objc_msgSend(v5, "scheduleManager:didAddOrModifySchedulesBySyncIdentity:", v4, a1[5]);
  else
    objc_msgSend(v5, "scheduleManager:didAddOrModifySchedules:", v4, a1[6]);

}

- (id)orderingTermsForSortDescriptors:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    v9 = *MEMORY[0x1E0D2C260];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v9);

        if (!v13)
        {
          v17 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v11, "key");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "hk_assignError:code:format:", a4, 3, CFSTR("We don't have have any sort descriptor key defined for key: '%@'. Please add them here"), v18);

          v15 = obj;
          v16 = 0;
          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("creation_date"), objc_opt_class(), objc_msgSend(v11, "ascending"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
  v15 = obj;

  v16 = v5;
LABEL_11:

  return v16;
}

- (HDMedicationNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (id)unitTesting_willRunRescheduleOperationWithDelay
{
  return self->_unitTesting_willRunRescheduleOperationWithDelay;
}

- (void)setUnitTesting_willRunRescheduleOperationWithDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)unitTesting_didRunRescheduleOperationWithDelay
{
  return self->_unitTesting_didRunRescheduleOperationWithDelay;
}

- (void)setUnitTesting_didRunRescheduleOperationWithDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didRunRescheduleOperationWithDelay, 0);
  objc_storeStrong(&self->_unitTesting_willRunRescheduleOperationWithDelay, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_rescheduleOperation, 0);
  objc_storeStrong((id *)&self->_timeZoneManager, 0);
  objc_storeStrong((id *)&self->_observersLock_pendingSchedulesBySyncIdentity, 0);
  objc_storeStrong((id *)&self->_synchronousObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)medicationSchedule:medicationIdentifier:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(v0, v1);
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B815E000, v3, v4, "[%{public}@] Fetching medication schedule with medication: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchMedicationSchedule:predicate:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Fetch medication schedule failed with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)medicationSchedule:identifier:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(v0, v1);
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B815E000, v3, v4, "[%{public}@] Fetching medication schedule with schedule: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)medicationSchedulesWithPredicate:transaction:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(v0, v1);
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B815E000, v3, v4, "[%{public}@] Fetching medication schedules with predicate: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)insertMedicationSchedule:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(v0, v1);
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B815E000, v3, v4, "[%{public}@] Inserting medication schedule: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)insertMedicationSchedules:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  _os_log_debug_impl(&dword_1B815E000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@] Inserting %{public}@ medication schedules: %{public}@", (uint8_t *)&v7, 0x20u);

}

- (void)rescheduleMedicationsWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1B815E000, a2, a3, "[%{public}@] Rescheduling medications", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_notifyObserversForDidRescheduleMedications
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 24), "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B815E000, v2, v3, "[%{public}@] Notifying %{public}@ observers of reschedule items.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)rescheduleMedicationsSynchronously:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@]: Failed to reschedule medications synchronously: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_hasPersistedRescheduleRequiredOnNextUnlockFlag
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[14];
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  v4 = CFSTR("rescheduleRequired");
  v5 = v0;
  v6 = v1;
  _os_log_error_impl(&dword_1B815E000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get value for key %{public}@: %{public}@", v3, 0x20u);
}

- (void)updateNotificationSent:scheduleItemIdentifier:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(v0, v1);
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B815E000, v3, v4, "[%{public}@] Updating notification sent for schedule item: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_0();
  HKStringFromBool();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B815E000, v1, v2, "[%{public}@] Updating schedules for local time zone with maintainCalendarDatesAndTimes: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)_notifyObserversDidPruneScheduleItems:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 24), "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B815E000, v2, v3, "[%{public}@] Notifying %{public}@ observers of prune schedule items.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)pruneAllScheduleItemsBeforeDate:createDoseEvents:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(v0, v1);
  HKDiagnosticStringFromDate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B815E000, v3, v4, "[%{public}@] Started pruning schedule items before date %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
