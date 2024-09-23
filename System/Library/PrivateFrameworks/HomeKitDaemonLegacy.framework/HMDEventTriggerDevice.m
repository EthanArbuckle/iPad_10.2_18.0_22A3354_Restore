@implementation HMDEventTriggerDevice

- (HMDEventTriggerDevice)initWithCurrentDeviceForHome:(id)a3
{
  HMDEventTriggerDevice *v3;
  void *v4;
  uint64_t v5;
  HMDDevice *device;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDEventTriggerDevice;
  v3 = -[HMDEventTriggerDevice init](&v8, sel_init, a3);
  if (v3)
  {
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = objc_claimAutoreleasedReturnValue();
    device = v3->_device;
    v3->_device = (HMDDevice *)v5;

    v3->_currentDevice = 1;
  }
  return v3;
}

- (HMDEventTriggerDevice)initWithDevice:(id)a3 forHome:(id)a4
{
  id v6;
  HMDEventTriggerDevice *v7;
  HMDEventTriggerDevice *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDEventTriggerDevice;
  v7 = -[HMDEventTriggerDevice init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_device, a3);
    v8->_currentDevice = objc_msgSend(v6, "isCurrentDevice");
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDEventTriggerDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    -[HMDEventTriggerDevice device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[Event-trigger-device: %@]"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Event-trigger-device: THIS-DEVICE]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMDEventTriggerDevice *v4;
  HMDEventTriggerDevice *v5;
  HMDEventTriggerDevice *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (HMDEventTriggerDevice *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDEventTriggerDevice device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

      }
      else
      {
        -[HMDEventTriggerDevice device](v6, "device");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          v8 = 1;
          goto LABEL_12;
        }
      }
      -[HMDEventTriggerDevice device](self, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerDevice device](v6, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = HMFEqualObjects();

    }
    else
    {
      v8 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HMDEventTriggerDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[HMDEventTriggerDevice device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (HMDDevice)device
{
  return self->_device;
}

- (BOOL)isCurrentDevice
{
  return self->_currentDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
