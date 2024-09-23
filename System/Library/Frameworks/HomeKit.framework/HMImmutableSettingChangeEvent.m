@implementation HMImmutableSettingChangeEvent

- (HMImmutableSettingChangeEvent)initWithSetting:(id)a3 eventSource:(id)a4 eventTimestamp:(double)a5
{
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  HMImmutableSettingChangeEvent *v13;
  HMImmutableSettingChangeEvent *v14;
  objc_super v16;

  v9 = a3;
  v10 = (objc_class *)MEMORY[0x1E0D32D38];
  v11 = a4;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithSource:cachePolicy:combineType:timestamp:", v11, 2, 2, a5);

  v16.receiver = self;
  v16.super_class = (Class)HMImmutableSettingChangeEvent;
  v13 = -[HMEEvent initWithSubclassedEventMetadata:](&v16, sel_initWithSubclassedEventMetadata_, v12);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_setting, a3);

  return v14;
}

- (id)encodedData
{
  void *v2;
  void *v3;
  void *v4;

  -[HMImmutableSettingChangeEvent setting](self, "setting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protoPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMImmutableSetting)setting
{
  return self->_setting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setting, 0);
}

+ (id)decodeSettingFromEvent:(id)a3 error:(id *)a4
{
  id v5;
  HMImmutableSettingsProtoSettingChangeEvent *v6;
  void *v7;
  HMImmutableSettingsProtoSettingChangeEvent *v8;
  HMImmutableSetting *v9;
  HMImmutableSetting *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [HMImmutableSettingsProtoSettingChangeEvent alloc];
  objc_msgSend(v5, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMImmutableSettingsProtoSettingChangeEvent initWithData:](v6, "initWithData:", v7);

  if (!v8)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
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
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode proto setting change event from event: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (!a4)
    {
      v10 = 0;
      goto LABEL_11;
    }
    v11 = 19;
    goto LABEL_9;
  }
  v9 = -[HMImmutableSetting initWithProtoPayload:]([HMImmutableSetting alloc], "initWithProtoPayload:", v8);
  v10 = v9;
  if (a4 && !v9)
  {
    v11 = 3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v11);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:

  return v10;
}

@end
