@implementation FCGoalCompletionCoordinator

- (FCGoalCompletionCoordinator)initWithProfile:(id)a3 serviceQueue:(id)a4
{
  id v6;
  id v7;
  FCGoalCompletionCoordinator *v8;
  FCGoalCompletionStore *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FCGoalCompletionCoordinator;
  v8 = -[FCGoalCompletionCoordinator init](&v11, sel_init);
  if (v8)
  {
    v9 = -[FCGoalCompletionStore initWithProfile:]([FCGoalCompletionStore alloc], "initWithProfile:", v6);
    v8 = -[FCGoalCompletionCoordinator initWithProfile:goalCompletionStore:serviceQueue:](v8, "initWithProfile:goalCompletionStore:serviceQueue:", v6, v9, v7);

  }
  return v8;
}

- (FCGoalCompletionCoordinator)initWithProfile:(id)a3 goalCompletionStore:(id)a4 serviceQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCGoalCompletionCoordinator *v11;
  FCGoalCompletionCoordinator *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FCGoalCompletionCoordinator;
  v11 = -[FCGoalCompletionCoordinator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_goalCompletionStore, a4);
    objc_storeWeak((id *)&v12->_profile, v8);
    objc_storeStrong((id *)&v12->_serviceQueue, a5);
  }

  return v12;
}

- (id)goalTypesToNotifyByActivitySummaryIndex
{
  return -[FCGoalCompletionStore goalTypesToNotifyByActivitySummaryIndex](self->_goalCompletionStore, "goalTypesToNotifyByActivitySummaryIndex");
}

- (void)notificationPosted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1CC30F000, v5, OS_LOG_TYPE_DEFAULT, "Removing goal completion types for content %@", (uint8_t *)&v9, 0xCu);
  }
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "completedGoalTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCGoalCompletionCoordinator notificationPostedForGoalTypes:activitySummaryIndex:](self, "notificationPostedForGoalTypes:activitySummaryIndex:", v8, objc_msgSend(v4, "activitySummaryIndex"));
}

- (void)notificationPostedForGoalTypes:(id)a3 activitySummaryIndex:(int64_t)a4
{
  -[FCGoalCompletionStore removeGoalTypesToNotify:activitySummaryIndex:](self->_goalCompletionStore, "removeGoalTypesToNotify:activitySummaryIndex:", a3, a4);
}

- (BOOL)runDailyGoalCompletionDetectionForGoalType:(int64_t)a3 activitySummaryIndex:(int64_t)a4 previousValue:(double)a5 currentValue:(double)a6 goalValue:(double)a7 shouldAlert:(BOOL)a8 goalMetHandler:(id)a9
{
  _BOOL4 v9;
  uint64_t (**v16)(_QWORD, double, double);
  char v17;
  int v18;
  char v19;
  const __CFString *v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  int v24;
  os_log_t *v25;
  NSObject *v26;
  _BOOL4 v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  os_log_t v31;
  FCGoalCompletionStore *goalCompletionStore;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  _BYTE v38[24];
  double v39;
  _BYTE v40[24];
  uint64_t v41;

  v9 = a8;
  v41 = *MEMORY[0x1E0C80C00];
  v16 = (uint64_t (**)(_QWORD, double, double))a9;
  if (!-[FCGoalCompletionCoordinator _goalTypeAllowed:](self, "_goalTypeAllowed:", a3))
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E0CB5298];
    v22 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    *(_DWORD *)v38 = 67109120;
    *(_DWORD *)&v38[4] = a3;
    _os_log_impl(&dword_1CC30F000, v21, OS_LOG_TYPE_DEFAULT, "Goal type %d not allowed on device", v38, 8u);
