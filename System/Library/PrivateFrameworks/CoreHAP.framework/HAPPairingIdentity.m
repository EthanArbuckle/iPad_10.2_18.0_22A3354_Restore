@implementation HAPPairingIdentity

- (HAPPairingIdentity)initWithKeychainItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HAPPairingIdentity *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HAPPairingIdentity *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  _BYTE __s[32];
  _BYTE v28[32];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "valueData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _deserializeDataToKeyPair(v5, (uint64_t)v28, (uint64_t)__s);

  if ((_DWORD)v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v10;
      v23 = 2112;
      v24 = v4;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to deserialize key for item %@: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = 0;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0D28658]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v28, 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithPairingKeyData:", v14);

    v16 = objc_alloc(MEMORY[0x1E0D28658]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithPairingKeyData:", v17);

    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    objc_msgSend(v4, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:](self, "initWithIdentifier:publicKey:privateKey:", v19, v15, v18);

    v12 = v8;
  }

  return v12;
}

- (HAPPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5
{
  return -[HAPPairingIdentity initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:](self, "initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:", a3, 0, a4, a5, 0);
}

- (HAPPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5 permissions:(unint64_t)a6
{
  HAPPairingIdentity *result;

  result = -[HAPPairingIdentity initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:](self, "initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:", a3, 0, a4, a5, a6);
  if (result)
    result->_permissions = a6;
  return result;
}

- (HAPPairingIdentity)initWithIdentifier:(id)a3 controllerKeyIdentifier:(id)a4 publicKey:(id)a5 privateKey:(id)a6 permissions:(unint64_t)a7
{
  id v13;
  HAPPairingIdentity *v14;
  HAPPairingIdentity *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HAPPairingIdentity;
  v14 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:](&v17, sel_initWithIdentifier_publicKey_privateKey_, a3, a5, a6);
  v15 = v14;
  if (v14)
  {
    v14->_permissions = a7;
    objc_storeStrong((id *)&v14->_controllerKeyIdentifier, a4);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPPairingIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HAPPairingIdentity *v9;

  v4 = +[HAPPairingIdentity allocWithZone:](HAPPairingIdentity, "allocWithZone:", a3);
  -[HAPPairingIdentity identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPPairingIdentity controllerKeyIdentifier](self, "controllerKeyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPPairingIdentity publicKey](self, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPPairingIdentity privateKey](self, "privateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HAPPairingIdentity initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:](v4, "initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:", v5, v6, v7, v8, -[HAPPairingIdentity permissions](self, "permissions"));

  return v9;
}

- (HAPPairingIdentity)initWithCoder:(id)a3
{
  id v4;
  HAPPairingIdentity *v5;
  uint64_t v6;
  NSString *controllerKeyIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPPairingIdentity;
  v5 = -[HAPPairingIdentity initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_permissions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HAP.permissions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HAP.ctrlId"));
    v6 = objc_claimAutoreleasedReturnValue();
    controllerKeyIdentifier = v5->_controllerKeyIdentifier;
    v5->_controllerKeyIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HAPPairingIdentity;
  v4 = a3;
  -[HAPPairingIdentity encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPPairingIdentity permissions](self, "permissions", v6.receiver, v6.super_class), CFSTR("HAP.permissions"));
  -[HAPPairingIdentity controllerKeyIdentifier](self, "controllerKeyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HAP.ctrlId"));

}

- (BOOL)isStrictlyEqual:(id)a3
{
  HAPPairingIdentity *v4;
  HAPPairingIdentity *v5;
  HAPPairingIdentity *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = (HAPPairingIdentity *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (v12.receiver = self,
          v12.super_class = (Class)HAPPairingIdentity,
          -[HAPPairingIdentity isEqual:](&v12, sel_isEqual_, v4))
      && (v7 = -[HAPPairingIdentity permissions](self, "permissions"),
          v7 == -[HAPPairingIdentity permissions](self, "permissions")))
    {
      -[HAPPairingIdentity controllerKeyIdentifier](self, "controllerKeyIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPPairingIdentity controllerKeyIdentifier](v6, "controllerKeyIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = HMFEqualObjects();

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HAPPairingIdentity;
  -[HAPPairingIdentity attributeDescriptions](&v9, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HAPPairingIdentity controllerKeyIdentifier](self, "controllerKeyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("controllerKeyIdentifier"), v6);
  objc_msgSend(v4, "addObject:", v7);

  return v4;
}

- (unint64_t)permissions
{
  return self->_permissions;
}

- (NSString)controllerKeyIdentifier
{
  return self->_controllerKeyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerKeyIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
