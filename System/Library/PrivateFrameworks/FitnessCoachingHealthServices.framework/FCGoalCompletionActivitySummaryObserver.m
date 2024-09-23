@implementation FCGoalCompletionActivitySummaryObserver

- (FCGoalCompletionActivitySummaryObserver)initWithProfile:(id)a3 serviceQueue:(id)a4
{
  id v6;
  id v7;
  FCGoalCompletionActivitySummaryObserver *v8;
  FCGoalCompletionActivitySummaryObserver *v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FCGoalCompletionActivitySummaryObserver;
  v8 = -[FCGoalCompletionActivitySummaryObserver init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_serviceQueue, a4);
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1CC30F000, v10, OS_LOG_TYPE_DEFAULT, "Profile ready for activity summary observer", v12, 2u);
    }
    objc_msgSend(v6, "registerProfileReadyObserver:queue:", v9, v9->_serviceQueue);
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "currentActivitySummaryHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)FCGoalCompletionActivitySummaryObserver;
  -[FCGoalCompletionActivitySummaryObserver dealloc](&v5, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CC30F000, v5, OS_LOG_TYPE_DEFAULT, "Profile ready for activity summary observer", v7, 2u);
  }
  objc_msgSend(v4, "currentActivitySummaryHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObserver:", self);
}

- (void)_runGoalCompletionsForNewActivitySummary:(id)a3 forChangedFields:(unint64_t)a4
{
  __int16 v4;
  HKActivitySummary *v6;
  HKActivitySummary *previousActivitySummary;
  uint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  HKActivitySummary *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id WeakRetained;
  HKActivitySummary *v37;
  int v38;
  HKActivitySummary *v39;
  __int16 v40;
  HKActivitySummary *v41;
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v6 = (HKActivitySummary *)a3;
  previousActivitySummary = self->_previousActivitySummary;
  if (previousActivitySummary)
  {
    v8 = -[HKActivitySummary _activitySummaryIndex](previousActivitySummary, "_activitySummaryIndex");
    if (v8 == -[HKActivitySummary _activitySummaryIndex](v6, "_activitySummaryIndex"))
    {
      v9 = (os_log_t *)MEMORY[0x1E0CB5298];
      if ((v4 & 0x4002) != 0)
      {
        -[FCGoalCompletionActivitySummaryObserver _runGoalCompletionForMoveWithNewActivitySummary:](self, "_runGoalCompletionForMoveWithNewActivitySummary:", v6);
        if ((v4 & 4) != 0)
          goto LABEL_13;
LABEL_10:
        _HKInitializeLogging();
        v20 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
          -[FCGoalCompletionActivitySummaryObserver _runGoalCompletionsForNewActivitySummary:forChangedFields:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
        goto LABEL_14;
      }
      _HKInitializeLogging();
      v12 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
      {
        -[FCGoalCompletionActivitySummaryObserver _runGoalCompletionsForNewActivitySummary:forChangedFields:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
        if ((v4 & 4) == 0)
          goto LABEL_10;
      }
      else if ((v4 & 4) == 0)
      {
        goto LABEL_10;
      }
LABEL_13:
      -[FCGoalCompletionActivitySummaryObserver _runGoalCompletionForExerciseWithNewActivitySummary:](self, "_runGoalCompletionForExerciseWithNewActivitySummary:", v6);
LABEL_14:
      if ((v4 & 8) != 0)
      {
        -[FCGoalCompletionActivitySummaryObserver _runGoalCompletionForStandWithNewActivitySummary:](self, "_runGoalCompletionForStandWithNewActivitySummary:", v6);
      }
      else
      {
        _HKInitializeLogging();
        v28 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
          -[FCGoalCompletionActivitySummaryObserver _runGoalCompletionsForNewActivitySummary:forChangedFields:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "concludeGoalDetectionRun");

      goto LABEL_19;
    }
  }
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_previousActivitySummary;
    v38 = 138412546;
    v39 = v11;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_1CC30F000, v10, OS_LOG_TYPE_DEFAULT, "FCGoalCompletionActivitySummaryObserver running for goal completions and previous summary (%@) is either nil, doesn't have the same index as newSummary (%@)", (uint8_t *)&v38, 0x16u);
  }
LABEL_19:
  v37 = self->_previousActivitySummary;
  self->_previousActivitySummary = v6;

}

- (BOOL)_runGoalCompletionForMoveWithNewActivitySummary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  int v17;
  NSObject *v18;
  uint8_t v20[16];

  v4 = a3;
  if (objc_msgSend(v4, "activityMoveMode") == 2)
    objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  else
    objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FIMoveGoalQuantityForActivitySummary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FIMoveQuantityForActivitySummary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FIMoveQuantityForActivitySummary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKActivitySummary activityMoveMode](self->_previousActivitySummary, "activityMoveMode") == HKActivityMoveModeAppleMoveTime)
    objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  else
    objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v5);
  v11 = v10;
  objc_msgSend(v7, "doubleValueForUnit:", v5);
  v13 = v12;
  objc_msgSend(v8, "doubleValueForUnit:", v9);
  v15 = v14;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = objc_msgSend(WeakRetained, "runDailyGoalCompletionDetectionForGoalType:activitySummaryIndex:previousValue:currentValue:goalValue:shouldAlert:goalMetHandler:", 1, objc_msgSend(v4, "_activitySummaryIndex"), objc_msgSend(v4, "isPaused") ^ 1, &__block_literal_global_0, v15, v13, v11);

  if (v17)
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1CC30F000, v18, OS_LOG_TYPE_DEFAULT, "Move goal complete!", v20, 2u);
    }
  }

  return v17;
}

