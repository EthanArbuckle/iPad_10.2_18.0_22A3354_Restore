@implementation _HDServiceEntityEncoder

- (id)orderedProperties
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("device_uuid");
  v3[1] = CFSTR("device_name");
  v3[2] = CFSTR("device_service");
  v3[3] = CFSTR("device_last_connect");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  unint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = HDSQLiteColumnWithNameAsInt64();
  if (v5 > 3)
  {
    v10 = 0;
  }
  else
  {
    v6 = v5;
    v7 = objc_alloc(MEMORY[0x1E0CB6770]);
    HDSQLiteColumnWithNameAsUUID();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithType:identifier:name:", v6, v8, v9);

    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setLastConnection:");
  }
  return v10;
}

@end
