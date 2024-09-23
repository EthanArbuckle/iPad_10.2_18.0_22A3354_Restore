@implementation CKFetchRecordsOperation

- (CKFetchRecordsOperation)init
{
  CKFetchRecordsOperation *v2;
  uint64_t v3;
  NSMutableDictionary *recordErrors;
  uint64_t v5;
  NSMutableDictionary *recordIDsToRecords;
  uint64_t v7;
  NSMutableSet *packagesToDestroy;
  uint64_t v9;
  NSMutableDictionary *assetInfoByArrayIndexByRecordKeyByRecordID;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKFetchRecordsOperation;
  v2 = -[CKOperation init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordErrors = v2->_recordErrors;
    v2->_recordErrors = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    recordIDsToRecords = v2->_recordIDsToRecords;
    v2->_recordIDsToRecords = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    packagesToDestroy = v2->_packagesToDestroy;
    v2->_packagesToDestroy = (NSMutableSet *)v7;

    v2->_shouldFetchAssetContent = 1;
    v2->_shouldFetchAssetContentInMemory = 0;
    v2->_shouldRequestEncryptedAssetOwnerIdentifier = 0;
    v2->_dropInMemoryAssetContentASAP = 0;
    v9 = objc_opt_new();
    assetInfoByArrayIndexByRecordKeyByRecordID = v2->_assetInfoByArrayIndexByRecordKeyByRecordID;
    v2->_assetInfoByArrayIndexByRecordKeyByRecordID = (NSMutableDictionary *)v9;

  }
  return v2;
}

- (CKFetchRecordsOperation)initWithRecordIDs:(NSArray *)recordIDs
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKFetchRecordsOperation *v8;
  NSArray *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  CKException *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  const char *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = recordIDs;
  v8 = (CKFetchRecordsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v8)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v4;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v29, (uint64_t)v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v23 = [CKException alloc];
            v24 = *MEMORY[0x1E0C99778];
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (id)objc_msgSend_initWithName_format_(v23, v27, v24, (uint64_t)CFSTR("Unexpected recordID passed to %@: %@"), v26, v15, (_QWORD)v29);

            objc_exception_throw(v28);
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v16, (uint64_t)&v29, (uint64_t)v33, 16);
      }
      while (v12);
    }

    v20 = objc_msgSend_copy(v9, v17, v18, v19);
    v21 = v8->_recordIDs;
    v8->_recordIDs = (NSArray *)v20;

  }
  return v8;
}

+ (CKFetchRecordsOperation)fetchCurrentUserRecordOperation
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_setIsFetchCurrentUserOperation_(v2, v3, 1, v4);
  return (CKFetchRecordsOperation *)v2;
}

- (void)setPerRecordProgressBlock:(void *)perRecordProgressBlock
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = perRecordProgressBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7CC08C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordProgressBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perRecordProgressBlock;
    self->_perRecordProgressBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perRecordProgressBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A7CC234;
    v16 = sub_18A7CC25C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7CC264;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordProgressBlock);
  }
  return v8;
}

- (void)setPerRecordCompletionBlock:(void *)perRecordCompletionBlock
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = perRecordCompletionBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7CC3C0;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perRecordCompletionBlock;
    self->_perRecordCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perRecordCompletionBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A7CC234;
    v16 = sub_18A7CC25C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7CC568;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordCompletionBlock);
  }
  return v8;
}

- (void)setPerRecordETagMatchedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perRecordETagMatchedBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7CC6C4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perRecordETagMatchedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordETagMatchedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perRecordETagMatchedBlock = self->_perRecordETagMatchedBlock;
    self->_perRecordETagMatchedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perRecordETagMatchedBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A7CC234;
    v16 = sub_18A7CC25C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7CC86C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordETagMatchedBlock);
  }
  return v8;
}

- (void)setFetchRecordsCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id fetchRecordsCompletionBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7CC9C8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    fetchRecordsCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchRecordsCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    fetchRecordsCompletionBlock = self->_fetchRecordsCompletionBlock;
    self->_fetchRecordsCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)fetchRecordsCompletionBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A7CC234;
    v16 = sub_18A7CC25C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7CCB70;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordsCompletionBlock);
  }
  return v8;
}

- (void)setFetchRecordsCompletionBlock:(void *)fetchRecordsCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = fetchRecordsCompletionBlock == 0;
  v9 = fetchRecordsCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setFetchRecordsCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

}

