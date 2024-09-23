@implementation HMCHIPAccessoryPairing

- (HMCHIPAccessoryPairing)initWithIdentifier:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCHIPAccessoryPairing *v9;
  uint64_t v10;
  NSNumber *identifier;
  uint64_t v12;
  HMCHIPHome *home;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSUUID *UUID;
  HMCHIPAccessoryPairing *v23;
  SEL v24;
  id v25;
  objc_super v26;
  uint64_t v27;

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
    v23 = (HMCHIPAccessoryPairing *)_HMFPreconditionFailure();
    return (HMCHIPAccessoryPairing *)-[HMCHIPAccessoryPairing isEqual:](v23, v24, v25);
  }
  v26.receiver = self;
  v26.super_class = (Class)HMCHIPAccessoryPairing;
  v9 = -[HMCHIPAccessoryPairing init](&v26, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSNumber *)v10;

    v12 = objc_msgSend(v8, "copy");
    home = v9->_home;
    v9->_home = (HMCHIPHome *)v12;

    v14 = v8;
    v15 = v6;
    objc_opt_self();
    v16 = objc_msgSend(v15, "integerValue");

    v27 = v16;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v27, 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v14, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "hmf_UUIDWithNamespace:data:", v19, v17);
    v20 = objc_claimAutoreleasedReturnValue();

    UUID = v9->_UUID;
    v9->_UUID = (NSUUID *)v20;

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
    -[HMCHIPAccessoryPairing identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8))
    {
      -[HMCHIPAccessoryPairing home](self, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "home");
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

  -[HMCHIPAccessoryPairing identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableCHIPAccessoryPairing *v4;
  void *v5;
  void *v6;
  HMMutableCHIPAccessoryPairing *v7;
  void *v8;

  v4 = +[HMMutableCHIPAccessoryPairing allocWithZone:](HMMutableCHIPAccessoryPairing, "allocWithZone:", a3);
  -[HMCHIPAccessoryPairing identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPAccessoryPairing home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCHIPAccessoryPairing initWithIdentifier:home:](v4, "initWithIdentifier:home:", v5, v6);

  -[HMCHIPAccessoryPairing systemCommissionerPairingUUID](self, "systemCommissionerPairingUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPAccessoryPairing setSystemCommissionerPairingUUID:](v7, "setSystemCommissionerPairingUUID:", v8);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMCHIPAccessoryPairing identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMCAP.ck.identifier"));

  -[HMCHIPAccessoryPairing home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMCAP.ck.home"));

  -[HMCHIPAccessoryPairing systemCommissionerPairingUUID](self, "systemCommissionerPairingUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMCAP.ck.systemCommissionerPairingUUID"));

}

- (HMCHIPAccessoryPairing)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMCHIPAccessoryPairing *v12;
  HMCHIPAccessoryPairing *v13;
  HMCHIPAccessoryPairing *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAP.ck.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAP.ck.home"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAP.ck.systemCommissionerPairingUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ home: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = 0;
  }
  else
  {
    v12 = -[HMCHIPAccessoryPairing initWithIdentifier:home:](self, "initWithIdentifier:home:", v5, v6);
    -[HMCHIPAccessoryPairing setSystemCommissionerPairingUUID:](v12, "setSystemCommissionerPairingUUID:", v7);
    v13 = v12;
    v14 = v13;
  }

  return v14;
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
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPAccessoryPairing identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Identifier"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPAccessoryPairing home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Home"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPAccessoryPairing systemCommissionerPairingUUID](self, "systemCommissionerPairingUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("System Commissioner Pairing UUID"), v11);
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v13;
}

- (id)operationalIdentity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMCHIPAccessoryOperationalIdentity *v7;

  -[HMCHIPAccessoryPairing home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ecosystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMCHIPAccessoryPairing identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCHIPAccessoryOperationalIdentity initWithRootPublicKey:nodeID:]([HMCHIPAccessoryOperationalIdentity alloc], "initWithRootPublicKey:nodeID:", v5, v6);

  return v7;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (HMCHIPHome)home
{
  return (HMCHIPHome *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)systemCommissionerPairingUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSystemCommissionerPairingUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemCommissionerPairingUUID, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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
