@implementation EKFrozenReminderRecurrenceRule

- (EKFrozenReminderRecurrenceRule)initWithREMObject:(id)a3 inStore:(id)a4
{
  return -[EKFrozenReminderRecurrenceRule initWithREMObject:inStore:withChanges:](self, "initWithREMObject:inStore:withChanges:", a3, a4, 0);
}

- (EKFrozenReminderRecurrenceRule)initWithREMObject:(id)a3 inStore:(id)a4 withChanges:(id)a5
{
  id v8;
  id v9;
  EKChangeSet *v10;
  EKChangeSet *v11;
  void *v12;
  void *v13;
  void *v14;
  EKFrozenReminderRecurrenceRule *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = (EKChangeSet *)a5;
  v11 = v10;
  if (!v8)
  {
    if (!v10)
    {
      v11 = objc_alloc_init(EKChangeSet);
      -[EKChangeSet setSkipsPersistentObjectCopy:](v11, "setSkipsPersistentObjectCopy:", 1);
    }
    -[EKChangeSet valueForSingleValueKey:basedOn:](v11, "valueForSingleValueKey:basedOn:", CFSTR("uniqueIdentifier"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKChangeSet changeSingleValue:forKey:basedOn:](v11, "changeSingleValue:forKey:basedOn:", v14, CFSTR("uniqueIdentifier"), 0);

    }
  }
  v17.receiver = self;
  v17.super_class = (Class)EKFrozenReminderRecurrenceRule;
  v15 = -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:](&v17, sel_initWithREMObject_inStore_withChanges_, v8, v9, v11);

  return v15;
}

