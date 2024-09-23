@implementation HUSymbolIconColorConfiguration

+ (id)iconColorConfigurationForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2AC470))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  objc_opt_class();
  objc_msgSend(v6, "homeKitObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "hf_effectiveServiceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (_MergedGlobals_618 != -1)
      dispatch_once(&_MergedGlobals_618, &__block_literal_global_75_0);
    v11 = (id)qword_1ED580A98;
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "iconColorConfigurationForSymbolIconAccessoryType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __64__HUSymbolIconColorConfiguration_iconColorConfigurationForItem___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D30F40];
  v1 = *MEMORY[0x1E0CB9A10];
  v5[0] = *MEMORY[0x1E0CB9A70];
  v5[1] = v1;
  v2 = *MEMORY[0x1E0D30F30];
  v6[0] = v0;
  v6[1] = v2;
  v5[2] = *MEMORY[0x1E0CB9A80];
  v6[2] = *MEMORY[0x1E0D30F48];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED580A98;
  qword_1ED580A98 = v3;

}

+ (id)iconColorConfigurationForSymbolIconIdentifier:(id)a3
{
  void *v4;
  void *v5;

  HFSymbolIconAccessoryTypeForSymbol();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "iconColorConfigurationForSymbolIconAccessoryType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)iconColorConfigurationForSymbolIconAccessoryType:(id)a3
{
  void *v3;
  void *v4;

  +[HUSymbolIconColorProvider primaryColorForSymbolIconAccessoryType:](HUSymbolIconColorProvider, "primaryColorForSymbolIconAccessoryType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPrimaryColor:", v3);

  return v4;
}

- (HUSymbolIconColorConfiguration)initWithPrimaryColor:(id)a3
{
  id v5;
  HUSymbolIconColorConfiguration *v6;
  HUSymbolIconColorConfiguration *v7;
  HUSymbolIconColorConfiguration *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)HUSymbolIconColorConfiguration;
    v6 = -[HUSymbolIconColorConfiguration init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_primaryColor, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (UIColor)disabledIconColor
{
  return 0;
}

- (UIColor)activeIconBackgroundColor
{
  return 0;
}

- (UIColor)inactiveIconBackgroundColor
{
  return 0;
}

- (UIColor)disabledIconBackgroundColor
{
  return 0;
}

- (UIColor)iconColorInDescriptiveView
{
  return 0;
}

- (UIColor)iconBackgroundColorInDescriptiveView
{
  return 0;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryColor, 0);
}

@end
