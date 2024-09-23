@implementation HMDResidentUser

- (HMDResidentUser)initWithModelObject:(id)a3
{
  id v4;
  HMDResidentUser *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  HMDDevice *device;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDResidentUser;
  v5 = -[HMDUser initWithModelObject:](&v13, sel_initWithModelObject_, v4);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v5->_residentUserLock._os_unfair_lock_opaque = 0;
      objc_msgSend(v8, "device");
      v9 = objc_claimAutoreleasedReturnValue();
      device = v5->_device;
      v5->_device = (HMDDevice *)v9;

      objc_msgSend(v8, "configState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_configurationState = (int)objc_msgSend(v11, "intValue");

    }
    -[HMDUser _setRemoteAccessAllowed:](v5, "_setRemoteAccessAllowed:", 0);

  }
  return v5;
}

- (HMDResidentUser)initWithDevice:(id)a3 home:(id)a4 pairingIdentity:(id)a5 configurationState:(unint64_t)a6
{
  id v11;
  HMDResidentUser *v12;
  HMDResidentUser *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDResidentUser;
  v12 = -[HMDUser initWithAccountHandle:home:pairingIdentity:privilege:](&v15, sel_initWithAccountHandle_home_pairingIdentity_privilege_, 0, a4, a5, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a3);
    v13->_configurationState = a6;
    -[HMDUser _setRemoteAccessAllowed:](v13, "_setRemoteAccessAllowed:", 0);
  }

  return v13;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDResidentUser *v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDResidentUser;
  -[HMDUser configureWithHome:](&v9, sel_configureWithHome_, v4);
  if (-[HMDResidentUser isBlocked](self, "isBlocked")
    && -[HMDResidentUser configurationState](self, "configurationState") == 2)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Disabling as we are blocked", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDResidentUser setConfigurationState:](v6, "setConfigurationState:", 3);
  }

}

- (id)userID
{
  void *v2;
  void *v3;

  -[HMDResidentUser device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDestinationString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)deviceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDResidentUser device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "idsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)refreshDisplayName
{
  return 0;
}

- (id)displayName
{
  void *v2;
  void *v3;

  -[HMDResidentUser device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)requiresMakoSupport
{
  return 0;
}

- (void)registerIdentity
{
  void *v3;
  void *v4;
  id v5;

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentUser device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerIdentity:device:object:", v5, v4, self);

  }
}

- (HMDDevice)device
{
  os_unfair_lock_s *p_residentUserLock;
  HMDDevice *v4;

  p_residentUserLock = &self->_residentUserLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_device;
  os_unfair_lock_unlock(p_residentUserLock);
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

  os_unfair_lock_unlock(&self->_residentUserLock);
}

- (BOOL)updateWithDevice:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  HMDResidentUser *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  HMDResidentUser *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDResidentUser device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

    if (!v5)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v10;
        v22 = 2112;
        v23 = v4;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating the device: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDResidentUser setDevice:](v8, "setDevice:", v4);
    }
    -[HMDResidentUser device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v18;
        v22 = 2112;
        v23 = v4;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating the device: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDResidentUser setDevice:](v16, "setDevice:", v4);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isBlocked
{
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "productPlatform");

  if (v4 == 3)
  {
    v5 = 0;
  }
  else
  {
    -[HMDUser home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v5 = objc_msgSend(v6, "isOwnerUser") - 1;
    else
      v5 = 0;

  }
  return v5 & 1;
}

- (unint64_t)configurationState
{
  os_unfair_lock_s *p_residentUserLock;
  unint64_t configurationState;

  p_residentUserLock = &self->_residentUserLock;
  os_unfair_lock_lock_with_options();
  configurationState = self->_configurationState;
  os_unfair_lock_unlock(p_residentUserLock);
  return configurationState;
}

- (void)setConfigurationState:(unint64_t)a3
{
  os_unfair_lock_s *p_residentUserLock;

  p_residentUserLock = &self->_residentUserLock;
  os_unfair_lock_lock_with_options();
  self->_configurationState = a3;
  os_unfair_lock_unlock(p_residentUserLock);
}

