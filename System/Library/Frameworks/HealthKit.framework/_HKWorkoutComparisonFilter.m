@implementation _HKWorkoutComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v4;
  BOOL v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("duration")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("totalDistance")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("totalEnergyBurned")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("totalFlightsClimbed")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("totalSwimmingStrokeCount")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("workoutType")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("goal")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("goalType")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("workoutActivity")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v19[0] = CFSTR("sumQuantity.");
    v19[1] = CFSTR("minimumQuantity.");
    v19[2] = CFSTR("maximumQuantity.");
    v19[3] = CFSTR("averageQuantity.");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v4, "hasPrefix:", v12, (_QWORD)v14) & 1) != 0)
          {
            objc_msgSend(a1, "_quantityTypeFromKeyPath:prefix:", v4, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = v13 != 0;

            goto LABEL_22;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_22:

  }
  return v5;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("duration")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("workoutType")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("goalType")))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
  }
  else
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("goal")))
    {
      v8 = objc_alloc(MEMORY[0x1E0C99E60]);
      v9 = objc_opt_class();
      v5 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
      goto LABEL_6;
    }
    v10 = objc_msgSend(v3, "isEqualToString:", CFSTR("workoutActivity"));
    v4 = (void *)MEMORY[0x1E0C99E60];
    if (v10)
    {
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      objc_msgSend(v4, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  objc_msgSend(v4, "setWithObject:", objc_opt_class());
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (void *)v5;

  return v6;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5;
  BOOL v6;
  BOOL v7;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("workoutType")))
  {
    v6 = a3 == 4;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("goalType")))
  {
    v6 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("workoutActivity")))
    {
      v7 = +[_HKComparisonFilter isAllowedPredicateOperatorType:forKeyPath:](_HKComparisonFilter, "isAllowedPredicateOperatorType:forKeyPath:", a3, v5);
      goto LABEL_10;
    }
    v6 = a3 == 99;
  }
  v7 = v6;
LABEL_10:

  return v7;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  char v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKWorkoutComparisonFilter;
  if (objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5))
    v9 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_132);
  else
    v9 = 0;

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  char IsValidQuantityForTypeWithIdentifier;
  char v18;
  BOOL v19;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS____HKWorkoutComparisonFilter;
  if (!objc_msgSendSuper2(&v21, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, a6, a7))goto LABEL_14;
  v14 = v12;
  v15 = v13;
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("totalDistance")))
  {
    v16 = (uint64_t *)&HKQuantityTypeIdentifierDistanceWalkingRunning;
LABEL_10:
    IsValidQuantityForTypeWithIdentifier = _IsValidQuantityForTypeWithIdentifier(*v16, v14);
    goto LABEL_11;
  }
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("totalEnergyBurned")))
  {
    v16 = (uint64_t *)&HKQuantityTypeIdentifierActiveEnergyBurned;
    goto LABEL_10;
  }
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("totalFlightsClimbed")))
  {
    v16 = (uint64_t *)&HKQuantityTypeIdentifierFlightsClimbed;
    goto LABEL_10;
  }
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("totalSwimmingStrokeCount")))
  {
    v16 = (uint64_t *)&HKQuantityTypeIdentifierSwimmingStrokeCount;
    goto LABEL_10;
  }
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("workoutType")))
  {
    IsValidQuantityForTypeWithIdentifier = _HKWorkoutActivityTypeIsValid(objc_msgSend(v14, "integerValue"));
  }
  else if (objc_msgSend(v15, "isEqualToString:", CFSTR("goal")))
  {
    IsValidQuantityForTypeWithIdentifier = _HKWorkoutValidGoalQuantity(v14);
  }
  else
  {
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("goalType")) & 1) == 0)
    {

      goto LABEL_12;
    }
    IsValidQuantityForTypeWithIdentifier = _HKWorkoutGoalTypeIsValid(objc_msgSend(v14, "integerValue"));
  }
LABEL_11:
  v18 = IsValidQuantityForTypeWithIdentifier;

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a7, 3, CFSTR("Invalid value '%@' for %@"), v14, v15);
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
LABEL_12:
  v19 = 1;
