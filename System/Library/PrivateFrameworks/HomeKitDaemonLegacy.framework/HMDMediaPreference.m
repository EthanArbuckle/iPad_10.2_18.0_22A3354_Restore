@implementation HMDMediaPreference

- (HMDMediaPreference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5
{
  id v8;
  id v9;
  HMDMediaPreference *v10;
  uint64_t v11;
  HMFSystemPreference *homeKitPreference;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDMediaPreference;
  v10 = -[HMFPreference initWithKey:options:defaultValue:](&v14, sel_initWithKey_options_defaultValue_, v8, a4, 0);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C0]), "initWithKey:options:defaultValue:", v8, a4, v9);
    homeKitPreference = v10->_homeKitPreference;
    v10->_homeKitPreference = (HMFSystemPreference *)v11;

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
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMFPreference key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPreference numberValue](self, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPreference homeKitPreference](self, "homeKitPreference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPreference appleMediaPreference](self, "appleMediaPreference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPreference airPlay2Preference](self, "airPlay2Preference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(", Key = %@, Value = %@, HomeKit = %@, Apple Media = %@, AirPlay = %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (HMFPreference)appleMediaPreference
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("enableAppleMedia"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFPreference *)v3;
}

- (HMFPreference)airPlay2Preference
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("enableAirPlay2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFPreference *)v3;
}

- (BOOL)BOOLValue
{
  void *v2;
  char v3;

  -[HMDMediaPreference numberValue](self, "numberValue");
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
  int v9;

  -[HMDMediaPreference homeKitPreference](self, "homeKitPreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDMediaPreference homeKitPreference](self, "homeKitPreference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDMediaPreference appleMediaPreference](self, "appleMediaPreference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "BOOLValue"))
    {

    }
    else
    {
      -[HMDMediaPreference airPlay2Preference](self, "airPlay2Preference");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      if (!v9)
      {
        v6 = 0;
        return v6;
      }
    }
    v6 = (void *)MEMORY[0x1E0C9AAB0];
  }
  return v6;
}

- (id)stringValue
{
  void *v2;
  void *v3;

  -[HMDMediaPreference numberValue](self, "numberValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMFSystemPreference)homeKitPreference
{
  return (HMFSystemPreference *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitPreference, 0);
}

+ (void)loadEnableMediaAccessories
{
  objc_msgSend(MEMORY[0x1E0D28678], "setPreferenceClass:forPreferenceKey:", a1, CFSTR("enableMediaAccessories"));
}

@end
