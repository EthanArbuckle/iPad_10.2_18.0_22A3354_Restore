@implementation HUPresenceCurrentUserLocationDevice

+ (id)FMFDevice
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:customDevice:", 0, 0);
}

+ (id)currentDevice
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:customDevice:", 1, 0);
}

+ (id)customDeviceWithHMDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:customDevice:", 2, v4);

  return v5;
}

- (HUPresenceCurrentUserLocationDevice)initWithType:(unint64_t)a3 customDevice:(id)a4
{
  id v7;
  HUPresenceCurrentUserLocationDevice *v8;
  HUPresenceCurrentUserLocationDevice *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUPresenceCurrentUserLocationDevice;
  v8 = -[HUPresenceCurrentUserLocationDevice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_customDevice, a4);
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (HMDevice)customDevice
{
  return self->_customDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDevice, 0);
}

@end
