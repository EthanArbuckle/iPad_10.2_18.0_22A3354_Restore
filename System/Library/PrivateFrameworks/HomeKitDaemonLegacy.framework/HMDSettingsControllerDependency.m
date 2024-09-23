@implementation HMDSettingsControllerDependency

- (HMDSettingsControllerDependency)initWithParentUUID:(id)a3 logName:(id)a4 queue:(id)a5 metadataFileName:(id)a6 codingKey:(id)a7 messageHandler:(id)a8 migrationProvider:(id)a9 keyPathsToPrune:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  HMDSettingsControllerDependency *v21;
  HMDSettingsControllerDependency *v22;
  HMFMessageDispatcher *messageDispatcher;
  void *v24;
  uint64_t v25;
  NSString *logIdentifier;
  HMDSettingsMetadataParser *v27;
  HMDSettingsMetadataParserProtocol *metadataParser;
  uint64_t v29;
  NSArray *keyPathsToPrune;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v17 = a3;
  v18 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v32 = a8;
  v19 = a9;
  v20 = a10;
  v36.receiver = self;
  v36.super_class = (Class)HMDSettingsControllerDependency;
  v21 = -[HMDSettingsControllerDependency init](&v36, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_internalMessageHandler, a8);
    messageDispatcher = v22->_messageDispatcher;
    v22->_messageDispatcher = 0;

    objc_storeStrong((id *)&v22->_parentIdentifier, a3);
    objc_msgSend(v17, "UUIDString", v32, v33, v34, v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v22->_logIdentifier;
    v22->_logIdentifier = (NSString *)v25;

    objc_storeStrong((id *)&v22->_queue, a5);
    v27 = -[HMDSettingsMetadataParser initWithDependency:]([HMDSettingsMetadataParser alloc], "initWithDependency:", v22);
    metadataParser = v22->_metadataParser;
    v22->_metadataParser = (HMDSettingsMetadataParserProtocol *)v27;

    objc_storeStrong((id *)&v22->_metadataFileName, a6);
    objc_storeStrong((id *)&v22->_codingKey, a7);
    objc_storeWeak((id *)&v22->_migrationProvider, v19);
    v29 = objc_msgSend(v20, "copy");
    keyPathsToPrune = v22->_keyPathsToPrune;
    v22->_keyPathsToPrune = (NSArray *)v29;

  }
  return v22;
}

- (HMDSettingsControllerDependency)initWithParentUUID:(id)a3 logName:(id)a4 queue:(id)a5 metadataFileName:(id)a6 codingKey:(id)a7 messageHandler:(id)a8 migrationProvider:(id)a9
{
  return -[HMDSettingsControllerDependency initWithParentUUID:logName:queue:metadataFileName:codingKey:messageHandler:migrationProvider:keyPathsToPrune:](self, "initWithParentUUID:logName:queue:metadataFileName:codingKey:messageHandler:migrationProvider:keyPathsToPrune:", a3, a4, a5, a6, a7, a8, a9, MEMORY[0x1E0C9AA60]);
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4 backingStoreController:(id)a5
{
  id v8;
  id v9;
  SEL v10;
  SEL v11;
  SEL v12;
  id Property;
  id v14;

  v14 = a3;
  v8 = a4;
  if (self)
  {
    v9 = a5;
    objc_setProperty_atomic(self, v10, v8, 88);
    objc_setProperty_atomic(self, v11, v9, 40);

    Property = objc_getProperty(self, v12, 96, 1);
  }
  else
  {
    Property = 0;
  }
  objc_msgSend(Property, "configureWithMessageDispatcher:home:", v8, v14);

}

- (HMDSettingsMessageHandlerProtocol)messageHandler
{
  if (self)
    self = (HMDSettingsControllerDependency *)objc_getProperty(self, a2, 96, 1);
  return (HMDSettingsMessageHandlerProtocol *)self;
}

- (id)settingModelForUpdateWithIdentifier:(id)a3 parentIdentifier:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDSettingModel *v11;
  HMDSettingModel *v12;
  void *v13;
  HMDSettingsControllerDependency *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HMBModel initWithModelID:parentModelID:]([HMDSettingModel alloc], "initWithModelID:parentModelID:", v8, v9);
  if (-[HMDSettingModel setSettingValue:](v11, "setSettingValue:", v10))
  {
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to set value on model", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (id)settingValueForValue:(id)a3 type:(id)a4 constraintModels:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  int v20;
  char v21;
  id v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v9;
  v12 = v10;
  v13 = 0;
  switch(objc_msgSend(a4, "integerValue"))
  {
    case 1:
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA820]), "initDataSettingWithValue:", v11);
      goto LABEL_5;
    case 2:
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA820]), "initNumberSettingWithValue:", v11);
      goto LABEL_5;
    case 3:
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA820]), "initStringSettingWithValue:", v11);
LABEL_5:
      v13 = (void *)v14;
      goto LABEL_23;
    case 4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v15 = v12;
        v13 = (void *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (!v13)
          goto LABEL_15;
        v16 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v15);
            v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v18, "stringValue", (_QWORD)v25);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", v11);

            if (v20)
            {
              v22 = objc_alloc(MEMORY[0x1E0CBA820]);
              objc_msgSend(v18, "hmbModelID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = (void *)objc_msgSend(v22, "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", 4, 0, 0, 0, v23, v11);

              v21 = 1;
              goto LABEL_20;
            }
          }
          v13 = (void *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);
