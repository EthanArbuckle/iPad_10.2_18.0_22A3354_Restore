@implementation HFAccessorySettingOptionItem

- (HFAccessorySettingOptionItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5 optionItem:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HFAccessorySettingOptionItem *v15;
  HFAccessorySettingOptionItem *v16;
  void *v18;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingOptionItem.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("optionItem"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HFAccessorySettingOptionItem;
  v15 = -[HFAccessorySettingItem initWithHomeKitSettingsVendor:usageOptions:setting:](&v19, sel_initWithHomeKitSettingsVendor_usageOptions_setting_, v11, v12, v13);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_optionItem, a6);
    objc_storeStrong((id *)&v16->_usageOptions, a4);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingOptionItem usageOptions](self, "usageOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingItem setting](self, "setting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingOptionItem optionItem](self, "optionItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithHomeKitSettingsVendor:usageOptions:setting:optionItem:", v5, v6, v7, v8);

  objc_msgSend(v9, "copyLatestResultsFromItem:", self);
  return v9;
}

- (id)toggleSelection
{
  void *v3;
  void *v4;

  -[HFAccessorySettingOptionItem optionItem](self, "optionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingItem updateValue:](self, "updateValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)settingKeyPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HFAccessorySettingItem setting](self, "setting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingOptionItem optionItem](self, "optionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  objc_super v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)HFAccessorySettingOptionItem;
  -[HFAccessorySettingItem _subclass_updateWithOptions:](&v14, sel__subclass_updateWithOptions_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__HFAccessorySettingOptionItem__subclass_updateWithOptions___block_invoke;
  v11[3] = &unk_1EA727BB0;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

id __60__HFAccessorySettingOptionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(WeakRetained, "setting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "valueForSetting:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "optionItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqual:", v13);

  if (v14)
    v15 = MEMORY[0x1E0C9AAB0];
  else
    v15 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("selected"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA7CB7E8, CFSTR("HFAccessorySettingInterfaceModalityKey"));
  objc_msgSend(WeakRetained, "optionItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("AccessorySettingOptionItemValue"));

  objc_msgSend(WeakRetained, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "overrideLocalizedTitleKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(WeakRetained, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "overrideLocalizedTitleKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v20, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("title"));

  }
  else
  {
    objc_msgSend(WeakRetained, "settingKeyPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v19, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("title"));
  }

  objc_msgSend(WeakRetained, "_decorateOutcomeWithDependencies:", v6);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)_decorateOutcomeWithDependencies:(id)a3
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
  id v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[HFAccessorySettingItem setting](self, "setting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("HFResultSettingKeyPathsDependenciesKey"));

  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homekitObjectIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("HFResultSettingParentIdentifiersDependenciesKey"));

  v11 = (void *)MEMORY[0x1E0C99E60];
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObject:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("dependentHomeKitObjects"));

}

- (HMAccessorySelectionSettingItem)optionItem
{
  return self->_optionItem;
}

- (void)setOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_optionItem, a3);
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_usageOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_optionItem, 0);
}

@end
