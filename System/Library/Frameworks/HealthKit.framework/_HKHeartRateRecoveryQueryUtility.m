@implementation _HKHeartRateRecoveryQueryUtility

- (_HKHeartRateRecoveryQueryUtility)initWithHealthStore:(id)a3 workout:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  _HKHeartRateRecoveryQueryUtility *v12;
  _HKHeartRateRecoveryQueryUtility *v13;
  uint64_t v14;
  id handler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_HKHeartRateRecoveryQueryUtility;
  v12 = -[_HKHeartRateRecoveryQueryUtility init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_workout, a4);
    v14 = objc_msgSend(v11, "copy");
    handler = v13->_handler;
    v13->_handler = (id)v14;

    -[_HKHeartRateRecoveryQueryUtility _setupQueries](v13, "_setupQueries");
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[_HKSampleQueryUtility stop](self->_workoutQueryUtility, "stop");
  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_heartRateQuery);
  v3.receiver = self;
  v3.super_class = (Class)_HKHeartRateRecoveryQueryUtility;
  -[_HKHeartRateRecoveryQueryUtility dealloc](&v3, sel_dealloc);
}

- (void)execute
{
  -[_HKSampleQueryUtility execute](self->_workoutQueryUtility, "execute");
}

- (void)stop
{
  HKQuantitySeriesSampleQuery *heartRateQuery;

  -[_HKSampleQueryUtility stop](self->_workoutQueryUtility, "stop");
  if (self->_heartRateQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    heartRateQuery = self->_heartRateQuery;
    self->_heartRateQuery = 0;

  }
}

- (void)_setupQueries
{
  void *v3;
  _HKSampleQueryUtility *v4;
  HKHealthStore *healthStore;
  void *v6;
  id v7;
  _HKSampleQueryUtility *v8;
  _HKSampleQueryUtility *workoutQueryUtility;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  char v14;

  objc_msgSend((id)objc_opt_class(), "predicateForWorkoutRecoveryTimeWithWorkout:", self->_workout);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v4 = [_HKSampleQueryUtility alloc];
  healthStore = self->_healthStore;
  +[HKObjectType workoutType](HKObjectType, "workoutType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49___HKHeartRateRecoveryQueryUtility__setupQueries__block_invoke;
  v10[3] = &unk_1E37EE488;
  v10[4] = self;
  v12 = v13;
  v7 = v3;
  v11 = v7;
  v8 = -[_HKSampleQueryUtility initWithHealthStore:sampleType:predicate:resultsHandler:](v4, "initWithHealthStore:sampleType:predicate:resultsHandler:", healthStore, v6, v7, v10);
  workoutQueryUtility = self->_workoutQueryUtility;
  self->_workoutQueryUtility = v8;

  -[_HKSampleQueryUtility setSortStartDateAscending:](self->_workoutQueryUtility, "setSortStartDateAscending:", 1);
  _Block_object_dispose(v13, 8);

}

- (void)_heartRatesPostWorkout:(id)a3 workoutRecoveryTimePredicate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  HKQuantitySeriesSampleQuery *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  HKQuantitySeriesSampleQuery *v18;
  HKQuantitySeriesSampleQuery *heartRateQuery;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "recoveryDateIntervalWithWorkout:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = [HKQuantitySeriesSampleQuery alloc];
  +[HKObjectType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierHeartRate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __106___HKHeartRateRecoveryQueryUtility__heartRatesPostWorkout_workoutRecoveryTimePredicate_completionHandler___block_invoke;
  v20[3] = &unk_1E37EE4B0;
  v21 = v11;
  v22 = v12;
  v23 = v8;
  v15 = v8;
  v16 = v12;
  v17 = v11;
  v18 = -[HKQuantitySeriesSampleQuery initWithQuantityType:predicate:quantityHandler:](v13, "initWithQuantityType:predicate:quantityHandler:", v14, v9, v20);

  heartRateQuery = self->_heartRateQuery;
  self->_heartRateQuery = v18;

  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_heartRateQuery);
}

+ (id)workoutRecoveryDateIntervalForWorkout:(id)a3 overlappingWorkouts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_recoveryEndDateWithStartDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __94___HKHeartRateRecoveryQueryUtility_workoutRecoveryDateIntervalForWorkout_overlappingWorkouts___block_invoke;
  v37[3] = &unk_1E37EE4D8;
  v10 = v6;
  v38 = v10;
  v11 = v9;
  v39 = v11;
  v31 = v8;
  v32 = v7;
  v40 = v31;
  objc_msgSend(v7, "hk_filter:", v37);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v19, "startDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "hk_isBeforeOrEqualToDate:", v13);

        if (v21)
        {
          objc_msgSend(v19, "startDate");
          v22 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v22;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v13, "hk_isBeforeOrEqualToDate:", v11))
    v23 = v13;
  else
    v23 = v11;
  v24 = v23;
  objc_msgSend(v10, "endDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "compare:", v24);

  if (v26 == 1)
  {
    v27 = 0;
  }
  else
  {
    v28 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v10, "endDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v28, "initWithStartDate:endDate:", v29, v24);

  }
  return v27;
}

+ (id)workoutRecoveryHeartRatesForWorkout:(id)a3 recoveryDateInterval:(id)a4 readings:(id)a5
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102___HKHeartRateRecoveryQueryUtility_workoutRecoveryHeartRatesForWorkout_recoveryDateInterval_readings___block_invoke;
  v10[3] = &unk_1E37EE500;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a5, "hk_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)perMinuteWorkoutRecoveryHeartRateFromReadings:(id)a3 workoutEndDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(a1, "_recoveryEndDateWithStartDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v7, v9);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v28 = v10;
        v30 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        objc_msgSend(v30, "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "containsDate:", v11))
        {
          v12 = 0;
          for (i = 0; i != 3; ++i)
          {
            objc_msgSend(v7, "dateByAddingTimeInterval:", (double)v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "timeIntervalSinceDate:", v14);
            v16 = fabs(v15);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16 < 20.0)
            {
              if (!v18 || (objc_msgSend(v18, "doubleValue"), v16 < v19))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setObject:forKeyedSubscript:", v20, v21);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, v22);

              }
            }

            v12 += 60;
          }
        }

        v10 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v27);
  }

  return v29;
}

+ (id)_recoveryEndDateWithStartDate:(id)a3
{
  return (id)objc_msgSend(a3, "dateByAddingTimeInterval:", 200.0);
}

+ (id)predicateForWorkoutRecoveryTimeWithWorkout:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "recoveryDateIntervalWithWorkout:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuery predicateForSamplesWithStartDate:endDate:inclusiveEndDates:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:inclusiveEndDates:options:", v4, v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)recoveryDateIntervalWithWorkout:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3588];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_recoveryEndDateWithStartDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v9);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateReadings, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_workoutQueryUtility, 0);
  objc_storeStrong((id *)&self->_heartRateQuery, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
