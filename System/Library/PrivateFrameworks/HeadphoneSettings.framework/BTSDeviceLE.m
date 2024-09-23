@implementation BTSDeviceLE

- (BTSDeviceLE)initWithPeripheral:(id)a3 manager:(id)a4
{
  id v7;
  id v8;
  BTSDeviceLE *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BTSDeviceLE;
  v9 = -[BTSDeviceLE init](&v11, sel_init);
  if (v9)
  {
    if (objc_msgSend(v7, "hasTag:", CFSTR("IsHearingAid")))
    {

      v9 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v9->_peripheral, a3);
      objc_storeStrong((id *)&v9->_centralManager, a4);
    }
  }

  return v9;
}

+ (id)deviceWithPeripheral:(id)a3 manager:(id)a4
{
  id v5;
  id v6;
  BTSDeviceLE *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BTSDeviceLE initWithPeripheral:manager:]([BTSDeviceLE alloc], "initWithPeripheral:manager:", v6, v5);

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  CBPeripheral *peripheral;
  DADevice *underlyingDADevice;
  const char *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (-[BTSDeviceLE isMyDevice](self, "isMyDevice"))
    v5 = "yes";
  else
    v5 = "no";
  if (-[BTSDeviceLE isHealthDevice](self, "isHealthDevice"))
    v6 = "yes";
  else
    v6 = "no";
  peripheral = self->_peripheral;
  underlyingDADevice = self->_underlyingDADevice;
  if (-[BTSDeviceLE isTemporaryPairedDevice](self, "isTemporaryPairedDevice"))
    v9 = "yes";
  else
    v9 = "no";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, myDevice = %s, healthDevice = %s, peripheral = %@, daDevice = %@>, guest = %s"), v4, self, v5, v6, peripheral, underlyingDADevice, v9);
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[CBPeripheral identifier](self->_peripheral, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)name
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[DADevice name](self->_underlyingDADevice, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DADevice name](self->_underlyingDADevice, "name");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BTSDeviceLE healthDeviceType](self, "healthDeviceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      -[CBPeripheral name](self->_peripheral, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("GHSS %@"), v7);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[CBPeripheral name](self->_peripheral, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v4 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ACCESSORY"), &stru_24F9F3620, CFSTR("Devices"));
        v4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  return v4;
}

