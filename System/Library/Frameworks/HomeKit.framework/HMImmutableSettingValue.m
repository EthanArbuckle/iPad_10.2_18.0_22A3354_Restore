@implementation HMImmutableSettingValue

- (id)initSettingValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMImmutableSettingValue;
  return -[HMImmutableSettingValue init](&v3, sel_init);
}

- (id)payloadCopy
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("HMImmutableSettingValueTypePayloadKey");
  v4[0] = &unk_1E3B2E158;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HMImmutableSettingValue)initWithPayload:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  HMImmutableSettingValue *v10;
  HMImmutableSettingValue *v11;
  void *v12;
  void *v13;
  __objc2_class *v14;
  HMSettingLanguageValue *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0;
  v5 = objc_msgSend(v4, "hmf_integerForKey:error:", CFSTR("HMImmutableSettingValueTypePayloadKey"), &v17);
  v6 = v17;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    self = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no value type in payload: %@", buf, 0x16u);

    }
LABEL_4:

    objc_autoreleasePoolPop(v7);
    v10 = 0;
  }
  else
  {
    switch(v5)
    {
      case 0uLL:
        v11 = (HMImmutableSettingValue *)-[HMImmutableSettingValue initSettingValue](self, "initSettingValue");
        self = v11;
        goto LABEL_15;
      case 1uLL:
        v14 = HMSettingBooleanValue;
        goto LABEL_14;
      case 2uLL:
        v14 = HMSettingIntegerValue;
        goto LABEL_14;
      case 3uLL:
        v14 = HMSettingStringValue;
        goto LABEL_14;
      case 4uLL:
        v15 = -[HMSettingLanguageValue initWithPayload:]([HMSettingLanguageValue alloc], "initWithPayload:", v4);
        +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:](HMFObjectCacheHMSettingLanguageValue, "cachedInstanceForLanguageSettingValue:", v15);
        v10 = (HMImmutableSettingValue *)objc_claimAutoreleasedReturnValue();

        break;
      case 5uLL:
        v14 = HMSettingVersionValue;
LABEL_14:
        v11 = (HMImmutableSettingValue *)objc_msgSend([v14 alloc], "initWithPayload:", v4);
LABEL_15:
        v10 = v11;
        break;
      default:
        v7 = (void *)MEMORY[0x1A1AC1AAC]();
        self = self;
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          HMImmutableSettingValueTypeAsString(v5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v19 = v12;
          v20 = 2112;
          v21 = v13;
          v22 = 2112;
          v23 = v4;
          _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to unknown value type: %@ in payload: %@", buf, 0x20u);

        }
        goto LABEL_4;
    }
  }

  return v10;
}

- (id)protoPayload
{
  return objc_alloc_init(HMImmutableSettingsProtoValueEvent);
}

- (HMImmutableSettingValue)initWithProtoPayload:(id)a3
{
  id v4;
  HMImmutableSettingValue *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMImmutableSettingValue *v10;
  __objc2_class *v11;
  HMSettingLanguageValue *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasSettingValueEvent") & 1) != 0)
  {
    switch(objc_msgSend(v4, "settingValueEvent"))
    {
      case 0u:
        break;
      case 1u:
        v11 = HMSettingStringValue;
        goto LABEL_10;
      case 2u:
        v11 = HMSettingIntegerValue;
        goto LABEL_10;
      case 3u:
        v11 = HMSettingBooleanValue;
LABEL_10:
        v5 = (HMImmutableSettingValue *)objc_msgSend([v11 alloc], "initWithProtoPayload:", v4);
        goto LABEL_11;
      case 4u:
        v13 = -[HMSettingLanguageValue initWithProtoPayload:]([HMSettingLanguageValue alloc], "initWithProtoPayload:", v4);
        +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:](HMFObjectCacheHMSettingLanguageValue, "cachedInstanceForLanguageSettingValue:", v13);
        v10 = (HMImmutableSettingValue *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      default:
        v6 = (void *)MEMORY[0x1A1AC1AAC]();
        self = self;
        HMFGetOSLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "settingValueEvent"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543874;
          v15 = v8;
          v16 = 2112;
          v17 = v9;
          v18 = 2112;
          v19 = v4;
          _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to unknown settingValueEvent (%@) in protopayload: %@", (uint8_t *)&v14, 0x20u);

        }
        objc_autoreleasePoolPop(v6);
        v10 = 0;
        goto LABEL_12;
    }
  }
  v5 = (HMImmutableSettingValue *)-[HMImmutableSettingValue initSettingValue](self, "initSettingValue");
  self = v5;
LABEL_11:
  v10 = v5;
LABEL_12:

  return v10;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isEqual:(id)a3
{
  HMImmutableSettingValue *v4;
  _BOOL4 v5;

  v4 = (HMImmutableSettingValue *)a3;
  if (v4 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    v5 = objc_opt_isKindOfClass() & (v4 != 0);
  }

  return v5;
}

- (unint64_t)hash
{
  return 0;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