LABEL_15:
        v21 = 0;
LABEL_20:

        if (!a6)
          goto LABEL_23;
LABEL_21:
        if ((v21 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Unable to create setting value"), CFSTR("Could not determine type"), 0);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_23;
      }
      v13 = 0;
LABEL_17:
      v21 = 0;
      if (a6)
        goto LABEL_21;
LABEL_23:

      return v13;
    case 5:
      goto LABEL_23;
    default:
      goto LABEL_17;
  }
}

- (id)loadMetadata
{
  void *v3;
  const char *v4;
  void *v5;
  id Property;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  HMDSettingsControllerDependency *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v4, 72, 1);
  else
    Property = 0;
  objc_msgSend(v5, "URLByAppendingPathComponent:", Property);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot find user settings resource at: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (id)createSettingRootGroupModelWithParentModelID:(id)a3
{
  id v3;
  HMDSettingRootGroupModel *v4;
  void *v5;
  HMDSettingRootGroupModel *v6;

  v3 = a3;
  v4 = [HMDSettingRootGroupModel alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDSettingRootGroupModel initWithModelID:parentModelID:](v4, "initWithModelID:parentModelID:", v5, v3);

  return v6;
}

- (id)createSettingGroupModelWithName:(id)a3 parent:(id)a4
{
  id v5;
  id v6;
  HMDSettingGroupModel *v7;
  void *v8;
  HMDSettingGroupModel *v9;

  v5 = a4;
  v6 = a3;
  v7 = [HMDSettingGroupModel alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMBModel initWithModelID:parentModelID:](v7, "initWithModelID:parentModelID:", v8, v5);

  -[HMDSettingGroupModel setName:](v9, "setName:", v6);
  return v9;
}

- (id)createSettingModelWithName:(id)a3 parent:(id)a4 type:(id)a5 properties:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  HMDSettingModel *v13;
  void *v14;
  HMDSettingModel *v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [HMDSettingModel alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMBModel initWithModelID:parentModelID:](v13, "initWithModelID:parentModelID:", v14, v11);

  -[HMDSettingModel setName:](v15, "setName:", v12);
  -[HMDSettingModel setType:](v15, "setType:", v10);

  -[HMDSettingModel setProperties:](v15, "setProperties:", v9);
  return v15;
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)keyPathsToPrune
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (HMDSettingTransactionReceiverProtocol)transactionReceiver
{
  return (HMDSettingTransactionReceiverProtocol *)objc_loadWeakRetained((id *)&self->_transactionReceiver);
}

- (void)setTransactionReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_transactionReceiver, a3);
}

- (HMDSettingsBackingStoreController)backingStoreController
{
  return (HMDSettingsBackingStoreController *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)codingKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (HMDUserSettingsInitialValueProviding)migrationProvider
{
  return (HMDUserSettingsInitialValueProviding *)objc_loadWeakRetained((id *)&self->_migrationProvider);
}

- (HMDSettingsMetadataParserProtocol)metadataParser
{
  return (HMDSettingsMetadataParserProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalMessageHandler, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_metadataFileName, 0);
  objc_storeStrong((id *)&self->_metadataParser, 0);
  objc_destroyWeak((id *)&self->_migrationProvider);
  objc_storeStrong((id *)&self->_codingKey, 0);
  objc_storeStrong((id *)&self->_backingStoreController, 0);
  objc_destroyWeak((id *)&self->_transactionReceiver);
  objc_storeStrong((id *)&self->_keyPathsToPrune, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
}

@end