- (id)healthDeviceType
{
  int AppBooleanValue;
  id v4;
  void *v5;
  void *v6;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("enableHealthDevices"), CFSTR("com.apple.bluetooth"), &keyExistsAndHasValidFormat);
  v4 = 0;
  if (_os_feature_enabled_impl() && AppBooleanValue && keyExistsAndHasValidFormat)
  {
    -[CBPeripheral customProperty:](self->_peripheral, "customProperty:", CFSTR("GHSDeviceType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("4103")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("4104")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("4113")) & 1) != 0
        || objc_msgSend(v6, "isEqualToString:", CFSTR("4111")))
      {
        v4 = v6;
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (BOOL)connected
{
  return -[CBPeripheral isConnectedToSystem](self->_peripheral, "isConnectedToSystem");
}

- (BOOL)paired
{
  BTSDeviceLE *v2;
  void *v3;

  v2 = self;
  -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isPeerPaired:", v2->_peripheral);

  return (char)v2;
}

- (BOOL)isTemporaryPairedDevice
{
  return 0;
}

- (BOOL)cloudPaired
{
  BTSDeviceLE *v2;
  void *v3;

  v2 = self;
  -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isPeerCloudPaired:", v2->_peripheral);

  return (char)v2;
}

- (id)classicDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[BTSDeviceLE supportsCTKD](self, "supportsCTKD"))
  {
    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral identifier](self->_peripheral, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceFromIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classicDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isMyDevice
{
  return -[BTSDeviceLE paired](self, "paired")
      || -[BTSDeviceLE connected](self, "connected")
      || -[BTSDeviceLE isHealthDevice](self, "isHealthDevice")
      || -[BTSDeviceLE isManagedByDeviceAccess](self, "isManagedByDeviceAccess");
}

- (BOOL)setUserName:(id)a3
{
  return 1;
}

- (BOOL)connect
{
  char v3;

  v3 = -[CBPeripheral isConnectedToSystem](self->_peripheral, "isConnectedToSystem");
  if ((v3 & 1) == 0)
    -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", self->_peripheral, 0);
  return v3 ^ 1;
}

- (void)disconnect
{
  -[CBCentralManager cancelPeripheralConnection:force:](self->_centralManager, "cancelPeripheralConnection:force:", self->_peripheral, 0);
}

- (void)unpair
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v5;

  if (_os_feature_enabled_impl())
  {
    -[CBPeripheral customProperty:](self->_peripheral, "customProperty:", CFSTR("Fitness"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CBPeripheral setCustomProperty:value:](self->_peripheral, "setCustomProperty:value:", CFSTR("Fitness"), 0);
      -[CBPeripheral setCustomProperty:value:](self->_peripheral, "setCustomProperty:value:", CFSTR("UpdateHealth"), 0);
      -[CBPeripheral untag:](self->_peripheral, "untag:", *MEMORY[0x24BDD35B8]);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.bluetooth.settings.fitness-device-pairing-state-changed"), 0, 0, 1u);
    }
  }
  -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unpairPeer:", self->_peripheral);

}

- (BOOL)supportsCTKD
{
  return -[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("_CTKD_"));
}

- (BOOL)supportsANCS
{
  if ((-[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("ANCSAuthorized")) & 1) != 0)
    return 1;
  else
    return -[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("ANCSUnauthorized"));
}

- (BOOL)isManagedByWallet
{
  CBPeripheral *peripheral;

  peripheral = self->_peripheral;
  if (peripheral)
    LOBYTE(peripheral) = -[CBPeripheral hasTag:](peripheral, "hasTag:", CFSTR("_MANAGED_BY_WALLET_"));
  return (char)peripheral;
}

- (BOOL)isManagedByAliroWallet
{
  CBPeripheral *peripheral;

  peripheral = self->_peripheral;
  if (peripheral)
    LOBYTE(peripheral) = -[CBPeripheral hasTag:](peripheral, "hasTag:", CFSTR("_MANAGED_BY_ALIRO_WALLET_"));
  return (char)peripheral;
}

- (BOOL)isManagedByDeviceAccess
{
  CBPeripheral *peripheral;

  LODWORD(peripheral) = _os_feature_enabled_impl();
  if ((_DWORD)peripheral)
  {
    peripheral = self->_peripheral;
    if (peripheral)
      LOBYTE(peripheral) = -[CBPeripheral hasTag:](peripheral, "hasTag:", CFSTR("DA_ASK_RETAIN_DEVICE"));
    if (self->_underlyingDADevice)
      LOBYTE(peripheral) = 1;
  }
  return (char)peripheral;
}

- (BOOL)shouldDenyIncomingClassicConnection
{
  return -[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("_DENY_INCOMING_CLASSIC_CONNECTION_"));
}

- (id)relatedFutureRadioAddress
{
  void *v3;

  if (-[BTSDeviceLE isManagedByDeviceAccess](self, "isManagedByDeviceAccess"))
  {
    -[CBPeripheral customProperty:](self->_peripheral, "customProperty:", CFSTR("ASK_RELATED_RADIO_ADDRESS"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)linkedRadioAddress
{
  void *v3;

  if (-[BTSDeviceLE isManagedByDeviceAccess](self, "isManagedByDeviceAccess"))
  {
    -[CBPeripheral customProperty:](self->_peripheral, "customProperty:", CFSTR("ASK_LINKED_RADIO_ADDRESS"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setDenyIncomingClassicConnection:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[BTSDeviceLE shouldDenyIncomingClassicConnection](self, "shouldDenyIncomingClassicConnection");
  if (v3)
  {
    if (!v5)
      -[CBPeripheral tag:](self->_peripheral, "tag:", CFSTR("_DENY_INCOMING_CLASSIC_CONNECTION_"));
  }
  else if (v5)
  {
    -[CBPeripheral untag:](self->_peripheral, "untag:", CFSTR("_DENY_INCOMING_CLASSIC_CONNECTION_"));
  }
}

- (BOOL)ancsAuthorized
{
  return -[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("ANCSAuthorized"));
}

- (void)setANCSAuthorization:(BOOL)a3
{
  CBPeripheral *peripheral;
  BOOL v5;
  const __CFString *v6;
  const __CFString *v7;

  peripheral = self->_peripheral;
  v5 = !a3;
  if (a3)
    v6 = CFSTR("ANCSAuthorized");
  else
    v6 = CFSTR("ANCSUnauthorized");
  if (v5)
    v7 = CFSTR("ANCSAuthorized");
  else
    v7 = CFSTR("ANCSUnauthorized");
  -[CBPeripheral tag:](peripheral, "tag:", v6);
  -[CBPeripheral untag:](self->_peripheral, "untag:", v7);
}

- (int)userSelectedHealthDataSyncConfig
{
  void *v3;
  void *v4;
  int v5;

  -[BTSDeviceLE healthDeviceType](self, "healthDeviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 2;
  -[CBPeripheral customProperty:](self->_peripheral, "customProperty:", CFSTR("UserSelectedHealthDataSyncConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HealthDataSyncAlways")) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HealthDataSyncWithUserConfirm")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "isEqualToString:", CFSTR("HealthDataSyncNever"));
    v5 = 2;
  }

  return v5;
}

- (void)setUserSelectedHealthDataSyncConfig:(int)a3
{
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  BOOL v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  -[BTSDeviceLE healthDeviceType](self, "healthDeviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = CFSTR("0");
    v7 = CFSTR("HealthDataSyncNever");
    if (!a3)
    {
      v7 = CFSTR("HealthDataSyncAlways");
      v6 = CFSTR("1");
    }
    v8 = a3 == 1;
    if (a3 == 1)
      v9 = CFSTR("HealthDataSyncWithUserConfirm");
    else
      v9 = v7;
    if (v8)
      v10 = CFSTR("1");
    else
      v10 = v6;
    -[CBPeripheral customProperty:](self->_peripheral, "customProperty:", CFSTR("UpdateHealth"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[CBPeripheral setCustomProperty:value:](self->_peripheral, "setCustomProperty:value:", CFSTR("UpdateHealth"), v10);
    -[CBPeripheral setCustomProperty:value:](self->_peripheral, "setCustomProperty:value:", CFSTR("UserSelectedHealthDataSyncConfig"), v9);
  }
}

- (BOOL)isApplePencil:(int *)a3
{
  int v5;
  int v6;

  if ((-[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("A1603")) & 1) != 0)
    goto LABEL_5;
  if ((-[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("A2051")) & 1) != 0)
  {
    v5 = 1;
    goto LABEL_6;
  }
  if ((-[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("A3085")) & 1) != 0)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v6 = -[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("A2538"));
  if (!v6)
    return v6;
  v5 = 2;
LABEL_6:
  *a3 = v5;
  LOBYTE(v6) = 1;
  return v6;
}

- (BOOL)doesSupportBackgroundNI
{
  return -[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("niBackground"));
}

- (BOOL)isLimitedConnectivityDevice
{
  int v4;

  v4 = 0;
  return !-[BTSDeviceLE isApplePencil:](self, "isApplePencil:", &v4)
      && ((-[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("HIDDeviceUnknownBehavior")) & 1) != 0
       || (-[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("HIDDeviceKnownPoorBehavior")) & 1) != 0);
}

- (BOOL)isFirmwareUpdateRequiredDevice
{
  return -[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("XboxControllerRequiresFWUpdate"));
}

- (BOOL)isHIDDevice
{
  if ((-[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("IsLEKeyboard")) & 1) != 0)
    return 1;
  else
    return -[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("IsLEMouse"));
}

- (BOOL)isCarPlayDevice
{
  return -[CBPeripheral hasTag:](self->_peripheral, "hasTag:", CFSTR("_CARPLAY_DEVICE_"));
}

- (BOOL)isHealthDevice
{
  return self->healthDevice;
}

- (void)setHealthDevice:(BOOL)a3
{
  self->healthDevice = a3;
}

- (BOOL)isCTKDDevice
{
  return self->ctkdDevice;
}

- (void)setCtkdDevice:(BOOL)a3
{
  self->ctkdDevice = a3;
}

- (void)setManagedByWallet:(BOOL)a3
{
  self->managedByWallet = a3;
}

- (void)setManagedByAliroWallet:(BOOL)a3
{
  self->managedByAliroWallet = a3;
}

- (void)setSupportsBackgroundNI:(BOOL)a3
{
  self->supportsBackgroundNI = a3;
}

- (DADevice)underlyingDADevice
{
  return self->_underlyingDADevice;
}

- (void)setUnderlyingDADevice:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingDADevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDADevice, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end
