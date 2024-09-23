@implementation _HKWorkoutActivityComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;

  v3 = a1;
  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB58F0]);

  if (v5)
  {
    if (v3)
    {
      objc_msgSend(v3, "operatorType");
      v6 = HDSQLiteComparisonTypeForPredicateOperator();
      objc_msgSend(v3, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      HDWorkoutActivityEntityPredicateForDuration(v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
      v3 = (void *)v8;
LABEL_5:

    }
  }
  else
  {
    objc_msgSend(v3, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB5920]);

    if (v10)
    {
      if (v3)
      {
        objc_msgSend(v3, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HDWorkoutActivityEntityPredicateForActivityType(objc_msgSend(v11, "integerValue"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend(v3, "keyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB5910]);

      if (v14)
      {
        if (!v3)
          return v3;
        objc_msgSend(v3, "operatorType");
        v15 = HDSQLiteComparisonTypeForPredicateOperator();
        objc_msgSend(v3, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        HDWorkoutActivityEntityPredicateForStartDate(v15);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      objc_msgSend(v3, "keyPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB58F8]);

      if (v17)
      {
        if (!v3)
          return v3;
        objc_msgSend(v3, "operatorType");
        v18 = HDSQLiteComparisonTypeForPredicateOperator();
        objc_msgSend(v3, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        HDWorkoutActivityEntityPredicateForEndDate(v18);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      objc_msgSend(v3, "keyPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "hasPrefix:", *MEMORY[0x1E0CB5918]);

      if (v20)
      {
        if (!v3)
          return v3;
        objc_msgSend(v3, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "quantityType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDWorkoutStatisticsPredicate predicateForSumQuantity:quantityType:operatorType:](HDWorkoutStatisticsPredicate, "predicateForSumQuantity:quantityType:operatorType:", v7, v21, objc_msgSend(v3, "operatorType"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_5;
      }
      objc_msgSend(v3, "keyPath");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "hasPrefix:", *MEMORY[0x1E0CB5908]);

      if (v23)
      {
        -[_HKWorkoutComparisonFilter _predicateForMinimumQuantity](v3);
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "keyPath");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "hasPrefix:", *MEMORY[0x1E0CB5900]);

        if (v26)
        {
          -[_HKWorkoutComparisonFilter _predicateForMaximumQuantity](v3);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v3, "keyPath");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "hasPrefix:", *MEMORY[0x1E0CB58E8]);

          if (v28)
          {
            -[_HKWorkoutComparisonFilter _predicateForAverageQuantity](v3);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("_HKWorkoutActivityComparisonFilter+HealthDaemon.m"), 43, CFSTR("Unreachable code has been executed"));

            objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
          }
          v24 = objc_claimAutoreleasedReturnValue();
        }
      }
      v3 = (void *)v24;
    }
  }
  return v3;
}

@end
