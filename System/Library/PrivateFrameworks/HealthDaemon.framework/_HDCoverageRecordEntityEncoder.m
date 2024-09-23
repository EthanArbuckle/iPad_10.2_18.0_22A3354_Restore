@implementation _HDCoverageRecordEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[15];

  v8[14] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("status_coding");
  v8[1] = CFSTR("coverage_type_coding_collection");
  v8[2] = CFSTR("subscriber");
  v8[3] = CFSTR("subscriber_id");
  v8[4] = CFSTR("beneficiary");
  v8[5] = CFSTR("policy_holder");
  v8[6] = CFSTR("payor");
  v8[7] = CFSTR("relationship_coding_collection");
  v8[8] = CFSTR("classification");
  v8[9] = CFSTR("network");
  v8[10] = CFSTR("period_start_date");
  v8[11] = CFSTR("period_end_date");
  v8[12] = CFSTR("subscriber_identifier");
  v8[13] = CFSTR("beneficiary_identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 14);
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6548]), "_init");
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setStatusCoding:", v33);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCoverageTypeCodingCollection:", v32);
    HDSQLiteColumnWithNameAsString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSubscriber:", v31);
    HDSQLiteColumnWithNameAsString();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSubscriberId:", v30);
    HDSQLiteColumnWithNameAsString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setBeneficiary:", v29);
    HDSQLiteColumnWithNameAsString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPolicyHolder:", v28);
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setPayor:", v27);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setRelationshipCodingCollection:", v16);
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setClassification:", v20);
    HDSQLiteColumnWithNameAsString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setNetwork:", v21);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPeriodStartDate:", v22);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPeriodEndDate:", v23);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSubscriberIdentifier:", v24);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setBeneficiaryIdentifier:", v25);

  }
  return v12;
}

@end
