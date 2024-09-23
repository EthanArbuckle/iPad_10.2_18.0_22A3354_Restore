@implementation HMCHIPVendor

- (HMCHIPVendor)initWithIdentifier:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCHIPVendor *v9;
  uint64_t v10;
  NSNumber *identifier;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSUUID *UUID;
  HMCHIPVendor *v17;
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
    v17 = (HMCHIPVendor *)_HMFPreconditionFailure();
    return (HMCHIPVendor *)-[HMCHIPVendor isEqual:](v17, v18, v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)HMCHIPVendor;
  v9 = -[HMCHIPVendor init](&v20, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSNumber *)v10;

    v12 = objc_msgSend(v8, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v12;

    +[HMCHIPVendor UUIDFromIdentifier:](HMCHIPVendor, "UUIDFromIdentifier:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    UUID = v9->_UUID;
    v9->_UUID = (NSUUID *)v14;

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
  int v11;
  int v12;
  _BOOL4 v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMCHIPVendor identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8))
    {
      -[HMCHIPVendor name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10)
        && (v11 = -[HMCHIPVendor isAppleVendor](self, "isAppleVendor"),
            v11 == objc_msgSend(v6, "isAppleVendor")))
      {
        v13 = -[HMCHIPVendor isSystemCommissionerVendor](self, "isSystemCommissionerVendor");
        v12 = v13 ^ objc_msgSend(v6, "isSystemCommissionerVendor") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMCHIPVendor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableCHIPVendor *v4;
  void *v5;
  void *v6;
  HMMutableCHIPVendor *v7;

  v4 = +[HMMutableCHIPVendor allocWithZone:](HMMutableCHIPVendor, "allocWithZone:", a3);
  -[HMCHIPVendor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPVendor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCHIPVendor initWithIdentifier:name:](v4, "initWithIdentifier:name:", v5, v6);

  -[HMCHIPVendor setAppleVendor:](v7, "setAppleVendor:", -[HMCHIPVendor isAppleVendor](self, "isAppleVendor"));
  -[HMCHIPVendor setSystemCommissionerVendor:](v7, "setSystemCommissionerVendor:", -[HMCHIPVendor isSystemCommissionerVendor](self, "isSystemCommissionerVendor"));
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMCHIPVendor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("HMCV.ck.identifier"));

  -[HMCHIPVendor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("HMCV.ck.name"));

  objc_msgSend(v6, "encodeBool:forKey:", -[HMCHIPVendor isAppleVendor](self, "isAppleVendor"), CFSTR("HMCV.ck.isAppleVendor"));
  objc_msgSend(v6, "encodeBool:forKey:", -[HMCHIPVendor isSystemCommissionerVendor](self, "isSystemCommissionerVendor"), CFSTR("HMCV.ck.isSystemCommissionerVendor"));

}

- (HMCHIPVendor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMCHIPVendor *v12;
  HMCHIPVendor *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCV.ck.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCV.ck.name"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
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
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ name: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }
  else
  {
    v12 = -[HMCHIPVendor initWithIdentifier:name:](self, "initWithIdentifier:name:", v5, v6);
    -[HMCHIPVendor setAppleVendor:](v12, "setAppleVendor:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCV.ck.isAppleVendor")));
    -[HMCHIPVendor setSystemCommissionerVendor:](v12, "setSystemCommissionerVendor:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCV.ck.isSystemCommissionerVendor")));
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
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPVendor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Identifier"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPVendor name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Name"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPVendor isAppleVendor](self, "isAppleVendor");
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Is Apple Vendor"), v11);
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPVendor isSystemCommissionerVendor](self, "isSystemCommissionerVendor");
  HMFBooleanToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Is System Commissioner"), v14);
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v16;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isAppleVendor
{
  return self->_appleVendor;
}

- (void)setAppleVendor:(BOOL)a3
{
  self->_appleVendor = a3;
}

- (BOOL)isSystemCommissionerVendor
{
  return self->_systemCommissionerVendor;
}

- (void)setSystemCommissionerVendor:(BOOL)a3
{
  self->_systemCommissionerVendor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)UUIDFromIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("9E8B0B4A-EB40-4566-A9B4-65FFCE246CC9"));
  v6 = objc_msgSend(v4, "integerValue");

  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v10, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_UUIDWithNamespace:data:", v5, v7);
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
