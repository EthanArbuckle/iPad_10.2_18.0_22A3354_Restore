@implementation _HKSampleComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  objc_msgSend(a1, "operatorType");
  v4 = HDSQLiteComparisonTypeForPredicateOperator();
  objc_msgSend(a1, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB5880]);

  if (v7)
  {
    HDSampleEntityPredicateForStartDate(v4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v9 = (void *)v8;
    goto LABEL_13;
  }
  objc_msgSend(a1, "keyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB5858]);

  if (!v11)
  {
    objc_msgSend(a1, "keyPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB57F0]);

    if (v16)
    {
      HDSampleEntityPredicateForEndDate(v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKSampleComparisonFilter+HealthDaemon.m"), 40, CFSTR("Unreachable code has been executed"));

      objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    }
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(a1, "dataTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_earliestAllowedStartDateForSampleOverlappingDate:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    HDSampleEntityPredicateForStartDate(v4);
  else
    objc_msgSend(MEMORY[0x1E0D29890], "truePredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v9;
}

@end
