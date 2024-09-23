@implementation _HDFitnessFriendAchievementEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("friend_uuid");
  v8[1] = CFSTR("template_unique_name");
  v8[2] = CFSTR("completed_date");
  v8[3] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableFitnessFriendAchievement *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableFitnessFriendAchievement);
    -[HDCodableFitnessFriendAchievement setSample:](v10, "setSample:", v9);
    HDSQLiteColumnWithNameAsData();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendAchievement setFriendUUID:](v10, "setFriendUUID:", v11);

    HDSQLiteColumnWithNameAsString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendAchievement setTemplateUniqueName:](v10, "setTemplateUniqueName:", v12);

    v13 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a4, v13) & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableFitnessFriendAchievement setCompletedDate:](v10, "setCompletedDate:");
    }
    HDSQLiteColumnWithNameAsNumber();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "hk_hasFloatingPointValue"))
      {
        objc_msgSend(v15, "doubleValue");
        -[HDCodableFitnessFriendAchievement setDoubleValue:](v10, "setDoubleValue:");
      }
      else
      {
        -[HDCodableFitnessFriendAchievement setIntValue:](v10, "setIntValue:", objc_msgSend(v15, "longLongValue"));
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6FA8]), "_init");
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

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    HDSQLiteColumnWithNameAsUUID();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFriendUUID:", v13);

    HDSQLiteColumnWithNameAsString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTemplateUniqueName:", v14);

    HDSQLiteColumnWithNameAsDate();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompletedDate:", v15);

    HDSQLiteColumnWithNameAsNumber();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:", v16);

  }
  return v12;
}

@end
