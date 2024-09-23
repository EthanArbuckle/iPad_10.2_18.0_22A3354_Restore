@implementation HDFitnessFriendAchievementEntity

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
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a5;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDFitnessFriendAchievementEntity.m"), 84, CFSTR("Subclasses must override %s"), "+[HDFitnessFriendAchievementEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v27[0] = CFSTR("data_id");
  v27[1] = CFSTR("friend_uuid");
  v27[2] = CFSTR("template_unique_name");
  v27[3] = CFSTR("completed_date");
  v27[4] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __98__HDFitnessFriendAchievementEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
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

void __98__HDFitnessFriendAchievementEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  MEMORY[0x1BCCAB114](a2, CFSTR("data_id"), objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(*(id *)(a1 + 40), "friendUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("friend_uuid"), v4);

  objc_msgSend(*(id *)(a1 + 40), "templateUniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("template_unique_name"), v5);

  objc_msgSend(*(id *)(a1 + 40), "completedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("completed_date"), v6);

  objc_msgSend(*(id *)(a1 + 40), "value");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB12C](a2, CFSTR("value"), v7);

}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return CFSTR("fitness_friend_achievements");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_60;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDFitnessFriendAchievementEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDFitnessFriendAchievementEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "fitnessFriendAchievements");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addFitnessFriendAchievements:", a3);
  return a3 != 0;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)enumerateAchievementsWithPredicate:(id)a3 anchor:(id *)a4 profile:(id)a5 error:(id *)a6 handler:(id)a7
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
  objc_msgSend(MEMORY[0x1E0CB6978], "fitnessFriendAchievementType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSampleEntity entityEnumeratorWithType:profile:](HDFitnessFriendAchievementEntity, "entityEnumeratorWithType:profile:", v17, v12);
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
  v26[2] = __100__HDFitnessFriendAchievementEntity_enumerateAchievementsWithPredicate_anchor_profile_error_handler___block_invoke;
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

uint64_t __100__HDFitnessFriendAchievementEntity_enumerateAchievementsWithPredicate_anchor_profile_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
