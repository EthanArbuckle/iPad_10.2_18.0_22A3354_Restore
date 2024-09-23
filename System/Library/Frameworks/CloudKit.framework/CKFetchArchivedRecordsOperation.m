@implementation CKFetchArchivedRecordsOperation

- (CKFetchArchivedRecordsOperation)init
{
  CKFetchArchivedRecordsOperation *v2;
  uint64_t v3;
  NSMutableDictionary *statusByZoneID;
  uint64_t v5;
  NSMutableDictionary *perItemErrors;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKFetchArchivedRecordsOperation;
  v2 = -[CKOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    statusByZoneID = v2->_statusByZoneID;
    v2->_statusByZoneID = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    perItemErrors = v2->_perItemErrors;
    v2->_perItemErrors = (NSMutableDictionary *)v5;

    v2->_shouldFetchAssetContents = 1;
    v2->_fetchAllChanges = 1;
  }
  return v2;
}

- (CKFetchArchivedRecordsOperation)initWithRecordZoneIDs:(id)a3 configurationsByRecordZoneID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKFetchArchivedRecordsOperation *v14;
  uint64_t v15;
  NSArray *recordZoneIDs;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSDictionary *configurationsByRecordZoneID;

  v6 = a3;
  v7 = a4;
  v14 = (CKFetchArchivedRecordsOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    v15 = objc_msgSend_copy(v6, v11, v12, v13);
    recordZoneIDs = v14->_recordZoneIDs;
    v14->_recordZoneIDs = (NSArray *)v15;

    v20 = objc_msgSend_copy(v7, v17, v18, v19);
    configurationsByRecordZoneID = v14->_configurationsByRecordZoneID;
    v14->_configurationsByRecordZoneID = (NSDictionary *)v20;

  }
  return v14;
}

- (void)setRecordFetchedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id recordFetchedBlock;
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
    block[2] = sub_18A73330C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    recordFetchedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordFetchedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    recordFetchedBlock = self->_recordFetchedBlock;
    self->_recordFetchedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)recordFetchedBlock
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
    v15 = sub_18A7334B4;
    v16 = sub_18A7334DC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7334E4;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordFetchedBlock);
  }
  return v8;
}

- (void)setRecordZoneChangeTokensUpdatedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id recordZoneChangeTokensUpdatedBlock;
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
    block[2] = sub_18A733640;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    recordZoneChangeTokensUpdatedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordZoneChangeTokensUpdatedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    recordZoneChangeTokensUpdatedBlock = self->_recordZoneChangeTokensUpdatedBlock;
    self->_recordZoneChangeTokensUpdatedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)recordZoneChangeTokensUpdatedBlock
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
    v15 = sub_18A7334B4;
    v16 = sub_18A7334DC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7337E8;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordZoneChangeTokensUpdatedBlock);
  }
  return v8;
}

- (void)setRecordZoneFetchCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id recordZoneFetchCompletionBlock;
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
    block[2] = sub_18A733944;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    recordZoneFetchCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordZoneFetchCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    recordZoneFetchCompletionBlock = self->_recordZoneFetchCompletionBlock;
    self->_recordZoneFetchCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)recordZoneFetchCompletionBlock
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
    v15 = sub_18A7334B4;
    v16 = sub_18A7334DC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A733AEC;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordZoneFetchCompletionBlock);
  }
  return v8;
}

- (void)setFetchArchivedRecordsCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id fetchArchivedRecordsCompletionBlock;
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
    block[2] = sub_18A733C48;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    fetchArchivedRecordsCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchArchivedRecordsCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    fetchArchivedRecordsCompletionBlock = self->_fetchArchivedRecordsCompletionBlock;
    self->_fetchArchivedRecordsCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)fetchArchivedRecordsCompletionBlock
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
    v15 = sub_18A7334B4;
    v16 = sub_18A7334DC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A733DF0;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchArchivedRecordsCompletionBlock);
  }
  return v8;
}

- (id)recordZoneArchivesStatusByZoneID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_statusByZoneID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copy(v4, v5, v6, v7);

  return v8;
}

- (id)relevantZoneIDs
{
  return self->_recordZoneIDs;
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
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t AssetContents;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t AllChanges;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  objc_super v35;

  v4 = a3;
  objc_msgSend_recordZoneIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_configurationsByRecordZoneID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConfigurationsByRecordZoneID_(v4, v15, (uint64_t)v14, v16);

  AssetContents = objc_msgSend_shouldFetchAssetContents(self, v17, v18, v19);
  objc_msgSend_setShouldFetchAssetContents_(v4, v21, AssetContents, v22);
  AllChanges = objc_msgSend_fetchAllChanges(self, v23, v24, v25);
  objc_msgSend_setFetchAllChanges_(v4, v27, AllChanges, v28);
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v4, v33, (uint64_t)v32, v34);

  v35.receiver = self;
  v35.super_class = (Class)CKFetchArchivedRecordsOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v35, sel_fillOutOperationInfo_, v4);

}

