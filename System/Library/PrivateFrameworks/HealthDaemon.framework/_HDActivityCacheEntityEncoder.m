@implementation _HDActivityCacheEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[6];
  _QWORD v15[17];

  v15[16] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("cache_index");
  v15[1] = CFSTR("sequence");
  v15[2] = CFSTR("activity_mode");
  v15[3] = CFSTR("energy_burned");
  v15[4] = CFSTR("move_minutes");
  v15[5] = CFSTR("brisk_minutes");
  v15[6] = CFSTR("active_hours");
  v15[7] = CFSTR("energy_burned_goal");
  v15[8] = CFSTR("energy_burned_goal_date");
  v15[9] = CFSTR("move_minutes_goal");
  v15[10] = CFSTR("move_minutes_goal_date");
  v15[11] = CFSTR("brisk_minutes_goal");
  v15[12] = CFSTR("brisk_minutes_goal_date");
  v15[13] = CFSTR("active_hours_goal");
  v15[14] = CFSTR("active_hours_goal_date");
  v15[15] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCachePrivateProperties](self))
  {
    v14[0] = CFSTR("steps");
    v14[1] = CFSTR("pushes");
    v14[2] = CFSTR("walk_distance");
    v14[3] = CFSTR("deep_breathing_duration");
    v14[4] = CFSTR("flights");
    v14[5] = CFSTR("wheelchair_use");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if (-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCacheStatistics](self))
  {
    v13[0] = CFSTR("energy_burned_stats");
    v13[1] = CFSTR("move_minutes_stats");
    v13[2] = CFSTR("brisk_minutes_stats");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  objc_msgSend(v3, "arrayByAddingObject:", CFSTR("paused"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orderedProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v10;
  void *v11;
  HDCodableActivityCache *v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if ((-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCachePrivateProperties](self) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDActivityCacheEntity.m"), 629, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _shouldIncludeActivityCachePrivateProperties]"));

  }
  if ((-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCacheStatistics](self) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDActivityCacheEntity.m"), 630, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _shouldIncludeActivityCacheStatistics]"));

  }
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc_init(HDCodableActivityCache);
    -[HDCodableActivityCache setSample:](v12, "setSample:", v11);
    -[HDCodableActivityCache setCacheIndex:](v12, "setCacheIndex:", HDSQLiteColumnWithNameAsInt64());
    -[HDCodableActivityCache setSequence:](v12, "setSequence:", HDSQLiteColumnWithNameAsInt64());
    v13 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a4, v13) & 1) == 0)
      -[HDCodableActivityCache setWheelchairUse:](v12, "setWheelchairUse:", HDSQLiteColumnAsInt64());
    -[HDCodableActivityCache setActivityMoveMode:](v12, "setActivityMoveMode:", HDEntityActivityModeModeForRowAndColumnName((uint64_t)a4));
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
      -[HDCodableActivityCache setPaused:](v12, "setPaused:", HDSQLiteColumnWithNameAsBoolean());
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
      -[HDCodableActivityCache setVersion:](v12, "setVersion:", HDSQLiteColumnWithNameAsInt64());
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setEnergyBurned:](v12, "setEnergyBurned:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setEnergyBurnedGoal:](v12, "setEnergyBurnedGoal:");
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setEnergyBurnedGoalDate:](v12, "setEnergyBurnedGoalDate:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setMoveMinutes:](v12, "setMoveMinutes:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setMoveMinutesGoal:](v12, "setMoveMinutesGoal:");
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setMoveMinutesGoalDate:](v12, "setMoveMinutesGoalDate:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setBriskMinutes:](v12, "setBriskMinutes:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setBriskMinutesGoal:](v12, "setBriskMinutesGoal:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setBriskMinutesGoalDate:](v12, "setBriskMinutesGoalDate:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setActiveHours:](v12, "setActiveHours:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setActiveHoursGoal:](v12, "setActiveHoursGoal:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setActiveHoursGoalDate:](v12, "setActiveHoursGoalDate:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
      -[HDCodableActivityCache setStepCount:](v12, "setStepCount:", HDSQLiteColumnWithNameAsInt64());
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
      -[HDCodableActivityCache setPushCount:](v12, "setPushCount:", HDSQLiteColumnWithNameAsInt64());
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setWalkingAndRunningDistance:](v12, "setWalkingAndRunningDistance:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setDeepBreathingDuration:](v12, "setDeepBreathingDuration:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
      -[HDCodableActivityCache setFlightsClimbed:](v12, "setFlightsClimbed:", HDSQLiteColumnWithNameAsInt64());
    v14 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a4, v14) & 1) == 0)
    {
      -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a4, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v47;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v47 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v19), "codableRepresentationForSync");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableActivityCache addDailyEnergyBurnedStatistics:](v12, "addDailyEnergyBurnedStatistics:", v20);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        }
        while (v17);
      }

    }
    v21 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a4, v21) & 1) == 0)
    {
      -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a4, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v43;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v43 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v26), "codableRepresentationForSync");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableActivityCache addDailyMoveMinutesStatistics:](v12, "addDailyMoveMinutesStatistics:", v27);

            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        }
        while (v24);
      }

    }
    v28 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a4, v28) & 1) == 0)
    {
      -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a4, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v39;
        do
        {
          v33 = 0;
          do
          {
            if (*(_QWORD *)v39 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v33), "codableRepresentationForSync");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableActivityCache addDailyBriskMinutesStatistics:](v12, "addDailyBriskMinutesStatistics:", v34);

            ++v33;
          }
          while (v31 != v33);
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        }
        while (v31);
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (uint64_t)_shouldIncludeActivityCachePrivateProperties
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  if (!objc_msgSend(a1, "purpose"))
    return 1;
  objc_msgSend(a1, "encodingOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IncludePrivateActivityCacheProperties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (uint64_t)_shouldIncludeActivityCacheStatistics
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  if (!objc_msgSend(a1, "purpose"))
    return 1;
  objc_msgSend(a1, "encodingOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IncludeActivityCacheStatistics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)_decodeActivityQuantityStatisticsInfosWithRow:(int)a3 column:
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = *(_QWORD *)(a1 + 72);
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v9;

    v6 = *(_QWORD *)(a1 + 72);
  }
  v11 = (void *)MEMORY[0x1E0CB3710];
  MEMORY[0x1BCCAB18C](a2, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v6, v12, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;

  if (!v13)
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5268];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5268], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Failed to decode activity statistics: %{public}@", buf, 0xCu);
    }
  }

  return v13;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6268]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  int v45;
  int v46;
  id v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_msgSend(v10, "_setCacheIndex:", HDSQLiteColumnWithNameAsInt64());
    objc_msgSend(v10, "_setSequence:", HDSQLiteColumnWithNameAsInt64());
    v13 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEnergyBurned:", v15);

    v16 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEnergyBurnedGoalOnly:", v18);

    HDSQLiteColumnWithNameAsDate();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEnergyBurnedGoalDateOnly:", v19);

    v20 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v20) & 1) == 0)
    {
      MEMORY[0x1BCCAB1A4](a5, v20);
      objc_msgSend(v10, "_setMoveMinutes:");
    }
    v21 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v21) & 1) == 0)
    {
      v22 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1BCCAB1A4](a5, v21);
      objc_msgSend(v22, "quantityWithUnit:doubleValue:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setMoveMinutesGoalOnly:", v24);

    }
    HDSQLiteColumnWithNameAsDate();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setMoveMinutesGoalDateOnly:", v25);

    v26 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v26) & 1) == 0)
    {
      MEMORY[0x1BCCAB1A4](a5, v26);
      objc_msgSend(v10, "_setBriskMinutes:");
    }
    v27 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v27) & 1) == 0)
    {
      v28 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1BCCAB1A4](a5, v27);
      objc_msgSend(v28, "quantityWithUnit:doubleValue:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setBriskMinutesGoalOnly:", v30);

    }
    HDSQLiteColumnWithNameAsDate();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setBriskMinutesGoalDateOnly:", v31);

    v32 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v32) & 1) == 0)
    {
      MEMORY[0x1BCCAB1A4](a5, v32);
      objc_msgSend(v10, "_setActiveHours:");
    }
    v33 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v33) & 1) == 0)
    {
      v34 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1BCCAB1A4](a5, v33);
      objc_msgSend(v34, "quantityWithUnit:doubleValue:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setActiveHoursGoalOnly:", v36);

    }
    HDSQLiteColumnWithNameAsDate();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setActiveHoursGoalDateOnly:", v37);

    objc_msgSend(v10, "_setActivityMoveMode:", HDEntityActivityModeModeForRowAndColumnName((uint64_t)a5));
    objc_msgSend(v10, "_setPaused:", HDSQLiteColumnWithNameAsBoolean());
    objc_msgSend(v10, "_setVersion:", HDSQLiteColumnWithNameAsInt64());
    if (-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCachePrivateProperties](self))
    {
      v38 = v10;
      if (self)
      {
        v39 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v39) & 1) == 0)
          objc_msgSend(v38, "_setStepCount:", HDSQLiteColumnAsInt64());
        v40 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        HDSQLiteColumnWithNameAsDouble();
        objc_msgSend(v40, "quantityWithUnit:doubleValue:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "_setWalkingAndRunningDistance:", v42);

        v43 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v43) & 1) == 0)
          objc_msgSend(v38, "_setPushCount:", HDSQLiteColumnAsInt64());
        v44 = (int)HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v44) & 1) == 0)
        {
          MEMORY[0x1BCCAB1A4](a5, v44);
          objc_msgSend(v38, "_setDeepBreathingDuration:");
        }
        v45 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v45) & 1) == 0)
          objc_msgSend(v38, "_setFlightsClimbed:", HDSQLiteColumnAsInt64());
        v46 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v46) & 1) == 0)
          objc_msgSend(v38, "_setWheelchairUse:", HDSQLiteColumnAsInt64());
      }

    }
    if (-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCacheStatistics](self))
    {
      v47 = v10;
      if (self)
      {
        v48 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v48) & 1) == 0)
        {
          -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a5, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "_setDailyEnergyBurnedStatistics:", v49);

        }
        v50 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v50) & 1) == 0)
        {
          -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a5, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "_setDailyMoveMinutesStatistics:", v51);

        }
        v52 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v52) & 1) == 0)
        {
          -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a5, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "_setDailyBriskMinutesStatistics:", v53);

        }
      }

    }
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityStatisticsQuantityInfoClasses, 0);
}

@end
