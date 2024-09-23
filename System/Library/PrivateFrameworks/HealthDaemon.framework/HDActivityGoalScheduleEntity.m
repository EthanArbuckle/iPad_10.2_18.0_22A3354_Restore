@implementation HDActivityGoalScheduleEntity

+ (id)databaseTable
{
  return CFSTR("activity_goal_schedule_samples");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 10;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_1;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data_id");
  +[HDDataEntity defaultForeignKey](HDSampleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  _QWORD v27[11];

  v27[10] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a5;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDActivityGoalScheduleEntity.m"), 65, CFSTR("Subclasses must override %s"), "+[HDActivityGoalScheduleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v27[0] = CFSTR("data_id");
  v27[1] = CFSTR("goal_type");
  v27[2] = CFSTR("unit_string");
  v27[3] = CFSTR("monday_goal");
  v27[4] = CFSTR("tuesday_goal");
  v27[5] = CFSTR("wednesday_goal");
  v27[6] = CFSTR("thursday_goal");
  v27[7] = CFSTR("friday_goal");
  v27[8] = CFSTR("saturday_goal");
  v27[9] = CFSTR("sunday_goal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __94__HDActivityGoalScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
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

void __94__HDActivityGoalScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
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
  id v13;

  MEMORY[0x1BCCAB114](a2, CFSTR("data_id"), objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  MEMORY[0x1BCCAB114](a2, CFSTR("goal_type"), objc_msgSend(*(id *)(a1 + 40), "goalType"));
  objc_msgSend(*(id *)(a1 + 40), "mondayGoal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_unit");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "unitString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("unit_string"), v5);

  objc_msgSend(*(id *)(a1 + 40), "mondayGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v13);
  MEMORY[0x1BCCAB0F0](a2, CFSTR("monday_goal"));

  objc_msgSend(*(id *)(a1 + 40), "tuesdayGoal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v13);
  MEMORY[0x1BCCAB0F0](a2, CFSTR("tuesday_goal"));

  objc_msgSend(*(id *)(a1 + 40), "wednesdayGoal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v13);
  MEMORY[0x1BCCAB0F0](a2, CFSTR("wednesday_goal"));

  objc_msgSend(*(id *)(a1 + 40), "thursdayGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v13);
  MEMORY[0x1BCCAB0F0](a2, CFSTR("thursday_goal"));

  objc_msgSend(*(id *)(a1 + 40), "fridayGoal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValueForUnit:", v13);
  MEMORY[0x1BCCAB0F0](a2, CFSTR("friday_goal"));

  objc_msgSend(*(id *)(a1 + 40), "saturdayGoal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v13);
  MEMORY[0x1BCCAB0F0](a2, CFSTR("saturday_goal"));

  objc_msgSend(*(id *)(a1 + 40), "sundayGoal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValueForUnit:", v13);
  MEMORY[0x1BCCAB0F0](a2, CFSTR("sunday_goal"));

}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "activityGoalSchedules");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addActivityGoalSchedules:", a3);
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDActivityGoalScheduleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDActivityGoalScheduleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

@end
