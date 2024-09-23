@implementation HMAccessoryNumberSetting

- (HMAccessoryNumberSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5
{
  return -[HMAccessoryNumberSetting initWithKey:properties:value:minimumValue:maximumValue:stepValue:](self, "initWithKey:properties:value:minimumValue:maximumValue:stepValue:", a3, a4, a5, 0, 0, 0);
}

- (HMAccessoryNumberSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5 minimumValue:(id)a6 maximumValue:(id)a7 stepValue:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  HMAccessorySettingConstraint *v21;
  HMAccessorySettingConstraint *v22;
  HMAccessorySettingConstraint *v23;
  _HMAccessorySetting *v24;
  HMAccessoryNumberSetting *v25;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = (void *)MEMORY[0x1E0C99DE8];
  v18 = a5;
  v19 = a3;
  objc_msgSend(v17, "arrayWithCapacity:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v21 = -[HMAccessorySettingConstraint initWithType:value:]([HMAccessorySettingConstraint alloc], "initWithType:value:", 1, v14);
    objc_msgSend(v20, "addObject:", v21);

  }
  if (v15)
  {
    v22 = -[HMAccessorySettingConstraint initWithType:value:]([HMAccessorySettingConstraint alloc], "initWithType:value:", 2, v15);
    objc_msgSend(v20, "addObject:", v22);

  }
  if (v16)
  {
    v23 = -[HMAccessorySettingConstraint initWithType:value:]([HMAccessorySettingConstraint alloc], "initWithType:value:", 3, v16);
    objc_msgSend(v20, "addObject:", v23);

  }
  v24 = -[_HMAccessorySetting initWithType:properties:name:constraints:]([_HMAccessorySetting alloc], "initWithType:properties:name:constraints:", 2, a4, v19, v20);

  -[_HMAccessorySetting setValue:](v24, "setValue:", v18);
  v25 = -[HMAccessorySetting initWithInternal:](self, "initWithInternal:", v24);

  return v25;
}

- (void)updateValue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMAccessorySetting internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v4);

  -[HMAccessorySetting internal](self, "internal");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetting _settingDidUpdateValue:](self, "_settingDidUpdateValue:", v6);

}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (NSNumber)minimumValue
{
  void *v2;
  void *v3;
  void *v4;

  -[HMAccessorySetting internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)maximumValue
{
  void *v2;
  void *v3;
  void *v4;

  -[HMAccessorySetting internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintWithType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)stepValue
{
  void *v2;
  void *v3;
  void *v4;

  -[HMAccessorySetting internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintWithType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

@end
