@implementation HMHomeWalletKeyDeviceState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressEnablementConflictingPassDescription, 0);
  objc_storeStrong((id *)&self->_walletKey, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMHomeWalletKeyDeviceState walletKey](self, "walletKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("HMHomeWalletKeyDeviceStateWalletKey"));

  -[HMHomeWalletKeyDeviceState expressEnablementConflictingPassDescription](self, "expressEnablementConflictingPassDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("HMHomeWalletKeyDeviceStateExpressEnablementConflictingPassDescription"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[HMHomeWalletKeyDeviceState canAddWalletKeyErrorCode](self, "canAddWalletKeyErrorCode"), CFSTR("HMHomeWalletKeyDeviceStateCanAddWalletKeyErrorCode"));
  objc_msgSend(v6, "encodeBool:forKey:", -[HMHomeWalletKeyDeviceState canAddWalletKey](self, "canAddWalletKey"), CFSTR("HMHomeWalletKeyDeviceStateCanAddWalletKey"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableHomeWalletKeyDeviceState *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(HMMutableHomeWalletKeyDeviceState);
  -[HMHomeWalletKeyDeviceState setCanAddWalletKeyErrorCode:](v4, "setCanAddWalletKeyErrorCode:", -[HMHomeWalletKeyDeviceState canAddWalletKeyErrorCode](self, "canAddWalletKeyErrorCode"));
  -[HMHomeWalletKeyDeviceState setCanAddWalletKey:](v4, "setCanAddWalletKey:", -[HMHomeWalletKeyDeviceState canAddWalletKey](self, "canAddWalletKey"));
  -[HMHomeWalletKeyDeviceState walletKey](self, "walletKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeWalletKeyDeviceState setWalletKey:](v4, "setWalletKey:", v5);

  -[HMHomeWalletKeyDeviceState expressEnablementConflictingPassDescription](self, "expressEnablementConflictingPassDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeWalletKeyDeviceState setExpressEnablementConflictingPassDescription:](v4, "setExpressEnablementConflictingPassDescription:", v6);

  return v4;
}

- (int64_t)canAddWalletKeyErrorCode
{
  return self->_canAddWalletKeyErrorCode;
}

- (HMHomeWalletKeyDeviceState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  HMHomeWalletKeyDeviceState *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMHomeWalletKeyDeviceStateWalletKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMHomeWalletKeyDeviceStateExpressEnablementConflictingPassDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMHomeWalletKeyDeviceStateCanAddWalletKeyErrorCode"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMHomeWalletKeyDeviceStateCanAddWalletKey"));

  v9 = objc_alloc_init(HMHomeWalletKeyDeviceState);
  -[HMHomeWalletKeyDeviceState setCanAddWalletKeyErrorCode:](v9, "setCanAddWalletKeyErrorCode:", v7);
  -[HMHomeWalletKeyDeviceState setWalletKey:](v9, "setWalletKey:", v5);
  -[HMHomeWalletKeyDeviceState setExpressEnablementConflictingPassDescription:](v9, "setExpressEnablementConflictingPassDescription:", v6);
  -[HMHomeWalletKeyDeviceState setCanAddWalletKey:](v9, "setCanAddWalletKey:", v8);

  return v9;
}

- (void)setExpressEnablementConflictingPassDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setCanAddWalletKeyErrorCode:(int64_t)a3
{
  self->_canAddWalletKeyErrorCode = a3;
}

- (void)setCanAddWalletKey:(BOOL)a3
{
  self->_canAddWalletKey = a3;
}

- (void)setWalletKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeWalletKeyDeviceState walletKey](self, "walletKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Wallet Key"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeWalletKeyDeviceState expressEnablementConflictingPassDescription](self, "expressEnablementConflictingPassDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Express Enablement Conflicting Pass Description"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeWalletKeyDeviceState canAddWalletKey](self, "canAddWalletKey");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Can Add Wallet Key"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  HMHomeAddWalletKeyErrorCodeAsString(-[HMHomeWalletKeyDeviceState canAddWalletKeyErrorCode](self, "canAddWalletKeyErrorCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Can Add Wallet Key Error Code"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (HMHomeWalletKey)walletKey
{
  return (HMHomeWalletKey *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)expressEnablementConflictingPassDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)canAddWalletKey
{
  return self->_canAddWalletKey;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  objc_msgSend(v6, "walletKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeWalletKeyDeviceState walletKey](self, "walletKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects();

  if (!v10)
    goto LABEL_9;
  objc_msgSend(v7, "expressEnablementConflictingPassDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeWalletKeyDeviceState expressEnablementConflictingPassDescription](self, "expressEnablementConflictingPassDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = HMFEqualObjects();

  if (!v13)
    goto LABEL_9;
  v14 = objc_msgSend(v7, "canAddWalletKeyErrorCode");
  if (v14 == -[HMHomeWalletKeyDeviceState canAddWalletKeyErrorCode](self, "canAddWalletKeyErrorCode"))
  {
    v15 = objc_msgSend(v7, "canAddWalletKey");
    v16 = v15 ^ -[HMHomeWalletKeyDeviceState canAddWalletKey](self, "canAddWalletKey") ^ 1;
  }
  else
  {
LABEL_9:
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  -[HMHomeWalletKeyDeviceState walletKey](self, "walletKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMHomeWalletKeyDeviceState expressEnablementConflictingPassDescription](self, "expressEnablementConflictingPassDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  v7 = v6 ^ -[HMHomeWalletKeyDeviceState canAddWalletKeyErrorCode](self, "canAddWalletKeyErrorCode");
  return v7 ^ -[HMHomeWalletKeyDeviceState canAddWalletKey](self, "canAddWalletKey");
}

- (NSString)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
