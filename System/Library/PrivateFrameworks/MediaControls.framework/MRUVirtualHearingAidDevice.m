@implementation MRUVirtualHearingAidDevice

- (MRUVirtualHearingAidDevice)initWithDeviceDescription:(id)a3
{
  id v5;
  MRUVirtualHearingAidDevice *v6;
  MRUVirtualHearingAidDevice *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUVirtualHearingAidDevice;
  v6 = -[MRUVirtualHearingAidDevice init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deviceDescription, a3);

  return v7;
}

- (id)name
{
  return (id)-[MRAVOutputDeviceDescription name](self->_deviceDescription, "name");
}

- (id)uid
{
  return (id)-[MRAVOutputDeviceDescription uid](self->_deviceDescription, "uid");
}

- (unsigned)deviceType
{
  return -[MRAVOutputDeviceDescription deviceType](self->_deviceDescription, "deviceType");
}

- (unsigned)deviceSubtype
{
  return -[MRAVOutputDeviceDescription deviceSubtype](self->_deviceDescription, "deviceSubtype");
}

- (MRAVOutputDeviceDescription)deviceDescription
{
  return self->_deviceDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDescription, 0);
}

@end
