@implementation HMDCameraReachabilityBulletinNotificationRegistration

- (HMDCameraReachabilityBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 conditions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraReachabilityBulletinNotificationRegistration *v9;
  uint64_t v10;
  NSUUID *accessoryUUID;
  HMDCameraReachabilityBulletinNotificationRegistration *v13;
  SEL v14;
  id v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    v16.receiver = self;
    v16.super_class = (Class)HMDCameraReachabilityBulletinNotificationRegistration;
    v9 = -[HMDBulletinNotificationRegistration initWithConditions:](&v16, sel_initWithConditions_, v7);
    if (v9)
    {
      v10 = objc_msgSend(v6, "copy");
      accessoryUUID = v9->_accessoryUUID;
      v9->_accessoryUUID = (NSUUID *)v10;

    }
    return v9;
  }
  else
  {
    v13 = (HMDCameraReachabilityBulletinNotificationRegistration *)_HMFPreconditionFailure();
    return -[HMDCameraReachabilityBulletinNotificationRegistration initWithDictionary:](v13, v14, v15);
  }
}

- (HMDCameraReachabilityBulletinNotificationRegistration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraReachabilityBulletinNotificationRegistration *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSUUID *accessoryUUID;
  HMDCameraReachabilityBulletinNotificationRegistration *v12;
  HMDCameraReachabilityBulletinNotificationRegistration *v14;
  SEL v15;
  objc_super v16;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "doesTypeMatch:against:", v4, v6);

  if (!(_DWORD)v5)
  {
    v12 = 0;
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraReachabilityBulletinNotificationRegistration;
  v7 = -[HMDBulletinNotificationRegistration initWithDictionary:](&v16, sel_initWithDictionary_, v4);
  if (!v7)
  {
LABEL_5:
    self = v7;
    v12 = self;
LABEL_7:

    return v12;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDCRBNR.ck.au"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v8);
    accessoryUUID = v7->_accessoryUUID;
    v7->_accessoryUUID = (NSUUID *)v10;

    goto LABEL_5;
  }
  v14 = (HMDCameraReachabilityBulletinNotificationRegistration *)_HMFPreconditionFailure();
  return (HMDCameraReachabilityBulletinNotificationRegistration *)-[HMDCameraReachabilityBulletinNotificationRegistration serializedRegistrationForRemoteMessage](v14, v15);
}

- (id)serializedRegistrationForRemoteMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDCameraReachabilityBulletinNotificationRegistration;
  -[HMDBulletinNotificationRegistration serializedRegistrationForRemoteMessage](&v8, sel_serializedRegistrationForRemoteMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDCameraReachabilityBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HMDCRBNR.ck.au"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v11.receiver = self,
        v11.super_class = (Class)HMDCameraReachabilityBulletinNotificationRegistration,
        -[HMDBulletinNotificationRegistration isEqual:](&v11, sel_isEqual_, v6)))
  {
    -[HMDCameraReachabilityBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDCameraReachabilityBulletinNotificationRegistration;
  v4 = a3;
  -[HMDBulletinNotificationRegistration encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMDCameraReachabilityBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDCRBNR.ck.au"));

}

- (HMDCameraReachabilityBulletinNotificationRegistration)initWithCoder:(id)a3
{
  id v4;
  HMDBulletinNotificationRegistration *v5;
  void *v6;
  void *v7;
  HMDCameraReachabilityBulletinNotificationRegistration *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDBulletinNotificationRegistration initWithCoder:]([HMDBulletinNotificationRegistration alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDCRBNR.ck.au"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HMDBulletinNotificationRegistration conditions](v5, "conditions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[HMDCameraReachabilityBulletinNotificationRegistration initWithAccessoryUUID:conditions:](self, "initWithAccessoryUUID:conditions:", v6, v7);

      v8 = self;
    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      self = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v11;
        v15 = 2112;
        v16 = 0;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded accessoryUUID: %@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)HMDCameraReachabilityBulletinNotificationRegistration;
  -[HMDBulletinNotificationRegistration attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraReachabilityBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("accessoryUUID"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

+ (id)type
{
  return CFSTR("HMDCRBNR.type");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
