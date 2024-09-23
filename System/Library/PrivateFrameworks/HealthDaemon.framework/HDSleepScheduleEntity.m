@implementation HDSleepScheduleEntity

+ (id)databaseTable
{
  return CFSTR("sleep_schedule_samples");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_98;
}

+ (id)indices
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("monday");
  v7[1] = CFSTR("tuesday");
  v7[2] = CFSTR("wednesday");
  v7[3] = CFSTR("thursday");
  v7[4] = CFSTR("friday");
  v7[5] = CFSTR("saturday");
  v7[6] = CFSTR("sunday");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__HDSleepScheduleEntity_indices__block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v6[4] = a1;
  objc_msgSend(v3, "hk_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __32__HDSleepScheduleEntity_indices__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D29860];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *(_QWORD *)(a1 + 32);
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = 1"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithEntity:name:columns:unique:predicateString:", v6, v4, v7, 0, v8);

  return v9;
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
  _QWORD v27[14];

  v27[13] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a5;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSleepScheduleEntity.m"), 95, CFSTR("Subclasses must override %s"), "+[HDSleepScheduleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v27[0] = CFSTR("data_id");
  v27[1] = CFSTR("monday");
  v27[2] = CFSTR("tuesday");
  v27[3] = CFSTR("wednesday");
  v27[4] = CFSTR("thursday");
  v27[5] = CFSTR("friday");
  v27[6] = CFSTR("saturday");
  v27[7] = CFSTR("sunday");
  v27[8] = CFSTR("wake_hour");
  v27[9] = CFSTR("wake_minute");
  v27[10] = CFSTR("bed_hour");
  v27[11] = CFSTR("bed_minute");
  v27[12] = CFSTR("override_day_index");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __87__HDSleepScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v24[3] = &unk_1E6CE89A8;
  v25 = v12;
  v26 = v13;
  v17 = v13;
  v18 = v12;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v14, v16, a7, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v17;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

void __87__HDSleepScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = objc_msgSend(*(id *)(a1 + 32), "weekdays");
  MEMORY[0x1BCCAB114](a2, CFSTR("data_id"), objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
  MEMORY[0x1BCCAB0CC](a2, CFSTR("monday"), v4 & 1);
  MEMORY[0x1BCCAB0CC](a2, CFSTR("tuesday"), (v4 >> 1) & 1);
  MEMORY[0x1BCCAB0CC](a2, CFSTR("wednesday"), (v4 >> 2) & 1);
  MEMORY[0x1BCCAB0CC](a2, CFSTR("thursday"), (v4 >> 3) & 1);
  MEMORY[0x1BCCAB0CC](a2, CFSTR("friday"), (v4 >> 4) & 1);
  MEMORY[0x1BCCAB0CC](a2, CFSTR("saturday"), (v4 >> 5) & 1);
  MEMORY[0x1BCCAB0CC](a2, CFSTR("sunday"), (v4 >> 6) & 1);
  objc_msgSend(*(id *)(a1 + 32), "wakeTimeComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_hourNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB12C](a2, CFSTR("wake_hour"), v6);

  objc_msgSend(*(id *)(a1 + 32), "wakeTimeComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_minuteNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB12C](a2, CFSTR("wake_minute"), v8);

  objc_msgSend(*(id *)(a1 + 32), "bedTimeComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_hourNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB12C](a2, CFSTR("bed_hour"), v10);

  objc_msgSend(*(id *)(a1 + 32), "bedTimeComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_minuteNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB12C](a2, CFSTR("bed_minute"), v12);

  objc_msgSend(*(id *)(a1 + 32), "overrideDayIndex");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB12C](a2, CFSTR("override_day_index"), v13);

}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "sleepSchedules");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addSleepSchedules:", a3);
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDSleepScheduleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDSleepScheduleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)mostRecentSleepScheduleForWeekday:(unint64_t)a3 beforeDate:(id)a4 profile:(id)a5 encodingOptions:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v13 = a4;
  v14 = a6;
  v15 = a5;
  if ((HKSleepScheduleWeekdaysIsSingleDay() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSleepScheduleEntity.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HKSleepScheduleWeekdaysIsSingleDay(weekday)"));

  }
  if (v13)
    HDSleepScheduleEntityPredicateForWeekdayBeforeDate(a3, v13);
  else
    HDSleepScheduleEntityPredicateForWeekday(a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 198);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSampleEntity mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:](HDSleepScheduleEntity, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v17, v15, v14, v16, 0, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
