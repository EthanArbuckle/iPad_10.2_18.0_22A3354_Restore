@implementation HKUserDefaultsDataSource

- (HKUserDefaultsDataSource)initWithUserDefaults:(id)a3
{
  id v5;
  HKUserDefaultsDataSource *v6;
  HKUserDefaultsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKUserDefaultsDataSource;
  v6 = -[HKObserverBridge init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userDefaults, a3);

  return v7;
}

+ (id)privacyPreferencesDataSource
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.nanolifestyle.privacy"));
  v4 = (void *)objc_msgSend(v2, "initWithUserDefaults:", v3);

  return v4;
}

+ (id)respiratoryPreferencesDataSource
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.private.health.respiratory"));
  v4 = (void *)objc_msgSend(v2, "initWithUserDefaults:", v3);

  return v4;
}

+ (id)ageGatingDataSource
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.private.health.age-gating"));
  v4 = (void *)objc_msgSend(v2, "initWithUserDefaults:", v3);

  return v4;
}

+ (id)sharedHealthPreferencesDataSource
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.health.shared"));
  v4 = (void *)objc_msgSend(v2, "initWithUserDefaults:", v3);

  return v4;
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  _HKUserDefaultsBridgedObserver *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_HKUserDefaultsBridgedObserver initWithHandle:]([_HKUserDefaultsBridgedObserver alloc], "initWithHandle:", v6);

  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_userDefaults, "addObserver:forKeyPath:options:context:", v8, v7, 1, 0);
  return v8;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", a3, a4);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
