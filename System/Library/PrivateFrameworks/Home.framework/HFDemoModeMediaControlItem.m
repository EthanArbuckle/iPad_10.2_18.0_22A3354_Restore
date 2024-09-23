@implementation HFDemoModeMediaControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFDemoModeMediaControlItem)initWithDisplayResults:(id)a3
{
  id v4;
  HFNullValueSource *v5;
  HFSimpleAggregatedCharacteristicValueSource *v6;
  void *v7;
  HFSimpleAggregatedCharacteristicValueSource *v8;
  HFControlItemCharacteristicOptions *v9;
  HFDemoModeMediaControlItem *v10;
  objc_super v12;

  v4 = a3;
  v5 = objc_alloc_init(HFNullValueSource);
  v6 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:characteristics:primaryServiceDescriptor:](v6, "initWithValueSource:characteristics:primaryServiceDescriptor:", v5, v7, 0);

  v9 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v12.receiver = self;
  v12.super_class = (Class)HFDemoModeMediaControlItem;
  v10 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v12, sel_initWithValueSource_characteristicOptions_displayResults_, v8, v9, v4);

  if (v10)
    objc_storeStrong((id *)&v10->_mediaValueSource, v5);

  return v10;
}

- (HFDemoModeMediaControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDisplayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDemoModeMediaControlItem.m"), 51, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFDemoModeMediaControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc((Class)objc_opt_class());
  -[HFControlItem displayResults](self, "displayResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDisplayResults:", v6);

  return v7;
}

- (id)readValueAndPopulateStandardResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HFDemoModeMediaControlItem;
  -[HFControlItem readValueAndPopulateStandardResults](&v22, sel_readValueAndPopulateStandardResults);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeMediaControlItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("primaryDisplayState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = objc_msgSend(v10, "integerValue");
  if (v11 == 2)
    v12 = &unk_1EA7CC178;
  else
    v12 = &unk_1EA7CC190;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("value"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA7CC1A8, CFSTR("controlItemPurpose"));
  -[HFDemoModeMediaControlItem mediaValueSource](self, "mediaValueSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mediaProfileContainerForRouteID:", &stru_1EA741FF8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hf_serviceNameComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("serviceNameComponents"));
    objc_msgSend(v15, "composedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("title"));

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__HFDemoModeMediaControlItem_readValueAndPopulateStandardResults__block_invoke;
  v20[3] = &unk_1EA728350;
  v21 = v4;
  v17 = v4;
  objc_msgSend(v3, "flatMap:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __65__HFDemoModeMediaControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)characteristicValuesForValue:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary", a3);
}

- (id)valueForCharacteristicValues:(id)a3
{
  return &unk_1EA7CC1C0;
}

- (id)normalizedValueForValue:(id)a3
{
  return a3;
}

- (id)toggleValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[HFDemoModeMediaControlItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryDisplayState"));
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (void *)v5;
  else
    v6 = &unk_1EA7CC190;
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = objc_msgSend(v9, "integerValue");
  if (v10 == 1)
    v11 = &unk_1EA7CC178;
  else
    v11 = &unk_1EA7CC190;
  -[HFDemoModeMediaControlItem accessory](self, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applicationData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("primaryDisplayState"));

  +[HFDemoModeAccessoryManager sharedManager](HFDemoModeAccessoryManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeMediaControlItem accessory](self, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dispatchUpdateMessageForAccessory:", v15);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (HFNullValueSource)mediaValueSource
{
  return self->_mediaValueSource;
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_mediaValueSource, 0);
}

@end
