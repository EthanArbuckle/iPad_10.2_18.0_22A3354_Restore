@implementation HMCHIPEcosystem

- (HMCHIPEcosystem)initWithRootPublicKey:(id)a3 vendor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCHIPEcosystem *v9;
  uint64_t v10;
  NSData *rootPublicKey;
  uint64_t v12;
  HMCHIPVendor *vendor;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSUUID *UUID;
  HMCHIPEcosystem *v21;
  SEL v22;
  objc_super v23;

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
    v21 = (HMCHIPEcosystem *)_HMFPreconditionFailure();
    return (HMCHIPEcosystem *)-[HMCHIPEcosystem name](v21, v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)HMCHIPEcosystem;
  v9 = -[HMCHIPEcosystem init](&v23, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    rootPublicKey = v9->_rootPublicKey;
    v9->_rootPublicKey = (NSData *)v10;

    v12 = objc_msgSend(v8, "copy");
    vendor = v9->_vendor;
    v9->_vendor = (HMCHIPVendor *)v12;

    v14 = v8;
    v15 = v6;
    objc_opt_self();
    v16 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v14, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "hmf_UUIDWithNamespace:data:", v17, v15);
    v18 = objc_claimAutoreleasedReturnValue();

    UUID = v9->_UUID;
    v9->_UUID = (NSUUID *)v18;

  }
  return v9;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[HMCHIPEcosystem vendor](self, "vendor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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
    -[HMCHIPEcosystem rootPublicKey](self, "rootPublicKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootPublicKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToData:", v8))
    {
      -[HMCHIPEcosystem vendor](self, "vendor");
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

  -[HMCHIPEcosystem rootPublicKey](self, "rootPublicKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableCHIPEcosystem *v4;
  void *v5;
  void *v6;
  HMMutableCHIPEcosystem *v7;

  v4 = +[HMMutableCHIPEcosystem allocWithZone:](HMMutableCHIPEcosystem, "allocWithZone:", a3);
  -[HMCHIPEcosystem rootPublicKey](self, "rootPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPEcosystem vendor](self, "vendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCHIPEcosystem initWithRootPublicKey:vendor:](v4, "initWithRootPublicKey:vendor:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMCHIPEcosystem rootPublicKey](self, "rootPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSDPE.ck.rootPublicKey"));

  -[HMCHIPEcosystem vendor](self, "vendor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MTSDPE.ck.vendor"));

}

- (HMCHIPEcosystem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  HMCHIPEcosystem *v11;
  HMCHIPEcosystem *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
  if (!v8)
  {
    v9 = (void *)v6;
    v10 = v5;
LABEL_9:
    v11 = -[HMCHIPEcosystem initWithRootPublicKey:vendor:](self, "initWithRootPublicKey:vendor:", v5, v7);
    v12 = v11;
    goto LABEL_13;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCE.ck.rootPublicKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCE.ck.vendor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v9)
  {
    v7 = v9;
    v5 = v10;
    goto LABEL_9;
  }
  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v15;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded rootPublicKey: %@ vendor: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  v12 = 0;
LABEL_13:

  return v12;
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPEcosystem rootPublicKey](self, "rootPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Root Public Key"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPEcosystem vendor](self, "vendor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Vendor"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (HMCHIPVendor)vendor
{
  return (HMCHIPVendor *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
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
