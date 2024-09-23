@implementation HFAccessorySettingDefaultAdapterCollection

- (NSSet)allAdapters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingDefaultAdapterCollection managedConfigurationAdapter](self, "managedConfigurationAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  -[HFAccessorySettingDefaultAdapterCollection mobileTimerAdapter](self, "mobileTimerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  -[HFAccessorySettingDefaultAdapterCollection siriLanguageAdapter](self, "siriLanguageAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v6);

  return (NSSet *)v3;
}

- (HFAccessorySettingManagedConfigurationAdapter)managedConfigurationAdapter
{
  return self->_managedConfigurationAdapter;
}

- (void)setManagedConfigurationAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfigurationAdapter, a3);
}

- (HFAccessorySettingSiriLanguageAdapter)siriLanguageAdapter
{
  return self->_siriLanguageAdapter;
}

- (void)setSiriLanguageAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_siriLanguageAdapter, a3);
}

- (HFAccessorySettingAdapter)mobileTimerAdapter
{
  return self->_mobileTimerAdapter;
}

- (void)setMobileTimerAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_mobileTimerAdapter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileTimerAdapter, 0);
  objc_storeStrong((id *)&self->_siriLanguageAdapter, 0);
  objc_storeStrong((id *)&self->_managedConfigurationAdapter, 0);
}

@end