- (void)fillOutOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t CurrentUserOperation;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t AssetContent;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t shouldRequestEncryptedAssetOwnerIdentifier;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t AssetContentInMemory;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t shouldCloneFileInAssetCache;
  const char *v81;
  uint64_t v82;
  objc_super v83;

  v4 = a3;
  objc_msgSend_recordIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDs_(v4, v9, (uint64_t)v8, v10);

  CurrentUserOperation = objc_msgSend_isFetchCurrentUserOperation(self, v11, v12, v13);
  objc_msgSend_setIsFetchCurrentUserOperation_(v4, v15, CurrentUserOperation, v16);
  objc_msgSend_desiredKeys(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(v4, v21, (uint64_t)v20, v22);

  objc_msgSend_recordIDsToETags(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToETags_(v4, v27, (uint64_t)v26, v28);

  objc_msgSend_recordIDsToVersionETags(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToVersionETags_(v4, v33, (uint64_t)v32, v34);

  objc_msgSend_desiredPackageFileIndices(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredPackageFileIndices_(v4, v39, (uint64_t)v38, v40);

  AssetContent = objc_msgSend_shouldFetchAssetContent(self, v41, v42, v43);
  objc_msgSend_setShouldFetchAssetContent_(v4, v45, AssetContent, v46);
  shouldRequestEncryptedAssetOwnerIdentifier = objc_msgSend_shouldRequestEncryptedAssetOwnerIdentifier(self, v47, v48, v49);
  objc_msgSend_setShouldRequestEncryptedAssetOwnerIdentifier_(v4, v51, shouldRequestEncryptedAssetOwnerIdentifier, v52);
  AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v53, v54, v55);
  objc_msgSend_setShouldFetchAssetContentInMemory_(v4, v57, AssetContentInMemory, v58);
  v62 = objc_msgSend_dropInMemoryAssetContentASAP(self, v59, v60, v61);
  objc_msgSend_setDropInMemoryAssetContentASAP_(v4, v63, v62, v64);
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v4, v69, (uint64_t)v68, v70);

  objc_msgSend_webSharingIdentityDataByRecordID(self, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWebSharingIdentityDataByRecordID_(v4, v75, (uint64_t)v74, v76);

  shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v77, v78, v79);
  objc_msgSend_setShouldCloneFileInAssetCache_(v4, v81, shouldCloneFileInAssetCache, v82);
  v83.receiver = self;
  v83.super_class = (Class)CKFetchRecordsOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v83, sel_fillOutOperationInfo_, v4);

}

