@implementation HDWorkoutBuilderEntity

+ (HDWorkoutBuilderEntity)workoutBuilderEntityWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("uuid"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyWithPredicate:healthDatabase:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDWorkoutBuilderEntity *)v11;
}

+ (id)_workoutBuilderEntitiesForPredicate:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  void *v19;

  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_opt_self();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__HDWorkoutBuilderEntity__workoutBuilderEntitiesForPredicate_profile_error___block_invoke;
  v16[3] = &unk_1E6D029C0;
  v19 = v8;
  v11 = v6;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  LODWORD(a4) = objc_msgSend(v8, "performReadTransactionWithHealthDatabase:error:block:", v10, a4, v16);

  if ((_DWORD)a4)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

uint64_t __76__HDWorkoutBuilderEntity__workoutBuilderEntitiesForPredicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v5 = *(void **)(a1 + 48);
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HDWorkoutBuilderEntity__workoutBuilderEntitiesForPredicate_profile_error___block_invoke_2;
  v10[3] = &unk_1E6CFD730;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v5, "enumerateEntitiesInDatabase:predicate:error:enumerationHandler:", v6, v7, a3, v10);

  return v8;
}

uint64_t __76__HDWorkoutBuilderEntity__workoutBuilderEntitiesForPredicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (id)workoutBuilderEntitiesForSource:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("source_id"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDWorkoutBuilderEntity _workoutBuilderEntitiesForPredicate:profile:error:]((uint64_t)a1, v12, v9, (uint64_t)a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)workoutBuilderEntitiesExcludingSessions:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D29848], "doesNotContainPredicateWithProperty:values:", CFSTR("session"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("session"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D29840];
  v17[0] = v11;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateMatchingAnyPredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDWorkoutBuilderEntity _workoutBuilderEntitiesForPredicate:profile:error:]((uint64_t)a1, v14, v9, (uint64_t)a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)createEntityForBuilderConfiguration:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__158;
  v22 = __Block_byref_object_dispose__158;
  v23 = 0;
  objc_msgSend(a4, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__HDWorkoutBuilderEntity_createEntityForBuilderConfiguration_profile_error___block_invoke;
  v14[3] = &unk_1E6CFCE08;
  v16 = &v18;
  v17 = a1;
  v10 = v8;
  v15 = v10;
  LODWORD(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v9, a5, v14);

  if ((_DWORD)a5)
    v11 = (void *)v19[5];
  else
    v11 = 0;
  v12 = v11;

  _Block_object_dispose(&v18, 8);
  return v12;
}

BOOL __76__HDWorkoutBuilderEntity_createEntityForBuilderConfiguration_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[9];

  v16[8] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v16[0] = CFSTR("uuid");
  v16[1] = CFSTR("workout_configuration");
  v16[2] = CFSTR("source_id");
  v16[3] = CFSTR("source_version");
  v16[4] = CFSTR("device_id");
  v16[5] = CFSTR("goal_type");
  v16[6] = CFSTR("goal");
  v16[7] = CFSTR("should_collect_events");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  objc_msgSend(v5, "databaseForEntityClass:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__HDWorkoutBuilderEntity_createEntityForBuilderConfiguration_profile_error___block_invoke_2;
  v14[3] = &unk_1E6CFD818;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v7, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v8, v6, a3, v14);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
  return v12;
}

void __76__HDWorkoutBuilderEntity_createEntityForBuilderConfiguration_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "builderIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"));

  objc_msgSend(*(id *)(a1 + 32), "workoutConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  objc_msgSend(*(id *)(a1 + 32), "sourceEntity");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("source_id"), objc_msgSend(v9, "persistentID"));

  objc_msgSend(*(id *)(a1 + 32), "sourceVersion");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("source_version"));

  objc_msgSend(*(id *)(a1 + 32), "deviceEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  if (v4)
    MEMORY[0x1BCCAB114](a2, CFSTR("device_id"), objc_msgSend(v4, "persistentID"));
  else
    MEMORY[0x1BCCAB120](a2, CFSTR("device_id"));
  MEMORY[0x1BCCAB114](a2, CFSTR("goal_type"), objc_msgSend(*(id *)(a1 + 32), "goalType"));
  objc_msgSend(*(id *)(a1 + 32), "goal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "goal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindSecureCodingObjectToProperty();

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("goal"));
  }
  MEMORY[0x1BCCAB0CC](a2, CFSTR("should_collect_events"), objc_msgSend(*(id *)(a1 + 32), "shouldCollectWorkoutEvents"));

}

+ (BOOL)discardBuilderWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  HDDiscardWorkoutOperation *v9;

  v7 = a3;
  v8 = a4;
  v9 = -[HDDiscardWorkoutOperation initWithBuilderIdentifier:]([HDDiscardWorkoutOperation alloc], "initWithBuilderIdentifier:", v7);
  LOBYTE(a5) = -[HDJournalableOperation performOrJournalWithProfile:error:](v9, "performOrJournalWithProfile:error:", v8, a5);

  return (char)a5;
}

