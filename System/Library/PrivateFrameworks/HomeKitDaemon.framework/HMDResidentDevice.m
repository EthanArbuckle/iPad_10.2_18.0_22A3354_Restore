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
  void *v16;
  uint64_t v17;
  HMResidentCapabilities *capabilitiesInternal;
  HMDResidentDevice *v19;
  HMDResidentDevice *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD1880]);
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

      objc_msgSend(v4, "residentCapabilities");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_storeStrong((id *)&v13->_rawCapabilities, v16);
        v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD7920]), "initWithProtoData:", v16);
        capabilitiesInternal = v13->_capabilitiesInternal;
        v13->_capabilitiesInternal = (HMResidentCapabilities *)v17;

      }
    }
    v19 = v13;
    v20 = v19;
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "device");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("YES");
      v30 = 138544130;
      v31 = v23;
      if (!v27)
        v28 = CFSTR("NO");
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v26;
      v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not retrieve device with UUID %@ for resident: %@; device encoding present: %@",
        (uint8_t *)&v30,
        0x2Au);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
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

  v21 = *MEMORY[0x24BDAC8D0];
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
    v12 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%@] Device is required.", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (HMDResidentDevice)initWithDevice:(id)a3 home:(id)a4
{
  return -[HMDResidentDevice initWithDevice:home:name:rawCapabilities:messageAddress:deviceIRKData:](self, "initWithDevice:home:name:rawCapabilities:messageAddress:deviceIRKData:", a3, a4, 0, 0, 0, 0);
}

- (HMDResidentDevice)initWithDevice:(id)a3 home:(id)a4 name:(id)a5 rawCapabilities:(id)a6 messageAddress:(id)a7 deviceIRKData:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDResidentDevice *v22;
  uint64_t v23;
  HMResidentCapabilities *capabilitiesInternal;
  HMDResidentDevice *v25;
  id obj;
  id v28;
  id v29;
  id v30;

  v30 = a5;
  v15 = a6;
  v29 = a7;
  obj = a8;
  v28 = a8;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_opt_class();
  objc_msgSend(v16, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deriveUUIDFromHomeUUID:deviceUUID:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[HMDResidentDevice initWithDevice:identifier:](self, "initWithDevice:identifier:", v17, v21);
  if (v22)
  {
    objc_storeStrong((id *)&v22->_name, a5);
    if (v15)
    {
      objc_storeStrong((id *)&v22->_rawCapabilities, a6);
      v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD7920]), "initWithProtoData:", v15, obj, v28, v29, v30);
      capabilitiesInternal = v22->_capabilitiesInternal;
      v22->_capabilitiesInternal = (HMResidentCapabilities *)v23;

    }
    objc_storeStrong((id *)&v22->_messageAddress, a7);
    objc_storeStrong((id *)&v22->_deviceIRKData, obj);
    v25 = v22;
  }

  return v22;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;
  NSString *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[HMDResidentDevice device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
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
      v10->_reachableByIDS = 1;
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

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDResidentDevice;
  -[HMDResidentDevice dealloc](&v4, sel_dealloc);
}

