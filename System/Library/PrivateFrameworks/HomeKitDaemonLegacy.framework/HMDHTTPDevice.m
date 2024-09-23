@implementation HMDHTTPDevice

- (HMDHTTPDevice)init
{
  void *v3;
  HMDHTTPDevice *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDHTTPDevice initWithIdentifier:](self, "initWithIdentifier:", v3);

  return v4;
}

- (HMDHTTPDevice)initWithIdentifier:(id)a3
{
  id v4;
  HMDHTTPDevice *v5;
  uint64_t v6;
  NSUUID *identifier;
  HMDHTTPDevice *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDHTTPDevice;
    v5 = -[HMDHTTPDevice init](&v14, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDHTTPDevice description](HMDHTTPDevice, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%@] A valid identifier is required", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E89C3E38;
  }
  -[HMDHTTPDevice identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Identifier = %@>"), v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDHTTPDevice descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDHTTPDevice descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDHTTPDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDHTTPDevice *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMDHTTPDevice *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMDHTTPDevice identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHTTPDevice identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHTTPDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_42730 != -1)
    dispatch_once(&logCategory__hmf_once_t1_42730, &__block_literal_global_42731);
  return (id)logCategory__hmf_once_v2_42732;
}

void __28__HMDHTTPDevice_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_42732;
  logCategory__hmf_once_v2_42732 = v0;

}

@end