+ (id)finishWorkoutBuilderWithIdentifier:(id)a3 dateInterval:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__158;
  v29 = __Block_byref_object_dispose__158;
  v30 = 0;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke;
  v19[3] = &unk_1E6D02A38;
  v24 = a1;
  v14 = v10;
  v20 = v14;
  v15 = v12;
  v21 = v15;
  v23 = &v25;
  v16 = v11;
  v22 = v16;
  LOBYTE(a1) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v13, a6, v19);

  if ((a1 & 1) != 0
    && (objc_msgSend((id)v26[5], "performOrJournalWithProfile:error:", v15, a6) & 1) != 0)
  {
    objc_msgSend((id)v26[5], "createdWorkout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v25, 8);
  return v17;
}

BOOL __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  HDCreateWorkoutOperation *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  HDWorkoutBuilderStatisticsCalculators *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  _QWORD v50[4];
  HDWorkoutBuilderStatisticsCalculators *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55[2];

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 64), "workoutBuilderEntityWithIdentifier:profile:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "configurationWithTransaction:error:", v5, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    v55[0] = 0;
    objc_msgSend(v7, "metadataWithTransaction:error:", v5, v55);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v55[0];
    v11 = v10;
    if (!v9 && v10)
    {
      v12 = v10;
      v13 = v12;
      if (a3)
      {
        v14 = 0;
        *a3 = objc_retainAutorelease(v12);
      }
      else
      {
        _HKLogDroppedError();
        v14 = 0;
      }
      goto LABEL_38;
    }
    v48 = v10;
    v49 = v9;
    objc_msgSend(v8, "deviceEntity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 40), "deviceManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "deviceEntity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithLongLong:", objc_msgSend(v18, "persistentID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deviceForPersistentID:error:", v19, a3);
      v20 = objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v14 = 0;
        v11 = v48;
        v9 = v49;
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      v20 = 0;
    }
    v47 = (void *)v20;
    objc_msgSend(*(id *)(a1 + 40), "sourceManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "sourceEntity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithLongLong:", objc_msgSend(v23, "persistentID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v21, "clientSourceForPersistentID:error:", v24, &v54);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v54;

    v27 = v25;
    if (v25)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v29 = MEMORY[0x1E0C809B0];
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke_2;
      v52[3] = &unk_1E6D029E8;
      v30 = v28;
      v53 = v30;
      if (+[HDWorkoutBuilderAssociatedSeriesEntity enumerateSeriesForBuilder:transaction:error:block:](HDWorkoutBuilderAssociatedSeriesEntity, "enumerateSeriesForBuilder:transaction:error:block:", v7, v5, a3, v52))
      {
        objc_msgSend(v7, "workoutEventsInTransaction:error:", v5, a3);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend(v7, "workoutActivitiesInTransaction:error:", v5, a3);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            v50[0] = v29;
            v50[1] = 3221225472;
            v50[2] = __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke_3;
            v50[3] = &unk_1E6D02A10;
            v44 = objc_alloc_init(HDWorkoutBuilderStatisticsCalculators);
            v51 = v44;
            if ((objc_msgSend(v7, "enumerateStatisticsInTransaction:error:block:", v5, a3, v50) & 1) != 0)
            {
              v25 = v27;
              objc_msgSend(v7, "quantityTypesIncludedWhilePausedInTransaction:error:", v5, a3);
              v31 = objc_claimAutoreleasedReturnValue();
              v14 = v31 != 0;
              v43 = (void *)v31;
              if (v31)
              {
                v32 = [HDCreateWorkoutOperation alloc];
                objc_msgSend(v8, "workoutConfiguration");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = *(_QWORD *)(a1 + 48);
                v40 = *(_QWORD *)(a1 + 32);
                objc_msgSend(v8, "sourceVersion");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v8, "goalType");
                objc_msgSend(v8, "goal");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = -[HDCreateWorkoutOperation initWithWorkoutConfiguration:identifier:dateInterval:metadata:device:source:sourceVersion:events:activities:statisticsCalculators:associatedSeries:goalType:goal:quantityTypesIncludedWhilePaused:](v32, "initWithWorkoutConfiguration:identifier:dateInterval:metadata:device:source:sourceVersion:events:activities:statisticsCalculators:associatedSeries:goalType:goal:quantityTypesIncludedWhilePaused:", v42, v40, v39, v49, v47, v25, v41, v46, v45, v44, v30, v33, v38, v43);
                v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                v36 = *(void **)(v35 + 40);
                *(_QWORD *)(v35 + 40) = v34;

              }
            }
            else
            {
              v25 = v27;
              v14 = 0;
            }

          }
          else
          {
            v25 = v27;
            v14 = 0;
          }

        }
        else
        {
          v25 = v27;
          v14 = 0;
        }

      }
      else
      {
        v25 = v27;
        v14 = 0;
      }

      goto LABEL_37;
    }
    if (v26)
    {
      v30 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 4, CFSTR("Could not find source for application"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        v26 = 0;
        v14 = 0;
LABEL_37:

        v11 = v48;
        v9 = v49;
        v13 = v47;
LABEL_38:

        goto LABEL_39;
      }
    }
    if (a3)
    {
      v30 = objc_retainAutorelease(v30);
      v14 = 0;
      *a3 = v30;
    }
    else
    {
      _HKLogDroppedError();
      v14 = 0;
    }
    v26 = v30;
    goto LABEL_37;
  }
  v14 = 0;
LABEL_41:

  return v14;
}

uint64_t __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

void __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v8 = a3;
  v9 = a5;
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "setCalculator:forQuantityType:activityUUID:", v9, v10, v8);

}

- (id)configurationWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("uuid"), CFSTR("workout_configuration"), CFSTR("source_id"), CFSTR("source_version"), CFSTR("device_id"), CFSTR("session"), CFSTR("goal_type"), CFSTR("goal"), CFSTR("should_collect_events"), v8, *MEMORY[0x1E0D29618]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__158;
  v20 = __Block_byref_object_dispose__158;
  v21 = 0;
  objc_msgSend(v6, "databaseForEntity:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = &v16;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__HDWorkoutBuilderEntity_configurationWithTransaction_error___block_invoke;
  v15[3] = &unk_1E6CEA6E8;
  v15[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HDWorkoutBuilderEntity_configurationWithTransaction_error___block_invoke_2;
  v14[3] = &unk_1E6CEA698;
  LODWORD(a4) = objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", v9, a4, v15, v14);

  if ((_DWORD)a4)
    v11 = (void *)v17[5];
  else
    v11 = 0;
  v12 = v11;
  _Block_object_dispose(&v16, 8);

  return v12;
}

uint64_t __61__HDWorkoutBuilderEntity_configurationWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __61__HDWorkoutBuilderEntity_configurationWithTransaction_error___block_invoke_2(uint64_t a1)
{
  HDWorkoutBuilderPersistedConfiguration *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  HDSourceEntity *v7;
  void *v8;
  HDDeviceEntity *v9;
  void *v10;

  v2 = objc_alloc_init(HDWorkoutBuilderPersistedConfiguration);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  HDSQLiteColumnWithNameAsUUID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setBuilderIdentifier:", v5);

  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setWorkoutConfiguration:", v6);

  v7 = -[HDSQLiteEntity initWithPersistentID:]([HDSourceEntity alloc], "initWithPersistentID:", HDSQLiteColumnWithNameAsInt64());
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setSourceEntity:", v7);

  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setSourceVersion:", v8);

  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    v9 = -[HDSQLiteEntity initWithPersistentID:]([HDDeviceEntity alloc], "initWithPersistentID:", HDSQLiteColumnWithNameAsInt64());
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDeviceEntity:", v9);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setGoalType:", HDSQLiteColumnWithNameAsInt64());
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setGoal:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setShouldCollectWorkoutEvents:", HDSQLiteColumnWithNameAsBoolean());
  return 1;
}

