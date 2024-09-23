@implementation _HDFitnessFriendWorkoutEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[17];

  v9[16] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("friend_uuid");
  v9[1] = CFSTR("duration");
  v9[2] = CFSTR("total_energy_burned");
  v9[3] = CFSTR("total_basal_energy_burned");
  v9[4] = CFSTR("total_distance");
  v9[5] = CFSTR("activity_type");
  v9[6] = CFSTR("goal_type");
  v9[7] = CFSTR("goal");
  v9[8] = CFSTR("bundle_id");
  v9[9] = CFSTR("is_watch_workout");
  v9[10] = CFSTR("is_indoor_workout");
  v9[11] = CFSTR("device_manufacturer");
  v9[12] = CFSTR("device_model");
  v9[13] = CFSTR("activity_move_mode");
  v9[14] = CFSTR("seymour_catalog_workout_identifier");
  v9[15] = CFSTR("seymour_media_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)_HDFitnessFriendWorkoutEntityEncoder;
  -[HDEntityEncoder superclassEncoder](&v8, sel_superclassEncoder);
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
  HDCodableFitnessFriendWorkout *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableFitnessFriendWorkout);
    -[HDCodableFitnessFriendWorkout setSample:](v10, "setSample:", v9);
    HDSQLiteColumnWithNameAsData();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendWorkout setFriendUUID:](v10, "setFriendUUID:", v11);

    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendWorkout setDuration:](v10, "setDuration:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendWorkout setTotalEnergyBurnedInCanonicalUnit:](v10, "setTotalEnergyBurnedInCanonicalUnit:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendWorkout setTotalBasalEnergyBurnedInCanonicalUnit:](v10, "setTotalBasalEnergyBurnedInCanonicalUnit:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendWorkout setTotalDistanceInCanonicalUnit:](v10, "setTotalDistanceInCanonicalUnit:");
    -[HDCodableFitnessFriendWorkout setType:](v10, "setType:", HDSQLiteColumnWithNameAsInt64());
    -[HDCodableFitnessFriendWorkout setAmm:](v10, "setAmm:", HDEntityActivityModeModeForRowAndColumnName((uint64_t)a4));
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      -[HDCodableFitnessFriendWorkout setGoalType:](v10, "setGoalType:", HDSQLiteColumnWithNameAsInt64());
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableFitnessFriendWorkout setGoal:](v10, "setGoal:");
    }
    HDSQLiteColumnWithNameAsString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendWorkout setBundleID:](v10, "setBundleID:", v12);

    -[HDCodableFitnessFriendWorkout setIsWatchWorkout:](v10, "setIsWatchWorkout:", HDSQLiteColumnWithNameAsInt64());
    -[HDCodableFitnessFriendWorkout setIsIndoorWorkout:](v10, "setIsIndoorWorkout:", HDSQLiteColumnWithNameAsInt64());
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableFitnessFriendWorkout setDeviceManufacturer:](v10, "setDeviceManufacturer:", v13);

    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableFitnessFriendWorkout setDeviceModel:](v10, "setDeviceModel:", v14);

    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableFitnessFriendWorkout setSeymourCatalogWorkoutIdentifier:](v10, "setSeymourCatalogWorkoutIdentifier:", v15);

    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableFitnessFriendWorkout setSeymourMediaType:](v10, "setSeymourMediaType:", v16);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6FB8]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

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
    objc_msgSend(v10, "setDuration:");
    v14 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v14) & 1) == 0)
    {
      v15 = MEMORY[0x1BCCAB1A4](a5, v14);
      v16 = (void *)MEMORY[0x1E0CB6A28];
      _HKWorkoutCanonicalEnergyBurnedUnit();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setTotalEnergyBurned:", v18);
    }
    v19 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v19) & 1) == 0)
    {
      v20 = MEMORY[0x1BCCAB1A4](a5, v19);
      v21 = (void *)MEMORY[0x1E0CB6A28];
      _HKWorkoutCanonicalEnergyBurnedUnit();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "quantityWithUnit:doubleValue:", v22, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setTotalBasalEnergyBurned:", v23);
    }
    v24 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v24) & 1) == 0)
    {
      v25 = MEMORY[0x1BCCAB1A4](a5, v24);
      v26 = (void *)MEMORY[0x1E0CB6A28];
      _HKWorkoutCanonicalDistanceUnit();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "quantityWithUnit:doubleValue:", v27, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setTotalDistance:", v28);
    }
    objc_msgSend(v10, "setWorkoutActivityType:", HDSQLiteColumnWithNameAsInt64());
    objc_msgSend(v10, "setAmm:", HDEntityActivityModeModeForRowAndColumnName((uint64_t)a5));
    v29 = HDSQLiteColumnWithNameAsInt64();
    v30 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v30) & 1) == 0 && _HKWorkoutGoalTypeIsValidForGoal())
    {
      v31 = (void *)MEMORY[0x1E0CB6A28];
      _HKWorkoutCanonicalUnitForGoalType();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1BCCAB1A4](a5, v30);
      objc_msgSend(v31, "quantityWithUnit:doubleValue:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setGoal:", v33);
      objc_msgSend(v10, "setGoalType:", v29);

    }
    HDSQLiteColumnWithNameAsString();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBundleID:", v34);

    objc_msgSend(v10, "setIsWatchWorkout:", HDSQLiteColumnWithNameAsInt64() != 0);
    objc_msgSend(v10, "setIsIndoorWorkout:", HDSQLiteColumnWithNameAsInt64() != 0);
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsString();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDeviceManufacturer:", v35);

    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDeviceModel:", v36);

    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSeymourCatalogWorkoutIdentifier:", v37);

    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSeymourMediaType:", v38);

    }
  }

  return v12;
}

@end