- (void)fillFromOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t CurrentUserOperation;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t AssetContent;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t AssetContentInMemory;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t shouldRequestEncryptedAssetOwnerIdentifier;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t shouldCloneFileInAssetCache;
  const char *v85;
  uint64_t v86;
  objc_super v87;

  v87.receiver = self;
  v87.super_class = (Class)CKFetchRecordsOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v87, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordIDs(v4, v5, v6, v7, v87.receiver, v87.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDs_(self, v9, (uint64_t)v8, v10);

  CurrentUserOperation = objc_msgSend_isFetchCurrentUserOperation(v4, v11, v12, v13);
  objc_msgSend_setIsFetchCurrentUserOperation_(self, v15, CurrentUserOperation, v16);
  objc_msgSend_desiredKeys(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(self, v21, (uint64_t)v20, v22);

  objc_msgSend_recordIDsToETags(v4, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToETags_(self, v27, (uint64_t)v26, v28);

  objc_msgSend_recordIDsToVersionETags(v4, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToVersionETags_(self, v33, (uint64_t)v32, v34);

  objc_msgSend_desiredPackageFileIndices(v4, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredPackageFileIndices_(self, v39, (uint64_t)v38, v40);

  AssetContent = objc_msgSend_shouldFetchAssetContent(v4, v41, v42, v43);
  objc_msgSend_setShouldFetchAssetContent_(self, v45, AssetContent, v46);
  AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(v4, v47, v48, v49);
  objc_msgSend_setShouldFetchAssetContentInMemory_(self, v51, AssetContentInMemory, v52);
  shouldRequestEncryptedAssetOwnerIdentifier = objc_msgSend_shouldRequestEncryptedAssetOwnerIdentifier(v4, v53, v54, v55);
  objc_msgSend_setShouldRequestEncryptedAssetOwnerIdentifier_(self, v57, shouldRequestEncryptedAssetOwnerIdentifier, v58);
  v62 = objc_msgSend_dropInMemoryAssetContentASAP(v4, v59, v60, v61);
  objc_msgSend_setDropInMemoryAssetContentASAP_(self, v63, v62, v64);
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v4, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend_copy(v68, v69, v70, v71);
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(self, v73, (uint64_t)v72, v74);

  objc_msgSend_webSharingIdentityDataByRecordID(v4, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWebSharingIdentityDataByRecordID_(self, v79, (uint64_t)v78, v80);

  shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v4, v81, v82, v83);
  objc_msgSend_setShouldCloneFileInAssetCache_(self, v85, shouldCloneFileInAssetCache, v86);
}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CKFetchRecordsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v21, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perRecordProgressBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_perRecordCompletionBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_perRecordETagMatchedBlock(self, v11, v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend_fetchRecordsCompletionBlock(self, v15, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v19 != 0;

      }
    }

  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  BOOL v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  BOOL v36;
  objc_class *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v46;

  objc_msgSend_recordIDs(self, a2, (uint64_t)a3, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else if ((objc_msgSend_isFetchCurrentUserOperation(self, v10, v11, v12) & 1) == 0)
  {
    if (a3)
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("property recordIDs must not be nil for %@"), v38);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  objc_msgSend_perRecordCompletionBlock(self, v13, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = 0;
    goto LABEL_8;
  }
  objc_msgSend_perRecordETagMatchedBlock(self, v16, v17, v18);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v4 = (void *)v21;
    v20 = 0;
    goto LABEL_8;
  }
  objc_msgSend_perRecordProgressBlock(self, v16, v17, v18);
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v5 = (void *)v40;
    v4 = 0;
    v20 = 1;
LABEL_8:
    v25 = 0;
    v26 = 0;
    if ((objc_msgSend_isFetchCurrentUserOperation(self, v16, v17, v18) & 1) != 0)
      goto LABEL_12;
    goto LABEL_9;
  }
  objc_msgSend_fetchRecordsCompletionBlock(self, v16, v17, v18);
  v42 = objc_claimAutoreleasedReturnValue();
  if (!v42)
    return 0;
  v6 = (void *)v42;
  if (!objc_msgSend_isFetchCurrentUserOperation(self, v43, v44, v45))
  {
    v5 = 0;
    v4 = 0;
    v25 = 1;
    v20 = 1;
LABEL_9:
    objc_msgSend_recordIDs(self, v22, v23, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v27, v28, v29, v30) == 0;

    if (v25)
    {

      if ((v20 & 1) == 0)
      {
LABEL_14:
        if (!v19)

        if (!v26)
          goto LABEL_17;
        return 0;
      }
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    if (!v20)
      goto LABEL_14;
    goto LABEL_13;
  }

LABEL_17:
  objc_msgSend_desiredKeys(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  CKValidateIndexedArrayKeys(v34, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v35);
  }
  else
  {
    v46.receiver = self;
    v46.super_class = (Class)CKFetchRecordsOperation;
    v36 = -[CKDatabaseOperation CKOperationShouldRun:](&v46, sel_CKOperationShouldRun_, a3);
  }

  return v36;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchRecordsOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isFetchCurrentUserOperation(self, a2, v2, v3))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v5 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v6 = v5;
      objc_msgSend_operationID(self, v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_debug_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_DEBUG, "Fetching current user record with operation %{public}@", buf, 0xCu);
LABEL_11:

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v11 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v6 = v11;
      objc_msgSend_operationID(self, v12, v13, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIDs(self, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2112;
      v23 = v18;
      _os_log_debug_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_DEBUG, "Fetching records with operation %{public}@ recordIDs=%@", buf, 0x16u);

      goto LABEL_11;
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CKFetchRecordsOperation;
  -[CKOperation performCKOperation](&v19, sel_performCKOperation);
}

- (BOOL)claimPackagesInRecord:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  char v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[5];
  CKFetchRecordsOperation *v24;

  v6 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_18A7CD5D8;
  v23[4] = sub_18A7CD5E8;
  v24 = self;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_18A7CD5D8;
  v17 = sub_18A7CD5E8;
  v18 = 0;
  v11[5] = &v13;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A7CD5F0;
  v12[3] = &unk_1E1F626E8;
  v12[4] = v23;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A7CD62C;
  v11[3] = &unk_1E1F62710;
  v11[4] = &v19;
  objc_msgSend_claimPackagesWithSuccessBlock_failureBlock_completionBlock_(v6, v7, (uint64_t)v12, (uint64_t)v11, 0);
  if (a4)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a4 = objc_retainAutorelease(v8);
  }
  v9 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

  return v9;
}

- (void)handleFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CKSignpost *signpost;
  CKSignpost *v16;
  const char *v17;
  uint64_t v18;
  CKSignpost *v19;
  CKSignpost *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  CKSignpost *v25;
  CKSignpost *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  uint32_t v34;
  CKSignpost *v35;
  CKSignpost *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  CKSignpost *v40;
  CKSignpost *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  _BOOL4 v54;
  void *v55;
  const char *v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void (**v81)(void *, id);
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t i;
  void *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  id v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t j;
  void *v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  NSObject *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  void *context;
  id v155;
  id v156;
  uint64_t v157;
  void (**v158)(void *, id, id, uint64_t);
  CKFetchRecordsOperation *v159;
  uint64_t v160;
  void *v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  id v170;
  _QWORD v171[5];
  _BYTE v172[128];
  uint8_t v173[128];
  uint8_t buf[4];
  id v175;
  __int16 v176;
  uint64_t v177;
  __int16 v178;
  id v179;
  __int16 v180;
  uint64_t v181;
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend_CKClientSuitableError(v11, v12, v13, v14);
  v159 = self;
  v160 = objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v16 = signpost;

  if (v160)
  {
    if (v16)
    {
      if (self)
        v19 = self->super.super._signpost;
      else
        v19 = 0;
      v20 = v19;
      objc_msgSend_log(v20, v21, v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();

      if (self)
        v25 = self->super.super._signpost;
      else
        v25 = 0;
      v26 = v25;
      v30 = objc_msgSend_identifier(v26, v27, v28, v29);

      if ((unint64_t)(v30 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24))
        goto LABEL_21;
      *(_DWORD *)buf = 138412546;
      v175 = v9;
      v176 = 2112;
      v177 = v160;
      v31 = "Record %@ fetched with error: %@";
      v32 = v24;
      v33 = v30;
      v34 = 22;
LABEL_20:
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v32, OS_SIGNPOST_EVENT, v33, "CKFetchRecordsOperation", v31, buf, v34);
LABEL_21:

    }
  }
  else if (v16)
  {
    if (self)
      v35 = self->super.super._signpost;
    else
      v35 = 0;
    v36 = v35;
    objc_msgSend_log(v36, v37, v38, v39);
    v24 = objc_claimAutoreleasedReturnValue();

    if (self)
      v40 = self->super.super._signpost;
    else
      v40 = 0;
    v41 = v40;
    v45 = objc_msgSend_identifier(v41, v42, v43, v44);

    if ((unint64_t)(v45 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24))
      goto LABEL_21;
    *(_DWORD *)buf = 138412290;
    v175 = v9;
    v31 = "Record %@ fetched";
    v32 = v24;
    v33 = v45;
    v34 = 12;
    goto LABEL_20;
  }
  v171[0] = MEMORY[0x1E0C809B0];
  v171[1] = 3221225472;
  v171[2] = sub_18A7CE0A4;
  v171[3] = &unk_1E1F645F0;
  v171[4] = self;
  objc_msgSend_countMergeableValueMetrics_(v10, v17, (uint64_t)v171, v18);
  if (v10 && !v160)
  {
    v170 = 0;
    v49 = objc_msgSend_claimPackagesInRecord_error_(self, v46, (uint64_t)v10, (uint64_t)&v170);
    v53 = v170;
    v54 = v53 != 0;
    if (!v49)
      v54 = v53 == 0;
    if (v54)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v50, v51, v52);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v55;
      if (v49)
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, (uint64_t)v159, CFSTR("CKFetchRecordsOperation.m"), 215, CFSTR("Expecting packageClaimError(%@) only on failure (%s)"), v53, "succeeded");
      else
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, (uint64_t)v159, CFSTR("CKFetchRecordsOperation.m"), 215, CFSTR("Expecting packageClaimError(%@) only on failure (%s)"), v53, "failed");

      if ((v49 & 1) != 0)
        goto LABEL_28;
    }
    else if ((v49 & 1) != 0)
    {
LABEL_28:
      v160 = 0;
LABEL_34:

      goto LABEL_35;
    }
    objc_msgSend_CKClientSuitableError(v53, v50, v51, v52);
    v160 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
    goto LABEL_34;
  }
