@implementation _HKMedicalRecordComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v28;

  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB53E8]);

  if (v5)
  {
    objc_msgSend(a1, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicalRecordEntityPredicateForMedicalUserDomainConcept(v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v7;

    return v10;
  }
  objc_msgSend(a1, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB53C0]);

  if (v9)
  {
    objc_msgSend(a1, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicalRecordEntityPredicateForSignedClinicalDataOriginIdentifier(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(a1, "operatorType");
  v11 = HDSQLiteComparisonTypeForPredicateOperator();
  objc_msgSend(a1, "keyPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB53A8]);

  if (v13)
  {
    objc_msgSend(a1, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicalRecordEntityPredicateForModifiedDate(v11);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v10 = (void *)v15;

    return v10;
  }
  objc_msgSend(a1, "keyPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB53B8]);

  if (v17)
  {
    objc_msgSend(a1, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicalRecordEntityPredicateForOriginType(v11 == 1, objc_msgSend(v14, "integerValue"));
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(a1, "keyPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB53C8]);

  if (!v19)
  {
    objc_msgSend(a1, "keyPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CB53E0]);

    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKMedicalRecordComparisonFilter+HealthDaemon.m"), 46, CFSTR("Unreachable code has been executed"));

      objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      return v10;
    }
    objc_msgSend(a1, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicalRecordEntityPredicateForState(v11, objc_msgSend(v14, "integerValue"));
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(a1, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(a1, "value");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v22, "date");
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v24;
  }

  HDMedicalRecordEntityPredicateForSortDate(v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
