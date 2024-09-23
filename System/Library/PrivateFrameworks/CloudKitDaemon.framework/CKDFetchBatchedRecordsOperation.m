@implementation CKDFetchBatchedRecordsOperation

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (void)setRecordFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_recordFetcher, a3);
}

- (void)setNumRequestsSent:(unint64_t)a3
{
  self->_numRequestsSent = a3;
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (CKDRecordFetchAggregator)recordFetcher
{
  return self->_recordFetcher;
}

- (unint64_t)numRequestsSent
{
  return self->_numRequestsSent;
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t AssetContents;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  int NewestChangesFirst;
  const char *v52;
  uint64_t v53;
  unsigned int v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  _QWORD block[5];
  _QWORD v75[5];
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  id location;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  objc_msgSend__noteOperationBeginning(self, a2, v2);
  objc_initWeak(&location, self);
  v4 = (void *)objc_opt_new();
  AssetContents = objc_msgSend_shouldFetchAssetContents(self, v5, v6);
  objc_msgSend_setFetchAssetContents_(v4, v8, AssetContents);
  objc_msgSend_setFetchMergeableValues_(v4, v9, 0);
  objc_msgSend_setPreserveOrdering_(v4, v10, 0);
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v4, v14, (uint64_t)v13);

  v17 = objc_msgSend_forcePCSDecryptionAttempt(self, v15, v16);
  objc_msgSend_setForceDecryptionAttempt_(v4, v18, v17);
  v72 = (void *)objc_opt_new();
  if ((objc_msgSend_shouldFetchAssetContents(self, v19, v20) & 1) == 0)
  {
    objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allValues(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = sub_1BEBD8D88;
    v81[3] = &unk_1E7836C20;
    v82 = v72;
    objc_msgSend_enumerateObjectsUsingBlock_(v26, v27, (uint64_t)v81);

  }
  if (objc_msgSend_count(v72, v21, v22))
    objc_msgSend_setDesiredAssetKeys_(self, v28, (uint64_t)v72);
  objc_msgSend_set(MEMORY[0x1E0C99E20], v28, v29);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend_recordZoneIDs(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v77, v84, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v78;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v78 != v37)
          objc_enumerationMutation(v32);
        v39 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v38);
        objc_msgSend_configurationsByRecordZoneID(self, v34, v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v40, v41, v39);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v43 = v42;
            objc_msgSend_desiredKeys(v43, v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (v46)
            {
              objc_msgSend_desiredKeys(v43, v47, v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObjectsFromArray_(v73, v50, (uint64_t)v49);

            }
            NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(v43, v47, v48);
            v54 = objc_msgSend_preserveOrdering(v4, v52, v53);
            objc_msgSend_setPreserveOrdering_(v4, v55, NewestChangesFirst | v54);

          }
        }

        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v77, v84, 16);
    }
    while (v36);
  }

  objc_msgSend_setDesiredKeys_(v4, v56, (uint64_t)v73);
  v57 = objc_opt_class();
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = sub_1BE9C4DC4;
  v75[3] = &unk_1E7830A10;
  v75[4] = self;
  objc_copyWeak(&v76, &location);
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v58, v57, v4, v75);
  objc_msgSend_recordZoneIDs(self, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configurationsByRecordZoneID(self, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sendFetchChangesRequestForZoneIDs_withOptions_previousRequestSchedulerInfo_(self, v65, (uint64_t)v61, v64, 0);

  objc_msgSend_fetchRecordsGroup(self, v66, v67);
  v68 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_qualityOfService(self, v69, v70);
  CKGetGlobalQueue();
  v71 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBD8E84;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_group_notify(v68, v71, block);

  objc_destroyWeak(&v76);
  objc_destroyWeak(&location);
}

- (CKDFetchBatchedRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchBatchedRecordsOperation *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *recordZoneIDs;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSDictionary *configurationsByRecordZoneID;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSDictionary *assetTransferOptionsByRecordTypeAndKey;
  const char *v24;
  uint64_t v25;
  dispatch_group_t v26;
  OS_dispatch_group *fetchRecordsGroup;
  const char *v28;
  uint64_t v29;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKDFetchBatchedRecordsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v31, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    v9->_shouldFetchAssetContents = objc_msgSend_shouldFetchAssetContents(v6, v7, v8);
    v9->_fetchAllChanges = objc_msgSend_fetchAllChanges(v6, v10, v11);
    objc_msgSend_recordZoneIDs(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    recordZoneIDs = v9->_recordZoneIDs;
    v9->_recordZoneIDs = (NSArray *)v14;

    objc_msgSend_configurationsByRecordZoneID(v6, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    configurationsByRecordZoneID = v9->_configurationsByRecordZoneID;
    v9->_configurationsByRecordZoneID = (NSDictionary *)v18;

    objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v6, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    assetTransferOptionsByRecordTypeAndKey = v9->_assetTransferOptionsByRecordTypeAndKey;
    v9->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v22;

    v9->_errorReportingStyle = objc_msgSend_errorReportingStyle(v6, v24, v25);
    v9->_numRequestsSent = 0;
    v26 = dispatch_group_create();
    fetchRecordsGroup = v9->_fetchRecordsGroup;
    v9->_fetchRecordsGroup = (OS_dispatch_group *)v26;

    v9->_forcePCSDecryptionAttempt = objc_msgSend_forcePCSDecryptionAttempt(v6, v28, v29);
  }

  return v9;
}

- (BOOL)forcePCSDecryptionAttempt
{
  return self->_forcePCSDecryptionAttempt;
}

- (OS_dispatch_group)fetchRecordsGroup
{
  return self->_fetchRecordsGroup;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (NSSet)desiredAssetKeys
{
  return self->_desiredAssetKeys;
}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)_sendFetchChangesRequestForZoneIDs:(id)a3 withOptions:(id)a4 previousRequestSchedulerInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  char v26;
  NSObject *v27;
  id v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  const char *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id location;
  uint8_t v58[128];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v13 = v11;
    *(_DWORD *)buf = 134218242;
    v60 = objc_msgSend_count(v8, v14, v15);
    v61 = 2112;
    v62 = v9;
    _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Fetching changes from the server for %lu zones with options:\n%@", buf, 0x16u);

  }
  objc_msgSend__createAndConfigureURLRequestForZoneIDs_optionsByZoneID_(self, v12, (uint64_t)v8, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v19);
  if (!objc_msgSend_fetchAllChanges(self, v20, v21)
    || (objc_msgSend_request(self, v22, v23),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = v24 == 0,
        v24,
        v25))
  {
    v26 = 0;
  }
  else
  {
    objc_msgSend_suspendCallbackQueue(v16, v22, v23);
    v26 = 1;
  }
  objc_msgSend_fetchRecordsGroup(self, v22, v23);
  v27 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v27);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v28 = v8;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v53, v58, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v54;
    while (1)
    {
      if (*(_QWORD *)v54 != v33)
        objc_enumerationMutation(v28);
      objc_msgSend_perRequestGroup(v16, v30, v31);
      v34 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v34);

      if (!--v32)
      {
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v30, (uint64_t)&v53, v58, 16);
        if (!v32)
          break;
      }
    }
  }

  if (v10)
  {
    objc_msgSend_perRequestGroup(v10, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = (uint64_t)dispatch_group_create();
  }
  v38 = (void *)v37;
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = sub_1BE9C66FC;
  v47[3] = &unk_1E7836BF8;
  objc_copyWeak(&v50, (id *)buf);
  objc_copyWeak(&v51, &location);
  v39 = v16;
  v48 = v39;
  v40 = v38;
  v49 = v40;
  v52 = v26;
  objc_msgSend_setCompletionBlock_(v19, v41, (uint64_t)v47);
  objc_msgSend_setRequest_(self, v42, (uint64_t)v19);
  objc_msgSend_container(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v45, v46, (uint64_t)v19);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v50);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

