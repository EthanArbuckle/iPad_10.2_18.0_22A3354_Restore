@implementation HMSettingStringValue

- (HMSettingStringValue)initWithStringValue:(id)a3
{
  id v4;
  void *v5;
  HMSettingStringValue *v6;
  uint64_t v7;
  NSString *stringValue;
  HMSettingStringValue *v10;
  SEL v11;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)HMSettingStringValue;
    v6 = -[HMImmutableSettingValue initSettingValue](&v12, sel_initSettingValue);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      stringValue = v6->_stringValue;
      v6->_stringValue = (NSString *)v7;

    }
    return v6;
  }
  else
  {
    v10 = (HMSettingStringValue *)_HMFPreconditionFailure();
    return (HMSettingStringValue *)-[HMSettingStringValue payloadCopy](v10, v11);
  }
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
  v9.super_class = (Class)HMSettingStringValue;
  -[HMImmutableSettingValue payloadCopy](&v9, sel_payloadCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10[0] = CFSTR("HMImmutableSettingValueTypePayloadKey");
  v10[1] = CFSTR("HMImmutableSettingValuePayloadKey");
  v11[0] = &unk_1E3B2E668;
  -[HMSettingStringValue stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (HMSettingStringValue)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  HMSettingStringValue *v6;
  HMSettingStringValue *v7;
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
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("HMImmutableSettingValuePayloadKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HMSettingStringValue initWithStringValue:](self, "initWithStringValue:", v5);
    v7 = v6;
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
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting string value due to no string value in payload: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)protoPayload
{
  HMImmutableSettingsProtoValueEvent *v3;
  HMImmutableSettingsProtoStringValueEvent *v4;
  void *v5;

  v3 = objc_alloc_init(HMImmutableSettingsProtoValueEvent);
  v4 = objc_alloc_init(HMImmutableSettingsProtoStringValueEvent);
  -[HMSettingStringValue stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoStringValueEvent setValue:](v4, "setValue:", v5);

  -[HMImmutableSettingsProtoValueEvent setStringValueEvent:](v3, "setStringValueEvent:", v4);
  return v3;
}

- (HMSettingStringValue)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMSettingStringValue *v7;
  HMSettingStringValue *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasStringValueEvent") & 1) != 0)
  {
    objc_msgSend(v4, "stringValueEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasValue") & 1) != 0)
    {
      objc_msgSend(v5, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HMSettingStringValue initWithStringValue:](self, "initWithStringValue:", v6);

      v8 = v7;
    }
    else
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v7 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v14;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no string value in string value event in proto payload: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v8 = 0;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no string value event type in proto payload: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
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
  v10.super_class = (Class)HMSettingStringValue;
  -[HMImmutableSettingValue attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSettingStringValue stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("stringValue"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMSettingStringValue *v4;
  HMSettingStringValue *v5;
  HMSettingStringValue *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMSettingStringValue *)a3;
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
    if (v6)
    {
      -[HMSettingStringValue stringValue](self, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSettingStringValue stringValue](v6, "stringValue");
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

  -[HMSettingStringValue stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
