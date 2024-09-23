@implementation _HKQuantitySampleComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;

  objc_msgSend(a1, "operatorType");
  v4 = HDSQLiteComparisonTypeForPredicateOperator();
  objc_msgSend(a1, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5860]);

  if (v6)
  {
    objc_msgSend(a1, "dataTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "canonicalUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValueForUnit:", v10);
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HDQuantitySampleEntityPredicateForQuantity(v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "keyPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB57D0]);

    if (v16)
    {
      objc_msgSend(a1, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HDQuantitySampleEntityPredicateForCount(v4, (uint64_t)v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKQuantitySampleComparisonFilter+HealthDaemon.m"), 32, CFSTR("Unreachable code has been executed"));

      objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v14;
}

@end
