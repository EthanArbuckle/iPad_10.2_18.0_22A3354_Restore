@implementation HFValveServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9B08]);
}

- (id)createControlItemsWithOptions:(id)a3
{
  id v4;
  uint64_t v5;
  HFPrimaryStateControlItem *v6;
  void *v7;
  void *v8;
  HFSimpleIncrementalControlItem *v9;
  HFSimpleIncrementalControlItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HFSimpleAggregatedCharacteristicValueSource *v19;
  void *v20;
  void *v21;
  void *v22;
  HFSimpleAggregatedCharacteristicValueSource *v23;
  HFValveActiveStateControlItem *v24;
  void *v25;
  HFPrimaryStateControlItem *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  HFValveServiceItem *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  const __CFString *v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v5 = objc_claimAutoreleasedReturnValue();
  +[HFValueTransformer transformerForValueClass:transformBlock:reverseTransformBlock:](HFValueTransformer, "transformerForValueClass:transformBlock:reverseTransformBlock:", objc_opt_class(), &__block_literal_global_75, &__block_literal_global_5_4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = CFSTR("controlItemPurpose");
  v37[0] = &unk_1EA7CC130;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HFPrimaryStateControlItem alloc];
  v28 = (void *)v5;
  v27 = -[HFPrimaryStateControlItem initWithValueSource:characteristicType:valueTransformer:displayResults:](v6, "initWithValueSource:characteristicType:valueTransformer:displayResults:", v5, *MEMORY[0x1E0CB8918], v30, v29);
  v34[0] = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicGroupTitleSetDuration"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = CFSTR("controlItemPurpose");
  v35[0] = v7;
  v35[1] = &unk_1EA7CC130;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [HFSimpleIncrementalControlItem alloc];
  v10 = -[HFSimpleIncrementalControlItem initWithValueSource:characteristicType:displayResults:](v9, "initWithValueSource:characteristicType:displayResults:", v5, *MEMORY[0x1E0CB8A28], v8);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFControlTitleFaucetActive"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("title"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1EA7CC148, CFSTR("controlItemPurpose"));
  -[HFServiceItem service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hf_parentService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __52__HFValveServiceItem_createControlItemsWithOptions___block_invoke_17;
  v31[3] = &unk_1EA730EA8;
  v32 = v14;
  v33 = self;
  v16 = v14;
  __52__HFValveServiceItem_createControlItemsWithOptions___block_invoke_17((uint64_t)v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  -[HFServiceItem valueSource](self, "valueSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hf_serviceDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:services:primaryServiceDescriptor:](v19, "initWithValueSource:services:primaryServiceDescriptor:", v20, v18, v22);

  v24 = -[HFValveActiveStateControlItem initWithValueSource:displayResults:]([HFValveActiveStateControlItem alloc], "initWithValueSource:displayResults:", v23, v11);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v24, v27, v10, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id __52__HFValveServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (!a2)
    return &unk_1EA7CC100;
  if (objc_msgSend(a2, "integerValue") == 1)
    v2 = 2;
  else
    v2 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __52__HFValveServiceItem_createControlItemsWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "isEqualToNumber:", &unk_1EA7CC118));
}

id __52__HFValveServiceItem_createControlItemsWithOptions___block_invoke_17(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2
    && (objc_msgSend(v2, "serviceType"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A50]),
        v3,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v13 = v5;
    v14 = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v13;
    v9 = 2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v12;
    v9 = 1;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB8918];
  v6 = a3;
  objc_msgSend(v4, "setWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__HFValveServiceItem__subclass_updateWithOptions___block_invoke;
  v11[3] = &unk_1EA726480;
  v11[4] = self;
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __50__HFValveServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8918]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  if (v6 && !objc_msgSend(v6, "integerValue"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("description"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v5, "characteristic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "controlDescriptionForCharacteristic:withValue:", v11, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("description"));

    }
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v5, "characteristic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "descriptionForCharacteristic:withValue:", v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("controlDescription"));

    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isDisabled"));
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1EA7CC160, CFSTR("controlSummaryStyle"));
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v8);
  v16 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "futureWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)containsActions
{
  return 0;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
