@implementation HMDCompositeSettingValue

- (HMDCompositeSettingValue)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDCompositeSettingValue;
  return -[HMDCompositeSettingValue init](&v3, sel_init);
}

- (BOOL)isEqualValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (id)compositeSettingValueFromImmutableSettingsValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMDCompositeSettingBoolValue *v7;
  id v8;
  void *v9;
  id v10;
  HMDCompositeSettingNumberValue *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  HMDCompositeSettingStringValue *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  HMDCompositeSettingLanguageValue *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  HMDCompositeSettingVersionValue *v28;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
  {
    v8 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      v11 = [HMDCompositeSettingNumberValue alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "integerValue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HMDCompositeSettingNumberValue initWithValue:](v11, "initWithValue:", v12);

LABEL_29:
      goto LABEL_30;
    }
    v13 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      v16 = [HMDCompositeSettingStringValue alloc];
      objc_msgSend(v15, "stringValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HMDCompositeSettingStringValue initWithValue:](v16, "initWithValue:", v17);

LABEL_28:
      goto LABEL_29;
    }
    v18 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      v21 = [HMDCompositeSettingLanguageValue alloc];
      objc_msgSend(v20, "inputLanguageCode");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "outputVoiceLanguageCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "outputVoiceGenderCode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "voiceName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HMDCompositeSettingLanguageValue initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:](v21, "initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v22, v23, v24, v25);

    }
    else
    {
      v26 = v18;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
      v22 = v27;

      if (!v22)
      {
        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = a1;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = v30;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v33;
          v37 = 2112;
          v38 = v26;
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get a composite setting value from immutable settings value: %@", buf, 0x16u);

          v30 = v34;
        }

        objc_autoreleasePoolPop(v30);
        v7 = 0;
        goto LABEL_27;
      }
      v28 = [HMDCompositeSettingVersionValue alloc];
      objc_msgSend(v22, "version");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HMDCompositeSettingVersionValue initWithVersion:type:](v28, "initWithVersion:type:", v23, objc_msgSend(v22, "type"));
    }

LABEL_27:
    goto LABEL_28;
  }
  v7 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", objc_msgSend(v6, "BOOLValue"));
LABEL_30:

  return v7;
}

@end
