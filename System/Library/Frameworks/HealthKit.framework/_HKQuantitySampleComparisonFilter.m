@implementation _HKQuantitySampleComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("quantity")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("count"));

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
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("quantity")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("count")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKQuantitySampleComparisonFilter.m"), 52, CFSTR("Unreachable code has been executed"));

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x1E0C99E60];
  }
  objc_msgSend(v6, "setWithObject:", objc_opt_class());
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v7;

  return v9;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS____HKQuantitySampleComparisonFilter;
  if (!objc_msgSendSuper2(&v12, sel_areValidTypes_forKeyPath_error_, v8, v9, a5))
    goto LABEL_6;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("quantity")) && objc_msgSend(v8, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("expected 1 sample type but got %ld %@"), objc_msgSend(v8, "count"), v8);
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v10 = 1;
LABEL_7:

  return v10;
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
  v19.super_class = (Class)&OBJC_METACLASS____HKQuantitySampleComparisonFilter;
  if (objc_msgSendSuper2(&v19, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, v14, a7))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("quantity")))
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
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("quantity")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("count")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKQuantitySampleComparisonFilter.m"), 104, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKQuantitySampleComparisonFilter;
    v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  unint64_t v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue");
    if (v7 == 1)
    {
      -[_HKComparisonFilter value](self, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      v17 = HKCompareIntegers(objc_msgSend(v6, "count"), v16);
      v14 = HKComparisonResultMatchesPredicateOperator(v17, -[_HKComparisonFilter operatorType](self, "operatorType"));
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKQuantitySampleComparisonFilter.m"), 132, CFSTR("Unreachable code has been executed"));

      v14 = 0;
    }
    else
    {
      -[_HKComparisonFilter value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "quantityType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_unit");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isCompatibleWithUnit:", v10);

      if (v11)
      {
        objc_msgSend(v6, "quantity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "compare:", v8);

        v14 = HKComparisonResultMatchesPredicateOperator(v13, -[_HKComparisonFilter operatorType](self, "operatorType"));
      }
      else
      {
        v14 = 0;
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5
{
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  double v13;
  unint64_t v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;

  -[_HKComparisonFilter dataTypes](self, "dataTypes", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue");
  if (v10 == 1)
  {
    -[_HKComparisonFilter value](self, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    v18 = HKCompareIntegers((uint64_t)a5, v17);
    v15 = HKComparisonResultMatchesPredicateOperator(v18, -[_HKComparisonFilter operatorType](self, "operatorType"));
  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKQuantitySampleComparisonFilter.m"), 153, CFSTR("Unreachable code has been executed"));

    v15 = 0;
  }
  else
  {
    -[_HKComparisonFilter value](self, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "canonicalUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValueForUnit:", v12);
    v14 = HKCompareDoubles(a5, v13);

    v15 = HKComparisonResultMatchesPredicateOperator(v14, -[_HKComparisonFilter operatorType](self, "operatorType"));
  }

  return v15;
}

@end
