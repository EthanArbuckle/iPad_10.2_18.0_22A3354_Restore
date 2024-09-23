@implementation CKSyncEngineConfiguration

- (CKSyncEngineConfiguration)init
{
  CKException *v2;
  const char *v3;
  id v4;

  v2 = [CKException alloc];
  v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("%s is unavailable"), "-[CKSyncEngineConfiguration init]");
  objc_exception_throw(v4);
}

- (CKSyncEngineConfiguration)initWithDatabase:(id)a3 stateSerialization:(id)a4
{
  id v7;
  id v8;
  char v9;
  id v10;
  CKSyncEngineConfiguration *v11;
  CKSyncEngineConfiguration *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CKSyncEngineStateSerialization *stateSerialization;
  CKAssetDownloadStagingManager *assetDownloadStagingManager;
  void *v20;
  CKException *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  id v31;
  objc_super v32;
  id v33;

  v7 = a3;
  v8 = a4;
  v33 = 0;
  v9 = _CKCheckArgument((uint64_t)"database", v7, 0, 0, 0, &v33);
  v10 = v33;
  if ((v9 & 1) == 0)
  {
    v20 = v10;
    v21 = [CKException alloc];
    v25 = objc_msgSend_code(v20, v22, v23, v24);
    objc_msgSend_localizedDescription(v20, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)objc_msgSend_initWithCode_format_(v21, v30, v25, (uint64_t)CFSTR("%@"), v29);

    objc_exception_throw(v31);
  }

  v32.receiver = self;
  v32.super_class = (Class)CKSyncEngineConfiguration;
  v11 = -[CKSyncEngineConfiguration init](&v32, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_database, a3);
    v16 = objc_msgSend_copy(v8, v13, v14, v15);
    stateSerialization = v12->_stateSerialization;
    v12->_stateSerialization = (CKSyncEngineStateSerialization *)v16;

    v12->_automaticallySync = 1;
    v12->_priority = 2;
    v12->_continueSendingChangesAfterFailure = 0;
    assetDownloadStagingManager = v12->_assetDownloadStagingManager;
    v12->_assetDownloadStagingManager = 0;

    v12->_useOpportunisticPushTopic = 0;
    v12->_immediatePushSyncEnabled = CKCurrentProcessIsDaemon() ^ 1;
  }

  return v12;
}

- (CKSyncEngineConfiguration)initWithDatabase:(id)a3 stateSerialization:(id)a4 asyncDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  const char *v13;
  uint64_t v14;
  CKSyncEngineConfiguration *v15;
  void *v17;
  CKException *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29 = 0;
  v11 = _CKCheckArgument((uint64_t)"asyncDelegate", v10, 0, 0, 0, &v29);
  v12 = v29;
  if ((v11 & 1) == 0)
  {
    v17 = v12;
    v18 = [CKException alloc];
    v22 = objc_msgSend_code(v17, v19, v20, v21);
    objc_msgSend_localizedDescription(v17, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, (uint64_t)CFSTR("%@"), v26);

    objc_exception_throw(v28);
  }

  v14 = objc_msgSend_initWithDatabase_stateSerialization_(self, v13, (uint64_t)v8, (uint64_t)v9);
  v15 = (CKSyncEngineConfiguration *)v14;
  if (v14)
    objc_storeWeak((id *)(v14 + 48), v10);

  return v15;
}

