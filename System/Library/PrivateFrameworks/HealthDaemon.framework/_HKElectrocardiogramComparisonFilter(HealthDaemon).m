@implementation _HKElectrocardiogramComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  int v14;
  uint64_t v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char *v24;
  void *v25;
  uint64_t v26;

  v3 = a1;
  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5788]);

  if (!v5)
  {
    objc_msgSend(v3, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB7210]);

    if (v9)
    {
      if (!v3)
        return v3;
      if (objc_msgSend(v3, "operatorType") == 4)
      {
        objc_msgSend(v3, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");
        v12 = 1;
LABEL_18:
        HDECGEntityPredicateForPrivateClassification(v11, v12);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_27:
        v3 = (void *)v21;

        return v3;
      }
      if (objc_msgSend(v3, "operatorType") == 5)
      {
        objc_msgSend(v3, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");
        v12 = 0;
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = sel__predicateForPrivateECGClassification;
      v25 = v3;
      v26 = 51;
    }
    else
    {
      objc_msgSend(v3, "keyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB57E0]);

      if (v14)
      {
        if (!v3)
          return v3;
        if (objc_msgSend(v3, "operatorType") == 4)
        {
          objc_msgSend(v3, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v10, "integerValue");
          v16 = 1;
        }
        else
        {
          if (objc_msgSend(v3, "operatorType") != 5)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            v24 = sel__predicateForPublicECGClassification;
            v25 = v3;
            v26 = 62;
            goto LABEL_30;
          }
          objc_msgSend(v3, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v10, "integerValue");
          v16 = 0;
        }
        HDECGEntityPredicateForPublicClassification(v15, v16);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      objc_msgSend(v3, "keyPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB57E8]);

      if (v18)
      {
        if (!v3)
          return v3;
        if (objc_msgSend(v3, "operatorType") == 4)
        {
          objc_msgSend(v3, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v10, "integerValue");
          v20 = 1;
        }
        else
        {
          if (objc_msgSend(v3, "operatorType") != 5)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            v24 = sel__predicateForSymptomsStatus;
            v25 = v3;
            v26 = 73;
            goto LABEL_30;
          }
          objc_msgSend(v3, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v10, "integerValue");
          v20 = 0;
        }
        HDECGEntityPredicateForSymptomsStatus(v19, v20);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = a2;
      v25 = v3;
      v26 = 34;
    }
LABEL_30:
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v24, v25, CFSTR("_HKElectrocardiogramComparisonFilter+HealthDaemon.m"), v26, CFSTR("Unreachable code has been executed"));

    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (v3)
  {
    objc_msgSend(v3, "operatorType");
    v6 = HDSQLiteComparisonTypeForPredicateOperator();
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HDECGEntityPredicateForAverageHeartRate(v6, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
