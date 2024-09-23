@implementation BCCloudDataManager

- (void)cloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4 completion:(id)a5
{
  objc_msgSend_mutableCloudDataWithPredicate_sortDescriptors_synchronous_completion_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, a5);
}

- (BCCloudDataPrivacyDelegate)privacyDelegate
{
  return (BCCloudDataPrivacyDelegate *)objc_loadWeakRetained((id *)&self->_privacyDelegate);
}

- (void)mutableCloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4 synchronous:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id location;
  _QWORD block[4];
  id v42;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend_moc(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v12)
    {
      objc_initWeak(&location, self);
      v32 = MEMORY[0x24BDAC760];
      v33 = 3221225472;
      v34 = sub_227DC6D34;
      v35 = &unk_24F08BC40;
      objc_copyWeak(&v39, &location);
      v36 = v10;
      v37 = v11;
      v38 = v12;
      v22 = _Block_copy(&v32);
      objc_msgSend_moc(self, v23, v24, v25, v26, v32, v33, v34, v35, v36, v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend_performBlockAndWait_(v30, v27, (uint64_t)v22, v28, v29);
      else
        objc_msgSend_performBlock_(v30, v27, (uint64_t)v22, v28, v29);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend_responseQueue(self, v18, v19, v20, v21);
    v31 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC6CC8;
    block[3] = &unk_24F08A7F8;
    v42 = v12;
    dispatch_async(v31, block);

  }
}

- (NSManagedObjectContext)moc
{
  return (NSManagedObjectContext *)objc_loadWeakRetained((id *)&self->_moc);
}

- (id)mq_sanitizeError:(id)a3
{
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v3 = *MEMORY[0x24BDD0BA0];
  v26[0] = CFSTR("CoreDataError");
  v25[0] = v3;
  v25[1] = CFSTR("domain");
  v4 = a3;
  objc_msgSend_domain(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v9;
  v25[2] = CFSTR("code");
  v10 = (void *)MEMORY[0x24BDD16E0];
  v15 = objc_msgSend_code(v4, v11, v12, v13, v14);

  objc_msgSend_numberWithInteger_(v10, v16, v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v19;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)v26, (uint64_t)v25, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v22, (uint64_t)CFSTR("BDSErrorDomain"), 1002, (uint64_t)v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)_logError:(id)a3 at:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    BDSCloudKitLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_227E5E9C4();

  }
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9
{
  return (BCCloudDataManager *)objc_msgSend_initWithCloudDataSource_entityName_notificationName_immutableClass_mutableClass_syncManager_cloudKitController_dataMapper_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, 0);
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 dataMapper:(id)a10
{
  return (BCCloudDataManager *)objc_msgSend_initWithCloudDataSource_entityName_notificationName_immutableClass_mutableClass_syncManager_cloudKitController_dataMapper_privacyDelegate_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, a10, 0);
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 dataMapper:(id)a10 privacyDelegate:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BCCloudDataManager *v22;
  BCCloudDataManager *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *entityName;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSString *notificationName;
  id WeakRetained;
  NSObject *v42;
  dispatch_queue_t v43;
  OS_dispatch_queue *responseQueue;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  id v67;
  _QWORD v68[4];
  BCCloudDataManager *v69;
  objc_super v70;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v67 = a10;
  v21 = a11;
  v70.receiver = self;
  v70.super_class = (Class)BCCloudDataManager;
  v22 = -[BCCloudDataManager init](&v70, sel_init);
  v23 = v22;
  if (!v22)
    goto LABEL_12;
  objc_storeStrong((id *)&v22->_dataSource, a3);
  objc_msgSend_managedObjectContext(v16, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v23->_moc, v28);

  v33 = objc_msgSend_copy(v17, v29, v30, v31, v32);
  entityName = v23->_entityName;
  v23->_entityName = (NSString *)v33;

  v39 = objc_msgSend_copy(v18, v35, v36, v37, v38);
  notificationName = v23->_notificationName;
  v23->_notificationName = (NSString *)v39;

  v23->_immutableClass = a6;
  v23->_mutableClass = a7;
  objc_storeWeak((id *)&v23->_syncManager, v19);
  objc_storeWeak((id *)&v23->_cloudKitController, v20);
  objc_storeStrong((id *)&v23->_dataMapper, a10);
  WeakRetained = objc_loadWeakRetained((id *)&v23->_moc);

  if (!WeakRetained)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = dispatch_queue_create("BookDataStore.DataManagerCallbackQueue", v42);
    responseQueue = v23->_responseQueue;
    v23->_responseQueue = (OS_dispatch_queue *)v43;

  }
  if (BUIsRunningTests())
  {
    objc_msgSend_nullPrivacyDelegate(BCCloudDataNullPrivacyDelegate, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v23->_privacyDelegate, v49);
  }
  else
  {
    if (v21)
    {
      objc_storeWeak((id *)&v23->_privacyDelegate, v21);
      goto LABEL_10;
    }
    v49 = objc_loadWeakRetained((id *)&v23->_cloudKitController);
    objc_msgSend_privateCloudDatabaseController(v49, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v23->_privacyDelegate, v54);

  }