LABEL_35:
  if (v160 || !v10)
  {
    if (objc_msgSend_count(v159->_assetInfoByArrayIndexByRecordKeyByRecordID, v46, v47, v48))
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v69 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v175 = v9;
        v176 = 2112;
        v177 = v160;
        v178 = 2112;
        v179 = v10;
        _os_log_error_impl(&dword_18A5C5000, v69, OS_LOG_TYPE_ERROR, "Ditching assetInfoByArrayIndexByRecordKeyByRecordID recordID %@ error %@ record %@", buf, 0x20u);
      }
    }
  }
  else
  {
    if (__sTestOverridesAvailable)
    {
      objc_msgSend_unitTestOverrides(v159, v46, v47, v48);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v58, v59, (uint64_t)CFSTR("SkipInMemoryAssetSignatureCheck"), v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend_BOOLValue(v61, v62, v63, v64);

    }
    else
    {
      v65 = 0;
    }
    objc_msgSend__wireUpAssetContentForOperation_inRecord_checkSignatures_outError_(CKOperation, v46, (uint64_t)v159, (uint64_t)v10, v65 ^ 1u, 0);
  }
  if (v9)
  {
    if (!v160)
    {
      if (v10)
      {
        if ((objc_msgSend_canDropItemResultsEarly(v159, v66, v67, v68) & 1) != 0)
          goto LABEL_56;
        objc_msgSend_recordIDsToRecords(v159, v66, v67, v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v70, v71, (uint64_t)v10, (uint64_t)v9);
      }
      else
      {
        objc_msgSend_recordIDsToETags(v159, v66, v67, v68);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v72, v73, (uint64_t)v9, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
          goto LABEL_56;
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v66, v67, v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v70, v153, (uint64_t)a2, (uint64_t)v159, CFSTR("CKFetchRecordsOperation.m"), 248, CFSTR("Should have received a record"));
      }

      goto LABEL_56;
    }
    if ((objc_msgSend_canDropItemResultsEarly(v159, v66, v67, v68) & 1) == 0)
    {
      if (v159)
        objc_msgSend_setObject_forKeyedSubscript_(v159->_recordErrors, v66, v160, (uint64_t)v9);
      else
        objc_msgSend_setObject_forKeyedSubscript_(0, v66, v160, (uint64_t)v9);
    }
  }
