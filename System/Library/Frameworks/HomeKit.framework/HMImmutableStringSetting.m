@implementation HMImmutableStringSetting

- (HMImmutableStringSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 stringValue:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  HMImmutableStringSetting *v11;
  uint64_t v12;
  NSString *stringValue;
  HMImmutableStringSetting *v15;
  SEL v16;
  id v17;
  objc_super v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = v9;
    v18.receiver = self;
    v18.super_class = (Class)HMImmutableStringSetting;
    v11 = -[HMImmutableSetting initWithKeyPath:readOnly:](&v18, sel_initWithKeyPath_readOnly_, v8, v6);
    if (v11)
    {
      v12 = objc_msgSend(v10, "copy");
      stringValue = v11->_stringValue;
      v11->_stringValue = (NSString *)v12;

    }
    return v11;
  }
  else
  {
    v15 = (HMImmutableStringSetting *)_HMFPreconditionFailure();
    return -[HMImmutableStringSetting settingWithSettingValue:](v15, v16, v17);
  }
}

- (HMImmutableStringSetting)settingWithSettingValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMImmutableStringSetting *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  HMImmutableStringSetting *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v7 = [HMImmutableStringSetting alloc];
    -[HMImmutableSetting keyPath](self, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMImmutableSetting isReadOnly](self, "isReadOnly");
    objc_msgSend(v6, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMImmutableStringSetting initWithKeyPath:readOnly:stringValue:](v7, "initWithKeyPath:readOnly:stringValue:", v8, v9, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)settingValue
{
  HMSettingStringValue *v3;
  void *v4;
  HMSettingStringValue *v5;

  v3 = [HMSettingStringValue alloc];
  -[HMImmutableStringSetting stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMSettingStringValue initWithStringValue:](v3, "initWithStringValue:", v4);

  return v5;
}

- (HMImmutableStringSetting)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  HMImmutableStringSetting *v12;
  HMImmutableStringSetting *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
    v19 = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v4;
    v17 = "%{public}@Failed to decode setting missing keyPath: %@";
LABEL_12:
    _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x16u);

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
    v19 = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v4;
    v17 = "%{public}@Failed to decode setting missing readOnly: %@";
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "hasStringSetting")
    || (objc_msgSend(v4, "stringSetting"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "value"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v4;
      v17 = "%{public}@Failed to decode setting missing string value: %@";
      goto LABEL_12;
    }
LABEL_13:

    objc_autoreleasePoolPop(v14);
    v13 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "readOnly");
  objc_msgSend(v4, "stringSetting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMImmutableStringSetting initWithKeyPath:readOnly:stringValue:](self, "initWithKeyPath:readOnly:stringValue:", v7, v8, v11);

  v13 = v12;
LABEL_14:

  return v13;
}

- (id)protoPayload
{
  void *v3;
  HMImmutableSettingsProtoStringSettingEvent *v4;
  HMImmutableSettingsProtoStringValueEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMImmutableStringSetting;
  -[HMImmutableSetting protoPayload](&v11, sel_protoPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(HMImmutableSettingsProtoStringSettingEvent);
  objc_msgSend(v3, "setStringSetting:", v4);

  v5 = objc_alloc_init(HMImmutableSettingsProtoStringValueEvent);
  objc_msgSend(v3, "stringSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", v5);

  -[HMImmutableStringSetting stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringSetting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:", v7);

  return v3;
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
  v9.super_class = (Class)HMImmutableStringSetting;
  -[HMImmutableSetting payloadCopy](&v9, sel_payloadCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10[0] = CFSTR("HMImmutableSettingTypePayloadKey");
  v10[1] = CFSTR("HMImmutableSettingValuePayloadKey");
  v11[0] = &unk_1E3B2E770;
  -[HMImmutableStringSetting stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (HMImmutableStringSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  HMImmutableStringSetting *v11;
  HMImmutableStringSetting *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "hmf_stringForKey:", CFSTR("HMImmutableSettingValuePayloadKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[HMImmutableStringSetting initWithKeyPath:readOnly:stringValue:](self, "initWithKeyPath:readOnly:stringValue:", v8, v6, v10);
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode string setting due to no string value in payload: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
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
  v10.super_class = (Class)HMImmutableStringSetting;
  -[HMImmutableSetting attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMImmutableStringSetting stringValue](self, "stringValue");
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
  HMImmutableStringSetting *v4;
  HMImmutableStringSetting *v5;
  HMImmutableStringSetting *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = (HMImmutableStringSetting *)a3;
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
          v11.super_class = (Class)HMImmutableStringSetting,
          -[HMImmutableSetting isEqual:](&v11, sel_isEqual_, v6)))
    {
      -[HMImmutableStringSetting stringValue](self, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMImmutableStringSetting stringValue](v6, "stringValue");
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

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