- (void)fillFromOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssetContents;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t AllChanges;
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
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CKFetchArchivedRecordsOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v35, sel_fillFromOperationInfo_, v4);
  AssetContents = objc_msgSend_shouldFetchAssetContents(v4, v5, v6, v7, v35.receiver, v35.super_class);
  objc_msgSend_setShouldFetchAssetContents_(self, v9, AssetContents, v10);
  AllChanges = objc_msgSend_fetchAllChanges(v4, v11, v12, v13);
  objc_msgSend_setFetchAllChanges_(self, v15, AllChanges, v16);
  objc_msgSend_configurationsByRecordZoneID(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConfigurationsByRecordZoneID_(self, v21, (uint64_t)v20, v22);

  objc_msgSend_recordZoneIDs(v4, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(self, v27, (uint64_t)v26, v28);

  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v4, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(self, v33, (uint64_t)v32, v34);
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
  v21.super_class = (Class)CKFetchArchivedRecordsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v21, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_recordFetchedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_recordZoneFetchCompletionBlock(self, v11, v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend_fetchArchivedRecordsCompletionBlock(self, v15, v16, v17);
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
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v22;
  void *v23;
  const char *v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordZoneIDs(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (v10)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend_recordZoneIDs(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v27;
      while (2)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v14);
          if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v17, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20), (uint64_t)a3))
          {

            return 0;
          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v26, (uint64_t)v30, 16);
        if (v18)
          continue;
        break;
      }
    }

    v25.receiver = self;
    v25.super_class = (Class)CKFetchArchivedRecordsOperation;
    return -[CKDatabaseOperation CKOperationShouldRun:](&v25, sel_CKOperationShouldRun_, a3);
  }
  else
  {
    if (a3)
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v24, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You must pass at least one zone ID to %@"), v23);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchArchivedRecordsOperation_withBlock_;
}

