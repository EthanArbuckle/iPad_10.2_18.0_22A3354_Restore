@implementation HMAccessorySettingFetchResult

- (HMAccessorySettingFetchResult)initWithSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessorySettingFetchResult *v7;
  HMAccessorySettingFetchResult *v9;
  SEL v10;
  id v11;
  int64_t v12;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMAccessorySettingFetchResult initWithKeyPath:setting:failureType:](self, "initWithKeyPath:setting:failureType:", v6, v5, 0);

    return v7;
  }
  else
  {
    v9 = (HMAccessorySettingFetchResult *)_HMFPreconditionFailure();
    return -[HMAccessorySettingFetchResult initWithKeyPath:failureType:](v9, v10, v11, v12);
  }
}

- (HMAccessorySettingFetchResult)initWithKeyPath:(id)a3 failureType:(int64_t)a4
{
  return -[HMAccessorySettingFetchResult initWithKeyPath:setting:failureType:](self, "initWithKeyPath:setting:failureType:", a3, 0, a4);
}

- (HMAccessorySettingFetchResult)initWithKeyPath:(id)a3 setting:(id)a4 failureType:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  HMAccessorySettingFetchResult *v12;
  HMAccessorySettingFetchResult *v13;
  HMAccessorySettingFetchResult *v15;
  SEL v16;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  if (v9)
  {
    v11 = v10;
    v17.receiver = self;
    v17.super_class = (Class)HMAccessorySettingFetchResult;
    v12 = -[HMAccessorySettingFetchResult init](&v17, sel_init);
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_keyPath, a3);
      objc_storeStrong((id *)&v13->_setting, a4);
      v13->_failureType = a5;
    }

    return v13;
  }
  else
  {
    v15 = (HMAccessorySettingFetchResult *)_HMFPreconditionFailure();
    return (HMAccessorySettingFetchResult *)-[HMAccessorySettingFetchResult error](v15, v16);
  }
}

- (NSError)error
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;

  -[HMAccessorySettingFetchResult setting](self, "setting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = -[HMAccessorySettingFetchResult failureType](self, "failureType");
    if (v5 > 3)
      v6 = 15;
    else
      v6 = qword_19B44CDF0[v5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSError *)v4;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessorySettingFetchResult keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("keyPath"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessorySettingFetchResult setting](self, "setting", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("setting"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  HMAccessorySettingsPartialFetchFailureTypeToString(-[HMAccessorySettingFetchResult failureType](self, "failureType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("failureType"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMImmutableSetting)setting
{
  return (HMImmutableSetting *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)failureType
{
  return self->_failureType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

+ (id)fetchResultsWithKeyPaths:(id)a3 failureType:(int64_t)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__HMAccessorySettingFetchResult_fetchResultsWithKeyPaths_failureType___block_invoke;
  v5[3] = &__block_descriptor_40_e49___HMAccessorySettingFetchResult_16__0__NSString_8l;
  v5[4] = a4;
  objc_msgSend(a3, "na_map:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

HMAccessorySettingFetchResult *__70__HMAccessorySettingFetchResult_fetchResultsWithKeyPaths_failureType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMAccessorySettingFetchResult *v4;

  v3 = a2;
  v4 = -[HMAccessorySettingFetchResult initWithKeyPath:failureType:]([HMAccessorySettingFetchResult alloc], "initWithKeyPath:failureType:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

@end
