@implementation _HDWorkoutZonesSampleEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("zones");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6EC8]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_opt_class();
    HDSQLiteColumnWithNameAsArrayOfClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v10, "_setZones:", v13);
      LOBYTE(v12) = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 129, CFSTR("Failed unarchiving zones"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = v14 == 0;
      if (v14)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v14);
        else
          _HKLogDroppedError();
      }

    }
  }

  return v12;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableWorkoutZones *v10;
  void *v11;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableWorkoutZones);
    -[HDCodableWorkoutZones setSample:](v10, "setSample:", v9);
    HDSQLiteColumnWithNameAsData();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableWorkoutZones setZones:](v10, "setZones:", v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