- (CKSyncEngineConfiguration)initWithDatabase:(CKDatabase *)database stateSerialization:(CKSyncEngineStateSerialization *)stateSerialization delegate:(id)delegate
{
  CKDatabase *v8;
  CKSyncEngineStateSerialization *v9;
  id v10;
  char v11;
  id v12;
  const char *v13;
  uint64_t v14;
  CKSyncEngineConfiguration *v15;
  void *v17;
  CKException *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;
  id v29;

  v8 = database;
  v9 = stateSerialization;
  v10 = delegate;
  v29 = 0;
  v11 = _CKCheckArgument((uint64_t)"delegate", v10, 0, 0, 0, &v29);
  v12 = v29;
  if ((v11 & 1) == 0)
  {
    v17 = v12;
    v18 = [CKException alloc];
    v22 = objc_msgSend_code(v17, v19, v20, v21);
    objc_msgSend_localizedDescription(v17, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, (uint64_t)CFSTR("%@"), v26);

    objc_exception_throw(v28);
  }

  v14 = objc_msgSend_initWithDatabase_stateSerialization_(self, v13, (uint64_t)v8, (uint64_t)v9);
  v15 = (CKSyncEngineConfiguration *)v14;
  if (v14)
    objc_storeWeak((id *)(v14 + 32), v10);

  return v15;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  id v57;

  v57 = a3;
  objc_msgSend_database(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v57, v8, (uint64_t)CFSTR("database"), (uint64_t)v7, 0);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend_priority(self, v10, v11, v12);
  objc_msgSend_numberWithInteger_(v9, v14, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v57, v17, (uint64_t)CFSTR("priority"), (uint64_t)v16, 0);

  objc_msgSend_stateSerialization(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_stateSerialization(self, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v57, v26, (uint64_t)CFSTR("state"), (uint64_t)v25, 0);

  }
  if ((objc_msgSend_automaticSyncingEnabled(self, v22, v23, v24) & 1) == 0)
    objc_msgSend_addProperty_value_shouldRedact_(v57, v27, (uint64_t)CFSTR("automaticSyncingEnabled"), MEMORY[0x1E0C9AAA0], 0);
  objc_msgSend_xpcActivityCriteriaOverrides(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend_xpcActivityCriteriaOverrides(self, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v57, v35, (uint64_t)CFSTR("xpcActivityCriteriaOverrides"), (uint64_t)v34, 0);

  }
  objc_msgSend_apsMachServiceName(self, v31, v32, v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_apsMachServiceName(self, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v57, v41, (uint64_t)CFSTR("apsMachServiceName"), (uint64_t)v40, 0);

  }
  objc_msgSend_subscriptionID(self, v37, v38, v39);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend_subscriptionID(self, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v57, v47, (uint64_t)CFSTR("subscriptionID"), (uint64_t)v46, 0);

  }
  if (objc_msgSend_useOpportunisticPushTopic(self, v43, v44, v45))
  {
    v51 = (void *)MEMORY[0x1E0CB37E8];
    v52 = objc_msgSend_useOpportunisticPushTopic(self, v48, v49, v50);
    objc_msgSend_numberWithBool_(v51, v53, v52, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v57, v56, (uint64_t)CFSTR("useOpportunisticPushTopic"), (uint64_t)v55, 0);

  }
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineConfiguration *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineConfiguration *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (BOOL)automaticSyncingEnabled
{
  return ((uint64_t (*)(CKSyncEngineConfiguration *, char *))MEMORY[0x1E0DE7D20])(self, sel_automaticallySync);
}

- (void)setAutomaticSyncingEnabled:(BOOL)a3
{
  ((void (*)(CKSyncEngineConfiguration *, char *, BOOL))MEMORY[0x1E0DE7D20])(self, sel_setAutomaticallySync_, a3);
}

- (CKSyncEngineConfiguration)initWithDatabase:(id)a3 dataSource:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  const char *v13;
  CKSyncEngineStateSerialization *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  CKSyncEngineConfiguration *v19;
  void *v21;
  CKException *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33 = 0;
  v11 = _CKCheckArgument((uint64_t)"dataSource", v9, 0, 0, 0, &v33);
  v12 = v33;
  if ((v11 & 1) == 0)
  {
    v21 = v12;
    v22 = [CKException alloc];
    v26 = objc_msgSend_code(v21, v23, v24, v25);
    objc_msgSend_localizedDescription(v21, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, (uint64_t)CFSTR("%@"), v30);

    objc_exception_throw(v32);
  }

  if (!v10)
  {
    v19 = (CKSyncEngineConfiguration *)objc_msgSend_initWithDatabase_stateSerialization_(self, v13, (uint64_t)v8, 0);
    if (!v19)
      goto LABEL_5;
    goto LABEL_4;
  }
  v14 = [CKSyncEngineStateSerialization alloc];
  v17 = (void *)objc_msgSend_initWithData_(v14, v15, (uint64_t)v10, v16);
  v19 = (CKSyncEngineConfiguration *)objc_msgSend_initWithDatabase_stateSerialization_(self, v18, (uint64_t)v8, (uint64_t)v17);

  if (v19)
