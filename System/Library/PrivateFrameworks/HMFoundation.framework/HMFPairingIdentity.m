@implementation HMFPairingIdentity

+ (id)pairingIdentity
{
  HMFPairingKey *v2;
  void *v3;
  HMFPairingKey *v4;
  HMFPairingKey *v5;
  void *v6;
  HMFPairingKey *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE v13[32];
  _BYTE v14[32];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  cced25519_make_key_pair_compat();
  v2 = [HMFPairingKey alloc];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "_newZeroingDataWithBytes:length:", v14, 32);
  v4 = -[HMFPairingKey initWithPairingKeyData:](v2, "initWithPairingKeyData:", v3);

  v5 = [HMFPairingKey alloc];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "_newZeroingDataWithBytes:length:", v13, 32);
  v7 = -[HMFPairingKey initWithPairingKeyData:](v5, "initWithPairingKeyData:", v6);

  cc_clear();
  cc_clear();
  v8 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithIdentifier:publicKey:privateKey:", v10, v4, v7);

  return v11;
}

- (HMFPairingIdentity)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMFPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMFPairingIdentity *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  HMFPairingKey *publicKey;
  uint64_t v16;
  HMFPairingKey *privateKey;
  HMFPairingIdentity *v18;
  HMFPairingIdentity *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v20 = (void *)MEMORY[0x1A1AC355C]();
    v18 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      v23 = "%{public}@The identifier is required";
LABEL_10:
      _os_log_impl(&dword_19B546000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v20);
    v19 = 0;
    goto LABEL_12;
  }
  if (!v9)
  {
    v20 = (void *)MEMORY[0x1A1AC355C]();
    v18 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      v23 = "%{public}@The public key is required";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMFPairingIdentity;
  v11 = -[HMFPairingIdentity init](&v25, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    publicKey = v11->_publicKey;
    v11->_publicKey = (HMFPairingKey *)v14;

    v16 = objc_msgSend(v10, "copy");
    privateKey = v11->_privateKey;
    v11->_privateKey = (HMFPairingKey *)v16;

  }
  v18 = v11;
  v19 = v18;
LABEL_12:

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMFPairingIdentity identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMFPairingIdentity publicKey](self, "publicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMFPairingIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMFPairingIdentity *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMFPairingIdentity identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFPairingIdentity identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        -[HMFPairingIdentity publicKey](v4, "publicKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMFPairingIdentity publicKey](self, "publicKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFPairingIdentity identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  HMFAttributeDescription *v6;
  void *v7;
  HMFAttributeDescription *v8;
  HMFAttributeDescription *v9;
  void *v10;
  void *v11;
  HMFAttributeDescription *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFPairingIdentity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Identifier"), v4);
  v6 = [HMFAttributeDescription alloc];
  -[HMFPairingIdentity publicKey](self, "publicKey", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMFAttributeDescription initWithName:value:](v6, "initWithName:value:", CFSTR("Public Key"), v7);
  v15[1] = v8;
  v9 = [HMFAttributeDescription alloc];
  -[HMFPairingIdentity privateKey](self, "privateKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMFPrivateObjectFormatter defaultFormatter](HMFPrivateObjectFormatter, "defaultFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMFAttributeDescription initWithName:value:options:formatter:](v9, "initWithName:value:options:formatter:", CFSTR("Private Key"), v10, 2, v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (HMFPairingIdentity)publicPairingIdentity
{
  void *v3;
  HMFPairingIdentity *v4;
  void *v5;
  void *v6;
  HMFPairingIdentity *v7;

  -[HMFPairingIdentity privateKey](self, "privateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [HMFPairingIdentity alloc];
    -[HMFPairingIdentity identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFPairingIdentity publicKey](self, "publicKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMFPairingIdentity initWithIdentifier:publicKey:privateKey:](v4, "initWithIdentifier:publicKey:privateKey:", v5, v6, 0);

  }
  else
  {
    v7 = self;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFPairingIdentity)initWithCoder:(id)a3
{
  id v4;
  HMFPairingIdentity *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  HMFPairingKey *privateKey;
  uint64_t v10;
  HMFPairingKey *publicKey;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMFPairingIdentity;
  v5 = -[HMFPairingIdentity init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HAP.identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HAP.privateKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    privateKey = v5->_privateKey;
    v5->_privateKey = (HMFPairingKey *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HAP.publicKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (HMFPairingKey *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMFPairingIdentity identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HAP.identifier"));

  -[HMFPairingIdentity publicKey](self, "publicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HAP.publicKey"));

  -[HMFPairingIdentity privateKey](self, "privateKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HAP.privateKey"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (HMFPairingKey)publicKey
{
  return self->_publicKey;
}

- (HMFPairingKey)privateKey
{
  return self->_privateKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