BOOL __91__FCGoalCompletionActivitySummaryObserver__runGoalCompletionForMoveWithNewActivitySummary___block_invoke(double a1, double a2)
{
  return a1 >= a2;
}

- (BOOL)_runGoalCompletionForExerciseWithNewActivitySummary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id WeakRetained;
  uint64_t v18;
  int v19;
  NSObject *v20;
  uint8_t v22[16];

  v4 = a3;
  objc_msgSend(v4, "appleExerciseTimeGoal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v6);
  v8 = v7;

  -[HKActivitySummary appleExerciseTime](self->_previousActivitySummary, "appleExerciseTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v10);
  v12 = v11;

  objc_msgSend(v4, "appleExerciseTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v14);
  v16 = v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v18 = objc_msgSend(v4, "_activitySummaryIndex");
  LODWORD(v14) = objc_msgSend(v4, "isPaused");

  v19 = objc_msgSend(WeakRetained, "runDailyGoalCompletionDetectionForGoalType:activitySummaryIndex:previousValue:currentValue:goalValue:shouldAlert:goalMetHandler:", 2, v18, v14 ^ 1, &__block_literal_global_188_0, v12, v16, v8);
  if (v19)
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1CC30F000, v20, OS_LOG_TYPE_DEFAULT, "Exercise goal complete!", v22, 2u);
    }
  }
  return v19;
}

BOOL __95__FCGoalCompletionActivitySummaryObserver__runGoalCompletionForExerciseWithNewActivitySummary___block_invoke(double a1, double a2)
{
  return a1 >= a2;
}

- (BOOL)_runGoalCompletionForStandWithNewActivitySummary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id WeakRetained;
  uint64_t v18;
  int v19;
  NSObject *v20;
  uint8_t v22[16];

  v4 = a3;
  objc_msgSend(v4, "appleStandHoursGoal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v6);
  v8 = round(v7);

  -[HKActivitySummary appleStandHours](self->_previousActivitySummary, "appleStandHours");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v10);
  v12 = round(v11);

  objc_msgSend(v4, "appleStandHours");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v14);
  v16 = round(v15);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v18 = objc_msgSend(v4, "_activitySummaryIndex");
  LODWORD(v14) = objc_msgSend(v4, "isPaused");

  v19 = objc_msgSend(WeakRetained, "runDailyGoalCompletionDetectionForGoalType:activitySummaryIndex:previousValue:currentValue:goalValue:shouldAlert:goalMetHandler:", 3, v18, v14 ^ 1, &__block_literal_global_189, v12, v16, v8);
  if (v19)
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1CC30F000, v20, OS_LOG_TYPE_DEFAULT, "Stand goal complete!", v22, 2u);
    }
  }
  return v19;
}

BOOL __92__FCGoalCompletionActivitySummaryObserver__runGoalCompletionForStandWithNewActivitySummary___block_invoke(double a1, double a2)
{
  return (uint64_t)llround(a1) >= (uint64_t)llround(a2);
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7;
  NSObject *serviceQueue;
  id v9;
  _QWORD block[4];
  id v11;
  FCGoalCompletionActivitySummaryObserver *v12;
  unint64_t v13;

  v7 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__FCGoalCompletionActivitySummaryObserver_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke;
  block[3] = &unk_1E88009B8;
  v11 = v7;
  v12 = self;
  v13 = a5;
  v9 = v7;
  dispatch_async(serviceQueue, block);

}

void __116__FCGoalCompletionActivitySummaryObserver_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E0CB5298];
  v3 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1CC30F000, v3, OS_LOG_TYPE_DEFAULT, "FCGoalCompletionActivitySummaryObserver got today activity summary: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(void **)(a1 + 32);
  if (v5 && (objc_msgSend(v5, "_isDataLoading") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_runGoalCompletionsForNewActivitySummary:forChangedFields:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    _HKInitializeLogging();
    v6 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1CC30F000, v6, OS_LOG_TYPE_DEFAULT, "FCGoalCompletionActivitySummaryObserver today activity summary is either nil or still loading data", (uint8_t *)&v7, 2u);
    }
  }
}

- (FCDailyActivityGoalDetectionDelegate)delegate
{
  return (FCDailyActivityGoalDetectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_previousActivitySummary, 0);
  objc_storeStrong((id *)&self->_currentActivitySummary, 0);
}

- (void)_runGoalCompletionsForNewActivitySummary:(uint64_t)a3 forChangedFields:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1CC30F000, a1, a3, "FCGoalCompletionActivitySummaryObserver today activity summary did not have stand value changes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_runGoalCompletionsForNewActivitySummary:(uint64_t)a3 forChangedFields:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1CC30F000, a1, a3, "FCGoalCompletionActivitySummaryObserver today activity summary did not have exercise value changes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_runGoalCompletionsForNewActivitySummary:(uint64_t)a3 forChangedFields:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1CC30F000, a1, a3, "FCGoalCompletionActivitySummaryObserver today activity summary did not have move value changes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
