@implementation BCCloudDataSyncManager

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BCCloudDataSyncManager)initWithCloudKitController:(id)a3 dataMapper:(id)a4
{
  id v7;
  id v8;
  BCCloudDataSyncManager *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *syncQueue;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BCCloudDataSyncManager;
  v9 = -[BCCloudDataSyncManager init](&v15, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = dispatch_queue_create("com.apple.iBooks.CloudDataSyncManager", v11);
    syncQueue = v9->_syncQueue;
    v9->_syncQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_cloudKitController, a3);
    objc_storeStrong((id *)&v9->_dataMapper, a4);
    v9->_tooBigBatch = 400;

  }
  return v9;
}

- (BCCloudDataSyncManager)initWithCloudKitController:(id)a3
{
  return (BCCloudDataSyncManager *)((uint64_t (*)(BCCloudDataSyncManager *, char *, id, _QWORD))MEMORY[0x24BEDD108])(self, sel_initWithCloudKitController_dataMapper_, a3, 0);
}

- (void)syncCloudData:(id)a3 completion:(id)a4
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
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend_cloudKitController(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateCloudDatabaseController(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227DB0144;
    v23[3] = &unk_24F08B2F8;
    v23[4] = self;
    objc_copyWeak(&v26, &location);
    v24 = v6;
    v25 = v7;
    objc_msgSend_getAttached_(v17, v18, (uint64_t)v23, v19, v20);

    objc_destroyWeak(&v26);
  }
  else
  {
    v21 = _Block_copy(v7);
    v22 = v21;
    if (v21)
      (*((void (**)(void *))v21 + 2))(v21);

  }
  objc_destroyWeak(&location);

}

- (void)fetchRecordForRecordID:(id)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void (**v19)(void *, _QWORD);
  id v20;

  v20 = a3;
  v6 = a4;
  objc_msgSend_cloudKitController(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateCloudDatabaseController(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_fetchRecordForRecordID_completion_(v16, v17, (uint64_t)v20, (uint64_t)v6, v18);
  }
  else
  {
    v19 = (void (**)(void *, _QWORD))_Block_copy(v6);

    if (v19)
      v19[2](v19, 0);
    v6 = v19;
  }

}

