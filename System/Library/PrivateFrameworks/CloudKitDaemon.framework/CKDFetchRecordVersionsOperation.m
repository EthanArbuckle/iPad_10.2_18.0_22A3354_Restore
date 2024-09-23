@implementation CKDFetchRecordVersionsOperation

- (CKDFetchRecordVersionsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchRecordVersionsOperation *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *desiredKeys;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  dispatch_group_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKDFetchRecordVersionsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v33, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordIDs(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordIDs_(v9, v11, (uint64_t)v10);

    objc_msgSend_desiredKeys(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14
      && (v17 = (void *)v14,
          objc_msgSend_desiredKeys(v6, v15, v16),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend_count(v18, v19, v20),
          v18,
          v17,
          !v21))
    {
      v34[0] = *MEMORY[0x1E0C94A00];
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v34, 1);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_desiredKeys(v6, v15, v16);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    desiredKeys = v9->_desiredKeys;
    v9->_desiredKeys = (NSArray *)v22;

    objc_msgSend_minimumVersionETag(v6, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMinimumVersionETag_(v9, v27, (uint64_t)v26);

    v28 = dispatch_group_create();
    objc_msgSend_setFetchVersionsGroup_(v9, v29, (uint64_t)v28);

    v9->_shouldFetchAssetContent = objc_msgSend_shouldFetchAssetContent(v6, v30, v31);
  }

  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-record-versions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (CKDDecryptRecordsOperation)recordDecryptOperation
{
  CKDFetchRecordVersionsOperation *v2;
  const char *v3;
  uint64_t v4;
  CKDDecryptRecordsOperation *decryptOperation;
  void *v6;
  uint64_t v7;
  const char *v8;
  _QWORD v10[5];

  v2 = self;
  objc_sync_enter(v2);
  decryptOperation = v2->_decryptOperation;
  if (!decryptOperation || objc_msgSend_isFinished(decryptOperation, v3, v4))
  {
    v6 = (void *)objc_opt_new();
    v7 = objc_opt_class();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1BEC04B1C;
    v10[3] = &unk_1E782E508;
    v10[4] = v2;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v2, v8, v7, v6, v10);

  }
  objc_sync_exit(v2);

  return v2->_decryptOperation;
}

- (void)finishDecryption
{
  const char *v2;
  uint64_t v3;
  CKDDecryptRecordsOperation *decryptOperation;
  const char *v5;
  uint64_t v6;
  CKDFetchRecordVersionsOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  decryptOperation = obj->_decryptOperation;
  if (decryptOperation && (objc_msgSend_isFinished(decryptOperation, v2, v3) & 1) == 0)
    objc_msgSend_finishDecryption(obj->_decryptOperation, v5, v6);
  objc_sync_exit(obj);

}

- (void)_handleRecordVersionsFetchedForID:(id)a3 isDeleted:(BOOL)a4 versions:(id)a5 responseCode:(id)a6
{
  const char *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  const __CFString *v55;
  void *v56;
  _BOOL4 v57;
  id v58;
  id v59;
  id v60;
  id obj;
  _QWORD v63[5];
  id v64;
  id v65;
  uint64_t *v66;
  BOOL v67;
  _QWORD block[4];
  id v69;
  id v70;
  CKDFetchRecordVersionsOperation *v71;
  uint64_t *v72;
  id v73;
  BOOL v74;
  _QWORD v75[4];
  id v76;
  NSObject *v77;
  uint64_t *v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  _BYTE v90[128];
  _BYTE location[12];
  __int16 v92;
  id v93;
  __int16 v94;
  const __CFString *v95;
  uint64_t v96;

  v57 = a4;
  v96 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v58 = a5;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = sub_1BE9BB1A0;
  v88 = sub_1BE9BAE78;
  v89 = 0;
  v59 = a6;
  v10 = objc_msgSend_code(v59, v8, v9);
  if (v60 && v10 == 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v54 = objc_msgSend_count(v58, v12, v13);
      v55 = CFSTR("false");
      *(_DWORD *)location = 134218498;
      *(_QWORD *)&location[4] = v54;
      v92 = 2114;
      if (v57)
        v55 = CFSTR("true");
      v93 = v60;
      v94 = 2114;
      v95 = v55;
      _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Fetched %ld versions for record with ID %{public}@ (is deleted: %{public}@)", location, 0x20u);
    }

    if (objc_msgSend_count(v58, v14, v15))
    {
      objc_msgSend_fetchVersionsGroup(self, v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v18);

      objc_initWeak((id *)location, self);
      v19 = dispatch_group_create();
      v20 = (void *)objc_opt_new();
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      obj = v58;
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v80, v90, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v81 != v23)
              objc_enumerationMutation(obj);
            v25 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
            dispatch_group_enter(v19);
            objc_msgSend_recordDecryptOperation(self, v26, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v75[0] = MEMORY[0x1E0C809B0];
            v75[1] = 3221225472;
            v75[2] = sub_1BEC05310;
            v75[3] = &unk_1E7837808;
            objc_copyWeak(&v79, (id *)location);
            v76 = v20;
            v78 = &v84;
            v77 = v19;
            objc_msgSend_decryptRecord_withCompletion_(v28, v29, v25, v75);

            objc_destroyWeak(&v79);
          }
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v80, v90, 16);
        }
        while (v22);
      }

      dispatch_get_global_queue(0, 0);
      v31 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEC0555C;
      block[3] = &unk_1E7837858;
      objc_copyWeak(&v73, (id *)location);
      v32 = v60;
      v74 = v57;
      v69 = v32;
      v70 = v20;
      v72 = &v84;
      v71 = self;
      v33 = v20;
      dispatch_group_notify(v19, v31, block);

      objc_destroyWeak(&v73);
      objc_destroyWeak((id *)location);
      goto LABEL_21;
    }
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0C94FF8];
    v35 = sub_1BEB10D5C(v59);
    objc_msgSend_request(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v38, v59);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v59, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v34, v46, *MEMORY[0x1E0C94B20], v35, v39, CFSTR("Error fetching versions for record %@ from server: %@"), v60, v45);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v85[5];
    v85[5] = v47;

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v49 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v56 = (void *)v85[5];
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v60;
      v92 = 2112;
      v93 = v56;
      _os_log_debug_impl(&dword_1BE990000, v49, OS_LOG_TYPE_DEBUG, "Failed to fetch versions for record %@: %@", location, 0x16u);
    }
  }
  objc_msgSend_recordVersionFetchedBlock(self, v16, v17);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend_callbackQueue(self, v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = sub_1BEC0569C;
    v63[3] = &unk_1E7837830;
    v63[4] = self;
    v64 = v60;
    v67 = v57;
    v65 = v58;
    v66 = &v84;
    dispatch_async(v53, v63);

  }
