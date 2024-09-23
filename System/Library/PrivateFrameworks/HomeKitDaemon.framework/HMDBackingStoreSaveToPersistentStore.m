@implementation HMDBackingStoreSaveToPersistentStore

- (HMDBackingStoreSaveToPersistentStore)initWithHomeManager:(id)a3 reason:(id)a4 incrementGeneration:(BOOL)a5
{
  id v9;
  id v10;
  HMDBackingStoreSaveToPersistentStore *v11;
  HMDBackingStoreSaveToPersistentStore *v12;
  HMDBackingStoreSaveToPersistentStore *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreSaveToPersistentStore;
  v11 = -[HMDBackingStoreOperation init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeManager, a3);
    objc_storeStrong((id *)&v12->_reason, a4);
    v12->_incrementGeneration = a5;
    v13 = v12;
  }

  return v12;
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSString *reason;
  HMDHomeManager *homeManager;
  _BOOL8 incrementGeneration;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[HMDBackingStoreOperation store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "_begin");

  -[HMDBackingStoreOperation store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  reason = self->_reason;
  homeManager = self->_homeManager;
  incrementGeneration = self->_incrementGeneration;
  -[HMDBackingStoreOperation store](self, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_saveToLocalStoreWithReason:homeManager:shouldIncrementGenerationCounter:backingStore:", reason, homeManager, incrementGeneration, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBackingStoreOperation store](self, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "local");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "_commit");

  return v12;
}

- (HMDHomeManager)homeManager
{
  return self->_homeManager;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)incrementGeneration
{
  return self->_incrementGeneration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end
