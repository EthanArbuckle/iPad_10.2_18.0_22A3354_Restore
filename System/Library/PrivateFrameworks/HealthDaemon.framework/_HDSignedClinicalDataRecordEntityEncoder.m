@implementation _HDSignedClinicalDataRecordEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("credential_types");
  v8[1] = CFSTR("issuer_identifier");
  v8[2] = CFSTR("issued_date");
  v8[3] = CFSTR("relevant_date");
  v8[4] = CFSTR("expiration_date");
  v8[5] = CFSTR("signature_status");
  v8[6] = CFSTR("subject");
  v8[7] = CFSTR("items");
  v8[8] = CFSTR("data_value");
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6BC8]), "_init");
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
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;

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
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setCredentialTypes:", v27);
    HDSQLiteColumnWithNameAsString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setIssuerIdentifier:", v16);
    HDSQLiteColumnWithNameAsDate();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setIssuedDate:", v17);
    HDSQLiteColumnWithNameAsDate();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setRelevantDate:", v18);
    HDSQLiteColumnWithNameAsDate();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setExpirationDate:", v19);
    objc_msgSend(v10, "_setSignatureStatus:", HDSQLiteColumnWithNameAsInt64());
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSubject:", v20);
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setItems:", v24);
    HDSQLiteColumnWithNameAsData();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setDataValue:", v25);
    objc_msgSend(v10, "_setSourceType:", HDSQLiteColumnWithNameAsInt64());

  }
  return v12;
}

@end
