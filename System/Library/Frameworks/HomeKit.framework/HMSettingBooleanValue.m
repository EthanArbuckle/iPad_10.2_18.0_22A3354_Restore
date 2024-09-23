@implementation HMSettingBooleanValue

- (HMSettingBooleanValue)initWithBoolValue:(BOOL)a3
{
  HMSettingBooleanValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMSettingBooleanValue;
  result = -[HMImmutableSettingValue initSettingValue](&v5, sel_initSettingValue);
  if (result)
    result->_BOOLValue = a3;
  return result;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)HMSettingBooleanValue;
  -[HMImmutableSettingValue payloadCopy](&v9, sel_payloadCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10[0] = CFSTR("HMImmutableSettingValueTypePayloadKey");
  v10[1] = CFSTR("HMImmutableSettingValuePayloadKey");
  v11[0] = &unk_1E3B2E0F8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSettingBooleanValue BOOLValue](self, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (HMSettingBooleanValue)initWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  HMSettingBooleanValue *v8;
  NSObject *v9;
  void *v10;
  HMSettingBooleanValue *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v5 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMImmutableSettingValuePayloadKey"), &v13);
  v6 = v13;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting BOOLean value due to no BOOL value in payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = 0;
  }
  else
  {
    v8 = -[HMSettingBooleanValue initWithBoolValue:](self, "initWithBoolValue:", v5);
    v11 = v8;
  }

  return v11;
}

- (id)protoPayload
{
  HMImmutableSettingsProtoValueEvent *v3;
  HMImmutableSettingsProtoBoolValueEvent *v4;

  v3 = objc_alloc_init(HMImmutableSettingsProtoValueEvent);
  v4 = objc_alloc_init(HMImmutableSettingsProtoBoolValueEvent);
  -[HMImmutableSettingsProtoBoolValueEvent setValue:](v4, "setValue:", -[HMSettingBooleanValue BOOLValue](self, "BOOLValue"));
  -[HMImmutableSettingsProtoValueEvent setBoolValueEvent:](v3, "setBoolValueEvent:", v4);

  return v3;
}

- (HMSettingBooleanValue)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  HMSettingBooleanValue *v6;
  HMSettingBooleanValue *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasBoolValueEvent") & 1) != 0)
  {
    objc_msgSend(v4, "BOOLValueEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasValue") & 1) != 0)
    {
      v6 = -[HMSettingBooleanValue initWithBoolValue:](self, "initWithBoolValue:", objc_msgSend(v5, "value"));
      v7 = v6;
    }
    else
    {
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v6 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v13;
        v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no BOOL value in BOOL value event in proto payload: %@", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v7 = 0;
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no BOOL value event type in proto payload: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
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
  v10.super_class = (Class)HMSettingBooleanValue;
  -[HMImmutableSettingValue attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSettingBooleanValue BOOLValue](self, "BOOLValue");
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("BOOLValue"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMSettingBooleanValue *v4;
  HMSettingBooleanValue *v5;
  HMSettingBooleanValue *v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = (HMSettingBooleanValue *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
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
      v7 = -[HMSettingBooleanValue BOOLValue](self, "BOOLValue");
      v8 = v7 ^ -[HMSettingBooleanValue BOOLValue](v6, "BOOLValue") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  return v8;
}

- (unint64_t)hash
{
  return -[HMSettingBooleanValue BOOLValue](self, "BOOLValue");
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

@end
