@implementation HMDAccessoryBulletinNotificationRegistration

- (HMDAccessoryBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 conditions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDAccessoryBulletinNotificationRegistration *v15;
  uint64_t v16;
  NSUUID *accessoryUUID;
  uint64_t v18;
  NSNumber *serviceInstanceID;
  uint64_t v20;
  NSNumber *characteristicInstanceID;
  HMDAccessoryBulletinNotificationRegistration *v23;
  SEL v24;
  id v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    v23 = (HMDAccessoryBulletinNotificationRegistration *)_HMFPreconditionFailure();
    return -[HMDAccessoryBulletinNotificationRegistration initWithDictionary:](v23, v24, v25);
  }
  v14 = v13;
  v26.receiver = self;
  v26.super_class = (Class)HMDAccessoryBulletinNotificationRegistration;
  v15 = -[HMDBulletinNotificationRegistration initWithConditions:](&v26, sel_initWithConditions_, v13);
  if (v15)
  {
    v16 = objc_msgSend(v10, "copy");
    accessoryUUID = v15->_accessoryUUID;
    v15->_accessoryUUID = (NSUUID *)v16;

    v18 = objc_msgSend(v11, "copy");
    serviceInstanceID = v15->_serviceInstanceID;
    v15->_serviceInstanceID = (NSNumber *)v18;

    v20 = objc_msgSend(v12, "copy");
    characteristicInstanceID = v15->_characteristicInstanceID;
    v15->_characteristicInstanceID = (NSNumber *)v20;

  }
  return v15;
}

- (HMDAccessoryBulletinNotificationRegistration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDAccessoryBulletinNotificationRegistration *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSUUID *accessoryUUID;
  uint64_t v12;
  NSNumber *serviceInstanceID;
  uint64_t v14;
  NSNumber *characteristicInstanceID;
  HMDAccessoryBulletinNotificationRegistration *v16;
  HMDAccessoryBulletinNotificationRegistration *v18;
  SEL v19;
  objc_super v20;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "doesTypeMatch:against:", v4, v6);

  if (!(_DWORD)v5)
  {
    v16 = 0;
    goto LABEL_7;
  }
  v20.receiver = self;
  v20.super_class = (Class)HMDAccessoryBulletinNotificationRegistration;
  v7 = -[HMDBulletinNotificationRegistration initWithDictionary:](&v20, sel_initWithDictionary_, v4);
  if (!v7)
  {
LABEL_5:
    self = v7;
    v16 = self;
LABEL_7:

    return v16;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDABNR.ck.au"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v8);
    accessoryUUID = v7->_accessoryUUID;
    v7->_accessoryUUID = (NSUUID *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDABNR.ck.sii"));
    v12 = objc_claimAutoreleasedReturnValue();
    serviceInstanceID = v7->_serviceInstanceID;
    v7->_serviceInstanceID = (NSNumber *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDABNR.ck.cii"));
    v14 = objc_claimAutoreleasedReturnValue();
    characteristicInstanceID = v7->_characteristicInstanceID;
    v7->_characteristicInstanceID = (NSNumber *)v14;

    goto LABEL_5;
  }
  v18 = (HMDAccessoryBulletinNotificationRegistration *)_HMFPreconditionFailure();
  return (HMDAccessoryBulletinNotificationRegistration *)-[HMDAccessoryBulletinNotificationRegistration serializedRegistrationForRemoteMessage](v18, v19);
}

- (id)serializedRegistrationForRemoteMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryBulletinNotificationRegistration;
  -[HMDBulletinNotificationRegistration serializedRegistrationForRemoteMessage](&v10, sel_serializedRegistrationForRemoteMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDAccessoryBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HMDABNR.ck.au"));

  -[HMDAccessoryBulletinNotificationRegistration serviceInstanceID](self, "serviceInstanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("HMDABNR.ck.sii"));

  -[HMDAccessoryBulletinNotificationRegistration characteristicInstanceID](self, "characteristicInstanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("HMDABNR.ck.cii"));

  return v4;
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
  void *v11;
  void *v12;
  char v13;
  objc_super v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v15.receiver = self,
        v15.super_class = (Class)HMDAccessoryBulletinNotificationRegistration,
        -[HMDBulletinNotificationRegistration isEqual:](&v15, sel_isEqual_, v6)))
  {
    -[HMDAccessoryBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDAccessoryBulletinNotificationRegistration serviceInstanceID](self, "serviceInstanceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serviceInstanceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[HMDAccessoryBulletinNotificationRegistration characteristicInstanceID](self, "characteristicInstanceID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "characteristicInstanceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDAccessoryBulletinNotificationRegistration;
  v4 = a3;
  -[HMDBulletinNotificationRegistration encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[HMDAccessoryBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDABNR.ck.au"));

  -[HMDAccessoryBulletinNotificationRegistration serviceInstanceID](self, "serviceInstanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDABNR.ck.sii"));

  -[HMDAccessoryBulletinNotificationRegistration characteristicInstanceID](self, "characteristicInstanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMDABNR.ck.cii"));

}

- (HMDAccessoryBulletinNotificationRegistration)initWithCoder:(id)a3
{
  id v4;
  HMDBulletinNotificationRegistration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessoryBulletinNotificationRegistration *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDBulletinNotificationRegistration initWithCoder:]([HMDBulletinNotificationRegistration alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDABNR.ck.au"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDABNR.ck.sii"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDABNR.ck.cii"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[HMDBulletinNotificationRegistration conditions](v5, "conditions");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[HMDAccessoryBulletinNotificationRegistration initWithAccessoryUUID:serviceInstanceID:characteristicInstanceID:conditions:](self, "initWithAccessoryUUID:serviceInstanceID:characteristicInstanceID:conditions:", v6, v7, v8, v9);

          v10 = self;
        }
        else
        {
          v17 = (void *)MEMORY[0x227676638]();
          self = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = 138543618;
            v22 = v19;
            v23 = 2112;
            v24 = 0;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded characteristicInstanceID: %@", (uint8_t *)&v21, 0x16u);

          }
          objc_autoreleasePoolPop(v17);
          v10 = 0;
        }

      }
      else
      {
        v14 = (void *)MEMORY[0x227676638]();
        self = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543618;
          v22 = v16;
          v23 = 2112;
          v24 = 0;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded serviceInstanceID: %@", (uint8_t *)&v21, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        v10 = 0;
      }

    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      self = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v13;
        v23 = 2112;
        v24 = 0;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded accessoryUUID: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessoryBulletinNotificationRegistration;
  -[HMDBulletinNotificationRegistration attributeDescriptions](&v16, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("accessoryUUID"), v5);
  v17[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryBulletinNotificationRegistration serviceInstanceID](self, "serviceInstanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("serviceInstanceID"), v8);
  v17[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryBulletinNotificationRegistration characteristicInstanceID](self, "characteristicInstanceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("characteristicInstanceID"), v11);
  v17[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)serviceInstanceID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)characteristicInstanceID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicInstanceID, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

+ (id)type
{
  return CFSTR("HMDABNR.type");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