LABEL_21:
  _Block_object_dispose(&v84, 8);

}

- (int)operationType
{
  return 212;
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  CKDFetchRecordVersionsRequest *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t AssetContent;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id from;
  id location;

  objc_msgSend_recordIDs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v9 = [CKDFetchRecordVersionsRequest alloc];
    objc_msgSend_recordIDs(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_desiredKeys(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minimumVersionETag(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend_initWithOperation_recordIDs_desiredKeys_minimumVersionETag_(v9, v19, (uint64_t)self, v12, v15, v18);

    AssetContent = objc_msgSend_shouldFetchAssetContent(self, v21, v22);
    objc_msgSend_setShouldFetchAssetContent_(v20, v24, AssetContent);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v20);
    v25 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1BEC05934;
    v36[3] = &unk_1E7837880;
    objc_copyWeak(&v37, &location);
    objc_msgSend_setRecordVersionsFetchedBlock_(v20, v26, (uint64_t)v36);
    v33[0] = v25;
    v33[1] = 3221225472;
    v33[2] = sub_1BEC059BC;
    v33[3] = &unk_1E782E468;
    objc_copyWeak(&v34, &location);
    objc_copyWeak(&v35, &from);
    objc_msgSend_setCompletionBlock_(v20, v27, (uint64_t)v33);
    objc_msgSend_setRequest_(self, v28, (uint64_t)v20);
    objc_msgSend_container(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v31, v32, (uint64_t)v20);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend_finishWithError_(self, v8, 0);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  objc_super v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  CKDFetchRecordVersionsOperation *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v23 = v5;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v38 = v25;
    v39 = 2048;
    v40 = self;
    v41 = 2114;
    v42 = v28;
    v43 = 2112;
    v44 = v4;
    _os_log_debug_impl(&dword_1BE990000, v23, OS_LOG_TYPE_DEBUG, "Fetch record versions operation <%{public}@: %p; %{public}@> finished with error %@",
      buf,
      0x2Au);

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend_recordIDs(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v32, v36, 16);
  if (v11)
  {
    v14 = v11;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v9);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v32 + 1) + 8 * i), v12, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v6, v18, (uint64_t)v17);

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v32, v36, 16);
    }
    while (v14);
  }

  if (objc_msgSend_count(v6, v19, v20))
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1BEC05D48;
    v30[3] = &unk_1E78305B0;
    v31 = v6;
    objc_msgSend_updateCloudKitMetrics_(self, v22, (uint64_t)v30);

  }
  objc_msgSend_setRecordVersionFetchedBlock_(self, v21, 0);
  v29.receiver = self;
  v29.super_class = (Class)CKDFetchRecordVersionsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v29, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)relevantZoneIDs
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordIDs(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v3, v4, v5))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v3;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v18, v22, 16);
    if (v9)
    {
      v12 = v9;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v7);
          objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v18 + 1) + 8 * v14), v10, v11, (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend_addObject_(v6, v15, (uint64_t)v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v18, v22, 16);
      }
      while (v12);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)recordVersionFetchedBlock
{
  return self->_recordVersionFetchedBlock;
}

- (void)setRecordVersionFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDs, a3);
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredKeys, a3);
}

- (NSString)minimumVersionETag
{
  return self->_minimumVersionETag;
}

- (void)setMinimumVersionETag:(id)a3
{
  objc_storeStrong((id *)&self->_minimumVersionETag, a3);
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (OS_dispatch_group)fetchVersionsGroup
{
  return self->_fetchVersionsGroup;
}

- (void)setFetchVersionsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_fetchVersionsGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchVersionsGroup, 0);
  objc_storeStrong((id *)&self->_minimumVersionETag, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_recordVersionFetchedBlock, 0);
  objc_storeStrong((id *)&self->_decryptOperation, 0);
}

@end
