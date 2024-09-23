@implementation LKSwitchOperation

- (LKSwitchOperation)init
{
  LKSwitchOperation *v2;
  LKSwitchOperation *v3;
  LKRecoverEMCSOperation *recoverEMCSOperation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LKSwitchOperation;
  v2 = -[LKOperation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_switchType = 0;
    recoverEMCSOperation = v2->_recoverEMCSOperation;
    v2->_recoverEMCSOperation = 0;

  }
  return v3;
}

- (void)setRecoverEMCSOperation:(id)a3
{
  LKRecoverEMCSOperation *v5;
  LKRecoverEMCSOperation *v6;

  v5 = (LKRecoverEMCSOperation *)a3;
  if (self->_recoverEMCSOperation != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_recoverEMCSOperation, a3);
    v5 = v6;
  }

}

- (void)setSwitchType:(unint64_t)a3
{
  if (self->_switchType != a3)
    self->_switchType = a3;
}

- (NSArray)keychainItemsAddedAfterRecoverEMCS
{
  void *v2;
  void *v3;

  -[LKSwitchOperation mutableKeychainItemsAddedAfterRecoverEMCS](self, "mutableKeychainItemsAddedAfterRecoverEMCS");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSMutableArray)mutableKeychainItemsAddedAfterRecoverEMCS
{
  NSMutableArray *mutableKeychainItemsAddedAfterRecoverEMCS;
  NSMutableArray *v4;
  NSMutableArray *v5;

  mutableKeychainItemsAddedAfterRecoverEMCS = self->_mutableKeychainItemsAddedAfterRecoverEMCS;
  if (!mutableKeychainItemsAddedAfterRecoverEMCS)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_mutableKeychainItemsAddedAfterRecoverEMCS;
    self->_mutableKeychainItemsAddedAfterRecoverEMCS = v4;

    mutableKeychainItemsAddedAfterRecoverEMCS = self->_mutableKeychainItemsAddedAfterRecoverEMCS;
  }
  return mutableKeychainItemsAddedAfterRecoverEMCS;
}

- (void)addKeychainItemAdditionEvent:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[LKSwitchOperation mutableKeychainItemsAddedAfterRecoverEMCS](self, "mutableKeychainItemsAddedAfterRecoverEMCS");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeLastKeychainItemAdditionEvent
{
  void *v3;
  uint64_t v4;
  id v5;

  -[LKSwitchOperation mutableKeychainItemsAddedAfterRecoverEMCS](self, "mutableKeychainItemsAddedAfterRecoverEMCS");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[LKSwitchOperation mutableKeychainItemsAddedAfterRecoverEMCS](self, "mutableKeychainItemsAddedAfterRecoverEMCS");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeLastObject");

  }
}

- (id)switchTypeString
{
  unint64_t v2;

  v2 = -[LKSwitchOperation switchType](self, "switchType");
  if (v2 > 4)
    return 0;
  else
    return off_24D59B130[v2];
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)LKSwitchOperation;
  -[LKOperation dictionary](&v24, sel_dictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[LKSwitchOperation recoverEMCSOperation](self, "recoverEMCSOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("recoverKeychainOperation"));

  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[LKSwitchOperation keychainItemsAddedAfterRecoverEMCS](self, "keychainItemsAddedAfterRecoverEMCS", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "keychainItemAdded");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "dictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    v16 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("keychainItemsAddedAfterKeychainRecovery"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1A8], CFSTR("keychainItemsAddedAfterKeychainRecovery"));
  }
  -[LKSwitchOperation switchTypeString](self, "switchTypeString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("switchType"));

  v18 = (void *)objc_msgSend(v4, "copy");
  return v18;
}

- (LKRecoverEMCSOperation)recoverEMCSOperation
{
  return self->_recoverEMCSOperation;
}

- (unint64_t)switchType
{
  return self->_switchType;
}

- (void)setMutableKeychainItemsAddedAfterRecoverEMCS:(id)a3
{
  objc_storeStrong((id *)&self->_mutableKeychainItemsAddedAfterRecoverEMCS, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableKeychainItemsAddedAfterRecoverEMCS, 0);
  objc_storeStrong((id *)&self->_recoverEMCSOperation, 0);
}

@end
