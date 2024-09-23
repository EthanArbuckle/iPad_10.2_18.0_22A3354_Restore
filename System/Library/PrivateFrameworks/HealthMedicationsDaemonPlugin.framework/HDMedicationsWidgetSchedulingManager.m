@implementation HDMedicationsWidgetSchedulingManager

- (HDMedicationsWidgetSchedulingManager)initWithProfile:(id)a3
{
  id v4;
  HDMedicationsWidgetSchedulingManager *v5;
  HDMedicationsWidgetSchedulingManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  NSCountedSet *v9;
  NSCountedSet *queue_reloadReasons;
  id WeakRetained;
  id v12;
  OS_dispatch_queue *v13;
  uint64_t v14;
  _HKDelayedOperation *reloadOperation;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HDMedicationsWidgetSchedulingManager;
  v5 = -[HDMedicationsWidgetSchedulingManager init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    queue_reloadReasons = v6->_queue_reloadReasons;
    v6->_queue_reloadReasons = v9;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, v6->_queue);

    objc_initWeak(&location, v6);
    v12 = objc_alloc(MEMORY[0x1E0CB6F80]);
    v13 = v6->_queue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__HDMedicationsWidgetSchedulingManager_initWithProfile___block_invoke;
    v17[3] = &unk_1E6E003D0;
    objc_copyWeak(&v18, &location);
    v14 = objc_msgSend(v12, "initWithMode:clock:queue:delay:block:", 0, 1, v13, v17, 1.0);
    reloadOperation = v6->_reloadOperation;
    v6->_reloadOperation = (_HKDelayedOperation *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __56__HDMedicationsWidgetSchedulingManager_initWithProfile___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_reloadWidgets");

}

- (void)dealloc
{
  objc_super v3;

  -[HDMedicationsWidgetSchedulingManager _stopObservingMedicationChanges](self, "_stopObservingMedicationChanges");
  v3.receiver = self;
  v3.super_class = (Class)HDMedicationsWidgetSchedulingManager;
  -[HDMedicationsWidgetSchedulingManager dealloc](&v3, sel_dealloc);
}

+ (id)defaultMedicationsWidgetTimelineControllerForProfile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id *v7;
  id v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(v3, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isAppleWatch");
  v7 = (id *)MEMORY[0x1E0D2C398];
  if (!v6)
    v7 = (id *)MEMORY[0x1E0D2C390];
  v8 = *v7;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v9 = (void *)getCHSTimelineControllerClass_softClass;
  v18 = getCHSTimelineControllerClass_softClass;
  if (!getCHSTimelineControllerClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getCHSTimelineControllerClass_block_invoke;
    v14[3] = &unk_1E6E01B38;
    v14[4] = &v15;
    __getCHSTimelineControllerClass_block_invoke((uint64_t)v14);
    v9 = (void *)v16[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v15, 8);
  v11 = [v10 alloc];
  v12 = (void *)objc_msgSend(v11, "initWithExtensionBundleIdentifier:kind:", v8, *MEMORY[0x1E0D2C3A0]);

  return v12;
}

+ (id)defaultMedicationsWidgetRelevanceController
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getCHSWidgetServiceClass_softClass;
  v9 = getCHSWidgetServiceClass_softClass;
  if (!getCHSWidgetServiceClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCHSWidgetServiceClass_block_invoke;
    v5[3] = &unk_1E6E01B38;
    v5[4] = &v6;
    __getCHSWidgetServiceClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "sharedWidgetService");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)profileDidBecomeReady:(id)a3
{
  NSObject *v4;
  id v5;
  id WeakRetained;
  void *v7;
  OS_dispatch_queue *queue;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = (id)objc_opt_class();
    v5 = v11;
    _os_log_impl(&dword_1B815E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] profileDidBecomeReady", buf, 0xCu);

  }
  -[HDMedicationsWidgetSchedulingManager _startObservingMedicationChanges](self, "_startObservingMedicationChanges");
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__HDMedicationsWidgetSchedulingManager_profileDidBecomeReady___block_invoke;
  v9[3] = &unk_1E6E006B0;
  v9[4] = self;
  objc_msgSend(v7, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v9);

}

uint64_t __62__HDMedicationsWidgetSchedulingManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v3 = v6;
    _os_log_impl(&dword_1B815E000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] first unlock occurred", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_runReloadOperationForReason:", 0);
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  HDMedicationsWidgetSchedulingManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1B815E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] dose event samples added", (uint8_t *)&v7, 0xCu);
  }

  -[HDMedicationsWidgetSchedulingManager _reloadWidgetIfNecessaryWithDoseEvents:](self, "_reloadWidgetIfNecessaryWithDoseEvents:", v5);
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  HDMedicationsWidgetSchedulingManager *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB68B0];
  v6 = a3;
  objc_msgSend(v5, "medicationDoseEventType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] dose event samples removed", (uint8_t *)&v10, 0xCu);
    }

    -[HDMedicationsWidgetSchedulingManager _runReloadOperationForReason:](self, "_runReloadOperationForReason:", 2);
  }
}

- (void)scheduleManagerDidRescheduleMedications:(id)a3
{
  NSObject *v4;
  int v5;
  HDMedicationsWidgetSchedulingManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B815E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] medications rescheduled", (uint8_t *)&v5, 0xCu);
  }

  -[HDMedicationsWidgetSchedulingManager _runReloadOperationForReason:](self, "_runReloadOperationForReason:", 3);
}

