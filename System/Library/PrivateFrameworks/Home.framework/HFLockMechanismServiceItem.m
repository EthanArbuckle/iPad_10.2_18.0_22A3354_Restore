@implementation HFLockMechanismServiceItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB8AE0];
  v14[0] = *MEMORY[0x1E0CB8868];
  v14[1] = v5;
  v14[2] = *MEMORY[0x1E0CB8980];
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__HFLockMechanismServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_1EA726480;
  v13[4] = self;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __60__HFLockMechanismServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v2 = (void *)MEMORY[0x1E0CB37E8];
    v3 = objc_msgSend(a2, "integerValue");
    if (v3 > 3)
      v4 = 0;
    else
      v4 = qword_1DD669A58[v3];
    objc_msgSend(v2, "numberWithInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_1EA7CCFE8;
  }
  return v5;
}

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A80]);
}

id __58__HFLockMechanismServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AE0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8868]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v9)
  {
    v31 = v4;
    v12 = objc_msgSend(v9, "integerValue");
    v32 = v6;
    v30 = objc_msgSend(v6, "integerValue");
    v13 = a1;
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v15 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "descriptionForCharacteristic:withValue:", v15, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v34 = v13;
    v18 = *(void **)(v13 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v15;
    objc_msgSend(v18, "controlDescriptionForCharacteristic:withValue:", v15, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "displayMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "transitioningPrimaryState");

    if (!v22)
    {
      v4 = v31;
      v6 = v32;
      if (v17)
        goto LABEL_13;
      goto LABEL_15;
    }
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isInStateTransition"));
    if (v12 || v30 != 1)
    {
      if (v12 != 1)
      {
        v4 = v31;
        v6 = v32;
LABEL_12:
        v17 = v17;

        v20 = v17;
        if (v17)
        {
LABEL_13:
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("description"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("description"));
        }
LABEL_15:
        objc_msgSend(v11, "na_safeSetObject:forKey:", v20, CFSTR("controlDescription"));

        v8 = v33;
        a1 = v34;
        goto LABEL_16;
      }
      v4 = v31;
      v6 = v32;
      if (v30)
        goto LABEL_12;
      v23 = CFSTR("HFCharacteristicValueLockMechanismStateUnlocking");
    }
    else
    {
      v23 = CFSTR("HFCharacteristicValueLockMechanismStateLocking");
      v4 = v31;
      v6 = v32;
    }
    _HFLocalizedStringWithDefaultValue(v23, v23, 1);
    v24 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v24;
    goto LABEL_12;
  }
LABEL_16:
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v11);
  v26 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "futureWithResult:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)createControlItemsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HFPrimaryStateControlItem *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HFPrimaryStateControlItem *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueTransformer transformerForValueClass:transformBlock:reverseTransformBlock:](HFValueTransformer, "transformerForValueClass:transformBlock:reverseTransformBlock:", objc_opt_class(), &__block_literal_global_179, &__block_literal_global_5_11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = [HFPrimaryStateControlItem alloc];
  v9 = *MEMORY[0x1E0CB8AE0];
  v15[0] = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleLockState"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = CFSTR("actionRequiresDeviceUnlock");
  v16[0] = v10;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFPrimaryStateControlItem initWithValueSource:characteristicType:valueTransformer:displayResults:](v8, "initWithValueSource:characteristicType:valueTransformer:displayResults:", v5, v9, v6, v11);
  objc_msgSend(v7, "setWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __60__HFLockMechanismServiceItem_createControlItemsWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = objc_msgSend(a2, "integerValue");
  if (v3)
    v4 = v3 == 1;
  else
    v4 = 3;
  return objc_msgSend(v2, "numberWithInteger:", v4);
}

@end
