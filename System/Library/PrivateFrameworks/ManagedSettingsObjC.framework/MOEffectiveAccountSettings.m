@implementation MOEffectiveAccountSettings

- (MOEffectiveAccountSettings)init
{
  MOEffectiveAccountSettings *v2;
  uint64_t v3;
  MOEffectiveSettingsStore *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEffectiveAccountSettings;
  v2 = -[MOEffectiveAccountSettings init](&v6, sel_init);
  v3 = objc_opt_new();
  store = v2->_store;
  v2->_store = (MOEffectiveSettingsStore *)v3;

  return v2;
}

- (MOEffectiveBool)denyiCloudLogout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MOEffectiveBool *v7;

  -[MOEffectiveAccountSettings store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "denyiCloudLogout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MOAccountSettingsGroup denyiCloudLogoutMetadata](MOAccountSettingsGroup, "denyiCloudLogoutMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MOEffectiveBool initWithValue:defaultValue:]([MOEffectiveBool alloc], "initWithValue:defaultValue:", objc_msgSend(v4, "BOOLValue"), objc_msgSend(v6, "BOOLValue"));
  return v7;
}

- (MOEffectiveSettingsStore)store
{
  return (MOEffectiveSettingsStore *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
