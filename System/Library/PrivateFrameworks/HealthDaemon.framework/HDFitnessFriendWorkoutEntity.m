@implementation HDFitnessFriendWorkoutEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return CFSTR("fitness_friend_workouts");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 17;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_83;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDFitnessFriendWorkoutEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDFitnessFriendWorkoutEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[18];

  v27[17] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a5;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDFitnessFriendWorkoutEntity.m"), 108, CFSTR("Subclasses must override %s"), "+[HDFitnessFriendWorkoutEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v27[0] = CFSTR("data_id");
  v27[1] = CFSTR("friend_uuid");
  v27[2] = CFSTR("duration");
  v27[3] = CFSTR("total_energy_burned");
  v27[4] = CFSTR("total_basal_energy_burned");
  v27[5] = CFSTR("total_distance");
  v27[6] = CFSTR("activity_type");
  v27[7] = CFSTR("goal_type");
  v27[8] = CFSTR("goal");
  v27[9] = CFSTR("bundle_id");
  v27[10] = CFSTR("is_watch_workout");
  v27[11] = CFSTR("is_indoor_workout");
  v27[12] = CFSTR("device_manufacturer");
  v27[13] = CFSTR("device_model");
  v27[14] = CFSTR("activity_move_mode");
  v27[15] = CFSTR("seymour_catalog_workout_identifier");
  v27[16] = CFSTR("seymour_media_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __94__HDFitnessFriendWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v24[3] = &unk_1E6CE89A8;
  v25 = v13;
  v26 = v12;
  v17 = v12;
  v18 = v13;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v14, v16, a7, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v18;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

void __94__HDFitnessFriendWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
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
  id v27;

  MEMORY[0x1BCCAB114](a2, CFSTR("data_id"), objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(*(id *)(a1 + 40), "friendUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("friend_uuid"), v4);

  objc_msgSend(*(id *)(a1 + 40), "duration");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("duration"));
  MEMORY[0x1BCCAB114](a2, CFSTR("activity_type"), objc_msgSend(*(id *)(a1 + 40), "workoutActivityType"));
  MEMORY[0x1BCCAB114](a2, CFSTR("goal_type"), objc_msgSend(*(id *)(a1 + 40), "goalType"));
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("bundle_id"), v5);

  MEMORY[0x1BCCAB114](a2, CFSTR("is_watch_workout"), objc_msgSend(*(id *)(a1 + 40), "isWatchWorkout"));
  MEMORY[0x1BCCAB114](a2, CFSTR("is_indoor_workout"), objc_msgSend(*(id *)(a1 + 40), "isIndoorWorkout"));
  MEMORY[0x1BCCAB114](a2, CFSTR("activity_move_mode"), objc_msgSend(*(id *)(a1 + 40), "amm"));
  objc_msgSend(*(id *)(a1 + 40), "totalEnergyBurned");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "totalEnergyBurned");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalEnergyBurnedUnit();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v8);
    MEMORY[0x1BCCAB0F0](a2, CFSTR("total_energy_burned"));

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("total_energy_burned"));
  }
  objc_msgSend(*(id *)(a1 + 40), "totalBasalEnergyBurned");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "totalBasalEnergyBurned");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalEnergyBurnedUnit();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValueForUnit:", v11);
    MEMORY[0x1BCCAB0F0](a2, CFSTR("total_basal_energy_burned"));

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("total_basal_energy_burned"));
  }
  objc_msgSend(*(id *)(a1 + 40), "totalDistance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "totalDistance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalDistanceUnit();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValueForUnit:", v14);
    MEMORY[0x1BCCAB0F0](a2, CFSTR("total_distance"));

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("total_distance"));
  }
  objc_msgSend(*(id *)(a1 + 40), "goal");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15
    && (v16 = (void *)v15,
        objc_msgSend(*(id *)(a1 + 40), "goalType"),
        IsValidForGoal = _HKWorkoutGoalTypeIsValidForGoal(),
        v16,
        IsValidForGoal))
  {
    objc_msgSend(*(id *)(a1 + 40), "goal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "goalType");
    _HKWorkoutCanonicalUnitForGoalType();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValueForUnit:", v19);
    MEMORY[0x1BCCAB0F0](a2, CFSTR("goal"));

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("goal"));
  }
  objc_msgSend(*(id *)(a1 + 40), "deviceManufacturer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 40), "deviceManufacturer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB144](a2, CFSTR("device_manufacturer"), v21);

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("device_manufacturer"));
  }
  objc_msgSend(*(id *)(a1 + 40), "deviceModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 40), "deviceModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB144](a2, CFSTR("device_model"), v23);

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("device_model"));
  }
  objc_msgSend(*(id *)(a1 + 40), "seymourCatalogWorkoutIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 40), "seymourCatalogWorkoutIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB144](a2, CFSTR("seymour_catalog_workout_identifier"), v25);

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("seymour_catalog_workout_identifier"));
  }
  objc_msgSend(*(id *)(a1 + 40), "seymourMediaType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
    JUMPOUT(0x1BCCAB120);
  objc_msgSend(*(id *)(a1 + 40), "seymourMediaType");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("seymour_media_type"), v27);

}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "fitnessFriendWorkouts");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addFitnessFriendWorkouts:", a3);
  return a3 != 0;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)enumerateWorkoutsWithPredicate:(id)a3 anchor:(id *)a4 profile:(id)a5 error:(id *)a6 handler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  id *v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a7;
  v25 = a6;
  if (a4)
  {
    v14 = *a4;
    v15 = *MEMORY[0x1E0D29618];
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanValue:", *MEMORY[0x1E0D29618], v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v14 = 0;
    v16 = 0;
    v15 = *MEMORY[0x1E0D29618];
  }
  objc_msgSend(MEMORY[0x1E0CB6978], "fitnessFriendWorkoutType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSampleEntity entityEnumeratorWithType:profile:](HDFitnessFriendWorkoutEntity, "entityEnumeratorWithType:profile:", v17, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v11, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPredicate:", v19);

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v32 = objc_msgSend(v14, "longLongValue");
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", v15, objc_opt_class(), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOrderingTerms:", v21);

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __92__HDFitnessFriendWorkoutEntity_enumerateWorkoutsWithPredicate_anchor_profile_error_handler___block_invoke;
  v26[3] = &unk_1E6CFA980;
  v28 = &v29;
  v22 = v13;
  v27 = v22;
  v23 = objc_msgSend(v18, "enumerateWithError:handler:", v25, v26);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v30[3]);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v29, 8);
  return v23;
}

uint64_t __92__HDFitnessFriendWorkoutEntity_enumerateWorkoutsWithPredicate_anchor_profile_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  if (v4 <= a3)
    v4 = a3;
  *(_QWORD *)(v3 + 24) = v4;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
