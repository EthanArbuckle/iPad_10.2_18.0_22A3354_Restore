@implementation HDEntityEncoder

- (HDEntityEncoder)superclassEncoder
{
  return self->_superclassEncoder;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (HDSQLiteDatabase)database
{
  return self->_database;
}

- (void)finish
{
  -[HDEntityEncoder finish](self->_superclassEncoder, "finish");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superclassEncoder, 0);
  objc_storeStrong(&self->_authorizationFilter, 0);
  objc_storeStrong((id *)&self->_encodingOptions, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  uint64_t (**v11)(id, void *, _QWORD, uint64_t, id *);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;

  v11 = (uint64_t (**)(id, void *, _QWORD, uint64_t, id *))a7;
  -[HDEntityEncoder codableRepresentationForPersistentID:row:error:](self, "codableRepresentationForPersistentID:row:error:", a3, a4, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "encodedByteCount");
    v15 = objc_msgSend((id)objc_opt_class(), "estimatedEncodedSize");
    if (v14 <= v15)
      v16 = v15;
    else
      v16 = v14;
    v17 = v11[2](v11, v13, v16, 1, a6) != 2;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (int64_t)estimatedEncodedSize
{
  return 250;
}

- (HDEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v12;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  Class v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  HDEntityEncoder *v27;
  int64_t v28;
  uint64_t v29;
  HDEntityEncoder *v30;
  HDEntityEncoder *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id authorizationFilter;
  uint64_t v37;
  HDEntityEncoder *superclassEncoder;
  void *v40;
  int64_t v41;
  void *v42;
  int64_t v43;
  void *v44;
  int64_t v45;
  void *v46;
  int64_t v47;
  Class obj;
  objc_super v50;

  v12 = a4;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (a3)
  {
    if (v15)
      goto LABEL_3;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = a6;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDEntityEncoder.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

    a6 = v43;
    if (v16)
      goto LABEL_4;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = a6;
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDEntityEncoder.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityClass != nil"));

  a6 = v41;
  if (!v15)
    goto LABEL_15;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = a6;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDEntityEncoder.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction != nil"));

  a6 = v45;
LABEL_4:
  objc_msgSend(v16, "protectedDatabase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  obj = a3;
  if ((Class)objc_opt_class() == a3)
  {
    v21 = v16;
    if (v19)
      goto LABEL_6;
  }
  else
  {
    v20 = a3;
    v21 = v16;
    objc_msgSend(v16, "databaseForEntityClass:", v20);
    v22 = v15;
    v23 = v18;
    v24 = v12;
    v25 = v17;
    v26 = a5;
    v27 = self;
    v28 = a6;
    v29 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v29;
    a6 = v28;
    self = v27;
    a5 = v26;
    v17 = v25;
    v12 = v24;
    v18 = v23;
    v15 = v22;
    if (v19)
      goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v47 = a6;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDEntityEncoder.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityClassDatabase != nil"));

  a6 = v47;
LABEL_6:
  v50.receiver = self;
  v50.super_class = (Class)HDEntityEncoder;
  v30 = -[HDEntityEncoder init](&v50, sel_init);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_entityClass, obj);
    objc_storeStrong((id *)&v31->_profile, v12);
    objc_storeStrong((id *)&v31->_transaction, a5);
    objc_storeStrong((id *)&v31->_database, v19);
    v31->_purpose = a6;
    v32 = objc_msgSend(v17, "copy");
    v33 = (void *)v32;
    if (v32)
      v34 = (void *)v32;
    else
      v34 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v31->_encodingOptions, v34);

    v35 = _Block_copy(v18);
    authorizationFilter = v31->_authorizationFilter;
    v31->_authorizationFilter = v35;

    -[objc_class entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](class_getSuperclass(obj), "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v15, v21, a6, v17, v18);
    v37 = objc_claimAutoreleasedReturnValue();
    superclassEncoder = v31->_superclassEncoder;
    v31->_superclassEncoder = (HDEntityEncoder *)v37;

  }
  return v31;
}

- (id)orderedProperties
{
  void *v2;
  void *v3;
  id v4;

  -[HDEntityEncoder orderedProperties](self->_superclassEncoder, "orderedProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return objc_alloc_init(MEMORY[0x1E0DE7910]);
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  id v10;

  -[HDEntityEncoder createBareObjectWithRow:](self, "createBareObjectWithRow:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v9, a3, a4, a5))
  {
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (HDDatabaseTransaction)transaction
{
  return self->_transaction;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (NSDictionary)encodingOptions
{
  return self->_encodingOptions;
}

- (id)authorizationFilter
{
  return self->_authorizationFilter;
}

@end
