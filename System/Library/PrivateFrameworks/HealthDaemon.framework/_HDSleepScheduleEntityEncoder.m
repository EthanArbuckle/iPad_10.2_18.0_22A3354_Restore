@implementation _HDSleepScheduleEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[13];

  v8[12] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("monday");
  v8[1] = CFSTR("tuesday");
  v8[2] = CFSTR("wednesday");
  v8[3] = CFSTR("thursday");
  v8[4] = CFSTR("friday");
  v8[5] = CFSTR("saturday");
  v8[6] = CFSTR("sunday");
  v8[7] = CFSTR("wake_hour");
  v8[8] = CFSTR("wake_minute");
  v8[9] = CFSTR("bed_hour");
  v8[10] = CFSTR("bed_minute");
  v8[11] = CFSTR("override_day_index");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6C08]), "_init");
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableSleepSchedule *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableSleepSchedule);
    -[HDCodableSleepSchedule setSample:](v10, "setSample:", v9);
    -[HDCodableSleepSchedule setMonday:](v10, "setMonday:", HDSQLiteColumnWithNameAsBoolean());
    -[HDCodableSleepSchedule setTuesday:](v10, "setTuesday:", HDSQLiteColumnWithNameAsBoolean());
    -[HDCodableSleepSchedule setWednesday:](v10, "setWednesday:", HDSQLiteColumnWithNameAsBoolean());
    -[HDCodableSleepSchedule setThursday:](v10, "setThursday:", HDSQLiteColumnWithNameAsBoolean());
    -[HDCodableSleepSchedule setFriday:](v10, "setFriday:", HDSQLiteColumnWithNameAsBoolean());
    -[HDCodableSleepSchedule setSaturday:](v10, "setSaturday:", HDSQLiteColumnWithNameAsBoolean());
    -[HDCodableSleepSchedule setSunday:](v10, "setSunday:", HDSQLiteColumnWithNameAsBoolean());
    HDSQLiteColumnWithNameAsNumber();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      -[HDCodableSleepSchedule setWakeHour:](v10, "setWakeHour:", objc_msgSend(v11, "integerValue"));
    HDSQLiteColumnWithNameAsNumber();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      -[HDCodableSleepSchedule setWakeMinute:](v10, "setWakeMinute:", objc_msgSend(v13, "integerValue"));
    HDSQLiteColumnWithNameAsNumber();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      -[HDCodableSleepSchedule setBedHour:](v10, "setBedHour:", objc_msgSend(v15, "integerValue"));
    HDSQLiteColumnWithNameAsNumber();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      -[HDCodableSleepSchedule setBedMinute:](v10, "setBedMinute:", objc_msgSend(v17, "integerValue"));
    HDSQLiteColumnWithNameAsNumber();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      -[HDCodableSleepSchedule setOverrideDayIndex:](v10, "setOverrideDayIndex:", objc_msgSend(v19, "integerValue"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    HDSQLiteColumnWithNameAsBoolean();
    HDSQLiteColumnWithNameAsBoolean();
    HDSQLiteColumnWithNameAsBoolean();
    HDSQLiteColumnWithNameAsBoolean();
    HDSQLiteColumnWithNameAsBoolean();
    HDSQLiteColumnWithNameAsBoolean();
    HDSQLiteColumnWithNameAsBoolean();
    objc_msgSend(v10, "_setWeekdays:", HKSleepScheduleWeekdaysMake());
    HDSQLiteColumnWithNameAsNumber();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsNumber();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 && v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithHour:minute:", objc_msgSend(v13, "integerValue"), objc_msgSend(v14, "integerValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setWakeTimeComponents:", v16);

    }
    HDSQLiteColumnWithNameAsNumber();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsNumber();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 && v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithHour:minute:", objc_msgSend(v17, "integerValue"), objc_msgSend(v18, "integerValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setBedTimeComponents:", v20);

    }
    HDSQLiteColumnWithNameAsNumber();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setOverrideDayIndex:", v21);

  }
  return v12;
}

@end
