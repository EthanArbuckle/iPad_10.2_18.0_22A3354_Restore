@implementation HMDBulletinNotificationRegistrationSource

- (HMDBulletinNotificationRegistrationSource)initWithUserUUID:(id)a3 deviceAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDBulletinNotificationRegistrationSource *v9;
  uint64_t v10;
  NSUUID *userUUID;
  uint64_t v12;
  HMDDeviceAddress *deviceAddress;
  HMDBulletinNotificationRegistrationSource *v15;
  SEL v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v15 = (HMDBulletinNotificationRegistrationSource *)_HMFPreconditionFailure();
    return (HMDBulletinNotificationRegistrationSource *)-[HMDBulletinNotificationRegistrationSource device](v15, v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDBulletinNotificationRegistrationSource;
  v9 = -[HMDBulletinNotificationRegistrationSource init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    userUUID = v9->_userUUID;
    v9->_userUUID = (NSUUID *)v10;

    v12 = objc_msgSend(v8, "copy");
    deviceAddress = v9->_deviceAddress;
    v9->_deviceAddress = (HMDDeviceAddress *)v12;

  }
  return v9;
}

- (HMDDevice)device
{
  HMDDevice *v3;
  void *v4;
  HMDDevice *v5;

  v3 = [HMDDevice alloc];
  -[HMDBulletinNotificationRegistrationSource deviceAddress](self, "deviceAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDDevice initWithDeviceAddress:](v3, "initWithDeviceAddress:", v4);

  return v5;
}

- (HMDBulletinNotificationRegistrationSource)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDDeviceAddress *v12;
  HMDBulletinNotificationRegistrationSource *v13;
  HMDBulletinNotificationRegistrationSource *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDBNRS.ck.dii"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v5);
  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDBNRS.ck.did"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v20;
        v27 = 2112;
        v28 = 0;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded deviceIdsDestination: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v14 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDBNRS.ck.uu"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
      if (v11)
      {
        v12 = -[HMDDeviceAddress initWithIDSIdentifier:idsDestination:]([HMDDeviceAddress alloc], "initWithIDSIdentifier:idsDestination:", v7, v8);
        v13 = -[HMDBulletinNotificationRegistrationSource initWithUserUUID:deviceAddress:](self, "initWithUserUUID:deviceAddress:", v11, v12);

        v14 = v13;
      }
      else
      {
        v21 = (void *)MEMORY[0x227676638]();
        v13 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v23;
          v27 = 2112;
          v28 = 0;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded userUUID: %@", (uint8_t *)&v25, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        v14 = 0;
      }

LABEL_17:
      goto LABEL_18;
    }
LABEL_20:
    _HMFPreconditionFailure();
  }
  v15 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v17;
    v27 = 2112;
    v28 = 0;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded deviceIdsIdentifier: %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v14 = 0;
LABEL_18:

  return v14;
}

- (id)serializedRegistrationForRemoteMessage
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
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("HMDBNRS.reg.type");
  objc_msgSend((id)objc_opt_class(), "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("HMDBNRS.ck.dii");
  -[HMDBulletinNotificationRegistrationSource deviceAddress](self, "deviceAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("HMDBNRS.ck.did");
  -[HMDBulletinNotificationRegistrationSource deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "idsDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = CFSTR("HMDBNRS.ck.uu");
  -[HMDBulletinNotificationRegistrationSource userUUID](self, "userUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDBulletinNotificationRegistrationSource deviceAddress](self, "deviceAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDBulletinNotificationRegistrationSource userUUID](self, "userUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDBulletinNotificationRegistrationSource deviceAddress](self, "deviceAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
  -[HMDBulletinNotificationRegistrationSource deviceAddress](self, "deviceAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDBNRS.ck.dii"));

  -[HMDBulletinNotificationRegistrationSource deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "idsDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMDBNRS.ck.did"));

  -[HMDBulletinNotificationRegistrationSource userUUID](self, "userUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMDBNRS.ck.uu"));

}

- (HMDBulletinNotificationRegistrationSource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDDeviceAddress *v9;
  HMDBulletinNotificationRegistrationSource *v10;
  HMDBulletinNotificationRegistrationSource *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDBNRS.ck.dii"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDBNRS.ck.did"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDBNRS.ck.uu"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v5)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v14;
    v19 = 2112;
    v20 = 0;
    v15 = "%{public}@Could not initialize from decoded deviceIdsIdentifier: %@";
LABEL_11:
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0x16u);

    goto LABEL_12;
  }
  if (!v6)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v14;
    v19 = 2112;
    v20 = 0;
    v15 = "%{public}@Could not initialize from decoded deviceIdsDestination: %@";
    goto LABEL_11;
  }
  if (!v7)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = 0;
      v15 = "%{public}@Could not initialize from decoded userUUID: %@";
      goto LABEL_11;
    }
LABEL_12:

    objc_autoreleasePoolPop(v12);
    v11 = 0;
    goto LABEL_13;
  }
  v9 = -[HMDDeviceAddress initWithIDSIdentifier:idsDestination:]([HMDDeviceAddress alloc], "initWithIDSIdentifier:idsDestination:", v5, v6);
  v10 = -[HMDBulletinNotificationRegistrationSource initWithUserUUID:deviceAddress:](self, "initWithUserUUID:deviceAddress:", v8, v9);

  v11 = v10;
LABEL_13:

  return v11;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBulletinNotificationRegistrationSource userUUID](self, "userUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("userUUID"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBulletinNotificationRegistrationSource deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("deviceAddress"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDDeviceAddress)deviceAddress
{
  return (HMDDeviceAddress *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
}

+ (id)type
{
  return CFSTR("HMDBNRS.type");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)doesTypeMatch:(id)a3 against:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HMDBNRS.reg.type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  return v7;
}

@end