- (id)legacyUser
{
  return -[__HMDLegacyResidentUser initWithResidentUser:]([__HMDLegacyResidentUser alloc], "initWithResidentUser:", self);
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMDResidentUser;
  -[HMDUser modelObjectWithChangeType:version:](&v13, sel_modelObjectWithChangeType_version_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  if (v7)
  {
    -[HMDResidentUser device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDevice:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDResidentUser configurationState](self, "configurationState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConfigState:", v9);

    -[HMDResidentUser encodingRemoteDisplayName](self, "encodingRemoteDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayName:", v10);

    -[HMDResidentUser deviceIdentifier](self, "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceIdentifier:", v11);

  }
  return v5;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  unint64_t v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  HMDResidentUser *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v13, "device");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v13, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentUser device](self, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = HMFEqualObjects();

      if (v18)
      {
        objc_msgSend(v13, "device");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDResidentUser setDevice:](self, "setDevice:", v19);

      }
    }
    objc_msgSend(v13, "configState");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(v13, "configState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "intValue");
      v24 = -[HMDResidentUser configurationState](self, "configurationState");

      if (v24 != v23)
      {
        -[HMDUser home](self, "home");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isOwnerUser");

        objc_msgSend(v13, "configState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "intValue");
        v29 = v28;
        if (v26)
        {
          -[HMDResidentUser setConfigurationState:](self, "setConfigurationState:", v28);

        }
        else
        {

          if (v29 == 2)
          {
            v30 = (void *)MEMORY[0x1D17BA0A0]();
            v31 = self;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v39 = v33;
              _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Disabling", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v30);
            -[HMDResidentUser setConfigurationState:](v31, "setConfigurationState:", 3);
          }
        }
      }
    }
  }
  v34 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v35 = v34;
  else
    v35 = 0;
  v36 = v35;

  if (v36)
  {
    v37.receiver = self;
    v37.super_class = (Class)HMDResidentUser;
    -[HMDUser _transactionUserUpdated:newValues:message:](&v37, sel__transactionUserUpdated_newValues_message_, 0, v36, v10);
  }

}

- (HMDResidentUser)initWithCoder:(id)a3
{
  id v4;
  HMDResidentUser *v5;
  uint64_t v6;
  void *device;
  void *v8;
  void *v9;
  uint64_t v10;
  HMDDevice *v11;
  void *v12;
  void *v13;
  HMDResidentUser *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  HMDResidentUser *v18;
  void *v19;
  void *v21;
  HMDResidentUser *v22;
  NSObject *v23;
  void *v24;
  HMDAssertionLogEvent *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMDResidentUser;
  v5 = -[HMDUser initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_configurationState = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("residentConfigState"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.device")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.device"));
      v6 = objc_claimAutoreleasedReturnValue();
      device = v5->_device;
      v5->_device = (HMDDevice *)v6;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userID"));
    device = (void *)objc_claimAutoreleasedReturnValue();
    if (device)
    {
      +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", device);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deviceForHandle:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v5->_device;
        v5->_device = (HMDDevice *)v10;

      }
    }
    if (v5->_device)
    {
      -[HMDResidentUser userID](v5, "userID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_16;
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = v5;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v16;
        v30 = 2112;
        v31 = device;
        v17 = "%{public}@Could not determine userID from device generated for HMDResidentUser with expected destination: %@";
LABEL_14:
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);

      }
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = v5;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v16;
        v30 = 2112;
        v31 = device;
        v17 = "%{public}@Failed to resolve device for HMDResidentUser with expected destination: %@";
        goto LABEL_14;
      }
    }

    objc_autoreleasePoolPop(v13);
LABEL_16:
    -[HMDResidentUser userID](v5, "userID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v5;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v24;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Missing expected userID", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      v25 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Missing expected userID"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "submitLogEvent:", v25);

    }
    goto LABEL_17;
  }
LABEL_18:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDResidentUser;
  -[HMDUser encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[HMDResidentUser device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.device"));

  if ((objc_msgSend(v4, "hmd_isForSharedUser") & 1) != 0)
    v6 = 3;
  else
    v6 = -[HMDResidentUser configurationState](self, "configurationState");
  objc_msgSend(v4, "encodeInt32:forKey:", v6, CFSTR("residentConfigState"));
  objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("userIsRemoteGateway"));
  -[HMDResidentUser deviceIdentifier](self, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("residentIdentifier"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
