@implementation HMDAccessoryBulletinNotificationRegistrationRemote

- (HMDAccessoryBulletinNotificationRegistrationRemote)initWithAccessoryBulletinNotificationRegistration:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDAccessoryBulletinNotificationRegistrationRemote *v10;
  HMDAccessoryBulletinNotificationRegistrationRemote *v11;
  HMDAccessoryBulletinNotificationRegistrationRemote *v13;
  SEL v14;
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMDAccessoryBulletinNotificationRegistrationRemote *)_HMFPreconditionFailure();
    return (HMDAccessoryBulletinNotificationRegistrationRemote *)-[HMDAccessoryBulletinNotificationRegistrationRemote isEqual:](v13, v14, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessoryBulletinNotificationRegistrationRemote;
  v10 = -[HMDAccessoryBulletinNotificationRegistrationRemote init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_registration, a3);
    objc_storeStrong((id *)&v11->_source, a4);
  }

  return v11;
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
    -[HMDAccessoryBulletinNotificationRegistrationRemote source](self, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDAccessoryBulletinNotificationRegistrationRemote registration](self, "registration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "registration");
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
  id v6;

  v4 = a3;
  -[HMDAccessoryBulletinNotificationRegistrationRemote registration](self, "registration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDABNRR.ck.r"));

  -[HMDAccessoryBulletinNotificationRegistrationRemote source](self, "source");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDABNRR.ck.s"));

}

- (HMDAccessoryBulletinNotificationRegistrationRemote)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDAccessoryBulletinNotificationRegistrationRemote *v7;
  HMDAccessoryBulletinNotificationRegistrationRemote *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDABNRR.ck.r"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDABNRR.ck.s"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[HMDAccessoryBulletinNotificationRegistrationRemote initWithAccessoryBulletinNotificationRegistration:source:](self, "initWithAccessoryBulletinNotificationRegistration:source:", v5, v6);
      v8 = v7;
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v14;
        v18 = 2112;
        v19 = 0;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded source: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v8 = 0;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = 0;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded registratio: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
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
  -[HMDAccessoryBulletinNotificationRegistrationRemote registration](self, "registration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("registration"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryBulletinNotificationRegistrationRemote source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("source"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDAccessoryBulletinNotificationRegistration)registration
{
  return (HMDAccessoryBulletinNotificationRegistration *)objc_getProperty(self, a2, 8, 1);
}

- (HMDBulletinNotificationRegistrationSource)source
{
  return (HMDBulletinNotificationRegistrationSource *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_registration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
