@implementation ACHEarnedInstanceEntityEncoder

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v5;
  void *v6;

  -[ACHEarnedInstanceEntityEncoder objectForPersistentID:row:error:](self, "objectForPersistentID:row:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ACHCodableFromEarnedInstance();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  id v9;
  id v10;

  v9 = objc_alloc_init(MEMORY[0x24BE01830]);
  if (-[ACHEarnedInstanceEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v9, a3, a4, a5))
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
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a3;
  objc_msgSend(v7, "setKey:", a4);
  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTemplateUniqueName:", v8);

  HDSQLiteColumnWithNameAsDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCreatedDate:", v9);

  HDSQLiteColumnWithNameAsString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayDateComponentsFromString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEarnedDateComponents:", v11);

  objc_msgSend(v7, "setCreatorDevice:", HDSQLiteColumnWithNameAsInt64());
  if ((HDSQLiteColumnWithNameIsNull() & 1) != 0 || (HDSQLiteColumnWithNameIsNull() & 1) != 0)
  {
    objc_msgSend(v7, "setValue:", 0);
  }
  else
  {
    HDSQLiteColumnWithNameAsString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDouble();
    v14 = v13;
    v15 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "quantityWithUnit:doubleValue:", v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:", v17);

  }
  HDSQLiteColumnWithNameAsString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExternalIdentifier:", v18);

  return 1;
}

@end
