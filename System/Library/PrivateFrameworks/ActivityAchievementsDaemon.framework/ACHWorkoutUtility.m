@implementation ACHWorkoutUtility

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHWorkoutUtility _predicateWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:](self, "_predicateWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:", 0, v7, v8, 1, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ACHWorkoutUtility _countOfSamplesWithPredicate:](self, "_countOfSamplesWithPredicate:", v9);
  return v10;
}

- (id)_predicateWithDuration:(double)a3 withType:(id)a4 startingAtOrAfterDate:(id)a5 endingOnOrBeforeDate:(id)a6 firstPartyOnly:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a7;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v7)
  {
    -[ACHWorkoutUtility firstPartyPredicate](self, "firstPartyPredicate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
  if (v12)
  {
    HDSampleEntityPredicateForStartDate();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);

  }
  if (v13)
  {
    HDSampleEntityPredicateForEndDate();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v17);

  }
  if (v11)
  {
    objc_msgSend(v11, "unsignedIntegerValue");
    HDWorkoutEntityPredicateForWorkoutActivityType();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);
  }
  else
  {
    HDWorkoutEntityPredicateForWorkoutActivityType();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE40E20], "negatedPredicate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v19);

  }
  HDWorkoutEntityPredicateForDuration();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v20);
  objc_msgSend(MEMORY[0x24BE40E20], "predicateMatchingAllPredicates:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (HDSQLitePredicate)firstPartyPredicate
{
  HDSQLitePredicate *firstPartyPredicate;
  HDSQLitePredicate *v4;
  HDSQLitePredicate *v5;

  firstPartyPredicate = self->_firstPartyPredicate;
  if (!firstPartyPredicate)
  {
    HDDataEntityPredicateForObjectsFromAppleWatchSources();
    v4 = (HDSQLitePredicate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_firstPartyPredicate;
    self->_firstPartyPredicate = v4;

    firstPartyPredicate = self->_firstPartyPredicate;
  }
  return firstPartyPredicate;
}

- (unint64_t)_countOfSamplesWithPredicate:(id)a3 andLocationType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD v22[6];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  -[ACHWorkoutUtility profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE40BC0];
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD3F08], "workoutType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entityEnumeratorWithType:profile:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setPredicate:", v6);
    v23 = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __66__ACHWorkoutUtility__countOfSamplesWithPredicate_andLocationType___block_invoke;
    v22[3] = &unk_24D13D868;
    v22[4] = &v25;
    v22[5] = a4;
    objc_msgSend(v10, "enumerateWithError:handler:", &v23, v22);
    v11 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD3DC0], "workoutType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v12 = objc_msgSend(v8, "countOfSamplesWithType:profile:matchingPredicate:withError:", v10, v7, v6, &v24);
    v11 = v24;
    v26[3] = v12;
  }

  if (v11)
  {
    ACHLogWorkouts();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACHWorkoutUtility _countOfSamplesWithPredicate:andLocationType:].cold.1((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

  }
  v20 = v26[3];

  _Block_object_dispose(&v25, 8);
  return v20;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (unint64_t)_countOfSamplesWithPredicate:(id)a3
{
  return -[ACHWorkoutUtility _countOfSamplesWithPredicate:andLocationType:](self, "_countOfSamplesWithPredicate:andLocationType:", a3, 0);
}

- (ACHWorkoutUtility)initWithProfile:(id)a3
{
  id v4;
  ACHWorkoutUtility *v5;
  ACHWorkoutUtility *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACHWorkoutUtility;
  v5 = -[ACHWorkoutUtility init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (id)_readingContextWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;

  v4 = a3;
  -[ACHWorkoutUtility profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  +[ACHDatabaseAssertion assertionWithDatabase:identifier:error:](ACHDatabaseAssertion, "assertionWithDatabase:identifier:error:", v6, v4, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v18;
  if (v8)
  {
    ACHLogXPC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACHAwardsServer _transactionContextForWritingProtectedDataWithIdentifier:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  }
  ACHDatabaseContextWithAccessibilityAssertion(v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRequiresProtectedData:", 1);

  return v16;
}

- (id)workoutsInDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHWorkoutUtility workoutsWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:](self, "workoutsWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:", 0, v5, v6, 0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)numberOfWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHWorkoutUtility _predicateWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:](self, "_predicateWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:", 0, v7, v8, 0, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ACHWorkoutUtility _countOfSamplesWithPredicate:](self, "_countOfSamplesWithPredicate:", v9);
  return v10;
}

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 endingOnOrBeforeDate:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutUtility _predicateWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:](self, "_predicateWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:", v10, 0, v9, 1, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ACHWorkoutUtility _countOfSamplesWithPredicate:](self, "_countOfSamplesWithPredicate:", v11);
  return v12;
}

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 andLocation:(unint64_t)a5 containedInInterval:(id)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;

  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a6;
  objc_msgSend(v10, "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHWorkoutUtility _predicateWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:](self, "_predicateWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:", v12, v13, v14, 1, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[ACHWorkoutUtility _countOfSamplesWithPredicate:andLocationType:](self, "_countOfSamplesWithPredicate:andLocationType:", v15, a5);
  return v16;
}

