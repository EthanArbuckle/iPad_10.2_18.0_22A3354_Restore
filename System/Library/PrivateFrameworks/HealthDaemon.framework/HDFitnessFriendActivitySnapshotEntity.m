@implementation HDFitnessFriendActivitySnapshotEntity

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
  _QWORD v27[20];

  v27[19] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a5;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDFitnessFriendActivitySnapshotEntity.m"), 121, CFSTR("Subclasses must override %s"), "+[HDFitnessFriendActivitySnapshotEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v27[0] = CFSTR("data_id");
  v27[1] = CFSTR("friend_uuid");
  v27[2] = CFSTR("active_hours");
  v27[3] = CFSTR("active_hours_goal");
  v27[4] = CFSTR("brisk_minutes");
  v27[5] = CFSTR("brisk_minutes_goal");
  v27[6] = CFSTR("energy_burned");
  v27[7] = CFSTR("energy_burned_goal");
  v27[8] = CFSTR("move_minutes");
  v27[9] = CFSTR("move_minutes_goal");
  v27[10] = CFSTR("activity_move_mode");
  v27[11] = CFSTR("walk_run_distance");
  v27[12] = CFSTR("steps");
  v27[13] = CFSTR("snapshot_index");
  v27[14] = CFSTR("source_uuid");
  v27[15] = CFSTR("uploaded_date");
  v27[16] = CFSTR("vulcan_count");
  v27[17] = CFSTR("vulcan_condition");
  v27[18] = CFSTR("timezone_offset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __103__HDFitnessFriendActivitySnapshotEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
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

void __103__HDFitnessFriendActivitySnapshotEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  MEMORY[0x1BCCAB114](a2, CFSTR("data_id"), objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(*(id *)(a1 + 40), "friendUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("friend_uuid"), v4);

  objc_msgSend(*(id *)(a1 + 40), "activeHours");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("active_hours"));
  objc_msgSend(*(id *)(a1 + 40), "activeHoursGoal");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("active_hours_goal"));
  objc_msgSend(*(id *)(a1 + 40), "briskMinutes");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("brisk_minutes"));
  objc_msgSend(*(id *)(a1 + 40), "briskMinutesGoal");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("brisk_minutes_goal"));
  objc_msgSend(*(id *)(a1 + 40), "energyBurned");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("energy_burned"));
  objc_msgSend(*(id *)(a1 + 40), "energyBurnedGoal");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("energy_burned_goal"));
  objc_msgSend(*(id *)(a1 + 40), "mmv");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("move_minutes"));
  objc_msgSend(*(id *)(a1 + 40), "mmg");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("move_minutes_goal"));
  MEMORY[0x1BCCAB114](a2, CFSTR("activity_move_mode"), objc_msgSend(*(id *)(a1 + 40), "amm"));
  objc_msgSend(*(id *)(a1 + 40), "stepCount");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("steps"));
  objc_msgSend(*(id *)(a1 + 40), "walkingAndRunningDistance");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("walk_run_distance"));
  MEMORY[0x1BCCAB114](a2, CFSTR("snapshot_index"), objc_msgSend(*(id *)(a1 + 40), "snapshotIndex"));
  objc_msgSend(*(id *)(a1 + 40), "sourceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("source_uuid"), v5);

  objc_msgSend(*(id *)(a1 + 40), "snapshotUploadedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("uploaded_date"), v6);

  objc_msgSend(*(id *)(a1 + 40), "pushCount");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("vulcan_count"));
  MEMORY[0x1BCCAB114](a2, CFSTR("vulcan_condition"), objc_msgSend(*(id *)(a1 + 40), "wheelchairUse"));
  objc_msgSend(*(id *)(a1 + 40), "timeZoneOffsetFromUTCForNoon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    JUMPOUT(0x1BCCAB120);
  objc_msgSend(*(id *)(a1 + 40), "timeZoneOffsetFromUTCForNoon");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("timezone_offset"), objc_msgSend(v8, "integerValue"));

}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return CFSTR("fitness_friend_activity_snapshots");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 19;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_54;
}

+ (id)uniquedColumns
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("friend_uuid");
  v3[1] = CFSTR("snapshot_index");
  v3[2] = CFSTR("source_uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDFitnessFriendActivitySnapshotEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDFitnessFriendActivitySnapshotEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (BOOL)supportsObjectMerging
{
  return 1;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id, id *);
  void *v17;
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
  id v29;
  void *v30;
  id v32;
  _QWORD v34[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _QWORD v45[5];

  v45[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v32 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, id, id *))a8;
  objc_msgSend(v13, "friendUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HDFitnessFriendActivitySnapshotEntityPredicateForFriendUUID();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "snapshotIndex"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("snapshot_index"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v13, "sourceUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForUUID();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateWithProperty:equalToValue:", CFSTR("source_uuid"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0D29840];
  v45[0] = v18;
  v45[1] = v20;
  v45[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "predicateMatchingAllPredicates:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__107;
  v39 = __Block_byref_object_dispose__107;
  v40 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __108__HDFitnessFriendActivitySnapshotEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke;
  v34[3] = &unk_1E6CFA9A8;
  v34[4] = &v41;
  v34[5] = &v35;
  objc_msgSend(a1, "deleteSamplesWithPredicate:limit:generateDeletedObjects:transaction:profile:recursiveDeleteAuthorizationBlock:completionHandler:", v27, 0, 0, v15, v14, 0, v34);
  if (*((_BYTE *)v42 + 24))
  {
    v16[2](v16, v13, a7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = (id)v36[5];
    v30 = v29;
    if (v29)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v29);
      else
        _HKLogDroppedError();
    }

    v28 = 0;
  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v28;
}

void __108__HDFitnessFriendActivitySnapshotEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke(uint64_t a1, char a2, int a3, int a4, int a5, int a6, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "fitnessFriendActivitySnapshots");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addFitnessFriendActivitySnapshots:", a3);
  return a3 != 0;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)enumerateSnapshotsWithPredicate:(id)a3 anchor:(id *)a4 profile:(id)a5 error:(id *)a6 handler:(id)a7
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
  id v21;
  char v22;
  id *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a7;
  v24 = a6;
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
  +[HDDataEntity entityEnumeratorWithProfile:](HDFitnessFriendActivitySnapshotEntity, "entityEnumeratorWithProfile:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v11, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPredicate:", v18);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v31 = objc_msgSend(v14, "longLongValue");
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", v15, objc_opt_class(), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setOrderingTerms:", v20);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __102__HDFitnessFriendActivitySnapshotEntity_enumerateSnapshotsWithPredicate_anchor_profile_error_handler___block_invoke;
  v25[3] = &unk_1E6CFA980;
  v27 = &v28;
  v21 = v13;
  v26 = v21;
  v22 = objc_msgSend(v17, "enumerateWithError:handler:", v24, v25);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v29[3]);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v28, 8);
  return v22;
}

uint64_t __102__HDFitnessFriendActivitySnapshotEntity_enumerateSnapshotsWithPredicate_anchor_profile_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