LABEL_56:
  objc_msgSend_perRecordETagMatchedBlock_wrapper(v159, v66, v67, v68);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v76;
  if (v76)
  {
    v81 = (void (**)(void *, id))_Block_copy(v76);
  }
  else
  {
    objc_msgSend_perRecordETagMatchedBlock(v159, v77, v78, v79);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void (**)(void *, id))_Block_copy(v82);

  }
  v83 = (void *)v160;

  objc_msgSend_perRecordCompletionBlock_wrapper(v159, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v87;
  if (v87)
  {
    v158 = (void (**)(void *, id, id, uint64_t))_Block_copy(v87);
  }
  else
  {
    objc_msgSend_perRecordCompletionBlock(v159, v88, v89, v90);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = (void (**)(void *, id, id, uint64_t))_Block_copy(v92);

  }
  if (v9 && !v160 && !v10 && v81)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v96 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v135 = v96;
      objc_msgSend_operationID(v159, v136, v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordChangeTag(0, v140, v141, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v175 = v139;
      v176 = 2112;
      v177 = (uint64_t)v9;
      v178 = 2112;
      v179 = v143;
      _os_log_debug_impl(&dword_18A5C5000, v135, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about fetched etag-matched record with ID %@ etag=%@", buf, 0x20u);

    }
    v81[2](v81, v9);
    goto LABEL_79;
  }
  if (!v158)
  {
LABEL_78:
    if (!v9)
      goto LABEL_80;
    goto LABEL_79;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v97 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v144 = v97;
    objc_msgSend_operationID(v159, v145, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordChangeTag(v10, v149, v150, v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v175 = v148;
    v176 = 2112;
    v177 = (uint64_t)v9;
    v178 = 2112;
    v179 = v152;
    v180 = 2112;
    v181 = v160;
    _os_log_debug_impl(&dword_18A5C5000, v144, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about fetched record with ID %@ etag=%@: %@", buf, 0x2Au);

  }
  if (objc_msgSend_dropInMemoryAssetContentASAP(v159, v98, v99, v100))
  {
    v101 = (void *)MEMORY[0x18D76DE4C]();
    v158[2](v158, v10, v9, v160);
    objc_autoreleasePoolPop(v101);
    goto LABEL_78;
  }
  v158[2](v158, v10, v9, v160);
  if (v9)
  {
LABEL_79:
    objc_msgSend_configuration(v159, v93, v94, v95);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v102, v103, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleRecordChanged_changeType_record_error_(v106, v107, (uint64_t)v9, 1, v10, v160);

  }
LABEL_80:
  if (objc_msgSend_dropInMemoryAssetContentASAP(v159, v93, v94, v95))
  {
    v155 = v11;
    v157 = (uint64_t)v9;
    context = (void *)MEMORY[0x18D76DE4C]();
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v156 = v10;
    objc_msgSend_valueStore(v10, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allRawValues(v111, v112, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v166, (uint64_t)v173, 16);
    if (v117)
    {
      v118 = v117;
      v119 = *(_QWORD *)v167;
      v161 = v115;
      do
      {
        for (i = 0; i != v118; ++i)
        {
          if (*(_QWORD *)v167 != v119)
            objc_enumerationMutation(v115);
          v121 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_setAssetContent_(v121, v122, 0, v123);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v164 = 0u;
              v165 = 0u;
              v162 = 0u;
              v163 = 0u;
              v125 = v121;
              v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v126, (uint64_t)&v162, (uint64_t)v172, 16);
              if (v127)
              {
                v128 = v127;
                v129 = *(_QWORD *)v163;
                do
                {
                  for (j = 0; j != v128; ++j)
                  {
                    if (*(_QWORD *)v163 != v129)
                      objc_enumerationMutation(v125);
                    v131 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      objc_msgSend_setAssetContent_(v131, v132, 0, v133);
                  }
                  v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v132, (uint64_t)&v162, (uint64_t)v172, 16);
                }
                while (v128);
              }

              v115 = v161;
            }
          }
        }
        v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v124, (uint64_t)&v166, (uint64_t)v173, 16);
      }
      while (v118);
    }

    v9 = (id)v157;
    if (v157)
      objc_msgSend_setObject_forKeyedSubscript_(v159->_assetInfoByArrayIndexByRecordKeyByRecordID, v134, 0, v157);
    objc_autoreleasePoolPop(context);
    v11 = v155;
    v10 = v156;
    v83 = (void *)v160;
  }

}

