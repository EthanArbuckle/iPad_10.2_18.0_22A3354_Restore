@implementation HMDAirPlay2Preference

- (HMDAirPlay2Preference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5
{
  id v8;
  id v9;
  HMDAirPlay2Preference *v10;
  uint64_t v11;
  HMFSystemPreference *airPlayPreference;
  uint64_t v13;
  HMFSystemPreference *homeKitPreference;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDAirPlay2Preference;
  v10 = -[HMFPreference initWithKey:options:defaultValue:](&v16, sel_initWithKey_options_defaultValue_, v8, a4, 0);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F290]), "initWithKey:options:domain:defaultValue:", CFSTR("enableAirPlay2"), 0, CFSTR("com.apple.airplay"), 0);
    airPlayPreference = v10->_airPlayPreference;
    v10->_airPlayPreference = (HMFSystemPreference *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F290]), "initWithKey:options:defaultValue:", v8, a4, v9);
    homeKitPreference = v10->_homeKitPreference;
    v10->_homeKitPreference = (HMFSystemPreference *)v13;

  }
  return v10;
}

- (NSString)propertyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMFPreference key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAirPlay2Preference numberValue](self, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAirPlay2Preference homeKitPreference](self, "homeKitPreference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAirPlay2Preference airPlayPreference](self, "airPlayPreference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(", Key = %@, Value = %@, HomeKit = %@, AirPlay = %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)BOOLValue
{
  void *v2;
  char v3;

  -[HMDAirPlay2Preference numberValue](self, "numberValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)numberValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDAirPlay2Preference homeKitPreference](self, "homeKitPreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDAirPlay2Preference homeKitPreference](self, "homeKitPreference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDAirPlay2Preference airPlayPreference](self, "airPlayPreference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v9 = 0;
      return v9;
    }
    -[HMDAirPlay2Preference airPlayPreference](self, "airPlayPreference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;
  objc_msgSend(v5, "numberValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)stringValue
{
  void *v2;
  void *v3;

  -[HMDAirPlay2Preference numberValue](self, "numberValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMFSystemPreference)airPlayPreference
{
  return (HMFSystemPreference *)objc_getProperty(self, a2, 40, 1);
}

- (HMFSystemPreference)homeKitPreference
{
  return (HMFSystemPreference *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitPreference, 0);
  objc_storeStrong((id *)&self->_airPlayPreference, 0);
}

+ (void)loadEnableAirPlay2Accessories
{
  objc_msgSend(MEMORY[0x24BE3F248], "setPreferenceClass:forPreferenceKey:", a1, CFSTR("enableAirPlay2"));
}

@end
