@implementation HKCharacteristicType

- (id)_canoncialUnit
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[HKObjectType code](self, "code");
  if ((unint64_t)(v2 - 84) < 2)
  {
    v3 = CFSTR("kg");
  }
  else if ((unint64_t)(v2 - 175) >= 2)
  {
    if (v2 != 86)
      return 0;
    v3 = CFSTR("m");
  }
  else
  {
    v3 = CFSTR("d");
  }
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HKCharacteristicType)initWithIdentifier:(id)a3
{
  id v4;
  HKCharacteristicType *v5;

  v4 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", v4);
  v5 = (HKCharacteristicType *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid %@ identifier \"%@\"), objc_opt_class(), v4);

  return v5;
}

- (BOOL)_validateCharacteristic:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  char v9;
  const __CFString *v10;
  BOOL v11;
  HKCharacteristicType *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  unint64_t v28;
  HKCharacteristicType *v29;
  uint64_t v30;

  v7 = a3;
  if (v7)
  {
    v8 = -[HKObjectType code](self, "code");
    if (v8 > 174)
    {
      if ((unint64_t)(v8 - 175) < 2)
      {
        v10 = CFSTR("d");
        goto LABEL_15;
      }
      if (v8 == 218)
      {
        v12 = (HKCharacteristicType *)v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v13 = objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid cardio fitness medications use type %@, expected parameter of class %@"), v12, objc_opt_class());
          goto LABEL_16;
        }
        v28 = -[HKCharacteristicType unsignedIntegerValue](v12, "unsignedIntegerValue");
        if (v28 < 4)
        {
          v11 = 1;
          goto LABEL_34;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid %@: %d"), CFSTR("_HKDataTypeCardioFitnessMedicationsUse"), v28);
LABEL_47:
        v11 = 0;
        goto LABEL_34;
      }
      if (v8 != 177)
      {
LABEL_39:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("self"), objc_opt_class(), a2, CFSTR("Unhandled data type code %ld"), -[HKObjectType code](self, "code"));
        v29 = (HKCharacteristicType *)(id)objc_claimAutoreleasedReturnValue();
        v12 = v29;
        if (v29)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v29);
          else
            _HKLogDroppedError(v29);
        }

        goto LABEL_47;
      }
    }
    else
    {
      v9 = v8 - 66;
      if ((unint64_t)(v8 - 66) <= 0x25)
      {
        if (((1 << v9) & 0x2000400001) != 0)
          goto LABEL_22;
        if (((1 << v9) & 0xC0000) != 0)
        {
          v10 = CFSTR("kg");
LABEL_15:
          +[HKUnit unitFromString:](HKUnit, "unitFromString:", v10);
          v12 = (HKCharacteristicType *)objc_claimAutoreleasedReturnValue();
          v13 = _HDValidatePositiveQuantityValue(self, v7, v12, a4);
LABEL_16:
          v11 = v13;
LABEL_34:

          goto LABEL_35;
        }
        if (v8 == 86)
        {
          v10 = CFSTR("m");
          goto LABEL_15;
        }
      }
      if (v8 != 64)
      {
        if (v8 == 65)
        {
          v12 = self;
          v14 = v7;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "calendar");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "calendarIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C996C8]);

            if ((v17 & 1) == 0)
            {
              v18 = (void *)MEMORY[0x1E0CB35C8];
              v19 = objc_opt_class();
              -[HKObjectType identifier](v12, "identifier");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              v22 = CFSTR("Invalid value %@ for %@: date components must specify a Gregorian calendar");
LABEL_27:
              objc_msgSend(v18, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("value"), v19, sel__validateCharacteristic_error_, v22, v14, v20, v30);
              goto LABEL_28;
            }
            goto LABEL_24;
          }
          goto LABEL_25;
        }
        goto LABEL_39;
      }
    }
LABEL_22:
    v12 = self;
    v14 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!HKCharacteristicTypeAcceptsValue(-[HKObjectType code](v12, "code"), objc_msgSend(v14, "integerValue")))
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v19 = objc_opt_class();
        -[HKObjectType identifier](v12, "identifier");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        v22 = CFSTR("Invalid value %@ for %@");
        goto LABEL_27;
      }
LABEL_24:
      v11 = 1;
LABEL_33:

      goto LABEL_34;
    }
LABEL_25:
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = objc_opt_class();
    -[HKObjectType identifier](v12, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("value"), v24, sel__validateCharacteristic_error_, CFSTR("Invalid value %@ for %@: expected parameter of class %@"), v14, v21, objc_opt_class());
LABEL_28:
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if (a4)
      {
        v26 = objc_retainAutorelease(v25);
        *a4 = v26;
      }
      else
      {
        _HKLogDroppedError(v25);
      }
    }

    v11 = 0;
    goto LABEL_33;
  }
  v11 = 1;
LABEL_35:

  return v11;
}

- (id)_relatedQuantityType
{
  int64_t v2;
  void *v3;

  v2 = -[HKObjectType code](self, "code");
  if ((unint64_t)(v2 - 84) > 2)
  {
    v3 = 0;
  }
  else
  {
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", *off_1E37F62C0[v2 - 84]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_relatedCategoryType
{
  int64_t v2;
  uint64_t v3;
  void *v4;

  v2 = -[HKObjectType code](self, "code");
  if (v2 == 177)
  {
    v3 = 190;
  }
  else
  {
    if (v2 != 103)
    {
      v4 = 0;
      return v4;
    }
    v3 = 112;
  }
  +[HKObjectType dataTypeWithCode:](HKObjectType, "dataTypeWithCode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)_relatedSampleForInsertionWithCharacteristicValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v5 = a3;
  if (v5)
  {
    -[HKCharacteristicType _relatedQuantityType](self, "_relatedQuantityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCharacteristicType+HKAdditions.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[characteristic isKindOfClass:[HKQuantity class]]"));

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:", v6, v5, v7, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HKCharacteristicType _relatedCategoryType](self, "_relatedCategoryType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCharacteristicType+HKAdditions.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[characteristic isKindOfClass:[NSNumber class]]"));

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKCategorySample categorySampleWithType:value:startDate:endDate:](HKCategorySample, "categorySampleWithType:value:startDate:endDate:", v7, objc_msgSend(v5, "longValue"), v9, v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