- (id)sessionIdentifierWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__158;
  v17 = __Block_byref_object_dispose__158;
  v18 = 0;
  v19[0] = CFSTR("session");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HDWorkoutBuilderEntity_sessionIdentifierWithTransaction_error___block_invoke;
  v12[3] = &unk_1E6CF7BB8;
  v12[4] = &v13;
  LODWORD(a4) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v7, v8, a4, v12);

  if ((_DWORD)a4)
    v9 = (void *)v14[5];
  else
    v9 = 0;
  v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __65__HDWorkoutBuilderEntity_sessionIdentifierWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsUUID();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setSessionIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16[0] = CFSTR("session");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HDWorkoutBuilderEntity_setSessionIdentifier_transaction_error___block_invoke;
  v14[3] = &unk_1E6CFD818;
  v12 = v8;
  v15 = v12;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v10, v11, a5, v14);

  return (char)a5;
}

void __65__HDWorkoutBuilderEntity_setSessionIdentifier_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB168);
}

- (id)startDateInTransaction:(id)a3 error:(id *)a4
{
  -[HDHealthEntity dateForProperty:transaction:error:](self, "dateForProperty:transaction:error:", CFSTR("start_date"), a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)setStartDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setDate:forProperty:transaction:error:](self, "setDate:forProperty:transaction:error:", a3, CFSTR("start_date"), a4, a5);
}

- (id)endDateInTransaction:(id)a3 error:(id *)a4
{
  -[HDHealthEntity dateForProperty:transaction:error:](self, "dateForProperty:transaction:error:", CFSTR("end_date"), a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)setEndDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setDate:forProperty:transaction:error:](self, "setDate:forProperty:transaction:error:", a3, CFSTR("end_date"), a4, a5);
}

- (id)dataIntervalInTransaction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__158;
  v16 = __Block_byref_object_dispose__158;
  v17 = 0;
  v18[0] = CFSTR("data_interval");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HDWorkoutBuilderEntity_dataIntervalInTransaction_error___block_invoke;
  v11[3] = &unk_1E6CF7BB8;
  v11[4] = &v12;
  LODWORD(self) = -[HDSQLiteEntity getValuesForProperties:database:handler:](self, "getValuesForProperties:database:handler:", v6, v7, v11);

  if ((_DWORD)self)
    v8 = (void *)v13[5];
  else
    v8 = 0;
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __58__HDWorkoutBuilderEntity_dataIntervalInTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setDataInterval:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16[0] = CFSTR("data_interval");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__HDWorkoutBuilderEntity_setDataInterval_transaction_error___block_invoke;
  v14[3] = &unk_1E6CFD818;
  v12 = v8;
  v15 = v12;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v10, v11, a5, v14);

  return (char)a5;
}

uint64_t __60__HDWorkoutBuilderEntity_setDataInterval_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (id)quantityTypesIncludedWhilePausedInTransaction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__158;
  v16 = __Block_byref_object_dispose__158;
  v17 = 0;
  v18[0] = CFSTR("types_while_paused");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__HDWorkoutBuilderEntity_quantityTypesIncludedWhilePausedInTransaction_error___block_invoke;
  v11[3] = &unk_1E6CF7BB8;
  v11[4] = &v12;
  LODWORD(self) = -[HDSQLiteEntity getValuesForProperties:database:handler:](self, "getValuesForProperties:database:handler:", v6, v7, v11);

  if ((_DWORD)self)
    v8 = (void *)v13[5];
  else
    v8 = 0;
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __78__HDWorkoutBuilderEntity_quantityTypesIncludedWhilePausedInTransaction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsObjectWithClasses();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v8 + 40))
    *(_QWORD *)(v8 + 40) = MEMORY[0x1E0C9AA60];
}

- (BOOL)setQuantityTypesIncludedWhilePaused:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16[0] = CFSTR("types_while_paused");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__HDWorkoutBuilderEntity_setQuantityTypesIncludedWhilePaused_transaction_error___block_invoke;
  v14[3] = &unk_1E6CFD818;
  v12 = v8;
  v15 = v12;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v10, v11, a5, v14);

  return (char)a5;
}

uint64_t __80__HDWorkoutBuilderEntity_setQuantityTypesIncludedWhilePaused_transaction_error___block_invoke(uint64_t a1)
{
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    JUMPOUT(0x1BCCAB120);
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (BOOL)setMetadata:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16[0] = CFSTR("metadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntity:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__HDWorkoutBuilderEntity_setMetadata_transaction_error___block_invoke;
  v14[3] = &unk_1E6CFD818;
  v12 = v8;
  v15 = v12;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v10, v11, a5, v14);

  return (char)a5;
}

void __56__HDWorkoutBuilderEntity_setMetadata_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    JUMPOUT(0x1BCCAB120);
  objc_msgSend(*(id *)(a1 + 32), "hk_codableMetadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0D8](a2, CFSTR("metadata"), v4);

}

- (id)metadataWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?"), CFSTR("metadata"), v8, *MEMORY[0x1E0D29618]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__158;
  v20 = __Block_byref_object_dispose__158;
  v21 = 0;
  objc_msgSend(v6, "databaseForEntity:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = &v16;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__HDWorkoutBuilderEntity_metadataWithTransaction_error___block_invoke;
  v15[3] = &unk_1E6CEA6E8;
  v15[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__HDWorkoutBuilderEntity_metadataWithTransaction_error___block_invoke_2;
  v14[3] = &unk_1E6CEA698;
  if (objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", v9, a4, v15, v14))
  {
    v11 = (void *)v17[5];
    if (!v11)
      v11 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  _Block_object_dispose(&v16, 8);
  return v12;
}

uint64_t __56__HDWorkoutBuilderEntity_metadataWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __56__HDWorkoutBuilderEntity_metadataWithTransaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  MEMORY[0x1BCCAB18C](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  return 1;
}

- (BOOL)setDeviceEntity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16[0] = CFSTR("device_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntity:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__HDWorkoutBuilderEntity_setDeviceEntity_transaction_error___block_invoke;
  v14[3] = &unk_1E6CFD818;
  v12 = v8;
  v15 = v12;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v10, v11, a5, v14);

  return (char)a5;
}

void __60__HDWorkoutBuilderEntity_setDeviceEntity_transaction_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "persistentID");
  JUMPOUT(0x1BCCAB114);
}

