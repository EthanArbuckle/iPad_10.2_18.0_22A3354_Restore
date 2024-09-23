@implementation BTSDeviceClassic

- (BTSDeviceClassic)initWithDevice:(id)a3
{
  id v4;
  BTSDeviceClassic *v5;
  BTSDeviceClassic *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTSDeviceClassic;
  v5 = -[BTSDeviceClassic init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_device, v4);

  return v6;
}

+ (id)deviceWithDevice:(id)a3
{
  id v3;
  BTSDeviceClassic *v4;

  v3 = a3;
  v4 = -[BTSDeviceClassic initWithDevice:]([BTSDeviceClassic alloc], "initWithDevice:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  id WeakRetained;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (-[BTSDeviceClassic isMyDevice](self, "isMyDevice"))
    v5 = "yes";
  else
    v5 = "no";
  if (-[BTSDeviceClassic isHealthDevice](self, "isHealthDevice"))
    v6 = "yes";
  else
    v6 = "no";
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  if (-[BTSDeviceClassic isTemporaryPairedDevice](self, "isTemporaryPairedDevice"))
    v8 = "yes";
  else
    v8 = "no";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, myDevice = %s, healthDevice = %s, classicDevice = %@>, guest = %s"), v4, self, v5, v6, WeakRetained, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)identifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)name
{
  NSString *accessorySetupKitDisplayName;
  NSString *v3;
  id WeakRetained;

  accessorySetupKitDisplayName = self->accessorySetupKitDisplayName;
  if (accessorySetupKitDisplayName)
  {
    v3 = accessorySetupKitDisplayName;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    objc_msgSend(WeakRetained, "name");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)productName
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "productName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)healthDeviceType
{
  return 0;
}

- (BOOL)connected
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v3 = objc_msgSend(WeakRetained, "connected");

  return v3;
}

- (BOOL)paired
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v3 = objc_msgSend(WeakRetained, "paired");

  return v3;
}

- (BOOL)cloudPaired
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v3 = objc_msgSend(WeakRetained, "cloudPaired");

  return v3;
}

- (BOOL)magicPaired
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v3 = objc_msgSend(WeakRetained, "magicPaired");

  return v3;
}

- (BOOL)isTemporaryPairedDevice
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v3 = objc_msgSend(WeakRetained, "isTemporaryPaired");

  return v3;
}

- (id)classicDevice
{
  return objc_loadWeakRetained((id *)&self->_device);
}

- (BOOL)isHealthDevice
{
  return 0;
}

- (BOOL)isMyDevice
{
  _BOOL4 v3;

  v3 = -[BTSDeviceClassic paired](self, "paired");
  if (v3)
    LOBYTE(v3) = !-[BTSDeviceClassic isTemporaryPairedDevice](self, "isTemporaryPairedDevice");
  return v3;
}

- (BOOL)setUserName:(id)a3
{
  BluetoothDevice **p_device;
  id v4;
  id WeakRetained;
  char v6;

  p_device = &self->_device;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_device);
  v6 = objc_msgSend(WeakRetained, "setUserName:", v4);

  return v6;
}

- (BOOL)connect
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "connect");

  return 1;
}

- (void)disconnect
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "disconnect");

}

- (void)unpair
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "unpair");

}

- (BOOL)supportsANCS
{
  return 0;
}

- (BOOL)isManagedByWallet
{
  return self->managedByWallet;
}

- (BOOL)isManagedByAliroWallet
{
  return self->managedByAliroWallet;
}

- (BOOL)isManagedByDeviceAccess
{
  return 0;
}

- (BOOL)ancsAuthorized
{
  return 0;
}

- (int)userSelectedHealthDataSyncConfig
{
  return 2;
}

- (BOOL)isApplePencil:(int *)a3
{
  return 0;
}

- (BOOL)doesSupportBackgroundNI
{
  return self->supportsBackgroundNI;
}

- (BOOL)isLimitedConnectivityDevice
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v3 = objc_msgSend(WeakRetained, "getBehaviorForHIDDevice") != 0;

  return v3;
}

- (BOOL)isFirmwareUpdateRequiredDevice
{
  return 0;
}

- (BOOL)isHIDDevice
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v3 = objc_msgSend(WeakRetained, "isServiceSupported:", 32);

  return v3;
}

- (BOOL)isCarPlayDevice
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v3 = objc_msgSend(WeakRetained, "isServiceSupported:", 0x40000);

  return v3;
}

- (BluetoothDevice)device
{
  return (BluetoothDevice *)objc_loadWeakRetained((id *)&self->_device);
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

- (id)accessorySetupKitDisplayName
{
  return self->accessorySetupKitDisplayName;
}

- (void)setAccessorySetupKitDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->accessorySetupKitDisplayName, a3);
}

- (BOOL)shouldDenyIncomingClassicConnection
{
  return self->denyIncomingClassicConnection;
}

- (void)setDenyIncomingClassicConnection:(BOOL)a3
{
  self->denyIncomingClassicConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->accessorySetupKitDisplayName, 0);
  objc_destroyWeak((id *)&self->_device);
}

@end
