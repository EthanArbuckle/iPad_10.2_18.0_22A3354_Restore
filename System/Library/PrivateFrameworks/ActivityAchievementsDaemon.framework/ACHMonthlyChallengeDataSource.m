@implementation ACHMonthlyChallengeDataSource

- (ACHMonthlyChallengeDataSource)initWithActivitySummaryIterator:(id)a3 workoutClient:(id)a4
{
  id v7;
  id v8;
  ACHMonthlyChallengeDataSource *v9;
  ACHMonthlyChallengeDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACHMonthlyChallengeDataSource;
  v9 = -[ACHMonthlyChallengeDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activitySummaryIterator, a3);
    objc_storeStrong((id *)&v10->_workoutClient, a4);
  }

  return v10;
}

- (ACHMonthlyChallengeDataSource)initWithProfile:(id)a3 activitySummaryUtility:(id)a4 workoutUtility:(id)a5
{
  id v8;
  id v9;
  id v10;
  ACHMonthlyChallengeDataSource *v11;
  ACHMonthlyChallengeDataSource *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACHMonthlyChallengeDataSource;
  v11 = -[ACHMonthlyChallengeDataSource init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ACHMonthlyChallengeDataSource setProfile:](v11, "setProfile:", v8);
    -[ACHMonthlyChallengeDataSource setActivitySummaryUtility:](v12, "setActivitySummaryUtility:", v9);
    -[ACHMonthlyChallengeDataSource setWorkoutUtility:](v12, "setWorkoutUtility:", v10);
  }

  return v12;
}

- (BOOL)requiresError
{
  void *v2;
  BOOL v3;

  -[ACHMonthlyChallengeDataSource profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)setDatabaseContext:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_databaseContext, a3);
  v5 = a3;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDatabaseContext:", v5);

  -[ACHMonthlyChallengeDataSource workoutUtility](self, "workoutUtility");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDatabaseContext:", v5);

}

