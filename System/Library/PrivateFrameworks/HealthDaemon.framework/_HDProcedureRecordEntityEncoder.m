@implementation _HDProcedureRecordEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[14];

  v8[13] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("procedure_coding_collection");
  v8[1] = CFSTR("performers");
  v8[2] = CFSTR("execution_start_date");
  v8[3] = CFSTR("execution_end_date");
  v8[4] = CFSTR("not_performed");
  v8[5] = CFSTR("status_coding");
  v8[6] = CFSTR("category_coding_collection");
  v8[7] = CFSTR("reason_coding_collections");
  v8[8] = CFSTR("reasons_not_performed_coding_collections");
  v8[9] = CFSTR("outcome_coding_collection");
  v8[10] = CFSTR("complications_coding_collections");
  v8[11] = CFSTR("follow_ups_coding_collections");
  v8[12] = CFSTR("body_sites_coding_collections");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 13);
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69F8]), "_init");
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
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setProcedureCodingCollection:", v43);
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setPerformers:", v42);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setExecutionStartDate:", v41);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setExecutionEndDate:", v40);
    objc_msgSend(v10, "_setNotPerformed:", HDSQLiteColumnWithNameAsBoolean());
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setStatusCoding:", v39);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCategoryCodingCollection:", v38);
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setReasonCodingCollections:", v37);
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setReasonsNotPerformedCodingCollections:", v22);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setOutcomeCodingCollection:", v23);
    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setComplicationsCodingCollections:", v27);
    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setFollowUpsCodingCollections:", v31);
    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setBodySitesCodingCollections:", v35);
  }

  return v12;
}

@end
