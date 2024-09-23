@implementation _HDVerifiableClinicalRecordEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("record_types");
  v8[1] = CFSTR("issued_date");
  v8[2] = CFSTR("relevant_date");
  v8[3] = CFSTR("expiration_date");
  v8[4] = CFSTR("issuer_identifier");
  v8[5] = CFSTR("subject");
  v8[6] = CFSTR("item_names");
  v8[7] = CFSTR("jws_representation");
  v8[8] = CFSTR("origin_identifier");
  v8[9] = CFSTR("source_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 10);
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D98]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setRecordTypes:", v28);
    HDSQLiteColumnWithNameAsDate();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setIssuedDate:", v27);
    HDSQLiteColumnWithNameAsDate();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setRelevantDate:", v16);
    HDSQLiteColumnWithNameAsDate();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setExpirationDate:", v17);
    HDSQLiteColumnWithNameAsString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setIssuerIdentifier:", v18);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSubject:", v19);
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setItemNames:", v23);
    HDSQLiteColumnWithNameAsData();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setDataRepresentation:", v24);
    HDSQLiteColumnWithNameAsUUID();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setOriginIdentifier:", v25);
    objc_msgSend(v10, "_setSourceType:", HDSQLiteColumnWithNameAsInt64());

  }
  return v12;
}

@end
