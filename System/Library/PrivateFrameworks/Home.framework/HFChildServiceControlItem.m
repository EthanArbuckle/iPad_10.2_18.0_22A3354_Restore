@implementation HFChildServiceControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFChildServiceControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithBaseValueSource_parentService_childServiceFilter_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFChildServiceControlItem.m"), 48, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFChildServiceControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (HFChildServiceControlItem)initWithBaseValueSource:(id)a3 parentService:(id)a4 childServiceFilter:(id)a5 displayResults:(id)a6
{
  id v11;
  HFChildServiceFilter *v12;
  id v13;
  id v14;
  HFControlItemCharacteristicOptions *v15;
  HFSimpleAggregatedCharacteristicValueSource *v16;
  void *v17;
  void *v18;
  HFSimpleAggregatedCharacteristicValueSource *v19;
  HFChildServiceControlItem *v20;
  HFChildServiceFilter *v21;
  objc_super v23;

  v11 = a4;
  v12 = (HFChildServiceFilter *)a5;
  v13 = a6;
  v14 = a3;
  v15 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v16 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  objc_msgSend(v11, "hf_childServices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_serviceDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:services:primaryServiceDescriptor:](v16, "initWithValueSource:services:primaryServiceDescriptor:", v14, v17, v18);

  v23.receiver = self;
  v23.super_class = (Class)HFChildServiceControlItem;
  v20 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v23, sel_initWithValueSource_characteristicOptions_displayResults_, v19, v15, v13);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_parentService, a4);
    v21 = v12;
    if (!v12)
      v21 = -[HFChildServiceFilter initWithChildServiceTypes:]([HFChildServiceFilter alloc], "initWithChildServiceTypes:", 0);
    objc_storeStrong((id *)&v20->_childServiceFilter, v21);
    if (!v12)

  }
  return v20;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v5, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFChildServiceControlItem parentService](self, "parentService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFChildServiceControlItem childServiceFilter](self, "childServiceFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem displayResults](self, "displayResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithBaseValueSource:parentService:childServiceFilter:displayResults:", v7, v8, v9, v10);

  objc_msgSend(v11, "copyLatestResultsFromItem:", self);
  return v11;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v4;
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
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];

  v4 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke;
  v21[3] = &unk_1EA72FC10;
  v21[4] = self;
  __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke((uint64_t)v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HFCharacteristicBatchReadResponse alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFCharacteristicBatchReadResponse initWithReadResponses:contextProvider:](v6, "initWithReadResponses:contextProvider:", v7, 0);
  -[HFControlItem resultsForBatchReadResponse:](self, "resultsForBatchReadResponse:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, CFSTR("childServices"));
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke_2;
  v18[3] = &unk_1EA72FC38;
  v19 = v10;
  v20 = v5;
  v11 = v5;
  v12 = v10;
  __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke_2((uint64_t)v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("dependentHomeKitObjects"));

  v14 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "childServiceFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "childServiceFilter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parentService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredChildServicesForParentService:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "parentService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_childServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id __57__HFChildServiceControlItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
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
  char v6;

  v4 = a3;
  -[HFChildServiceControlItem parentService](self, "parentService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (HMService)parentService
{
  return self->_parentService;
}

- (HFChildServiceFilter)childServiceFilter
{
  return self->_childServiceFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childServiceFilter, 0);
  objc_storeStrong((id *)&self->_parentService, 0);
}

@end