- (double)valueForMonthlyChallengeType:(unint64_t)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  void *v17;

  v10 = a4;
  v11 = a5;
  switch(a3)
  {
    case 1uLL:
      v15 = -[ACHMonthlyChallengeDataSource numberOfAllRingsClosedDuringDateComponentInterval:error:](self, "numberOfAllRingsClosedDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_16;
    case 2uLL:
      v15 = -[ACHMonthlyChallengeDataSource numberOfMoveRingsClosedDuringDateComponentInterval:error:](self, "numberOfMoveRingsClosedDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_16;
    case 3uLL:
      v15 = -[ACHMonthlyChallengeDataSource numberOfExerciseRingsClosedDuringDateComponentInterval:error:](self, "numberOfExerciseRingsClosedDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_16;
    case 4uLL:
      v15 = -[ACHMonthlyChallengeDataSource numberOfStandRingsClosedDuringDateComponentInterval:error:](self, "numberOfStandRingsClosedDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_16;
    case 5uLL:
      -[ACHMonthlyChallengeDataSource caloriesDuringDateComponentInterval:error:](self, "caloriesDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_22;
    case 6uLL:
      -[ACHMonthlyChallengeDataSource exerciseMinutesDuringDateComponentInterval:error:](self, "exerciseMinutesDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_22;
    case 7uLL:
      -[ACHMonthlyChallengeDataSource _inclusiveDateIntervalFor:andDateComponentInterval:](self, "_inclusiveDateIntervalFor:andDateComponentInterval:", v11, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (double)-[ACHMonthlyChallengeDataSource numberOfWorkoutsCompletedDuringDateInterval:error:](self, "numberOfWorkoutsCompletedDuringDateInterval:error:", v17, a6);

      break;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
      -[ACHMonthlyChallengeDataSource _inclusiveDateIntervalFor:andDateComponentInterval:](self, "_inclusiveDateIntervalFor:andDateComponentInterval:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = ACHWorkoutActivityTypeForMonthlyChallengeType();
      v14 = (double)-[ACHMonthlyChallengeDataSource numberOfCompletedWorkoutsOfType:andLocation:duringDateInterval:error:](self, "numberOfCompletedWorkoutsOfType:andLocation:duringDateInterval:error:", v13, ACHWorkoutLocationTypeForMonthlyChallengeType(), v12, a6);

      break;
    case 0x14uLL:
      -[ACHMonthlyChallengeDataSource walkingRunningDistanceDuringDateComponentInterval:error:](self, "walkingRunningDistanceDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_22;
    case 0x15uLL:
      v15 = -[ACHMonthlyChallengeDataSource numberOfDaysDoublingMoveGoalDuringDateComponentInterval:error:](self, "numberOfDaysDoublingMoveGoalDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_16;
    case 0x16uLL:
      -[ACHMonthlyChallengeDataSource moveTimeDuringDateComponentInterval:error:](self, "moveTimeDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_22;
    case 0x17uLL:
      v15 = -[ACHMonthlyChallengeDataSource numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:error:](self, "numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_16;
    case 0x18uLL:
      v15 = -[ACHMonthlyChallengeDataSource currentStreakOfType:duringDateComponentInterval:error:](self, "currentStreakOfType:duringDateComponentInterval:error:", 0, v10, a6);
LABEL_16:
      v14 = (double)v15;
      break;
    case 0x19uLL:
      -[ACHMonthlyChallengeDataSource caloriesDuringDateComponentInterval:error:](self, "caloriesDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_21;
    case 0x1AuLL:
      -[ACHMonthlyChallengeDataSource exerciseMinutesDuringDateComponentInterval:error:](self, "exerciseMinutesDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_21;
    case 0x1BuLL:
      -[ACHMonthlyChallengeDataSource walkingRunningDistanceDuringDateComponentInterval:error:](self, "walkingRunningDistanceDuringDateComponentInterval:error:", v10, a6);
      goto LABEL_21;
    case 0x1CuLL:
      -[ACHMonthlyChallengeDataSource moveTimeDuringDateComponentInterval:error:](self, "moveTimeDuringDateComponentInterval:error:", v10, a6);
LABEL_21:
      -[ACHMonthlyChallengeDataSource _dailyAverageValueForMonthlyChallengeWithDailyTargetValue:andDateComponentInterval:](self, "_dailyAverageValueForMonthlyChallengeWithDailyTargetValue:andDateComponentInterval:", v10);
LABEL_22:
      v14 = v16;
      break;
    default:
      v14 = -1.0;
      break;
  }

  return v14;
}

- (double)_dailyAverageValueForMonthlyChallengeWithDailyTargetValue:(double)a3 andDateComponentInterval:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = a4;
  objc_msgSend(v5, "endDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "day");
  objc_msgSend(v5, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v7 - objc_msgSend(v8, "day") + 1;
  return a3 / (double)v9;
}

- (double)caloriesDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = (double *)&v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__31;
    v24 = __Block_byref_object_dispose__31;
    v25 = 0;
    -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __75__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval_error___block_invoke;
    v17[3] = &unk_24D13D368;
    v19 = &v26;
    v10 = v7;
    v18 = v10;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __75__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval_error___block_invoke_2;
    v16[3] = &unk_24D13AEA8;
    v16[4] = &v20;
    objc_msgSend(v8, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v6, v17, v16);

    v11 = (id)v21[5];
    v12 = v11;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

    v14 = v27[3];
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    -[ACHMonthlyChallengeDataSource caloriesDuringDateComponentInterval:](self, "caloriesDuringDateComponentInterval:", v6);
    v14 = v13;
  }

  return v14;
}

void __75__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isPaused") & 1) == 0 && objc_msgSend(v5, "activityMoveMode") != 2)
  {
    objc_msgSend(v5, "activeEnergyBurned");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

  }
}

void __75__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (double)moveTimeDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = (double *)&v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__31;
    v24 = __Block_byref_object_dispose__31;
    v25 = 0;
    -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __75__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval_error___block_invoke;
    v17[3] = &unk_24D13D368;
    v19 = &v26;
    v10 = v7;
    v18 = v10;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __75__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval_error___block_invoke_2;
    v16[3] = &unk_24D13AEA8;
    v16[4] = &v20;
    objc_msgSend(v8, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v6, v17, v16);

    v11 = (id)v21[5];
    v12 = v11;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

    v14 = v27[3];
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    -[ACHMonthlyChallengeDataSource moveTimeDuringDateComponentInterval:](self, "moveTimeDuringDateComponentInterval:", v6);
    v14 = v13;
  }

  return v14;
}

void __75__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isPaused") & 1) == 0 && objc_msgSend(v5, "activityMoveMode") == 2)
  {
    objc_msgSend(v5, "appleMoveTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

  }
}

void __75__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (double)exerciseMinutesDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = (double *)&v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__31;
    v24 = __Block_byref_object_dispose__31;
    v25 = 0;
    -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __82__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval_error___block_invoke;
    v17[3] = &unk_24D13D368;
    v19 = &v26;
    v10 = v7;
    v18 = v10;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __82__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval_error___block_invoke_2;
    v16[3] = &unk_24D13AEA8;
    v16[4] = &v20;
    objc_msgSend(v8, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v6, v17, v16);

    v11 = (id)v21[5];
    v12 = v11;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

    v14 = v27[3];
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    -[ACHMonthlyChallengeDataSource exerciseMinutesDuringDateComponentInterval:](self, "exerciseMinutesDuringDateComponentInterval:", v6);
    v14 = v13;
  }

  return v14;
}

void __82__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isPaused") & 1) == 0)
  {
    objc_msgSend(v5, "appleExerciseTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

  }
}

void __82__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (double)walkingRunningDistanceDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = (double *)&v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__31;
    v24 = __Block_byref_object_dispose__31;
    v25 = 0;
    -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __89__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval_error___block_invoke;
    v17[3] = &unk_24D13D368;
    v19 = &v26;
    v10 = v7;
    v18 = v10;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __89__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval_error___block_invoke_2;
    v16[3] = &unk_24D13AEA8;
    v16[4] = &v20;
    objc_msgSend(v8, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v6, v17, v16);

    v11 = (id)v21[5];
    v12 = v11;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

    v14 = v27[3];
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    -[ACHMonthlyChallengeDataSource walkingRunningDistanceDuringDateComponentInterval:](self, "walkingRunningDistanceDuringDateComponentInterval:", v6);
    v14 = v13;
  }

  return v14;
}

void __89__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isPaused") & 1) == 0)
  {
    objc_msgSend(v5, "distanceWalkingRunning");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

  }
}

void __89__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)numberOfMoveRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    v19 = 0;
    -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = &v14;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __90__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_24D13B490;
    v13[4] = &v20;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __90__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_24D13AEA8;
    objc_msgSend(v7, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v6, v13, v12);

    v8 = (id)v15[5];
    v9 = v8;
    if (v8)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = -[ACHMonthlyChallengeDataSource numberOfMoveRingsClosedDuringDateComponentInterval:](self, "numberOfMoveRingsClosedDuringDateComponentInterval:", v6);
  }

  return v10;
}

void __90__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  double v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "isPaused");
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    if (objc_msgSend(v6, "activityMoveMode") == 2)
      objc_msgSend(v6, "_moveMinutesCompletionPercentage");
    else
      objc_msgSend(v6, "_activeEnergyCompletionPercentage");
    v4 = v6;
    if (v5 >= 1.0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

void __90__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)numberOfExerciseRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    v19 = 0;
    -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = &v14;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __94__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_24D13B490;
    v13[4] = &v20;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __94__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_24D13AEA8;
    objc_msgSend(v7, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v6, v13, v12);

    v8 = (id)v15[5];
    v9 = v8;
    if (v8)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = -[ACHMonthlyChallengeDataSource numberOfExerciseRingsClosedDuringDateComponentInterval:](self, "numberOfExerciseRingsClosedDuringDateComponentInterval:", v6);
  }

  return v10;
}

