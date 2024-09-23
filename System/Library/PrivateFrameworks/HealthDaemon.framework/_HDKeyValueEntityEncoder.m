@implementation _HDKeyValueEntityEncoder

- (id)orderedProperties
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("key");
  v3[1] = CFSTR("value");
  v3[2] = CFSTR("mod_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  HDCodableTimestampedKeyValuePair *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(HDCodableTimestampedKeyValuePair);
  HDSQLiteColumnWithNameAsNaturalType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNaturalType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTimestampedKeyValuePair setKey:](v5, "setKey:", v6);
  -[HDCodableTimestampedKeyValuePair setValue:](v5, "setValue:", v7);
  HDSQLiteColumnWithNameAsDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTimestampedKeyValuePair setTimestampWithDate:](v5, "setTimestampWithDate:", v8);

  return v5;
}

- (_HDKeyValueEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  _HDKeyValueEntityEncoder *v19;
  void *v21;
  objc_super v22;

  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (a6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDKeyValueEntity.m"), 1280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("purpose != HDEntityEncodingPurposeObjectInstantiation"));

  }
  v22.receiver = self;
  v22.super_class = (Class)_HDKeyValueEntityEncoder;
  v19 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:](&v22, sel_initWithHealthEntityClass_profile_transaction_purpose_encodingOptions_authorizationFilter_, a3, v15, v16, a6, v17, v18);

  return v19;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDKeyValueEntity.m"), 1316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

  return 0;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDKeyValueEntity.m"), 1325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

  return 0;
}

@end
