@implementation _HDMedicationOrderEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[12];

  v8[11] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("medication_coding_collection");
  v8[1] = CFSTR("prescriber");
  v8[2] = CFSTR("number_of_fills");
  v8[3] = CFSTR("dosages");
  v8[4] = CFSTR("earliest_dosage_date");
  v8[5] = CFSTR("written_date");
  v8[6] = CFSTR("ended_date");
  v8[7] = CFSTR("status_coding");
  v8[8] = CFSTR("reason_coding_collections");
  v8[9] = CFSTR("reason_ended_coding_collection");
  v8[10] = CFSTR("status_reason_coding_collection");
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB68C8]), "_init");
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
  void *v29;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setMedicationCodingCollection:", v29);
    HDSQLiteColumnWithNameAsString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPrescriber:", v28);
    objc_msgSend(v10, "_setNumberOfFills:", HDSQLiteColumnWithNameAsInt64());
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setDosages:", v27);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEarliestDosageDate:", v16);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setWrittenDate:", v17);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEndedDate:", v18);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setStatusCoding:", v19);
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setReasonCodingCollections:", v23);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setReasonEndedCodingCollection:", v24);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setStatusReasonCodingCollection:", v25);

  }
  return v12;
}

@end
