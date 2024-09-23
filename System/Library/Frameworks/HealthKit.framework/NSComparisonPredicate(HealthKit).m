@implementation NSComparisonPredicate(HealthKit)

+ (id)hk_inequalityPredicateWithKey:()HealthKit value:ascending:
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  if (a5)
    v6 = 2;
  else
    v6 = 0;
  v7 = (void *)MEMORY[0x1E0CB35D0];
  v8 = a4;
  objc_msgSend(v7, "expressionForKeyPath:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v9, v10, 0, v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)hk_equalityPredicateWithKey:()HealthKit value:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB35D0];
  v6 = a4;
  objc_msgSend(v5, "expressionForKeyPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v7, v8, 0, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
