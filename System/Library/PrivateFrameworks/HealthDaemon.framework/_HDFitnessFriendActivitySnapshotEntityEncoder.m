@implementation _HDFitnessFriendActivitySnapshotEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[19];

  v8[18] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("friend_uuid");
  v8[1] = CFSTR("active_hours");
  v8[2] = CFSTR("active_hours_goal");
  v8[3] = CFSTR("brisk_minutes");
  v8[4] = CFSTR("brisk_minutes_goal");
  v8[5] = CFSTR("energy_burned");
  v8[6] = CFSTR("energy_burned_goal");
  v8[7] = CFSTR("move_minutes");
  v8[8] = CFSTR("move_minutes_goal");
  v8[9] = CFSTR("activity_move_mode");
  v8[10] = CFSTR("steps");
  v8[11] = CFSTR("walk_run_distance");
  v8[12] = CFSTR("snapshot_index");
  v8[13] = CFSTR("source_uuid");
  v8[14] = CFSTR("uploaded_date");
  v8[15] = CFSTR("vulcan_count");
  v8[16] = CFSTR("vulcan_condition");
  v8[17] = CFSTR("timezone_offset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableFitnessFriendActivitySnapshot *v10;
  void *v11;
  void *v12;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableFitnessFriendActivitySnapshot);
    -[HDCodableFitnessFriendActivitySnapshot setSample:](v10, "setSample:", v9);
    HDSQLiteColumnWithNameAsData();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendActivitySnapshot setFriendUUID:](v10, "setFriendUUID:", v11);

    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setActiveHours:](v10, "setActiveHours:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setActiveHoursGoal:](v10, "setActiveHoursGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setBriskMinutes:](v10, "setBriskMinutes:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setBriskMinutesGoal:](v10, "setBriskMinutesGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setEnergyBurned:](v10, "setEnergyBurned:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setEnergyBurnedGoal:](v10, "setEnergyBurnedGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setMmv:](v10, "setMmv:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setMmg:](v10, "setMmg:");
    -[HDCodableFitnessFriendActivitySnapshot setAmm:](v10, "setAmm:", HDEntityActivityModeModeForRowAndColumnName((uint64_t)a4));
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setWalkingAndRunningDistance:](v10, "setWalkingAndRunningDistance:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setStepCount:](v10, "setStepCount:");
    HDSQLiteColumnWithNameAsData();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendActivitySnapshot setSourceUUID:](v10, "setSourceUUID:", v12);

    -[HDCodableFitnessFriendActivitySnapshot setSnapshotIndex:](v10, "setSnapshotIndex:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setUploadedDate:](v10, "setUploadedDate:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setPushCount:](v10, "setPushCount:");
    -[HDCodableFitnessFriendActivitySnapshot setWheelchairUse:](v10, "setWheelchairUse:", HDSQLiteColumnWithNameAsInt64());
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
      -[HDCodableFitnessFriendActivitySnapshot setTimeZoneOffsetFromUTCForNoon:](v10, "setTimeZoneOffsetFromUTCForNoon:", HDSQLiteColumnWithNameAsInt64());
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6FB0]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    HDSQLiteColumnWithNameAsUUID();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFriendUUID:", v13);

    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setActiveHours:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setActiveHoursGoal:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setBriskMinutes:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setBriskMinutesGoal:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setEnergyBurned:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setEnergyBurnedGoal:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setMmv:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setMmg:");
    objc_msgSend(v10, "setAmm:", HDEntityActivityModeModeForRowAndColumnName((uint64_t)a5));
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setWalkingAndRunningDistance:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setStepCount:");
    HDSQLiteColumnWithNameAsUUID();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceUUID:", v14);

    objc_msgSend(v10, "setSnapshotIndex:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsDate();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSnapshotUploadedDate:", v15);

    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setPushCount:");
    objc_msgSend(v10, "setWheelchairUse:", HDSQLiteColumnWithNameAsInt64());
    v16 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v16) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnAsInt64());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTimeZoneOffsetFromUTCForNoon:", v17);

    }
  }

  return v12;
}

@end
