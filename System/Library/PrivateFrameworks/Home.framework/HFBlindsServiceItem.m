@implementation HFBlindsServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9B30]);
}

- (id)createControlItemsWithOptions:(id)a3
{
  void *v4;
  void *v5;
  HFSimpleIncrementalControlItem *v6;
  HFSimpleIncrementalControlItem *v7;
  HFSimpleIncrementalControlItem *v8;
  HFSimpleIncrementalControlItem *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HFBlindsServiceItem;
  -[HFDoorServiceItem createControlItemsWithOptions:](&v12, sel_createControlItemsWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HFSimpleIncrementalControlItem alloc];
  v7 = -[HFSimpleIncrementalControlItem initWithValueSource:characteristicType:displayResults:](v6, "initWithValueSource:characteristicType:displayResults:", v5, *MEMORY[0x1E0CB8AC8], 0);
  v8 = [HFSimpleIncrementalControlItem alloc];
  v9 = -[HFSimpleIncrementalControlItem initWithValueSource:characteristicType:displayResults:](v8, "initWithValueSource:characteristicType:displayResults:", v5, *MEMORY[0x1E0CB8B10], 0);
  v10 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v10, "addObject:", v7);
  objc_msgSend(v10, "addObject:", v9);

  return v10;
}

- (int64_t)_doorServicePriority
{
  return 0;
}

@end
