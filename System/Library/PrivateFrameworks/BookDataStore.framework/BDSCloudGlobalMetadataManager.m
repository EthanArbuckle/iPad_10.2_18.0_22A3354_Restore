@implementation BDSCloudGlobalMetadataManager

- (void)metadataValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_227D58344;
  v10[3] = &unk_24F08A558;
  v11 = v6;
  v7 = v6;
  objc_msgSend_metadatumForKey_completion_(self, v8, (uint64_t)a3, (uint64_t)v10, v9);

}

- (void)metadatumForKey:(id)a3 completion:(id)a4
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
  void *v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v13, (uint64_t)CFSTR("key = %@  AND (deletedFlag == NULL OR deletedFlag == NO)"), v14, v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_227D582B0;
  v19[3] = &unk_24F08A530;
  v20 = v6;
  v17 = v6;
  objc_msgSend_cloudDataWithPredicate_sortDescriptors_completion_(v12, v18, (uint64_t)v16, 0, (uint64_t)v19);

}

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (BDSCloudGlobalMetadataManager)initWithCloudDataSource:(id)a3
{
  id v5;
  BDSCloudGlobalMetadataManager *v6;
  BDSCloudGlobalMetadataManager *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BCCloudDataSyncManager *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BCCloudDataSyncManager *syncManager;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  BCCloudChangeTokenController *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  BCCloudChangeTokenController *changeTokenController;
  BCCloudDataManager *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  BCCloudDataManager *dataManager;
  BDSSaltVersionIdentifierManager *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  BDSSaltVersionIdentifierManager *saltVersionIdentifierManager;
  objc_super v58;

  v5 = a3;
  v58.receiver = self;
  v58.super_class = (Class)BDSCloudGlobalMetadataManager;
  v6 = -[BDSCloudGlobalMetadataManager init](&v58, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_globalMetadataDataSource, a3);
    objc_msgSend_sharedInstance(BCCloudKitController, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [BCCloudDataSyncManager alloc];
    v17 = objc_msgSend_initWithCloudKitController_(v13, v14, (uint64_t)v12, v15, v16);
    syncManager = v7->_syncManager;
    v7->_syncManager = (BCCloudDataSyncManager *)v17;

    objc_msgSend_setDelegate_(v7->_syncManager, v19, (uint64_t)v7, v20, v21);
    v22 = [BCCloudChangeTokenController alloc];
    objc_msgSend_managedObjectContext(v5, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(BCCloudKitController, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_initWithMOC_zoneName_cloudKitController_(v22, v33, (uint64_t)v27, (uint64_t)CFSTR("GlobalMetadata"), (uint64_t)v32);
    changeTokenController = v7->_changeTokenController;
    v7->_changeTokenController = (BCCloudChangeTokenController *)v34;

    v36 = [BCCloudDataManager alloc];
    objc_msgSend_entityName(v7, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    v45 = objc_msgSend_initWithCloudDataSource_entityName_notificationName_immutableClass_mutableClass_syncManager_cloudKitController_(v36, v44, (uint64_t)v5, (uint64_t)v41, (uint64_t)CFSTR("BDSCloudGlobalMetadataManagerChanged"), v42, v43, v7->_syncManager, v12);
    dataManager = v7->_dataManager;
    v7->_dataManager = (BCCloudDataManager *)v45;

    v47 = [BDSSaltVersionIdentifierManager alloc];
    v48 = (uint64_t)v7->_changeTokenController;
    objc_msgSend_privateCloudDatabaseController(v12, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend_initWithZoneDataManager_tokenController_databaseController_(v47, v54, (uint64_t)v7, v48, (uint64_t)v53);
    saltVersionIdentifierManager = v7->_saltVersionIdentifierManager;
    v7->_saltVersionIdentifierManager = (BDSSaltVersionIdentifierManager *)v55;

  }
  return v7;
}

+ (id)sharedManager
{
  if (qword_253F3C698 != -1)
    dispatch_once(&qword_253F3C698, &unk_24F08A508);
  return (id)qword_253F3C690;
}

- (NSManagedObjectModel)objectModel
{
  NSManagedObjectModel *objectModel;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSManagedObjectModel *v20;
  NSManagedObjectModel *v21;

  objectModel = self->_objectModel;
  if (!objectModel)
  {
    v4 = (void *)MEMORY[0x24BDD1488];
    v5 = objc_opt_class();
    objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_(v9, v10, (uint64_t)CFSTR("BCCloudGlobalMetadata"), (uint64_t)CFSTR("momd"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x24BDBCF48], v13, (uint64_t)v12, 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x24BDBB6B0]);
    v20 = (NSManagedObjectModel *)objc_msgSend_initWithContentsOfURL_(v16, v17, (uint64_t)v15, v18, v19);
    v21 = self->_objectModel;
    self->_objectModel = v20;

    objectModel = self->_objectModel;
  }
  return objectModel;
}

- (BDSCloudGlobalMetadataManager)init
{
  BCCloudDataSource *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  BDSCloudGlobalMetadataManager *v15;

  v3 = [BCCloudDataSource alloc];
  objc_msgSend_objectModel(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithManagedObjectModel_nameOnDisk_(v3, v9, (uint64_t)v8, (uint64_t)CFSTR("BCCloudGlobalMetadata"), v10);

  v15 = (BDSCloudGlobalMetadataManager *)objc_msgSend_initWithCloudDataSource_(self, v12, (uint64_t)v11, v13, v14);
  return v15;
}

- (id)entityName
{
  return CFSTR("BCGlobalMetadatum");
}

- (void)setConflictResolver:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
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
  id v33;

  v33 = a3;
  v6 = a4;
  if ((objc_msgSend_enableCloudSync(self, v7, v8, v9, v10) & 1) == 0)
  {
    objc_msgSend_conflictResolvers(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setConflictResolvers_(self, v21, (uint64_t)v20, v22, v23);

    }
    if (v33)
    {
      v24 = (void *)objc_msgSend_copy(v33, v16, v17, v18, v19);
      v25 = _Block_copy(v24);
      objc_msgSend_conflictResolvers(self, v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v30, v31, (uint64_t)v25, (uint64_t)v6, v32);

    }
  }

}

- (void)removeConflictResolverForKey:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  if ((objc_msgSend_enableCloudSync(self, v4, v5, v6, v7) & 1) == 0)
  {
    objc_msgSend_conflictResolvers(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, 0, (uint64_t)v15, v14);

  }
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_dataManager(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hasSaltChangedWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BCCloudChangeTokenController *changeTokenController;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_dataManager(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  changeTokenController = self->_changeTokenController;
  v16[0] = v9;
  v16[1] = changeTokenController;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v11, (uint64_t)v16, 2, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bds_chainSuccessAndErrorCompletionSelectorCallsForSelector_completion_(v13, v14, (uint64_t)sel_dissociateCloudDataFromSyncWithCompletion_, (uint64_t)v4, v15);

}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_deleteCloudDataWithCompletion_(BCCloudDataSource, a2, (uint64_t)a3, v3, v4);
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (objc_msgSend_enableCloudSync(self, v7, v8, v9, v10))
  {
    objc_msgSend_dataManager(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startSyncToCKWithSyncManager_completion_(v15, v16, (uint64_t)v19, (uint64_t)v6, v17);
  }
  else
  {
    v18 = _Block_copy(v6);
    v15 = v18;
    if (v18)
      (*((void (**)(void *))v18 + 2))(v18);
  }

}

- (void)signalSyncToCKForSyncManager:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  id v27;

  if (objc_msgSend_enableCloudSync(self, a2, (uint64_t)a3, v3, v4))
  {
    objc_msgSend_sharedInstance(BCCloudKitController, v6, v7, v8, v9);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transactionManager(v27, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entityName(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_syncManager(self, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v14, v25, (uint64_t)v19, (uint64_t)v24, v26);

  }
}

- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12))
  {
    v17 = (void *)MEMORY[0x24BDBCEB8];
    v18 = objc_msgSend_count(v7, v13, v14, v15, v16);
    objc_msgSend_arrayWithCapacity_(v17, v19, v18, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v23 = v7;
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v25)
    {
      v30 = v25;
      v31 = *(_QWORD *)v42;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(v23);
          objc_msgSend_recordName(*(void **)(*((_QWORD *)&v41 + 1) + 8 * v32), v26, v27, v28, v29, (_QWORD)v41);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v22, v34, (uint64_t)v33, v35, v36);

          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v30);
    }

    objc_msgSend_removeMetadataForSaltedHashedRecordIDs_completion_(self, v37, (uint64_t)v22, (uint64_t)v8, v38);
  }
  else
  {
    v39 = _Block_copy(v8);
    v40 = v39;
    if (v39)
      (*((void (**)(void *, _QWORD, _QWORD))v39 + 2))(v39, 0, 0);

  }
}

