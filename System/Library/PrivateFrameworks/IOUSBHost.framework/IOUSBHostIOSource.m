@implementation IOUSBHostIOSource

- (IOUSBHostIOSource)initWithHostInterface:(id)a3 endpointAddress:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6 deviceAddress:(unint64_t)a7
{
  uint64_t v9;
  id v12;
  IOUSBHostIOSource *v13;
  IOUSBHostIOSource *v14;
  objc_super v16;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IOUSBHostIOSource;
  v13 = -[IOUSBHostIOSource init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[IOUSBHostIOSource setHostInterface:](v13, "setHostInterface:", v12);
    -[IOUSBHostIOSource setEndpointAddress:](v14, "setEndpointAddress:", a4);
    -[IOUSBHostIOSource setIoConnection:](v14, "setIoConnection:", v9);
    -[IOUSBHostIOSource setIoNotificationPortRef:](v14, "setIoNotificationPortRef:", a6);
    -[IOUSBHostIOSource setDeviceAddress:](v14, "setDeviceAddress:", a7);
    -[IOUSBHostIOSource setDebugLoggingMask:](v14, "setDebugLoggingMask:", 1);
  }

  return v14;
}

- (IOUSBHostInterface)hostInterface
{
  return (IOUSBHostInterface *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHostInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSUInteger)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (NSUInteger)endpointAddress
{
  return self->_endpointAddress;
}

- (void)setEndpointAddress:(unint64_t)a3
{
  self->_endpointAddress = a3;
}

- (unsigned)debugLoggingMask
{
  return self->_debugLoggingMask;
}

- (void)setDebugLoggingMask:(unsigned int)a3
{
  self->_debugLoggingMask = a3;
}

- (unsigned)ioConnection
{
  return self->_ioConnection;
}

- (void)setIoConnection:(unsigned int)a3
{
  self->_ioConnection = a3;
}

- (IONotificationPort)ioNotificationPortRef
{
  return self->_ioNotificationPortRef;
}

- (void)setIoNotificationPortRef:(IONotificationPort *)a3
{
  self->_ioNotificationPortRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostInterface, 0);
}

@end