- (void)_handleFetchChangesRequestFinishedWithSchedulerInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  id v9;

  v4 = a3;
  objc_msgSend_request(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequest_(v4, v7, 0);
  objc_msgSend__noteCompletedURLRequest_withSchedulerInfo_(self, v8, (uint64_t)v9, v4);

}

- (void)_handleChangedRecords:(id)a3 perRequestSchedulerInfo:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  dispatch_once_t *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  const char *v39;
  __int128 v40;
  id obj;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  CKDFetchBatchedRecordsOperation *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v42 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v6;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v48, v54, 16);
  if (v11)
  {
    v13 = *(_QWORD *)v49;
    v14 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    *(_QWORD *)&v12 = 138412290;
    v40 = v12;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v15);
        objc_msgSend_recordID(v16, v9, v10, v40);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend_record(v16, v17, v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v42, v21, (uint64_t)v20, v19);

        }
        objc_msgSend_fetchRecordsGroup(self, v17, v18);
        v22 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v22);

        objc_msgSend_perRequestCallbackGroup(v7, v23, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v25);

        if (*v14 != -1)
          dispatch_once(v14, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v26 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v27 = v26;
          objc_msgSend_recordID(v16, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ckShortDescription(v30, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v40;
          v53 = v33;
          _os_log_debug_impl(&dword_1BE990000, v27, OS_LOG_TYPE_DEBUG, "Handling record response for record %@", buf, 0xCu);

        }
        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v48, v54, 16);
    }
    while (v11);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend_recordFetcher(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = sub_1BEBD7CF0;
  v43[3] = &unk_1E7836B80;
  v37 = v7;
  v44 = v37;
  objc_copyWeak(&v47, (id *)buf);
  v38 = v42;
  v45 = v38;
  v46 = self;
  objc_msgSend_fetchRecords_withPerRecordCompletion_(v36, v39, (uint64_t)obj, v43);

  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend_recordZoneIDs(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v10, v11, v12))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1BE9C26E4;
    v17[3] = &unk_1E78305B0;
    v18 = v10;
    objc_msgSend_updateCloudKitMetrics_(self, v15, (uint64_t)v17);

  }
  objc_msgSend__noteOperationFinishedBlockEnd(self, v13, v14);
  v16.receiver = self;
  v16.super_class = (Class)CKDFetchBatchedRecordsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v16, sel__finishOnCallbackQueueWithError_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_recordFetcher, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong((id *)&self->_desiredAssetKeys, 0);
  objc_storeStrong((id *)&self->_fetchRecordsGroup, 0);
}

