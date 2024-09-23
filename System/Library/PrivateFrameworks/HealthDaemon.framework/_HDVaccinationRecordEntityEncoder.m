@implementation _HDVaccinationRecordEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[16];

  v8[15] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("vaccination_codings");
  v8[1] = CFSTR("expiration_date");
  v8[2] = CFSTR("dose_number");
  v8[3] = CFSTR("dose_quantity");
  v8[4] = CFSTR("lot_number");
  v8[5] = CFSTR("performer");
  v8[6] = CFSTR("body_site_codings");
  v8[7] = CFSTR("reaction");
  v8[8] = CFSTR("not_given");
  v8[9] = CFSTR("administration_date");
  v8[10] = CFSTR("status_coding");
  v8[11] = CFSTR("patient_reported");
  v8[12] = CFSTR("route_codings");
  v8[13] = CFSTR("reasons_codings");
  v8[14] = CFSTR("reasons_not_given_codings");
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D68]), "_init");
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
  void *v20;
  uint64_t v21;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

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
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setVaccinationCodings:", v41);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setExpirationDate:", v40);
    HDSQLiteColumnWithNameAsString();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setDoseNumber:", v39);
    HDSQLiteColumnWithNameAsString();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setDoseQuantity:", v38);
    HDSQLiteColumnWithNameAsString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setLotNumber:", v37);
    HDSQLiteColumnWithNameAsString();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPerformer:", v36);
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setBodySiteCodings:", v35);
    HDSQLiteColumnWithNameAsString();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setReaction:", v34);
    objc_msgSend(v10, "_setNotGiven:", HDSQLiteColumnWithNameAsBoolean());
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setAdministrationDate:", v33);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setStatusCoding:", v19);
    objc_msgSend(v10, "_setPatientReported:", HDSQLiteColumnWithNameAsBoolean());
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setRouteCodings:", v23);
    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setReasonsCodings:", v27);
    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setReasonsNotGivenCodings:", v31);
  }

  return v12;
}

@end
