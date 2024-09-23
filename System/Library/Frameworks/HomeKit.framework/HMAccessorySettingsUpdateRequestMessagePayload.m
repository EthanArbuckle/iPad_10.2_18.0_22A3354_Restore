@implementation HMAccessorySettingsUpdateRequestMessagePayload

- (HMAccessorySettingsUpdateRequestMessagePayload)initWithAccessoryUUID:(id)a3 keyPath:(id)a4 settingValue:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMAccessorySettingsUpdateRequestMessagePayload *v13;
  HMAccessorySettingsUpdateRequestMessagePayload *v14;
  HMAccessorySettingsUpdateRequestMessagePayload *v16;
  SEL v17;
  id v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v16 = (HMAccessorySettingsUpdateRequestMessagePayload *)_HMFPreconditionFailure();
    return -[HMAccessorySettingsUpdateRequestMessagePayload initWithPayload:](v16, v17, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)HMAccessorySettingsUpdateRequestMessagePayload;
  v13 = -[HMAccessorySettingsUpdateRequestMessagePayload init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accessoryUUID, a3);
    objc_storeStrong((id *)&v14->_keyPath, a4);
    objc_storeStrong((id *)&v14->_settingValue, a5);
  }

  return v14;
}

- (HMAccessorySettingsUpdateRequestMessagePayload)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMImmutableSettingValue *v9;
  HMAccessorySettingsUpdateRequestMessagePayload *v10;
  HMAccessorySettingsUpdateRequestMessagePayload *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("HMAccessoryUUIDPayloadKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("HMImmutableSettingKeyPathPayloadKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("HMImmutableSettingValuePayloadKey"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 && v6 && v7)
  {
    v9 = -[HMImmutableSettingValue initWithPayload:]([HMImmutableSettingValue alloc], "initWithPayload:", v7);
    if (v9)
    {
      v10 = -[HMAccessorySettingsUpdateRequestMessagePayload initWithAccessoryUUID:keyPath:settingValue:](self, "initWithAccessoryUUID:keyPath:settingValue:", v5, v6, v9);
      v11 = v10;
    }
    else
    {
      v15 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings update request message due to invalid setting value payload: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      v11 = 0;
    }

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
      v19 = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings update request message payload: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("HMAccessoryUUIDPayloadKey");
  -[HMAccessorySettingsUpdateRequestMessagePayload accessoryUUID](self, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("HMImmutableSettingKeyPathPayloadKey");
  -[HMAccessorySettingsUpdateRequestMessagePayload keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("HMImmutableSettingValuePayloadKey");
  -[HMAccessorySettingsUpdateRequestMessagePayload settingValue](self, "settingValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payloadCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessorySettingsUpdateRequestMessagePayload keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("keyPath"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessorySettingsUpdateRequestMessagePayload accessoryUUID](self, "accessoryUUID", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("accessoryUUID"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessorySettingsUpdateRequestMessagePayload settingValue](self, "settingValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("settingValue"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessorySettingsUpdateRequestMessagePayload *v4;
  HMAccessorySettingsUpdateRequestMessagePayload *v5;
  HMAccessorySettingsUpdateRequestMessagePayload *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (HMAccessorySettingsUpdateRequestMessagePayload *)a3;
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
      -[HMAccessorySettingsUpdateRequestMessagePayload accessoryUUID](self, "accessoryUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsUpdateRequestMessagePayload accessoryUUID](v6, "accessoryUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        -[HMAccessorySettingsUpdateRequestMessagePayload keyPath](self, "keyPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAccessorySettingsUpdateRequestMessagePayload keyPath](v6, "keyPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[HMAccessorySettingsUpdateRequestMessagePayload settingValue](self, "settingValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMAccessorySettingsUpdateRequestMessagePayload settingValue](v6, "settingValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

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

  -[HMAccessorySettingsUpdateRequestMessagePayload accessoryUUID](self, "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMImmutableSettingValue)settingValue
{
  return (HMImmutableSettingValue *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingValue, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_28837 != -1)
    dispatch_once(&logCategory__hmf_once_t2_28837, &__block_literal_global_28838);
  return (id)logCategory__hmf_once_v3_28839;
}

void __61__HMAccessorySettingsUpdateRequestMessagePayload_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_28839;
  logCategory__hmf_once_v3_28839 = v0;

}

@end
