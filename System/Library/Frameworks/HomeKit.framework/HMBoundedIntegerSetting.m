@implementation HMBoundedIntegerSetting

- (HMBoundedIntegerSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 integerValue:(int64_t)a5 maxValue:(int64_t)a6 minValue:(int64_t)a7 valueStepSize:(int64_t)a8
{
  HMBoundedIntegerSetting *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMBoundedIntegerSetting;
  result = -[HMImmutableSetting initWithKeyPath:readOnly:](&v13, sel_initWithKeyPath_readOnly_, a3, a4);
  if (result)
  {
    result->_integerValue = a5;
    result->_maxValue = a6;
    result->_minValue = a7;
    result->_valueStepSize = a8;
  }
  return result;
}

- (HMBoundedIntegerSetting)settingWithSettingValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMBoundedIntegerSetting *v7;
  void *v8;
  HMBoundedIntegerSetting *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v7 = [HMBoundedIntegerSetting alloc];
    -[HMImmutableSetting keyPath](self, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMBoundedIntegerSetting initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:](v7, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v8, -[HMImmutableSetting isReadOnly](self, "isReadOnly"), objc_msgSend(v6, "integerValue"), -[HMBoundedIntegerSetting maxValue](self, "maxValue"), -[HMBoundedIntegerSetting minValue](self, "minValue"), -[HMBoundedIntegerSetting valueStepSize](self, "valueStepSize"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)settingValue
{
  return -[HMSettingIntegerValue initWithIntegerValue:]([HMSettingIntegerValue alloc], "initWithIntegerValue:", -[HMBoundedIntegerSetting integerValue](self, "integerValue"));
}

- (HMBoundedIntegerSetting)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMBoundedIntegerSetting *v19;
  HMBoundedIntegerSetting *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  unsigned int v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasKeyPath") & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    v30 = 2112;
    v31 = v4;
    v24 = "%{public}@Failed to decode setting missing keyPath: %@";
LABEL_17:
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);

    goto LABEL_18;
  }
  if ((objc_msgSend(v4, "hasReadOnly") & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    v30 = 2112;
    v31 = v4;
    v24 = "%{public}@Failed to decode setting missing readOnly: %@";
    goto LABEL_17;
  }
  if (!objc_msgSend(v4, "hasBoundedIntegerSetting"))
    goto LABEL_15;
  objc_msgSend(v4, "boundedIntegerSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "hasMinValue"))
    goto LABEL_14;
  objc_msgSend(v4, "boundedIntegerSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasMaxValue") & 1) == 0)
  {

LABEL_14:
LABEL_15:
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      v30 = 2112;
      v31 = v4;
      v24 = "%{public}@Failed to decode setting missing integer setting required attributes: %@";
      goto LABEL_17;
    }
LABEL_18:

    objc_autoreleasePoolPop(v21);
    v20 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v4, "boundedIntegerSetting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasStepValue");

  if ((v8 & 1) == 0)
    goto LABEL_15;
  objc_msgSend(v4, "boundedIntegerSetting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasValue");

  if ((v10 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    v30 = 2112;
    v31 = v4;
    v24 = "%{public}@Failed to decode setting missing integer value: %@";
    goto LABEL_17;
  }
  objc_msgSend(v4, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v4, "readOnly");
  objc_msgSend(v4, "boundedIntegerSetting");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "value");
  objc_msgSend(v4, "boundedIntegerSetting");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "maxValue");
  objc_msgSend(v4, "boundedIntegerSetting");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "minValue");
  objc_msgSend(v4, "boundedIntegerSetting");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMBoundedIntegerSetting initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:](self, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v11, v26, v13, v15, v17, objc_msgSend(v18, "stepValue"));

  v20 = v19;
LABEL_19:

  return v20;
}

