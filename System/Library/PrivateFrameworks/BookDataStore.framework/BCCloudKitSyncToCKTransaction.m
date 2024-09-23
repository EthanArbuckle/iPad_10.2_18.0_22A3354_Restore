@implementation BCCloudKitSyncToCKTransaction

- (BCCloudKitSyncToCKTransaction)initWithEntityName:(id)a3 syncManager:(id)a4 delegate:(id)a5
{
  id v9;
  BCCloudKitSyncToCKTransaction *v10;
  BCCloudKitSyncToCKTransaction *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCCloudKitSyncToCKTransaction;
  v10 = -[BCCloudKitTransaction initWithEntityName:delegate:](&v13, sel_initWithEntityName_delegate_, a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_syncManager, a4);

  return v11;
}

+ (id)transactionNameForEntityName:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringByAppendingString_(CFSTR("BCCloudKitSyncToCKTransaction-"), a2, (uint64_t)a3, v3, v4);
}

- (void)performWorkWithCompletion:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BE0FC08];
  v5 = a3;
  objc_msgSend_shared(v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_verboseLoggingEnabled(v10, v11, v12, v13, v14);

  if (v15)
  {
    BDSCloudKitDevelopmentLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_entityName(self, v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v25;
      _os_log_impl(&dword_227D4F000, v20, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction - Signaling Sync Manager for  %@\\\"\", (uint8_t *)&v30, 0xCu);

    }
  }
  objc_msgSend_syncManager(self, v16, v17, v18, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startSyncToCKWithCompletion_(v26, v27, (uint64_t)v5, v28, v29);

}

- (double)coalescingDelay
{
  return 5.0;
}

- (double)transactionLifetimeTimout
{
  return 5.0;
}

- (BCCloudDataSyncProvider)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
  objc_storeStrong((id *)&self->_syncManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManager, 0);
}

@end