- (void)syncManager:(id)a3 fetchedAllRecordsInZone:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;

  v19 = a4;
  if (objc_msgSend_enableCloudSync(self, v5, v6, v7, v8)
    && objc_msgSend_isEqualToString_(v19, v9, (uint64_t)CFSTR("GlobalMetadata"), v10, v11))
  {
    objc_msgSend_defaultCenter(MEMORY[0x24BDD1530], v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postNotificationName_object_(v16, v17, (uint64_t)CFSTR("BDSCloudGlobalMetadataManagerFetchedRecordsChanged"), 0, v18);

  }
}

- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12))
  {
    v17 = (void *)MEMORY[0x24BDBCED8];
    v18 = objc_msgSend_count(v7, v13, v14, v15, v16);
    objc_msgSend_dictionaryWithCapacity_(v17, v19, v18, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v23 = v7;
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v25)
    {
      v30 = v25;
      v31 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(v23);
          v33 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend_key(v33, v26, v27, v28, v29, (_QWORD)v41);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v22, v35, (uint64_t)v33, (uint64_t)v34, v36);

        }
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v30);
    }

    objc_msgSend_updateSyncGenerationFromCloudData_completion_(self, v37, (uint64_t)v22, (uint64_t)v8, v38);
  }
  else
  {
    v39 = _Block_copy(v8);
    v40 = v39;
    if (v39)
      (*((void (**)(void *, _QWORD, _QWORD))v39 + 2))(v39, 0, 0);

  }
}

- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12))
  {
    objc_msgSend_dataManager(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_conflictResolvers(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = sub_227D99E7C;
    v26[3] = &unk_24F08A200;
    v27 = v8;
    objc_msgSend_resolveConflictsForRecords_withResolvers_completion_(v17, v23, (uint64_t)v7, (uint64_t)v22, (uint64_t)v26);

  }
  else
  {
    v24 = _Block_copy(v8);
    v25 = v24;
    if (v24)
      (*((void (**)(void *, _QWORD, _QWORD))v24 + 2))(v24, 0, 0);

  }
}

- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12))
  {
    objc_msgSend_dataManager(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D99FB8;
    v22[3] = &unk_24F08A228;
    v23 = v8;
    objc_msgSend_failedRecordIDs_completion_(v17, v18, (uint64_t)v7, (uint64_t)v22, v19);

  }
  else
  {
    v20 = _Block_copy(v8);
    v21 = v20;
    if (v20)
      (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);

  }
}

- (void)setEnableCloudSync:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  const char *v20;
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
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  BCCloudDataSyncManager *syncManager;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
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
  const char *v55;
  uint64_t v56;
  int v57;
  const __CFString *v58;
  uint64_t v59;

  v5 = a3;
  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_shared(MEMORY[0x24BE0FC08], a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_verboseLoggingEnabled(v7, v8, v9, v10, v11);

  if (v12)
  {
    BDSCloudKitDevelopmentLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("NO");
      if (v5)
        v18 = CFSTR("YES");
      v57 = 138412290;
      v58 = v18;
      _os_log_impl(&dword_227D4F000, v17, OS_LOG_TYPE_DEFAULT, "\"\\\"BDSCloudGlobalMetadataManager #enableCloudSync setEnableCloudSync %@\\\"\", (uint8_t *)&v57, 0xCu);
    }

  }
  if (self->_enableCloudSync != v5)
  {
    self->_enableCloudSync = v5;
    objc_msgSend_changeTokenController(self, v13, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEnableCloudSync_(v19, v20, v5, v21, v22);

    objc_msgSend_sharedInstance(BCCloudKitController, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateCloudDatabaseController(v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v32;
    syncManager = self->_syncManager;
    if (v5)
    {
      objc_msgSend_addObserver_recordType_(v32, v33, (uint64_t)syncManager, (uint64_t)CFSTR("globalMetadata"), v34);

      objc_msgSend_sharedInstance(BCCloudKitController, v37, v38, v39, v40);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transactionManager(v27, v41, v42, v43, v44);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_entityName(self, v45, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_syncManager(self, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v35, v55, (uint64_t)v49, (uint64_t)v54, v56);

    }
    else
    {
      objc_msgSend_removeObserver_recordType_(v32, v33, (uint64_t)syncManager, (uint64_t)CFSTR("globalMetadata"), v34);
    }

  }
}

- (void)currentCloudSyncVersions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_dataManager(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentCloudSyncVersions_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)setMetadatum:(id)a3 completion:(id)a4
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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend_key(v7, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v12, v18, (uint64_t)CFSTR("key = %@"), v19, v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCloudData_predicate_completion_(v23, v22, (uint64_t)v7, (uint64_t)v21, (uint64_t)v6);

}

- (void)setMetadata:(id)a3 completion:(id)a4
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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend_allKeys(v7, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v12, v18, (uint64_t)CFSTR("key IN %@"), v19, v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCloudData_predicate_propertyIDKey_completion_(v23, v22, (uint64_t)v7, (uint64_t)v21, (uint64_t)CFSTR("key"), v6);

}

- (void)removeMetadataForSaltedHashedRecordIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_count(v6, v8, v9, v10, v11))
  {
    objc_msgSend_dataManager(self, v12, v13, v14, v15);
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v17, (uint64_t)CFSTR("saltedHashedID IN %@"), v18, v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeCloudDataForPredicate_completion_(v16, v21, (uint64_t)v20, (uint64_t)v7, v22);

  }
  else
  {
    BDSCloudKitLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_227E5BCF4(v23);

    v16 = (void (**)(_QWORD, _QWORD, _QWORD))_Block_copy(v7);
    if (v16)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v24, (uint64_t)CFSTR("BDSErrorDomain"), 1003, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v16)[2](v16, 0, v25);

    }
  }

}

- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4
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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend_allKeys(v7, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v12, v18, (uint64_t)CFSTR("key IN %@"), v19, v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateSyncGenerationFromCloudData_predicate_propertyIDKey_completion_(v23, v22, (uint64_t)v7, (uint64_t)v21, (uint64_t)CFSTR("key"), v6);

}

- (void)deleteMetadatumForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v12, (uint64_t)CFSTR("key = %@"), v13, v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_deleteCloudDataForPredicate_completion_(v18, v16, (uint64_t)v15, (uint64_t)v6, v17);
}

- (void)metadatumIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v8 = a5;
  v13 = a4;
  if (v6)
  {
    objc_msgSend_dataManager(self, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v15, (uint64_t)CFSTR("key = %@"), v16, v17, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_227D9A6C8;
    v20[3] = &unk_24F08A530;
    v21 = v8;
    objc_msgSend_cloudDataWithPredicate_sortDescriptors_completion_(v14, v19, (uint64_t)v18, 0, (uint64_t)v20);

    v13 = v21;
  }
  else
  {
    objc_msgSend_metadatumForKey_completion_(self, v9, (uint64_t)v13, (uint64_t)v8, v12);
  }

}

- (void)fetchMetadataIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  v6 = a4;
  objc_msgSend_dataManager(self, v7, v8, v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchCloudDataIncludingDeleted_completion_(v13, v11, v4, (uint64_t)v6, v12);

}

- (void)getMetadataChangesSince:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  objc_msgSend_getChangesSince_forEntityClass_completion_(v14, v13, (uint64_t)v7, v12, (uint64_t)v6);

}

- (void)resolvedMetadataValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BCMutableGlobalMetadatum *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  void *v26;
  id v27;
  const char *v28;
  _QWORD v29[4];
  id v30;

  v6 = a4;
  v7 = a3;
  v8 = [BCMutableGlobalMetadatum alloc];
  v12 = (void *)objc_msgSend_initWithKey_(v8, v9, (uint64_t)v7, v10, v11);
  objc_msgSend_dataManager(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conflictResolvers(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v23, (uint64_t)CFSTR("key = %@"), v24, v25, v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = sub_227D9A948;
  v29[3] = &unk_24F08A530;
  v30 = v6;
  v27 = v6;
  objc_msgSend_resolvedCloudDataForCloudData_withResolvers_predicate_completion_(v17, v28, (uint64_t)v12, (uint64_t)v22, (uint64_t)v26, v29);

}

- (void)setMetadataValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BDSCloudGlobalMetadataManager *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_227D9AAB8;
  v16[3] = &unk_24F08A580;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v20 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  objc_msgSend_metadatumForKey_completion_(self, v14, (uint64_t)v13, (uint64_t)v16, v15);

}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (BCCloudDataSource)globalMetadataDataSource
{
  return self->_globalMetadataDataSource;
}

- (void)setGlobalMetadataDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_globalMetadataDataSource, a3);
}

- (BCCloudDataSyncManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
  objc_storeStrong((id *)&self->_syncManager, a3);
}

- (void)setDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataManager, a3);
}

- (void)setObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_objectModel, a3);
}

- (BCCloudChangeTokenController)changeTokenController
{
  return self->_changeTokenController;
}

- (void)setChangeTokenController:(id)a3
{
  objc_storeStrong((id *)&self->_changeTokenController, a3);
}

- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager
{
  return self->_saltVersionIdentifierManager;
}

- (void)setSaltVersionIdentifierManager:(id)a3
{
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, a3);
}

- (NSMutableDictionary)conflictResolvers
{
  return self->_conflictResolvers;
}

- (void)setConflictResolvers:(id)a3
{
  objc_storeStrong((id *)&self->_conflictResolvers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictResolvers, 0);
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, 0);
  objc_storeStrong((id *)&self->_changeTokenController, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_globalMetadataDataSource, 0);
}

@end
