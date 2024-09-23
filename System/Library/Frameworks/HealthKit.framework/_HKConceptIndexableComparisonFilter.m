@implementation _HKConceptIndexableComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return 0;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v3, "initWithObjects:", v4, v5, objc_opt_class(), 0);
}

+ (BOOL)supportsKeyPath:(id)a3 forTypes:(id)a4
{
  id v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64___HKConceptIndexableComparisonFilter_supportsKeyPath_forTypes___block_invoke;
    v9[3] = &unk_1E37F62E0;
    v10 = v5;
    v7 = objc_msgSend(v6, "hk_allObjectsPassTestWithError:test:", 0, v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12;
  uint64_t v13;
  char v14;
  objc_super v16;

  v12 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS____HKConceptIndexableComparisonFilter;
  if (objc_msgSendSuper2(&v16, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, a4, a5, a6, a7))
  {
    v13 = objc_opt_class();
    v14 = HKIsValueOrContainerValidForOperatorType(a5, v12, v13, (uint64_t)a7);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  return a3 == 4 || a3 == 10;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = (void *)objc_opt_class(),
        -[_HKComparisonFilter keyPath](self, "keyPath"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = _ClassSupportsConceptIndexableKeyPath(v5, v6),
        v6,
        (_DWORD)v5))
  {
    -[_HKComparisonFilter keyPath](self, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_HKConceptIndexableComparisonFilter _acceptsDataObjectWithValue:](self, "_acceptsDataObjectWithValue:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_acceptsDataObjectWithValue:(id)a3
{
  id v5;
  void *v6;
  char v7;
  BOOL v8;

  v5 = a3;
  if (-[_HKComparisonFilter operatorType](self, "operatorType") == 10)
  {
    -[_HKComparisonFilter value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);
  }
  else
  {
    if (-[_HKComparisonFilter operatorType](self, "operatorType") != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKConceptIndexableComparisonFilter.m"), 113, CFSTR("Unreachable code has been executed"));
      v8 = 0;
      goto LABEL_7;
    }
    -[_HKComparisonFilter value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v5);
  }
  v8 = v7;
LABEL_7:

  return v8;
}

@end
