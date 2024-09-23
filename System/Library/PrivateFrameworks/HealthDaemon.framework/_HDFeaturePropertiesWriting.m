@implementation _HDFeaturePropertiesWriting

- (_HDFeaturePropertiesWriting)initWithLocalDomain:(id)a3
{
  id v5;
  _HDFeaturePropertiesWriting *v6;
  _HDFeaturePropertiesWriting *v7;
  uint64_t v8;
  NSUserDefaults *userDefaults;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HDFeaturePropertiesWriting;
  v6 = -[_HDFeaturePropertiesWriting init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localDomain, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v5);
    userDefaults = v7->_userDefaults;
    v7->_userDefaults = (NSUserDefaults *)v8;

  }
  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3, a4);
}

- (void)synchronize
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("FeatureVersion"), CFSTR("UpdateVersion"), CFSTR("UDIDeviceIdentifier"), CFSTR("YearOfRelease"), CFSTR("AvailableRegions"), CFSTR("AvailableRegionsVersion"), CFSTR("AvailableRegionsContentVersion"), CFSTR("CountrySetProvenance"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_localDomain, 0);
}

@end
