@implementation HMDServiceBulletinNotificationRegistration

- (HMDServiceBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 conditions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDServiceBulletinNotificationRegistration *v12;
  uint64_t v13;
  NSUUID *accessoryUUID;
  uint64_t v15;
  NSNumber *serviceInstanceID;
  HMDServiceBulletinNotificationRegistration *v18;
  SEL v19;
  id v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v9)
  {
LABEL_7:
    v18 = (HMDServiceBulletinNotificationRegistration *)_HMFPreconditionFailure();
    return (HMDServiceBulletinNotificationRegistration *)-[HMDServiceBulletinNotificationRegistration isEqual:](v18, v19, v20);
  }
  v11 = v10;
  v21.receiver = self;
  v21.super_class = (Class)HMDServiceBulletinNotificationRegistration;
  v12 = -[HMDBulletinNotificationRegistration initWithConditions:](&v21, sel_initWithConditions_, v10);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    accessoryUUID = v12->_accessoryUUID;
    v12->_accessoryUUID = (NSUUID *)v13;

    v15 = objc_msgSend(v9, "copy");
    serviceInstanceID = v12->_serviceInstanceID;
    v12->_serviceInstanceID = (NSNumber *)v15;

  }
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
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v13.receiver = self,
        v13.super_class = (Class)HMDServiceBulletinNotificationRegistration,
        -[HMDBulletinNotificationRegistration isEqual:](&v13, sel_isEqual_, v6)))
  {
    -[HMDServiceBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDServiceBulletinNotificationRegistration serviceInstanceID](self, "serviceInstanceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serviceInstanceID");
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

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDServiceBulletinNotificationRegistration;
  v4 = a3;
  -[HMDBulletinNotificationRegistration encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMDServiceBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDSBNR.ck.au"));

  -[HMDServiceBulletinNotificationRegistration serviceInstanceID](self, "serviceInstanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDSBNR.ck.sii"));

}

- (HMDServiceBulletinNotificationRegistration)initWithCoder:(id)a3
{
  id v4;
  HMDBulletinNotificationRegistration *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDServiceBulletinNotificationRegistration *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDBulletinNotificationRegistration initWithCoder:]([HMDBulletinNotificationRegistration alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDSBNR.ck.au"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDSBNR.ck.sii"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[HMDBulletinNotificationRegistration conditions](v5, "conditions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[HMDServiceBulletinNotificationRegistration initWithAccessoryUUID:serviceInstanceID:conditions:](self, "initWithAccessoryUUID:serviceInstanceID:conditions:", v6, v7, v8);

        v9 = self;
      }
      else
      {
        v13 = (void *)MEMORY[0x227676638]();
        self = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543618;
          v18 = v15;
          v19 = 2112;
          v20 = 0;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded serviceInstanceID: %@", (uint8_t *)&v17, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
        v9 = 0;
      }

    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      self = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v12;
        v19 = 2112;
        v20 = 0;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded accessoryUUID: %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)HMDServiceBulletinNotificationRegistration;
  -[HMDBulletinNotificationRegistration attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDServiceBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("accessoryUUID"), v5);
  v14[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDServiceBulletinNotificationRegistration serviceInstanceID](self, "serviceInstanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("serviceInstanceID"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)serviceInstanceID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