- (id)workoutsWithDuration:(double)a3 withType:(id)a4 startingAtOrAfterDate:(id)a5 endingOnOrBeforeDate:(id)a6 firstPartyOnly:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(_QWORD *, uint64_t, uint64_t);
  void *v27;
  id v28;
  id v29;
  uint64_t *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  _BOOL4 v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v7 = a7;
  v50 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[ACHWorkoutUtility _predicateWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:](self, "_predicateWithDuration:withType:startingAtOrAfterDate:endingOnOrBeforeDate:firstPartyOnly:", v12, v13, v14, v7, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutUtility profile](self, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__34;
  v36 = __Block_byref_object_dispose__34;
  v37 = 0;
  v30 = &v32;
  v31 = 0;
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __109__ACHWorkoutUtility_workoutsWithDuration_withType_startingAtOrAfterDate_endingOnOrBeforeDate_firstPartyOnly___block_invoke;
  v27 = &unk_24D13A4F0;
  v17 = v16;
  v28 = v17;
  v18 = v15;
  v29 = v18;
  -[ACHWorkoutUtility _performReadTransaction:error:block:](self, "_performReadTransaction:error:block:", CFSTR("WorkoutsWithDuration"), &v31, &v24);
  v19 = v31;
  if (v19)
  {
    ACHLogWorkouts();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", objc_msgSend(v12, "unsignedIntegerValue", v24, v25, v26, v27, v28));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110402;
      v39 = v7;
      v40 = 2048;
      v41 = (uint64_t)a3;
      v42 = 2114;
      v43 = v23;
      v44 = 2114;
      v45 = v13;
      v46 = 2114;
      v47 = v14;
      v48 = 2114;
      v49 = v19;
      _os_log_error_impl(&dword_21407B000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch workouts with firstPartyOnly: %{BOOL}d, duration: %ld, type: %{public}@, date interval: (%{public}@, %{public}@): %{public}@", buf, 0x3Au);

    }
    v21 = 0;
  }
  else
  {
    v21 = (id)v33[5];
  }

  _Block_object_dispose(&v32, 8);
  return v21;
}

uint64_t __109__ACHWorkoutUtility_workoutsWithDuration_withType_startingAtOrAfterDate_endingOnOrBeforeDate_firstPartyOnly___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BE40BC0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "workoutType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v6, a1[4], 0, a1[5], 0, 0, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return 1;
}

- (id)bestEnergyBurnedForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  id v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HDSampleEntityPredicateForEndDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDWorkoutEntityPredicateForWorkoutActivityType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4168], "workoutType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE40E20];
  v33[0] = v6;
  v33[1] = v7;
  v33[2] = v9;
  -[ACHWorkoutUtility firstPartyPredicate](self, "firstPartyPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAllPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__34;
  v31 = __Block_byref_object_dispose__34;
  v32 = 0;
  v25 = &v27;
  v26 = 0;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __84__ACHWorkoutUtility_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate___block_invoke;
  v23 = &unk_24D13B838;
  v14 = v13;
  v24 = v14;
  -[ACHWorkoutUtility _performReadTransaction:error:block:](self, "_performReadTransaction:error:block:", CFSTR("BestWorkoutEnergyBurned"), &v26, &v20);
  v15 = v26;
  if (v15)
  {
    ACHLogWorkouts();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACHWorkoutUtility bestEnergyBurnedForFirstPartyWorkoutsWithType:endingBeforeDate:].cold.1();
    v17 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit", v20, v21, v22, v23);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "doubleValue");
    objc_msgSend(v18, "quantityWithUnit:doubleValue:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v27, 8);
  return v17;
}

uint64_t __84__ACHWorkoutUtility_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE40D00], "maxValueForProperty:predicate:database:error:", CFSTR("total_energy_burned"), *(_QWORD *)(a1 + 32), v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return 1;
}

- (id)bestDistanceForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  id v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HDSampleEntityPredicateForEndDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDWorkoutEntityPredicateForWorkoutActivityType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4168], "workoutType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE40E20];
  v33[0] = v6;
  v33[1] = v7;
  v33[2] = v9;
  -[ACHWorkoutUtility firstPartyPredicate](self, "firstPartyPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAllPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__34;
  v31 = __Block_byref_object_dispose__34;
  v32 = 0;
  v25 = &v27;
  v26 = 0;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __80__ACHWorkoutUtility_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate___block_invoke;
  v23 = &unk_24D13B838;
  v14 = v13;
  v24 = v14;
  -[ACHWorkoutUtility _performReadTransaction:error:block:](self, "_performReadTransaction:error:block:", CFSTR("BestWorkoutDistance"), &v26, &v20);
  v15 = v26;
  if (v15)
  {
    ACHLogWorkouts();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACHWorkoutUtility bestDistanceForFirstPartyWorkoutsWithType:endingBeforeDate:].cold.1();
    v17 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9, v20, v21, v22, v23);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "doubleValue");
    objc_msgSend(v18, "quantityWithUnit:doubleValue:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v27, 8);
  return v17;
}

