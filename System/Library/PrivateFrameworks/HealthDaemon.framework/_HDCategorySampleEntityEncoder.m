@implementation _HDCategorySampleEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("value");
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

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  _QWORD *v10;
  HDCodableCategorySample *v11;
  uint64_t v12;
  uint64_t v13;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(HDCodableCategorySample);
    -[HDCodableCategorySample setSample:](v11, "setSample:", v10);
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v12 = HDSQLiteColumnWithNameAsInt64();
      v13 = v12;
      if (self->_overrideMCCategorySampleValue && (unint64_t)(v10[1] - 157) < 0xF && v12 != 1)
        v13 = 0;
      -[HDCodableCategorySample setValue:](v11, "setValue:", v13);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (int64_t)estimatedEncodedSize
{
  return 150;
}

- (_HDCategorySampleEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v14;
  _HDCategorySampleEntityEncoder *v15;
  void *v16;
  objc_super v18;

  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)_HDCategorySampleEntityEncoder;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:](&v18, sel_initWithHealthEntityClass_profile_transaction_purpose_encodingOptions_authorizationFilter_, a3, a4, a5, a6, v14, a8);
  if (v15)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("OverrideMCCategorySampleValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_overrideMCCategorySampleValue = objc_msgSend(v16, "BOOLValue");

  }
  return v15;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6378]), "_init");
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
    objc_msgSend(v10, "_setValue:", HDSQLiteColumnWithNameAsInt64());

  return v12;
}

@end
