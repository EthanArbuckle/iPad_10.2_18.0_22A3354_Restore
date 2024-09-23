@implementation _HDActivityGoalScheduleEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[10];

  v8[9] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("goal_type");
  v8[1] = CFSTR("unit_string");
  v8[2] = CFSTR("monday_goal");
  v8[3] = CFSTR("tuesday_goal");
  v8[4] = CFSTR("wednesday_goal");
  v8[5] = CFSTR("thursday_goal");
  v8[6] = CFSTR("friday_goal");
  v8[7] = CFSTR("saturday_goal");
  v8[8] = CFSTR("sunday_goal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 9);
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6270]), "_init");
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableActivityGoalSchedule *v10;
  void *v11;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableActivityGoalSchedule);
    -[HDCodableActivityGoalSchedule setSample:](v10, "setSample:", v9);
    -[HDCodableActivityGoalSchedule setGoalType:](v10, "setGoalType:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableActivityGoalSchedule setUnitString:](v10, "setUnitString:", v11);
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setMondayGoal:](v10, "setMondayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setTuesdayGoal:](v10, "setTuesdayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setWednesdayGoal:](v10, "setWednesdayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setThursdayGoal:](v10, "setThursdayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setFridayGoal:](v10, "setFridayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setSaturdayGoal:](v10, "setSaturdayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setSundayGoal:](v10, "setSundayGoal:");

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
  void *v21;
  void *v22;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_msgSend(v10, "setGoalType:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMondayGoal:", v21);
    -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTuesdayGoal:", v14);
    -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWednesdayGoal:", v15);
    -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setThursdayGoal:", v16);
    -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFridayGoal:", v17);
    -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSaturdayGoal:", v18);
    -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSundayGoal:", v19);

  }
  return v12;
}

- (id)_quantityForRow:(uint64_t)a1 unit:(uint64_t)a2 columnName:(void *)a3
{
  id v3;
  void *v4;

  if (a1)
  {
    v3 = a3;
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