uint64_t __80__ACHWorkoutUtility_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE40D00], "maxValueForProperty:predicate:database:error:", CFSTR("total_distance"), *(_QWORD *)(a1 + 32), v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return 1;
}

- (id)mindfulMinutesForForDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", 86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HDSampleEntityPredicateForStartDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBD1A8], "arrayByAddingObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE40E20], "predicateMatchingAllPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutUtility profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__34;
  v33 = __Block_byref_object_dispose__34;
  v34 = 0;
  v27 = &v29;
  v28 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __54__ACHWorkoutUtility_mindfulMinutesForForDateInterval___block_invoke;
  v24[3] = &unk_24D13A4F0;
  v14 = v13;
  v25 = v14;
  v15 = v12;
  v26 = v15;
  -[ACHWorkoutUtility _performReadTransaction:error:block:](self, "_performReadTransaction:error:block:", CFSTR("MindfulSessionWithinDateInterval"), &v28, v24);
  v16 = v28;
  if (v16)
  {
    ACHLogWorkouts();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v36 = v23;
      v37 = 2114;
      v38 = v7;
      v39 = 2114;
      v40 = v16;
      _os_log_error_impl(&dword_21407B000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch mindful sessions for date interval: (%{public}@, %{public}@): %{public}@", buf, 0x20u);
    }
    v18 = 0;
  }
  else
  {
    -[ACHWorkoutUtility _sumMindfulMinutesForSessions:dateInterval:](self, "_sumMindfulMinutesForSessions:dateInterval:", v30[5], v4);
    v20 = v19;
    v21 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "quantityWithUnit:doubleValue:", v17, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v29, 8);
  return v18;
}

uint64_t __54__ACHWorkoutUtility_mindfulMinutesForForDateInterval___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BE40BC0];
  objc_msgSend(MEMORY[0x24BDD3F08], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v6, a1[4], 0, a1[5], 0, 0, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return 1;
}

- (double)_sumMindfulMinutesForSessions:(id)a3 dateInterval:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    v10 = 0.0;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v12, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "containsDate:", v13) & 1) != 0)
        {
          objc_msgSend(v12, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "containsDate:", v14);

          if ((v15 & 1) == 0)
          {
            objc_msgSend(v6, "startDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "startDate");
            v17 = objc_claimAutoreleasedReturnValue();
LABEL_14:
            v21 = (void *)v17;
            objc_msgSend(v16, "timeIntervalSinceDate:", v17);
            v23 = v22;

            objc_msgSend(v12, "endDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "startDate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "timeIntervalSinceDate:", v25);
            v27 = v26;

            v10 = v10 + v27 - v23;
            continue;
          }
        }
        else
        {

        }
        objc_msgSend(v12, "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "containsDate:", v18))
        {

        }
        else
        {
          objc_msgSend(v12, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v6, "containsDate:", v19);

          if (v20)
          {
            objc_msgSend(v12, "endDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "endDate");
            v17 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
        objc_msgSend(v12, "endDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "containsDate:", v28) & 1) != 0)
        {
          objc_msgSend(v12, "startDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v6, "containsDate:", v29);

          if (v30)
          {
            objc_msgSend(v12, "endDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "startDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "timeIntervalSinceDate:", v32);
            v34 = v33;

            v10 = v10 + v34;
          }
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (!v8)
        goto LABEL_23;
    }
  }
  v10 = 0.0;
LABEL_23:

  return v10;
}

- (void)_performReadTransaction:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v17 = a3;
  v8 = a5;
  -[ACHWorkoutUtility profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutUtility databaseContext](self, "databaseContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[ACHWorkoutUtility _readingContextWithIdentifier:](self, "_readingContextWithIdentifier:", v17);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = (void *)MEMORY[0x24BE40BC0];
  objc_msgSend(v9, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__ACHWorkoutUtility__performReadTransaction_error_block___block_invoke;
  v18[3] = &unk_24D13D840;
  v19 = v8;
  v16 = v8;
  objc_msgSend(v14, "performReadTransactionWithHealthDatabase:context:error:block:", v15, v13, a4, v18);

}

uint64_t __57__ACHWorkoutUtility__performReadTransaction_error_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__ACHWorkoutUtility__countOfSamplesWithPredicate_andLocationType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  char v8;

  objc_msgSend(a2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == 1)
    v7 = v5;
  else
    v7 = 0;
  if (v6 == 2)
    v8 = v5;
  else
    v8 = 1;
  if (v7 == 1 || (v8 & 1) == 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

- (HDDatabaseTransactionContext)databaseContext
{
  return self->_databaseContext;
}

- (void)setDatabaseContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (void)setFirstPartyPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_firstPartyPredicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPartyPredicate, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_databaseContext, 0);
}

- (void)bestEnergyBurnedForFirstPartyWorkoutsWithType:endingBeforeDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Failed to fetch the best energy burned before date %{public}@ with error %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)bestDistanceForFirstPartyWorkoutsWithType:endingBeforeDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Failed to fetch the best distance before date %{public}@ with error %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_countOfSamplesWithPredicate:(uint64_t)a3 andLocationType:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Failed to obtain the sample count due to error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