- (EKFrozenReminderRecurrenceRule)initWithAlternateUniverseObject:(id)a3 inEventStore:(id)a4 withUpdatedChildObjects:(id)a5
{
  id v7;
  id v8;
  EKChangeSet *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  EKFrozenReminderRecurrenceRule *v18;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(EKChangeSet);
  -[EKChangeSet setSkipsPersistentObjectCopy:](v9, "setSkipsPersistentObjectCopy:", 1);
  objc_msgSend(v7, "valueForKey:", CFSTR("uniqueIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v10, CFSTR("uniqueIdentifier"), 0);
  objc_msgSend(v7, "valueForKey:", CFSTR("endDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v11, CFSTR("endDate"), 0);

  objc_msgSend(v7, "valueForKey:", CFSTR("count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v12, CFSTR("count"), 0);

  objc_msgSend(v7, "valueForKey:", CFSTR("frequencyRaw"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v13, CFSTR("frequencyRaw"), 0);

  objc_msgSend(v7, "valueForKey:", CFSTR("interval"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v14, CFSTR("interval"), 0);

  objc_msgSend(v7, "valueForKey:", CFSTR("firstDayOfTheWeekRaw"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v15, CFSTR("firstDayOfTheWeekRaw"), 0);

  objc_msgSend(v7, "valueForKey:", CFSTR("specifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v16, CFSTR("specifier"), 0);

  objc_msgSend(v8, "reminderStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[EKFrozenReminderRecurrenceRule initWithREMObject:inStore:withChanges:](self, "initWithREMObject:inStore:withChanges:", 0, v17, v9);
  return v18;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  id v16;

  -[EKFrozenReminderObject path](self, "path", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._reminderStore);
    objc_msgSend(WeakRetained, "remStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    objc_msgSend(v9, "fetchReminderWithObjectID:error:", v7, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    v12 = v10 != 0;
    if (!v10)
    {
      +[EKReminderStore log](EKReminderStore, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[EKFrozenReminderRecurrenceRule _applyChangesToSaveRequest:error:].cold.2();

      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 5);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    +[EKReminderStore log](EKReminderStore, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[EKFrozenReminderRecurrenceRule _applyChangesToSaveRequest:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 5);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)uniqueIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__EKFrozenReminderRecurrenceRule_uniqueIdentifier__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("uniqueIdentifier"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __50__EKFrozenReminderRecurrenceRule_uniqueIdentifier__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "remObjectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)remObjectID
{
  void *v3;
  void *v4;
  void *v5;

  -[EKFrozenReminderRecurrenceRule _recurrenceRule](self, "_recurrenceRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKFrozenReminderRecurrenceRule _recurrenceRule](self, "_recurrenceRule");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_recurrenceRule
{
  return self->super._remObject;
}

- (id)addUpdatedRecurrenceRule:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  int64_t v19;
  id v20;
  int64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28[2];

  v4 = a3;
  v21 = +[EKFrozenReminderRecurrenceRule convertToReminderKitFrequency:](EKFrozenReminderRecurrenceRule, "convertToReminderKitFrequency:", -[EKFrozenReminderRecurrenceRule frequencyRaw](self, "frequencyRaw"));
  v19 = -[EKFrozenReminderRecurrenceRule interval](self, "interval");
  v18 = objc_msgSend((id)objc_opt_class(), "convertToReminderKitWeekday:", -[EKFrozenReminderRecurrenceRule firstDayOfTheWeekRaw](self, "firstDayOfTheWeekRaw"));
  v27 = 0;
  v28[0] = 0;
  v25 = 0;
  v26 = 0;
  v23 = 0;
  v24 = 0;
  -[EKFrozenReminderRecurrenceRule loadSpecifierDaysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:](self, "loadSpecifierDaysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:", v28, &v27, &v26, &v25, &v24, &v23);
  v20 = v28[0];
  v22 = v27;
  v5 = v26;
  v6 = v25;
  v7 = v24;
  v17 = v23;
  v8 = -[EKFrozenReminderRecurrenceRule count](self, "count");
  if (v8)
  {
    objc_msgSend(getREMRecurrenceEndClass(), "recurrenceEndWithOccurrenceCount:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKFrozenReminderRecurrenceRule endDate](self, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(getREMRecurrenceEndClass(), "recurrenceEndWithEndDate:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  v11 = (void *)objc_msgSend(getREMRecurrenceRuleClass(), "newObjectID");
  v12 = objc_alloc((Class)getREMRecurrenceRuleClass());
  objc_msgSend(v4, "accountID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v11, v13, v14, v21, v19, v18, v20, v22, v5, v6, v7, v17, v9);

  objc_msgSend(v4, "addRecurrenceRule:", v15);
  return v15;
}

- (id)endDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__EKFrozenReminderRecurrenceRule_endDate__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("endDate"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __41__EKFrozenReminderRecurrenceRule_endDate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_recurrenceRule");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "recurrenceEnd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__EKFrozenReminderRecurrenceRule_count__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("count"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

id __39__EKFrozenReminderRecurrenceRule_count__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_recurrenceRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recurrenceEnd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithUnsignedInteger:", objc_msgSend(v3, "occurrenceCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)frequencyRaw
{
  void *v2;
  int v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__EKFrozenReminderRecurrenceRule_frequencyRaw__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("frequencyRaw"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

id __46__EKFrozenReminderRecurrenceRule_frequencyRaw__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_recurrenceRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithUnsignedInt:", +[EKFrozenReminderRecurrenceRule convertFromReminderKitFrequency:](EKFrozenReminderRecurrenceRule, "convertFromReminderKitFrequency:", objc_msgSend(v2, "frequency")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int)convertFromReminderKitFrequency:(int64_t)a3
{
  NSObject *v4;

  if ((unint64_t)a3 < 5)
    return dword_1A244A4B0[a3];
  +[EKReminderStore log](EKReminderStore, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[EKFrozenReminderRecurrenceRule convertFromReminderKitFrequency:].cold.1();

  return 1;
}

+ (int64_t)convertToReminderKitFrequency:(int)a3
{
  int64_t result;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = (a3 - 1);
  if (result >= 4)
  {
    v4 = *(_QWORD *)&a3;
    +[EKReminderStore log](EKReminderStore, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[EKFrozenReminderRecurrenceRule convertToReminderKitFrequency:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    return 0;
  }
  return result;
}

- (int64_t)interval
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__EKFrozenReminderRecurrenceRule_interval__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("interval"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

id __42__EKFrozenReminderRecurrenceRule_interval__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_recurrenceRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithInteger:", objc_msgSend(v2, "interval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)firstDayOfTheWeekRaw
{
  void *v2;
  int v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__EKFrozenReminderRecurrenceRule_firstDayOfTheWeekRaw__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("firstDayOfTheWeekRaw"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

id __54__EKFrozenReminderRecurrenceRule_firstDayOfTheWeekRaw__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_recurrenceRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithUnsignedInt:", +[EKFrozenReminderRecurrenceRule convertFromReminderKitWeekday:](EKFrozenReminderRecurrenceRule, "convertFromReminderKitWeekday:", objc_msgSend(v2, "firstDayOfTheWeek")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int)convertFromReminderKitWeekday:(int64_t)a3
{
  NSObject *v4;

  if ((unint64_t)a3 < 8)
    return dword_1A244A4C4[a3];
  +[EKReminderStore log](EKReminderStore, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[EKFrozenReminderRecurrenceRule convertFromReminderKitWeekday:].cold.1();

  return 7;
}

+ (int64_t)convertToReminderKitWeekday:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  if (a3 < 8)
    return qword_1A244A4E8[a3];
  +[EKReminderStore log](EKReminderStore, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[EKFrozenReminderRecurrenceRule convertToReminderKitWeekday:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);

  return 0;
}

- (int64_t)ekWeekdayToREMWeekday:(int64_t)a3
{
  return a3;
}

- (int64_t)remWeekdayToEKWeekday:(int64_t)a3
{
  return a3;
}

- (id)daysOfTheWeekFromREMRecurrenceRule
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  EKRecurrenceDayOfWeek *v12;
  EKRecurrenceDayOfWeek *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[EKFrozenReminderRecurrenceRule _recurrenceRule](self, "_recurrenceRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daysOfTheWeek");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [EKRecurrenceDayOfWeek alloc];
        v13 = -[EKRecurrenceDayOfWeek initWithDayOfTheWeek:weekNumber:](v12, "initWithDayOfTheWeek:weekNumber:", -[EKFrozenReminderRecurrenceRule remWeekdayToEKWeekday:](self, "remWeekdayToEKWeekday:", objc_msgSend(v11, "dayOfTheWeek", (_QWORD)v15)), objc_msgSend(v11, "weekNumber"));
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)remDaysOfTheWeekFromEKDaysOfTheWeek:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v20 = 0;
        v21 = &v20;
        v22 = 0x2050000000;
        v10 = (void *)getREMRecurrenceDayOfWeekClass_softClass;
        v23 = getREMRecurrenceDayOfWeekClass_softClass;
        if (!getREMRecurrenceDayOfWeekClass_softClass)
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __getREMRecurrenceDayOfWeekClass_block_invoke;
          v19[3] = &unk_1E4784C68;
          v19[4] = &v20;
          __getREMRecurrenceDayOfWeekClass_block_invoke((uint64_t)v19);
          v10 = (void *)v21[3];
        }
        v11 = objc_retainAutorelease(v10);
        _Block_object_dispose(&v20, 8);
        v12 = (void *)objc_msgSend([v11 alloc], "initWithDayOfTheWeek:weekNumber:", -[EKFrozenReminderRecurrenceRule ekWeekdayToREMWeekday:](self, "ekWeekdayToREMWeekday:", objc_msgSend(v9, "dayOfTheWeek")), objc_msgSend(v9, "weekNumber"));
        objc_msgSend(v5, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    }
    while (v6);
  }

  return v5;
}

- (id)specifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__EKFrozenReminderRecurrenceRule_specifier__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("specifier"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __43__EKFrozenReminderRecurrenceRule_specifier__block_invoke(uint64_t a1)
{
  EKRecurrenceHelper *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = -[EKRecurrenceHelper initWithSpecifier:]([EKRecurrenceHelper alloc], "initWithSpecifier:", 0);
  objc_msgSend(*(id *)(a1 + 32), "daysOfTheWeekFromREMRecurrenceRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKRecurrenceHelper setDaysOfTheWeek:](v2, "setDaysOfTheWeek:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_recurrenceRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daysOfTheMonth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKRecurrenceHelper setDaysOfTheMonth:](v2, "setDaysOfTheMonth:", v5);

  objc_msgSend(v4, "daysOfTheYear");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKRecurrenceHelper setDaysOfTheYear:](v2, "setDaysOfTheYear:", v6);

  objc_msgSend(v4, "weeksOfTheYear");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKRecurrenceHelper setWeeksOfTheYear:](v2, "setWeeksOfTheYear:", v7);

  objc_msgSend(v4, "monthsOfTheYear");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKRecurrenceHelper setMonthsOfTheYear:](v2, "setMonthsOfTheYear:", v8);

  objc_msgSend(v4, "setPositions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKRecurrenceHelper setSetPositions:](v2, "setSetPositions:", v9);

  -[EKRecurrenceHelper specifier](v2, "specifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)loadSpecifierDaysOfTheWeek:(id *)a3 daysOfTheMonth:(id *)a4 monthsOfTheYear:(id *)a5 weeksOfTheYear:(id *)a6 daysOfTheYear:(id *)a7 setPositions:(id *)a8
{
  EKRecurrenceHelper *v15;
  void *v16;
  void *v17;
  id v18;
  EKRecurrenceHelper *v19;

  v15 = [EKRecurrenceHelper alloc];
  -[EKFrozenReminderRecurrenceRule specifier](self, "specifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[EKRecurrenceHelper initWithSpecifier:](v15, "initWithSpecifier:", v16);

  -[EKRecurrenceHelper daysOfTheWeek](v19, "daysOfTheWeek");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKFrozenReminderRecurrenceRule remDaysOfTheWeekFromEKDaysOfTheWeek:](self, "remDaysOfTheWeekFromEKDaysOfTheWeek:", v17);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a3 = v18;
  -[EKRecurrenceHelper daysOfTheMonth](v19, "daysOfTheMonth");
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKRecurrenceHelper monthsOfTheYear](v19, "monthsOfTheYear");
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  -[EKRecurrenceHelper weeksOfTheYear](v19, "weeksOfTheYear");
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  -[EKRecurrenceHelper daysOfTheYear](v19, "daysOfTheYear");
  *a7 = (id)objc_claimAutoreleasedReturnValue();
  -[EKRecurrenceHelper setPositions](v19, "setPositions");
  *a8 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)_applyChangesToSaveRequest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Rule to be saved doesn't have a parent reminder: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_applyChangesToSaveRequest:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Couldn't fetch reminder to be saved: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)convertFromReminderKitFrequency:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Unknown REMFrequency: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)convertToReminderKitFrequency:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "Unknown frequency: %li", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)convertFromReminderKitWeekday:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Unknown REMWeekday: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)convertToReminderKitWeekday:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "Unknown Weekday: %li", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
