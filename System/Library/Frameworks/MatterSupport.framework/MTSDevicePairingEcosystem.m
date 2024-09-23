@implementation MTSDevicePairingEcosystem

- (MTSDevicePairingEcosystem)initWithRootPublicKey:(id)a3 vendor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTSDevicePairingEcosystem *v9;
  uint64_t v10;
  NSData *rootPublicKey;
  uint64_t v12;
  MTSDevicePairingVendor *vendor;
  uint64_t v14;
  NSUUID *uuid;
  MTSDevicePairingEcosystem *v17;
  SEL v18;
  id v19;
  objc_super v20;

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
    v17 = (MTSDevicePairingEcosystem *)_HMFPreconditionFailure();
    return (MTSDevicePairingEcosystem *)-[MTSDevicePairingEcosystem isEqual:](v17, v18, v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)MTSDevicePairingEcosystem;
  v9 = -[MTSDevicePairingEcosystem init](&v20, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    rootPublicKey = v9->_rootPublicKey;
    v9->_rootPublicKey = (NSData *)v10;

    v12 = objc_msgSend(v8, "copy");
    vendor = v9->_vendor;
    v9->_vendor = (MTSDevicePairingVendor *)v12;

    +[MTSDevicePairingEcosystem UUIDFromRootPublicKey:vendor:](MTSDevicePairingEcosystem, "UUIDFromRootPublicKey:vendor:", v6, v8);
    v14 = objc_claimAutoreleasedReturnValue();
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v14;

  }
  return v9;
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
    -[MTSDevicePairingEcosystem rootPublicKey](self, "rootPublicKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootPublicKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToData:", v8))
    {
      -[MTSDevicePairingEcosystem vendor](self, "vendor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "vendor");
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

  -[MTSDevicePairingEcosystem rootPublicKey](self, "rootPublicKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MTSDevicePairingEcosystem rootPublicKey](self, "rootPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSDPE.ck.rootPublicKey"));

  -[MTSDevicePairingEcosystem vendor](self, "vendor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MTSDPE.ck.vendor"));

}

- (MTSDevicePairingEcosystem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  MTSDevicePairingEcosystem *v12;
  MTSDevicePairingEcosystem *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDPE.ck.rootPublicKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDPE.ck.vendor"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x23493F978]();
    v12 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2344FE000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded rootPublicKey: %@ vendor: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }
  else
  {
    v12 = -[MTSDevicePairingEcosystem initWithRootPublicKey:vendor:](self, "initWithRootPublicKey:vendor:", v5, v6);
    v13 = v12;
  }

  return v13;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSDevicePairingEcosystem rootPublicKey](self, "rootPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Root Public Key"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSDevicePairingEcosystem vendor](self, "vendor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Vendor"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (MTSDevicePairingVendor)vendor
{
  return (MTSDevicePairingVendor *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)UUIDFromRootPublicKey:(id)a3 vendor:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD1880];
  v6 = a3;
  objc_msgSend(a4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