- (id)relevantZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)_handleRecordDelete:(id)a3 recordType:(id)a4 perRequestSchedulerInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  dispatch_block_t v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, v10);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBD8678;
  block[3] = &unk_1E7836BA8;
  objc_copyWeak(&v36, &location);
  block[4] = self;
  v11 = v8;
  v34 = v11;
  v12 = v9;
  v35 = v12;
  v13 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  objc_msgSend_addPerRequestCallbackBlock_(v10, v14, (uint64_t)v13);
  if (objc_msgSend_isEqualToString_(v12, v15, *MEMORY[0x1E0C94A88]))
    objc_msgSend_setPCSData_forFetchedShareID_(self, v16, 0, v11);
  else
    objc_msgSend_setPCSData_forFetchedRecordID_(self, v16, 0, v11);
  objc_msgSend_container(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordCache(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_databaseScope(self, v23, v24);
  objc_msgSend_deleteRecordWithID_scope_(v22, v26, (uint64_t)v11, v25);

  objc_msgSend_perRequestCallbackGroup(v10, v27, v28);
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_perRequestCallbackQueue(v10, v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v29, v32, v13);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

- (void)_handleAttributesChangedForZone:(id)a3 perRequestSchedulerInfo:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  dispatch_block_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  CKDFetchBatchedRecordsOperation *v22;
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend__processZonePCSChanges_(self, v8, (uint64_t)v6);
  objc_initWeak(&location, v7);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = sub_1BEBD8814;
  v21 = &unk_1E782E530;
  objc_copyWeak(&v24, &location);
  v22 = self;
  v9 = v6;
  v23 = v9;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v18);
  objc_msgSend_addPerRequestCallbackBlock_(v7, v11, (uint64_t)v10, v18, v19, v20, v21, v22);
  objc_msgSend_perRequestCallbackGroup(v7, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_perRequestCallbackQueue(v7, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v14, v17, v10);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)_processZonePCSChanges:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKDApplyZoneAttributeChangesOperationInfo *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend_protectionData(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_length(v7, v8, v9);

  if (v10)
  {
    v11 = [CKDApplyZoneAttributeChangesOperationInfo alloc];
    v13 = (void *)objc_msgSend_initWithZone_(v11, v12, (uint64_t)v4);
    v14 = objc_opt_class();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1BEBD8938;
    v16[3] = &unk_1E782E508;
    v17 = v4;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v15, v14, v13, v16);

  }
}