LABEL_4:
    objc_storeWeak((id *)&v19->_dataSource, v9);
LABEL_5:

  return v19;
}

- (NSData)metadata
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_stateSerialization(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v8;
}

- (void)setMetadata:(id)a3
{
  id v4;
  CKSyncEngineStateSerialization *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = [CKSyncEngineStateSerialization alloc];
  v10 = (id)objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend_setStateSerialization_(self, v8, (uint64_t)v10, v9);
}

- (CKDatabase)database
{
  return (CKDatabase *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDatabase:(CKDatabase *)database
{
  objc_setProperty_atomic(self, a2, database, 16);
}

- (CKSyncEngineStateSerialization)stateSerialization
{
  return (CKSyncEngineStateSerialization *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStateSerialization:(CKSyncEngineStateSerialization *)stateSerialization
{
  objc_setProperty_atomic_copy(self, a2, stateSerialization, 24);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)automaticallySync
{
  return self->_automaticallySync;
}

- (void)setAutomaticallySync:(BOOL)automaticallySync
{
  self->_automaticallySync = automaticallySync;
}

- (CKSubscriptionID)subscriptionID
{
  return (CKSubscriptionID)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubscriptionID:(CKSubscriptionID)subscriptionID
{
  objc_setProperty_atomic_copy(self, a2, subscriptionID, 40);
}

- (BOOL)useUniqueActivityIdentifiers
{
  return self->_useUniqueActivityIdentifiers;
}

- (void)setUseUniqueActivityIdentifiers:(BOOL)a3
{
  self->_useUniqueActivityIdentifiers = a3;
}

- (BOOL)isImmediatePushSyncEnabled
{
  return self->_immediatePushSyncEnabled;
}

- (void)setImmediatePushSyncEnabled:(BOOL)a3
{
  self->_immediatePushSyncEnabled = a3;
}

- (CKSyncEngineAsyncDelegate)asyncDelegate
{
  return (CKSyncEngineAsyncDelegate *)objc_loadWeakRetained((id *)&self->_asyncDelegate);
}

- (void)setAsyncDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_asyncDelegate, a3);
}

- (CKSyncEngineDataSource)dataSource
{
  return (CKSyncEngineDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSString)apsMachServiceName
{
  return self->_apsMachServiceName;
}

- (void)setApsMachServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_apsMachServiceName, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)continueSendingChangesAfterFailure
{
  return self->_continueSendingChangesAfterFailure;
}

- (void)setContinueSendingChangesAfterFailure:(BOOL)a3
{
  self->_continueSendingChangesAfterFailure = a3;
}

- (BOOL)allowFetchAndModifyConcurrently
{
  return self->_allowFetchAndModifyConcurrently;
}

- (void)setAllowFetchAndModifyConcurrently:(BOOL)a3
{
  self->_allowFetchAndModifyConcurrently = a3;
}

- (OS_xpc_object)xpcActivityCriteriaOverrides
{
  return self->_xpcActivityCriteriaOverrides;
}

- (void)setXpcActivityCriteriaOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityCriteriaOverrides, a3);
}

- (BOOL)useOpportunisticPushTopic
{
  return self->_useOpportunisticPushTopic;
}

- (void)setUseOpportunisticPushTopic:(BOOL)a3
{
  self->_useOpportunisticPushTopic = a3;
}

- (CKAssetDownloadStagingManager)assetDownloadStagingManager
{
  return (CKAssetDownloadStagingManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAssetDownloadStagingManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDownloadStagingManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityCriteriaOverrides, 0);
  objc_storeStrong((id *)&self->_apsMachServiceName, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_asyncDelegate);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateSerialization, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