- (void)handleFetchForRecordID:(id)a3 didProgress:(double)a4
{
  id v6;
  CKSignpost *signpost;
  CKSignpost *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKSignpost *v12;
  CKSignpost *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  CKSignpost *v18;
  CKSignpost *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  os_signpost_id_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void (**v29)(void *, id, double);
  void *v30;
  int v31;
  id v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v8 = signpost;

  if (v8)
  {
    if (self)
      v12 = self->super.super._signpost;
    else
      v12 = 0;
    v13 = v12;
    objc_msgSend_log(v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (self)
      v18 = self->super.super._signpost;
    else
      v18 = 0;
    v19 = v18;
    v23 = objc_msgSend_identifier(v19, v20, v21, v22);

    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v31 = 138412546;
      v32 = v6;
      v33 = 2048;
      v34 = a4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v17, OS_SIGNPOST_EVENT, v23, "CKFetchRecordsOperation", "Record %@ updated progress %f", (uint8_t *)&v31, 0x16u);
    }

  }
  objc_msgSend_perRecordProgressBlock_wrapper(self, v9, v10, v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v24;
  if (v24)
  {
    v29 = (void (**)(void *, id, double))_Block_copy(v24);
  }
  else
  {
    objc_msgSend_perRecordProgressBlock(self, v25, v26, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void (**)(void *, id, double))_Block_copy(v30);

  }
  if (v29)
    v29[2](v29, v6, a4);

}