- (id)_possiblyWrapError:(id)a3 forRecordWithID:(id)a4 withCode:(int64_t)a5 format:(id)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  id v18;
  void *v19;
  id v20;
  const char *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if ((CKShouldWrapErrorFetchingRecords() & 1) == 0)
  {
    v18 = v9;
    goto LABEL_5;
  }
  if (CKCanRetryForError())
  {
    v14 = (void *)MEMORY[0x1E0C94FF8];
    v15 = *MEMORY[0x1E0C94B20];
    v16 = objc_msgSend_code(v9, v12, v13);
    objc_msgSend_errorWithDomain_code_error_format_(v14, v17, v15, v16, v9, CFSTR("Encountered a transient error fetching record %@. Please try again."), v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v19 = v18;
    goto LABEL_9;
  }
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v23 = (void *)objc_msgSend_initWithFormat_arguments_(v20, v21, (uint64_t)v11, &v26);
  if (v9)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v22, (uint64_t)CFSTR("%@: %@"), v23, v9);
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v24;
  }
  objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], a5, v9, CFSTR("%@"), v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v19;
}

- (int)operationType
{
  return 0;
}

- (NSString)pipeliningDescription
{
  uint64_t v2;
  void *v5;
  const char *v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 512, CFSTR("Expect subclass to implement"));

  return 0;
}

- (id)activityCreate
{
  uint64_t v2;
  void *v5;
  const char *v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 516, CFSTR("Expect subclass to implement"));

  return 0;
}

- (void)_noteChangedRecordWithID:(id)a3 record:(id)a4 error:(id)a5
{
  const char *v7;
  id v8;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v7, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 520, CFSTR("Expect subclass to implement"));

}

- (void)_noteDeletedRecordWithID:(id)a3 recordType:(id)a4
{
  const char *v6;
  id v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v6, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 523, CFSTR("Expect subclass to implement"));

}

- (void)_noteAttributesChangedForZone:(id)a3
{
  const char *v5;
  id v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 526, CFSTR("Expect subclass to implement"));

}

- (id)_createAndConfigureURLRequestForZoneIDs:(id)a3 optionsByZoneID:(id)a4
{
  void *v6;
  const char *v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 529, CFSTR("Expect subclass to implement"));

  return 0;
}

- (id)_optionsForZonesWithPendingChangesAfterRequest:(id)a3
{
  void *v5;
  const char *v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 533, CFSTR("Expect subclass to implement"));

  return 0;
}

- (void)_noteCompletedURLRequest:(id)a3 withSchedulerInfo:(id)a4
{
  const char *v6;
  id v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v6, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 537, CFSTR("Expect subclass to implement"));

}

- (void)_noteOperationBeginning
{
  uint64_t v2;
  const char *v5;
  id v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 540, CFSTR("Expect subclass to implement"));

}

- (void)_noteOperationEnding
{
  uint64_t v2;
  const char *v5;
  id v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 543, CFSTR("Expect subclass to implement"));

}

- (void)_noteOperationFinishedBlockEnd
{
  uint64_t v2;
  const char *v5;
  id v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, CFSTR("CKDFetchBatchedRecordsOperation.m"), 546, CFSTR("Expect subclass to implement"));

}

- (void)setFetchRecordsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRecordsGroup, a3);
}

- (void)setShouldFetchAssetContents:(BOOL)a3
{
  self->_shouldFetchAssetContents = a3;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (void)setDesiredAssetKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredAssetKeys, a3);
}

- (void)setRecordZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneIDs, a3);
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, a3);
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, a3);
}

- (void)setForcePCSDecryptionAttempt:(BOOL)a3
{
  self->_forcePCSDecryptionAttempt = a3;
}

- (int64_t)errorReportingStyle
{
  return self->_errorReportingStyle;
}

- (void)setErrorReportingStyle:(int64_t)a3
{
  self->_errorReportingStyle = a3;
}

@end
