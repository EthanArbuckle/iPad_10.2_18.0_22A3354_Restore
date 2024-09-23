@implementation HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload

- (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload)initWithAccessoryIdentifier:(id)a3
{
  id v5;
  void *v6;
  HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *v7;
  HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *v8;
  HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *v10;
  SEL v11;
  id v12;
  objc_super v13;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload;
    v7 = -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload init](&v13, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_accessoryIdentifier, a3);

    return v8;
  }
  else
  {
    v10 = (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)_HMFPreconditionFailure();
    return -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload initWithPayload:](v10, v11, v12);
  }
}

- (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *v6;
  HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x1E0CB7D60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload initWithAccessoryIdentifier:](self, "initWithAccessoryIdentifier:", v5);
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive message due to no accessory identifier in payload: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)payloadCopy
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CB7D60];
  -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload accessoryIdentifier](self, "accessoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload accessoryIdentifier](self, "accessoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryIdentifier"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *v4;
  HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *v5;
  HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload accessoryIdentifier](self, "accessoryIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload accessoryIdentifier](v6, "accessoryIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload accessoryIdentifier](self, "accessoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)accessoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

+ (NSString)messageName
{
  return (NSString *)CFSTR("HMDAppleMediaAccessoryModelIdentiferRequestMessage");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_73239 != -1)
    dispatch_once(&logCategory__hmf_once_t1_73239, &__block_literal_global_73240);
  return (id)logCategory__hmf_once_v2_73241;
}

void __73__HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_73241;
  logCategory__hmf_once_v2_73241 = v0;

}

@end
