@implementation HFInputSourceServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A48]);
}

- (id)createControlItemsWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  HFPrimaryStateControlItem *v6;
  HFPrimaryStateControlItem *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueTransformer transformerForValueClass:transformBlock:reverseTransformBlock:](HFValueTransformer, "transformerForValueClass:transformBlock:reverseTransformBlock:", objc_opt_class(), &__block_literal_global_151, &__block_literal_global_6_8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("controlItemPurpose");
  v11[0] = &unk_1EA7CC8B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HFPrimaryStateControlItem alloc];
  v7 = -[HFPrimaryStateControlItem initWithValueSource:characteristicType:valueTransformer:displayResults:](v6, "initWithValueSource:characteristicType:valueTransformer:displayResults:", v3, *MEMORY[0x1E0CB8B18], v4, v5);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __58__HFInputSourceServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (!a2)
    return &unk_1EA7CC880;
  if (objc_msgSend(a2, "integerValue"))
    v2 = 1;
  else
    v2 = 2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __58__HFInputSourceServiceItem_createControlItemsWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "isEqualToNumber:", &unk_1EA7CC898) ^ 1);
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB8918];
  v6 = *MEMORY[0x1E0CB88A0];
  v7 = *MEMORY[0x1E0CB8B18];
  v8 = a3;
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__HFInputSourceServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_1EA726480;
  v13[4] = self;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __56__HFInputSourceServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8918]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v3, "readResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "responseForCharacteristicType:", *MEMORY[0x1E0CB8B18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "readResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "responseForCharacteristicType:", *MEMORY[0x1E0CB88A0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "valueWithExpectedClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C9AAA0];
  v13 = MEMORY[0x1E0C9AAB0];
  if (v9)
  {
    objc_msgSend(v9, "characteristic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hf_isWritable");

    v16 = MEMORY[0x1E0C9AAA0];
    if (v15 && !objc_msgSend(v35, "isEqualToNumber:", &unk_1EA7CC8C8))
      v16 = v13;
  }
  else
  {
    v16 = MEMORY[0x1E0C9AAA0];
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("HFInputSourceCanHideKey"));
  objc_msgSend(*(id *)(a1 + 32), "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isNameModifiable"))
    v18 = v12;
  else
    v18 = v13;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("isDisabled"));

  objc_msgSend(*(id *)(a1 + 32), "service");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "configurationState");

  if (v20 == 3 && v5)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suspendedState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    if (objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_isSuspendedStateSuspended:", v22))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isDisabled"));
    v23 = *(void **)(a1 + 32);
    objc_msgSend(v5, "characteristic");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v34;
    objc_msgSend(v23, "controlDescriptionForCharacteristic:withValue:", v24, v34);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("description"));

    v27 = *(void **)(a1 + 32);
    objc_msgSend(v5, "characteristic");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "descriptionForCharacteristic:withValue:", v28, v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("controlDescription"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("hidden"));
    v25 = (void *)v34;
  }

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA7CC8E0, CFSTR("controlSummaryStyle"));
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v7);
  v30 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "futureWithResult:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

@end
