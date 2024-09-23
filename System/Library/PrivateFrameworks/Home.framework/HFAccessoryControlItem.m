@implementation HFAccessoryControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFAccessoryControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_parentAccessory_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryControlItem.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (HFAccessoryControlItem)initWithValueSource:(id)a3 parentAccessory:(id)a4 displayResults:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFControlItemCharacteristicOptions *v12;
  HFSimpleAggregatedCharacteristicValueSource *v13;
  void *v14;
  void *v15;
  void *v16;
  HFSimpleAggregatedCharacteristicValueSource *v17;
  HFAccessoryControlItem *v18;
  objc_super v20;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v13 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  objc_msgSend(v9, "hf_visibleServices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_primaryService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_serviceDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:services:primaryServiceDescriptor:](v13, "initWithValueSource:services:primaryServiceDescriptor:", v11, v14, v16);

  v20.receiver = self;
  v20.super_class = (Class)HFAccessoryControlItem;
  v18 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v20, sel_initWithValueSource_characteristicOptions_displayResults_, v17, v12, v10);

  if (v18)
    objc_storeStrong((id *)&v18->_accessory, a4);

  return v18;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  HFAccessoryControlItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HFAccessoryControlItem *v10;

  v5 = [HFAccessoryControlItem alloc];
  -[HFControlItem valueSource](self, "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryControlItem accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem displayResults](self, "displayResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFAccessoryControlItem initWithValueSource:parentAccessory:displayResults:](v5, "initWithValueSource:parentAccessory:displayResults:", v7, v8, v9);

  -[HFItem copyLatestResultsFromItem:](v10, "copyLatestResultsFromItem:", self);
  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  HFCharacteristicBatchReadResponse *v6;
  void *v7;
  HFCharacteristicBatchReadResponse *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;

  -[HFAccessoryControlItem accessory](self, "accessory", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_visibleServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [HFCharacteristicBatchReadResponse alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFCharacteristicBatchReadResponse initWithReadResponses:contextProvider:](v6, "initWithReadResponses:contextProvider:", v7, 0);
  -[HFControlItem resultsForBatchReadResponse:](self, "resultsForBatchReadResponse:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __54__HFAccessoryControlItem__subclass_updateWithOptions___block_invoke;
  v25 = &unk_1EA72FC38;
  v11 = v10;
  v26 = v11;
  v12 = v5;
  v27 = v12;
  __54__HFAccessoryControlItem__subclass_updateWithOptions___block_invoke((uint64_t)&v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("dependentHomeKitObjects"), v22, v23, v24, v25);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("actionRequiresDeviceUnlock"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "BOOLValue") & 1) != 0)
    v16 = 1;
  else
    v16 = objc_msgSend(v12, "na_any:", &__block_literal_global_171);
  objc_msgSend(v14, "numberWithInt:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("actionRequiresDeviceUnlock"));

  v18 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "futureWithResult:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id __54__HFAccessoryControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_msgSend(v2, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "mutableCopy");

  }
  objc_msgSend(v4, "unionSet:", *(_QWORD *)(a1 + 40));
  return v4;
}

uint64_t __54__HFAccessoryControlItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_requiresDeviceUnlock");
}

- (id)valueForCharacteristicValues:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3);
}

- (id)characteristicValuesForValue:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)normalizedValueForValue:(id)a3
{
  return a3;
}

- (BOOL)supportsItemRepresentingServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HFAccessoryControlItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_visibleServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isSubsetOfSet:", v6);

  return v7;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
