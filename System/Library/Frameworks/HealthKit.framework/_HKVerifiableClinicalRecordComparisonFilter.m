@implementation _HKVerifiableClinicalRecordComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("relevantDate"));
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("relevantDate")))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKVerifiableClinicalRecordComparisonFilter.m"), 37, CFSTR("Unreachable code has been executed"));

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  return +[_HKComparisonFilter isAllowedPredicateOperatorType:forKeyPath:](_HKComparisonFilter, "isAllowedPredicateOperatorType:forKeyPath:", a3, a4);
}

+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3
{
  return 1;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("relevantDate")) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKVerifiableClinicalRecordComparisonFilter.m"), 52, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKVerifiableClinicalRecordComparisonFilter;
    v6 = objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return (int64_t)v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (-[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKVerifiableClinicalRecordComparisonFilter.m"), 66, CFSTR("Unreachable code has been executed"));
      v8 = 0;
    }
    else
    {
      objc_msgSend(v6, "relevantDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[_HKVerifiableClinicalRecordComparisonFilter _acceptsSampleWithDate:](self, "_acceptsSampleWithDate:", v7);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_acceptsSampleWithDate:(id)a3
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

@end