- (void)databaseController:(id)a3 attachmentChanged:(BOOL)a4
{
  uint64_t v4;
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;

  if (a4)
  {
    objc_msgSend_cloudKitController(self, a2, (uint64_t)a3, a4, v4);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transactionManager(v23, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_delegate(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entityName(v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v10, v21, (uint64_t)v20, (uint64_t)self, v22);

  }
}

- (void)databaseController:(id)a3 reachabilityChanged:(BOOL)a4
{
  uint64_t v4;
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;

  if (a4)
  {
    objc_msgSend_cloudKitController(self, a2, (uint64_t)a3, a4, v4);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transactionManager(v23, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_delegate(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entityName(v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v10, v21, (uint64_t)v20, (uint64_t)self, v22);

  }
}

- (void)databaseController:(id)a3 recordsChanged:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _QWORD v12[5];

  v5 = a4;
  objc_msgSend_delegate(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_227DB0594;
  v12[3] = &unk_24F08B220;
  v12[4] = self;
  objc_msgSend_syncManager_resolveConflictsForRecords_completion_(v10, v11, (uint64_t)self, (uint64_t)v5, (uint64_t)v12);

}

- (void)databaseController:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, (uint64_t)v16, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_syncManager_removeCloudDataForIDs_completion_(v11, v15, (uint64_t)self, (uint64_t)v14, (uint64_t)&unk_24F08B318);
}

- (void)databaseController:(id)a3 fetchedAllRecordsInZone:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;

  v18 = a4;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend_delegate(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_syncManager_fetchedAllRecordsInZone_(v15, v16, (uint64_t)self, (uint64_t)v18, v17);

  }
}

- (id)privacyDelegate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_cloudKitController(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateCloudDatabaseController(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)startSyncToCKWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend_syncQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_227DB08B4;
  v11[3] = &unk_24F08A928;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)signalSyncToCK
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_delegate(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalSyncToCKForSyncManager_(v9, v6, (uint64_t)self, v7, v8);

}

- (unint64_t)_maxCloudDataPerBatch
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v5 = objc_msgSend_tooBigBatch(self, a2, v2, v3, v4);
  if (v5 >> 1 <= 1)
    return 1;
  else
    return v5 >> 1;
}

- (id)_batchFromCloudData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  v9 = objc_msgSend__maxCloudDataPerBatch(self, v5, v6, v7, v8);
  v16 = v4;
  if (objc_msgSend_count(v4, v10, v11, v12, v13) > v9)
  {
    objc_msgSend_subarrayWithRange_(v4, v14, 0, v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)_fromBatch:(id)a3 getRecordsToSave:(id *)a4 recordIDsToDelete:(id *)a5 buildingMap:(id *)a6
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t buf[4];
  void *v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v8, v9, v10, v11);
  v103 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v12, v13, v14, v15);
  v102 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v21 = v7;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v104, (uint64_t)v110, 16);
  if (v23)
  {
    v28 = v23;
    v29 = *(_QWORD *)v105;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v105 != v29)
          objc_enumerationMutation(v21);
        v31 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v30);
        if (objc_msgSend_deletedFlag(v31, v24, v25, v26, v27))
        {
          objc_msgSend_systemFields(v31, v32, v33, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v36;
          if (v36)
          {
            objc_msgSend_recordID(v36, v37, v38, v39, v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v20, v43, (uint64_t)v42, v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (v46)
            {
              BDSCloudKitLog();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v109 = v31;
                v52 = v51;
                v53 = "BCCloudDataSyncManager: cloudDataMap already contans an entry for deleting %@";
                goto LABEL_22;
              }
            }
            else
            {
              objc_msgSend_recordID(v41, v47, v48, v49, v50);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v20, v83, (uint64_t)v31, (uint64_t)v82, v84);

              objc_msgSend_recordID(v41, v85, v86, v87, v88);
              v51 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v102, v89, (uint64_t)v51, v90, v91);
            }
LABEL_24:

            goto LABEL_25;
          }
          BDSCloudKitLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_DWORD *)buf = 138412290;
          v109 = v31;
          v52 = v51;
          v53 = "BCCloudDataSyncManager: Unable to retrieve systemFields from %@";
LABEL_22:
          _os_log_error_impl(&dword_227D4F000, v52, OS_LOG_TYPE_ERROR, v53, buf, 0xCu);
          goto LABEL_24;
        }
        objc_msgSend_dataMapper(self, v32, v33, v34, v35);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          objc_msgSend_dataMapper(self, v55, v56, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordFromCloudData_(v59, v60, (uint64_t)v31, v61, v62);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v41)
            goto LABEL_19;
        }
        else
        {
          objc_msgSend_configuredRecordFromAttributes(v31, v55, v56, v57, v58);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v41)
          {
LABEL_19:
            objc_msgSend_privacyDelegate(v31, v63, v64, v65, v66);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend_establishedSalt(v76, v77, v78, v79, v80);

            if (!v81)
              goto LABEL_25;
            BDSCloudKitLog();
            v51 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              goto LABEL_24;
            *(_DWORD *)buf = 138412290;
            v109 = v31;
            v52 = v51;
            v53 = "BCCloudDataSyncManager: Unable to configure CKRecord to save from %@";
            goto LABEL_22;
          }
        }
        objc_msgSend_recordID(v41, v63, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v20, v68, (uint64_t)v67, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (v71)
        {
          BDSCloudKitLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_DWORD *)buf = 138412290;
          v109 = v31;
          v52 = v51;
          v53 = "BCCloudDataSyncManager: cloudDataMap already contans an entry for saving %@";
          goto LABEL_22;
        }
        objc_msgSend_recordID(v41, v72, v73, v74, v75);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v20, v93, (uint64_t)v31, (uint64_t)v92, v94);

        objc_msgSend_addObject_(v103, v95, (uint64_t)v41, v96, v97);
