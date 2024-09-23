@implementation MOEffectiveUserSettings

- (MOEffectiveUserSettings)init
{
  MOEffectiveUserSettings *v2;
  uint64_t v3;
  MOEffectiveSettingsStore *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEffectiveUserSettings;
  v2 = -[MOEffectiveUserSettings init](&v6, sel_init);
  v3 = objc_opt_new();
  store = v2->_store;
  v2->_store = (MOEffectiveSettingsStore *)v3;

  return v2;
}

- (MOEffectiveString)sharingPolicy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MOEffectiveString *v7;

  -[MOEffectiveUserSettings store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MOUserSettingsGroup sharingPolicyMetadata](MOUserSettingsGroup, "sharingPolicyMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MOEffectiveString initWithValue:defaultValue:]([MOEffectiveString alloc], "initWithValue:defaultValue:", v4, v6);
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
