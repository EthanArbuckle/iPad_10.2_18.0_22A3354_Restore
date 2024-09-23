@implementation _HKDiscreteQuantitySampleComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v21;

  objc_msgSend(a1, "operatorType");
  v4 = HDSQLiteComparisonTypeForPredicateOperator();
  objc_msgSend(a1, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5830]);

  if (v6)
  {
    -[_HKDiscreteQuantitySampleComparisonFilter _comparisonQuantityAsNumber](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HDQuantitySampleStatisticsEntityPredicateForMinValue(v4, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB5818]);

    if (v10)
    {
      -[_HKDiscreteQuantitySampleComparisonFilter _comparisonQuantityAsNumber](a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HDQuantitySampleStatisticsEntityPredicateForMaxValue(v4, v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "keyPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB5838]);

      if (v12)
      {
        -[_HKDiscreteQuantitySampleComparisonFilter _comparisonQuantityAsNumber](a1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        HDQuantitySampleStatisticsEntityPredicateForMostRecentValue(v4, v7);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(a1, "keyPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB5850]);

        if (v14)
        {
          objc_msgSend(a1, "value");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          HDQuantitySampleStatisticsEntityPredicateForMostRecentStartDate(v4, v7);
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(a1, "keyPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB5848]);

          if (v16)
          {
            objc_msgSend(a1, "value");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            HDQuantitySampleStatisticsEntityPredicateForMostRecentEndDate(v4, v7);
            v8 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(a1, "keyPath");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB5840]);

            if (!v18)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKDiscreteQuantitySampleComparisonFilter+HealthDaemon.m"), 38, CFSTR("Unreachable code has been executed"));

              objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              return v19;
            }
            objc_msgSend(a1, "value");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            HDQuantitySampleStatisticsEntityPredicateForMostRecentDuration(v4, v7);
            v8 = objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }
  v19 = (void *)v8;

  return v19;
}

@end
