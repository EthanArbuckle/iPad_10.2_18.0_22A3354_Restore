@implementation HMAccessorySettingsFetchRequestMessagePayload

- (HMAccessorySettingsFetchRequestMessagePayload)initWithAccessoryUUID:(id)a3 keyPaths:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMAccessorySettingsFetchRequestMessagePayload *v10;
  HMAccessorySettingsFetchRequestMessagePayload *v11;
  HMAccessorySettingsFetchRequestMessagePayload *v13;
  SEL v14;
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMAccessorySettingsFetchRequestMessagePayload *)_HMFPreconditionFailure();
    return -[HMAccessorySettingsFetchRequestMessagePayload initWithPayload:](v13, v14, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)HMAccessorySettingsFetchRequestMessagePayload;
  v10 = -[HMAccessorySettingsFetchRequestMessagePayload init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accessoryUUID, a3);
    objc_storeStrong((id *)&v11->_keyPaths, a4);
  }

  return v11;
}

- (HMAccessorySettingsFetchRequestMessagePayload)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMAccessorySettingsFetchRequestMessagePayload *v8;
  HMAccessorySettingsFetchRequestMessagePayload *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("HMAccessoryUUIDPayloadKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("HMImmutableSettingKeyPathsPayloadKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    v8 = -[HMAccessorySettingsFetchRequestMessagePayload initWithAccessoryUUID:keyPaths:](self, "initWithAccessoryUUID:keyPaths:", v5, v6);
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings fetch request message payload: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("HMAccessoryUUIDPayloadKey");
  -[HMAccessorySettingsFetchRequestMessagePayload accessoryUUID](self, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("HMImmutableSettingKeyPathsPayloadKey");
  v9[0] = v4;
  -[HMAccessorySettingsFetchRequestMessagePayload keyPaths](self, "keyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessorySettingsFetchRequestMessagePayload accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryUUID"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessorySettingsFetchRequestMessagePayload keyPaths](self, "keyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("keyPaths"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessorySettingsFetchRequestMessagePayload *v4;
  HMAccessorySettingsFetchRequestMessagePayload *v5;
  HMAccessorySettingsFetchRequestMessagePayload *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v15[4];
  HMAccessorySettingsFetchRequestMessagePayload *v16;

  v4 = (HMAccessorySettingsFetchRequestMessagePayload *)a3;
  if (v4 == self)
  {
    v13 = 1;
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
      -[HMAccessorySettingsFetchRequestMessagePayload accessoryUUID](self, "accessoryUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsFetchRequestMessagePayload accessoryUUID](v6, "accessoryUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        -[HMAccessorySettingsFetchRequestMessagePayload keyPaths](self, "keyPaths");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");
        -[HMAccessorySettingsFetchRequestMessagePayload keyPaths](v6, "keyPaths");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == objc_msgSend(v11, "count"))
        {
          -[HMAccessorySettingsFetchRequestMessagePayload keyPaths](self, "keyPaths");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __57__HMAccessorySettingsFetchRequestMessagePayload_isEqual___block_invoke;
          v15[3] = &unk_1E3AAFB58;
          v16 = v6;
          v13 = objc_msgSend(v12, "na_allObjectsPassTest:", v15);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMAccessorySettingsFetchRequestMessagePayload accessoryUUID](self, "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)keyPaths
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

uint64_t __57__HMAccessorySettingsFetchRequestMessagePayload_isEqual___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "keyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_16628 != -1)
    dispatch_once(&logCategory__hmf_once_t1_16628, &__block_literal_global_16629);
  return (id)logCategory__hmf_once_v2_16630;
}

void __60__HMAccessorySettingsFetchRequestMessagePayload_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_16630;
  logCategory__hmf_once_v2_16630 = v0;

}

@end
