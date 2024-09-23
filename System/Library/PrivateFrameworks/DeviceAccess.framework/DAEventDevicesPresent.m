@implementation DAEventDevicesPresent

- (DAEventDevicesPresent)initWithPresent:(BOOL)a3
{
  DAEventDevicesPresent *v4;
  DAEventDevicesPresent *v5;
  DAEventDevicesPresent *v6;

  v4 = -[DAEvent initWithEventType:](self, "initWithEventType:", 50);
  v5 = v4;
  if (v4)
  {
    v4->_devicesPresent = a3;
    v6 = v4;
  }

  return v5;
}

- (DAEventDevicesPresent)initWithPresent:(BOOL)a3 devicesMigrated:(BOOL)a4
{
  DAEventDevicesPresent *v5;
  DAEventDevicesPresent *v6;
  DAEventDevicesPresent *v7;

  v5 = -[DAEventDevicesPresent initWithPresent:](self, "initWithPresent:", a3);
  v6 = v5;
  if (v5)
  {
    v5->_devicesMigrated = a4;
    v7 = v5;
  }

  return v6;
}

- (DAEventDevicesPresent)initWithMigration:(BOOL)a3
{
  DAEventDevicesPresent *v4;
  DAEventDevicesPresent *v5;
  DAEventDevicesPresent *v6;

  v4 = -[DAEvent initWithEventType:](self, "initWithEventType:", 15);
  v5 = v4;
  if (v4)
  {
    v4->_devicesMigrated = a3;
    v6 = v4;
  }

  return v5;
}

- (DAEventDevicesPresent)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DAEventDevicesPresent *v7;
  DAEventDevicesPresent *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAEventDevicesPresent;
  v7 = -[DAEvent initWithXPCObject:error:](&v10, sel_initWithXPCObject_error_, v6, a4);
  if (v7 && CUXPCDecodeBool() && CUXPCDecodeBool())
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DAEventDevicesPresent;
  -[DAEvent encodeWithXPCObject:](&v5, sel_encodeWithXPCObject_, v4);
  if (self->_devicesPresent)
    xpc_dictionary_set_BOOL(v4, "dvPr", 1);
  if (self->_devicesMigrated)
    xpc_dictionary_set_BOOL(v4, "dvMg", 1);
  CUXPCEncodeNSArrayOfObjects();

}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  id v5;
  __CFString *v6;
  NSArray *devices;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  NSArray *v12;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = 0;
  }
  CUAppendF();
  v5 = v4;

  CUAppendF();
  v6 = (__CFString *)v5;

  devices = self->_devices;
  if (devices)
  {
    v12 = devices;
    CUAppendF();
    v8 = v6;

    v6 = v8;
  }
  v9 = &stru_24D169BB8;
  if (v6)
    v9 = v6;
  v10 = v9;

  return v10;
}

- (BOOL)devicesPresent
{
  return self->_devicesPresent;
}

- (BOOL)devicesMigrated
{
  return self->_devicesMigrated;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
