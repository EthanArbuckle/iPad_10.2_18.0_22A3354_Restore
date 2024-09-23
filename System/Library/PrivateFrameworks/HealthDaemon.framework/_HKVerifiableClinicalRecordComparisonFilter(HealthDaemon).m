@implementation _HKVerifiableClinicalRecordComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "operatorType");
  v4 = HDSQLiteComparisonTypeForPredicateOperator();
  objc_msgSend(a1, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB60F8]);

  if (v6)
  {
    objc_msgSend(a1, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D29838];
    _HDSQLiteValueForDate();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithProperty:value:comparisonType:", CFSTR("relevant_date"), v9, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKVerifiableClinicalRecordComparisonFilter+HealthDaemon.m"), 43, CFSTR("Unreachable code has been executed"));

    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

@end