void __94__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isPaused") & 1) == 0)
  {
    objc_msgSend(v4, "_exerciseTimeCompletionPercentage");
    if (v3 >= 1.0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

void __94__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)numberOfStandRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    v19 = 0;
    -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = &v14;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __91__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_24D13B490;
    v13[4] = &v20;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __91__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_24D13AEA8;
    objc_msgSend(v7, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v6, v13, v12);

    v8 = (id)v15[5];
    v9 = v8;
    if (v8)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = -[ACHMonthlyChallengeDataSource numberOfStandRingsClosedDuringDateComponentInterval:](self, "numberOfStandRingsClosedDuringDateComponentInterval:", v6);
  }

  return v10;
}

void __91__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isPaused") & 1) == 0)
  {
    objc_msgSend(v4, "_standHoursCompletionPercentage");
    if (v3 >= 1.0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

void __91__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)numberOfAllRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    v19 = 0;
    -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = &v14;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __89__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_24D13B490;
    v13[4] = &v20;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __89__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_24D13AEA8;
    objc_msgSend(v7, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v6, v13, v12);

    v8 = (id)v15[5];
    v9 = v8;
    if (v8)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = -[ACHMonthlyChallengeDataSource numberOfAllRingsClosedDuringDateComponentInterval:](self, "numberOfAllRingsClosedDuringDateComponentInterval:", v6);
  }

  return v10;
}

void __89__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "isPaused") & 1) == 0)
  {
    if (objc_msgSend(v8, "activityMoveMode") == 2)
      objc_msgSend(v8, "_moveMinutesCompletionPercentage");
    else
      objc_msgSend(v8, "_activeEnergyCompletionPercentage");
    v4 = v3;
    objc_msgSend(v8, "_exerciseTimeCompletionPercentage");
    v6 = v5;
    objc_msgSend(v8, "_standHoursCompletionPercentage");
    if (v4 >= 1.0 && v6 >= 1.0 && v7 >= 1.0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

void __89__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)numberOfDaysDoublingMoveGoalDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    v19 = 0;
    -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = &v14;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __95__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_24D13B490;
    v13[4] = &v20;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __95__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_24D13AEA8;
    objc_msgSend(v7, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v6, v13, v12);

    v8 = (id)v15[5];
    v9 = v8;
    if (v8)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = -[ACHMonthlyChallengeDataSource numberOfDaysDoublingMoveGoalDuringDateComponentInterval:](self, "numberOfDaysDoublingMoveGoalDuringDateComponentInterval:", v6);
  }

  return v10;
}

void __95__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  double v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "isPaused");
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    if (objc_msgSend(v6, "activityMoveMode") == 2)
      objc_msgSend(v6, "_moveMinutesCompletionPercentage");
    else
      objc_msgSend(v6, "_activeEnergyCompletionPercentage");
    v4 = v6;
    if (v5 >= 2.0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

void __95__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    v19 = 0;
    -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = &v14;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __99__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_24D13B490;
    v13[4] = &v20;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __99__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_24D13AEA8;
    objc_msgSend(v7, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v6, v13, v12);

    v8 = (id)v15[5];
    v9 = v8;
    if (v8)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = -[ACHMonthlyChallengeDataSource numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:](self, "numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:", v6);
  }

  return v10;
}

