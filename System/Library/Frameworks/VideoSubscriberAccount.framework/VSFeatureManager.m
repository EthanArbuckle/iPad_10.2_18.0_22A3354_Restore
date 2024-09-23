@implementation VSFeatureManager

+ (id)sharedFeatureManager
{
  if (sharedFeatureManager___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedFeatureManager___vs_lazy_init_predicate, &__block_literal_global_21);
  return (id)sharedFeatureManager___vs_lazy_init_variable;
}

void __40__VSFeatureManager_sharedFeatureManager__block_invoke()
{
  VSFeatureManager *v0;
  void *v1;

  v0 = objc_alloc_init(VSFeatureManager);
  v1 = (void *)sharedFeatureManager___vs_lazy_init_variable;
  sharedFeatureManager___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSFeatureManager)init
{
  VSFeatureManager *v2;
  VSPreferences *v3;
  VSPreferences *preferences;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSFeatureManager;
  v2 = -[VSFeatureManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v3;

  }
  return v2;
}

- (BOOL)featureIsEnabled:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v8;

  v4 = a3;
  v8 = 0;
  -[VSFeatureManager preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "featureIsEnabled:present:", v4, &v8);

  if (!v8)
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v6 = _os_feature_enabled_impl();
  }

  return v6;
}

- (void)enableFeature:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSFeatureManager preferences](self, "preferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableFeature:", v4);

}

- (void)disableFeature:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSFeatureManager preferences](self, "preferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disableFeature:", v4);

}

- (void)resetFeature:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSFeatureManager preferences](self, "preferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearFeature:", v4);

}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
