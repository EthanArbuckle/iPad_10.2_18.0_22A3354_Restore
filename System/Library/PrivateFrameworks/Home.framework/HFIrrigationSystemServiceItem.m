@implementation HFIrrigationSystemServiceItem

- (id)servicesToReadForCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFIrrigationSystemServiceItem;
  v4 = a3;
  -[HFServiceItem servicesToReadForCharacteristicType:](&v11, sel_servicesToReadForCharacteristicType_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8790], v11.receiver, v11.super_class);

  if (v6)
  {
    -[HFServiceItem service](self, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_childServicesOfType:", *MEMORY[0x1E0CB9B08]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_setByRemovingObjectsFromSet:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return v5;
}

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
  v5 = *MEMORY[0x1E0CB8900];
  v14[0] = *MEMORY[0x1E0CB8790];
  v14[1] = v5;
  v14[2] = *MEMORY[0x1E0CB89D0];
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
  v13[2] = __61__HFIrrigationSystemServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_1EA726480;
  v13[4] = self;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A50]);
}

- (id)createControlItemsWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HFChildServiceControlItem *v8;
  void *v9;
  void *v10;
  HFChildServiceControlItem *v11;
  void *v12;

  -[HFIrrigationSystemServiceItem _childValveServiceFilter](self, "_childValveServiceFilter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredChildServicesForParentService:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = [HFChildServiceControlItem alloc];
    -[HFServiceItem valueSource](self, "valueSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceItem service](self, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFChildServiceControlItem initWithBaseValueSource:parentService:childServiceFilter:displayResults:](v8, "initWithBaseValueSource:parentService:childServiceFilter:displayResults:", v9, v10, v4, 0);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_childValveServiceFilter
{
  HFChildServiceFilter *v2;
  void *v3;
  HFChildServiceFilter *v4;

  v2 = [HFChildServiceFilter alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9B08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFChildServiceFilter initWithChildServiceTypes:](v2, "initWithChildServiceTypes:", v3);

  return v4;
}

id __61__HFIrrigationSystemServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a2, "standardResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA7CC0A0, CFSTR("controlSummaryStyle"));
  objc_msgSend(*(id *)(a1 + 32), "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_childServicesOfType:", *MEMORY[0x1E0CB9B08]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "_childValveServiceFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredChildServicesForParentService:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescription.IrrigationSystem, NoValvesConfigured, Context:Control"), CFSTR("HFServiceDescription.IrrigationSystem, NoValvesConfigured, Context:Control"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("controlDescription"));
LABEL_5:

  }
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v4);
  v11 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
