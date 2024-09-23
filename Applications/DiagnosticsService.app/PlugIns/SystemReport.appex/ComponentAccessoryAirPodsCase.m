@implementation ComponentAccessoryAirPodsCase

- (ComponentAccessoryAirPodsCase)init
{
  ComponentAccessoryAirPodsCase *v2;
  uint64_t v3;
  DSEADevice *device;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ComponentAccessoryAirPodsCase;
  v2 = -[ComponentAccessoryAirPodsCase init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DSEADevice deviceWithModelNumber:](DSEADevice, "deviceWithModelNumber:", CFSTR("A1602")));
    device = v2->_device;
    v2->_device = (DSEADevice *)v3;

  }
  return v2;
}

- (BOOL)isPresent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessoryAirPodsCase device](self, "device"));
  v3 = v2 != 0;

  return v3;
}

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ComponentAccessoryAirPodsCase device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "information"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

}

- (DSEADevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
