@implementation HMDAppleMediaAccessoryAdvertisement

- (HMDAppleMediaAccessoryAdvertisement)initWithOutputDevice:(id)a3 device:(id)a4
{
  id v7;
  HMDAppleMediaAccessoryAdvertisement *v8;
  HMDAppleMediaAccessoryAdvertisement *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAppleMediaAccessoryAdvertisement;
  v8 = -[HMDMediaAccessoryAdvertisement initWithOutputDevice:](&v11, sel_initWithOutputDevice_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_device, a4);

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)HMDAppleMediaAccessoryAdvertisement;
  -[HMDMediaAccessoryAdvertisement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryAdvertisement device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[ %@, device = %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMDDevice)device
{
  return (HMDDevice *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
