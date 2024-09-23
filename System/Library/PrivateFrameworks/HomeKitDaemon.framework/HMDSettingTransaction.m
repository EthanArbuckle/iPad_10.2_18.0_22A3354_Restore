@implementation HMDSettingTransaction

- (HMDSettingTransaction)initWithTransactionLabel:(id)a3
{
  id v5;
  HMDSettingTransaction *v6;
  HMDSettingTransaction *v7;
  uint64_t v8;
  NSMutableSet *updateModels;
  uint64_t v10;
  NSMutableSet *removeUUIDs;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDSettingTransaction;
  v6 = -[HMDSettingTransaction init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transactionLabel, a3);
    v7->_initialCreation = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    updateModels = v7->_updateModels;
    v7->_updateModels = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    removeUUIDs = v7->_removeUUIDs;
    v7->_removeUUIDs = (NSMutableSet *)v10;

  }
  return v7;
}

- (id)initForInitialCreationWithTransactionLabel:(id)a3
{
  id v5;
  HMDSettingTransaction *v6;
  HMDSettingTransaction *v7;
  uint64_t v8;
  NSMutableSet *updateModels;
  uint64_t v10;
  NSMutableSet *removeUUIDs;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDSettingTransaction;
  v6 = -[HMDSettingTransaction init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transactionLabel, a3);
    v7->_initialCreation = 1;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    updateModels = v7->_updateModels;
    v7->_updateModels = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    removeUUIDs = v7->_removeUUIDs;
    v7->_removeUUIDs = (NSMutableSet *)v10;

  }
  return v7;
}

- (void)addSettingModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMDSettingTransaction updateModels](self, "updateModels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Model not of required type %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)addModel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSettingTransaction updateModels](self, "updateModels");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeModelWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSettingTransaction removeUUIDs](self, "removeUUIDs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addModelToBeUpdated:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSettingTransaction updateModels](self, "updateModels");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSString)transactionLabel
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableSet)updateModels
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableSet)removeUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)initialCreation
{
  return self->_initialCreation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeUUIDs, 0);
  objc_storeStrong((id *)&self->_updateModels, 0);
  objc_storeStrong((id *)&self->_transactionLabel, 0);
}

@end