- (void)configureWithHome:(id)a3
{
  void *v4;
  void *v5;
  HMDDevice *device;
  id obj;

  obj = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, obj);
  objc_msgSend(obj, "residentDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_residentDeviceManager, v4);

  os_unfair_lock_unlock(&self->_lock);
  -[HMDDeviceController setDelegate:](self->_deviceController, "setDelegate:", self);
  -[HMDResidentDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __registerForDeviceNotifications(self, v5);

  device = self->_device;
  self->_device = 0;

}

- (unint64_t)legacyResidentCapabilities
{
  void *v2;
  unint64_t v3;

  -[HMDResidentDevice capabilitiesInternal](self, "capabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = residentCapabilitiesForDevice(v2);

  return v3;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
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
  void *v16;
  void *v17;
  _BOOL4 v19;

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
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[HMDResidentDevice shortDescription](self, "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %p"), self);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_24E79DB48;
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
  -[HMDResidentDevice isReachableByIDS](self, "isReachableByIDS");
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice capabilities](self, "capabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@%@, Enabled = %@, Confirmed = %@, Reachable = %@, Reachable by IDS = %@, Capabilities = %@, Device = %@>"), v10, v11, v12, v13, v14, v15, v16, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  return v17;
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

- (BOOL)isDeviceEquivalentToDeviceAddress:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (v4)
  {
    -[HMDResidentDevice messageAddress](self, "messageAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEquivalentToDeviceAddress:", v4);

    if ((v6 & 1) != 0)
      goto LABEL_4;
    -[HMDResidentDevice device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if ((v10 & 1) != 0)
    {
LABEL_4:
      v11 = 1;
    }
    else
    {
      -[HMDResidentDevice device](self, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "globalHandles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "idsDestination");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "isEqual:", v16);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;

  if (-[HMDResidentDevice isEnabled](self, "isEnabled"))
  {
    if (-[HMDResidentDevice isReachable](self, "isReachable"))
    {
LABEL_3:
      v3 = 1;
      goto LABEL_10;
    }
    -[HMDResidentDevice home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "supportsResidentSelection")
      && -[HMDResidentDevice isReachableByIDS](self, "isReachableByIDS"))
    {
      v5 = -[HMDResidentDevice supportsResidentSelection](self, "supportsResidentSelection");

      if (!v5)
        goto LABEL_3;
    }
    else
    {

    }
  }
  v3 = 0;
LABEL_10:
  -[HMDResidentDevice home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryResident");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", self);

  if (v8)
    v9 = v3 | 2;
  else
    v9 = v3;
  if (-[HMDResidentDevice isLowBattery](self, "isLowBattery"))
    v9 |= 8uLL;
  if (-[HMDResidentDevice batteryState](self, "batteryState") == 1)
    return v9 | 4;
  else
    return v9;
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
  void *v2;
  unint64_t v3;

  -[HMDResidentDevice capabilitiesInternal](self, "capabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 3) & 1;
}

- (unint64_t)productType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  HMDResidentDevice *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[HMDResidentDevice isCurrentDevice](self, "isCurrentDevice"))
  {
    -[HMDResidentDevice device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "productInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDevice device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idsDeviceForIDSIdentifier:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "modelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[HMDResidentDevice productTypeForModelIdentifier:](self, "productTypeForModelIdentifier:", v7);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not find the model identifier.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (BOOL)supportsMediaSystem
{
  void *v2;
  unint64_t v3;

  -[HMDResidentDevice capabilitiesInternal](self, "capabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 4) & 1;
}

- (BOOL)supportsMediaActions
{
  void *v2;
  unint64_t v3;

  -[HMDResidentDevice capabilitiesInternal](self, "capabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 9) & 1;
}

- (BOOL)supportsShortcutActions
{
  void *v2;
  unint64_t v3;

  -[HMDResidentDevice capabilitiesInternal](self, "capabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 8) & 1;
}

- (BOOL)supportsFirmwareUpdate
{
  void *v2;
  unint64_t v3;

  -[HMDResidentDevice capabilitiesInternal](self, "capabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 11) & 1;
}

- (BOOL)supportsResidentFirmwareUpdate
{
  void *v2;
  unint64_t v3;

  -[HMDResidentDevice capabilitiesInternal](self, "capabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 23) & 1;
}

- (BOOL)supportsCustomMediaApplicationDestination
{
  void *v2;
  unint64_t v3;

  -[HMDResidentDevice capabilitiesInternal](self, "capabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 24) & 1;
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

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = *MEMORY[0x24BDD6A80];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x24BDD6A88];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDResidentDevice status](self, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = *MEMORY[0x24BDD6A68];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDResidentDevice legacyResidentCapabilities](self, "legacyResidentCapabilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = *MEMORY[0x24BDD6A98];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDResidentDevice supportsResidentSelection](self, "supportsResidentSelection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
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

  v16 = *MEMORY[0x24BDAC8D0];
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
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification device was updated", (uint8_t *)&v14, 0xCu);

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
    dispatch_once(&productTypeForModelIdentifier__onceToken, &__block_literal_global_141948);
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

    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
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
  uint64_t v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  _QWORD *v70;
  void *v71;
  HMDResidentDevice *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void (**v82)(_QWORD, _QWORD, _QWORD);
  void *v83;
  HMDResidentDevice *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  _QWORD v95[5];
  _QWORD v96[4];
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  const __CFString *v106;
  void *v107;
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  void *v113;
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v93 = a5;
  objc_msgSend(v93, "transactionResult");
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
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    -[HMDResidentDevice device](self, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "backingStoreObjectsWithChangeType:version:", 0, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v103 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * i), "dumpDebug:", CFSTR("LOCAL: "));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
      }
      while (v18);
    }

  }
  objc_msgSend(v9, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    objc_msgSend(v9, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "backingStoreObjectsWithChangeType:version:", 0, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v99;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v99 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * j), "dumpDebug:", CFSTR("REMOTE: "));
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
      }
      while (v25);
    }

  }
  objc_msgSend(v9, "deviceUUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = v10;
  if (v28)
  {
    v29 = objc_alloc(MEMORY[0x24BDD1880]);
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
      v35 = (void *)MEMORY[0x227676638]();
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
        v109 = v39;
        v110 = 2112;
        v111 = v40;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Updating the underlying device with identifier: %@", buf, 0x16u);

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
      objc_msgSend(v94, "markChanged");
    }

    v10 = v94;
  }
  objc_msgSend(v9, "device");
  v45 = objc_claimAutoreleasedReturnValue();
  if (!v45)
    goto LABEL_30;
  v46 = (void *)v45;
  -[HMDResidentDevice device](self, "device");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v47, "isBackingStorageEqual:", v48);

  if ((v49 & 1) == 0)
  {
    if (v13)
    {
      v83 = (void *)MEMORY[0x227676638]();
      v84 = self;
      HMFGetOSLogHandle();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDResidentDevice device](v84, "device");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "device");
        v88 = v8;
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v109 = v86;
        v110 = 2112;
        v111 = v87;
        v112 = 2112;
        v113 = v89;
        _os_log_impl(&dword_2218F0000, v85, OS_LOG_TYPE_INFO, "%{public}@Cloud changed our device, preferring local device -- local: %@, cloud :%@", buf, 0x20u);

        v8 = v88;
        v10 = v94;

      }
      objc_autoreleasePoolPop(v83);
      v13 = 1;
    }
    else
    {
      -[HMDResidentDevice deviceController](self, "deviceController");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "device");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "updateWithDevice:completionHandler:", v91, 0);

    }
  }
  else
  {
LABEL_30:
    v13 = 0;
  }
  objc_msgSend(v9, "enabled");
  v50 = objc_claimAutoreleasedReturnValue();
  if (!v50
    || (v51 = (void *)v50,
        v52 = -[HMDResidentDevice isEnabled](self, "isEnabled"),
        objc_msgSend(v9, "enabled"),
        v53 = (void *)objc_claimAutoreleasedReturnValue(),
        v54 = objc_msgSend(v53, "BOOLValue"),
        v53,
        v51,
        v52 == v54))
  {
    v92 = 0;
  }
  else
  {
    objc_msgSend(v10, "markChanged");
    objc_msgSend(v9, "enabled");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDevice _handleResidentDeviceUpdateEnabled:](self, "_handleResidentDeviceUpdateEnabled:", objc_msgSend(v55, "BOOLValue"));

    v106 = CFSTR("kEnabledKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v56;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "confirmed");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    v59 = -[HMDResidentDevice isConfirmed](self, "isConfirmed");
    objc_msgSend(v9, "confirmed");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "BOOLValue");

    v62 = v59 == v61;
    v10 = v94;
    if (!v62)
    {
      objc_msgSend(v94, "markChanged");
      objc_msgSend(v9, "confirmed");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDevice _handleResidentDeviceUpdateConfirmed:](self, "_handleResidentDeviceUpdateConfirmed:", objc_msgSend(v63, "BOOLValue"));

    }
  }
  objc_msgSend(v9, "residentCapabilities");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend(v9, "residentCapabilities");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDevice _updateRawCapabilities:](self, "_updateRawCapabilities:", v65);

  }
  v66 = v8;
  if (objc_msgSend(v10, "changed"))
  {
    -[HMDResidentDevice residentDeviceManager](self, "residentDeviceManager");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "notifyClientsOfUpdatedResidentDevice:", self);

  }
  -[HMDResidentDevice home](self, "home");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = MEMORY[0x24BDAC760];
  v70 = (_QWORD *)&unk_22269F000;
  if (v13)
  {
    v71 = (void *)MEMORY[0x227676638](objc_msgSend(v10, "markChanged"));
    v72 = self;
    HMFGetOSLogHandle();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDevice device](v72, "device");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v109 = v74;
      v110 = 2112;
      v111 = v75;
      _os_log_impl(&dword_2218F0000, v73, OS_LOG_TYPE_INFO, "%{public}@Pushing back with current device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v71);
    -[HMDResidentDevice modelObjectWithChangeType:version:](v72, "modelObjectWithChangeType:version:", 2, 4);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "backingStore");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "transaction:options:", CFSTR("residentUpdated"), v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v79, "add:", v76);
    v96[0] = v69;
    v70 = &unk_22269F000;
    v96[1] = 3221225472;
    v96[2] = __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke;
    v96[3] = &unk_24E79BD80;
    v97 = v68;
    objc_msgSend(v79, "save:", v96);

    v10 = v94;
  }
  objc_msgSend(v68, "backingStore");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v69;
  v95[1] = v70[398];
  v95[2] = __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke_2;
  v95[3] = &unk_24E79BD80;
  v95[4] = self;
  objc_msgSend(v80, "submitBlock:", v95);

  objc_msgSend(v93, "responseHandler");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    objc_msgSend(v93, "responseHandler");
    v82 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v82)[2](v82, 0, v92);

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
  v31 = *MEMORY[0x24BDAC8D0];
  if (-[HMDResidentDevice isEnabled](self, "isEnabled") != a3)
  {
    -[HMDResidentDevice setEnabled:](self, "setEnabled:", v3);
    -[HMDResidentDevice residentDeviceManager](self, "residentDeviceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateResidentAvailability");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
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
      v12 = (void *)MEMORY[0x227676638]();
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
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations with resident due to primary resident enabled", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
        -[HMDResidentDevice device](v13, "device");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
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
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations resident due to primary resident disabled", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
        -[HMDResidentDevice device](v13, "device");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
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
  v25 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  confirmed = self->_confirmed;
  self->_confirmed = v3;
  os_unfair_lock_unlock(p_lock);
  if (confirmed != v3)
  {
    v7 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of resident device confirmed state changing to %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentDevice home](v8, "home", CFSTR("HMDResidentDeviceHomeUUIDNotificationKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("HMDResidentDeviceResidentNotificationKey");
    v20[0] = v13;
    v20[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
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
  void *v17;
  void *v18;
  int v19;
  char v20;
  char v21;
  void *v22;
  void *v23;
  HMDDevice *device;

  v7 = [HMDResidentDeviceModel alloc];
  -[HMDResidentDevice identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", a3, v8, v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceModel setEnabled:](v11, "setEnabled:", v12);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDResidentDevice isConfirmed](self, "isConfirmed"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceModel setConfirmed:](v11, "setConfirmed:", v13);

  -[HMDResidentDevice rawCapabilities](self, "rawCapabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceModel setResidentCapabilities:](v11, "setResidentCapabilities:", v14);

  -[HMDResidentDevice device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "version");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("4.0"));
  LODWORD(v10) = objc_msgSend(v16, "isAtLeastVersion:", v17);

  isWatch();
  -[HMDResidentDevice home](self, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isOwnerUser");

  if (!(_DWORD)v10
    || ((v20 = objc_msgSend(v15, "isCurrentDevice"), a4 > 3) ? (v21 = v20) : (v21 = 0), (v21 & 1) != 0 || v19 != 1))
  {
    objc_msgSend(v15, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceModel setDeviceUUID:](v11, "setDeviceUUID:", v23);

    if ((v19 & 1) != 0 || !self->_device)
    {
      -[HMDResidentDeviceModel setDevice:](v11, "setDevice:", v15);
    }
    else
    {
      -[HMDResidentDeviceModel setDevice:](v11, "setDevice:");
      device = self->_device;
      self->_device = 0;

    }
  }

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

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7920]), "initWithProtoData:", v5);
  os_unfair_lock_lock_with_options();
  if ((!v5 || self->_rawCapabilities) && (objc_msgSend(v6, "isEqual:", self->_capabilitiesInternal) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    v7 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_rawCapabilities, a3);
    v8 = (HMResidentCapabilities *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7920]), "initWithProtoData:", v5);
    capabilitiesInternal = self->_capabilitiesInternal;
    self->_capabilitiesInternal = v8;

    os_unfair_lock_unlock(&self->_lock);
    v10 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updated resident capabilities to %@", buf, 0x16u);

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
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDevice identifier](v11, "identifier", CFSTR("identifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = CFSTR("residentCapabilities");
      v22[0] = v18;
      v22[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("HMDResidentDeviceCapabilitiesUpdatedNotification"), v11, v19);

    }
    v7 = 1;
  }

  return v7;
}

