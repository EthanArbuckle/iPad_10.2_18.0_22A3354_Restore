@implementation HMDAppleAccessoryPairingHomeState

- (HMDAppleAccessoryPairingHomeState)initWithCloudZoneID:(id)a3 accessory:(id)a4
{
  id v7;
  id v8;
  HMDAppleAccessoryPairingHomeState *v9;
  HMDAppleAccessoryPairingHomeState *v10;
  NSUUID *homeUUID;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAppleAccessoryPairingHomeState;
  v9 = -[HMDAppleAccessoryPairingHomeState init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cloudZoneID, a3);
    v10->_state = 0;
    homeUUID = v10->_homeUUID;
    v10->_homeUUID = 0;

    objc_storeStrong((id *)&v10->_accessory, a4);
  }

  return v10;
}

- (HMSoftwareUpdateDescriptor)lastPostedSoftwareUpdateDescriptor
{
  os_unfair_lock_s *p_lock;
  HMSoftwareUpdateDescriptor *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lastPostedSoftwareUpdateDescriptor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLastPostedSoftwareUpdateDescriptor:(id)a3
{
  HMSoftwareUpdateDescriptor *v4;
  HMSoftwareUpdateDescriptor *lastPostedSoftwareUpdateDescriptor;

  v4 = (HMSoftwareUpdateDescriptor *)a3;
  os_unfair_lock_lock_with_options();
  lastPostedSoftwareUpdateDescriptor = self->_lastPostedSoftwareUpdateDescriptor;
  self->_lastPostedSoftwareUpdateDescriptor = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDDevice)device
{
  os_unfair_lock_s *p_lock;
  HMDDevice *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_device;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDevice:(id)a3
{
  HMDDevice *v4;
  HMDDevice *device;

  v4 = (HMDDevice *)a3;
  os_unfair_lock_lock_with_options();
  device = self->_device;
  self->_device = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)homeUUID
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_homeUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHomeUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *homeUUID;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  homeUUID = self->_homeUUID;
  self->_homeUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSUUID)deviceIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_deviceIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDeviceIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *deviceIdentifier;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDAppleAccessoryPairingHomeState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAppleAccessoryPairingHomeState *v11;
  HMDAppleAccessoryPairingHomeState *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AAPS.cz"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AAPS.st"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AAPS.a"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AAPS.d"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AAPS.du"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AAPS.hu"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMDAppleAccessoryPairingHomeState initWithCloudZoneID:accessory:](self, "initWithCloudZoneID:accessory:", v5, v7);
  v12 = v11;
  if (v11)
  {
    v11->_state = v6;
    objc_storeStrong((id *)&v11->_homeUUID, v10);
    objc_storeStrong((id *)&v12->_deviceIdentifier, v9);
    objc_storeStrong((id *)&v12->_device, v8);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMDAppleAccessoryPairingHomeState cloudZoneID](self, "cloudZoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AAPS.cz"));

  -[HMDAppleAccessoryPairingHomeState accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("AAPS.a"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDAppleAccessoryPairingHomeState state](self, "state"), CFSTR("AAPS.st"));
  -[HMDAppleAccessoryPairingHomeState homeUUID](self, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("AAPS.hu"));

  -[HMDAppleAccessoryPairingHomeState deviceIdentifier](self, "deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("AAPS.du"));

  -[HMDAppleAccessoryPairingHomeState device](self, "device");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("AAPS.d"));

}

- (HMBCloudZoneID)cloudZoneID
{
  return self->_cloudZoneID;
}

- (HMDUnassociatedAppleMediaAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_cloudZoneID, 0);
  objc_storeStrong((id *)&self->_lastPostedSoftwareUpdateDescriptor, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
