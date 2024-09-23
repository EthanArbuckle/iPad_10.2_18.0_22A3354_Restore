@implementation HMDResidentDevice

- (HMDResidentDevice)initWithModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDResidentDevice *v13;
  void *v14;
  void *v15;
  HMDResidentDevice *v16;
  HMDResidentDevice *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "deviceUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

    +[HMDDeviceController placeholderDeviceControllerWithIdentifier:](HMDDeviceController, "placeholderDeviceControllerWithIdentifier:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (!v5)
    {
      objc_msgSend(v4, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDeviceController deviceControllerForDevice:](HMDDeviceController, "deviceControllerForDevice:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateWithDevice:completionHandler:", v11, 0);

  }
  if (v5)
  {
    objc_msgSend(v4, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDResidentDevice initWithDeviceController:identifier:](self, "initWithDeviceController:identifier:", v5, v12);

    if (v13)
    {
      objc_msgSend(v4, "enabled");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_enabled = objc_msgSend(v14, "BOOLValue");

      objc_msgSend(v4, "confirmed");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_confirmed = objc_msgSend(v15, "BOOLValue");

    }
    v16 = v13;
    v17 = v16;
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "device");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("YES");
      v27 = 138544130;
      v28 = v20;
      if (!v24)
        v25 = CFSTR("NO");
      v29 = 2112;
      v30 = v21;
      v31 = 2112;
      v32 = v23;
      v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not retrieve device with UUID %@ for resident: %@; device encoding present: %@",
        (uint8_t *)&v27,
        0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (HMDResidentDevice)initWithDevice:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDResidentDevice *v10;
  HMDResidentDevice *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    +[HMDDeviceController deviceControllerForDevice:](HMDDeviceController, "deviceControllerForDevice:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDResidentDevice initWithDeviceController:identifier:](self, "initWithDeviceController:identifier:", v9, v8);

    if (v10)
      objc_storeStrong((id *)&v10->_device, a3);
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDResidentDevice shortDescription](HMDResidentDevice, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%@] Device is required.", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[HMDResidentDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HMDResidentDevice)initWithDeviceController:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  HMDResidentDevice *v9;
  HMDResidentDevice *v10;
  HMDResidentDevice *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDResidentDevice;
    v9 = -[HMDResidentDevice init](&v13, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_identifier, a4);
      v10->_enabled = 1;
      v10->_reachable = 1;
      objc_storeStrong((id *)&v10->_deviceController, a3);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDResidentDevice;
  -[HMDResidentDevice dealloc](&v4, sel_dealloc);
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDDevice *device;
  void *v8;
  HMDResidentDevice *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v4);
  objc_msgSend(v4, "residentDeviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_residentDeviceManager, v5);

  os_unfair_lock_unlock(&self->_lock);
  -[HMDDeviceController setDelegate:](self->_deviceController, "setDelegate:", self);
  -[HMDResidentDevice device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __registerForDeviceNotifications(self, v6);

  device = self->_device;
  self->_device = 0;

  if (-[HMDResidentDevice isBlocked](self, "isBlocked") && (objc_msgSend(v4, "isOwnerUser") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Disabling as we are blocked", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDResidentDevice setEnabled:](v9, "setEnabled:", 0);
  }

}

- (BOOL)isBlocked
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HMDResidentDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  if (isBlocked_onceToken != -1)
    dispatch_once(&isBlocked_onceToken, &__block_literal_global_101555);
  -[HMDResidentDevice device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAtLeastVersion:", isBlocked_unblockedVersion);

  return v6 ^ 1;
}

- (unint64_t)legacyResidentCapabilities
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HMDResidentDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = residentCapabilitiesForDevice(v4, v5);

  return v6;
}

- (HMResidentCapabilities)capabilities
{
  void *v2;
  void *v3;

  -[HMDResidentDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMResidentCapabilities *)v3;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@ Ver: %@"), v4, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v5 = shouldLogPrivateInformation();
  -[HMDResidentDevice device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v6, "privateDescription");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[HMDResidentDevice shortDescription](self, "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_1E89C3E38;
  }
  -[HMDResidentDevice isEnabled](self, "isEnabled");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice isConfirmed](self, "isConfirmed");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice isReachable](self, "isReachable");
  HMFBooleanToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@%@, Enabled = %@, Confirmed = %@, Reachable = %@, Device = %@>"), v10, v11, v12, v13, v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v15;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDResidentDevice descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDResidentDevice descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)privateDescription
{
  return -[HMDResidentDevice descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDResidentDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDResidentDevice *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMDResidentDevice *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMDResidentDevice device](v4, "device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDevice device](self, "device");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (HMDHome)home
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMDHome *)WeakRetained;
}