void __99__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isPaused") & 1) == 0)
  {
    objc_msgSend(v4, "_exerciseTimeCompletionPercentage");
    if (v3 >= 2.0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

void __99__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)numberOfWorkoutsCompletedDuringDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    -[ACHMonthlyChallengeDataSource workoutClient](self, "workoutClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfWorkoutsWithDuration:containedInInterval:error:", v6, a4, 300.0);

  }
  else
  {
    v8 = -[ACHMonthlyChallengeDataSource numberOfWorkoutsCompletedDuringDateInterval:](self, "numberOfWorkoutsCompletedDuringDateInterval:", v6);
  }

  return v8;
}

- (int64_t)numberOfCompletedWorkoutsOfType:(unint64_t)a3 andLocation:(unint64_t)a4 duringDateInterval:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int64_t v12;

  v10 = a5;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    -[ACHMonthlyChallengeDataSource workoutClient](self, "workoutClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfFirstPartyWorkoutsWithDuration:withType:andLocation:containedInInterval:error:", a3, a4, v10, a6, 300.0);

  }
  else
  {
    v12 = -[ACHMonthlyChallengeDataSource numberOfCompletedWorkoutsOfType:andLocation:duringDateInterval:](self, "numberOfCompletedWorkoutsOfType:andLocation:duringDateInterval:", a3, a4, v10);
  }

  return v12;
}

- (int64_t)longestStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v8 = a4;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    v19 = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __87__ACHMonthlyChallengeDataSource_longestStreakOfType_duringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_24D13D390;
    v13[4] = &v14;
    v13[5] = &v20;
    -[ACHMonthlyChallengeDataSource _getCurrentAndLongestStreakForStreakType:duringDateComponentInterval:completion:](self, "_getCurrentAndLongestStreakForStreakType:duringDateComponentInterval:completion:", a3, v8, v13);
    v9 = (id)v15[5];
    v10 = v9;
    if (v9)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError();
    }

    v11 = *((int *)v21 + 6);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v11 = -[ACHMonthlyChallengeDataSource longestStreakOfType:duringDateComponentInterval:](self, "longestStreakOfType:duringDateComponentInterval:", a3, v8);
  }

  return v11;
}

void __87__ACHMonthlyChallengeDataSource_longestStreakOfType_duringDateComponentInterval_error___block_invoke(uint64_t a1, int a2, int a3, id obj)
{
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v7 = obj;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

- (int64_t)currentStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v8 = a4;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    v19 = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __87__ACHMonthlyChallengeDataSource_currentStreakOfType_duringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_24D13D390;
    v13[4] = &v14;
    v13[5] = &v20;
    -[ACHMonthlyChallengeDataSource _getCurrentAndLongestStreakForStreakType:duringDateComponentInterval:completion:](self, "_getCurrentAndLongestStreakForStreakType:duringDateComponentInterval:completion:", a3, v8, v13);
    v9 = (id)v15[5];
    v10 = v9;
    if (v9)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError();
    }

    v11 = *((int *)v21 + 6);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v11 = -[ACHMonthlyChallengeDataSource currentStreakOfType:duringDateComponentInterval:](self, "currentStreakOfType:duringDateComponentInterval:", a3, v8);
  }

  return v11;
}

void __87__ACHMonthlyChallengeDataSource_currentStreakOfType_duringDateComponentInterval_error___block_invoke(uint64_t a1, int a2, int a3, id obj)
{
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v7 = obj;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)_getCurrentAndLongestStreakForStreakType:(unint64_t)a3 duringDateComponentInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v8 = a4;
  v9 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__31;
  v17 = __Block_byref_object_dispose__31;
  v18 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __113__ACHMonthlyChallengeDataSource__getCurrentAndLongestStreakForStreakType_duringDateComponentInterval_completion___block_invoke;
  v12[3] = &unk_24D13D3B8;
  v12[5] = &v19;
  v12[6] = a3;
  v12[4] = &v23;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __113__ACHMonthlyChallengeDataSource__getCurrentAndLongestStreakForStreakType_duringDateComponentInterval_completion___block_invoke_2;
  v11[3] = &unk_24D13AEA8;
  v11[4] = &v13;
  objc_msgSend(v10, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v8, v12, v11);

  (*((void (**)(id, _QWORD, _QWORD, uint64_t))v9 + 2))(v9, *((unsigned int *)v24 + 6), *((unsigned int *)v20 + 6), v14[5]);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

}

