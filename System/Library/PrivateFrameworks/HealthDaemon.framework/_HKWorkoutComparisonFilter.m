@implementation _HKWorkoutComparisonFilter

- (id)_predicateForWorkoutActivityType
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "value");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    HDWorkoutEntityPredicateForWorkoutActivityType(objc_msgSend(v1, "integerValue"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_predicateForGoal
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    objc_msgSend(a1, "operatorType");
    v2 = HDSQLiteComparisonTypeForPredicateOperator();
    objc_msgSend(a1, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    while (1)
    {
      v5 = qword_1B7F3B368[v4];
      if ((_HKWorkoutGoalTypeAcceptsQuantity() & 1) != 0)
        break;
      if (++v4 == 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_HKWorkoutGoalType _HKGoalTypeForQuantity(HKQuantity * _Nullable __strong)");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_HKWorkoutComparisonFilter+HealthDaemon.m"), 40, CFSTR("Unreachable code has been executed"));

        v5 = 0;
        break;
      }
    }
    HDWorkoutEntityPredicateForWorkoutGoal(v2, v5, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_predicateForGoalType
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "operatorType");
    v2 = HDSQLiteComparisonTypeForPredicateOperator();
    objc_msgSend(v1, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HDWorkoutEntityPredicateForWorkoutGoalType(v2, objc_msgSend(v3, "integerValue"));
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_predicateForSumQuantity
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "value");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "quantityType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDWorkoutStatisticsPredicate predicateForSumQuantity:quantityType:operatorType:](HDWorkoutStatisticsPredicate, "predicateForSumQuantity:quantityType:operatorType:", v2, v3, objc_msgSend(v1, "operatorType"));
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_predicateForMinimumQuantity
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "value");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "quantityType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDWorkoutStatisticsPredicate predicateForMinimumQuantity:quantityType:operatorType:](HDWorkoutStatisticsPredicate, "predicateForMinimumQuantity:quantityType:operatorType:", v2, v3, objc_msgSend(v1, "operatorType"));
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_predicateForMaximumQuantity
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "value");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "quantityType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDWorkoutStatisticsPredicate predicateForMaximumQuantity:quantityType:operatorType:](HDWorkoutStatisticsPredicate, "predicateForMaximumQuantity:quantityType:operatorType:", v2, v3, objc_msgSend(v1, "operatorType"));
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_predicateForAverageQuantity
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "value");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "quantityType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDWorkoutStatisticsPredicate predicateForAverageQuantity:quantityType:operatorType:](HDWorkoutStatisticsPredicate, "predicateForAverageQuantity:quantityType:operatorType:", v2, v3, objc_msgSend(v1, "operatorType"));
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_predicateForWorkoutActivityWithProfile:(id)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v2, "subFilter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateWithProfile:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDWorkoutActivityPredicate predicateForSubPredicate:](HDWorkoutActivityPredicate, "predicateForSubPredicate:", v5);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