- (HMDResidentDeviceManager)residentDeviceManager
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_residentDeviceManager);
  os_unfair_lock_unlock(p_lock);
  return (HMDResidentDeviceManager *)WeakRetained;
}

- (unint64_t)status
{
  unint64_t v3;
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;

  if (-[HMDResidentDevice isEnabled](self, "isEnabled"))
    v3 = -[HMDResidentDevice isReachable](self, "isReachable");
  else
    v3 = 0;
  -[HMDResidentDevice home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryResident");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", self);

  if (v6)
    v7 = v3 | 2;
  else
    v7 = v3;
  if (-[HMDResidentDevice isLowBattery](self, "isLowBattery"))
    v7 |= 8uLL;
  if (-[HMDResidentDevice batteryState](self, "batteryState") == 1)
    return v7 | 4;
  else
    return v7;
}

- (BOOL)isConfirmed
{
  void *v3;
  void *v4;
  void *v5;
  char confirmed;
  os_unfair_lock_s *p_lock;

  -[HMDResidentDevice residentDeviceManager](self, "residentDeviceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isResidentElectionV2Enabled"))
  {
    objc_msgSend(v3, "primaryResidentUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HMDResidentDevice identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      confirmed = objc_msgSend(v4, "isEqual:", v5);

    }
    else
    {
      confirmed = 0;
    }

  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    confirmed = self->_confirmed;
    os_unfair_lock_unlock(p_lock);
  }

  return confirmed;
}

- (BOOL)supportsSharedEventTriggerActivation
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HMDResidentDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 3) & 1;
}

- (BOOL)supportsMediaSystem
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HMDResidentDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 4) & 1;
}

- (BOOL)supportsMediaActions
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HMDResidentDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 9) & 1;
}

- (BOOL)supportsShortcutActions
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HMDResidentDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 8) & 1;
}

- (BOOL)supportsFirmwareUpdate
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HMDResidentDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 11) & 1;
}

- (BOOL)supportsResidentFirmwareUpdate
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HMDResidentDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 23) & 1;
}

- (BOOL)supportsCustomMediaApplicationDestination
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HMDResidentDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 24) & 1;
}

- (BOOL)supportsResidentSelection
{
  void *v2;
  char v3;

  -[HMDResidentDevice capabilitiesInternal](self, "capabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsResidentSelection");

  return v3;
}

- (id)runtimeState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0CB9908];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E0CB9918];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDResidentDevice status](self, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = *MEMORY[0x1E0CB98F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDResidentDevice legacyResidentCapabilities](self, "legacyResidentCapabilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = *MEMORY[0x1E0CB9928];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDResidentDevice supportsResidentSelection](self, "supportsResidentSelection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isCurrentDevice
{
  void *v2;
  char v3;

  -[HMDResidentDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevice");

  return v3;
}

- (HMDDevice)device
{
  void *v2;
  void *v3;

  -[HMDResidentDevice deviceController](self, "deviceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDDevice *)v3;
}

- (id)deviceController
{
  os_unfair_lock_s *p_lock;
  HMDDeviceController *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_deviceController;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)__deviceUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDResidentDevice *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HMDResidentDevice device](self, "device");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification device was updated", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDResidentDevice residentDeviceManager](v10, "residentDeviceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "notifyClientsOfUpdatedResidentDevice:", v10);

  }
}

