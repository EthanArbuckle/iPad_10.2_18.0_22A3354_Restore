@implementation _HDDiagnosticTestReportEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("diagnostic_test_coding_collection");
  v8[1] = CFSTR("results");
  v8[2] = CFSTR("effective_start_date");
  v8[3] = CFSTR("status_coding");
  v8[4] = CFSTR("effective_end_date");
  v8[5] = CFSTR("issue_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 6);
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6610]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setDiagnosticTestCodingCollection:", v13);
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setResults:", v17);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEffectiveStartDate:", v18);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setStatusCoding:", v19);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEffectiveEndDate:", v20);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setIssueDate:", v21);

  }
  return v12;
}

@end