- (BOOL)setWorkoutConfiguration:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16[0] = CFSTR("workout_configuration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntity:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HDWorkoutBuilderEntity_setWorkoutConfiguration_transaction_error___block_invoke;
  v14[3] = &unk_1E6CFD818;
  v12 = v8;
  v15 = v12;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v10, v11, a5, v14);

  return (char)a5;
}

uint64_t __68__HDWorkoutBuilderEntity_setWorkoutConfiguration_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (int64_t)associateObject:(id)a3 timestamp:(double)a4 transaction:(id)a5 error:(id *)a6
{
  return +[HDWorkoutBuilderAssociatedObjectEntity associateObject:timestamp:withBuilder:transaction:error:](HDWorkoutBuilderAssociatedObjectEntity, "associateObject:timestamp:withBuilder:transaction:error:", a3, self, a5, a6, a4);
}

- (BOOL)enumerateAssociatedUUIDsWithTransaction:(id)a3 error:(id *)a4 block:(id)a5
{
  return +[HDWorkoutBuilderAssociatedObjectEntity enumerateAssociatedUUIDsForBuilder:transaction:error:block:](HDWorkoutBuilderAssociatedObjectEntity, "enumerateAssociatedUUIDsForBuilder:transaction:error:block:", self, a3, a4, a5);
}

- (BOOL)enumerateAssociatedSampleValuesOfType:(id)a3 interval:(id)a4 profile:(id)a5 error:(id *)a6 sampleHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__HDWorkoutBuilderEntity_enumerateAssociatedSampleValuesOfType_interval_profile_error_sampleHandler___block_invoke;
  v20[3] = &unk_1E6D02A88;
  v17 = v15;
  v21 = v17;
  v18 = -[HDWorkoutBuilderEntity _setupForEnumerationOfTypes:interval:profile:error:handler:]((uint64_t)self, v16, v13, v14, (uint64_t)a6, v20);

  return v18;
}

BOOL __101__HDWorkoutBuilderEntity_enumerateAssociatedSampleValuesOfType_interval_profile_error_sampleHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL8 v8;
  _QWORD v10[4];
  id v11;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__HDWorkoutBuilderEntity_enumerateAssociatedSampleValuesOfType_interval_profile_error_sampleHandler___block_invoke_2;
  v10[3] = &unk_1E6D02A60;
  v11 = *(id *)(a1 + 32);
  v8 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:transaction:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesForPredicate:transaction:options:error:handler:", a3, a2, 5, a5, v10);

  return v8;
}

uint64_t __101__HDWorkoutBuilderEntity_enumerateAssociatedSampleValuesOfType_interval_profile_error_sampleHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_setupForEnumerationOfTypes:(void *)a3 interval:(void *)a4 profile:(uint64_t)a5 error:(void *)a6 handler:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _BOOL8 v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (a1)
  {
    objc_msgSend(v13, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__HDWorkoutBuilderEntity__setupForEnumerationOfTypes_interval_profile_error_handler___block_invoke;
    v18[3] = &unk_1E6D02B28;
    v18[4] = a1;
    v19 = v11;
    v20 = v12;
    v21 = v14;
    v16 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v15, a5, v18);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)enumerateAssociatedSamplesOfTypes:(id)a3 interval:(id)a4 profile:(id)a5 error:(id *)a6 sampleHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__HDWorkoutBuilderEntity_enumerateAssociatedSamplesOfTypes_interval_profile_error_sampleHandler___block_invoke;
  v19[3] = &unk_1E6D02AD8;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  LOBYTE(a6) = -[HDWorkoutBuilderEntity _setupForEnumerationOfTypes:interval:profile:error:handler:]((uint64_t)self, v17, a4, v16, (uint64_t)a6, v19);

  return (char)a6;
}

uint64_t __97__HDWorkoutBuilderEntity_enumerateAssociatedSamplesOfTypes_interval_profile_error_sampleHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[HDSampleEntity entityEnumeratorWithTypes:profile:error:](HDSampleEntity, "entityEnumeratorWithTypes:profile:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setPredicate:", v7);
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), objc_opt_class(), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOrderingTerms:", v11);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__HDWorkoutBuilderEntity_enumerateAssociatedSamplesOfTypes_interval_profile_error_sampleHandler___block_invoke_2;
    v14[3] = &unk_1E6D02AB0;
    v15 = *(id *)(a1 + 48);
    v12 = objc_msgSend(v9, "enumerateWithError:handler:", a5, v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __97__HDWorkoutBuilderEntity_enumerateAssociatedSamplesOfTypes_interval_profile_error_sampleHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__HDWorkoutBuilderEntity__createTemporaryProtectedAssociatedSampleListInTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__HDWorkoutBuilderEntity__createTemporaryProtectedAssociatedSampleListInTransaction_error___block_invoke_2;
  v10[3] = &unk_1E6CEA6E8;
  v11 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "performStatementWithError:bindingHandler:", a3, v10);

  return v8;
}

uint64_t __91__HDWorkoutBuilderEntity__createTemporaryProtectedAssociatedSampleListInTransaction_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