- (unint64_t)productTypeForModelIdentifier:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = a3;
  if (productTypeForModelIdentifier__onceToken != -1)
    dispatch_once(&productTypeForModelIdentifier__onceToken, &__block_literal_global_58_101524);
  objc_msgSend((id)productTypeForModelIdentifier__modelIdentifierToProductTypeMap, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)productTypeForModelIdentifier__modelIdentifierToProductTypeMap, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "unsignedIntValue");

  }
  return v4;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v12;
  else
    v8 = 0;
  v9 = v8;
  if (v9)
  {
    -[HMDResidentDevice _residentDeviceModelUpdated:newValues:message:](self, "_residentDeviceModelUpdated:newValues:message:", 0, v9, v7);
  }
  else
  {
    objc_msgSend(v7, "responseHandler");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

    v7 = (id)v10;
  }

}

- (void)_residentDeviceModelUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  HMDResidentDevice *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  HMDDeviceController *v41;
  HMDDeviceController *deviceController;
  HMDDeviceController *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  HMDResidentDevice *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  HMDResidentDevice *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  int v74;
  void *v75;
  int v76;
  BOOL v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  _QWORD *v83;
  void *v84;
  HMDResidentDevice *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void (**v95)(_QWORD, _QWORD, _QWORD);
  int v96;
  id v97;
  void *v98;
  _QWORD v99[5];
  _QWORD v100[4];
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  const __CFString *v110;
  void *v111;
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  void *v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v97 = a5;
  objc_msgSend(v97, "transactionResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isCurrentDevice");

  if (v12)
    v13 = (objc_msgSend(v10, "source") & 0xFFFFFFFFFFFFFFFELL) == 2;
  else
    v13 = 0;
  -[HMDResidentDevice device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    -[HMDResidentDevice device](self, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "backingStoreObjectsWithChangeType:version:", 0, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v107;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v107 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * i), "dumpDebug:", CFSTR("LOCAL: "));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
      }
      while (v18);
    }

  }
  objc_msgSend(v9, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    objc_msgSend(v9, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "backingStoreObjectsWithChangeType:version:", 0, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v103;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v103 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * j), "dumpDebug:", CFSTR("REMOTE: "));
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
      }
      while (v25);
    }

  }
  objc_msgSend(v9, "deviceUUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v98 = v10;
  if (v28)
  {
    v29 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v9, "deviceUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithUUIDString:", v30);

    -[HMDResidentDevice deviceController](self, "deviceController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v31, "hmf_isEqualToUUID:", v33);

    if ((v34 & 1) == 0)
    {
      v35 = (void *)MEMORY[0x1D17BA0A0]();
      v36 = self;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v38 = v8;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "UUIDString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v113 = v39;
        v114 = 2112;
        v115 = v40;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Updating the underlying device with identifier: %@", buf, 0x16u);

        v8 = v38;
      }

      objc_autoreleasePoolPop(v35);
      +[HMDDeviceController placeholderDeviceControllerWithIdentifier:](HMDDeviceController, "placeholderDeviceControllerWithIdentifier:", v31);
      v41 = (HMDDeviceController *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock_with_options();
      deviceController = v36->_deviceController;
      v36->_deviceController = v41;
      v43 = v41;

      os_unfair_lock_unlock(&v36->_lock);
      -[HMDDeviceController setDelegate:](v43, "setDelegate:", v36);
      -[HMDDeviceController device](v43, "device");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      __handleUpdatedDevice(v36, v44);
      objc_msgSend(v98, "markChanged");
    }

    v10 = v98;
  }
  objc_msgSend(v9, "device");
  v45 = objc_claimAutoreleasedReturnValue();
  if (!v45)
    goto LABEL_35;
  v46 = (void *)v45;
  -[HMDResidentDevice device](self, "device");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v47, "isBackingStorageEqual:", v48);

  if ((v49 & 1) != 0)
    goto LABEL_35;
  if (!v13)
  {
    -[HMDResidentDevice deviceController](self, "deviceController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "device");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "updateWithDevice:completionHandler:", v58, 0);

LABEL_35:
    v96 = 0;
    goto LABEL_36;
  }
  v50 = (void *)MEMORY[0x1D17BA0A0]();
  v51 = self;
  HMFGetOSLogHandle();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDevice device](v51, "device");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "device");
    v55 = v8;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v113 = v53;
    v114 = 2112;
    v115 = v54;
    v116 = 2112;
    v117 = v56;
    _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Cloud changed our device, preferring local device -- local: %@, cloud :%@", buf, 0x20u);

    v8 = v55;
    v10 = v98;

  }
  objc_autoreleasePoolPop(v50);
  v96 = 1;
