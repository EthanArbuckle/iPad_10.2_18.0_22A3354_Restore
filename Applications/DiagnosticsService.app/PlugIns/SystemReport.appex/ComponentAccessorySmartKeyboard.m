@implementation ComponentAccessorySmartKeyboard

- (ComponentAccessorySmartKeyboard)init
{
  ComponentAccessorySmartKeyboard *v2;
  uint64_t v3;
  DSIOHIDDevice *device;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ComponentAccessorySmartKeyboard;
  v2 = -[ComponentAccessorySmartKeyboard init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DSIOHIDDevice deviceMatchingAccessories:](DSIOHIDDevice, "deviceMatchingAccessories:", &off_1000B25C0));
    device = v2->_device;
    v2->_device = (DSIOHIDDevice *)v3;

  }
  return v2;
}

- (BOOL)isPresent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessorySmartKeyboard device](self, "device"));
  v3 = v2 != 0;

  return v3;
}

- (void)populateAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessorySmartKeyboard device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromHIDReport:", 17));

  if (v5)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("serialNumber"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("serialNumber"));

  }
}

- (DSIOHIDDevice)device
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
