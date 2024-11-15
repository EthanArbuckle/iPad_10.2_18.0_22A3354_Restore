@implementation AVCustomDeviceRoute

- (void)dealloc
{
  OS_nw_endpoint *networkEndpoint;
  objc_super v4;

  self->_device = 0;
  networkEndpoint = self->_networkEndpoint;
  if (networkEndpoint)
  {
    nw_release(networkEndpoint);
    self->_networkEndpoint = 0;
  }

  self->_bluetoothIdentifier = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVCustomDeviceRoute;
  -[AVCustomDeviceRoute dealloc](&v4, sel_dealloc);
}

- (void)setDevice:(id)a3
{
  OS_nw_endpoint *networkEndpoint;
  NSObject *v6;
  OS_nw_endpoint *v7;
  NSUUID *bluetoothIdentifier;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  OS_nw_endpoint *v14;
  __int16 v15;
  NSUUID *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];

  self->_device = (DADevice *)a3;
  networkEndpoint = self->_networkEndpoint;
  if (networkEndpoint)
    nw_release(networkEndpoint);
  if (objc_msgSend(a3, "networkEndpoint"))
    self->_networkEndpoint = (OS_nw_endpoint *)nw_retain((void *)objc_msgSend(a3, "networkEndpoint"));

  self->_bluetoothIdentifier = (NSUUID *)(id)objc_msgSend(a3, "bluetoothIdentifier");
  v6 = _AVRoutingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_networkEndpoint;
    bluetoothIdentifier = self->_bluetoothIdentifier;
    v9 = 136315906;
    v10 = "-[AVCustomDeviceRoute setDevice:]";
    v11 = 2112;
    v12 = a3;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = bluetoothIdentifier;
    _os_log_impl(&dword_20AEB2000, v6, OS_LOG_TYPE_DEFAULT, "%s AVVSR.device = %@, networkEndpoint = %@, bluetoothIdentifier = %@", (uint8_t *)&v9, 0x2Au);
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)-[DADevice identifier](self->_device, "identifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "device"), "identifier"));
  else
    return 0;
}

- (unint64_t)hash
{
  return objc_msgSend((id)-[DADevice identifier](self->_device, "identifier"), "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ID: %@, name: %@>"), -[DADevice identifier](-[AVCustomDeviceRoute device](self, "device"), "identifier"), -[DADevice name](-[AVCustomDeviceRoute device](self, "device"), "name"));
}

- (nw_endpoint_t)networkEndpoint
{
  return (nw_endpoint_t)self->_networkEndpoint;
}

- (void)setNetworkEndpoint:(id)a3
{
  self->_networkEndpoint = (OS_nw_endpoint *)a3;
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
  self->_bluetoothIdentifier = (NSUUID *)a3;
}

- (DADevice)device
{
  return self->_device;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

@end
