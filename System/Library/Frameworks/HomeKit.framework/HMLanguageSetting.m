@implementation HMLanguageSetting

- (HMLanguageSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 languageValue:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  HMLanguageSetting *v11;
  HMLanguageSetting *v12;
  HMLanguageSetting *v14;
  SEL v15;
  id v16;
  objc_super v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = v9;
    v17.receiver = self;
    v17.super_class = (Class)HMLanguageSetting;
    v11 = -[HMImmutableSetting initWithKeyPath:readOnly:](&v17, sel_initWithKeyPath_readOnly_, v8, v6);
    v12 = v11;
    if (v11)
      objc_storeStrong((id *)&v11->_languageValue, a5);

    return v12;
  }
  else
  {
    v14 = (HMLanguageSetting *)_HMFPreconditionFailure();
    return -[HMLanguageSetting settingWithSettingValue:](v14, v15, v16);
  }
}

- (HMLanguageSetting)settingWithSettingValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMLanguageSetting *v7;
  void *v8;
  HMLanguageSetting *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v7 = [HMLanguageSetting alloc];
    -[HMImmutableSetting keyPath](self, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMLanguageSetting initWithKeyPath:readOnly:languageValue:](v7, "initWithKeyPath:readOnly:languageValue:", v8, -[HMImmutableSetting isReadOnly](self, "isReadOnly"), v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HMLanguageSetting)initWithProtoPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  HMSettingLanguageValue *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMSettingLanguageValue *v16;
  void *v17;
  void *v18;
  HMLanguageSetting *v19;
  HMLanguageSetting *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasKeyPath") & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v23;
    v31 = 2112;
    v32 = v4;
    v24 = "%{public}@Failed to decode setting missing keyPath: %@";
LABEL_15:
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v29, 0x16u);

    goto LABEL_16;
  }
  if ((objc_msgSend(v4, "hasReadOnly") & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v23;
    v31 = 2112;
    v32 = v4;
    v24 = "%{public}@Failed to decode setting missing readOnly: %@";
    goto LABEL_15;
  }
  objc_msgSend(v4, "languageSetting");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        objc_msgSend(v4, "languageSetting"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hasValue"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v4;
      v24 = "%{public}@Failed to decode setting missing language value: %@";
      goto LABEL_15;
    }
LABEL_16:

    objc_autoreleasePoolPop(v21);
    v20 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "languageSetting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "hasInputLanguageCode")
    && objc_msgSend(v10, "hasOutputVoiceLanguageCode")
    && (objc_msgSend(v10, "hasOutputVoiceGenderCode") & 1) != 0)
  {
    v11 = [HMSettingLanguageValue alloc];
    objc_msgSend(v10, "inputLanguageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "outputVoiceLanguageCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "outputVoiceGenderCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "voiceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMSettingLanguageValue initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:](v11, "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v12, v13, v14, v15);
    +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:](HMFObjectCacheHMSettingLanguageValue, "cachedInstanceForLanguageSettingValue:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "keyPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMLanguageSetting initWithKeyPath:readOnly:languageValue:](self, "initWithKeyPath:readOnly:languageValue:", v18, objc_msgSend(v4, "readOnly"), v17);

    v20 = v19;
  }
  else
  {
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v28;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Language value is missing required attributes: %@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    v20 = 0;
  }

LABEL_17:
  return v20;
}

- (id)protoPayload
{
  void *v3;
  HMImmutableSettingsProtoLanguageSettingEvent *v4;
  HMImmutableSettingsProtoLanguageValueEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)HMLanguageSetting;
  -[HMImmutableSetting protoPayload](&v24, sel_protoPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(HMImmutableSettingsProtoLanguageSettingEvent);
  objc_msgSend(v3, "setLanguageSetting:", v4);

  v5 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
  objc_msgSend(v3, "languageSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", v5);

  -[HMLanguageSetting languageValue](self, "languageValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputLanguageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageSetting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInputLanguageCode:", v8);

  -[HMLanguageSetting languageValue](self, "languageValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "outputVoiceLanguageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageSetting");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOutputVoiceLanguageCode:", v12);

  -[HMLanguageSetting languageValue](self, "languageValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "outputVoiceGenderCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageSetting");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOutputVoiceGenderCode:", v16);

  -[HMLanguageSetting languageValue](self, "languageValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "voiceName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageSetting");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "value");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setVoiceName:", v20);

  return v3;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)HMLanguageSetting;
  -[HMImmutableSetting payloadCopy](&v10, sel_payloadCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v11[0] = CFSTR("HMImmutableSettingTypePayloadKey");
  v11[1] = CFSTR("HMImmutableSettingValuePayloadKey");
  v12[0] = &unk_1E3B2E680;
  -[HMLanguageSetting languageValue](self, "languageValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v7);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

- (HMLanguageSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  HMSettingLanguageValue *v11;
  void *v12;
  HMLanguageSetting *v13;
  HMLanguageSetting *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "hmf_dictionaryForKey:", CFSTR("HMImmutableSettingValuePayloadKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[HMSettingLanguageValue initWithPayload:]([HMSettingLanguageValue alloc], "initWithPayload:", v10);
    +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:](HMFObjectCacheHMSettingLanguageValue, "cachedInstanceForLanguageSettingValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[HMLanguageSetting initWithKeyPath:readOnly:languageValue:](self, "initWithKeyPath:readOnly:languageValue:", v8, v6, v12);
      v14 = v13;
    }
    else
    {
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode language value setting due to invalid language value payload: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v14 = 0;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v17;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode language value setting due to no language value in payload: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)HMLanguageSetting;
  -[HMImmutableSetting attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMLanguageSetting languageValue](self, "languageValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("languageValue"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMLanguageSetting *v4;
  HMLanguageSetting *v5;
  HMLanguageSetting *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = (HMLanguageSetting *)a3;
  if (self == v4)
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
    if (v6
      && (v11.receiver = self,
          v11.super_class = (Class)HMLanguageSetting,
          -[HMImmutableSetting isEqual:](&v11, sel_isEqual_, v6)))
    {
      -[HMLanguageSetting languageValue](self, "languageValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMLanguageSetting languageValue](v6, "languageValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

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
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  -[HMLanguageSetting languageValue](self, "languageValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v7.receiver = self;
  v7.super_class = (Class)HMLanguageSetting;
  v5 = -[HMImmutableSetting hash](&v7, sel_hash) ^ v4;

  return v5;
}

- (HMSettingLanguageValue)languageValue
{
  return (HMSettingLanguageValue *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageValue, 0);
}

@end
