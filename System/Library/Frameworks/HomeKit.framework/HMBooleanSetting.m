@implementation HMBooleanSetting

- (HMBooleanSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 BOOLValue:(BOOL)a5
{
  HMBooleanSetting *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMBooleanSetting;
  result = -[HMImmutableSetting initWithKeyPath:readOnly:](&v7, sel_initWithKeyPath_readOnly_, a3, a4);
  if (result)
    result->_BOOLValue = a5;
  return result;
}

- (HMBooleanSetting)settingWithSettingValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMBooleanSetting *v7;
  void *v8;
  HMBooleanSetting *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v7 = [HMBooleanSetting alloc];
    -[HMImmutableSetting keyPath](self, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:](v7, "initWithKeyPath:readOnly:BOOLValue:", v8, -[HMImmutableSetting isReadOnly](self, "isReadOnly"), objc_msgSend(v6, "BOOLValue"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)settingValue
{
  return -[HMSettingBooleanValue initWithBoolValue:]([HMSettingBooleanValue alloc], "initWithBoolValue:", -[HMBooleanSetting BOOLValue](self, "BOOLValue"));
}

- (HMBooleanSetting)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMBooleanSetting *v11;
  HMBooleanSetting *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasKeyPath") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v15;
    v20 = 2112;
    v21 = v4;
    v16 = "%{public}@Failed to decode setting missing keyPath: %@";
LABEL_12:
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 0x16u);

    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "hasReadOnly") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v15;
    v20 = 2112;
    v21 = v4;
    v16 = "%{public}@Failed to decode setting missing readOnly: %@";
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "hasBoolSetting")
    || (objc_msgSend(v4, "BOOLSetting"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasValue"),
        v5,
        (v6 & 1) == 0))
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v4;
      v16 = "%{public}@Failed to decode setting missing BOOL value: %@";
      goto LABEL_12;
    }
LABEL_13:

    objc_autoreleasePoolPop(v13);
    v12 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "readOnly");
  objc_msgSend(v4, "BOOLSetting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:](self, "initWithKeyPath:readOnly:BOOLValue:", v7, v8, objc_msgSend(v10, "value"));

  v12 = v11;
LABEL_14:

  return v12;
}

- (id)protoPayload
{
  void *v3;
  HMImmutableSettingsProtoBoolSettingEvent *v4;
  HMImmutableSettingsProtoBoolValueEvent *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMBooleanSetting;
  -[HMImmutableSetting protoPayload](&v11, sel_protoPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(HMImmutableSettingsProtoBoolSettingEvent);
  objc_msgSend(v3, "setBoolSetting:", v4);

  v5 = objc_alloc_init(HMImmutableSettingsProtoBoolValueEvent);
  objc_msgSend(v3, "BOOLSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", v5);

  v7 = -[HMBooleanSetting BOOLValue](self, "BOOLValue");
  objc_msgSend(v3, "BOOLSetting");
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
  v9.super_class = (Class)HMBooleanSetting;
  -[HMImmutableSetting payloadCopy](&v9, sel_payloadCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10[0] = CFSTR("HMImmutableSettingTypePayloadKey");
  v10[1] = CFSTR("HMImmutableSettingValuePayloadKey");
  v11[0] = &unk_1E3B2E7E8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMBooleanSetting BOOLValue](self, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (HMBooleanSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  HMBooleanSetting *v13;
  NSObject *v14;
  void *v15;
  HMBooleanSetting *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v18 = 0;
  v10 = objc_msgSend(v9, "hmf_BOOLForKey:error:", CFSTR("HMImmutableSettingValuePayloadKey"), &v18);
  v11 = v18;
  if (v11)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode BOOLean setting due to no BOOL value in payload: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    v16 = 0;
  }
  else
  {
    v13 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:](self, "initWithKeyPath:readOnly:BOOLValue:", v8, v6, v10);
    v16 = v13;
  }

  return v16;
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
  v10.super_class = (Class)HMBooleanSetting;
  -[HMImmutableSetting attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBooleanSetting BOOLValue](self, "BOOLValue");
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
  HMBooleanSetting *v4;
  HMBooleanSetting *v5;
  HMBooleanSetting *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  objc_super v10;

  v4 = (HMBooleanSetting *)a3;
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
    if (v6
      && (v10.receiver = self,
          v10.super_class = (Class)HMBooleanSetting,
          -[HMImmutableSetting isEqual:](&v10, sel_isEqual_, v6)))
    {
      v7 = -[HMBooleanSetting BOOLValue](self, "BOOLValue");
      v8 = v7 ^ -[HMBooleanSetting BOOLValue](v6, "BOOLValue") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  return v8;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

@end
