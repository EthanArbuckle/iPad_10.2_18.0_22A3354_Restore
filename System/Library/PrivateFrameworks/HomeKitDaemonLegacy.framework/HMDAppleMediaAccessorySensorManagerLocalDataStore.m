@implementation HMDAppleMediaAccessorySensorManagerLocalDataStore

- (HMDAppleMediaAccessorySensorManagerLocalDataStore)init
{
  void *v3;
  HMDAppleMediaAccessorySensorManagerLocalDataStore *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDAppleMediaAccessorySensorManagerLocalDataStore initWithUserDefaults:](self, "initWithUserDefaults:", v3);

  return v4;
}

- (HMDAppleMediaAccessorySensorManagerLocalDataStore)initWithUserDefaults:(id)a3
{
  id v4;
  HMDAppleMediaAccessorySensorManagerLocalDataStore *v5;
  HMDAppleMediaAccessorySensorManagerLocalDataStore *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAppleMediaAccessorySensorManagerLocalDataStore;
  v5 = -[HMDAppleMediaAccessorySensorManagerLocalDataStore init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HMDAppleMediaAccessorySensorManagerLocalDataStore setDefaults:](v5, "setDefaults:", v4);

  return v6;
}

- (void)saveSensorUUID:(id)a3
{
  -[HMDAppleMediaAccessorySensorManagerLocalDataStore saveSensorUUID:completion:](self, "saveSensorUUID:completion:", a3, 0);
}

- (void)saveSensorUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[HMDAppleMediaAccessorySensorManagerLocalDataStore defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("HMMediaAccessorySensorUUID"));
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    v9 = v10;
  }

}

- (void)fetchSensorUUIDWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[HMDAppleMediaAccessorySensorManagerLocalDataStore defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("HMMediaAccessorySensorUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  else
    v6 = 0;
  v7[2](v7, v6);

}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