LABEL_36:
  objc_msgSend(v9, "enabled");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = -[HMDResidentDevice isEnabled](self, "isEnabled");
    objc_msgSend(v9, "enabled");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "BOOLValue");

    if (v60 != v62)
    {
      objc_msgSend(v9, "enabled");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v63, "BOOLValue"))
      {
LABEL_41:

LABEL_42:
        objc_msgSend(v10, "markChanged");
        objc_msgSend(v9, "enabled");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDResidentDevice _handleResidentDeviceUpdateEnabled:](self, "_handleResidentDeviceUpdateEnabled:", objc_msgSend(v65, "BOOLValue"));

        v110 = CFSTR("kEnabledKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_48;
      }
      -[HMDResidentDevice home](self, "home");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v64, "isOwnerUser"))
      {

        goto LABEL_41;
      }
      v67 = -[HMDResidentDevice isBlocked](self, "isBlocked");

      if (!v67)
        goto LABEL_42;
      v68 = (void *)MEMORY[0x1D17BA0A0]();
      v69 = self;
      HMFGetOSLogHandle();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v113 = v71;
        _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_INFO, "%{public}@Not enabling, we are currently blocked", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v68);
    }
    v59 = 0;
  }
LABEL_48:
  objc_msgSend(v9, "confirmed");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = (void *)v72;
    v74 = -[HMDResidentDevice isConfirmed](self, "isConfirmed");
    objc_msgSend(v9, "confirmed");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "BOOLValue");

    v77 = v74 == v76;
    v10 = v98;
    if (!v77)
    {
      objc_msgSend(v98, "markChanged");
      objc_msgSend(v9, "confirmed");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDevice _handleResidentDeviceUpdateConfirmed:](self, "_handleResidentDeviceUpdateConfirmed:", objc_msgSend(v78, "BOOLValue"));

    }
  }
  v79 = v8;
  if (objc_msgSend(v10, "changed"))
  {
    -[HMDResidentDevice residentDeviceManager](self, "residentDeviceManager");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "notifyClientsOfUpdatedResidentDevice:", self);

  }
  -[HMDResidentDevice home](self, "home");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = MEMORY[0x1E0C809B0];
  v83 = (_QWORD *)&unk_1CDB8E000;
  if (v96)
  {
    v84 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v10, "markChanged"));
    v85 = self;
    HMFGetOSLogHandle();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDevice device](v85, "device");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v113 = v87;
      v114 = 2112;
      v115 = v88;
      _os_log_impl(&dword_1CD062000, v86, OS_LOG_TYPE_INFO, "%{public}@Pushing back with current device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v84);
    -[HMDResidentDevice modelObjectWithChangeType:version:](v85, "modelObjectWithChangeType:version:", 2, 4);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "backingStore");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "transaction:options:", CFSTR("residentUpdated"), v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v92, "add:", v89);
    v82 = MEMORY[0x1E0C809B0];
    v100[0] = MEMORY[0x1E0C809B0];
    v83 = &unk_1CDB8E000;
    v100[1] = 3221225472;
    v100[2] = __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke;
    v100[3] = &unk_1E89C2350;
    v101 = v81;
    objc_msgSend(v92, "save:", v100);

    v10 = v98;
  }
  objc_msgSend(v81, "backingStore");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v82;
  v99[1] = v83[202];
  v99[2] = __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke_2;
  v99[3] = &unk_1E89C2350;
  v99[4] = self;
  objc_msgSend(v93, "submitBlock:", v99);

  objc_msgSend(v97, "responseHandler");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
  {
    objc_msgSend(v97, "responseHandler");
    v95 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v95)[2](v95, 0, v59);

  }
}

- (void)_handleResidentDeviceUpdateEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  HMDResidentDevice *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  if (-[HMDResidentDevice isEnabled](self, "isEnabled") != a3)
  {
    -[HMDResidentDevice setEnabled:](self, "setEnabled:", v3);
    -[HMDResidentDevice residentDeviceManager](self, "residentDeviceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateResidentAvailability");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("HMDResidentDeviceEnabledStateChangedNotification"), self);

    -[HMDResidentDevice home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryResidentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCurrentDevice");

    if (v10)
    {
      v11 = -[HMDResidentDevice isEnabled](self, "isEnabled");
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v15)
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v16;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations with resident due to primary resident enabled", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
        -[HMDResidentDevice device](v13, "device");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "enableNotificationsForDevices:", v18);
      }
      else
      {
        if (v15)
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v19;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations resident due to primary resident disabled", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
        -[HMDResidentDevice device](v13, "device");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "disableNotificationsForDevices:", v18);
      }

    }
    objc_msgSend(v5, "primaryResidentUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v3)
    {
      if (v20)
      {

        -[HMDResidentDevice device](self, "device");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isCurrentDevice");

        if (v23)
          objc_msgSend(v5, "confirmOnAvailability");
        goto LABEL_19;
      }
      v26 = 3;
    }
    else
    {
      -[HMDResidentDevice identifier](self, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v21, "isEqual:", v24);

      if (!v25)
      {
LABEL_19:

        return;
      }
      v26 = 4;
    }
    objc_msgSend(v5, "electResidentDevice:", v26);
    goto LABEL_19;
  }
}

- (void)_handleResidentDeviceUpdateConfirmed:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int confirmed;
  void *v7;
  HMDResidentDevice *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  confirmed = self->_confirmed;
  self->_confirmed = v3;
  os_unfair_lock_unlock(p_lock);
  if (confirmed != v3)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of resident device confirmed state changing to %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentDevice home](v8, "home", CFSTR("HMDResidentDeviceHomeUUIDNotificationKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("HMDResidentDeviceResidentNotificationKey");
    v20[0] = v13;
    v20[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), v8, v14);

    if ((v3 & 1) == 0)
    {
      -[HMDResidentDevice device](v8, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isCurrentDevice");

      if (v17)
      {
        -[HMDResidentDevice residentDeviceManager](v8, "residentDeviceManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "confirmAsResident");

      }
    }

  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  HMDResidentDeviceModel *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentDeviceModel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  HMDDevice *device;

  v7 = [HMDResidentDeviceModel alloc];
  -[HMDResidentDevice identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", a3, v8, v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceModel setEnabled:](v11, "setEnabled:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDResidentDevice isConfirmed](self, "isConfirmed"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceModel setConfirmed:](v11, "setConfirmed:", v13);

  -[HMDResidentDevice device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "version");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", CFSTR("4.0"));
  v17 = objc_msgSend(v15, "isAtLeastVersion:", v16);

  v18 = isWatch();
  if (v18
    && (+[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v15, "supportsCloudDataSync")))
  {
    v20 = 1;
  }
  else
  {
    -[HMDResidentDevice home](self, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isOwnerUser") ^ 1;

    if (!v18)
    {
      if (!v17)
        goto LABEL_12;
      goto LABEL_8;
    }
  }

  if (!v17)
  {
LABEL_12:
    objc_msgSend(v14, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceModel setDeviceUUID:](v11, "setDeviceUUID:", v24);

    if (v20 && self->_device)
    {
      -[HMDResidentDeviceModel setDevice:](v11, "setDevice:");
      device = self->_device;
      self->_device = 0;

    }
    else
    {
      -[HMDResidentDeviceModel setDevice:](v11, "setDevice:", v14);
    }
    goto LABEL_16;
  }
LABEL_8:
  v21 = objc_msgSend(v14, "isCurrentDevice");
  if (a4 > 3)
    v22 = v21;
  else
    v22 = 0;
  if ((v22 | v20) == 1)
    goto LABEL_12;
LABEL_16:

  return v11;
}

- (HMResidentCapabilities)capabilitiesInternal
{
  os_unfair_lock_s *p_lock;
  HMResidentCapabilities *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_capabilitiesInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSData)rawCapabilities
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_rawCapabilities;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)_updateRawCapabilities:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  HMResidentCapabilities *v8;
  HMResidentCapabilities *capabilitiesInternal;
  void *v10;
  HMDResidentDevice *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA7B8]), "initWithProtoData:", v5);
  os_unfair_lock_lock_with_options();
  if ((!v5 || self->_rawCapabilities) && (objc_msgSend(v6, "isEqual:", self->_capabilitiesInternal) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    v7 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_rawCapabilities, a3);
    v8 = (HMResidentCapabilities *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA7B8]), "initWithProtoData:", v5);
    capabilitiesInternal = self->_capabilitiesInternal;
    self->_capabilitiesInternal = v8;

    os_unfair_lock_unlock(&self->_lock);
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v13;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updated resident capabilities to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDResidentDevice home](v11, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "homeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDevice identifier](v11, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("Resident Capabilities Updated"), v16, 1);

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDevice identifier](v11, "identifier", CFSTR("identifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = CFSTR("residentCapabilities");
      v22[0] = v18;
      v22[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("HMDResidentDeviceCapabilitiesUpdatedNotification"), v11, v19);

    }
    v7 = 1;
  }

  return v7;
}

