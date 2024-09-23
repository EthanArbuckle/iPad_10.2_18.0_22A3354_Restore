@implementation _HKStateOfMindComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  char isKindOfClass;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  char v26;
  void *v27;
  void *v29;
  void *v30;
  char *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;

  v3 = a1;
  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5898]);

  if (!v5)
  {
    objc_msgSend(v3, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB58A0]);

    if (v12)
    {
      if (v3)
      {
        objc_msgSend(v3, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", sel__predicateForValence, v3, CFSTR("_HKStateOfMindComparisonFilter+HealthDaemon.m"), 54, CFSTR("Valence should be double as an NSNumber"));

        }
        objc_msgSend(v3, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "operatorType");
        v15 = HDSQLiteComparisonTypeForPredicateOperator();
        objc_msgSend(v8, "doubleValue");
        +[HDStateOfMindEntity predicateForValence:comparisonType:](HDStateOfMindEntity, "predicateForValence:comparisonType:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      return v3;
    }
    objc_msgSend(v3, "keyPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB5890]);

    if (v18)
    {
      if (!v3)
        return v3;
      objc_msgSend(v3, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v20 = objc_opt_isKindOfClass();

      objc_msgSend(v3, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v21;
      if ((v20 & 1) != 0)
      {
        +[HDStateOfMindEntity predicateForLabel:](HDStateOfMindEntity, "predicateForLabel:", objc_msgSend(v21, "integerValue"));
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

LABEL_33:
        objc_msgSend(v3, "value");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDStateOfMindEntity predicateForLabels:](HDStateOfMindEntity, "predicateForLabels:", v36);
        v37 = objc_claimAutoreleasedReturnValue();
LABEL_36:
        v3 = (void *)v37;

        return v3;
      }
      objc_msgSend(v3, "value");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v35 = objc_opt_isKindOfClass();

      if ((v35 & 1) != 0)
        goto LABEL_33;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = sel__predicateForLabels;
      v32 = v3;
      v33 = 69;
    }
    else
    {
      objc_msgSend(v3, "keyPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CB5888]);

      if (v24)
      {
        if (!v3)
          return v3;
        objc_msgSend(v3, "value");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v26 = objc_opt_isKindOfClass();

        objc_msgSend(v3, "value");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v27;
        if ((v26 & 1) != 0)
        {
          +[HDStateOfMindEntity predicateForDomain:](HDStateOfMindEntity, "predicateForDomain:", objc_msgSend(v27, "integerValue"));
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

        }
        else
        {
          objc_msgSend(v3, "value");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v39 = objc_opt_isKindOfClass();

          if ((v39 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            v31 = sel__predicateForDomains;
            v32 = v3;
            v33 = 80;
            goto LABEL_29;
          }
        }
        objc_msgSend(v3, "value");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDStateOfMindEntity predicateForDomains:](HDStateOfMindEntity, "predicateForDomains:", v36);
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = a2;
      v32 = v3;
      v33 = 33;
    }
LABEL_29:
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v31, v32, CFSTR("_HKStateOfMindComparisonFilter+HealthDaemon.m"), v33, CFSTR("Unreachable code has been executed"));

    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (v3)
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = objc_opt_isKindOfClass();

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", sel__predicateForReflectiveInterval, v3, CFSTR("_HKStateOfMindComparisonFilter+HealthDaemon.m"), 39, CFSTR("Reflective interval should be NSInteger as an NSNumber"));

    }
    objc_msgSend(v3, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "operatorType") == 4)
    {
      v9 = objc_msgSend(v8, "integerValue");
      v10 = 1;
    }
    else
    {
      if (objc_msgSend(v3, "operatorType") != 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__predicateForReflectiveInterval, v3, CFSTR("_HKStateOfMindComparisonFilter+HealthDaemon.m"), 50, CFSTR("Unreachable code has been executed"));

        objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      v9 = objc_msgSend(v8, "integerValue");
      v10 = 0;
    }
    +[HDStateOfMindEntity predicateForReflectiveInterval:equals:](HDStateOfMindEntity, "predicateForReflectiveInterval:equals:", v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v3 = (void *)v16;

  }
  return v3;
}

@end
