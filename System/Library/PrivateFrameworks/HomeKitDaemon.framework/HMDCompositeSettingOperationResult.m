@implementation HMDCompositeSettingOperationResult

- (HMDCompositeSettingOperationResult)initWithKeyPath:(id)a3 setting:(id)a4 metadata:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDCompositeSettingOperationResult *v15;
  HMDCompositeSettingOperationResult *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCompositeSettingOperationResult;
  v15 = -[HMDCompositeSettingOperationResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_error, a6);
    objc_storeStrong((id *)&v16->_setting, a4);
    objc_storeStrong((id *)&v16->_metadata, a5);
    objc_storeStrong((id *)&v16->_keyPath, a3);
  }

  return v16;
}

- (id)attributeDescriptions
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeSettingOperationResult keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("keyPath"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeSettingOperationResult setting](self, "setting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("setting"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeSettingOperationResult error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("error"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeSettingOperationResult metadata](self, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("metadata"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (HMDCompositeSettingMetadata)metadata
{
  return (HMDCompositeSettingMetadata *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCompositeSetting)setting
{
  return (HMDCompositeSetting *)objc_getProperty(self, a2, 16, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

+ (id)frameWorkFetchResultsWithOperationResults:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_201);
}

id __80__HMDCompositeSettingOperationResult_frameWorkFetchResultsWithOperationResults___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  +[HMDCompositeSettingsControllerManager immutableSettingFromFetchReturn:](HMDCompositeSettingsControllerManager, "immutableSettingFromFetchReturn:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD7410]);
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_msgSend(v4, "initWithSetting:", v3);
  }
  else
  {
    objc_msgSend(v2, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "initWithKeyPath:failureType:", v7, 1);

  }
  return v6;
}

@end