LABEL_25:

        ++v30;
      }
      while (v28 != v30);
      v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v104, (uint64_t)v110, 16);
      v28 = v98;
    }
    while (v98);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v103);
  if (a5)
    *a5 = objc_retainAutorelease(v102);
  if (a6)
    *a6 = objc_retainAutorelease(v20);

}

- (void)_enterDispatchGroup:(id)a3 times:(unint64_t)a4
{
  unint64_t v4;

  if (a4)
  {
    v4 = a4;
    do
    {
      dispatch_group_enter((dispatch_group_t)a3);
      --v4;
    }
    while (v4);
  }
}

- (void)_leaveDispatchGroup:(id)a3 times:(unint64_t)a4
{
  unint64_t v4;

  if (a4)
  {
    v4 = a4;
    do
    {
      dispatch_group_leave((dispatch_group_t)a3);
      --v4;
    }
    while (v4);
  }
}

- (void)_updateRetryParametersFromModifyRecordsOperationError:(id)a3 batchSize:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int isEqualToString;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;

  v57 = a3;
  objc_msgSend_syncQueue(self, v6, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend_domain(v57, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x24BDB8EA8], v17, v18);

  v20 = v57;
  if (isEqualToString)
  {
    objc_opt_class();
    objc_msgSend_userInfo(v57, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v25, v26, *MEMORY[0x24BDB8EB8], v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v30, v31, v32, v33, v34);
    v36 = v35;

    if (v36 <= 0.0)
    {
      v41 = objc_msgSend_code(v57, v37, v38, v39, v40);
      if ((unint64_t)(v41 - 6) >= 2)
      {
        if (v41 == 27)
        {
          v53 = objc_msgSend_tooBigBatch(self, v42, v43, v44, v45);
          if (v53 >= a4)
            objc_msgSend_setTooBigBatch_(self, v54, a4, v55, v56);
          else
            objc_msgSend_setTooBigBatch_(self, v54, v53, v55, v56);
          v36 = 0.0;
          goto LABEL_13;
        }
        v46 = v41 == 23;
        v20 = v57;
        if (!v46)
          goto LABEL_15;
      }
      objc_msgSend_backOffInterval(self, v42, v43, v44, v45);
      v36 = 5.0;
      if (v47 >= 5.0)
      {
        objc_msgSend_backOffInterval(self, v37, v38, v39, v40);
        objc_msgSend_setBackOffInterval_(self, v49, v50, v51, v52, v48 + v48);
LABEL_14:
        v20 = v57;
        goto LABEL_15;
      }
    }
LABEL_13:
    objc_msgSend_setBackOffInterval_(self, v37, v38, v39, v40, v36);
    goto LABEL_14;
  }
LABEL_15:

}

- (id)_modifyRecordsCompletionBlockWithDispatchGroup:(id)a3 cloudDataMap:(id)a4 recordCount:(unint64_t)a5 operation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD aBlock[4];
  id v19;
  id v20;
  id v21;
  BCCloudDataSyncManager *v22;
  id v23[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_227DB12F0;
  aBlock[3] = &unk_24F08B408;
  objc_copyWeak(v23, &location);
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = self;
  v23[1] = (id)a5;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = _Block_copy(aBlock);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  return v16;
}

