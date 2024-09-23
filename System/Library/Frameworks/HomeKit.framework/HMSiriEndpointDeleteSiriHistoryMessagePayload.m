@implementation HMSiriEndpointDeleteSiriHistoryMessagePayload

- (HMSiriEndpointDeleteSiriHistoryMessagePayload)initWithAccessoryUUID:(id)a3
{
  id v5;
  HMSiriEndpointDeleteSiriHistoryMessagePayload *v6;
  HMSiriEndpointDeleteSiriHistoryMessagePayload *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMSiriEndpointDeleteSiriHistoryMessagePayload;
  v6 = -[HMSiriEndpointDeleteSiriHistoryMessagePayload init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accessoryUUID, a3);

  return v7;
}

- (id)payloadCopy
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("HMAccessoryUUIDPayloadKey");
  -[HMSiriEndpointDeleteSiriHistoryMessagePayload accessoryUUID](self, "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMSiriEndpointDeleteSiriHistoryMessagePayload)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  HMSiriEndpointDeleteSiriHistoryMessagePayload *v6;
  HMSiriEndpointDeleteSiriHistoryMessagePayload *v7;
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
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("HMAccessoryUUIDPayloadKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HMSiriEndpointDeleteSiriHistoryMessagePayload initWithAccessoryUUID:](self, "initWithAccessoryUUID:", v5);
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to decode delete siri history payload: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointDeleteSiriHistoryMessagePayload accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryUUID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (BOOL)isEqual:(id)a3
{
  HMSiriEndpointDeleteSiriHistoryMessagePayload *v4;
  HMSiriEndpointDeleteSiriHistoryMessagePayload *v5;
  HMSiriEndpointDeleteSiriHistoryMessagePayload *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMSiriEndpointDeleteSiriHistoryMessagePayload *)a3;
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
      -[HMSiriEndpointDeleteSiriHistoryMessagePayload accessoryUUID](self, "accessoryUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSiriEndpointDeleteSiriHistoryMessagePayload accessoryUUID](v6, "accessoryUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

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

  -[HMSiriEndpointDeleteSiriHistoryMessagePayload accessoryUUID](self, "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

+ (NSString)messageName
{
  return (NSString *)CFSTR("HMSiriEndpointDeleteSiriHistoryMessage");
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_18380 != -1)
    dispatch_once(&logCategory__hmf_once_t1_18380, &__block_literal_global_18381);
  return (id)logCategory__hmf_once_v2_18382;
}

void __60__HMSiriEndpointDeleteSiriHistoryMessagePayload_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_18382;
  logCategory__hmf_once_v2_18382 = v0;

}

@end
