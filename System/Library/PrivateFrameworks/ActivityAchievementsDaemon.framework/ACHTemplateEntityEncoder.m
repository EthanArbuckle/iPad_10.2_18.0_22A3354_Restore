@implementation ACHTemplateEntityEncoder

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v5;
  void *v6;

  -[ACHTemplateEntityEncoder objectForPersistentID:row:error:](self, "objectForPersistentID:row:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ACHCodableFromTemplate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  id v9;
  id v10;

  v9 = objc_alloc_init(MEMORY[0x24BE01850]);
  if (-[ACHTemplateEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v9, a3, a4, a5))
  {
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v7 = a3;
  objc_msgSend(v7, "setKey:", a4);
  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUniqueName:", v8);

  objc_msgSend(v7, "setVersion:", HDSQLiteColumnWithNameAsInt64());
  objc_msgSend(v7, "setMinimumEngineVersion:", HDSQLiteColumnWithNameAsInt64());
  HDSQLiteColumnWithNameAsDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCreatedDate:", v9);

  objc_msgSend(v7, "setCreatorDevice:", HDSQLiteColumnWithNameAsInt64());
  HDSQLiteColumnWithNameAsString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceName:", v10);

  HDSQLiteColumnWithNameAsString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v11);

  HDSQLiteColumnWithNameAsString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGracePredicate:", v12);

  HDSQLiteColumnWithNameAsString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValueExpression:", v13);

  HDSQLiteColumnWithNameAsString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGraceValueExpression:", v14);

  HDSQLiteColumnWithNameAsString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProgressExpression:", v15);

  HDSQLiteColumnWithNameAsString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGraceProgressExpression:", v16);

  HDSQLiteColumnWithNameAsString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGoalExpression:", v17);

  HDSQLiteColumnWithNameAsString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGraceGoalExpression:", v18);

  objc_msgSend(v7, "setTriggers:", HDSQLiteColumnWithNameAsInt64());
  objc_msgSend(v7, "setEarnLimit:", HDSQLiteColumnWithNameAsInt64());
  HDSQLiteColumnWithNameAsString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisibilityPredicate:", v19);

  HDSQLiteColumnWithNameAsString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGraceVisibilityPredicate:", v20);

  HDSQLiteColumnWithNameAsString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayDateComponentsFromString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisibilityStart:", v22);

  HDSQLiteColumnWithNameAsString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayDateComponentsFromString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisibilityEnd:", v24);

  HDSQLiteColumnWithNameAsString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAvailabilityPredicate:", v25);

  HDSQLiteColumnWithNameAsString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayDateComponentsFromString();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAvailabilityStart:", v27);

  HDSQLiteColumnWithNameAsString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayDateComponentsFromString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAvailabilityEnd:", v29);

  HDSQLiteColumnWithNameAsString();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  ACHTemplateAvailableCountryCodesFromString();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAvailableCountryCodes:", v31);

  HDSQLiteColumnWithNameAsString();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlertabilityPredicate:", v32);

  HDSQLiteColumnWithNameAsString();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  ACHTemplateAlertDatesFromString();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlertDates:", v34);

  objc_msgSend(v7, "setDuplicateRemovalStrategy:", HDSQLiteColumnWithNameAsInt64());
  objc_msgSend(v7, "setDuplicateRemovalCalendarUnit:", HDSQLiteColumnWithNameAsInt64());
  objc_msgSend(v7, "setEarnDateStrategy:", HDSQLiteColumnWithNameAsInt64());
  HDSQLiteColumnWithNameAsString();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCanonicalUnit:", v36);

  }
  objc_msgSend(v7, "setDisplayOrder:", HDSQLiteColumnWithNameAsInt64());
  objc_msgSend(v7, "setDisplaysEarnedInstanceCount:", HDSQLiteColumnWithNameAsBoolean());
  HDSQLiteColumnWithNameAsString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  ACHTemplateAvailableSuffixesFromString();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAvailableSuffixes:", v38);

  HDSQLiteColumnWithNameAsString();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDailyTargetCanonicalUnit:", v40);

  }
  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(v7, "setDailyTarget:");
  HDSQLiteColumnWithNameAsString();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrerequisiteTemplateName:", v41);

  return 1;
}

@end
