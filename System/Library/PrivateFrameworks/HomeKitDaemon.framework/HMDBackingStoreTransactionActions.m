@implementation HMDBackingStoreTransactionActions

- (HMDBackingStoreTransactionActions)initWithBackingStore:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  HMDBackingStoreTransactionActions *v13;
  HMDBackingStoreTransactionActions *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "source");
  v9 = objc_msgSend(v7, "destination");
  objc_msgSend(v7, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "mustReplay");
  v12 = objc_msgSend(v7, "mustPush");

  v16.receiver = self;
  v16.super_class = (Class)HMDBackingStoreTransactionActions;
  v13 = -[HMDBackingStoreTransactionOptions initWithSource:destination:label:mustReplay:mustPush:](&v16, sel_initWithSource_destination_label_mustReplay_mustPush_, v8, v9, v10, v11, v12);

  if (v13)
  {
    objc_storeWeak((id *)&v13->_backingStore, v6);
    v14 = v13;
  }

  return v13;
}

- (void)markLocalChanged
{
  self->_local = 1;
}

- (void)markChanged
{
  self->_changed = 1;
}

- (void)markSaveToAssistant
{
  self->_saveToAssistant = 1;
}

- (void)markSaveToSharedUserAccount
{
  self->_saveToSharedUserAccount = 1;
}

- (void)addPostApplyActionUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *postApplyActions;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;

  v4 = a3;
  if (!self->_postApplyActionsInvoked)
  {
    postApplyActions = self->_postApplyActions;
    v10 = v4;
    if (postApplyActions)
    {
      v6 = _Block_copy(v4);
      -[NSMutableArray addObject:](postApplyActions, "addObject:", v6);
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDBCEB8];
      v6 = _Block_copy(v4);
      objc_msgSend(v7, "arrayWithObject:", v6);
      v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v9 = self->_postApplyActions;
      self->_postApplyActions = v8;

    }
    v4 = v10;
  }

}

- (BOOL)addPostApplyActionIfNotPresent:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  NSMutableSet *postApplyActionNames;
  NSMutableSet *v10;
  NSMutableSet *v11;

  v6 = a3;
  v7 = a4;
  if (self->_postApplyActionsInvoked)
    goto LABEL_2;
  postApplyActionNames = self->_postApplyActionNames;
  if (!postApplyActionNames)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v6);
    v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v11 = self->_postApplyActionNames;
    self->_postApplyActionNames = v10;

    goto LABEL_7;
  }
  if ((-[NSMutableSet containsObject:](postApplyActionNames, "containsObject:", v6) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_postApplyActionNames, "addObject:", v6);
LABEL_7:
    -[HMDBackingStoreTransactionActions addPostApplyActionUsingBlock:](self, "addPostApplyActionUsingBlock:", v7);
    v8 = 1;
    goto LABEL_8;
  }
LABEL_2:
  v8 = 0;
LABEL_8:

  return v8;
}

- (void)invokePostApplyActions
{
  NSMutableArray *v3;
  NSMutableArray *postApplyActions;
  NSMutableSet *postApplyActionNames;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_postApplyActionsInvoked)
  {
    self->_postApplyActionsInvoked = 1;
    v3 = self->_postApplyActions;
    if (v3)
    {
      postApplyActions = self->_postApplyActions;
      self->_postApplyActions = 0;

      postApplyActionNames = self->_postApplyActionNames;
      self->_postApplyActionNames = 0;

      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = v3;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
            ++v10;
          }
          while (v8 != v10);
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }
}

- (NSMutableDictionary)userInfo
{
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (id)logIdentifier
{
  return CFSTR("BackingStore");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDBackingStoreTransactionOptions _description](self, "_description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = "y";
  if (self->_local)
    v7 = "y";
  else
    v7 = "n";
  if (self->_changed)
    v8 = "y";
  else
    v8 = "n";
  if (self->_saveToAssistant)
    v9 = "y";
  else
    v9 = "n";
  if (!self->_saveToSharedUserAccount)
    v6 = "n";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<actions: %@ local=%s change=%s assistant=%s account=%s>"), v4, v7, v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)local
{
  return self->_local;
}

- (BOOL)changed
{
  return self->_changed;
}

- (BOOL)saveToAssistant
{
  return self->_saveToAssistant;
}

- (BOOL)saveToSharedUserAccount
{
  return self->_saveToSharedUserAccount;
}

- (HMDBackingStore)backingStore
{
  return (HMDBackingStore *)objc_loadWeakRetained((id *)&self->_backingStore);
}

- (void)setBackingStore:(id)a3
{
  objc_storeWeak((id *)&self->_backingStore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backingStore);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_postApplyActionNames, 0);
  objc_storeStrong((id *)&self->_postApplyActions, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_66407 != -1)
    dispatch_once(&logCategory__hmf_once_t3_66407, &__block_literal_global_202);
  return (id)logCategory__hmf_once_v4_66408;
}

void __48__HMDBackingStoreTransactionActions_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_66408;
  logCategory__hmf_once_v4_66408 = v0;

}

@end
