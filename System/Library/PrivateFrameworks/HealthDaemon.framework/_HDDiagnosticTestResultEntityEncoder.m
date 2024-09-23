@implementation _HDDiagnosticTestResultEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[16];

  v8[15] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("diagnostic_test_coding_collection");
  v8[1] = CFSTR("value");
  v8[2] = CFSTR("reference_ranges");
  v8[3] = CFSTR("effective_start_date");
  v8[4] = CFSTR("category");
  v8[5] = CFSTR("categories_coding_collections");
  v8[6] = CFSTR("issue_date");
  v8[7] = CFSTR("effective_end_date");
  v8[8] = CFSTR("status_coding");
  v8[9] = CFSTR("interpretation_coding_collections");
  v8[10] = CFSTR("comments");
  v8[11] = CFSTR("body_site_coding_collection");
  v8[12] = CFSTR("method_coding_collection");
  v8[13] = CFSTR("performers");
  v8[14] = CFSTR("reference_range_status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 15);
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6620]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;

  v9 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v10, "applyPropertiesToObject:persistentID:row:error:", v9, a4, a5, a6);

  if ((_DWORD)a6)
  {
    v38 = (char)a6;
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setDiagnosticTestCodingCollection:", v37);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setValue:", v36);
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setReferenceRanges:", v35);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setEffectiveStartDate:", v34);
    HDSQLiteColumnWithNameAsString();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setCategory:", v33);
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setCategoriesCodingCollections:", v32);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setIssueDate:", v31);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setEffectiveEndDate:", v18);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setStatusCoding:", v19);
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setInterpretationCodingCollections:", v23);
    HDSQLiteColumnWithNameAsString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setComments:", v24);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setBodySiteCodingCollection:", v25);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setMethodCodingCollection:", v26);
    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    a6 = (id *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(a6) = v38;
    objc_msgSend(v9, "_setPerformers:", v29);
    objc_msgSend(v9, "_setReferenceRangeStatus:", HDSQLiteColumnWithNameAsInt64());

  }
  return (char)a6;
}

@end