- (void)scheduleManager:(id)a3 didPruneScheduleItems:(id)a4
{
  NSObject *v5;
  int v6;
  HDMedicationsWidgetSchedulingManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] medication schedules pruned", (uint8_t *)&v6, 0xCu);
  }

  -[HDMedicationsWidgetSchedulingManager _runReloadOperationForReason:](self, "_runReloadOperationForReason:", 4);
}

- (void)scheduleManager:(id)a3 didAddOrModifySchedules:(id)a4
{
  NSObject *v5;
  int v6;
  HDMedicationsWidgetSchedulingManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] medication schedules added or updated", (uint8_t *)&v6, 0xCu);
  }

  -[HDMedicationsWidgetSchedulingManager _runReloadOperationForReason:](self, "_runReloadOperationForReason:", 5);
}

- (void)_startObservingMedicationChanges
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forDataType:", self, v6);

  v9 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v9, "healthMedicationsProfileExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "medicationScheduleManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerObserver:queue:", self, 0);

}

- (void)_stopObservingMedicationChanges
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forDataType:", self, v6);

  v9 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v9, "healthMedicationsProfileExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "medicationScheduleManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterObserver:", self);

}

- (void)_runReloadOperationForReason:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__HDMedicationsWidgetSchedulingManager__runReloadOperationForReason___block_invoke;
  v4[3] = &unk_1E6E00468;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __69__HDMedicationsWidgetSchedulingManager__runReloadOperationForReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "execute");
}

- (void)_queue_reloadWidgets
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (id)objc_opt_class();
  objc_msgSend(a2, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_1B815E000, v4, v5, "[%{public}@] error while trying to reload widget: %@", v6, v7, v8, v9, 2u);

}

+ (id)_reloadReasonsStringForReasons:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("medications ["));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__HDMedicationsWidgetSchedulingManager__reloadReasonsStringForReasons___block_invoke;
  v9[3] = &unk_1E6E01AC0;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v6, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), v5, v9);
  objc_msgSend(v6, "appendString:", CFSTR("]"));

  return v6;
}

id __71__HDMedicationsWidgetSchedulingManager__reloadReasonsStringForReasons___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "integerValue");
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  HDStringFromMedicationsWidgetSchedulingManagerReloadReason(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v3);

  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@: %d"), v6, v7);
  return v8;
}

- (void)_reloadWidgetIfNecessaryWithDoseEvents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__HDMedicationsWidgetSchedulingManager__reloadWidgetIfNecessaryWithDoseEvents___block_invoke;
  v15[3] = &unk_1E6E01AE8;
  v7 = v6;
  v16 = v7;
  v8 = objc_msgSend(v5, "hk_containsObjectPassingTest:", v15);

  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      v12 = v11;
      _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] recent dose events detected scheduling reload", buf, 0xCu);

    }
    -[HDMedicationsWidgetSchedulingManager _runReloadOperationForReason:](self, "_runReloadOperationForReason:", 1);
  }
  else
  {
    if (v10)
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      v14 = v13;
      _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] no recent dose events detected skipping reload", buf, 0xCu);

    }
  }

}

unint64_t __79__HDMedicationsWidgetSchedulingManager__reloadWidgetIfNecessaryWithDoseEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isDateInToday:", v5) & 1) != 0)
    {
      LODWORD(v6) = 1;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "endDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend((id)v6, "isDateInToday:", v7);

    }
    if (objc_msgSend(v3, "logOrigin") == 2)
      v6 = v6;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_invalidateRelevancesWithReason:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "healthMedicationsProfileExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createMedicationsWidgetRelevanceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0D2C3A0];
  v9 = *MEMORY[0x1E0CB5668];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__HDMedicationsWidgetSchedulingManager__invalidateRelevancesWithReason___block_invoke;
  v11[3] = &unk_1E6E01B10;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v7, "invalidateRelevancesOfKind:inBundle:completion:", v8, v9, v11);

}

void __72__HDMedicationsWidgetSchedulingManager__invalidateRelevancesWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1BCCADA70](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, *(_QWORD *)(a1 + 40), v3);
  _HKInitializeLogging();
  HKLogMedication();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__HDMedicationsWidgetSchedulingManager__invalidateRelevancesWithReason___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v8 = v10;
    _os_log_impl(&dword_1B815E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully invalidated relevances", (uint8_t *)&v9, 0xCu);

  }
}

+ (BOOL)_deviceRequiresInvalidationForWidgetRelevance
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleWatch");

  return v3;
}

- (id)unitTesting_didInvalidateRelevancesHandler
{
  return self->_unitTesting_didInvalidateRelevancesHandler;
}

- (void)setUnitTesting_didInvalidateRelevancesHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didInvalidateRelevancesHandler, 0);
  objc_storeStrong((id *)&self->_reloadOperation, 0);
  objc_storeStrong((id *)&self->_queue_reloadReasons, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __72__HDMedicationsWidgetSchedulingManager__invalidateRelevancesWithReason___block_invoke_cold_1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_1_1(&dword_1B815E000, v1, v2, "[%{public}@] error invalidating relevances: %{public}@", v3, v4, v5, v6, 2u);

}

@end
