@implementation _HKWorkoutActivityComparisonFilter

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
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("activityDuration")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("activityType")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("activityStartDate")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("activityEndDate")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v19[0] = CFSTR("activitySumQuantity.");
    v19[1] = CFSTR("activityMinimumQuantity.");
    v19[2] = CFSTR("activityMaximumQuantity.");
    v19[3] = CFSTR("activityAverageQuantity.");
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

            goto LABEL_17;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_17:

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

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("activityDuration")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("activityType")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("activityStartDate")) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("activityEndDate"));
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v6;
  unsigned __int8 v7;
  objc_super v9;

  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("activityType")))
  {
    v7 = a3 == 4;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKWorkoutActivityComparisonFilter;
    v7 = objc_msgSendSuper2(&v9, sel_isAllowedPredicateOperatorType_forKeyPath_, a3, v6);
  }

  return v7;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  return objc_msgSend(a3, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_92);
}

+ (BOOL)requiresSubpredicate
{
  return 1;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  char IsValid;
  objc_super v16;

  v12 = a3;
  v13 = a4;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS____HKWorkoutActivityComparisonFilter;
  if (objc_msgSendSuper2(&v16, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, a6, a7))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("activityType")))
      IsValid = _HKWorkoutActivityTypeIsValid(objc_msgSend(v12, "integerValue"));
    else
      IsValid = 1;
  }
  else
  {
    IsValid = 0;
  }

  return IsValid;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("activityDuration")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("activityType")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("activityStartDate")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("activityEndDate")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v5, "hasPrefix:", CFSTR("activitySumQuantity.")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v5, "hasPrefix:", CFSTR("activityMinimumQuantity.")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v5, "hasPrefix:", CFSTR("activityMaximumQuantity.")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v5, "hasPrefix:", CFSTR("activityAverageQuantity.")) & 1) != 0)
  {
    v6 = 7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKWorkoutActivityComparisonFilter.m"), 158, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKWorkoutActivityComparisonFilter;
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
  HKQuantityType *v15;
  HKQuantityType *quantityType;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_HKWorkoutActivityComparisonFilter;
  -[_HKComparisonFilter configureInMemoryFilter](&v17, sel_configureInMemoryFilter);
  -[_HKComparisonFilter keyPath](self, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("activitySumQuantity."));

  if (v4)
  {
    v5 = (void *)objc_opt_class();
    -[_HKComparisonFilter keyPath](self, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("activitySumQuantity.");
  }
  else
  {
    -[_HKComparisonFilter keyPath](self, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("activityMinimumQuantity."));

    if (v9)
    {
      v5 = (void *)objc_opt_class();
      -[_HKComparisonFilter keyPath](self, "keyPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("activityMinimumQuantity.");
    }
    else
    {
      -[_HKComparisonFilter keyPath](self, "keyPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("activityMaximumQuantity."));

      if (v11)
      {
        v5 = (void *)objc_opt_class();
        -[_HKComparisonFilter keyPath](self, "keyPath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = CFSTR("activityMaximumQuantity.");
      }
      else
      {
        -[_HKComparisonFilter keyPath](self, "keyPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("activityAverageQuantity."));

        if (!v13)
          return;
        v5 = (void *)objc_opt_class();
        -[_HKComparisonFilter keyPath](self, "keyPath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = CFSTR("activityAverageQuantity.");
      }
    }
  }
  objc_msgSend(v5, "_quantityTypeFromKeyPath:prefix:", v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (HKQuantityType *)objc_msgSend(v14, "copy");
  quantityType = self->_quantityType;
  self->_quantityType = v15;

}

- (BOOL)acceptsDataObject:(id)a3
{
  return 0;
}

- (BOOL)acceptsWorkoutActivity:(id)a3
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  switch(-[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue"))
  {
    case 0:
      objc_msgSend(v5, "duration");
      v6 = -[_HKWorkoutActivityComparisonFilter _acceptsActivityWithDuration:](self, "_acceptsActivityWithDuration:");
      break;
    case 1:
      objc_msgSend(v5, "workoutConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_HKWorkoutActivityComparisonFilter _acceptsActivityWithActivityType:](self, "_acceptsActivityWithActivityType:", objc_msgSend(v8, "activityType"));
      goto LABEL_8;
    case 2:
      objc_msgSend(v5, "startDate");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(v5, "endDate");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v10;
      v9 = -[_HKWorkoutActivityComparisonFilter _acceptsActivityWithDate:](self, "_acceptsActivityWithDate:", v10);
LABEL_8:
      v6 = v9;
      goto LABEL_14;
    case 4:
      objc_msgSend(v5, "statisticsForType:", self->_quantityType);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sumQuantity");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5:
      objc_msgSend(v5, "statisticsForType:", self->_quantityType);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minimumQuantity");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 6:
      objc_msgSend(v5, "statisticsForType:", self->_quantityType);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "maximumQuantity");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 7:
      objc_msgSend(v5, "statisticsForType:", self->_quantityType);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "averageQuantity");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v12 = (void *)v11;
      v6 = -[_HKWorkoutActivityComparisonFilter _acceptsActivityWithQuantity:](self, "_acceptsActivityWithQuantity:", v11);

LABEL_14:
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKWorkoutActivityComparisonFilter.m"), 210, CFSTR("Unreachable code has been executed"));

      v6 = 0;
      break;
  }

  return v6;
}

- (BOOL)_acceptsActivityWithDuration:(double)a3
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

- (BOOL)_acceptsActivityWithActivityType:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKCompareIntegers(a3, objc_msgSend(v5, "integerValue"));

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

- (BOOL)_acceptsActivityWithDate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  LOBYTE(self) = HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
  return (char)self;
}

- (BOOL)_acceptsActivityWithQuantity:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end
