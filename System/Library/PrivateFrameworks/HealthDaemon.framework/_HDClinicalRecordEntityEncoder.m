@implementation _HDClinicalRecordEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[12];

  v8[11] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("display_name");
  v8[1] = CFSTR("fhir_resource_fhir_version_major");
  v8[2] = CFSTR("fhir_resource_fhir_version_minor");
  v8[3] = CFSTR("fhir_resource_fhir_version_patch");
  v8[4] = CFSTR("fhir_resource_resource_type");
  v8[5] = CFSTR("fhir_resource_identifier");
  v8[6] = CFSTR("fhir_resource_data");
  v8[7] = CFSTR("fhir_resource_source_url");
  v8[8] = CFSTR("fhir_resource_last_updated_date");
  v8[9] = CFSTR("original_fhir_resource_rowid");
  v8[10] = CFSTR("original_signed_clinical_data_rowid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 11);
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB63D0]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    HDSQLiteColumnWithNameAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setDisplayName:", v13);
    if ((HDSQLiteColumnWithNameIsNull() & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      v22[0] = HDSQLiteColumnWithNameAsInt64();
      v22[1] = HDSQLiteColumnWithNameAsInt64();
      v22[2] = HDSQLiteColumnWithNameAsInt64();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB66A8]), "initWithSemanticVersion:", v22);
      HDSQLiteColumnWithNameAsString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsData();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsURL();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsDate();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB66A0]), "initWithResourceType:identifier:FHIRVersion:data:sourceURL:lastUpdatedDate:", v16, v17, v15, v18, v19, v20);

    }
    objc_msgSend(v10, "_setFHIRResource:", v14);

  }
  return v12;
}

@end