void __113__ACHMonthlyChallengeDataSource__getCurrentAndLongestStreakForStreakType_duringDateComponentInterval_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  id v12;

  v12 = a2;
  if ((objc_msgSend(v12, "isPaused") & 1) != 0)
    goto LABEL_15;
  v3 = a1[6];
  if (v3 == 2)
  {
    objc_msgSend(v12, "_standHoursCompletionPercentage");
  }
  else if (v3 == 1)
  {
    objc_msgSend(v12, "_exerciseTimeCompletionPercentage");
  }
  else
  {
    if (v3)
    {
LABEL_9:
      v8 = *(_QWORD *)(a1[5] + 8);
      v9 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
      if (*(_DWORD *)(v8 + 24) > v9)
        v9 = *(_DWORD *)(v8 + 24);
      *(_DWORD *)(v8 + 24) = v9;
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
      goto LABEL_15;
    }
    objc_msgSend(v12, "_activeEnergyCompletionPercentage");
    v5 = v4;
    objc_msgSend(v12, "_moveMinutesCompletionPercentage");
    v7 = v5 + v6;
  }
  if (v7 < 1.0)
    goto LABEL_9;
  ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (*(_DWORD *)(v10 + 24) > v11)
    v11 = *(_DWORD *)(v10 + 24);
  *(_DWORD *)(v10 + 24) = v11;
LABEL_15:

}

void __113__ACHMonthlyChallengeDataSource__getCurrentAndLongestStreakForStreakType_duringDateComponentInterval_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (double)numberOfDaysWithCaloriesBurnedOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v9;
  double v10;
  double v11;

  v9 = a4;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
    -[ACHMonthlyChallengeDataSource _numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:error:](self, "_numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:error:", &__block_literal_global_28, v9, a6, a3);
  else
    -[ACHMonthlyChallengeDataSource _numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:](self, "_numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:", &__block_literal_global_28, v9, a3);
  v11 = v10;

  return v11;
}

uint64_t __108__ACHMonthlyChallengeDataSource_numberOfDaysWithCaloriesBurnedOver_forDateComponentInterval_calendar_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activeEnergyBurned");
}

- (double)numberOfDaysWithExerciseMinutesOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v9;
  double v10;
  double v11;

  v9 = a4;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
    -[ACHMonthlyChallengeDataSource _numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:error:](self, "_numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:error:", &__block_literal_global_189_0, v9, a6, a3);
  else
    -[ACHMonthlyChallengeDataSource _numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:](self, "_numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:", &__block_literal_global_189_0, v9, a3);
  v11 = v10;

  return v11;
}

uint64_t __109__ACHMonthlyChallengeDataSource_numberOfDaysWithExerciseMinutesOver_forDateComponentInterval_calendar_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appleExerciseTime");
}

- (double)numberOfDaysWithDistanceOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v9;
  double v10;
  double v11;

  v9 = a4;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
    -[ACHMonthlyChallengeDataSource _numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:error:](self, "_numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:error:", &__block_literal_global_190_0, v9, a6, a3);
  else
    -[ACHMonthlyChallengeDataSource _numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:](self, "_numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:", &__block_literal_global_190_0, v9, a3);
  v11 = v10;

  return v11;
}

uint64_t __102__ACHMonthlyChallengeDataSource_numberOfDaysWithDistanceOver_forDateComponentInterval_calendar_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "distanceWalkingRunning");
}

- (double)numberOfDaysWithAppleMoveTimeOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v9;
  double v10;
  double v11;

  v9 = a4;
  if (-[ACHMonthlyChallengeDataSource requiresError](self, "requiresError"))
    -[ACHMonthlyChallengeDataSource _numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:error:](self, "_numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:error:", &__block_literal_global_191_1, v9, a6, a3);
  else
    -[ACHMonthlyChallengeDataSource _numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:](self, "_numberOfDaysWithQuantity:overThreshold:forDateComponentInterval:", &__block_literal_global_191_1, v9, a3);
  v11 = v10;

  return v11;
}

uint64_t __107__ACHMonthlyChallengeDataSource_numberOfDaysWithAppleMoveTimeOver_forDateComponentInterval_calendar_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appleMoveTime");
}

- (double)_numberOfDaysWithQuantity:(id)a3 overThreshold:(double)a4 forDateComponentInterval:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  double v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;

  v10 = a3;
  v11 = a5;
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__31;
  v28 = __Block_byref_object_dispose__31;
  v29 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryIterator](self, "activitySummaryIterator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __104__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval_error___block_invoke;
  v20[3] = &unk_24D13D480;
  v14 = v10;
  v23 = a4;
  v21 = v14;
  v22 = &v30;
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __104__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval_error___block_invoke_2;
  v19[3] = &unk_24D13AEA8;
  v19[4] = &v24;
  objc_msgSend(v12, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v11, v20, v19);

  v15 = (id)v25[5];
  v16 = v15;
  if (v15)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();
  }

  v17 = v31[3];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v17;
}

void __104__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isPaused") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_value");
    v5 = v4;
    v6 = *(double *)(a1 + 48);

    if (v5 >= v6)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24)
                                                                  + 1.0;
  }

}

void __104__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (double)_numberOfDaysWithQuantity:(id)a3 overThreshold:(double)a4 forDateComponentInterval:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  double v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a3;
  v9 = a5;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __98__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval___block_invoke;
  v14[3] = &unk_24D13D4A8;
  v11 = v8;
  v17 = a4;
  v15 = v11;
  v16 = &v18;
  objc_msgSend(v10, "enumerateActivitySummariesForDateComponentInterval:handler:", v9, v14);

  v12 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __98__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_value");
  v4 = v3;
  v5 = *(double *)(a1 + 48);

  if (v4 >= v5)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + 1.0;
}