- (id)protoPayload
{
  void *v3;
  HMImmutableSettingsProtoBoundedIntegerSettingEvent *v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  HMImmutableSettingsProtoIntegerValueEvent *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HMBoundedIntegerSetting;
  -[HMImmutableSetting protoPayload](&v17, sel_protoPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(HMImmutableSettingsProtoBoundedIntegerSettingEvent);
  objc_msgSend(v3, "setBoundedIntegerSetting:", v4);

  v5 = -[HMBoundedIntegerSetting minValue](self, "minValue");
  objc_msgSend(v3, "boundedIntegerSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinValue:", v5);

  v7 = -[HMBoundedIntegerSetting maxValue](self, "maxValue");
  objc_msgSend(v3, "boundedIntegerSetting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaxValue:", v7);

  v9 = -[HMBoundedIntegerSetting valueStepSize](self, "valueStepSize");
  objc_msgSend(v3, "boundedIntegerSetting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStepValue:", v9);

  v11 = objc_alloc_init(HMImmutableSettingsProtoIntegerValueEvent);
  objc_msgSend(v3, "boundedIntegerSetting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:", v11);

  v13 = -[HMBoundedIntegerSetting integerValue](self, "integerValue");
  objc_msgSend(v3, "boundedIntegerSetting");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:", v13);

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
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)HMBoundedIntegerSetting;
  -[HMImmutableSetting payloadCopy](&v12, sel_payloadCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v14[0] = &unk_1E3B2E128;
  v13[0] = CFSTR("HMImmutableSettingTypePayloadKey");
  v13[1] = CFSTR("HMImmutableSettingValuePayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMBoundedIntegerSetting integerValue](self, "integerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("HMBoundedIntegerSettingMaxValuePayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMBoundedIntegerSetting maxValue](self, "maxValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("HMBoundedIntegerSettingMinValuePayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMBoundedIntegerSetting minValue](self, "minValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  v13[4] = CFSTR("HMBoundedIntegerSettingValueStepSizePayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMBoundedIntegerSetting valueStepSize](self, "valueStepSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v9);

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (HMBoundedIntegerSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  HMBoundedIntegerSetting *v19;
  NSObject *v20;
  void *v21;
  HMBoundedIntegerSetting *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v27 = 0;
  v10 = objc_msgSend(v9, "hmf_integerForKey:error:", CFSTR("HMImmutableSettingValuePayloadKey"), &v27);
  v11 = v27;
  v26 = v11;
  v12 = objc_msgSend(v9, "hmf_integerForKey:error:", CFSTR("HMBoundedIntegerSettingMaxValuePayloadKey"), &v26);
  v13 = v26;

  v25 = v13;
  v14 = objc_msgSend(v9, "hmf_integerForKey:error:", CFSTR("HMBoundedIntegerSettingMinValuePayloadKey"), &v25);
  v15 = v25;

  v24 = v15;
  v16 = objc_msgSend(v9, "hmf_integerForKey:error:", CFSTR("HMBoundedIntegerSettingValueStepSizePayloadKey"), &v24);
  v17 = v24;

  if (v17)
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v21;
      v30 = 2112;
      v31 = v9;
      v32 = 2112;
      v33 = v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode bounded integer setting due to invalid payload: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    v22 = 0;
  }
  else
  {
    v19 = -[HMBoundedIntegerSetting initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:](self, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v8, v6, v10, v12, v14, v16);
    v22 = v19;
  }

  return v22;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)HMBoundedIntegerSetting;
  -[HMImmutableSetting attributeDescriptions](&v19, sel_attributeDescriptions);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMBoundedIntegerSetting integerValue](self, "integerValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("integerValue"), v18);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMBoundedIntegerSetting maxValue](self, "maxValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("maxValue"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMBoundedIntegerSetting minValue](self, "minValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("minValue"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMBoundedIntegerSetting valueStepSize](self, "valueStepSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("valueStepSize"), v12);
  v20[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  HMBoundedIntegerSetting *v4;
  HMBoundedIntegerSetting *v5;
  HMBoundedIntegerSetting *v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  BOOL v11;
  objc_super v13;

  v4 = (HMBoundedIntegerSetting *)a3;
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
      && (v13.receiver = self,
          v13.super_class = (Class)HMBoundedIntegerSetting,
          -[HMImmutableSetting isEqual:](&v13, sel_isEqual_, v6))
      && (v7 = -[HMBoundedIntegerSetting integerValue](self, "integerValue"),
          v7 == -[HMBoundedIntegerSetting integerValue](v6, "integerValue"))
      && (v8 = -[HMBoundedIntegerSetting maxValue](self, "maxValue"),
          v8 == -[HMBoundedIntegerSetting maxValue](v6, "maxValue"))
      && (v9 = -[HMBoundedIntegerSetting minValue](self, "minValue"),
          v9 == -[HMBoundedIntegerSetting minValue](v6, "minValue")))
    {
      v10 = -[HMBoundedIntegerSetting valueStepSize](self, "valueStepSize");
      v11 = v10 == -[HMBoundedIntegerSetting valueStepSize](v6, "valueStepSize");
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (int64_t)maxValue
{
  return self->_maxValue;
}

- (int64_t)minValue
{
  return self->_minValue;
}

- (int64_t)valueStepSize
{
  return self->_valueStepSize;
}

@end
