@implementation ACHMonthlyChallengeEvaluationEnvironment

- (ACHMonthlyChallengeEvaluationEnvironment)initWithMonthlyChallengeDataSource:(id)a3 dateComponentInterval:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  ACHMonthlyChallengeEvaluationEnvironment *v11;
  ACHMonthlyChallengeEvaluationEnvironment *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACHMonthlyChallengeEvaluationEnvironment;
  v11 = -[ACHMonthlyChallengeEvaluationEnvironment init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeStrong((id *)&v12->_dateComponentInterval, a4);
    objc_storeStrong((id *)&v12->_calendar, a5);
  }

  return v12;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  ACHLogMonthlyChallenges();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ACHMonthlyChallengeEvaluationEnvironment valueForUndefinedKey:].cold.1((uint64_t)v3, v4);

  return 0;
}

- (double)numberOfDaysClosingAllThreeRingsInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 1);
  return result;
}

- (double)numberOfDaysClosingMoveRingInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 2);
  return result;
}

- (double)numberOfDaysClosingExerciseRingInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 3);
  return result;
}

- (double)numberOfDaysClosingStandRingInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 4);
  return result;
}

- (double)totalEnergyBurnInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 5);
  return result;
}

- (double)totalMoveTimeInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 22);
  return result;
}

- (double)totalExerciseMinutesInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 6);
  return result;
}

- (double)numberOfWorkoutsCompletedInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 7);
  return result;
}

- (double)totalWalkingRunningDistanceInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 20);
  return result;
}

- (double)numberOfDaysDoublingMoveGoalInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 21);
  return result;
}

- (double)numberOfDaysDoublingExerciseGoalInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 23);
  return result;
}

- (double)longestMoveStreakInCurrentMonth
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[ACHMonthlyChallengeEvaluationEnvironment dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeEvaluationEnvironment dateComponentInterval](self, "dateComponentInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v3, "longestStreakOfType:duringDateComponentInterval:error:", 0, v4, &v9);
  v6 = v9;

  if (v6)
  {
    ACHLogMonthlyChallenges();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching longestMoveStreakInCurrentMonth value: %@", buf, 0xCu);
    }

  }
  return (double)v5;
}

- (double)currentMoveStreakInCurrentMonth
{
  double result;

  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", 24);
  return result;
}

- (id)numberOfCompletedWorkoutsInCurrentMonthForChallengeType:(id)a3
{
  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", objc_msgSend(a3, "integerValue"));
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
}

- (id)eligibleSpecificWorkoutChallengeType
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  id v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__ACHMonthlyChallengeEvaluationEnvironment_eligibleSpecificWorkoutChallengeType__block_invoke;
  v6[3] = &unk_24D13BDE0;
  v6[4] = self;
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199C9184](v6, a2);
  v2[2](v2, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v2[2](v2, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id __80__ACHMonthlyChallengeEvaluationEnvironment_eligibleSpecificWorkoutChallengeType__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  _QWORD v5[8];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  _QWORD v12[3];
  int v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0x7FFFFFFF;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  v2 = (void *)*MEMORY[0x24BE014C8];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __80__ACHMonthlyChallengeEvaluationEnvironment_eligibleSpecificWorkoutChallengeType__block_invoke_183;
  v5[3] = &unk_24D13BDB8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v12;
  v5[6] = &v6;
  v5[7] = a2;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(v12, 8);
  return v3;
}

void __80__ACHMonthlyChallengeEvaluationEnvironment_eligibleSpecificWorkoutChallengeType__block_invoke_183(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "numberOfCompletedWorkoutsInCurrentMonthForChallengeType:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "intValue");
  else
    v6 = 0;
  if (*(_QWORD *)(a1 + 56) <= v6 && v6 < *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  }

}

- (id)numberOfDaysWithCaloriesBurnedOver:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHMonthlyChallengeEvaluationEnvironment dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v7 = v6;

  -[ACHMonthlyChallengeEvaluationEnvironment dateComponentInterval](self, "dateComponentInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeEvaluationEnvironment calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "numberOfDaysWithCaloriesBurnedOver:forDateComponentInterval:calendar:error:", v8, v9, &v16, v7);
  v11 = v10;
  v12 = v16;

  if (v12)
  {
    ACHLogMonthlyChallenges();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_21407B000, v13, OS_LOG_TYPE_DEFAULT, "Error fetching value for ACHMonthlyChallengeTypeDailyEnergyBurnTarget challenge: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)numberOfDaysWithExerciseMinutesOver:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHMonthlyChallengeEvaluationEnvironment dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v7 = v6;

  -[ACHMonthlyChallengeEvaluationEnvironment dateComponentInterval](self, "dateComponentInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeEvaluationEnvironment calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "numberOfDaysWithExerciseMinutesOver:forDateComponentInterval:calendar:error:", v8, v9, &v16, v7);
  v11 = v10;
  v12 = v16;

  if (v12)
  {
    ACHLogMonthlyChallenges();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_21407B000, v13, OS_LOG_TYPE_DEFAULT, "Error fetching value for ACHMonthlyChallengeTypeDailyExerciseMinutesTarget challenge: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)numberOfDaysWithDistanceOver:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHMonthlyChallengeEvaluationEnvironment dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v7 = v6;

  -[ACHMonthlyChallengeEvaluationEnvironment dateComponentInterval](self, "dateComponentInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeEvaluationEnvironment calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "numberOfDaysWithDistanceOver:forDateComponentInterval:calendar:error:", v8, v9, &v16, v7);
  v11 = v10;
  v12 = v16;

  if (v12)
  {
    ACHLogMonthlyChallenges();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_21407B000, v13, OS_LOG_TYPE_DEFAULT, "Error fetching value for ACHMonthlyChallengeTypeDailyDistanceTarget challenge: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)numberOfDaysWithAppleMoveTimeOver:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHMonthlyChallengeEvaluationEnvironment dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v7 = v6;

  -[ACHMonthlyChallengeEvaluationEnvironment dateComponentInterval](self, "dateComponentInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeEvaluationEnvironment calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "numberOfDaysWithAppleMoveTimeOver:forDateComponentInterval:calendar:error:", v8, v9, &v16, v7);
  v11 = v10;
  v12 = v16;

  if (v12)
  {
    ACHLogMonthlyChallenges();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_21407B000, v13, OS_LOG_TYPE_DEFAULT, "Error fetching value for ACHMonthlyChallengeTypeDailyAppleMoveTimeTarget challenge: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)_valueForMonthlyChallengeType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ACHMonthlyChallengeEvaluationEnvironment dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeEvaluationEnvironment dateComponentInterval](self, "dateComponentInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeEvaluationEnvironment calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "valueForMonthlyChallengeType:forDateComponentInterval:calendar:error:", a3, v6, v7, &v13);
  v9 = v8;
  v10 = v13;

  if (v10)
  {
    ACHLogMonthlyChallenges();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v15 = a3;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Error fetching value for monthly challenge type %lu: %@", buf, 0x16u);
    }

  }
  return v9;
}

- (ACHMonthlyChallengeDataSource)dataSource
{
  return (ACHMonthlyChallengeDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (ACHDateComponentInterval)dateComponentInterval
{
  return self->_dateComponentInterval;
}

- (void)setDateComponentInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateComponentInterval, a3);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_dateComponentInterval, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_21407B000, a2, OS_LOG_TYPE_FAULT, "Monthly Challenge Evaluation environment asked for key it doesn't support: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
