@implementation HMSettingLanguageValue

- (HMSettingLanguageValue)initWithInputLanguageCode:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMSettingLanguageValue *v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v14;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Initializing with inputLanguageCode: %@ outputVoiceLanguageCode: %@ outputVoiceGenderCode: %@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  v15 = -[HMImmutableSettingValue initSettingValue](v12, "initSettingValue");

  return 0;
}

- (HMSettingLanguageValue)initWithInputLanguageCode:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5 voiceName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  HMSettingLanguageValue *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMSettingLanguageValue;
  v15 = -[HMImmutableSettingValue initSettingValue](&v18, sel_initSettingValue);
  v16 = (HMSettingLanguageValue *)v15;
  if (v15)
  {
    objc_storeStrong(v15 + 1, a3);
    objc_storeStrong((id *)&v16->_outputVoiceLanguageCode, a4);
    objc_storeStrong((id *)&v16->_outputVoiceGenderCode, a5);
    objc_storeStrong((id *)&v16->_voiceName, a6);
  }

  return v16;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)HMSettingLanguageValue;
  -[HMImmutableSettingValue payloadCopy](&v13, sel_payloadCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v15[0] = &unk_1E3B2E860;
  v14[0] = CFSTR("HMImmutableSettingValueTypePayloadKey");
  v14[1] = CFSTR("HMSettingLanguageValueInputLanaguageCodePayloadKey");
  -[HMSettingLanguageValue inputLanguageCode](self, "inputLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("HMSettingLanguageValueOutputVoiceLanaguageCodePayloadKey");
  -[HMSettingLanguageValue outputVoiceLanguageCode](self, "outputVoiceLanguageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v6;
  v14[3] = CFSTR("HMSettingLanguageValueOutputVoiceGenderCodePayloadKey");
  -[HMSettingLanguageValue outputVoiceGenderCode](self, "outputVoiceGenderCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v8);

  -[HMSettingLanguageValue voiceName](self, "voiceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMSettingLanguageValue voiceName](self, "voiceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("HMSettingLanguageValueVoiceNameCodePayloadKey"));

  }
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

- (HMSettingLanguageValue)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMSettingLanguageValue *v10;
  HMSettingLanguageValue *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("HMSettingLanguageValueInputLanaguageCodePayloadKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("HMSettingLanguageValueOutputVoiceLanaguageCodePayloadKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("HMSettingLanguageValueOutputVoiceGenderCodePayloadKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("HMSettingLanguageValueVoiceNameCodePayloadKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v7 && v8)
  {
    v10 = -[HMSettingLanguageValue initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:](self, "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v6, v7, v8, v9);
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
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting language value due to invalid payload: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (id)protoPayload
{
  HMImmutableSettingsProtoValueEvent *v3;
  HMImmutableSettingsProtoLanguageValueEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(HMImmutableSettingsProtoValueEvent);
  v4 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
  -[HMSettingLanguageValue inputLanguageCode](self, "inputLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoLanguageValueEvent setInputLanguageCode:](v4, "setInputLanguageCode:", v5);

  -[HMSettingLanguageValue outputVoiceLanguageCode](self, "outputVoiceLanguageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoLanguageValueEvent setOutputVoiceLanguageCode:](v4, "setOutputVoiceLanguageCode:", v6);

  -[HMSettingLanguageValue outputVoiceGenderCode](self, "outputVoiceGenderCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoLanguageValueEvent setOutputVoiceGenderCode:](v4, "setOutputVoiceGenderCode:", v7);

  -[HMSettingLanguageValue voiceName](self, "voiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoLanguageValueEvent setVoiceName:](v4, "setVoiceName:", v8);

  -[HMImmutableSettingsProtoValueEvent setLanguageValueEvent:](v3, "setLanguageValueEvent:", v4);
  return v3;
}

- (HMSettingLanguageValue)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMSettingLanguageValue *v10;
  HMSettingLanguageValue *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasLanguageValueEvent") & 1) != 0)
  {
    objc_msgSend(v4, "languageValueEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasInputLanguageCode") & 1) != 0)
    {
      if ((objc_msgSend(v5, "hasOutputVoiceGenderCode") & 1) != 0)
      {
        if ((objc_msgSend(v5, "hasOutputVoiceLanguageCode") & 1) != 0)
        {
          objc_msgSend(v5, "inputLanguageCode");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "outputVoiceLanguageCode");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "outputVoiceGenderCode");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "voiceName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[HMSettingLanguageValue initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:](self, "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v6, v7, v8, v9);

          v11 = v10;
LABEL_17:

          goto LABEL_18;
        }
        v15 = (void *)MEMORY[0x1A1AC1AAC]();
        v10 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543618;
          v21 = v17;
          v22 = 2112;
          v23 = v4;
          v18 = "%{public}@Failed to decode setting value due to no output voice language value in language value event i"
                "n proto payload: %@";
          goto LABEL_15;
        }
LABEL_16:

        objc_autoreleasePoolPop(v15);
        v11 = 0;
        goto LABEL_17;
      }
      v15 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v4;
      v18 = "%{public}@Failed to decode setting value due to no output voice gender value in language value event in proto payload: %@";
    }
    else
    {
      v15 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v4;
      v18 = "%{public}@Failed to decode setting value due to no input language value in language value event in proto payload: %@";
    }
LABEL_15:
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v20, 0x16u);

    goto LABEL_16;
  }
  v12 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v14;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no language value event type in proto payload: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  v11 = 0;
LABEL_18:

  return v11;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  objc_super v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)HMSettingLanguageValue;
  -[HMImmutableSettingValue attributeDescriptions](&v19, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSettingLanguageValue inputLanguageCode](self, "inputLanguageCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("inputLanguageCode"), v18);
  v20[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSettingLanguageValue outputVoiceLanguageCode](self, "outputVoiceLanguageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("outputVoiceLanguageCode"), v7);
  v20[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSettingLanguageValue outputVoiceGenderCode](self, "outputVoiceGenderCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("outputVoiceGenderCode"), v10);
  v20[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSettingLanguageValue voiceName](self, "voiceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("voiceName"), v13);
  v20[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  HMSettingLanguageValue *v4;
  HMSettingLanguageValue *v5;
  HMSettingLanguageValue *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v17;
  void *v18;
  objc_super v19;

  v4 = (HMSettingLanguageValue *)a3;
  if (self == v4)
  {
    v15 = 1;
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
      -[HMSettingLanguageValue inputLanguageCode](self, "inputLanguageCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSettingLanguageValue inputLanguageCode](v6, "inputLanguageCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[HMSettingLanguageValue outputVoiceGenderCode](self, "outputVoiceGenderCode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMSettingLanguageValue outputVoiceGenderCode](v6, "outputVoiceGenderCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v10))
        {
          -[HMSettingLanguageValue outputVoiceLanguageCode](self, "outputVoiceLanguageCode");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMSettingLanguageValue outputVoiceLanguageCode](v6, "outputVoiceLanguageCode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEqualToString:", v12))
            goto LABEL_15;
          -[HMSettingLanguageValue voiceName](self, "voiceName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMSettingLanguageValue voiceName](v6, "voiceName");
          v18 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = HMFEqualObjects();

          v11 = v18;
          if (v17)
          {
            v19.receiver = self;
            v19.super_class = (Class)HMSettingLanguageValue;
            v15 = -[HMImmutableSettingValue isEqual:](&v19, sel_isEqual_, v6);
          }
          else
          {
LABEL_15:
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  objc_super v13;

  -[HMSettingLanguageValue inputLanguageCode](self, "inputLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMSettingLanguageValue outputVoiceLanguageCode](self, "outputVoiceLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMSettingLanguageValue outputVoiceGenderCode](self, "outputVoiceGenderCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HMSettingLanguageValue voiceName](self, "voiceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v13.receiver = self;
  v13.super_class = (Class)HMSettingLanguageValue;
  v11 = v10 ^ -[HMImmutableSettingValue hash](&v13, sel_hash);

  return v11;
}

- (NSString)inputLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)outputVoiceLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)outputVoiceGenderCode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)voiceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_outputVoiceGenderCode, 0);
  objc_storeStrong((id *)&self->_outputVoiceLanguageCode, 0);
  objc_storeStrong((id *)&self->_inputLanguageCode, 0);
}

@end
