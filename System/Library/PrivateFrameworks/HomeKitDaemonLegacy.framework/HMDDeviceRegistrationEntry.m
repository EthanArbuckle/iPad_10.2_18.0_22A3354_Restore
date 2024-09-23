@implementation HMDDeviceRegistrationEntry

- (HMDDeviceRegistrationEntry)initWithDevice:(id)a3 accessoryList:(id)a4
{
  id v7;
  id v8;
  HMDDeviceRegistrationEntry *v9;
  HMDDeviceRegistrationEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDDeviceRegistrationEntry;
  v9 = -[HMDDeviceRegistrationEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_accessoryUUIDList, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMDDeviceRegistrationEntry *v4;
  HMDDeviceRegistrationEntry *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HMDDeviceRegistrationEntry *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMDDeviceRegistrationEntry device](self, "device");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDeviceRegistrationEntry device](v5, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (HMDDevice)device
{
  return self->_device;
}

- (NSArray)accessoryUUIDList
{
  return self->_accessoryUUIDList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUIDList, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
