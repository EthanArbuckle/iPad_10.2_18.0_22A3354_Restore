@implementation _HKMedicalRecordComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("modifiedDate")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("medicalRecordOriginType")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("sortDate")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("state")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("userDomainConcept")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("signedClinicalDataOriginIdentifier"));
  }

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
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("modifiedDate")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
LABEL_8:
    objc_msgSend(v6, "setWithObject:", objc_opt_class());
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("medicalRecordOriginType")))
  {
LABEL_7:
    v6 = (void *)MEMORY[0x1E0C99E60];
    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("sortDate")))
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("state")))
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("userDomainConcept")))
      {
        v6 = (void *)MEMORY[0x1E0C99E60];
      }
      else
      {
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("signedClinicalDataOriginIdentifier")))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKMedicalRecordComparisonFilter.m"), 70, CFSTR("Unreachable code has been executed"));

          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        }
        v6 = (void *)MEMORY[0x1E0C99E60];
      }
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v10 = (void *)v9;

  return v10;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5;
  BOOL v6;
  BOOL v7;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("medicalRecordOriginType")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("state")))
  {
    v6 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("userDomainConcept")))
  {
    v6 = a3 == 99;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("signedClinicalDataOriginIdentifier")))
    {
      v7 = +[_HKComparisonFilter isAllowedPredicateOperatorType:forKeyPath:](_HKComparisonFilter, "isAllowedPredicateOperatorType:forKeyPath:", a3, v5);
      goto LABEL_7;
    }
    v6 = a3 == 4;
  }
  v7 = v6;
LABEL_7:

  return v7;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("modifiedDate")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("medicalRecordOriginType")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("sortDate")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("state")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("userDomainConcept")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("signedClinicalDataOriginIdentifier")) & 1) != 0)
  {
    v6 = 5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKMedicalRecordComparisonFilter.m"), 112, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKMedicalRecordComparisonFilter;
    v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    switch(-[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue"))
    {
      case 0:
        objc_msgSend(v6, "modifiedDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[_HKMedicalRecordComparisonFilter _acceptsRecordWithDate:](self, "_acceptsRecordWithDate:", v7);
        goto LABEL_8;
      case 1:
        v10 = -[_HKMedicalRecordComparisonFilter _acceptsRecordWithManuallyEnteredIdentifier:](self, "_acceptsRecordWithManuallyEnteredIdentifier:", objc_msgSend(v6, "medicalRecordOriginType"));
        goto LABEL_10;
      case 2:
        objc_msgSend(v6, "sortDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[_HKMedicalRecordComparisonFilter _acceptsRecordWithDate:](self, "_acceptsRecordWithDate:", v11);

LABEL_8:
        goto LABEL_15;
      case 3:
        v10 = -[_HKMedicalRecordComparisonFilter _acceptsRecordWithState:](self, "_acceptsRecordWithState:", objc_msgSend(v6, "state"));
LABEL_10:
        v8 = v10;
        goto LABEL_15;
      case 4:
        v12 = (void *)MEMORY[0x1E0C99DA0];
        v13 = *MEMORY[0x1E0C99778];
        v14 = CFSTR("_KeyPathEnumValueUserDomainConcept does not support in-memory filtering");
        goto LABEL_13;
      case 5:
        v12 = (void *)MEMORY[0x1E0C99DA0];
        v13 = *MEMORY[0x1E0C99778];
        v14 = CFSTR("_KeyPathEnumValueSignedClinicalDataOriginIdentifier does not support in-memory filtering");
LABEL_13:
        objc_msgSend(v12, "raise:format:", v13, v14);
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKMedicalRecordComparisonFilter.m"), 140, CFSTR("Unreachable code has been executed"));

        break;
    }
    v8 = 0;
LABEL_15:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_acceptsRecordWithDate:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;

  v4 = a3;
  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[_HKComparisonFilter value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "date");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  v10 = objc_msgSend(v4, "compare:", v8);
  v11 = HKComparisonResultMatchesPredicateOperator(v10, -[_HKComparisonFilter operatorType](self, "operatorType"));

  return v11;
}

- (BOOL)_acceptsRecordWithManuallyEnteredIdentifier:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKCompareIntegers(a3, objc_msgSend(v5, "integerValue"));

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

- (BOOL)_acceptsRecordWithState:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKCompareIntegers(a3, objc_msgSend(v5, "integerValue"));

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

@end