LABEL_12:
    v22 = 0;
    goto LABEL_30;
  }
  if (a5 >= a7)
    -[FCGoalCompletionStore addDailyGoalTypePreviouslyMet:activitySummaryIndex:](self->_goalCompletionStore, "addDailyGoalTypePreviouslyMet:activitySummaryIndex:", a3, a4);
  v17 = v16[2](v16, a5, a7);
  v18 = v16[2](v16, a6, a7);
  v19 = v18;
  if ((v17 & 1) != 0 || !v18)
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEBUG))
      -[FCGoalCompletionCoordinator runDailyGoalCompletionDetectionForGoalType:activitySummaryIndex:previousValue:currentValue:goalValue:shouldAlert:goalMetHandler:].cold.1(v17, v19, v23);
    goto LABEL_12;
  }
  if ((unint64_t)a3 > 4)
    v20 = CFSTR("Unknown");
  else
    v20 = off_1E88007E0[a3];
  v24 = objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall");
  _HKInitializeLogging();
  v25 = (os_log_t *)MEMORY[0x1E0CB5298];
  v26 = *MEMORY[0x1E0CB5298];
  v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (v27)
    {
      *(_DWORD *)v38 = 138413314;
      *(_QWORD *)&v38[4] = v20;
      *(_WORD *)&v38[12] = 2048;
      *(_QWORD *)&v38[14] = a4;
      *(_WORD *)&v38[22] = 2048;
      v39 = a5;
      *(_WORD *)v40 = 2048;
      *(double *)&v40[2] = a6;
      *(_WORD *)&v40[10] = 2048;
      *(double *)&v40[12] = a7;
      v28 = "Goal type %@ for summary index %lld went from %f to %f; goal is %f";
      v29 = v26;
      v30 = 52;
LABEL_19:
      _os_log_impl(&dword_1CC30F000, v29, OS_LOG_TYPE_DEFAULT, v28, v38, v30);
    }
  }
  else if (v27)
  {
    *(_DWORD *)v38 = 138412290;
    *(_QWORD *)&v38[4] = v20;
    v28 = "Goal type %@ today value updated";
    v29 = v26;
    v30 = 12;
    goto LABEL_19;
  }
  if (-[FCGoalCompletionStore isDailyGoalTypeMet:activitySummaryIndex:](self->_goalCompletionStore, "isDailyGoalTypeMet:activitySummaryIndex:", a3, a4, *(_OWORD *)v38, *(_QWORD *)&v38[16], *(_QWORD *)&v39, *(_OWORD *)v40, *(_QWORD *)&v40[16], v41))
  {
    _HKInitializeLogging();
    v31 = *v25;
    if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
    {
      goalCompletionStore = self->_goalCompletionStore;
      v33 = v31;
      -[FCGoalCompletionStore allGoalTypesMetForActivitySummaryIndex:](goalCompletionStore, "allGoalTypesMetForActivitySummaryIndex:", a4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v38 = 138543874;
      *(_QWORD *)&v38[4] = v20;
      *(_WORD *)&v38[12] = 2048;
      *(_QWORD *)&v38[14] = a4;
      *(_WORD *)&v38[22] = 2112;
      v39 = *(double *)&v34;
      _os_log_impl(&dword_1CC30F000, v33, OS_LOG_TYPE_DEFAULT, "Attempted to add goal type %{public}@ that was already added for activitySummaryIndex: %lld; existing set is %@",
        v38,
        0x20u);

    }
  }
  else
  {
    -[FCGoalCompletionStore addGoalTypeToDailyGoalTypesMet:activitySummaryIndex:](self->_goalCompletionStore, "addGoalTypeToDailyGoalTypesMet:activitySummaryIndex:", a3, a4);
    _HKInitializeLogging();
    v35 = *v25;
    v36 = os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v36)
      {
        *(_DWORD *)v38 = 138543362;
        *(_QWORD *)&v38[4] = v20;
        _os_log_impl(&dword_1CC30F000, v35, OS_LOG_TYPE_DEFAULT, "Goal type %{public}@ was just met, notifying", v38, 0xCu);
      }
      -[FCGoalCompletionStore addGoalTypeToNotify:activitySummaryIndex:](self->_goalCompletionStore, "addGoalTypeToNotify:activitySummaryIndex:", a3, a4);
    }
    else if (v36)
    {
      *(_DWORD *)v38 = 138543362;
      *(_QWORD *)&v38[4] = v20;
      _os_log_impl(&dword_1CC30F000, v35, OS_LOG_TYPE_DEFAULT, "Goal type %{public}@ was just met, but we are told not to notify (paused rings)", v38, 0xCu);
    }
  }
  v22 = 1;
LABEL_30:

  return v22;
}

- (void)concludeGoalDetectionRun
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCGoalCompletionCoordinator _activitySummaryIndexForDate:](self, "_activitySummaryIndexForDate:", v3);

  -[FCGoalCompletionStore goalTypesToNotifyForActivitySummaryIndex:](self->_goalCompletionStore, "goalTypesToNotifyForActivitySummaryIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v14 = 134217984;
      v15 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1CC30F000, v7, OS_LOG_TYPE_DEFAULT, "Goal Completion Coordinator requesting notification for %ld completed goal types", (uint8_t *)&v14, 0xCu);

    }
    v8 = objc_alloc(MEMORY[0x1E0D22128]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithActivitySummaryIndex:identifier:completedGoalTypes:", v4, v10, v11);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "coordinator:postGoalCompletionNotification:", self, v12);

  }
}

- (int64_t)_activitySummaryIndexForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", *MEMORY[0x1E0CB73B0], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _HKCacheIndexFromDateComponents();
  return v7;
}

- (BOOL)_goalTypeAllowed:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isAppleWatch"))
    v7 = &unk_1E8805C40;
  else
    v7 = &unk_1E8805C28;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  return v9;
}

- (FCGoalCompletionCoordinatorDelegate)delegate
{
  return (FCGoalCompletionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_goalCompletionStore, 0);
}

- (void)runDailyGoalCompletionDetectionForGoalType:(os_log_t)log activitySummaryIndex:previousValue:currentValue:goalValue:shouldAlert:goalMetHandler:.cold.1(char a1, char a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  v4 = 1024;
  v5 = a2 & 1;
  _os_log_debug_impl(&dword_1CC30F000, log, OS_LOG_TYPE_DEBUG, "Goal previously met %{BOOL}d, currently met %{BOOL}d", (uint8_t *)v3, 0xEu);
}

@end
