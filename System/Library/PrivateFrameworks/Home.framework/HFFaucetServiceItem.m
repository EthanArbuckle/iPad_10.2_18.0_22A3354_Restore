@implementation HFFaucetServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A18]);
}

- (BOOL)_shouldSubsumeValveInOverallActiveState
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HFServiceItem service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_childServicesOfType:", *MEMORY[0x1E0CB9B08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") < 2;

  return v4;
}

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
  v11.super_class = (Class)HFFaucetServiceItem;
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

- (id)createControlItemsWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  HFChildServiceFilter *v17;
  void *v18;
  HFChildServiceFilter *v19;
  HFChildServiceControlItem *v20;
  void *v21;
  void *v22;
  HFChildServiceControlItem *v23;
  void *v24;
  HFFaucetActiveStateControlItem *v25;
  void *v26;
  void *v27;
  HFFaucetActiveStateControlItem *v28;
  HFHeaterCoolerThresholdControlItem *v29;
  void *v30;
  void *v31;
  HFHeaterCoolerThresholdControlItem *v32;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_childServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global_15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E20];
  -[HFServiceItem service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "na_safeAddObject:", v9);
  -[HFServiceItem service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CB9B08];
  objc_msgSend(v13, "hf_childServicesOfType:", *MEMORY[0x1E0CB9B08]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unionSet:", v15);

  if (-[HFFaucetServiceItem _shouldSubsumeValveInOverallActiveState](self, "_shouldSubsumeValveInOverallActiveState"))
  {
    v16 = 0;
  }
  else
  {
    v17 = [HFChildServiceFilter alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HFChildServiceFilter initWithChildServiceTypes:](v17, "initWithChildServiceTypes:", v18);

    v20 = [HFChildServiceControlItem alloc];
    -[HFServiceItem valueSource](self, "valueSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceItem service](self, "service");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HFChildServiceControlItem initWithBaseValueSource:parentService:childServiceFilter:displayResults:](v20, "initWithBaseValueSource:parentService:childServiceFilter:displayResults:", v21, v22, v19, 0);

    objc_msgSend(v6, "na_safeAddObject:", v23);
    v16 = 1;
  }
  -[HFServiceItem controlItemValueSourceForServices:](self, "controlItemValueSourceForServices:", v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = [HFFaucetActiveStateControlItem alloc];
  v36 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlTitleFaucetActive"), v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HFFaucetActiveStateControlItem initWithValueSource:valveControlMode:displayResults:](v25, "initWithValueSource:valveControlMode:displayResults:", v24, v16, v27);
  objc_msgSend(v6, "addObject:", v28);

  v29 = [HFHeaterCoolerThresholdControlItem alloc];
  v34 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlTitleFaucetTemperature"), v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[HFHeaterCoolerThresholdControlItem initWithValueSource:displayResults:](v29, "initWithValueSource:displayResults:", v24, v31);

  objc_msgSend(v6, "na_safeAddObject:", v32);
  return v6;
}

uint64_t __53__HFFaucetServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A30]);

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HFFaucetServiceItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_1EA726480;
  v10[4] = self;
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __51__HFFaucetServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "standardResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA7CB890, CFSTR("controlSummaryStyle"));
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v4);
  v5 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
