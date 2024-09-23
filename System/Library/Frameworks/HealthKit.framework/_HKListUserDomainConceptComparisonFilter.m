@implementation _HKListUserDomainConceptComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("listType"));
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("listType")))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, objc_opt_class(), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKListUserDomainConceptComparisonFilter.m"), 41, CFSTR("Unreachable code has been executed"));

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  void *v9;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("listType")))
    return a3 == 10 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKListUserDomainConceptComparisonFilter.m"), 55, CFSTR("Unreachable code has been executed"));

  return 0;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  uint64_t v15;
  char v16;
  void *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____HKListUserDomainConceptComparisonFilter;
  if (!objc_msgSendSuper2(&v19, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v13, v14, a5, a6, a7))goto LABEL_5;
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("listType")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKListUserDomainConceptComparisonFilter.m"), 73, CFSTR("Unreachable code has been executed"));

LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v15 = objc_opt_class();
  v16 = HKIsValueOrContainerValidForOperatorType(a5, v13, v15, (uint64_t)a7);
LABEL_6:

  return v16;
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
