@implementation _HKClinicalRecordComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FHIRResource.identifier")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FHIRResource.resourceType"));

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FHIRResource.identifier")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FHIRResource.resourceType")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKClinicalRecordComparisonFilter.m"), 62, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKClinicalRecordComparisonFilter;
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
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue");
    if (v7 == 1)
    {
      objc_msgSend(v6, "FHIRResource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resourceType");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKClinicalRecordComparisonFilter.m"), 82, CFSTR("Unreachable code has been executed"));
        v10 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v6, "FHIRResource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v9;
    -[_HKComparisonFilter value](self, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HKComparisonResultMatchesPredicateOperator(objc_msgSend(v11, "compare:", v12), -[_HKComparisonFilter operatorType](self, "operatorType"));

LABEL_9:
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

@end