- (BOOL)_setupForEnumerationOfTypes:(void *)a3 interval:(void *)a4 transaction:(_QWORD *)a5 error:(void *)a6 handler:
{
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  HDWorkoutBuilderAssociatedSamplePredicate *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t (*v41)(uint64_t, void *, uint64_t);
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  char v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  __int128 buf;
  uint64_t (*v80)(uint64_t, void *, uint64_t);
  void *v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v68 = a2;
  v69 = a3;
  v11 = a4;
  v67 = a6;
  v71 = v11;
  if (a1)
  {
    objc_msgSend(v11, "protectedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPermitWritesInReadTransaction:", 1);

    v13 = v11;
    objc_msgSend(v13, "databaseForEntityClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E6D11BB8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), objc_opt_class(), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TEMPORARY TABLE %@ (%@ BLOB NOT NULL)"), v18, CFSTR("uuid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v19, a5, 0, 0);

    if ((v20 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ (%@) VALUES (?)"), v18, CFSTR("uuid"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D298B8]), "initWithSQL:database:", v21, v14);
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v80 = __91__HDWorkoutBuilderEntity__createTemporaryProtectedAssociatedSampleListInTransaction_error___block_invoke;
      v81 = &unk_1E6D029E8;
      v23 = v22;
      v82 = v23;
      if (+[HDWorkoutBuilderAssociatedObjectEntity enumerateAssociatedUUIDsForBuilder:transaction:error:block:](HDWorkoutBuilderAssociatedObjectEntity, "enumerateAssociatedUUIDsForBuilder:transaction:error:block:", a1, v13, a5, &buf))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX %@_idx ON %@ (%@)"), v18, v18, CFSTR("uuid"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v14, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v24, a5, 0, 0);

        if (v25)
          v26 = v18;
        else
          v26 = 0;
        v70 = v26;
      }
      else
      {
        v70 = 0;
      }

    }
    else
    {
      v70 = 0;
    }

    if (v70)
    {
      v27 = v68;
      v28 = v69;
      v66 = v70;
      v29 = v13;
      v64 = v27;
      if (v27)
      {
        HDSampleEntityPredicateForDataTypes(v27);
        v30 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      v65 = (void *)v30;
      v34 = objc_alloc_init(HDWorkoutBuilderAssociatedSamplePredicate);
      objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v30, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v28)
      {
        v78 = 0;
        objc_msgSend(a1, "dataIntervalInTransaction:error:", v29, &v78);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v78;
        v62 = v38;
        v63 = v37;
        if (v37)
        {
          objc_msgSend(v28, "endDate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          HDSampleEntityPredicateForStartDate(4);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "startDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          HDSampleEntityPredicateForEndDate(6);
          v41 = (uint64_t (*)(uint64_t, void *, uint64_t))objc_claimAutoreleasedReturnValue();

          objc_msgSend(v37, "startDate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          HDSampleEntityPredicateForStartDate(6);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = (void *)MEMORY[0x1E0D29840];
          *(_QWORD *)&buf = v43;
          *((_QWORD *)&buf + 1) = v61;
          v80 = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 3);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "predicateMatchingAllPredicates:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v36, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = v47;
          v48 = v36;
        }
        else if (v38)
        {
          v49 = v38;
          v50 = v49;
          if (a5)
            *a5 = objc_retainAutorelease(v49);
          else
            _HKLogDroppedError();

          v48 = 0;
        }
        else
        {
          v36 = v36;
          v48 = v36;
        }

      }
      else
      {
        v36 = v35;
        v48 = v36;
      }

      if (v48)
      {
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __89__HDWorkoutBuilderEntity__setupForEnumerationOfTypes_interval_transaction_error_handler___block_invoke;
        v73[3] = &unk_1E6D02B00;
        v77 = v67;
        v51 = v29;
        v74 = v51;
        v75 = v48;
        v52 = v66;
        v76 = v52;
        v33 = +[HDWorkoutBuilderAssociatedSampleTemporaryTableEntity withLocalTableName:error:block:](HDWorkoutBuilderAssociatedSampleTemporaryTableEntity, "withLocalTableName:error:block:", v52, a5, v73);
        objc_msgSend(v51, "databaseForEntityClass:", objc_opt_class());
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE %@"), v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 0;
        v55 = objc_msgSend(v53, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v54, &v72, 0, 0);
        v56 = v72;

        if ((v55 & 1) == 0)
        {
          _HKInitializeLogging();
          v57 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v56;
            _os_log_error_impl(&dword_1B7802000, v57, OS_LOG_TYPE_ERROR, "Failed to drop temporary table after sample enumeration: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        objc_msgSend(v51, "protectedDatabase");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setPermitWritesInReadTransaction:", 0);

      }
      else
      {
        objc_msgSend(v29, "protectedDatabase");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setPermitWritesInReadTransaction:", 0);

        v33 = 0;
      }

      v32 = v70;
    }
    else
    {
      objc_msgSend(v13, "protectedDatabase");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v31, "setPermitWritesInReadTransaction:", 0);

      v33 = 0;
    }

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

uint64_t __89__HDWorkoutBuilderEntity__setupForEnumerationOfTypes_interval_transaction_error_handler___block_invoke(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a2);
}

BOOL __85__HDWorkoutBuilderEntity__setupForEnumerationOfTypes_interval_profile_error_handler___block_invoke(void **a1, void *a2, _QWORD *a3)
{
  return -[HDWorkoutBuilderEntity _setupForEnumerationOfTypes:interval:transaction:error:handler:](a1[4], a1[5], a1[6], a2, a3, a1[7]);
}

- (BOOL)pruneAssociatedSamplesToDateInterval:(id)a3 transaction:(id)a4 error:(id *)a5 zonesHandler:(id)a6
{
  unint64_t v6;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint8x8_t v29;
  _QWORD *v30;
  _QWORD *j;
  unint64_t v32;
  _QWORD *v33;
  float v34;
  _BOOL8 v35;
  unint64_t v36;
  unint64_t v37;
  size_t v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  BOOL v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  id v56;
  void **v57;
  void **v58;
  void *v59;
  void *v61;
  id *v62;
  HDWorkoutBuilderEntity *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  _QWORD v68[5];
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE v73[40];
  void *__p[3];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  void *v79;
  _BYTE *v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  float v88;
  _QWORD v89[4];
  void **v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v11 = a4;
  v12 = a6;
  v66 = v11;
  objc_msgSend(v11, "protectedDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("A protected data transaction is required."));
    v42 = 0;
    goto LABEL_74;
  }
  v65 = v12;
  objc_msgSend(v67, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;

  objc_msgSend(v67, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  v19 = v18;

  -[HDWorkoutBuilderEntity workoutEventsInTransaction:error:](self, "workoutEventsInTransaction:error:", v11, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v42 = 0;
    goto LABEL_73;
  }
  v64 = v20;
  -[HDWorkoutBuilderEntity quantityTypesIncludedWhilePausedInTransaction:error:](self, "quantityTypesIncludedWhilePausedInTransaction:error:", v11, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v42 = 0;
    goto LABEL_72;
  }
  v62 = a5;
  v63 = self;
  v86 = 0u;
  v87 = 0u;
  v88 = 1.0;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v61 = v21;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
  if (!v23)
    goto LABEL_49;
  v24 = *(_QWORD *)v83;
  do
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v83 != v24)
        objc_enumerationMutation(v22);
      v26 = objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "code", v61);
      v27 = v26;
      v28 = *((_QWORD *)&v86 + 1);
      if (*((_QWORD *)&v86 + 1))
      {
        v29 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v86 + 8));
        v29.i16[0] = vaddlv_u8(v29);
        if (v29.u32[0] > 1uLL)
        {
          v6 = v26;
          if (*((_QWORD *)&v86 + 1) <= v26)
            v6 = v26 % *((_QWORD *)&v86 + 1);
        }
        else
        {
          v6 = (*((_QWORD *)&v86 + 1) - 1) & v26;
        }
        v30 = *(_QWORD **)(v86 + 8 * v6);
        if (v30)
        {
          for (j = (_QWORD *)*v30; j; j = (_QWORD *)*j)
          {
            v32 = j[1];
            if (v32 == v26)
            {
              if (j[2] == v26)
                goto LABEL_47;
            }
            else
            {
              if (v29.u32[0] > 1uLL)
              {
                if (v32 >= *((_QWORD *)&v86 + 1))
                  v32 %= *((_QWORD *)&v86 + 1);
              }
              else
              {
                v32 &= *((_QWORD *)&v86 + 1) - 1;
              }
              if (v32 != v6)
                break;
            }
          }
        }
      }
      v33 = operator new(0x18uLL);
      *v33 = 0;
      v33[1] = v27;
      v33[2] = v27;
      v34 = (float)(unint64_t)(*((_QWORD *)&v87 + 1) + 1);
      if (!v28 || (float)(v88 * (float)v28) < v34)
      {
        v35 = (v28 & (v28 - 1)) != 0;
        if (v28 < 3)
          v35 = 1;
        v36 = v35 | (2 * v28);
        v37 = vcvtps_u32_f32(v34 / v88);
        if (v36 <= v37)
          v38 = v37;
        else
          v38 = v36;
        std::__hash_table<_HKDataTypeCode,std::hash<_HKDataTypeCode>,std::equal_to<_HKDataTypeCode>,std::allocator<_HKDataTypeCode>>::__rehash<true>((uint64_t)&v86, v38);
        v28 = *((_QWORD *)&v86 + 1);
        if ((*((_QWORD *)&v86 + 1) & (*((_QWORD *)&v86 + 1) - 1)) != 0)
        {
          if (*((_QWORD *)&v86 + 1) <= v27)
            v6 = v27 % *((_QWORD *)&v86 + 1);
          else
            v6 = v27;
        }
        else
        {
          v6 = (*((_QWORD *)&v86 + 1) - 1) & v27;
        }
      }
      v39 = v86;
      v40 = *(_QWORD **)(v86 + 8 * v6);
      if (v40)
      {
        *v33 = *v40;
LABEL_45:
        *v40 = v33;
        goto LABEL_46;
      }
      *v33 = v87;
      *(_QWORD *)&v87 = v33;
      *(_QWORD *)(v39 + 8 * v6) = &v87;
      if (*v33)
      {
        v41 = *(_QWORD *)(*v33 + 8);
        if ((v28 & (v28 - 1)) != 0)
        {
          if (v41 >= v28)
            v41 %= v28;
        }
        else
        {
          v41 &= v28 - 1;
        }
        v40 = (_QWORD *)(v86 + 8 * v41);
        goto LABEL_45;
      }
LABEL_46:
      ++*((_QWORD *)&v87 + 1);
LABEL_47:
      ;
    }
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
  }
  while (v23);
