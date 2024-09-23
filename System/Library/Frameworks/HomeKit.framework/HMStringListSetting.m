@implementation HMStringListSetting

- (HMStringListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 stringListValue:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  HMStringListSetting *v11;
  uint64_t v12;
  NSArray *stringListValue;
  HMStringListSetting *v15;
  SEL v16;
  objc_super v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = v9;
    v17.receiver = self;
    v17.super_class = (Class)HMStringListSetting;
    v11 = -[HMImmutableSetting initWithKeyPath:readOnly:](&v17, sel_initWithKeyPath_readOnly_, v8, v6);
    if (v11)
    {
      v12 = objc_msgSend(v10, "copy");
      stringListValue = v11->_stringListValue;
      v11->_stringListValue = (NSArray *)v12;

    }
    return v11;
  }
  else
  {
    v15 = (HMStringListSetting *)_HMFPreconditionFailure();
    return (HMStringListSetting *)-[HMStringListSetting payloadCopy](v15, v16);
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
  v9.super_class = (Class)HMStringListSetting;
  -[HMImmutableSetting payloadCopy](&v9, sel_payloadCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10[0] = CFSTR("HMImmutableSettingTypePayloadKey");
  v10[1] = CFSTR("HMImmutableSettingValuePayloadKey");
  v11[0] = &unk_1E3B2E170;
  -[HMStringListSetting stringListValue](self, "stringListValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (HMStringListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMStringListSetting *v14;
  HMStringListSetting *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  _QWORD v24[2];

  v6 = a4;
  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v24[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmf_arrayForKey:ofClasses:", CFSTR("HMImmutableSettingValuePayloadKey"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[HMStringListSetting initWithKeyPath:readOnly:stringListValue:](self, "initWithKeyPath:readOnly:stringListValue:", v8, v6, v13);
    v15 = v14;
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
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode string list setting due to invalid payload: %@", (uint8_t *)&v20, 0x16u);

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
  v10.super_class = (Class)HMStringListSetting;
  -[HMImmutableSetting attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMStringListSetting stringListValue](self, "stringListValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("stringListValue"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMStringListSetting *v4;
  HMStringListSetting *v5;
  HMStringListSetting *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[4];
  HMStringListSetting *v14;
  objc_super v15;

  v4 = (HMStringListSetting *)a3;
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
          v15.super_class = (Class)HMStringListSetting,
          -[HMImmutableSetting isEqual:](&v15, sel_isEqual_, v6)))
    {
      -[HMStringListSetting stringListValue](self, "stringListValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      -[HMStringListSetting stringListValue](v6, "stringListValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == objc_msgSend(v9, "count"))
      {
        -[HMStringListSetting stringListValue](self, "stringListValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __31__HMStringListSetting_isEqual___block_invoke;
        v13[3] = &unk_1E3AAFB58;
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

- (NSArray)stringListValue
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringListValue, 0);
}

uint64_t __31__HMStringListSetting_isEqual___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stringListValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

@end
