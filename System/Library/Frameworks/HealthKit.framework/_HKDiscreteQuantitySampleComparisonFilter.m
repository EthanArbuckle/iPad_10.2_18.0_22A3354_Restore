@implementation _HKDiscreteQuantitySampleComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((_IsQuantityKeyPath(v3) & 1) != 0 || (_IsDateKeyPath(v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("most_recent_duration"));

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (_IsQuantityKeyPath(v5))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
  }
  else if (_IsDateKeyPath(v5))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("most_recent_duration")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKDiscreteQuantitySampleComparisonFilter.m"), 158, CFSTR("Unreachable code has been executed"));

      v7 = objc_alloc_init(MEMORY[0x1E0C99E60]);
      goto LABEL_8;
    }
    v6 = (void *)MEMORY[0x1E0C99E60];
  }
  objc_msgSend(v6, "setWithObject:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v8 = v7;

  return v8;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char HasValidAggregationStyle;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS____HKDiscreteQuantitySampleComparisonFilter;
  if (objc_msgSendSuper2(&v14, sel_areValidTypes_forKeyPath_error_, v8, v9, a5))
  {
    if (_IsQuantityKeyPath(v9))
    {
      v10 = v8;
      if (objc_msgSend(v10, "count") == 1)
      {
        objc_msgSend(v10, "anyObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HasValidAggregationStyle = _HasValidAggregationStyle(v11, (uint64_t)a5);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("expected 1 sample type but got %ld %@"), objc_msgSend(v10, "count"), v10);
        HasValidAggregationStyle = 0;
      }

    }
    else
    {
      HasValidAggregationStyle = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_25);
    }
  }
  else
  {
    HasValidAggregationStyle = 0;
  }

  return HasValidAggregationStyle;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____HKDiscreteQuantitySampleComparisonFilter;
  if (objc_msgSendSuper2(&v19, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, v14, a7))
  {
    if (_IsQuantityKeyPath(v13))
    {
      objc_msgSend(v14, "anyObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_unit");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isCompatibleWithUnit:", v16);

      if ((v17 & 1) == 0)
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a7, 3, CFSTR("Invalid quantity %@ for data type %@"), v12, v15);

    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("max")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("min")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("most_recent")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("most_recent_duration")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("most_recent_end_date")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("most_recent_start_date")) & 1) != 0)
  {
    v6 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKDiscreteQuantitySampleComparisonFilter.m"), 217, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKDiscreteQuantitySampleComparisonFilter;
    v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  unint64_t v28;
  void *v29;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue");
    v8 = v7;
    if (v7 < 3)
    {
      -[_HKComparisonFilter value](self, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[_HKComparisonFilter operatorType](self, "operatorType");
      v11 = v15;
      v17 = v6;
      objc_msgSend(v17, "quantityType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_unit");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isCompatibleWithUnit:", v19);

      if (v20)
      {
        v21 = v17;
        v22 = v21;
        if (v8)
        {
          if (v8 == 1)
            objc_msgSend(v21, "minimumQuantity");
          else
            objc_msgSend(v21, "mostRecentQuantity");
          v23 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v21, "maximumQuantity");
          v23 = objc_claimAutoreleasedReturnValue();
        }
        v29 = (void *)v23;

        v14 = HKComparisonResultMatchesPredicateOperator(objc_msgSend(v29, "compare:", v11), v16);
      }
      else
      {
        v14 = 0;
      }

      goto LABEL_23;
    }
    if (v7 - 3 >= 2)
    {
      if (v7 != 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKDiscreteQuantitySampleComparisonFilter.m"), 248, CFSTR("Unreachable code has been executed"));
        v14 = 0;
        goto LABEL_23;
      }
      -[_HKComparisonFilter value](self, "value");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v25 = v24;
      v10 = -[_HKComparisonFilter operatorType](self, "operatorType");
      objc_msgSend(v6, "mostRecentQuantityDateInterval");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "duration");
      v28 = HKCompareDoubles(v27, v25);
    }
    else
    {
      -[_HKComparisonFilter value](self, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[_HKComparisonFilter operatorType](self, "operatorType");
      v11 = v9;
      objc_msgSend(v6, "mostRecentQuantityDateInterval");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v8 == 4)
        objc_msgSend(v12, "endDate");
      else
        objc_msgSend(v12, "startDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_msgSend(v26, "compare:", v11);
    }

    v14 = HKComparisonResultMatchesPredicateOperator(v28, v10);
LABEL_23:

    goto LABEL_24;
  }
  v14 = 0;
LABEL_24:

  return v14;
}

@end