- (void)handleFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CKSignpost *signpost;
  CKSignpost *v15;
  const char *v16;
  uint64_t v17;
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
  os_signpost_id_t v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void (**v38)(_QWORD, _QWORD);
  CKSignpost *v39;
  CKSignpost *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  CKSignpost *v44;
  CKSignpost *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  os_signpost_id_t v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  int v70;
  id v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v15 = signpost;

  if (v13)
  {
    if (v15)
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

      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        v70 = 138412546;
        v71 = v8;
        v72 = 2112;
        v73 = v13;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v24, OS_SIGNPOST_EVENT, v30, "CKFetchArchivedRecordsOperation", "Record %@ fetched with error: %@", (uint8_t *)&v70, 0x16u);
      }

    }
    objc_msgSend_perItemErrors(self, v16, v17, v18);
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v13, (uint64_t)v8);
LABEL_14:

    goto LABEL_15;
  }
  if (v15)
  {
    if (self)
      v39 = self->super.super._signpost;
    else
      v39 = 0;
    v40 = v39;
    objc_msgSend_log(v40, v41, v42, v43);
    v31 = objc_claimAutoreleasedReturnValue();

    if (self)
      v44 = self->super.super._signpost;
    else
      v44 = 0;
    v45 = v44;
    v49 = objc_msgSend_identifier(v45, v46, v47, v48);

    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      v70 = 138412290;
      v71 = v8;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v31, OS_SIGNPOST_EVENT, v49, "CKFetchArchivedRecordsOperation", "Record %@ fetched", (uint8_t *)&v70, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
  if (!v9)
    goto LABEL_22;
  objc_msgSend_recordFetchedBlock(self, v16, v17, v18);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v34 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v52 = v34;
      objc_msgSend_operationID(self, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v9, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 138543618;
      v71 = v56;
      v72 = 2112;
      v73 = v60;
      _os_log_debug_impl(&dword_18A5C5000, v52, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a fetched record with id %@", (uint8_t *)&v70, 0x16u);

    }
    objc_msgSend_recordFetchedBlock(self, v35, v36, v37);
    v38 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v38)[2](v38, v9);

    goto LABEL_22;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v50 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v61 = v50;
    objc_msgSend_operationID(self, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v9, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 138543618;
    v71 = v65;
    v72 = 2112;
    v73 = v69;
    _os_log_debug_impl(&dword_18A5C5000, v61, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a fetched record (%@), but no recordFetchedBlock has been set.", (uint8_t *)&v70, 0x16u);

LABEL_22:
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v51 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v70 = 138412290;
    v71 = v8;
    _os_log_debug_impl(&dword_18A5C5000, v51, OS_LOG_TYPE_DEBUG, "Progress callback for record %@ is done", (uint8_t *)&v70, 0xCu);
  }

}

- (void)handleChangeSetCompletionForRecordZoneID:(id)a3 serverChangeToken:(id)a4 archivedRecordStatus:(int64_t)a5 error:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  CKSignpost *signpost;
  CKSignpost *v20;
  CKSignpost *v21;
  CKSignpost *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  CKSignpost *v27;
  CKSignpost *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  os_signpost_id_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  int AllChanges;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void (**v56)(_QWORD, _QWORD, _QWORD);
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL8 v65;
  void *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const __CFString *v87;
  const __CFString *v88;
  _BYTE v89[24];
  id v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  const __CFString *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _QWORD))a7;
  objc_msgSend_CKClientSuitableError(a6, v15, v16, v17);
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v20 = signpost;

  if (v20)
  {
    if (self)
      v21 = self->super.super._signpost;
    else
      v21 = 0;
    v22 = v21;
    objc_msgSend_log(v22, v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    if (self)
      v27 = self->super.super._signpost;
    else
      v27 = 0;
    v28 = v27;
    v32 = objc_msgSend_identifier(v28, v29, v30, v31);

    if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_DWORD *)v89 = 138412546;
      *(_QWORD *)&v89[4] = v13;
      *(_WORD *)&v89[12] = 2112;
      *(_QWORD *)&v89[14] = v18;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v26, OS_SIGNPOST_EVENT, v32, "CKFetchArchivedRecordsOperation", "Server change token updated to %@ with error: %@", v89, 0x16u);
    }

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v33 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v67 = v33;
    objc_msgSend_operationID(self, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v89 = 138543874;
    *(_QWORD *)&v89[4] = v71;
    *(_WORD *)&v89[12] = 2048;
    *(_QWORD *)&v89[14] = a5;
    *(_WORD *)&v89[22] = 2112;
    v90 = v12;
    _os_log_debug_impl(&dword_18A5C5000, v67, OS_LOG_TYPE_DEBUG, "Operation %{public}@ updating archivedRecordStatus to %ld for record zone %@", v89, 0x20u);

  }
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v34, a5, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusByZoneID(self, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v40, v41, (uint64_t)v36, (uint64_t)v12);

  if (v18)
  {
    objc_msgSend_perItemErrors(self, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v45, v46, (uint64_t)v18, (uint64_t)v12);

  }
  AllChanges = objc_msgSend_fetchAllChanges(self, v42, v43, v44);
  if (!v18 && a5 && AllChanges)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v48 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v77 = v48;
      objc_msgSend_operationID(self, v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v89 = 138543874;
      *(_QWORD *)&v89[4] = v81;
      *(_WORD *)&v89[12] = 2114;
      *(_QWORD *)&v89[14] = v13;
      *(_WORD *)&v89[22] = 2112;
      v90 = v12;
      _os_log_debug_impl(&dword_18A5C5000, v77, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a server change token %{public}@ for zoneID %@", v89, 0x20u);

    }
    objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v53, v54, v55);
      v56 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id))v56)[2](v56, v12, v13);
