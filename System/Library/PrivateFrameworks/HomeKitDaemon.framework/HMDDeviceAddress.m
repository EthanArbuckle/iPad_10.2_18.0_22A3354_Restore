@implementation HMDDeviceAddress

- (HMDDeviceAddress)initWithIDSIdentifier:(id)a3 idsDestination:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDDeviceAddress *v10;
  HMDDeviceAddress *v11;
  HMDDeviceAddress *v13;
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
    v13 = (HMDDeviceAddress *)_HMFPreconditionFailure();
    return (HMDDeviceAddress *)-[HMDDeviceAddress isEqual:](v13, v14, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDDeviceAddress;
  v10 = -[HMDDeviceAddress init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_idsIdentifier, a3);
    objc_storeStrong((id *)&v11->_idsDestination, a4);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HMDDeviceAddress *v4;
  HMDDeviceAddress *v5;
  HMDDeviceAddress *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMDDeviceAddress *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDDeviceAddress idsDestination](self, "idsDestination");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDeviceAddress idsDestination](v6, "idsDestination");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[HMDDeviceAddress idsIdentifier](self, "idsIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDeviceAddress idsIdentifier](v6, "idsIdentifier");
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

  }
  return v11;
}

- (BOOL)isEquivalentToDeviceAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  if (!a3)
    return 0;
  v4 = a3;
  -[HMDDeviceAddress idsDestination](self, "idsDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "idsDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDDeviceAddress idsIdentifier](self, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqual:", v10))
    v11 = objc_msgSend(v6, "isEqual:", v8);
  else
    v11 = 0;

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDDeviceAddress idsIdentifier](self, "idsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDDeviceAddress idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceAddress idsDestination](self, "idsDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %{sensitive}@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isCurrentDevice
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceAddress idsIdentifier](self, "idsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceAddress localDeviceIDSIdentifier](HMDDeviceAddress, "localDeviceIDSIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (NSUUID)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

+ (HMDDeviceAddress)addressWithIDSIdentifier:(id)a3 idsDestination:(id)a4
{
  void *v4;
  id v7;
  id v8;

  v4 = 0;
  if (a3 && a4)
  {
    v7 = a4;
    v8 = a3;
    v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIDSIdentifier:idsDestination:", v8, v7);

  }
  return (HMDDeviceAddress *)v4;
}

+ (id)localDeviceIDSIdentifier
{
  id v2;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock_with_options();
  if (localDeviceIDSIdentifier_localDeviceID)
  {
    v2 = (id)localDeviceIDSIdentifier_localDeviceID;
    os_unfair_lock_unlock((os_unfair_lock_t)&localDeviceIDSIdentifier_lock);
    return v2;
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&localDeviceIDSIdentifier_lock);
    v4 = (void *)IDSCopyLocalDeviceUniqueID();
    os_unfair_lock_lock_with_options();
    if (localDeviceIDSIdentifier_localDeviceID)
      v5 = 1;
    else
      v5 = v4 == 0;
    if (!v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
      v7 = (void *)localDeviceIDSIdentifier_localDeviceID;
      localDeviceIDSIdentifier_localDeviceID = v6;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&localDeviceIDSIdentifier_lock);
    v8 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = localDeviceIDSIdentifier_localDeviceID;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@localDeviceID: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v11 = (id)localDeviceIDSIdentifier_localDeviceID;

    return v11;
  }
}

@end
