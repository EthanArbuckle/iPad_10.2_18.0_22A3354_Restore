@implementation BCCloudKitDataChangedTransaction

- (BCCloudKitDataChangedTransaction)initWithEntityName:(id)a3 notificationName:(id)a4 delegate:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BCCloudKitDataChangedTransaction *v13;
  uint64_t v14;
  NSString *notificationName;
  objc_super v17;

  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BCCloudKitDataChangedTransaction;
  v13 = -[BCCloudKitTransaction initWithEntityName:delegate:](&v17, sel_initWithEntityName_delegate_, a3, a5);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v9, v10, v11, v12);
    notificationName = v13->_notificationName;
    v13->_notificationName = (NSString *)v14;

  }
  return v13;
}

+ (id)transactionNameForEntityName:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringByAppendingString_(CFSTR("BCCloudKitDataChangedTransaction-"), a2, (uint64_t)a3, v3, v4);
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
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
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
      objc_msgSend_notificationName(self, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v24;
      _os_log_impl(&dword_227D4F000, v19, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction - posting notification %{public}@\\\"\", buf, 0xCu);

    }
  }
  objc_msgSend_defaultCenter(MEMORY[0x24BDD1530], v15, v16, v17, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_notificationName(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v25, v31, (uint64_t)v30, 0, v32);

  if (BDSXPCNotificationsEnabled())
  {
    BDSServiceXPCNotificationLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_notificationName(self, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v38;
      _os_log_impl(&dword_227D4F000, v33, OS_LOG_TYPE_DEFAULT, "posting BDSServiceNotificationName for %{public}@", buf, 0xCu);

    }
    objc_msgSend_notificationName(self, v39, v40, v41, v42, CFSTR("name"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v43;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v44, (uint64_t)&v55, (uint64_t)&v54, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postNotificationName_object_userInfo_(v50, v51, (uint64_t)CFSTR("BDSServiceNotificationName"), 0, (uint64_t)v45);

  }
  v52 = _Block_copy(v4);
  v53 = v52;
  if (v52)
    (*((void (**)(void *))v52 + 2))(v52);

}

- (double)coalescingDelay
{
  return 0.25;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