- (void)handleAssetDataForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 data:(id)a6 offset:(unint64_t)a7
{
  const char *v12;
  const char *v13;
  void *v14;
  id v15;

  v15 = a6;
  objc_msgSend_assetInfoForOperation_recordID_recordKey_arrayIndex_(CKOperation, v12, (uint64_t)self, (uint64_t)a3, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend_writeData_atOffset_(v14, v13, (uint64_t)v15, a7);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  CKSignpost *v9;
  CKSignpost *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  CKSignpost *v15;
  CKSignpost *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  os_signpost_id_t v20;
  unint64_t mergeableValueCount;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  unint64_t mergeableDeltaCount;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  unint64_t assetBackedMergeableDeltaCount;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void (**v80)(void *, void *, void *);
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  NSMutableSet *packagesToDestroy;
  NSMutableSet *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t j;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  NSObject *v107;
  objc_class *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  objc_super v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint8_t v123[128];
  uint8_t buf[4];
  void *v125;
  __int16 v126;
  CKFetchRecordsOperation *v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  id v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v9 = self->super.super._signpost;
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend_log(v10, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    if (self)
      v15 = self->super.super._signpost;
    else
      v15 = 0;
    v16 = v15;
    v20 = objc_msgSend_identifier(v16, v17, v18, v19);

    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v14, OS_SIGNPOST_EVENT, v20, "CKFetchRecordsOperation", "Finishing", buf, 2u);
    }

  }
  if (self)
  {
    mergeableValueCount = self->_mergeableValueCount;
    if (mergeableValueCount)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v7, mergeableValueCount, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationMetric(self, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v26, v27, (uint64_t)v22, (uint64_t)CFSTR("mergeable_valueCount"));

    }
    mergeableDeltaCount = self->_mergeableDeltaCount;
    if (mergeableDeltaCount)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v7, mergeableDeltaCount, v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationMetric(self, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v29, (uint64_t)CFSTR("mergeable_fetchedDeltaCount"));

    }
    assetBackedMergeableDeltaCount = self->_assetBackedMergeableDeltaCount;
    if (assetBackedMergeableDeltaCount)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v7, assetBackedMergeableDeltaCount, v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationMetric(self, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v40, v41, (uint64_t)v36, (uint64_t)CFSTR("mergeable_assetCount"));

    }
  }
  v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  objc_msgSend_recordIDs(self, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v119, (uint64_t)v132, 16);
  if (v48)
  {
    v52 = v48;
    v53 = *(_QWORD *)v120;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v120 != v53)
          objc_enumerationMutation(v46);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v119 + 1) + 8 * i), v49, v50, v51);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v42, v56, (uint64_t)v55, v57);

      }
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v119, (uint64_t)v132, 16);
    }
    while (v52);
  }

  if (objc_msgSend_count(v42, v58, v59, v60))
  {
    objc_msgSend_zoneIDsToZoneNamesString_(self, v61, (uint64_t)v42, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v68, v69, (uint64_t)v64, (uint64_t)CFSTR("zoneNames"));

  }
  if (!v4)
  {
    if (self)
      v70 = objc_msgSend_count(self->_recordErrors, v61, v62, v63);
    else
      v70 = objc_msgSend_count(0, v61, v62, v63);
    if (v70)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v61, v62, v63);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v71;
      if (self)
        objc_msgSend_setObject_forKeyedSubscript_(v71, v72, (uint64_t)self->_recordErrors, (uint64_t)CFSTR("CKPartialErrors"));
      else
        objc_msgSend_setObject_forKeyedSubscript_(v71, v72, 0, (uint64_t)CFSTR("CKPartialErrors"));
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v74, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v73, CFSTR("Failed to fetch some records"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_fetchRecordsCompletionBlock_wrapper(self, v61, v62, v63);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v75;
  if (v75)
  {
    v80 = (void (**)(void *, void *, void *))_Block_copy(v75);
  }
  else
  {
    objc_msgSend_fetchRecordsCompletionBlock(self, v76, v77, v78);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void (**)(void *, void *, void *))_Block_copy(v81);

  }
  if (v80)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v82 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v107 = v82;
      v108 = (objc_class *)objc_opt_class();
      NSStringFromClass(v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v110, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v125 = v109;
      v126 = 2048;
      v127 = self;
      v128 = 2114;
      v129 = v113;
      v130 = 2112;
      v131 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v107, OS_LOG_TYPE_DEBUG, "Calling fetchRecordsCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);

    }
    objc_msgSend_recordIDsToRecords(self, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v87, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2](v80, v86, v90);

    objc_msgSend_setFetchRecordsCompletionBlock_(self, v91, 0, v92);
  }
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  if (self)
    packagesToDestroy = self->_packagesToDestroy;
  else
    packagesToDestroy = 0;
  v94 = packagesToDestroy;
  v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v115, (uint64_t)v123, 16);
  if (v96)
  {
    v100 = v96;
    v101 = *(_QWORD *)v116;
    do
    {
      for (j = 0; j != v100; ++j)
      {
        if (*(_QWORD *)v116 != v101)
          objc_enumerationMutation(v94);
        objc_msgSend_removeDB(*(void **)(*((_QWORD *)&v115 + 1) + 8 * j), v97, v98, v99);
      }
      v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v97, (uint64_t)&v115, (uint64_t)v123, 16);
    }
    while (v100);
  }

  objc_msgSend_setPerRecordProgressBlock_(self, v103, 0, v104);
  objc_msgSend_setPerRecordCompletionBlock_(self, v105, 0, v106);
  v114.receiver = self;
  v114.super_class = (Class)CKFetchRecordsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v114, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)ckSignpostBegin
{
  CKSignpost *signpost;
  CKSignpost *v4;
  CKSignpost *v5;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  CKSignpost *v11;
  CKSignpost *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  os_signpost_id_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v4 = signpost;

  if (v4)
  {
    if (self)
      v5 = self->super.super._signpost;
    else
      v5 = 0;
    v6 = v5;
    objc_msgSend_log(v6, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (self)
      v11 = self->super.super._signpost;
    else
      v11 = 0;
    v12 = v11;
    v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      objc_msgSend_operationID(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_group(self, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupID(v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupName(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationInfo(self, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      CKStringForDiscretionaryNetworkBehavior(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      CKStringForQOS(v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 138413570;
      v55 = v20;
      v56 = 2112;
      v57 = v24;
      v58 = 2112;
      v59 = v32;
      v60 = 2114;
      v61 = v36;
      v62 = 2114;
      v63 = v45;
      v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchRecordsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

    }
  }
}

- (void)ckSignpostEndWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  CKSignpost *v7;
  CKSignpost *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  CKSignpost *v13;
  CKSignpost *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  os_signpost_id_t v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v7 = self->super.super._signpost;
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend_log(v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (self)
      v13 = self->super.super._signpost;
    else
      v13 = 0;
    v14 = v13;
    v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v19 = 138412290;
      v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchRecordsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-records", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v4 = a3;
  CKErrorUserInfoClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleFetchForRecordID_record_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchRecordsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSMutableDictionary)assetInfoByArrayIndexByRecordKeyByRecordID
{
  return self->_assetInfoByArrayIndexByRecordKeyByRecordID;
}

- (void)setAssetInfoByArrayIndexByRecordKeyByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_assetInfoByArrayIndexByRecordKeyByRecordID, a3);
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(NSArray *)recordIDs
{
  objc_setProperty_nonatomic_copy(self, a2, recordIDs, 560);
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
  objc_setProperty_nonatomic_copy(self, a2, desiredKeys, 568);
}

- (id)perRecordProgressBlock_wrapper
{
  return self->_perRecordProgressBlock_wrapper;
}

- (void)setPerRecordProgressBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (id)perRecordCompletionBlock_wrapper
{
  return self->_perRecordCompletionBlock_wrapper;
}

- (void)setPerRecordCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (id)perRecordETagMatchedBlock_wrapper
{
  return self->_perRecordETagMatchedBlock_wrapper;
}

- (void)setPerRecordETagMatchedBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (id)fetchRecordsCompletionBlock_wrapper
{
  return self->_fetchRecordsCompletionBlock_wrapper;
}

- (void)setFetchRecordsCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (BOOL)isFetchCurrentUserOperation
{
  return self->_isFetchCurrentUserOperation;
}

- (void)setIsFetchCurrentUserOperation:(BOOL)a3
{
  self->_isFetchCurrentUserOperation = a3;
}

- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier
{
  return self->_shouldRequestEncryptedAssetOwnerIdentifier;
}

- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3
{
  self->_shouldRequestEncryptedAssetOwnerIdentifier = a3;
}

- (NSDictionary)webSharingIdentityDataByRecordID
{
  return self->_webSharingIdentityDataByRecordID;
}

- (void)setWebSharingIdentityDataByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, a3);
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchAssetContentInMemory = a3;
}

- (BOOL)dropInMemoryAssetContentASAP
{
  return self->_dropInMemoryAssetContentASAP;
}

- (void)setDropInMemoryAssetContentASAP:(BOOL)a3
{
  self->_dropInMemoryAssetContentASAP = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (NSMutableDictionary)recordIDsToRecords
{
  return self->_recordIDsToRecords;
}

- (void)setRecordIDsToRecords:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToRecords, a3);
}

- (NSDictionary)desiredPackageFileIndices
{
  return self->_desiredPackageFileIndices;
}

- (void)setDesiredPackageFileIndices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (NSDictionary)recordIDsToETags
{
  return self->_recordIDsToETags;
}

- (void)setRecordIDsToETags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (NSDictionary)recordIDsToVersionETags
{
  return self->_recordIDsToVersionETags;
}

- (void)setRecordIDsToVersionETags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, 0);
  objc_storeStrong((id *)&self->_recordIDsToETags, 0);
  objc_storeStrong((id *)&self->_desiredPackageFileIndices, 0);
  objc_storeStrong((id *)&self->_recordIDsToRecords, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong(&self->_fetchRecordsCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordETagMatchedBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordProgressBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_packagesToDestroy, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordETagMatchedBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordProgressBlock, 0);
  objc_storeStrong((id *)&self->_assetInfoByArrayIndexByRecordKeyByRecordID, 0);
}

@end
