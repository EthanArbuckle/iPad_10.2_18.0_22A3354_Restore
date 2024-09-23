@implementation _HDPauseRingsScheduleEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("start_date_index");
  v9[1] = CFSTR("end_date_index");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)_HDPauseRingsScheduleEntityEncoder;
  -[HDEntityEncoder superclassEncoder](&v8, sel_superclassEncoder);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69D8]), "_init");
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodablePauseRingsSchedule *v10;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodablePauseRingsSchedule);
    -[HDCodablePauseRingsSchedule setSample:](v10, "setSample:", v9);
    -[HDCodablePauseRingsSchedule setStartDateIndex:](v10, "setStartDateIndex:", HDSQLiteColumnWithNameAsInt64());
    -[HDCodablePauseRingsSchedule setEndDateIndex:](v10, "setEndDateIndex:", HDSQLiteColumnWithNameAsInt64());
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

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_msgSend(v10, "setStartDateIndex:", HDSQLiteColumnWithNameAsInt64());
    objc_msgSend(v10, "setEndDateIndex:", HDSQLiteColumnWithNameAsInt64());
  }

  return v12;
}

@end