LABEL_10:
  v23->_signalDataChangedTransaction = v23->_notificationName != 0;
  v55 = objc_loadWeakRetained((id *)&v23->_cloudKitController);
  v60 = objc_msgSend_didChangeContainer(v55, v56, v57, v58, v59);

  if (v60)
  {
    v68[0] = MEMORY[0x24BDAC760];
    v68[1] = 3221225472;
    v68[2] = sub_227DC3048;
    v68[3] = &unk_24F08B220;
    v69 = v23;
    objc_msgSend_dissociateCloudDataFromSyncWithCompletion_(v69, v61, (uint64_t)v68, v62, v63);

  }
LABEL_12:

  return v23;
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 privacyDelegate:(id)a10
{
  return (BCCloudDataManager *)objc_msgSend_initWithCloudDataSource_entityName_notificationName_immutableClass_mutableClass_syncManager_cloudKitController_dataMapper_privacyDelegate_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, 0, a10);
}

- (void)mq_incrementCloudVersion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_mq_cloudSyncVersions(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_cloudVersion(v5, v6, v7, v8, v9);
  objc_msgSend_setCloudVersion_(v5, v11, v10 + 1, v12, v13);
  BDSCloudKitLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134217984;
    v20 = objc_msgSend_cloudVersion(v5, v15, v16, v17, v18);
    _os_log_impl(&dword_227D4F000, v14, OS_LOG_TYPE_DEFAULT, "BCCloudDataManager Incremented cloudSyncVersion to %lld", (uint8_t *)&v19, 0xCu);
  }

}

- (void)startSyncToCKWithSyncManager:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_227DC32B4;
  v11[3] = &unk_24F08BAD8;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend__dirtyMutableCloudDataWithFetchLimit_synchronous_completion_(self, v10, 64, 0, (uint64_t)v11);

}

- (void)_dirtyMutableCloudDataWithFetchLimit:(unint64_t)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  _QWORD aBlock[4];
  id v29;
  id v30[2];
  id location;
  _QWORD block[4];
  id v33;

  v5 = a4;
  v8 = a5;
  objc_msgSend_moc(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_227DC35DC;
    aBlock[3] = &unk_24F08BB00;
    objc_copyWeak(v30, &location);
    v30[1] = (id)a3;
    v29 = v8;
    v18 = _Block_copy(aBlock);
    objc_msgSend_moc(self, v19, v20, v21, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend_performBlockAndWait_(v26, v23, (uint64_t)v18, v24, v25);
    else
      objc_msgSend_performBlock_(v26, v23, (uint64_t)v18, v24, v25);

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_responseQueue(self, v14, v15, v16, v17);
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC3570;
    block[3] = &unk_24F08A7F8;
    v33 = v8;
    dispatch_async(v27, block);

  }
}

- (void)dirtyMutableCloudDataWithFetchLimit:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_227DC3ABC;
  v9[3] = &unk_24F08BB28;
  v10 = v6;
  v7 = v6;
  objc_msgSend__dirtyMutableCloudDataWithFetchLimit_synchronous_completion_(self, v8, a3, 0, (uint64_t)v9);

}

