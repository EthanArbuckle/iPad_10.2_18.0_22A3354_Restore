@implementation _HKDiagnosticTestResultComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("category")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("referenceRangeStatus"));

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
  void *v9;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("category")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("referenceRangeStatus")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKDiagnosticTestResultComparisonFilter.m"), 50, CFSTR("Unreachable code has been executed"));

      v7 = objc_alloc_init(MEMORY[0x1E0C99E60]);
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x1E0C99E60];
  }
  objc_msgSend(v6, "setWithObject:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = v7;

  return v9;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("category")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("referenceRangeStatus")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKDiagnosticTestResultComparisonFilter.m"), 61, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKDiagnosticTestResultComparisonFilter;
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
  BOOL v9;
  void *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue");
    if (v7 == 1)
    {
      v9 = -[_HKDiagnosticTestResultComparisonFilter _acceptsDiagnosticTestResultWithReferenceRangeStatus:](self, "_acceptsDiagnosticTestResultWithReferenceRangeStatus:", objc_msgSend(v6, "referenceRangeStatus"));
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKDiagnosticTestResultComparisonFilter.m"), 77, CFSTR("Unreachable code has been executed"));

      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "category");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_HKDiagnosticTestResultComparisonFilter _acceptsDiagnosticTestResultWithCategory:](self, "_acceptsDiagnosticTestResultWithCategory:", v8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_acceptsDiagnosticTestResultWithCategory:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

- (BOOL)_acceptsDiagnosticTestResultWithReferenceRangeStatus:(int64_t)a3
{
  void *v5;
  unint64_t v6;

  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKCompareIntegers(a3, objc_msgSend(v5, "integerValue"));

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

@end