LABEL_15:

  return v19;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("duration")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("totalDistance")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("totalEnergyBurned")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("totalFlightsClimbed")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("totalSwimmingStrokeCount")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("workoutType")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("goal")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("goalType")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend(v5, "hasPrefix:", CFSTR("sumQuantity.")) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend(v5, "hasPrefix:", CFSTR("minimumQuantity.")) & 1) != 0)
  {
    v6 = 9;
  }
  else if ((objc_msgSend(v5, "hasPrefix:", CFSTR("maximumQuantity.")) & 1) != 0)
  {
    v6 = 10;
  }
  else if ((objc_msgSend(v5, "hasPrefix:", CFSTR("averageQuantity.")) & 1) != 0)
  {
    v6 = 11;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("workoutActivity")) & 1) != 0)
  {
    v6 = 12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKWorkoutComparisonFilter.m"), 233, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKWorkoutComparisonFilter;
    v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (void)configureInMemoryFilter
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_HKWorkoutComparisonFilter;
  -[_HKComparisonFilter configureInMemoryFilter](&v20, sel_configureInMemoryFilter);
  -[_HKComparisonFilter keyPath](self, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("sumQuantity."));

  if (v4)
  {
    v5 = (void *)objc_opt_class();
    -[_HKComparisonFilter keyPath](self, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("sumQuantity.");
LABEL_9:
    objc_msgSend(v5, "_quantityTypeFromKeyPath:prefix:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_msgSend(v14, "copy");
    v16 = 64;
LABEL_10:
    v17 = *(Class *)((char *)&self->super.super.super.isa + v16);
    *(Class *)((char *)&self->super.super.super.isa + v16) = v15;

    return;
  }
  -[_HKComparisonFilter keyPath](self, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("minimumQuantity."));

  if (v9)
  {
    v5 = (void *)objc_opt_class();
    -[_HKComparisonFilter keyPath](self, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("minimumQuantity.");
    goto LABEL_9;
  }
  -[_HKComparisonFilter keyPath](self, "keyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("maximumQuantity."));

  if (v11)
  {
    v5 = (void *)objc_opt_class();
    -[_HKComparisonFilter keyPath](self, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("maximumQuantity.");
    goto LABEL_9;
  }
  -[_HKComparisonFilter keyPath](self, "keyPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("averageQuantity."));

  if (v13)
  {
    v5 = (void *)objc_opt_class();
    -[_HKComparisonFilter keyPath](self, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("averageQuantity.");
    goto LABEL_9;
  }
  -[_HKComparisonFilter keyPath](self, "keyPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("workoutActivity"));

  if (v19)
  {
    -[_HKComparisonFilter value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKComparisonFilter dataTypes](self, "dataTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_filterRepresentationForDataTypes:isSubpredicate:", v14, 1);
    v15 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v16 = 72;
    goto LABEL_10;
  }
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5;
  id v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    switch(-[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue"))
    {
      case 0:
        objc_msgSend(v6, "duration");
        v7 = -[_HKWorkoutComparisonFilter _acceptsWorkoutWithDuration:](self, "_acceptsWorkoutWithDuration:");
        goto LABEL_15;
      case 1:
        objc_msgSend(v6, "totalDistance");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 2:
        objc_msgSend(v6, "totalEnergyBurned");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 3:
        objc_msgSend(v6, "totalFlightsClimbed");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 4:
        objc_msgSend(v6, "totalSwimmingStrokeCount");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 5:
        v7 = -[_HKWorkoutComparisonFilter _acceptsWorkoutWithActivityType:](self, "_acceptsWorkoutWithActivityType:", objc_msgSend(v6, "workoutActivityType"));
        goto LABEL_15;
      case 6:
        objc_msgSend(v6, "_goal");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v11 = (void *)v10;
        v12 = -[_HKWorkoutComparisonFilter _acceptsWorkoutWithQuantity:](self, "_acceptsWorkoutWithQuantity:", v10);
        goto LABEL_13;
      case 7:
        v7 = -[_HKWorkoutComparisonFilter _acceptsWorkoutWithGoalType:](self, "_acceptsWorkoutWithGoalType:", objc_msgSend(v6, "_goalType"));
LABEL_15:
        v8 = v7;
        break;
      case 8:
        objc_msgSend(v6, "statisticsForType:", self->_quantityType);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sumQuantity");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 9:
        objc_msgSend(v6, "statisticsForType:", self->_quantityType);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "minimumQuantity");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 10:
        objc_msgSend(v6, "statisticsForType:", self->_quantityType);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "maximumQuantity");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 11:
        objc_msgSend(v6, "statisticsForType:", self->_quantityType);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "averageQuantity");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v14 = (void *)v13;
        v8 = -[_HKWorkoutComparisonFilter _acceptsWorkoutWithQuantity:](self, "_acceptsWorkoutWithQuantity:", v13);

        goto LABEL_21;
      case 12:
        objc_msgSend(v6, "_subActivities");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[_HKWorkoutComparisonFilter _acceptsWorkoutWithActivities:](self, "_acceptsWorkoutWithActivities:", v11);
LABEL_13:
        v8 = v12;
LABEL_21:

        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKWorkoutComparisonFilter.m"), 301, CFSTR("Unreachable code has been executed"));

        v8 = 0;
        break;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_acceptsWorkoutWithDuration:(double)a3
{
  void *v5;
  double v6;
  unint64_t v7;

  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = HKCompareDoubles(a3, v6);

  return HKComparisonResultMatchesPredicateOperator(v7, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

- (BOOL)_acceptsWorkoutWithActivityType:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKCompareIntegers(a3, objc_msgSend(v5, "integerValue"));

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

- (BOOL)_acceptsWorkoutWithGoalType:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKCompareIntegers(a3, objc_msgSend(v5, "integerValue"));

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

- (BOOL)_acceptsWorkoutWithQuantity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;

  v4 = a3;
  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isCompatibleWithUnit:", v6);

  if (v7)
    v8 = HKComparisonResultMatchesPredicateOperator(objc_msgSend(v4, "compare:", v5), -[_HKComparisonFilter operatorType](self, "operatorType"));
  else
    v8 = 0;

  return v8;
}

- (BOOL)_acceptsWorkoutWithActivities:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[_HKFilter acceptsWorkoutActivity:](self->_subFilter, "acceptsWorkoutActivity:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (id)_quantityTypeFromKeyPath:(id)a3 prefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasPrefix:", v6))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      +[HKQuantityType _quantityTypeWithCode:](HKQuantityType, "_quantityTypeWithCode:", objc_msgSend(v7, "integerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (_HKFilter)subFilter
{
  return self->_subFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subFilter, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end