- (id)mq_cloudSyncVersions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  id v53;

  objc_msgSend_moc(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDBB678]);
  v11 = (void *)objc_msgSend_initWithEntityName_(v7, v8, (uint64_t)CFSTR("BCCloudSyncVersions"), v9, v10);
  objc_msgSend_setReturnsObjectsAsFaults_(v11, v12, 0, v13, v14);
  objc_msgSend_setFetchLimit_(v11, v15, 1, v16, v17);
  v18 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend_entityName(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v18, v24, (uint64_t)CFSTR("dataType == %@"), v25, v26, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPredicate_(v11, v28, (uint64_t)v27, v29, v30);

  v53 = 0;
  objc_msgSend_executeFetchRequest_error_(v6, v31, (uint64_t)v11, (uint64_t)&v53, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v53;
  objc_msgSend__logError_at_(self, v35, (uint64_t)v34, (uint64_t)CFSTR("mq_cloudSyncVersions"), v36);
  objc_msgSend_firstObject(v33, v37, v38, v39, v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43)
  {
    objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(MEMORY[0x24BDBB658], v41, (uint64_t)CFSTR("BCCloudSyncVersions"), (uint64_t)v6, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entityName(self, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDataType_(v43, v49, (uint64_t)v48, v50, v51);

  }
  return v43;
}

- (void)mq_signalTransactions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  id v36;

  objc_msgSend_syncManager(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalSyncToCK(v6, v7, v8, v9, v10);

  if (objc_msgSend_signalDataChangedTransaction(self, v11, v12, v13, v14))
  {
    objc_msgSend_cloudKitController(self, v15, v16, v17, v18);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transactionManager(v36, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entityName(self, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notificationName(self, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signalDataChangeTransactionForEntityName_notificationName_(v23, v34, (uint64_t)v28, (uint64_t)v33, v35);

  }
}

- (void)currentCloudSyncVersions:(id)a3
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  _QWORD block[4];
  id v28;

  v4 = a3;
  objc_msgSend_moc(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_msgSend_moc(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227DC3EF0;
    v23[3] = &unk_24F0891B8;
    objc_copyWeak(&v25, &location);
    v24 = v4;
    objc_msgSend_performBlock_(v18, v19, (uint64_t)v23, v20, v21);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_responseQueue(self, v10, v11, v12, v13);
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC3E88;
    block[3] = &unk_24F08A7F8;
    v28 = v4;
    dispatch_async(v22, block);

  }
}

- (void)setCloudData:(id)a3 predicate:(id)a4 completion:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_setCloudData_predicate_mergers_completion_, a3, a4, 0);
}

- (void)setCloudData:(id)a3 predicate:(id)a4 mergers:(id)a5 completion:(id)a6
{
  MEMORY[0x24BEDD108](self, sel_setCloudData_predicate_mergers_isEqualCheckIgnoringEmptySalt_completion_, a3, a4, a5);
}

- (void)setCloudData:(id)a3 predicate:(id)a4 isEqualCheckIgnoringEmptySalt:(BOOL)a5 completion:(id)a6
{
  MEMORY[0x24BEDD108](self, sel_setCloudData_predicate_mergers_isEqualCheckIgnoringEmptySalt_completion_, a3, a4, 0);
}

- (void)setCloudData:(id)a3 predicate:(id)a4 mergers:(id)a5 isEqualCheckIgnoringEmptySalt:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  BCCloudDataManager *v38;
  id v39;
  id v40;
  BOOL v41;
  id location;
  _QWORD block[4];
  id v44;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend_moc(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_initWeak(&location, self);
    objc_msgSend_moc(self, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = sub_227DC42D8;
    v34[3] = &unk_24F08BB50;
    objc_copyWeak(&v40, &location);
    v35 = v12;
    v36 = v13;
    v41 = a6;
    v37 = v14;
    v38 = self;
    v39 = v15;
    objc_msgSend_performBlock_(v29, v30, (uint64_t)v34, v31, v32);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_responseQueue(self, v21, v22, v23, v24);
    v33 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC4268;
    block[3] = &unk_24F08A7F8;
    v44 = v15;
    dispatch_async(v33, block);

  }
}

- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 completion:(id)a6
{
  MEMORY[0x24BEDD108](self, sel_setCloudData_predicate_propertyIDKey_mergers_completion_, a3, a4, a5);
}

- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 mergers:(id)a6 completion:(id)a7
{
  MEMORY[0x24BEDD108](self, sel_setCloudData_predicate_propertyIDKey_mergers_isEqualCheckIgnoringEmptySalt_completion_, a3, a4, a5);
}

- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 isEqualCheckIgnoringEmptySalt:(BOOL)a6 completion:(id)a7
{
  MEMORY[0x24BEDD108](self, sel_setCloudData_predicate_propertyIDKey_mergers_isEqualCheckIgnoringEmptySalt_completion_, a3, a4, a5);
}

- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 mergers:(id)a6 isEqualCheckIgnoringEmptySalt:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  BCCloudDataManager *v42;
  id v43;
  id v44;
  BOOL v45;
  id location;
  _QWORD block[4];
  id v48;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  objc_msgSend_moc(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_initWeak(&location, self);
    objc_msgSend_moc(self, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = sub_227DC4A28;
    v37[3] = &unk_24F08BBA0;
    objc_copyWeak(&v44, &location);
    v38 = v15;
    v39 = v16;
    v40 = v14;
    v45 = a7;
    v41 = v17;
    v42 = self;
    v43 = v18;
    objc_msgSend_performBlock_(v32, v33, (uint64_t)v37, v34, v35);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_responseQueue(self, v24, v25, v26, v27);
    v36 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC49B8;
    block[3] = &unk_24F08A7F8;
    v48 = v18;
    dispatch_async(v36, block);

  }
}

- (void)removeCloudDataForPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  _QWORD block[4];
  id v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend_moc(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_initWeak(&location, self);
    objc_msgSend_moc(self, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = sub_227DC5604;
    v26[3] = &unk_24F08A740;
    objc_copyWeak(&v29, &location);
    v27 = v6;
    v28 = v7;
    objc_msgSend_performBlock_(v21, v22, (uint64_t)v26, v23, v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_responseQueue(self, v13, v14, v15, v16);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC5598;
    block[3] = &unk_24F08A7F8;
    v32 = v7;
    dispatch_async(v25, block);

  }
}

- (void)updateSyncGenerationFromCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id location;
  _QWORD block[4];
  id v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_moc(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_initWeak(&location, self);
    objc_msgSend_moc(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = sub_227DC5BAC;
    v32[3] = &unk_24F08BBF0;
    objc_copyWeak(&v37, &location);
    v33 = v11;
    v34 = v10;
    v35 = v12;
    v36 = v13;
    objc_msgSend_performBlock_(v27, v28, (uint64_t)v32, v29, v30);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_responseQueue(self, v19, v20, v21, v22);
    v31 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC5B40;
    block[3] = &unk_24F08A7F8;
    v40 = v13;
    dispatch_async(v31, block);

  }
}

- (void)deleteCloudDataForPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  _QWORD block[4];
  id v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend_moc(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_initWeak(&location, self);
    objc_msgSend_moc(self, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = sub_227DC6314;
    v26[3] = &unk_24F08A740;
    objc_copyWeak(&v29, &location);
    v27 = v6;
    v28 = v7;
    objc_msgSend_performBlock_(v21, v22, (uint64_t)v26, v23, v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_responseQueue(self, v13, v14, v15, v16);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC62A8;
    block[3] = &unk_24F08A7F8;
    v32 = v7;
    dispatch_async(v25, block);

  }
}

- (void)countWithPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  _QWORD block[4];
  id v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend_moc(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v7)
    {
      objc_initWeak(&location, self);
      objc_msgSend_moc(self, v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = sub_227DC69E4;
      v26[3] = &unk_24F08A740;
      objc_copyWeak(&v29, &location);
      v27 = v6;
      v28 = v7;
      objc_msgSend_performBlock_(v21, v22, (uint64_t)v26, v23, v24);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend_responseQueue(self, v13, v14, v15, v16);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC6978;
    block[3] = &unk_24F08A7F8;
    v32 = v7;
    dispatch_async(v25, block);

  }
}

- (id)mutableCloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_227DC5054;
  v16 = sub_227DC5064;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_227DC6CB8;
  v11[3] = &unk_24F08BC18;
  v11[4] = &v12;
  objc_msgSend_mutableCloudDataWithPredicate_sortDescriptors_synchronous_completion_(self, v8, (uint64_t)v6, 0, 1, v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)cloudDatasWithPredicate:(id)a3 sortDescriptors:(id)a4 maximumResultCount:(unint64_t)a5 filter:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45[2];
  id location;
  _QWORD block[4];
  id v48;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend_moc(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (v15)
    {
      objc_initWeak(&location, self);
      if (a5)
        v29 = a5;
      else
        v29 = -1;
      objc_msgSend_moc(self, v25, v26, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend_moc(self, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = sub_227DC7248;
        v40[3] = &unk_24F08BC68;
        objc_copyWeak(v45, &location);
        v41 = v12;
        v42 = v13;
        v43 = v14;
        v45[1] = (id)v29;
        v44 = v15;
        objc_msgSend_performBlock_(v35, v36, (uint64_t)v40, v37, v38);

        objc_destroyWeak(v45);
      }
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend_responseQueue(self, v21, v22, v23, v24);
    v39 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC71D8;
    block[3] = &unk_24F08A7F8;
    v48 = v15;
    dispatch_async(v39, block);

  }
}

- (void)cloudDatasWithPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  _QWORD block[4];
  id v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend_moc(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v7)
    {
      objc_initWeak(&location, self);
      objc_msgSend_moc(self, v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = sub_227DC7884;
      v26[3] = &unk_24F08A740;
      objc_copyWeak(&v29, &location);
      v27 = v6;
      v28 = v7;
      objc_msgSend_performBlock_(v21, v22, (uint64_t)v26, v23, v24);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend_responseQueue(self, v13, v14, v15, v16);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC7814;
    block[3] = &unk_24F08A7F8;
    v32 = v7;
    dispatch_async(v25, block);

  }
}

- (void)transformedCloudDatasWithPredicate:(id)a3 transformer:(id)a4 limit:(int64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id location;
  _QWORD block[4];
  id v37;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend_moc(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v11)
    {
      objc_initWeak(&location, self);
      objc_msgSend_moc(self, v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = sub_227DC7E10;
      v30[3] = &unk_24F08BC90;
      objc_copyWeak(&v34, &location);
      v31 = v9;
      v32 = v10;
      v33 = v11;
      objc_msgSend_performBlock_(v25, v26, (uint64_t)v30, v27, v28);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend_responseQueue(self, v17, v18, v19, v20);
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC7DA4;
    block[3] = &unk_24F08A7F8;
    v37 = v11;
    dispatch_async(v29, block);

  }
}

- (void)resolvedCloudDataForCloudData:(id)a3 predicate:(id)a4 completion:(id)a5
{
  objc_msgSend_resolvedCloudDataForCloudData_withResolvers_predicate_completion_(self, a2, (uint64_t)a3, 0, (uint64_t)a4, a5);
}

- (void)resolvedCloudDataForCloudData:(id)a3 withResolvers:(id)a4 predicate:(id)a5 completion:(id)a6
{
  MEMORY[0x24BEDD108](self, sel_resolvedCloudDataForCloudData_withResolvers_mergers_predicate_completion_, a3, 0, 0);
}

- (void)resolvedCloudDataForCloudData:(id)a3 withResolvers:(id)a4 mergers:(id)a5 predicate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  BCCloudDataManager *v53;
  id v54;
  id v55;
  id v56;
  id location;
  _QWORD block[4];
  id v59;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend_moc(self, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_privacyDelegate(self, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPrivacyDelegate_(v12, v27, (uint64_t)v26, v28, v29);

    objc_msgSend_systemFields(v12, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v34, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_initWeak(&location, self);
      objc_msgSend_syncManager(self, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = sub_227DC83F0;
      v50[3] = &unk_24F08BCE0;
      objc_copyWeak(&v56, &location);
      v51 = v15;
      v52 = v13;
      v53 = self;
      v54 = v14;
      v55 = v16;
      objc_msgSend_fetchRecordForRecordID_completion_(v44, v45, (uint64_t)v39, (uint64_t)v50, v46);

      objc_destroyWeak(&v56);
      objc_destroyWeak(&location);
    }
    else
    {
      v48 = _Block_copy(v16);
      v49 = v48;
      if (v48)
        (*((void (**)(void *, _QWORD, _QWORD))v48 + 2))(v48, 0, 0);

    }
  }
  else
  {
    objc_msgSend_responseQueue(self, v22, v23, v24, v25);
    v47 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC8384;
    block[3] = &unk_24F08A7F8;
    v59 = v16;
    dispatch_async(v47, block);

    v39 = v59;
  }

}

- (void)resolveConflictsForRecords:(id)a3 completion:(id)a4
{
  objc_msgSend_resolveConflictsForRecords_withResolvers_completion_(self, a2, (uint64_t)a3, 0, (uint64_t)a4);
}

- (void)resolveConflictsForRecords:(id)a3 withResolvers:(id)a4 completion:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_resolveConflictsForRecords_withResolvers_mergers_completion_, a3, 0, 0);
}

- (void)resolveConflictsForRecords:(id)a3 withResolvers:(id)a4 mergers:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  BCCloudDataManager *v35;
  id v36;
  id v37;
  id v38;
  id location;
  _QWORD block[4];
  id v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_moc(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_initWeak(&location, self);
    objc_msgSend_moc(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = sub_227DC8D94;
    v32[3] = &unk_24F08BD30;
    objc_copyWeak(&v38, &location);
    v33 = v10;
    v34 = v11;
    v35 = self;
    v36 = v12;
    v37 = v13;
    objc_msgSend_performBlock_(v27, v28, (uint64_t)v32, v29, v30);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_responseQueue(self, v19, v20, v21, v22);
    v31 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC8D24;
    block[3] = &unk_24F08A7F8;
    v41 = v13;
    dispatch_async(v31, block);

  }
}

- (void)failedRecordIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  _QWORD block[4];
  id v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend_moc(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_initWeak(&location, self);
    objc_msgSend_moc(self, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = sub_227DC9CF4;
    v26[3] = &unk_24F08A740;
    objc_copyWeak(&v29, &location);
    v27 = v6;
    v28 = v7;
    objc_msgSend_performBlock_(v21, v22, (uint64_t)v26, v23, v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_responseQueue(self, v13, v14, v15, v16);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DC9C88;
    block[3] = &unk_24F08A7F8;
    v32 = v7;
    dispatch_async(v25, block);

  }
}

- (void)fetchCloudDataIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  char *v12;

  v6 = (void *)MEMORY[0x24BDD1758];
  v10 = a4;
  if (a3)
    objc_msgSend_predicateWithValue_(v6, v7, 1, v8, v9);
  else
    objc_msgSend_predicateWithFormat_(v6, v7, (uint64_t)CFSTR("deletedFlag == NO"), v8, v9);
  v12 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudDatasWithPredicate_completion_(self, v12, (uint64_t)v12, (uint64_t)v10, v11);

}

- (id)_fetchHistoryAfterToken:(id)a3 inMoc:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  BDSCloudKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_entityName(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v15;
    v35 = 2114;
    v36 = v8;
    _os_log_impl(&dword_227D4F000, v10, OS_LOG_TYPE_INFO, "BCCloudDataManager %{public}@ getChangesSince _fetchHistoryAfterToken: %{public}@", buf, 0x16u);

  }
  objc_msgSend_fetchHistoryAfterToken_(MEMORY[0x24BDBB710], v16, (uint64_t)v8, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResultType_(v19, v20, 5, v21, v22);
  objc_msgSend_setFetchBatchSize_(v19, v23, 1024, v24, v25);
  v32 = 0;
  objc_msgSend_executeRequest_error_(v9, v26, (uint64_t)v19, (uint64_t)&v32, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v32;
  v30 = v29;
  if (a5)
    *a5 = objc_retainAutorelease(v29);

  return v28;
}

- (BOOL)_isTokenInvalidError:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char isEqualToString;
  BOOL v19;

  v3 = a3;
  v8 = objc_msgSend_code(v3, v4, v5, v6, v7);
  v13 = v8 == 134501 || v8 == 134301;
  v19 = 0;
  if (v13)
  {
    objc_msgSend_domain(v3, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v14, v15, *MEMORY[0x24BDD0B88], v16, v17);

    if ((isEqualToString & 1) != 0)
      v19 = 1;
  }

  return v19;
}

- (void)getChangesSince:(id)a3 forEntityClass:(Class)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  _QWORD v45[4];
  id v46;
  BCCloudDataManager *v47;
  id v48;
  id v49[2];
  _QWORD block[5];
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend_shared(MEMORY[0x24BE0FC08], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_verboseLoggingEnabled(v14, v15, v16, v17, v18);

  if (v19)
  {
    BDSCloudKitDevelopmentLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_entityName(self, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = v29;
      v54 = 2112;
      v55 = v8;
      _os_log_impl(&dword_227D4F000, v24, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudDataManager %@ getChangesSince cloudSyncVersions:%@\\\"\", buf, 0x16u);

    }
  }
  objc_msgSend_moc(self, v20, v21, v22, v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30 == 0;

  if (v31)
  {
    objc_msgSend_responseQueue(self, v32, v33, v34, v35);
    v44 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DCA4AC;
    block[3] = &unk_24F08A928;
    block[4] = self;
    v51 = v9;
    dispatch_async(v44, block);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    objc_msgSend_moc(self, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = sub_227DCA528;
    v45[3] = &unk_24F08BD58;
    objc_copyWeak(v49, (id *)buf);
    v46 = v8;
    v47 = self;
    v49[1] = a4;
    v48 = v9;
    objc_msgSend_performBlock_(v40, v41, (uint64_t)v45, v42, v43);

    objc_destroyWeak(v49);
    objc_destroyWeak((id *)buf);
  }

}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  _QWORD block[4];
  id v28;

  v4 = a3;
  objc_msgSend_moc(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_msgSend_moc(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227DCAF90;
    v23[3] = &unk_24F0891B8;
    objc_copyWeak(&v25, &location);
    v24 = v4;
    objc_msgSend_performBlock_(v18, v19, (uint64_t)v23, v20, v21);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_responseQueue(self, v10, v11, v12, v13);
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DCAF24;
    block[3] = &unk_24F08A7F8;
    v28 = v4;
    dispatch_async(v22, block);

  }
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BDSCloudKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_entityName(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v10;
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_DEFAULT, "BCCloudDataManager %@ #hasSaltChangedWithCompletion", buf, 0xCu);

  }
  objc_msgSend_moc(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v16)
  {
    objc_msgSend_responseQueue(self, v17, v18, v19, v20);
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DCB6A0;
    block[3] = &unk_24F08A7F8;
    v34 = v4;
    dispatch_async(v29, block);

  }
  else if (v4)
  {
    objc_initWeak((id *)buf, self);
    objc_msgSend_moc(self, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = sub_227DCB75C;
    v30[3] = &unk_24F0891B8;
    objc_copyWeak(&v32, (id *)buf);
    v31 = v4;
    objc_msgSend_performBlock_(v25, v26, (uint64_t)v30, v27, v28);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }

}

- (id)diagnosticDirtyCloudDataInfos
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  _QWORD v18[5];
  id v19;
  id location;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  objc_msgSend_moc(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_227DC5054;
    v25 = sub_227DC5064;
    v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_initWeak(&location, self);
    objc_msgSend_moc(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_227DCBC84;
    v18[3] = &unk_24F08BDA8;
    objc_copyWeak(&v19, &location);
    v18[4] = &v21;
    objc_msgSend_performBlockAndWait_(v11, v12, (uint64_t)v18, v13, v14);

    v15 = (id)v22[5];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    BDSCloudKitLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_227E5EA38();

    v15 = (id)MEMORY[0x24BDBD1A8];
  }
  return v15;
}

- (BDSCloudDataManagerMonitor)monitor
{
  return (BDSCloudDataManagerMonitor *)objc_loadWeakRetained((id *)&self->_monitor);
}

- (void)setMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_monitor, a3);
}

- (void)setMoc:(id)a3
{
  objc_storeWeak((id *)&self->_moc, a3);
}

- (BCCloudDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_responseQueue, a3);
}

- (void)setEntityName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BCCloudDataSyncProvider)syncManager
{
  return (BCCloudDataSyncProvider *)objc_loadWeakRetained((id *)&self->_syncManager);
}

- (void)setSyncManager:(id)a3
{
  objc_storeWeak((id *)&self->_syncManager, a3);
}

- (Class)immutableClass
{
  return self->_immutableClass;
}

- (void)setImmutableClass:(Class)a3
{
  self->_immutableClass = a3;
}

- (Class)mutableClass
{
  return self->_mutableClass;
}

- (void)setMutableClass:(Class)a3
{
  self->_mutableClass = a3;
}

- (void)setPrivacyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_privacyDelegate, a3);
}

- (BOOL)signalDataChangedTransaction
{
  return self->_signalDataChangedTransaction;
}

- (void)setSignalDataChangedTransaction:(BOOL)a3
{
  self->_signalDataChangedTransaction = a3;
}

- (BCCloudKitController)cloudKitController
{
  return (BCCloudKitController *)objc_loadWeakRetained((id *)&self->_cloudKitController);
}

- (void)setCloudKitController:(id)a3
{
  objc_storeWeak((id *)&self->_cloudKitController, a3);
}

- (BCCloudDataMapper)dataMapper
{
  return self->_dataMapper;
}

- (void)setDataMapper:(id)a3
{
  objc_storeStrong((id *)&self->_dataMapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataMapper, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_destroyWeak((id *)&self->_syncManager);
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_moc);
  objc_destroyWeak((id *)&self->_monitor);
}

@end
