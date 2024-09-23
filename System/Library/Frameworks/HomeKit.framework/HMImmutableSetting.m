@implementation HMImmutableSetting

- (HMImmutableSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4
{
  id v7;
  void *v8;
  HMImmutableSetting *v9;
  HMImmutableSetting *v10;
  HMImmutableSetting *v12;
  SEL v13;
  id v14;
  objc_super v15;

  v7 = a3;
  if (!v7)
  {
    v12 = (HMImmutableSetting *)_HMFPreconditionFailure();
    -[HMImmutableSetting settingWithSettingValue:](v12, v13, v14);
  }
  v8 = v7;
  v15.receiver = self;
  v15.super_class = (Class)HMImmutableSetting;
  v9 = -[HMImmutableSetting init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPath, a3);
    v10->_readOnly = a4;
  }

  return v10;
}

- (HMImmutableSetting)settingWithSettingValue:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CB2FC0], CFSTR("Must be implemented by subclass"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)settingValue
{
  return 0;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E3B2E7A0;
  v7[0] = CFSTR("HMImmutableSettingTypePayloadKey");
  v7[1] = CFSTR("HMImmutableSettingKeyPathPayloadKey");
  -[HMImmutableSetting keyPath](self, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("HMImmutableSettingReadOnlyPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMImmutableSetting isReadOnly](self, "isReadOnly"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMImmutableSetting)initWithPayload:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  HMImmutableSetting *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMImmutableSetting *v14;
  __objc2_class *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0;
  v5 = objc_msgSend(v4, "hmf_integerForKey:error:", CFSTR("HMImmutableSettingTypePayloadKey"), &v21);
  v6 = v21;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("HMImmutableSettingKeyPathPayloadKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  v8 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMImmutableSettingReadOnlyPayloadKey"), &v20);
  v9 = v20;

  if (v9 || !v7)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    self = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting payload: %@", buf, 0x16u);

    }
LABEL_8:

    objc_autoreleasePoolPop(v11);
    v14 = 0;
  }
  else
  {
    switch(v5)
    {
      case 0uLL:
        v10 = -[HMImmutableSetting initWithKeyPath:readOnly:](self, "initWithKeyPath:readOnly:", v7, v8);
        self = v10;
        goto LABEL_19;
      case 1uLL:
        v15 = HMBooleanSetting;
        goto LABEL_18;
      case 2uLL:
        v15 = HMBoundedIntegerSetting;
        goto LABEL_18;
      case 3uLL:
        v15 = HMImmutableStringSetting;
        goto LABEL_18;
      case 4uLL:
        v15 = HMStringListSetting;
        goto LABEL_18;
      case 5uLL:
        v15 = HMLanguageSetting;
        goto LABEL_18;
      case 6uLL:
        v15 = HMLanguageValueListSetting;
LABEL_18:
        v10 = (HMImmutableSetting *)objc_msgSend([v15 alloc], "initWithKeyPath:readOnly:payload:", v7, v8, v4);
LABEL_19:
        v14 = v10;
        break;
      default:
        v11 = (void *)MEMORY[0x1A1AC1AAC]();
        self = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          HMImmutableSettingTypeAsString(v5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v23 = v17;
          v24 = 2112;
          v25 = v18;
          v26 = 2112;
          v27 = v4;
          _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting due to unknown value type: %@ in payload: %@", buf, 0x20u);

        }
        goto LABEL_8;
    }
  }

  return v14;
}

- (id)protoPayload
{
  HMImmutableSettingsProtoSettingChangeEvent *v3;
  void *v4;

  v3 = objc_alloc_init(HMImmutableSettingsProtoSettingChangeEvent);
  -[HMImmutableSetting keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoSettingChangeEvent setKeyPath:](v3, "setKeyPath:", v4);

  -[HMImmutableSettingsProtoSettingChangeEvent setReadOnly:](v3, "setReadOnly:", -[HMImmutableSetting isReadOnly](self, "isReadOnly"));
  return v3;
}

- (HMImmutableSetting)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  HMImmutableSetting *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  HMImmutableSetting *v10;
  __objc2_class *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasSettingChangeEvent"))
  {
    switch(objc_msgSend(v4, "settingChangeEvent"))
    {
      case 0u:
        v5 = (void *)MEMORY[0x1A1AC1AAC]();
        v6 = self;
        HMFGetOSLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v8;
        v15 = 2112;
        v16 = v4;
        v9 = "%{public}@Setting event is not set in protopayload: %@";
        goto LABEL_7;
      case 1u:
        v11 = HMImmutableStringSetting;
        goto LABEL_15;
      case 2u:
        v11 = HMBoundedIntegerSetting;
        goto LABEL_15;
      case 3u:
        v11 = HMBooleanSetting;
        goto LABEL_15;
      case 4u:
        v11 = HMLanguageSetting;
        goto LABEL_15;
      case 5u:
        v11 = HMLanguageValueListSetting;
LABEL_15:
        v10 = (HMImmutableSetting *)objc_msgSend([v11 alloc], "initWithProtoPayload:", v4);
        goto LABEL_16;
      default:
        v5 = (void *)MEMORY[0x1A1AC1AAC]();
        v6 = self;
        HMFGetOSLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543618;
          v14 = v8;
          v15 = 2112;
          v16 = v4;
          v9 = "%{public}@Failed to decode setting due to unknown setting event in protopayload: %@";
LABEL_7:
          _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, 0x16u);

        }
LABEL_8:

        objc_autoreleasePoolPop(v5);
        break;
    }
  }
  v10 = 0;
LABEL_16:

  return v10;
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
  -[HMImmutableSetting keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("keyPath"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (BOOL)isEqual:(id)a3
{
  HMImmutableSetting *v4;
  HMImmutableSetting *v5;
  HMImmutableSetting *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;

  v4 = (HMImmutableSetting *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
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
      -[HMImmutableSetting keyPath](self, "keyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMImmutableSetting keyPath](v6, "keyPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        v9 = -[HMImmutableSetting isReadOnly](self, "isReadOnly");
        v10 = v9 ^ -[HMImmutableSetting isReadOnly](v6, "isReadOnly") ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMImmutableSetting keyPath](self, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