- (void)_syncQueueSyncForCloudData:(id)a3 completion:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
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
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
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
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  id v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  id v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  void *v110;
  void *v111;
  BOOL v112;
  void *v113;
  id v114;
  void *v115;
  id aBlock;
  id v117;
  _QWORD block[5];
  id v119;
  id v120;
  BOOL v121;
  id v122;
  id v123;
  id v124;
  uint8_t buf[4];
  void *v126;
  __int16 v127;
  void *v128;
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  v117 = a3;
  aBlock = a4;
  objc_msgSend_setProcessingCloudData_(self, v6, 1, v7, v8);
  objc_msgSend_cloudKitController(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateCloudDatabaseController(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_database(v18, v19, v20, v21, v22);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    objc_msgSend__batchFromCloudData_(self, v24, (uint64_t)v117, v25, v26);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_count(v115, v27, v28, v29, v30);
    v112 = v31 < objc_msgSend_count(v117, v32, v33, v34, v35);
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = v40;
    v124 = v45;
    v122 = v50;
    objc_msgSend__fromBatch_getRecordsToSave_recordIDsToDelete_buildingMap_(self, v51, (uint64_t)v115, (uint64_t)&v124, (uint64_t)&v123, &v122);
    v52 = v124;

    v53 = v123;
    v114 = v122;

    v58 = objc_msgSend_count(v52, v54, v55, v56, v57);
    v63 = objc_msgSend_count(v53, v59, v60, v61, v62) + v58;
    objc_msgSend__enterDispatchGroup_times_(self, v64, (uint64_t)v23, v63, v65);
    if (v63)
    {
      v66 = objc_alloc(MEMORY[0x24BDB9158]);
      v69 = (void *)objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v66, v67, (uint64_t)v52, (uint64_t)v53, v68);
      objc_msgSend_bds_defaultConfiguration(MEMORY[0x24BDB9188], v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setConfiguration_(v69, v75, (uint64_t)v74, v76, v77);

      objc_msgSend_setSavePolicy_(v69, v78, 0, v79, v80);
      objc_msgSend__modifyRecordsCompletionBlockWithDispatchGroup_cloudDataMap_recordCount_operation_(self, v81, (uint64_t)v23, (uint64_t)v114, v63, v69);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setModifyRecordsCompletionBlock_(v69, v83, (uint64_t)v82, v84, v85);

      BDSCloudKitLog();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_delegate(self, v87, v88, v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_entityName(v91, v92, v93, v94, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationID(v69, v97, v98, v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v126 = v96;
        v127 = 2114;
        v128 = v101;
        _os_log_impl(&dword_227D4F000, v86, OS_LOG_TYPE_DEFAULT, "Adding CKModifyRecordsOperation to database for: %{public}@.  Operation ID: %{public}@", buf, 0x16u);

      }
      objc_msgSend_addOperation_(v113, v102, (uint64_t)v69, v103, v104);

    }
    objc_initWeak((id *)buf, self);
    objc_msgSend_syncQueue(self, v105, v106, v107, v108);
    v109 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DB2E84;
    block[3] = &unk_24F08B430;
    objc_copyWeak(&v120, (id *)buf);
    v121 = v112;
    block[4] = self;
    v119 = aBlock;
    dispatch_group_notify(v23, v109, block);

    dispatch_group_leave(v23);
    objc_destroyWeak(&v120);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    objc_msgSend_setProcessingCloudData_(self, v19, 0, v21, v22);
    v110 = _Block_copy(aBlock);
    v111 = v110;
    if (v110)
      (*((void (**)(void *))v110 + 2))(v110);

  }
}

- (BCCloudDataSyncManagerDelegate)delegate
{
  return (BCCloudDataSyncManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BCCloudKitController)cloudKitController
{
  return self->_cloudKitController;
}

- (void)setCloudKitController:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitController, a3);
}

- (BCCloudDataMapper)dataMapper
{
  return self->_dataMapper;
}

- (void)setDataMapper:(id)a3
{
  objc_storeStrong((id *)&self->_dataMapper, a3);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (BOOL)processingCloudData
{
  return self->_processingCloudData;
}

- (void)setProcessingCloudData:(BOOL)a3
{
  self->_processingCloudData = a3;
}

- (double)backOffInterval
{
  return self->_backOffInterval;
}

- (void)setBackOffInterval:(double)a3
{
  self->_backOffInterval = a3;
}

- (unint64_t)tooBigBatch
{
  return self->_tooBigBatch;
}

- (void)setTooBigBatch:(unint64_t)a3
{
  self->_tooBigBatch = a3;
}

- (BOOL)serverPushPostponed
{
  return self->_serverPushPostponed;
}

- (void)setServerPushPostponed:(BOOL)a3
{
  self->_serverPushPostponed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_dataMapper, 0);
  objc_storeStrong((id *)&self->_cloudKitController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
