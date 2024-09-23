@implementation _HDScoredAssessmentEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("score");
  v8[1] = CFSTR("answers");
  v8[2] = CFSTR("risk");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  if (-[_HDScoredAssessmentEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v11, a3, a4, a5))
  {
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableScoredAssessment *v10;
  void *v11;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableScoredAssessment);
    -[HDCodableScoredAssessment setSample:](v10, "setSample:", v9);
    -[HDCodableScoredAssessment setScore:](v10, "setScore:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsData();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableScoredAssessment setAnswers:](v10, "setAnswers:", v11);

    -[HDCodableScoredAssessment setRisk:](v10, "setRisk:", HDSQLiteColumnWithNameAsInt64());
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v9 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v10, "applyPropertiesToObject:persistentID:row:error:", v9, a4, a5, a6);

  if ((_DWORD)a6)
  {
    objc_msgSend(v9, "_setScore:", (int)HDSQLiteColumnWithNameAsInt64());
    a6 = (id *)MEMORY[0x1E0CB3710];
    v12 = objc_opt_class();
    HDSQLiteColumnWithNameAsData();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(a6, "unarchivedArrayOfObjectsOfClass:fromData:error:", v12, v13, &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(a6) = v14 != 0;
    if (v14)
    {
      objc_msgSend(v9, "_setAnswers:", v14);
      objc_msgSend(v9, "_setRisk:", HDSQLiteColumnWithNameAsInt64());
    }

  }
  return (char)a6;
}

@end
