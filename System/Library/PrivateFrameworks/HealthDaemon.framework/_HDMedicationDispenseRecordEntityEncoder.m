@implementation _HDMedicationDispenseRecordEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("medication_codings");
  v8[1] = CFSTR("quantity_dispensed");
  v8[2] = CFSTR("preparation_date");
  v8[3] = CFSTR("hand_over_date");
  v8[4] = CFSTR("dosages");
  v8[5] = CFSTR("earliest_dosage_date");
  v8[6] = CFSTR("status_coding");
  v8[7] = CFSTR("days_supply_quantity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 8);
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6888]), "_init");
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
  void *v26;

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
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setMedicationCodings:", v16);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setQuantityDispensed:", v17);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPreparationDate:", v18);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setHandOverDate:", v19);
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setDosages:", v23);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEarliestDosageDate:", v24);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setStatusCoding:", v25);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setDaysSupplyQuantity:", v26);

  }
  return v12;
}

@end
