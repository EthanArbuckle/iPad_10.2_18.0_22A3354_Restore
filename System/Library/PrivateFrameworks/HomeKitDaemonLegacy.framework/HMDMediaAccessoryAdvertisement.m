@implementation HMDMediaAccessoryAdvertisement

- (HMDMediaAccessoryAdvertisement)initWithOutputDevice:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HMDMediaAccessoryAdvertisement *v12;
  HMDMediaAccessoryAdvertisement *v13;
  objc_super v15;

  v5 = a3;
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HMDMediaAccessoryAdvertisement canAirPortExpressSupportMediaAccessory:](HMDMediaAccessoryAdvertisement, "canAirPortExpressSupportMediaAccessory:", v8))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v10 = (void *)objc_msgSend(v9, "initWithUUIDString:", *MEMORY[0x1E0CB7A08]);
    objc_msgSend(MEMORY[0x1E0CBA1D8], "categoryWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA1D8], "categoryForProductClass:", HMFProductClassFromString());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v15.receiver = self;
  v15.super_class = (Class)HMDMediaAccessoryAdvertisement;
  v12 = -[HMDAccessoryAdvertisement initWithIdentifier:name:category:](&v15, sel_initWithIdentifier_name_category_, v6, v7, v11);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_outputDevice, a3);

  return v13;
}

- (BOOL)matchesWACDeviceID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[HMDAccessoryAdvertisement identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "caseInsensitiveCompare:", v4);

  return v6 == 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HMDMediaAccessoryAdvertisement;
  -[HMDAccessoryAdvertisement description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaAccessoryAdvertisement outputDevice](self, "outputDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[ %@, modelID = %@]"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMDMediaOutputDevice)outputDevice
{
  os_unfair_lock_s *p_lock;
  HMDMediaOutputDevice *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_outputDevice;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOutputDevice:(id)a3
{
  HMDMediaOutputDevice *v4;
  HMDMediaOutputDevice *outputDevice;

  v4 = (HMDMediaOutputDevice *)a3;
  os_unfair_lock_lock_with_options();
  outputDevice = self->_outputDevice;
  self->_outputDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isAssociated
{
  HMDMediaAccessoryAdvertisement *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_associated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAssociated:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_associated = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)associationOptions
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[HMDMediaAccessoryAdvertisement outputDevice](self, "outputDevice");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaAccessoryAdvertisement outputDevice](self, "outputDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "supportsWHA");

  if ((v3 & 1) != 0
    || !+[HMDMediaAccessoryAdvertisement canAirPortExpressSupportMediaAccessory:](HMDMediaAccessoryAdvertisement, "canAirPortExpressSupportMediaAccessory:", v4))
  {
    v6 = 0;
  }
  else
  {
    v6 = 2;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevice, 0);
}

+ (BOOL)canAirPortExpressSupportMediaAccessory:(id)a3
{
  return objc_msgSend(a3, "isEqual:", CFSTR("AirPort10,115"));
}

@end
