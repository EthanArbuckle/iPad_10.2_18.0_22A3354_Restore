@implementation HMAccessorySetupPayload

- (HMAccessorySetupPayload)initWithURL:(NSURL *)setupPayloadURL
{
  HMAccessorySetupPayload *v3;

  if (setupPayloadURL)
  {
    self = -[HMAccessorySetupPayload initWithURL:ownershipToken:](self, "initWithURL:ownershipToken:", setupPayloadURL, 0);
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (HMAccessorySetupPayload)initWithInternalSetupPayload:(id)a3
{
  return -[HMAccessorySetupPayload initWithInternalSetupPayload:ownershipToken:](self, "initWithInternalSetupPayload:ownershipToken:", a3, 0);
}

- (HMAccessorySetupPayload)initWithURL:(NSURL *)setupPayloadURL ownershipToken:(HMAccessoryOwnershipToken *)ownershipToken
{
  NSURL *v6;
  HMAccessoryOwnershipToken *v7;
  HMSetupAccessoryPayload *v8;
  id v9;
  HMAccessorySetupPayload *v10;
  HMAccessorySetupPayload *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSURL *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = setupPayloadURL;
  v7 = ownershipToken;
  v16 = 0;
  v8 = -[HMSetupAccessoryPayload initWithSetupPayloadURL:error:]([HMSetupAccessoryPayload alloc], "initWithSetupPayloadURL:error:", v6, &v16);
  v9 = v16;
  if (v8)
  {
    v10 = -[HMAccessorySetupPayload initWithInternalSetupPayload:ownershipToken:](self, "initWithInternalSetupPayload:ownershipToken:", v8, v7);
    v11 = v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HMSetupAccessoryPayload from setup payload URL %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (HMAccessorySetupPayload)initWithInternalSetupPayload:(id)a3 ownershipToken:(id)a4
{
  id v7;
  id v8;
  HMAccessorySetupPayload *v9;
  HMAccessorySetupPayload *v10;
  uint64_t v11;
  HMAccessoryOwnershipToken *ownershipToken;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessorySetupPayload;
  v9 = -[HMAccessorySetupPayload init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_internalSetupPayload, a3);
    v11 = objc_msgSend(v8, "copy");
    ownershipToken = v10->_ownershipToken;
    v10->_ownershipToken = (HMAccessoryOwnershipToken *)v11;

  }
  return v10;
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
    -[HMAccessorySetupPayload internalSetupPayload](self, "internalSetupPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internalSetupPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMAccessorySetupPayload ownershipToken](self, "ownershipToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ownershipToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = HMFEqualObjects();

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

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMAccessorySetupPayload internalSetupPayload](self, "internalSetupPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMASP.internalSetupPayload"));

  -[HMAccessorySetupPayload ownershipToken](self, "ownershipToken");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMASP.ownershipToken"));

}

- (HMAccessorySetupPayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessorySetupPayload *v7;
  HMAccessorySetupPayload *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMASP.internalSetupPayload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMASP.ownershipToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = -[HMAccessorySetupPayload initWithInternalSetupPayload:ownershipToken:](self, "initWithInternalSetupPayload:ownershipToken:", v5, v6);
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = 0;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize from internalSetupPayload: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (HMSetupAccessoryPayload)internalSetupPayload
{
  return (HMSetupAccessoryPayload *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessoryOwnershipToken)ownershipToken
{
  return (HMAccessoryOwnershipToken *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownershipToken, 0);
  objc_storeStrong((id *)&self->_internalSetupPayload, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