- (HMDDeviceAddress)messageAddress
{
  os_unfair_lock_s *p_lock;
  HMDDeviceAddress *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_messageAddress;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)_updateMessageAddress:(id)a3
{
  id v5;
  BOOL v6;
  void *v7;
  HMDResidentDevice *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = -[HMDDeviceAddress isEqual:](self->_messageAddress, "isEqual:", v5);
  if (v6)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_messageAddress, a3);
    os_unfair_lock_unlock(&self->_lock);
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Updated device message address to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentDevice messageAddress](v8, "messageAddress", CFSTR("HMDResidentDeviceMessageAddressKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("HMDResidentDeviceResidentNotificationKey");
    v16[0] = v11;
    v16[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("HMDResidentDeviceAddressChangedNotification"), v8, v12);

  }
  return !v6;
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
  void *v20;

  v17 = (void *)MEMORY[0x24BDD17C8];
  -[HMDResidentDevice name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice device](self, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice isEnabled](self, "isEnabled");
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice isConfirmed](self, "isConfirmed");
  HMFBooleanToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice isReachable](self, "isReachable");
  HMFBooleanToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice isReachableByIDS](self, "isReachableByIDS");
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
  objc_msgSend(v17, "stringWithFormat:", CFSTR("name: %@, uuid: %@, isEnabled: %@, isConfirmed: %@, isReachable: %@, isReachableByIDS: %@, batteryState: %@, deviceIRKData: %@, idsIdentifier: %@, idsDestination: %@"), v16, v20, v15, v14, v3, v4, v5, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v11, *MEMORY[0x24BE3EB68]);
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
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6A70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
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
  void *v7;
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
  objc_msgSend(v14, "encodeObject:forKey:", v6, *MEMORY[0x24BDD6A70]);

  objc_msgSend(v14, "encodeBool:forKey:", -[HMDResidentDevice isEnabled](self, "isEnabled"), CFSTR("HM.enabled"));
  if (objc_msgSend(v14, "hmd_isForXPCTransport"))
  {
    -[HMDResidentDevice name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("HM.name"));

    objc_msgSend(v14, "encodeInteger:forKey:", -[HMDResidentDevice status](self, "status"), CFSTR("HM.status"));
    objc_msgSend(v14, "encodeInteger:forKey:", -[HMDResidentDevice legacyResidentCapabilities](self, "legacyResidentCapabilities"), CFSTR("HM.capabilities"));
    v8 = -[HMDResidentDevice supportsResidentSelection](self, "supportsResidentSelection");
    objc_msgSend(v14, "encodeBool:forKey:", v8, *MEMORY[0x24BDD6A90]);
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
      objc_msgSend(v14, "encodeObject:forKey:", v12, *MEMORY[0x24BDD5B20]);

      -[HMDResidentDevice deviceIRKData](self, "deviceIRKData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "encodeObject:forKey:", v13, *MEMORY[0x24BDD6A78]);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
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

- (BOOL)isReachableByIDS
{
  return self->_reachableByIDS;
}

- (void)setReachableByIDS:(BOOL)a3
{
  self->_reachableByIDS = a3;
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
  objc_storeStrong((id *)&self->_messageAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
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

  v3[9] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("AppleTV5,3");
  v2[1] = CFSTR("AppleTV6,2");
  v3[0] = &unk_24E96BCA8;
  v3[1] = &unk_24E96BCC0;
  v2[2] = CFSTR("AppleTV14,1");
  v2[3] = CFSTR("AppleTV14,1");
  v3[2] = &unk_24E96BCD8;
  v3[3] = &unk_24E96BCF0;
  v2[4] = CFSTR("AppleTV11,1");
  v2[5] = CFSTR("AudioAccessory1,2");
  v3[4] = &unk_24E96BD08;
  v3[5] = &unk_24E96BD20;
  v2[6] = CFSTR("AudioAccessory1,1");
  v2[7] = CFSTR("AudioAccessory5,1");
  v3[6] = &unk_24E96BD38;
  v3[7] = &unk_24E96BD50;
  v2[8] = CFSTR("AudioAccessory6,1");
  v3[8] = &unk_24E96BD68;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)productTypeForModelIdentifier__modelIdentifierToProductTypeMap;
  productTypeForModelIdentifier__modelIdentifierToProductTypeMap = v0;

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
    return off_24E788968[a3 - 1];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32_142001 != -1)
    dispatch_once(&logCategory__hmf_once_t32_142001, &__block_literal_global_96_142002);
  return (id)logCategory__hmf_once_v33_142003;
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

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1880], "hm_deriveUUIDFromBaseUUID:withSalts:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __32__HMDResidentDevice_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v33_142003;
  logCategory__hmf_once_v33_142003 = v0;

}

@end
