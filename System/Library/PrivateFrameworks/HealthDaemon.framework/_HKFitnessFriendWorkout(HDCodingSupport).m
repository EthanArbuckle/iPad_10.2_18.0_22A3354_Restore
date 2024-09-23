@implementation _HKFitnessFriendWorkout(HDCodingSupport)

- (HDCodableFitnessFriendWorkout)codableRepresentationForSync
{
  HDCodableFitnessFriendWorkout *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int IsValidForGoal;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v2 = objc_alloc_init(HDCodableFitnessFriendWorkout);
  v30.receiver = a1;
  v30.super_class = (Class)&off_1EF224350;
  objc_msgSendSuper2(&v30, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendWorkout setSample:](v2, "setSample:", v3);
  objc_msgSend(a1, "friendUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_dataForUUIDBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendWorkout setFriendUUID:](v2, "setFriendUUID:", v5);

  objc_msgSend(a1, "duration");
  -[HDCodableFitnessFriendWorkout setDuration:](v2, "setDuration:");
  objc_msgSend(a1, "totalEnergyBurned");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "totalEnergyBurned");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalEnergyBurnedUnit();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v8);
    -[HDCodableFitnessFriendWorkout setTotalEnergyBurnedInCanonicalUnit:](v2, "setTotalEnergyBurnedInCanonicalUnit:");

  }
  objc_msgSend(a1, "totalBasalEnergyBurned");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "totalBasalEnergyBurned");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalEnergyBurnedUnit();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValueForUnit:", v11);
    -[HDCodableFitnessFriendWorkout setTotalBasalEnergyBurnedInCanonicalUnit:](v2, "setTotalBasalEnergyBurnedInCanonicalUnit:");

  }
  objc_msgSend(a1, "totalDistance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "totalDistance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalDistanceUnit();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValueForUnit:", v14);
    -[HDCodableFitnessFriendWorkout setTotalDistanceInCanonicalUnit:](v2, "setTotalDistanceInCanonicalUnit:");

  }
  -[HDCodableFitnessFriendWorkout setType:](v2, "setType:", objc_msgSend(a1, "workoutActivityType"));
  -[HDCodableFitnessFriendWorkout setGoalType:](v2, "setGoalType:", objc_msgSend(a1, "goalType"));
  objc_msgSend(a1, "goal");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(a1, "goalType");
    IsValidForGoal = _HKWorkoutGoalTypeIsValidForGoal();

    if (IsValidForGoal)
    {
      objc_msgSend(a1, "goal");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "goalType");
      _HKWorkoutCanonicalUnitForGoalType();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValueForUnit:", v19);
      -[HDCodableFitnessFriendWorkout setGoal:](v2, "setGoal:");

    }
  }
  objc_msgSend(a1, "bundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendWorkout setBundleID:](v2, "setBundleID:", v20);

  -[HDCodableFitnessFriendWorkout setIsWatchWorkout:](v2, "setIsWatchWorkout:", objc_msgSend(a1, "isWatchWorkout"));
  -[HDCodableFitnessFriendWorkout setIsIndoorWorkout:](v2, "setIsIndoorWorkout:", objc_msgSend(a1, "isIndoorWorkout"));
  objc_msgSend(a1, "deviceManufacturer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(a1, "deviceManufacturer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendWorkout setDeviceManufacturer:](v2, "setDeviceManufacturer:", v22);

  }
  objc_msgSend(a1, "deviceModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(a1, "deviceModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendWorkout setDeviceModel:](v2, "setDeviceModel:", v24);

  }
  -[HDCodableFitnessFriendWorkout setAmm:](v2, "setAmm:", objc_msgSend(a1, "amm"));
  objc_msgSend(a1, "seymourCatalogWorkoutIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(a1, "seymourCatalogWorkoutIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendWorkout setSeymourCatalogWorkoutIdentifier:](v2, "setSeymourCatalogWorkoutIdentifier:", v26);

  }
  objc_msgSend(a1, "seymourMediaType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(a1, "seymourMediaType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendWorkout setSeymourMediaType:](v2, "setSeymourMediaType:", v28);

  }
  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addFitnessFriendWorkouts:", v5);

  return v5 != 0;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend([a1 alloc], "_init");
    if (objc_msgSend(v5, "applyToObject:", v6))
    {
      v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = 0;
      else
        v10 = v6;
      v11 = v10;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
