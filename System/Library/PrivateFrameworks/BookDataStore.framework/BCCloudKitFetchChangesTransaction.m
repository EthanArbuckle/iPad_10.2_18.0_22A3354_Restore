@implementation BCCloudKitFetchChangesTransaction

- (BCCloudKitFetchChangesTransaction)initWithCloudKitController:(id)a3 delegate:(id)a4
{
  id v6;
  BCCloudKitFetchChangesTransaction *v7;
  BCCloudKitFetchChangesTransaction *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCCloudKitFetchChangesTransaction;
  v7 = -[BCCloudKitTransaction initWithEntityName:delegate:](&v10, sel_initWithEntityName_delegate_, CFSTR("iBooks"), a4);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_cloudKitController, v6);

  return v8;
}

+ (id)transactionNameForEntityName:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringByAppendingString_(CFSTR("BCCloudKitFetchChangesTransaction-"), a2, (uint64_t)a3, v3, v4);
}

- (void)performWorkWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_shared(MEMORY[0x24BE0FC08], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_verboseLoggingEnabled(v9, v10, v11, v12, v13);

  if (v14)
  {
    BDSCloudKitDevelopmentLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_entityName(self, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v24;
      _os_log_impl(&dword_227D4F000, v19, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudKitFetchChangesTransaction - Signaling Database to fetch changes for %@\\\"\", buf, 0xCu);

    }
  }
  objc_msgSend_cloudKitController(self, v15, v16, v17, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateCloudDatabaseController(v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = sub_227D86550;
    v37[3] = &unk_24F089380;
    v38 = v4;
    objc_msgSend_fetchChangesWithCompletion_(v30, v31, (uint64_t)v37, v32, v33);
    v34 = v38;
  }
  else
  {
    BDSCloudKitLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_227E5A53C(v35);

    v36 = _Block_copy(v4);
    v34 = v36;
    if (v36)
      (*((void (**)(void *))v36 + 2))(v36);
  }

}

- (double)coalescingDelay
{
  return 2.0;
}

- (double)transactionLifetimeTimout
{
  return 5.0;
}

- (BCCloudKitController)cloudKitController
{
  return (BCCloudKitController *)objc_loadWeakRetained((id *)&self->_cloudKitController);
}

- (void)setCloudKitController:(id)a3
{
  objc_storeWeak((id *)&self->_cloudKitController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudKitController);
}

@end