LABEL_49:

  v42 = (char)v63;
  _HKPausedIntervalsWithWorkoutEvents();
  v79 = 0;
  v80 = 0;
  v81 = 0;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v76;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v76 != v45)
          objc_enumerationMutation(v43);
        v47 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
        objc_msgSend(v47, "startDate", v61);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "timeIntervalSinceReferenceDate");
        v50 = v49;
        objc_msgSend(v47, "endDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "timeIntervalSinceReferenceDate");
        if (v52 >= v50)
          v53 = v50;
        else
          v53 = v52;
        if (v50 >= v52)
          v54 = v50;
        else
          v54 = v52;
        HKIntervalMask<double>::_insertInterval((uint64_t *)&v79, v53, v54);

      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
    }
    while (v44);
  }

  v55 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3321888768;
  v68[2] = __94__HDWorkoutBuilderEntity_pruneAssociatedSamplesToDateInterval_transaction_error_zonesHandler___block_invoke;
  v68[3] = &unk_1E6D02B50;
  v70 = v65;
  v68[4] = v63;
  v69 = v66;
  v71 = v19;
  v72 = v16;
  std::unordered_set<_HKDataTypeCode>::unordered_set((uint64_t)v73, (uint64_t)&v86);
  memset(__p, 0, sizeof(__p));
  std::vector<HKRawInterval<double>>::__init_with_size[abi:ne180100]<HKRawInterval<double>*,HKRawInterval<double>*>(__p, v79, (uint64_t)v80, (v80 - (_BYTE *)v79) >> 4);
  v56 = v69;
  v57 = v68;
  v58 = v57;
  if (v63)
  {
    v89[0] = v55;
    v89[1] = 3221225472;
    v89[2] = __90__HDWorkoutBuilderEntity__enumerateAssociatedSamplePropertiesInTransaction_error_handler___block_invoke;
    v89[3] = &unk_1E6D02A88;
    v90 = v57;
    v42 = -[HDWorkoutBuilderEntity _setupForEnumerationOfTypes:interval:transaction:error:handler:](v63, 0, 0, v56, v62, v89);

  }
  v59 = __p[0];
  if (__p[0])
  {
    v58[15] = __p[0];
    operator delete(v59);
  }
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v73);

  if (v79)
  {
    v80 = v79;
    operator delete(v79);
  }

  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&v86);
  v21 = v61;
LABEL_72:

  v20 = v64;
LABEL_73:

  v12 = v65;
LABEL_74:

  return v42;
}

