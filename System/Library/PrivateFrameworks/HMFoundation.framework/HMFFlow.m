@implementation HMFFlow

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)internalOnlyInitializer
{
  return (id)objc_opt_new();
}

- (HMFFlow)init
{
  void *v3;
  HMFFlow *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMFFlow initWithUUID:](self, "initWithUUID:", v3);

  return v4;
}

- (HMFFlow)initWithUUID:(id)a3
{
  id v4;
  HMFFlow *v5;
  uint64_t v6;
  NSUUID *UUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMFFlow;
  v5 = -[HMFFlow init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

  }
  return v5;
}

+ (id)untrackedPlaceholderFlow
{
  return (id)objc_opt_new();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[HMFFlow UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqual:", v8);
  return (char)v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMFFlow UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFFlow UUID](self, "UUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMFFlowUUIDCodingKey"));

}

- (HMFFlow)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMFFlow *v6;
  HMFFlow *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFFlowUUIDCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HMFFlow initWithUUID:](self, "initWithUUID:", v5);
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC355C]();
    v6 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding UUID", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

@end
