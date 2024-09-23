@implementation _HDMedicationRecordEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[13];

  v8[12] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("medication_coding_collection");
  v8[1] = CFSTR("assertion_type");
  v8[2] = CFSTR("asserter");
  v8[3] = CFSTR("assertion_date");
  v8[4] = CFSTR("status_coding");
  v8[5] = CFSTR("dosages");
  v8[6] = CFSTR("earliest_dosage_date");
  v8[7] = CFSTR("reason_for_use_coding_collections");
  v8[8] = CFSTR("not_taken");
  v8[9] = CFSTR("reasons_not_taken_coding_collections");
  v8[10] = CFSTR("effective_start_date");
  v8[11] = CFSTR("effective_end_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 12);
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB68D8]), "_init");
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setMedicationCodingCollection:", v32);
    objc_msgSend(v10, "_setAssertionType:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setAsserter:", v31);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setAssertionDate:", v30);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setStatusCoding:", v29);
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setDosages:", v16);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEarliestDosageDate:", v17);
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setReasonForUseCodingCollections:", v21);
    objc_msgSend(v10, "_setNotTaken:", HDSQLiteColumnWithNameAsBoolean());
    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setReasonsNotTakenCodingCollections:", v25);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEffectiveStartDate:", v26);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEffectiveEndDate:", v27);

  }
  return v12;
}

@end
