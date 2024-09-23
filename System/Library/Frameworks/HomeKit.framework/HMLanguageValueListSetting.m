@implementation HMLanguageValueListSetting

- (HMLanguageValueListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 languageValues:(id)a5
{
  _BOOL8 v5;
  id v8;
  HMLanguageValueListSetting *v9;
  uint64_t v10;
  NSArray *languageValues;
  objc_super v13;

  v5 = a4;
  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMLanguageValueListSetting;
  v9 = -[HMImmutableSetting initWithKeyPath:readOnly:](&v13, sel_initWithKeyPath_readOnly_, a3, v5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    languageValues = v9->_languageValues;
    v9->_languageValues = (NSArray *)v10;

  }
  return v9;
}

- (HMLanguageValueListSetting)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMLanguageValueListSetting *v8;
  id v9;
  void *v10;
  void *v11;
  HMLanguageValueListSetting *v12;
  HMLanguageValueListSetting *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t, void *);
  void *v22;
  HMLanguageValueListSetting *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasKeyPath") & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v16;
    v27 = 2112;
    v28 = v4;
    v17 = "%{public}@Failed to decode setting missing keyPath: %@";
LABEL_12:
    _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);

    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "hasReadOnly") & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v16;
    v27 = 2112;
    v28 = v4;
    v17 = "%{public}@Failed to decode setting missing readOnly: %@";
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "hasAvailableLanguages")
    || (objc_msgSend(v4, "availableLanguages"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      v27 = 2112;
      v28 = v4;
      v17 = "%{public}@Failed to decode setting missing available languages: %@";
      goto LABEL_12;
    }
LABEL_13:

    objc_autoreleasePoolPop(v14);
    v13 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "availableLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __51__HMLanguageValueListSetting_initWithProtoPayload___block_invoke;
  v22 = &unk_1E3AAE680;
  v8 = self;
  v23 = v8;
  v9 = v4;
  v24 = v9;
  objc_msgSend(v7, "na_map:", &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyPath", v19, v20, v21, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMLanguageValueListSetting initWithKeyPath:readOnly:languageValues:](v8, "initWithKeyPath:readOnly:languageValues:", v11, objc_msgSend(v9, "readOnly"), v10);

  v13 = v12;
LABEL_14:

  return v13;
}

- (id)protoPayload
{
  void *v3;
  void *v4;
  void *v5;
  HMImmutableSettingsProtoAvailableLanguageListEvent *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMLanguageValueListSetting;
  -[HMImmutableSetting protoPayload](&v10, sel_protoPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMLanguageValueListSetting languageValues](self, "languageValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_8643);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(HMImmutableSettingsProtoAvailableLanguageListEvent);
  objc_msgSend(v3, "setAvailableLanguages:", v6);

  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v3, "availableLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLanguages:", v7);

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
  -[HMLanguageValueListSetting languageValues](self, "languageValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)HMLanguageValueListSetting;
  -[HMImmutableSetting payloadCopy](&v10, sel_payloadCopy);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v11[0] = CFSTR("HMImmutableSettingTypePayloadKey");
  v11[1] = CFSTR("HMImmutableSettingValuePayloadKey");
  v12[0] = &unk_1E3B2E248;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  v8 = (void *)objc_msgSend(v6, "copy");
  return v8;
}

- (HMLanguageValueListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMLanguageValueListSetting *v14;
  HMLanguageValueListSetting *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "hmf_arrayForKey:", CFSTR("HMImmutableSettingValuePayloadKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "na_map:", &__block_literal_global_14_8633);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "count");
    if (v13 == objc_msgSend(v12, "count"))
    {
      v14 = -[HMLanguageValueListSetting initWithKeyPath:readOnly:languageValues:](self, "initWithKeyPath:readOnly:languageValues:", v8, v6, v12);
      v15 = v14;
    }
    else
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v14 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v21;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode language value list setting due to invalid language value payloads: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      v15 = 0;
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v18;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode language value list setting due to no language values in payload: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
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
  v10.super_class = (Class)HMLanguageValueListSetting;
  -[HMImmutableSetting attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMLanguageValueListSetting languageValues](self, "languageValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("languageValues"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  -[HMLanguageValueListSetting languageValues](self, "languageValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v7.receiver = self;
  v7.super_class = (Class)HMLanguageValueListSetting;
  v5 = -[HMImmutableSetting hash](&v7, sel_hash) ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HMLanguageValueListSetting *v4;
  HMLanguageValueListSetting *v5;
  HMLanguageValueListSetting *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[4];
  HMLanguageValueListSetting *v14;
  objc_super v15;

  v4 = (HMLanguageValueListSetting *)a3;
  if (self == v4)
  {
    v11 = 1;
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
      && (v15.receiver = self,
          v15.super_class = (Class)HMLanguageValueListSetting,
          -[HMImmutableSetting isEqual:](&v15, sel_isEqual_, v6)))
    {
      -[HMLanguageValueListSetting languageValues](self, "languageValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      -[HMLanguageValueListSetting languageValues](v6, "languageValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == objc_msgSend(v9, "count"))
      {
        -[HMLanguageValueListSetting languageValues](self, "languageValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __38__HMLanguageValueListSetting_isEqual___block_invoke;
        v13[3] = &unk_1E3AAE768;
        v14 = v6;
        v11 = objc_msgSend(v10, "na_allObjectsPassTest:", v13);

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

  }
  return v11;
}

- (NSArray)languageValues
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageValues, 0);
}

uint64_t __38__HMLanguageValueListSetting_isEqual___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "languageValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

id __63__HMLanguageValueListSetting_initWithKeyPath_readOnly_payload___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMSettingLanguageValue *v3;
  void *v4;

  v2 = a2;
  v3 = -[HMSettingLanguageValue initWithPayload:]([HMSettingLanguageValue alloc], "initWithPayload:", v2);

  +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:](HMFObjectCacheHMSettingLanguageValue, "cachedInstanceForLanguageSettingValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __41__HMLanguageValueListSetting_payloadCopy__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "payloadCopy");
}

HMImmutableSettingsProtoLanguageValueEvent *__42__HMLanguageValueListSetting_protoPayload__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMImmutableSettingsProtoLanguageValueEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  v3 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
  objc_msgSend(v2, "inputLanguageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoLanguageValueEvent setInputLanguageCode:](v3, "setInputLanguageCode:", v4);

  objc_msgSend(v2, "outputVoiceLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoLanguageValueEvent setOutputVoiceLanguageCode:](v3, "setOutputVoiceLanguageCode:", v5);

  objc_msgSend(v2, "outputVoiceGenderCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoLanguageValueEvent setOutputVoiceGenderCode:](v3, "setOutputVoiceGenderCode:", v6);

  objc_msgSend(v2, "voiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMImmutableSettingsProtoLanguageValueEvent setVoiceName:](v3, "setVoiceName:", v7);
  return v3;
}

id __51__HMLanguageValueListSetting_initWithProtoPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMSettingLanguageValue *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMSettingLanguageValue *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "hasInputLanguageCode")
    && objc_msgSend(v3, "hasOutputVoiceLanguageCode")
    && (objc_msgSend(v3, "hasOutputVoiceGenderCode") & 1) != 0)
  {
    v4 = [HMSettingLanguageValue alloc];
    objc_msgSend(v3, "inputLanguageCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "outputVoiceLanguageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "outputVoiceGenderCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "voiceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMSettingLanguageValue initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:](v4, "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v5, v6, v7, v8);
    +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:](HMFObjectCacheHMSettingLanguageValue, "cachedInstanceForLanguageSettingValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Language value is missing required attributes: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

@end
