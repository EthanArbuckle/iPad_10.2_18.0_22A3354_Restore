@implementation HMDAccessoryFirmwareUpdateManagerWingman

- (HMDAccessoryFirmwareUpdateManagerWingman)init
{
  HMDAccessoryFirmwareUpdateManagerWingman *v2;
  UARPController *v3;
  UARPController *defaultUARPController;
  UARPController *v5;
  UARPController *matterUARPController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDAccessoryFirmwareUpdateManagerWingman;
  v2 = -[HMDAccessoryFirmwareUpdateManagerWingman init](&v8, sel_init);
  if (v2)
  {
    v3 = (UARPController *)objc_alloc_init(MEMORY[0x1E0D1A658]);
    defaultUARPController = v2->_defaultUARPController;
    v2->_defaultUARPController = v3;

    v2->_registerDelay = 6.0e10;
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      v5 = (UARPController *)objc_alloc_init(MEMORY[0x1E0D1A658]);
      matterUARPController = v2->_matterUARPController;
      v2->_matterUARPController = v5;

    }
  }
  return v2;
}

- (id)newAccessoryFirmwareUpdateSessionWithHAPAccessory:(id)a3 uarpAccessory:(id)a4 accessoryFirmwareUpdateManager:(id)a5 logEventManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  HMDAccessoryFirmwareUpdateSession *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[HMDAccessoryFirmwareUpdateSession initWithHAPAccessory:uarpAccessory:accessoryFirmwareUpdateManager:logEventManager:]([HMDAccessoryFirmwareUpdateSession alloc], "initWithHAPAccessory:uarpAccessory:accessoryFirmwareUpdateManager:logEventManager:", v12, v11, v10, v9);

  return v13;
}

- (UARPController)defaultUARPController
{
  return self->_defaultUARPController;
}

- (UARPController)matterUARPController
{
  return self->_matterUARPController;
}

- (double)registerDelay
{
  return self->_registerDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterUARPController, 0);
  objc_storeStrong((id *)&self->_defaultUARPController, 0);
}

@end
