@implementation _HKUserDomainConceptComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("semanticIdentifier")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("udcTypeIdentifier")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("udcUUID"));
  }

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("semanticIdentifier")))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0, v13, v14);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("udcTypeIdentifier"))
         || objc_msgSend(v5, "isEqualToString:", CFSTR("udcUUID")))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v6 = objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKUserDomainConceptComparisonFilter.m"), 52, CFSTR("Unreachable code has been executed"));

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v6;

  return v10;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v7;
  BOOL v8;
  BOOL v9;
  void *v11;

  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("semanticIdentifier")))
  {
    v8 = a3 == 4;
  }
  else
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("udcTypeIdentifier")) & 1) == 0
      && !objc_msgSend(v7, "isEqualToString:", CFSTR("udcUUID")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKUserDomainConceptComparisonFilter.m"), 67, CFSTR("Unreachable code has been executed"));

      v9 = 0;
      goto LABEL_11;
    }
    v8 = a3 == 4 || a3 == 10;
  }
  v9 = v8;
LABEL_11:

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  char isKindOfClass;
  uint64_t v16;
  char v17;
  void *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS____HKUserDomainConceptComparisonFilter;
  if (!objc_msgSendSuper2(&v20, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v13, v14, a5, a6, a7))goto LABEL_9;
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("semanticIdentifier")))
  {
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("udcTypeIdentifier"))
      || objc_msgSend(v14, "isEqualToString:", CFSTR("udcUUID")))
    {
      v16 = objc_opt_class();
      isKindOfClass = HKIsValueOrContainerValidForOperatorType(a5, v13, v16, (uint64_t)a7);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKUserDomainConceptComparisonFilter.m"), 87, CFSTR("Unreachable code has been executed"));

LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
LABEL_7:
  v17 = isKindOfClass;
LABEL_10:

  return v17 & 1;
}

+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3
{
  return 1;
}

- (BOOL)acceptsDataObject:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ does not support acceptsDataObject:"), objc_opt_class());
  return 0;
}

@end
