@implementation _HKElectrocardiogramComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ecg_average_heart_rate")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("ecg_public_classification")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("ecg_private_classification")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ecg_symptoms_status"));
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
  id v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_average_heart_rate")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
  }
  else
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_public_classification")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_private_classification")) & 1) == 0
      && !objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_symptoms_status")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKElectrocardiogramComparisonFilter.m"), 77, CFSTR("Unreachable code has been executed"));

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

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_public_classification")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_private_classification")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_symptoms_status")))
  {
    v6 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else
  {
    v6 = +[_HKComparisonFilter isAllowedPredicateOperatorType:forKeyPath:](_HKComparisonFilter, "isAllowedPredicateOperatorType:forKeyPath:", a3, v5);
  }

  return v6;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  char v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKElectrocardiogramComparisonFilter;
  if (objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5))
    v9 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_42);
  else
    v9 = 0;

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  BOOL IsValid;
  BOOL v19;
  BOOL v20;
  void *v21;
  void *v22;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS____HKElectrocardiogramComparisonFilter;
  if (!objc_msgSendSuper2(&v24, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, a6, a7))goto LABEL_15;
  v14 = v12;
  v15 = v13;
  if (!objc_msgSend(v15, "isEqualToString:", CFSTR("ecg_average_heart_rate")))
  {
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("ecg_public_classification")))
    {
      IsValid = _HKECGCPublicClassificationIsValid(objc_msgSend(v14, "integerValue"));
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("ecg_private_classification")))
    {
      IsValid = _HKECGCPrivateClassificationIsValid(objc_msgSend(v14, "integerValue"));
    }
    else
    {
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ecg_symptoms_status")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _IsValidValue(id  _Nullable __strong, NSString * _Nonnull __strong)");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("_HKElectrocardiogramComparisonFilter.m"), 47, CFSTR("Unreachable code has been executed"));

        goto LABEL_14;
      }
      IsValid = _HKECGSymptomsStatusIsValid(objc_msgSend(v14, "integerValue"));
    }
    v19 = IsValid;

    if (v19)
      goto LABEL_12;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a7, 3, CFSTR("Invalid value '%@' for %@"), v14, v15);
LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  +[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isCompatibleWithUnit:", v16);

  if ((v17 & 1) == 0)
    goto LABEL_14;
LABEL_12:
  v20 = 1;
LABEL_16:

  return v20;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_average_heart_rate")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_public_classification")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_private_classification")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ecg_symptoms_status")) & 1) != 0)
  {
    v6 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKElectrocardiogramComparisonFilter.m"), 139, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKElectrocardiogramComparisonFilter;
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

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    switch(-[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue"))
    {
      case 0:
        objc_msgSend(v6, "averageHeartRate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[_HKElectrocardiogramComparisonFilter _acceptsECGWithAverageHeartRate:](self, "_acceptsECGWithAverageHeartRate:", v7);

        break;
      case 1:
        v10 = -[_HKElectrocardiogramComparisonFilter _acceptsECGWithPublicClassification:](self, "_acceptsECGWithPublicClassification:", objc_msgSend(v6, "classification"));
        goto LABEL_9;
      case 2:
        v10 = -[_HKElectrocardiogramComparisonFilter _acceptsECGWithPrivateClassification:](self, "_acceptsECGWithPrivateClassification:", objc_msgSend(v6, "privateClassification"));
        goto LABEL_9;
      case 3:
        v10 = -[_HKElectrocardiogramComparisonFilter _acceptsECGWithSymptomsStatus:](self, "_acceptsECGWithSymptomsStatus:", objc_msgSend(v6, "symptomsStatus"));
LABEL_9:
        v8 = v10;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKElectrocardiogramComparisonFilter.m"), 161, CFSTR("Unreachable code has been executed"));

        v8 = 0;
        break;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_acceptsECGWithPublicClassification:(int64_t)a3
{
  void *v5;
  unint64_t v6;

  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKCompareIntegers(a3, objc_msgSend(v5, "integerValue"));

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

- (BOOL)_acceptsECGWithAverageHeartRate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

- (BOOL)_acceptsECGWithPrivateClassification:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKCompareIntegers(a3, objc_msgSend(v5, "integerValue"));

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

- (BOOL)_acceptsECGWithSymptomsStatus:(int64_t)a3
{
  void *v5;
  unint64_t v6;

  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKCompareIntegers(a3, objc_msgSend(v5, "integerValue"));

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

@end
