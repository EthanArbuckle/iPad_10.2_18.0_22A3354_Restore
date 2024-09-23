@implementation _HKWorkoutComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;

  v5 = a3;
  objc_msgSend(a1, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB5930]);

  if (v7)
  {
    if (a1)
    {
      objc_msgSend(a1, "operatorType");
      v8 = HDSQLiteComparisonTypeForPredicateOperator();
      objc_msgSend(a1, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      HDWorkoutEntityPredicateForDuration(v8);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      a1 = (void *)v10;

    }
  }
  else
  {
    objc_msgSend(a1, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB5958]);

    if (v12)
    {
      if (a1)
      {
        objc_msgSend(a1, "operatorType");
        v13 = HDSQLiteComparisonTypeForPredicateOperator();
        objc_msgSend(a1, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        HDWorkoutEntityPredicateForTotalDistance(v13, v9);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(a1, "keyPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB5960]);

      if (v15)
      {
        if (a1)
        {
          objc_msgSend(a1, "operatorType");
          v16 = HDSQLiteComparisonTypeForPredicateOperator();
          objc_msgSend(a1, "value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          HDWorkoutEntityPredicateForTotalEnergyBurned(v16, v9);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
      else
      {
        objc_msgSend(a1, "keyPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB5968]);

        if (v18)
        {
          if (a1)
          {
            objc_msgSend(a1, "operatorType");
            v19 = HDSQLiteComparisonTypeForPredicateOperator();
            objc_msgSend(a1, "value");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            HDWorkoutEntityPredicateForTotalFlightsClimbed(v19, v9);
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
        }
        else
        {
          objc_msgSend(a1, "keyPath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB5970]);

          if (v21)
          {
            if (a1)
            {
              objc_msgSend(a1, "operatorType");
              v22 = HDSQLiteComparisonTypeForPredicateOperator();
              objc_msgSend(a1, "value");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              HDWorkoutEntityPredicateForTotalSwimmingStrokeCount(v22, v9);
              v10 = objc_claimAutoreleasedReturnValue();
              goto LABEL_16;
            }
          }
          else
          {
            objc_msgSend(a1, "keyPath");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0CB5978]);

            if (v25)
            {
              -[_HKWorkoutComparisonFilter _predicateForWorkoutActivityType](a1);
              v26 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(a1, "keyPath");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CB7220]);

              if (v28)
              {
                -[_HKWorkoutComparisonFilter _predicateForGoal](a1);
                v26 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(a1, "keyPath");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CB7228]);

                if (v30)
                {
                  -[_HKWorkoutComparisonFilter _predicateForGoalType](a1);
                  v26 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(a1, "keyPath");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "hasPrefix:", *MEMORY[0x1E0CB5950]);

                  if (v32)
                  {
                    -[_HKWorkoutComparisonFilter _predicateForSumQuantity](a1);
                    v26 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(a1, "keyPath");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_msgSend(v33, "hasPrefix:", *MEMORY[0x1E0CB5948]);

                    if (v34)
                    {
                      -[_HKWorkoutComparisonFilter _predicateForMinimumQuantity](a1);
                      v26 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_msgSend(a1, "keyPath");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = objc_msgSend(v35, "hasPrefix:", *MEMORY[0x1E0CB5940]);

                      if (v36)
                      {
                        -[_HKWorkoutComparisonFilter _predicateForMaximumQuantity](a1);
                        v26 = objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        objc_msgSend(a1, "keyPath");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        v38 = objc_msgSend(v37, "hasPrefix:", *MEMORY[0x1E0CB5928]);

                        if (v38)
                        {
                          -[_HKWorkoutComparisonFilter _predicateForAverageQuantity](a1);
                          v26 = objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          objc_msgSend(a1, "keyPath");
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0CB58E0]);

                          if (v40)
                          {
                            -[_HKWorkoutComparisonFilter _predicateForWorkoutActivityWithProfile:](a1, v5);
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                            v41 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKWorkoutComparisonFilter+HealthDaemon.m"), 78, CFSTR("Unreachable code has been executed"));

                            objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
                          }
                          v26 = objc_claimAutoreleasedReturnValue();
                        }
                      }
                    }
                  }
                }
              }
            }
            a1 = (void *)v26;
          }
        }
      }
    }
  }

  return a1;
}

@end
