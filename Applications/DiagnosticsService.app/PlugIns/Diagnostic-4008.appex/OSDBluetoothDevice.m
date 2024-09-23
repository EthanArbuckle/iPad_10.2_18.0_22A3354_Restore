@implementation OSDBluetoothDevice

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OSDBluetoothDevice;
  v3 = -[OSDBluetoothDevice description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSDBluetoothDevice name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSDBluetoothDevice defaultName](self, "defaultName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDBluetoothDevice address](self, "address"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %@ [%@]"), v4, v5, v6, v7));

  return v8;
}

- (NSString)defaultName
{
  return self->_defaultName;
}

- (void)setDefaultName:(id)a3
{
  objc_storeStrong((id *)&self->_defaultName, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(unsigned int)a3
{
  self->_deviceClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_defaultName, 0);
}

@end
