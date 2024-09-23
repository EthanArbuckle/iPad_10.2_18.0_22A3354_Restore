@implementation _HDBinarySampleEntityEncoder

- (id)orderedProperties
{
  void *v2;
  int64_t v4;
  void *v5;
  const __CFString **v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = -[HDEntityEncoder purpose](self, "purpose");
  if (v4 == 1)
  {
    v11 = CFSTR("payload");
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v11;
    goto LABEL_5;
  }
  if (!v4)
  {
    v12[0] = CFSTR("payload");
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = (const __CFString **)v12;
LABEL_5:
    objc_msgSend(v5, "arrayWithObjects:count:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orderedProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableBinarySample *v10;
  void *v11;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableBinarySample);
    -[HDCodableBinarySample setSample:](v10, "setSample:", v9);
    HDSQLiteColumnWithNameAsData();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableBinarySample setPayload:](v10, "setPayload:", v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  int v9;
  void *v10;
  void *v11;
  id v12;

  v9 = HDSQLiteColumnWithName();
  if ((MEMORY[0x1BCCAB204](a4, v9) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", HDSQLiteColumnAsInt64());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "dataObjectClass")), "_init");
  if (-[_HDBinarySampleEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v11, a3, a4, a5))
  {
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    HDSQLiteColumnWithNameAsData();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPayload:", v13);

  }
  return v12;
}

@end