BOOL __94__HDWorkoutBuilderEntity_pruneAssociatedSamplesToDateInterval_transaction_error_zonesHandler___block_invoke(uint64_t a1, unint64_t a2, void *a3, int a4, char a5, uint64_t a6, double a7, double a8)
{
  id v15;
  _BOOL8 v16;
  uint64_t v17;
  _BOOL4 v18;
  int8x8_t v19;
  uint8x8_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *i;
  unint64_t v24;
  double *j;

  v15 = a3;
  if ((a5 & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    if (a2 - 289 > 1)
    {
      v18 = *(double *)(a1 + 56) < a7 || *(double *)(a1 + 64) > a8;
      v19 = *(int8x8_t *)(a1 + 80);
      if (v19)
      {
        v20 = (uint8x8_t)vcnt_s8(v19);
        v20.i16[0] = vaddlv_u8(v20);
        if (v20.u32[0] > 1uLL)
        {
          v21 = a2;
          if (*(_QWORD *)&v19 <= a2)
            v21 = a2 % *(_QWORD *)&v19;
        }
        else
        {
          v21 = (*(_QWORD *)&v19 - 1) & a2;
        }
        v22 = *(_QWORD **)(*(_QWORD *)(a1 + 72) + 8 * v21);
        if (v22)
        {
          for (i = (_QWORD *)*v22; i; i = (_QWORD *)*i)
          {
            v24 = i[1];
            if (v24 == a2)
            {
              if (i[2] == a2)
                goto LABEL_35;
            }
            else
            {
              if (v20.u32[0] > 1uLL)
              {
                if (v24 >= *(_QWORD *)&v19)
                  v24 %= *(_QWORD *)&v19;
              }
              else
              {
                v24 &= *(_QWORD *)&v19 - 1;
              }
              if (v24 != v21)
                break;
            }
          }
        }
      }
      for (j = *(double **)(a1 + 112); j != *(double **)(a1 + 120) && *j <= a8; j += 2)
      {
        if (*j <= a7 && j[1] >= a8)
          goto LABEL_36;
      }
LABEL_35:
      if ((v18 | a4) != 1)
      {
        v16 = 1;
        goto LABEL_38;
      }
    }
    else
    {
      v17 = *(_QWORD *)(a1 + 48);
      if (v17)
        (*(void (**)(uint64_t, id))(v17 + 16))(v17, v15);
    }
LABEL_36:
    v16 = +[HDWorkoutBuilderAssociatedObjectEntity removeAssociationFromBuilder:toUUID:transaction:error:](HDWorkoutBuilderAssociatedObjectEntity, "removeAssociationFromBuilder:toUUID:transaction:error:", *(_QWORD *)(a1 + 32), v15, *(_QWORD *)(a1 + 40), a6);
  }
LABEL_38:

  return v16;
}

uint64_t __90__HDWorkoutBuilderEntity__enumerateAssociatedSamplePropertiesInTransaction_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;

  v8 = a2;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDQuantitySampleSeriesEntity, "disambiguatedDatabaseTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@ FROM %@ INNER JOIN %@ USING (%@) INNER JOIN %@ USING (%@) LEFT JOIN %@ USING (%@)"), CFSTR("uuid"), CFSTR("type"), CFSTR("data_type"), CFSTR("start_date"), CFSTR("end_date"), CFSTR("insertion_era"), v11, v12, CFSTR("data_id"), v9, CFSTR("uuid"), v13, CFSTR("data_id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "protectedDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__HDWorkoutBuilderEntity__enumerateAssociatedSamplePropertiesInTransaction_error_handler___block_invoke_2;
  v18[3] = &unk_1E6CEB010;
  v19 = *(id *)(a1 + 32);
  v16 = objc_msgSend(v15, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v14, a5, 0, v18);

  return v16;
}

uint64_t __90__HDWorkoutBuilderEntity__enumerateAssociatedSamplePropertiesInTransaction_error_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v3 = *(id *)(a1 + 32);
  v1 = HKWithAutoreleasePool();

  return v1;
}

uint64_t __90__HDWorkoutBuilderEntity__enumerateAssociatedSamplePropertiesInTransaction_error_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;

  MEMORY[0x1BCCAB1E0](*(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnAsInt64();
  HDSQLiteColumnAsInt64();
  v3 = MEMORY[0x1BCCAB1A4](*(_QWORD *)(a1 + 40), 3);
  v4 = MEMORY[0x1BCCAB1A4](*(_QWORD *)(a1 + 40), 4);
  MEMORY[0x1BCCAB204](*(_QWORD *)(a1 + 40), 5);
  v5 = (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(v3, v4);

  return v5;
}

- (BOOL)insertWorkoutEvent:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntity:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutEventEntity insertPersistableWorkoutEvent:ownerID:database:error:](HDWorkoutBuilderEventEntity, "insertPersistableWorkoutEvent:ownerID:database:error:", v8, v10, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12 != 0;
}

- (id)workoutEventsInTransaction:(id)a3 error:(id *)a4
{
  +[HDWorkoutBuilderEventEntity workoutEventsWithWorkoutBuilder:transaction:error:](HDWorkoutBuilderEventEntity, "workoutEventsWithWorkoutBuilder:transaction:error:", self, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)insertPrimaryWorkoutActivity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[HDWorkoutActivityEntity insertPrimaryActivity:ownerID:database:error:](HDWorkoutBuilderActivityEntity, "insertPrimaryActivity:ownerID:database:error:", v8, -[HDSQLiteEntity persistentID](self, "persistentID"), v10, a5);

  return (char)a5;
}

- (BOOL)insertWorkoutActivity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[HDWorkoutActivityEntity insertSubActivities:ownerID:database:error:](HDWorkoutBuilderActivityEntity, "insertSubActivities:ownerID:database:error:", v11, -[HDSQLiteEntity persistentID](self, "persistentID"), v10, a5);

  return (char)a5;
}

- (BOOL)updateWorkoutActivityEndDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  +[HDWorkoutActivityEntity activityEntityWithUUID:transaction:error:](HDWorkoutBuilderActivityEntity, "activityEntityWithUUID:transaction:error:", v9, v8, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;

  if (!v10)
  {
    if (v11)
    {
      v11 = v11;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v7, "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hk_error:format:", 118, CFSTR("Could not find activity with UUID %@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v18;
      if (!v11)
      {
        v14 = 1;
LABEL_12:

        goto LABEL_13;
      }
    }
    if (a5)
    {
      v11 = objc_retainAutorelease(v11);
      v14 = 0;
      *a5 = v11;
    }
    else
    {
      _HKLogDroppedError();
      v14 = 0;
    }
    goto LABEL_12;
  }
  objc_msgSend(v7, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "setEndDate:transaction:error:", v12, v8, a5);

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v7, "duration");
    v14 = objc_msgSend(v10, "setDuration:transaction:error:", v8, a5);
  }
  else
  {
    v14 = 0;
  }
LABEL_13:

  return v14;
}

- (BOOL)updateWorkoutActivityMetadata:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[HDWorkoutActivityEntity activityEntityWithUUID:transaction:error:](HDWorkoutBuilderActivityEntity, "activityEntityWithUUID:transaction:error:", v9, v8, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;

  if (v10)
  {
    objc_msgSend(v7, "metadata");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "setMetadata:transaction:error:", v12, v8, a5);
  }
  else
  {
    if (v11)
    {
      v12 = v11;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v7, "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hk_error:format:", 118, CFSTR("Could not find activity with UUID %@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v17;
      if (!v12)
      {
        v11 = 0;
        v13 = 1;
        goto LABEL_11;
      }
    }
    if (a5)
    {
      v12 = objc_retainAutorelease(v12);
      v13 = 0;
      *a5 = v12;
    }
    else
    {
      _HKLogDroppedError();
      v13 = 0;
    }
    v11 = v12;
  }
LABEL_11:

  return v13;
}

