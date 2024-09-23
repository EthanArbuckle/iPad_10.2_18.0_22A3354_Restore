@implementation HKObjectType(HKAdditions)

- (id)hk_valueFormatterClassForUnit:()HKAdditions
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(a1, "code") == 256
    && (objc_msgSend(MEMORY[0x1E0CB6CD0], "_changeInDegreeCelsiusUnit"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "_isCompatibleWithUnit:", v5),
        v5,
        v6))
  {
    objc_opt_class();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "hk_valueFormatterClass");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)hk_valueFormatterClass
{
  objc_msgSend(a1, "code");
  objc_opt_class();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HKTimePeriodNumberFormatter)hk_numberFormatterForUnit:()HKAdditions decimalPrecisionRule:formattingContext:
{
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  HKTimePeriodNumberFormatter *v12;
  void *v13;
  int v14;
  __objc2_class *v15;
  HKTimePeriodNumberFormatter *v16;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(a1, "code");
  if (v10 > 137)
  {
    if (v10 <= 293)
    {
      if (v10 != 138)
      {
        if (v10 != 189)
        {
          if (v10 != 256)
            goto LABEL_26;
          objc_msgSend(MEMORY[0x1E0CB6CD0], "_changeInDegreeCelsiusUnit");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v8, "_isCompatibleWithUnit:", v13);

          if (!v14)
            goto LABEL_26;
          v15 = HKRelativeNumberFormatter;
          goto LABEL_24;
        }
LABEL_23:
        v15 = HKTimePeriodNumberFormatter;
LABEL_24:
        v16 = (HKTimePeriodNumberFormatter *)objc_alloc_init(v15);
        goto LABEL_25;
      }
    }
    else if ((unint64_t)(v10 - 294) >= 4)
    {
      goto LABEL_26;
    }
LABEL_21:
    if (a5 != 1)
      goto LABEL_26;
    v15 = HKNaturalScaleDistanceMeasurementFormatter;
    goto LABEL_24;
  }
  if (v10 <= 69)
  {
    if (v10 == 2)
    {
      if (_HeightFormatter_oncetoken[0] != -1)
        dispatch_once(_HeightFormatter_oncetoken, &__block_literal_global_62);
      v16 = (HKTimePeriodNumberFormatter *)(id)_HeightFormatter__heightFormatter;
LABEL_25:
      v12 = v16;
      if (v16)
        goto LABEL_27;
LABEL_26:
      objc_msgSend(v9, "numberFormatter");
      v12 = (HKTimePeriodNumberFormatter *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    if (v10 != 8)
    {
      if (v10 != 63)
        goto LABEL_26;
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  v11 = v10 - 70;
  if ((unint64_t)(v10 - 70) > 0x2B)
    goto LABEL_26;
  if (((1 << v11) & 0x90000002000) != 0)
    goto LABEL_21;
  if (((1 << v11) & 0x20000200) != 0)
    goto LABEL_23;
  if (v10 != 70)
    goto LABEL_26;
  v12 = objc_alloc_init(HKTimePeriodNumberFormatter);
  -[HKTimePeriodNumberFormatter setShouldRoundToHours:](v12, "setShouldRoundToHours:", 1);
  -[HKTimePeriodNumberFormatter setShouldShowDays:](v12, "setShouldShowDays:", 0);
  if (!v12)
    goto LABEL_26;
LABEL_27:

  return v12;
}

- (uint64_t)hk_numberFormatterForUnit:()HKAdditions decimalPrecisionRule:
{
  return objc_msgSend(a1, "hk_numberFormatterForUnit:decimalPrecisionRule:formattingContext:", a3, a4, 0);
}

- (id)hk_primaryMetadataKey
{
  uint64_t v1;
  id v2;
  id *v3;

  v1 = objc_msgSend(a1, "code");
  v2 = 0;
  if (v1 <= 146)
  {
    if (v1 == 14)
    {
      v3 = (id *)MEMORY[0x1E0CB54C0];
      goto LABEL_12;
    }
    if (v1 == 124)
    {
      v3 = (id *)MEMORY[0x1E0CB55F0];
      goto LABEL_12;
    }
    if (v1 != 140)
      return v2;
LABEL_9:
    v3 = (id *)MEMORY[0x1E0CB5520];
LABEL_12:
    v2 = *v3;
    return v2;
  }
  v3 = (id *)MEMORY[0x1E0CB54A8];
  if (v1 == 199 || v1 == 178)
    goto LABEL_12;
  if (v1 == 147)
    goto LABEL_9;
  return v2;
}

- (id)hk_secondaryMetadataKey
{
  uint64_t v1;
  id *v2;

  v1 = objc_msgSend(a1, "code");
  v2 = (id *)MEMORY[0x1E0CB7248];
  if (v1 == 178 || v1 == 199)
    return *v2;
  if (v1 == 236)
  {
    v2 = (id *)MEMORY[0x1E0CB5570];
    return *v2;
  }
  return 0;
}

- (id)hk_metadataValueDisplayTypeInStore:()HKAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(a1, "code");
  if (v5 <= 198)
  {
    if (v5 == 140 || v5 == 147)
    {
      v6 = (void *)MEMORY[0x1E0CB6A70];
      v7 = (_QWORD *)MEMORY[0x1E0CB5CB0];
      goto LABEL_16;
    }
    if (v5 == 178)
    {
      v6 = (void *)MEMORY[0x1E0CB6A70];
      v7 = (_QWORD *)MEMORY[0x1E0CB5C78];
      goto LABEL_16;
    }
LABEL_18:
    v8 = a1;
    goto LABEL_17;
  }
  if (v5 > 249)
  {
    if (v5 == 250)
    {
      v6 = (void *)MEMORY[0x1E0CB6A70];
      v7 = (_QWORD *)MEMORY[0x1E0CB5A70];
      goto LABEL_16;
    }
    if (v5 == 276)
    {
      v6 = (void *)MEMORY[0x1E0CB6A70];
      v7 = (_QWORD *)MEMORY[0x1E0CB5A60];
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  if (v5 == 199)
  {
    v6 = (void *)MEMORY[0x1E0CB6A70];
    v7 = (_QWORD *)MEMORY[0x1E0CB5CA8];
    goto LABEL_16;
  }
  if (v5 != 236)
    goto LABEL_18;
  v6 = (void *)MEMORY[0x1E0CB6A70];
  v7 = (_QWORD *)MEMORY[0x1E0CB5DA0];
LABEL_16:
  objc_msgSend(v6, "quantityTypeForIdentifier:", *v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
  v9 = v8;
  +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayTypeForObjectType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)hk_formatPrimaryMetadataValueForObject:()HKAdditions unitPreferencesController:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "hk_primaryMetadataKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hk_formatMetadataValueForMetadataKey:object:unitPreferenceController:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hk_formatSecondaryMetadataValueForObject:()HKAdditions unitPreferencesController:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "hk_secondaryMetadataKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hk_formatMetadataValueForMetadataKey:object:unitPreferenceController:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_hk_formatMetadataValueForMetadataKey:()HKAdditions object:unitPreferenceController:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "healthStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_metadataValueDisplayTypeInStore:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v8 && v12)
  {
    objc_msgSend(v9, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "hk_formatMetadataValue:displayType:unitPreferencesController:", v15, v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)hk_formatMetadataValue:()HKAdditions displayType:unitPreferencesController:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    objc_msgSend(v9, "unitForDisplayType:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "doubleValueForUnit:", v11);
    v14 = v13;

    objc_msgSend(v12, "numberWithDouble:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "adjustedValueForDaemonValue:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "hk_valueFormatterForUnit:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringFromValue:displayType:unitController:", v17, v8, v9);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v7;
      objc_msgSend(v8, "presentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "adjustedValueForDaemonValue:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "stringValue");
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v7;
      else
        v19 = 0;
    }
  }

  return v19;
}

@end