- (NSData)deviceIRKData
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_deviceIRKData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateDeviceIRKData:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock_with_options();
  if (-[NSData isEqualToData:](self->_deviceIRKData, "isEqualToData:", v8))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_deviceIRKData, a3);
    os_unfair_lock_unlock(&self->_lock);
    -[HMDResidentDevice home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDevice identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("Device IRK Data Updated"), v7, 1);

  }
}

- (void)deviceController:(id)a3 didUpdateDevice:(id)a4
{
  __handleUpdatedDevice(self, a4);
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[HMDResidentDevice name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice isEnabled](self, "isEnabled");
  HMFBooleanToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice isConfirmed](self, "isConfirmed");
  HMFBooleanToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice isReachable](self, "isReachable");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDResidentDevice batteryStateAsString:](HMDResidentDevice, "batteryStateAsString:", -[HMDResidentDevice batteryState](self, "batteryState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice deviceIRKData](self, "deviceIRKData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "idsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteDestinationString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("name: %@, uuid: %@, isEnabled: %@, isConfirmed: %@, isReachable: %@, isReachableByIDS: %@, batteryState: %@, deviceIRKData: %@, idsIdentifier: %@, idsDestination: %@"), v15, v19, v14, v3, v4, CFSTR("N/A"), v5, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v11, *MEMORY[0x1E0D27F80]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDResidentDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDResidentDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDResidentDevice *v7;
  void *v8;
  uint64_t v9;
  NSUUID *identifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB98F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDResidentDevice initWithDevice:identifier:](self, "initWithDevice:identifier:", v5, v6);

  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_home, v8);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.identifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
      v9 = objc_claimAutoreleasedReturnValue();
      identifier = v7->_identifier;
      v7->_identifier = (NSUUID *)v9;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.enabled")))
      v7->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.enabled"));
    v7->_confirmed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.confirmed"));
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[HMDResidentDevice identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("HM.identifier"));

  -[HMDResidentDevice home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeConditionalObject:forKey:", v5, CFSTR("home"));

  -[HMDResidentDevice device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, *MEMORY[0x1E0CB98F8]);

  v7 = (!objc_msgSend(v14, "hmd_isForSharedUser") || !-[HMDResidentDevice isBlocked](self, "isBlocked"))
    && -[HMDResidentDevice isEnabled](self, "isEnabled");
  objc_msgSend(v14, "encodeBool:forKey:", v7, CFSTR("HM.enabled"));
  if (objc_msgSend(v14, "hmd_isForXPCTransport"))
  {
    objc_msgSend(v14, "encodeInteger:forKey:", -[HMDResidentDevice status](self, "status"), CFSTR("HM.status"));
    objc_msgSend(v14, "encodeInteger:forKey:", -[HMDResidentDevice legacyResidentCapabilities](self, "legacyResidentCapabilities"), CFSTR("HM.capabilities"));
    v8 = -[HMDResidentDevice supportsResidentSelection](self, "supportsResidentSelection");
    objc_msgSend(v14, "encodeBool:forKey:", v8, *MEMORY[0x1E0CB9920]);
    if (objc_msgSend(v14, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      -[HMDResidentDevice device](self, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "idsIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("HM.accountIdentifier"));

      -[HMDResidentDevice device](self, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "remoteDestinationString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "encodeObject:forKey:", v12, *MEMORY[0x1E0CB8BB8]);

      -[HMDResidentDevice deviceIRKData](self, "deviceIRKData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "encodeObject:forKey:", v13, *MEMORY[0x1E0CB9900]);

    }
  }
  else
  {
    objc_msgSend(v14, "encodeBool:forKey:", -[HMDResidentDevice isConfirmed](self, "isConfirmed"), CFSTR("HM.confirmed"));
  }

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (int64_t)batteryState
{
  return self->_batteryState;
}

- (void)setBatteryState:(int64_t)a3
{
  self->_batteryState = a3;
}

- (BOOL)isLowBattery
{
  return self->_lowBattery;
}

- (void)setLowBattery:(BOOL)a3
{
  self->_lowBattery = a3;
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void)setResidentDeviceManager:(id)a3
{
  objc_storeWeak((id *)&self->_residentDeviceManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_residentDeviceManager);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceIRKData, 0);
  objc_storeStrong((id *)&self->_capabilitiesInternal, 0);
  objc_storeStrong((id *)&self->_rawCapabilities, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

uint64_t __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveWithReason:information:postSyncNotification:objectChange:", CFSTR("residentUpdated"), 0, 0, 1);
}

void __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "residentDeviceManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "run");

}

void __51__HMDResidentDevice_productTypeForModelIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AppleTV5,3");
  v2[1] = CFSTR("AppleTV6,2");
  v3[0] = &unk_1E8B33A38;
  v3[1] = &unk_1E8B33A50;
  v2[2] = CFSTR("AppleTV14,1");
  v2[3] = CFSTR("AppleTV14,1");
  v3[2] = &unk_1E8B33A68;
  v3[3] = &unk_1E8B33A80;
  v2[4] = CFSTR("AppleTV11,1");
  v2[5] = CFSTR("AudioAccessory1,2");
  v3[4] = &unk_1E8B33A98;
  v3[5] = &unk_1E8B33AB0;
  v2[6] = CFSTR("AudioAccessory1,1");
  v2[7] = CFSTR("AudioAccessory5,1");
  v3[6] = &unk_1E8B33AC8;
  v3[7] = &unk_1E8B33AE0;
  v2[8] = CFSTR("AudioAccessory6,1");
  v3[8] = &unk_1E8B33AF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)productTypeForModelIdentifier__modelIdentifierToProductTypeMap;
  productTypeForModelIdentifier__modelIdentifierToProductTypeMap = v0;

}

void __30__HMDResidentDevice_isBlocked__block_invoke()
{
  HMDHomeKitVersion *v0;
  void *v1;

  v0 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("4.1.1"));
  v1 = (void *)isBlocked_unblockedVersion;
  isBlocked_unblockedVersion = (uint64_t)v0;

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)batteryStateAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("HMFPowerBatteryStateUnknown");
  else
    return off_1E89B2730[a3 - 1];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29_101573 != -1)
    dispatch_once(&logCategory__hmf_once_t29_101573, &__block_literal_global_96_101574);
  return (id)logCategory__hmf_once_v30_101575;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)deriveUUIDFromHomeUUID:(id)a3 deviceUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:withSalts:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __32__HMDResidentDevice_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v30_101575;
  logCategory__hmf_once_v30_101575 = v0;

}

@end