- (id)workoutActivitiesInTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(v6, "databaseForEntityClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutActivityEntity subActivitiesWithOwnerID:database:error:](HDWorkoutBuilderActivityEntity, "subActivitiesWithOwnerID:database:error:", -[HDSQLiteEntity persistentID](self, "persistentID"), v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)storeStatisticsCalculator:(id)a3 anchor:(id)a4 activityUUID:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20 = 0;
  +[HDWorkoutActivityEntity activityEntityWithUUID:transaction:error:](HDWorkoutBuilderActivityEntity, "activityEntityWithUUID:transaction:error:", v13, v14, &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  v17 = v16;
  if (!v15)
  {
    if (v16)
    {
      v17 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("Could not find activity with UUID %@"), v13);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v18 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    if (a7)
    {
      v17 = objc_retainAutorelease(v17);
      v18 = 0;
      *a7 = v17;
    }
    else
    {
      _HKLogDroppedError();
      v18 = 0;
    }
    goto LABEL_10;
  }
  v18 = +[HDStatisticsCalculatorEntity setCalculator:forOwner:anchor:transaction:error:](HDWorkoutBuilderStatisticsCalculatorEntity, "setCalculator:forOwner:anchor:transaction:error:", v11, v15, v12, v14, a7);
LABEL_11:

  return v18;
}

- (BOOL)enumerateStatisticsInTransaction:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = -[HDSQLiteEntity persistentID](self, "persistentID");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HDWorkoutBuilderEntity_enumerateStatisticsInTransaction_error_block___block_invoke;
  v14[3] = &unk_1E6D02BD8;
  v11 = v8;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  LOBYTE(a4) = +[HDWorkoutActivityEntity enumerateActivityEntitiesForOwnerID:transaction:error:enumerationHandler:](HDWorkoutBuilderActivityEntity, "enumerateActivityEntitiesForOwnerID:transaction:error:enumerationHandler:", v10, v11, a4, v14);

  return (char)a4;
}

BOOL __71__HDWorkoutBuilderEntity_enumerateStatisticsInTransaction_error_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  objc_msgSend(v5, "UUIDInTransaction:error:", *(_QWORD *)(a1 + 32), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__HDWorkoutBuilderEntity_enumerateStatisticsInTransaction_error_block___block_invoke_2;
    v10[3] = &unk_1E6D02BB0;
    v7 = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v11 = v6;
    v8 = +[HDStatisticsCalculatorEntity enumerateStatisticsForOwner:transaction:error:block:](HDWorkoutBuilderStatisticsCalculatorEntity, "enumerateStatisticsForOwner:transaction:error:block:", v5, v7, a3, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __71__HDWorkoutBuilderEntity_enumerateStatisticsInTransaction_error_block___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    objc_msgSend(v10, "currentStatistics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v9;
  }
  (*(void (**)(uint64_t, id, uint64_t, void *, id, id))(v13 + 16))(v13, v15, v12, v14, v10, v11);
  if (v10)

}

- (BOOL)setArchivedState:(id)a3 forDataSourceIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  HDWorkoutBuilderEntity *v19;

  v10 = a3;
  v11 = a4;
  objc_msgSend(a5, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__HDWorkoutBuilderEntity_setArchivedState_forDataSourceIdentifier_profile_error___block_invoke;
  v16[3] = &unk_1E6CF42F0;
  v13 = v11;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  v19 = self;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderDataSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v16);

  return (char)a6;
}

BOOL __81__HDWorkoutBuilderEntity_setArchivedState_forDataSourceIdentifier_profile_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return +[HDWorkoutBuilderDataSourceEntity storeDataSourceWithIdentifier:archivedState:workoutBuilder:transaction:error:](HDWorkoutBuilderDataSourceEntity, "storeDataSourceWithIdentifier:archivedState:workoutBuilder:transaction:error:", a1[4], a1[5], a1[6], a2, a3);
}

- (BOOL)removeDataSourceWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  HDWorkoutBuilderEntity *v14;

  v8 = a3;
  objc_msgSend(a4, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__HDWorkoutBuilderEntity_removeDataSourceWithIdentifier_profile_error___block_invoke;
  v12[3] = &unk_1E6CF4608;
  v10 = v8;
  v13 = v10;
  v14 = self;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderDataSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v9, a5, v12);

  return (char)a5;
}

BOOL __71__HDWorkoutBuilderEntity_removeDataSourceWithIdentifier_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDWorkoutBuilderDataSourceEntity removeDataSourceWithIdentifier:fromWorkoutBuilder:transaction:error:](HDWorkoutBuilderDataSourceEntity, "removeDataSourceWithIdentifier:fromWorkoutBuilder:transaction:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3);
}

- (BOOL)enumerateDataSourcesForProfile:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v8 = a5;
  objc_msgSend(a3, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__HDWorkoutBuilderEntity_enumerateDataSourcesForProfile_error_block___block_invoke;
  v12[3] = &unk_1E6D02C00;
  v12[4] = self;
  v10 = v8;
  v13 = v10;
  LOBYTE(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderDataSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v9, a4, v12);

  return (char)a4;
}

BOOL __69__HDWorkoutBuilderEntity_enumerateDataSourcesForProfile_error_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDWorkoutBuilderDataSourceEntity enumerateDataSourcesForWorkoutBuilder:transaction:error:block:](HDWorkoutBuilderDataSourceEntity, "enumerateDataSourcesForWorkoutBuilder:transaction:error:block:", *(_QWORD *)(a1 + 32), a2, a3, *(_QWORD *)(a1 + 40));
}

+ (id)databaseTable
{
  return CFSTR("workout_builders");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  unsigned __int8 v3;
  int v5;
  unint64_t *v6;

  if ((v3 & 1) == 0)
  {
    v6 = a3;
    a3 = v6;
    if (v5)
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_2, 0, &dword_1B7802000);
      a3 = v6;
    }
  }
  *a3 = 15;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)+[HDWorkoutBuilderEntity columnDefinitionsWithCount:]::columnDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("source_id");
  +[HDHealthEntity defaultForeignKey](HDSourceEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("device_id");
  v7[0] = v2;
  +[HDHealthEntity defaultForeignKey](HDDeviceEntity, "defaultForeignKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)privateSubEntities
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