- (double)valueForMonthlyChallengeType:(unint64_t)a3 forDateComponentInterval:(id)a4 inCalendar:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;

  v8 = a4;
  v9 = a5;
  switch(a3)
  {
    case 1uLL:
      v13 = -[ACHMonthlyChallengeDataSource numberOfAllRingsClosedDuringDateComponentInterval:](self, "numberOfAllRingsClosedDuringDateComponentInterval:", v8);
      goto LABEL_16;
    case 2uLL:
      v13 = -[ACHMonthlyChallengeDataSource numberOfMoveRingsClosedDuringDateComponentInterval:](self, "numberOfMoveRingsClosedDuringDateComponentInterval:", v8);
      goto LABEL_16;
    case 3uLL:
      v13 = -[ACHMonthlyChallengeDataSource numberOfExerciseRingsClosedDuringDateComponentInterval:](self, "numberOfExerciseRingsClosedDuringDateComponentInterval:", v8);
      goto LABEL_16;
    case 4uLL:
      v13 = -[ACHMonthlyChallengeDataSource numberOfStandRingsClosedDuringDateComponentInterval:](self, "numberOfStandRingsClosedDuringDateComponentInterval:", v8);
      goto LABEL_16;
    case 5uLL:
      -[ACHMonthlyChallengeDataSource caloriesDuringDateComponentInterval:](self, "caloriesDuringDateComponentInterval:", v8);
      goto LABEL_22;
    case 6uLL:
      -[ACHMonthlyChallengeDataSource exerciseMinutesDuringDateComponentInterval:](self, "exerciseMinutesDuringDateComponentInterval:", v8);
      goto LABEL_22;
    case 7uLL:
      -[ACHMonthlyChallengeDataSource _inclusiveDateIntervalFor:andDateComponentInterval:](self, "_inclusiveDateIntervalFor:andDateComponentInterval:", v9, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (double)-[ACHMonthlyChallengeDataSource numberOfWorkoutsCompletedDuringDateInterval:](self, "numberOfWorkoutsCompletedDuringDateInterval:", v15);

      break;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
      -[ACHMonthlyChallengeDataSource _inclusiveDateIntervalFor:andDateComponentInterval:](self, "_inclusiveDateIntervalFor:andDateComponentInterval:", v9, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = ACHWorkoutActivityTypeForMonthlyChallengeType();
      v12 = (double)-[ACHMonthlyChallengeDataSource numberOfCompletedWorkoutsOfType:andLocation:duringDateInterval:](self, "numberOfCompletedWorkoutsOfType:andLocation:duringDateInterval:", v11, ACHWorkoutLocationTypeForMonthlyChallengeType(), v10);

      break;
    case 0x14uLL:
      -[ACHMonthlyChallengeDataSource walkingRunningDistanceDuringDateComponentInterval:](self, "walkingRunningDistanceDuringDateComponentInterval:", v8);
      goto LABEL_22;
    case 0x15uLL:
      v13 = -[ACHMonthlyChallengeDataSource numberOfDaysDoublingMoveGoalDuringDateComponentInterval:](self, "numberOfDaysDoublingMoveGoalDuringDateComponentInterval:", v8);
      goto LABEL_16;
    case 0x16uLL:
      -[ACHMonthlyChallengeDataSource moveTimeDuringDateComponentInterval:](self, "moveTimeDuringDateComponentInterval:", v8);
      goto LABEL_22;
    case 0x17uLL:
      v13 = -[ACHMonthlyChallengeDataSource numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:](self, "numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:", v8);
      goto LABEL_16;
    case 0x18uLL:
      v13 = -[ACHMonthlyChallengeDataSource currentStreakOfType:duringDateComponentInterval:](self, "currentStreakOfType:duringDateComponentInterval:", 0, v8);
LABEL_16:
      v12 = (double)v13;
      break;
    case 0x19uLL:
      -[ACHMonthlyChallengeDataSource caloriesDuringDateComponentInterval:](self, "caloriesDuringDateComponentInterval:", v8);
      goto LABEL_21;
    case 0x1AuLL:
      -[ACHMonthlyChallengeDataSource exerciseMinutesDuringDateComponentInterval:](self, "exerciseMinutesDuringDateComponentInterval:", v8);
      goto LABEL_21;
    case 0x1BuLL:
      -[ACHMonthlyChallengeDataSource walkingRunningDistanceDuringDateComponentInterval:](self, "walkingRunningDistanceDuringDateComponentInterval:", v8);
      goto LABEL_21;
    case 0x1CuLL:
      -[ACHMonthlyChallengeDataSource moveTimeDuringDateComponentInterval:](self, "moveTimeDuringDateComponentInterval:", v8);
LABEL_21:
      -[ACHMonthlyChallengeDataSource _dailyAverageValueForMonthlyChallengeWithDailyTargetValue:andDateComponentInterval:](self, "_dailyAverageValueForMonthlyChallengeWithDailyTargetValue:andDateComponentInterval:", v8);
LABEL_22:
      v12 = v14;
      break;
    default:
      v12 = -1.0;
      break;
  }

  return v12;
}

- (id)_inclusiveDateIntervalFor:(id)a3 andDateComponentInterval:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "startDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startOfDayForDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "endDateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateFromComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startOfDayForDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hk_dateByAddingDays:toDate:", 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v9, v13);
  return v14;
}

- (double)caloriesDuringDateComponentInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval___block_invoke;
  v10[3] = &unk_24D13D4D0;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateActivitySummariesForDateComponentInterval:handler:", v4, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __69__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "activityMoveMode") != 2)
  {
    objc_msgSend(v5, "activeEnergyBurned");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

  }
}

- (double)moveTimeDuringDateComponentInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval___block_invoke;
  v10[3] = &unk_24D13D4D0;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateActivitySummariesForDateComponentInterval:handler:", v4, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __69__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "activityMoveMode") == 2)
  {
    objc_msgSend(v5, "appleMoveTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

  }
}

- (double)exerciseMinutesDuringDateComponentInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval___block_invoke;
  v10[3] = &unk_24D13D4D0;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateActivitySummariesForDateComponentInterval:handler:", v4, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __76__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  objc_msgSend(a2, "appleExerciseTime");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

- (double)walkingRunningDistanceDuringDateComponentInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval___block_invoke;
  v10[3] = &unk_24D13D4D0;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateActivitySummariesForDateComponentInterval:handler:", v4, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __83__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  objc_msgSend(a2, "distanceWalkingRunning");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

- (int64_t)numberOfMoveRingsClosedDuringDateComponentInterval:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_24D13C068;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateActivitySummariesForDateComponentInterval:handler:", v4, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __84__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;

  v3 = a2;
  if (objc_msgSend(v3, "activityMoveMode") == 2)
    objc_msgSend(v3, "_moveMinutesCompletionPercentage");
  else
    objc_msgSend(v3, "_activeEnergyCompletionPercentage");
  v5 = v4;

  if (v5 >= 1.0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (int64_t)numberOfExerciseRingsClosedDuringDateComponentInterval:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_24D13C068;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateActivitySummariesForDateComponentInterval:handler:", v4, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __88__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v4;

  result = objc_msgSend(a2, "_exerciseTimeCompletionPercentage");
  if (v4 >= 1.0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (int64_t)numberOfStandRingsClosedDuringDateComponentInterval:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_24D13C068;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateActivitySummariesForDateComponentInterval:handler:", v4, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __85__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v4;

  result = objc_msgSend(a2, "_standHoursCompletionPercentage");
  if (v4 >= 1.0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (int64_t)numberOfAllRingsClosedDuringDateComponentInterval:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_24D13C068;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateActivitySummariesForDateComponentInterval:handler:", v4, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __83__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "activityMoveMode") == 2)
    objc_msgSend(v10, "_moveMinutesCompletionPercentage");
  else
    objc_msgSend(v10, "_activeEnergyCompletionPercentage");
  v4 = v3;
  objc_msgSend(v10, "_exerciseTimeCompletionPercentage");
  v6 = v5;
  objc_msgSend(v10, "_standHoursCompletionPercentage");
  if (v4 >= 1.0 && v6 >= 1.0 && v7 >= 1.0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

- (int64_t)numberOfDaysDoublingMoveGoalDuringDateComponentInterval:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __89__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_24D13C068;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateActivitySummariesForDateComponentInterval:handler:", v4, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __89__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;

  v3 = a2;
  if (objc_msgSend(v3, "activityMoveMode") == 2)
    objc_msgSend(v3, "_moveMinutesCompletionPercentage");
  else
    objc_msgSend(v3, "_activeEnergyCompletionPercentage");
  v5 = v4;

  if (v5 >= 2.0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (int64_t)numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __93__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_24D13C068;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateActivitySummariesForDateComponentInterval:handler:", v4, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __93__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v4;

  result = objc_msgSend(a2, "_exerciseTimeCompletionPercentage");
  if (v4 >= 2.0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (int64_t)numberOfWorkoutsCompletedDuringDateInterval:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[ACHMonthlyChallengeDataSource workoutUtility](self, "workoutUtility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfWorkoutsWithDuration:containedInInterval:", v4, 300.0);

  return v6;
}

- (int64_t)numberOfCompletedWorkoutsOfType:(unint64_t)a3 andLocation:(unint64_t)a4 duringDateInterval:(id)a5
{
  id v8;
  void *v9;
  int64_t v10;

  v8 = a5;
  -[ACHMonthlyChallengeDataSource workoutUtility](self, "workoutUtility");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfFirstPartyWorkoutsWithDuration:withType:andLocation:containedInInterval:", a3, a4, v8, 300.0);

  return v10;
}

- (int64_t)longestStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4
{
  id v6;
  int64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v6 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__ACHMonthlyChallengeDataSource_longestStreakOfType_duringDateComponentInterval___block_invoke;
  v9[3] = &unk_24D13D4F8;
  v9[4] = &v10;
  -[ACHMonthlyChallengeDataSource _getNoErrorLongestAndCurrentStreakForStreakType:duringDateComponentInterval:completion:](self, "_getNoErrorLongestAndCurrentStreakForStreakType:duringDateComponentInterval:completion:", a3, v6, v9);
  v7 = *((int *)v11 + 6);
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __81__ACHMonthlyChallengeDataSource_longestStreakOfType_duringDateComponentInterval___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  return result;
}

- (int64_t)currentStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4
{
  id v6;
  int64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v6 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__ACHMonthlyChallengeDataSource_currentStreakOfType_duringDateComponentInterval___block_invoke;
  v9[3] = &unk_24D13D4F8;
  v9[4] = &v10;
  -[ACHMonthlyChallengeDataSource _getNoErrorLongestAndCurrentStreakForStreakType:duringDateComponentInterval:completion:](self, "_getNoErrorLongestAndCurrentStreakForStreakType:duringDateComponentInterval:completion:", a3, v6, v9);
  v7 = *((int *)v11 + 6);
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __81__ACHMonthlyChallengeDataSource_currentStreakOfType_duringDateComponentInterval___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_getNoErrorLongestAndCurrentStreakForStreakType:(unint64_t)a3 duringDateComponentInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v8 = a4;
  v9 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ACHMonthlyChallengeDataSource activitySummaryUtility](self, "activitySummaryUtility");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __120__ACHMonthlyChallengeDataSource__getNoErrorLongestAndCurrentStreakForStreakType_duringDateComponentInterval_completion___block_invoke;
  v11[3] = &unk_24D13D520;
  v11[5] = &v12;
  v11[6] = a3;
  v11[4] = &v16;
  objc_msgSend(v10, "enumerateActivitySummariesForDateComponentInterval:handler:", v8, v11);

  (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, *((unsigned int *)v17 + 6), *((unsigned int *)v13 + 6));
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

}

void __120__ACHMonthlyChallengeDataSource__getNoErrorLongestAndCurrentStreakForStreakType_duringDateComponentInterval_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  id v13;

  v3 = a2;
  v4 = a1[6];
  if (v4 == 2)
  {
    v13 = v3;
    objc_msgSend(v3, "_standHoursCompletionPercentage");
  }
  else if (v4 == 1)
  {
    v13 = v3;
    objc_msgSend(v3, "_exerciseTimeCompletionPercentage");
  }
  else
  {
    if (v4)
    {
LABEL_8:
      v9 = *(_QWORD *)(a1[5] + 8);
      v10 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
      if (*(_DWORD *)(v9 + 24) > v10)
        v10 = *(_DWORD *)(v9 + 24);
      *(_DWORD *)(v9 + 24) = v10;
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
      goto LABEL_14;
    }
    v13 = v3;
    objc_msgSend(v3, "_activeEnergyCompletionPercentage");
    v6 = v5;
    objc_msgSend(v13, "_moveMinutesCompletionPercentage");
    v8 = v6 + v7;
  }
  v3 = v13;
  if (v8 < 1.0)
    goto LABEL_8;
  ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v11 = *(_QWORD *)(a1[5] + 8);
  v12 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (*(_DWORD *)(v11 + 24) > v12)
    v12 = *(_DWORD *)(v11 + 24);
  *(_DWORD *)(v11 + 24) = v12;
LABEL_14:

}

- (HDDatabaseTransactionContext)databaseContext
{
  return self->_databaseContext;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (ACHWorkoutUtility)workoutUtility
{
  return (ACHWorkoutUtility *)objc_loadWeakRetained((id *)&self->_workoutUtility);
}

- (void)setWorkoutUtility:(id)a3
{
  objc_storeWeak((id *)&self->_workoutUtility, a3);
}

- (ACHActivitySummaryUtility)activitySummaryUtility
{
  return (ACHActivitySummaryUtility *)objc_loadWeakRetained((id *)&self->_activitySummaryUtility);
}

- (void)setActivitySummaryUtility:(id)a3
{
  objc_storeWeak((id *)&self->_activitySummaryUtility, a3);
}

- (ACHAwardsWorkoutClient)workoutClient
{
  return self->_workoutClient;
}

- (void)setWorkoutClient:(id)a3
{
  objc_storeStrong((id *)&self->_workoutClient, a3);
}

- (ACHActivitySummaryIterator)activitySummaryIterator
{
  return self->_activitySummaryIterator;
}

- (void)setActivitySummaryIterator:(id)a3
{
  objc_storeStrong((id *)&self->_activitySummaryIterator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySummaryIterator, 0);
  objc_storeStrong((id *)&self->_workoutClient, 0);
  objc_destroyWeak((id *)&self->_activitySummaryUtility);
  objc_destroyWeak((id *)&self->_workoutUtility);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_databaseContext, 0);
}

@end
