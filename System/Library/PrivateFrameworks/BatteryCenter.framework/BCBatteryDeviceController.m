@implementation BCBatteryDeviceController

+ (id)_sharedPowerSourceController
{
  if (_sharedPowerSourceController_onceToken != -1)
    dispatch_once(&_sharedPowerSourceController_onceToken, &__block_literal_global_1);
  return (id)_sharedPowerSourceController___sharedPowerSourceController;
}

void __57__BCBatteryDeviceController__sharedPowerSourceController__block_invoke()
{
  _BCPowerSourceController *v0;
  void *v1;

  v0 = objc_alloc_init(_BCPowerSourceController);
  v1 = (void *)_sharedPowerSourceController___sharedPowerSourceController;
  _sharedPowerSourceController___sharedPowerSourceController = (uint64_t)v0;

}

- (BCBatteryDeviceController)init
{
  BCBatteryDeviceController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCBatteryDeviceController;
  v2 = -[BCBatteryDeviceController init](&v4, sel_init);
  if (v2)
    BCRegisterUserNotificationsLogging();
  return v2;
}

- (NSArray)connectedDevices
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_sharedPowerSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addBatteryDeviceObserver:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_sharedPowerSourceController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addBatteryDeviceObserver:queue:", v6, v5);

}

- (void)removeBatteryDeviceObserver:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_sharedPowerSourceController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeBatteryDeviceObserver:", v3);

}

@end
