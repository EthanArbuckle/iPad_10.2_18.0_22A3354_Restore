@implementation _ACCBluetoothStatusComponent

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_ACCBluetoothStatusComponent<%@ name=%@ needToUnplugBTDevice=%d>"), self->_componentUID, self->_name, self->_needToUnplugBTDevice);
}

- (_ACCBluetoothStatusComponent)initWithUID:(id)a3 macAddr:(id)a4 name:(id)a5 forAccessoryUID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _ACCBluetoothStatusComponent *v15;
  _ACCBluetoothStatusComponent *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_ACCBluetoothStatusComponent;
  v15 = -[_ACCBluetoothStatusComponent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessoryUID, a6);
    objc_storeStrong((id *)&v16->_componentUID, a3);
    objc_storeStrong((id *)&v16->_macAddr, a4);
    objc_storeStrong((id *)&v16->_name, a5);
    v16->_needToUnplugBTDevice = 0;
  }

  return v16;
}

+ (id)createComponentFromDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _ACCBluetoothStatusComponent *v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("ACCBluetoothStatusComponentInfoAccessoryUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ACCBluetoothStatusComponentInfoUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ACCBluetoothStatusComponentInfoMACAddr"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ACCBluetoothStatusComponentInfoName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_ACCBluetoothStatusComponent initWithUID:macAddr:name:forAccessoryUID:]([_ACCBluetoothStatusComponent alloc], "initWithUID:macAddr:name:forAccessoryUID:", v5, v6, v7, v4);
  return v8;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (NSString)componentUID
{
  return self->_componentUID;
}

- (NSData)macAddr
{
  return self->_macAddr;
}

- (NSString)name
{
  return self->_name;
}

- (BTAccessoryManagerImpl)btAccessoryManager
{
  return self->_btAccessoryManager;
}

- (void)setBtAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_btAccessoryManager = a3;
}

- (BTDeviceImpl)btDevice
{
  return self->_btDevice;
}

- (void)setBtDevice:(BTDeviceImpl *)a3
{
  self->_btDevice = a3;
}

- (BOOL)needToUnplugBTDevice
{
  return self->_needToUnplugBTDevice;
}

- (void)setNeedToUnplugBTDevice:(BOOL)a3
{
  self->_needToUnplugBTDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_macAddr, 0);
  objc_storeStrong((id *)&self->_componentUID, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

@end