LABEL_32:

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v57 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v82 = v57;
      objc_msgSend_operationID(self, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v89 = 138544386;
      v87 = CFSTR(", error ");
      *(_QWORD *)&v89[4] = v86;
      v88 = &stru_1E1F66ED0;
      *(_WORD *)&v89[12] = 2112;
      if (!v18)
        v87 = &stru_1E1F66ED0;
      *(_QWORD *)&v89[14] = v13;
      if (v18)
        v88 = v18;
      *(_WORD *)&v89[22] = 2112;
      v90 = v12;
      v91 = 2114;
      v92 = v87;
      v93 = 2112;
      v94 = v88;
      _os_log_debug_impl(&dword_18A5C5000, v82, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about per-zone completion with server change token %@ for zoneID %@%{public}@%@", v89, 0x34u);

    }
    objc_msgSend_recordZoneFetchCompletionBlock(self, v58, v59, v60, *(_OWORD *)v89, *(_QWORD *)&v89[16]);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      v65 = a5 != 0;
      objc_msgSend_recordZoneFetchCompletionBlock(self, v62, v63, v64);
      v56 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), id, id, _BOOL8, __CFString *))v56[2])(v56, v12, v13, v65, v18);
      goto LABEL_32;
    }
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v66 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v72 = v66;
    objc_msgSend_operationID(self, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v89 = 138543618;
    *(_QWORD *)&v89[4] = v76;
    *(_WORD *)&v89[12] = 2112;
    *(_QWORD *)&v89[14] = v12;
    _os_log_debug_impl(&dword_18A5C5000, v72, OS_LOG_TYPE_DEBUG, "Progress callback for operation %{public}@ zoneID %@ is done", v89, 0x16u);

  }
  v14[2](v14, 0);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKSignpost *v10;
  CKSignpost *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  CKSignpost *v16;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  os_signpost_id_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void (**v63)(_QWORD, _QWORD);
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  __CFString *v84;
  const __CFString *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  __CFString *v90;
  const __CFString *v91;
  objc_super v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  const __CFString *v96;
  __int16 v97;
  __CFString *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v10 = self->super.super._signpost;
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend_log(v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    if (self)
      v16 = self->super.super._signpost;
    else
      v16 = 0;
    v17 = v16;
    v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchArchivedRecordsOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_perItemErrors(self, v7, v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_perItemErrors(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Couldn't fetch some items when fetching changes"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_recordZoneIDs(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_count(v34, v35, v36, v37);

  if (v38)
  {
    v42 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend_recordZoneIDs(self, v39, v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v42, v44, (uint64_t)v43, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_zoneIDsToZoneNamesString_(self, v47, (uint64_t)v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v53, v54, (uint64_t)v49, (uint64_t)CFSTR("zoneNames"));

  }
  objc_msgSend_fetchArchivedRecordsCompletionBlock(self, v39, v40, v41);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v56 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v57, v58, v59);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = &stru_1E1F66ED0;
      if (v4)
        v85 = CFSTR(" Error was: ");
      else
        v85 = &stru_1E1F66ED0;
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v80, v81, v82);
        v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v94 = v83;
      v95 = 2114;
      v96 = v85;
      v97 = 2112;
      v98 = v84;
      _os_log_debug_impl(&dword_18A5C5000, v56, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed. %{public}@%@", buf, 0x20u);
      if (v4)

    }
    objc_msgSend_fetchArchivedRecordsCompletionBlock(self, v60, v61, v62);
    v63 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v63)[2](v63, v67);

    objc_msgSend_setFetchArchivedRecordsCompletionBlock_(self, v68, 0, v69);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v72 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v73, v74, v75);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = &stru_1E1F66ED0;
      if (v4)
        v91 = CFSTR(" Error was: ");
      else
        v91 = &stru_1E1F66ED0;
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v86, v87, v88);
        v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v94 = v89;
      v95 = 2114;
      v96 = v91;
      v97 = 2112;
      v98 = v90;
      _os_log_debug_impl(&dword_18A5C5000, v72, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no fetchArchivedRecordsCompletionBlock was set.%{public}@%@", buf, 0x20u);
      if (v4)

    }
  }
  objc_msgSend_setRecordFetchedBlock_(self, v70, 0, v71);
  objc_msgSend_setRecordZoneChangeTokensUpdatedBlock_(self, v76, 0, v77);
  objc_msgSend_setRecordZoneFetchCompletionBlock_(self, v78, 0, v79);
  v92.receiver = self;
  v92.super_class = (Class)CKFetchArchivedRecordsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v92, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchArchivedRecordsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchArchivedRecordsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-archived-records", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v4 = a3;
  CKErrorUserInfoClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleFetchForRecordID_record_error_, 2, 0);

  CKErrorUserInfoClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleChangeSetCompletionForRecordZoneID_serverChangeToken_archivedRecordStatus_error_reply_, 3, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKFetchArchivedRecordsOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (NSMutableDictionary)statusByZoneID
{
  return self->_statusByZoneID;
}

- (void)setStatusByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_statusByZoneID, a3);
}

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (void)setShouldFetchAssetContents:(BOOL)a3
{
  self->_shouldFetchAssetContents = a3;
}

- (NSMutableDictionary)perItemErrors
{
  return self->_perItemErrors;
}

- (void)setPerItemErrors:(id)a3
{
  objc_storeStrong((id *)&self->_perItemErrors, a3);
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_perItemErrors, 0);
  objc_storeStrong((id *)&self->_statusByZoneID, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong(&self->_fetchArchivedRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneFetchCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneChangeTokensUpdatedBlock, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
}

@end
