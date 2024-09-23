@implementation HFNetworkConfigurationItemProvider

- (id)_supportedProfileClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (id)_profileItemForProfile:(id)a3
{
  id v4;
  HFNetworkConfigurationItem *v5;
  void *v6;
  void *v7;
  HFNetworkConfigurationItem *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = [HFNetworkConfigurationItem alloc];
    -[HFAccessoryProfileItemProvider home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_characteristicValueManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HFAccessoryProfileItem initWithProfile:valueSource:](v5, "initWithProfile:valueSource:", v4, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
