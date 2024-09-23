@implementation CKFetchRecordChangesOperation

- (CKFetchRecordChangesOperation)init
{
  CKFetchRecordChangesOperation *v2;
  uint64_t v3;
  NSMutableDictionary *recordErrors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKFetchRecordChangesOperation;
  v2 = -[CKOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordErrors = v2->_recordErrors;
    v2->_recordErrors = (NSMutableDictionary *)v3;

    v2->_shouldFetchAssetContents = 1;
  }
  return v2;
}

- (CKFetchRecordChangesOperation)initWithRecordZoneID:(CKRecordZoneID *)recordZoneID previousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
  CKRecordZoneID *v6;
  CKServerChangeToken *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKFetchRecordChangesOperation *v14;
  uint64_t v15;
  CKRecordZoneID *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CKServerChangeToken *v21;

  v6 = recordZoneID;
  v7 = previousServerChangeToken;
  v14 = (CKFetchRecordChangesOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    v15 = objc_msgSend_copy(v6, v11, v12, v13);
    v16 = v14->_recordZoneID;
    v14->_recordZoneID = (CKRecordZoneID *)v15;

    v20 = objc_msgSend_copy(v7, v17, v18, v19);
    v21 = v14->_previousServerChangeToken;
    v14->_previousServerChangeToken = (CKServerChangeToken *)v20;

  }
  return v14;
}

- (void)setRecordChangedBlock:(void *)recordChangedBlock
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

  v14 = recordChangedBlock;
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
    block[2] = sub_18A789E2C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordChangedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_recordChangedBlock;
    self->_recordChangedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)recordChangedBlock
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
    v15 = sub_18A789FD4;
    v16 = sub_18A789FFC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A78A004;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordChangedBlock);
  }
  return v8;
}

- (void)setRecordWithIDWasDeletedBlock:(void *)recordWithIDWasDeletedBlock
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

  v14 = recordWithIDWasDeletedBlock;
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
    block[2] = sub_18A78A160;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordWithIDWasDeletedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_recordWithIDWasDeletedBlock;
    self->_recordWithIDWasDeletedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)recordWithIDWasDeletedBlock
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
    v15 = sub_18A789FD4;
    v16 = sub_18A789FFC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A78A308;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordWithIDWasDeletedBlock);
  }
  return v8;
}

- (void)setFetchRecordChangesCompletionBlock:(void *)fetchRecordChangesCompletionBlock
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

  v14 = fetchRecordChangesCompletionBlock;
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
    block[2] = sub_18A78A464;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchRecordChangesCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_fetchRecordChangesCompletionBlock;
    self->_fetchRecordChangesCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)fetchRecordChangesCompletionBlock
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
    v15 = sub_18A789FD4;
    v16 = sub_18A789FFC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A78A60C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordChangesCompletionBlock);
  }
  return v8;
}

- (void)setServerChangeTokenFetchedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id serverChangeTokenFetchedBlock;
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
    block[2] = sub_18A78A768;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    serverChangeTokenFetchedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_serverChangeTokenFetchedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    serverChangeTokenFetchedBlock = self->_serverChangeTokenFetchedBlock;
    self->_serverChangeTokenFetchedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)serverChangeTokenFetchedBlock
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
    v15 = sub_18A789FD4;
    v16 = sub_18A789FFC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A78A910;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_serverChangeTokenFetchedBlock);
  }
  return v8;
}

- (void)setChangeTokensUpdatedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id changeTokensUpdatedBlock;
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
    block[2] = sub_18A78AA6C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    changeTokensUpdatedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_changeTokensUpdatedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    changeTokensUpdatedBlock = self->_changeTokensUpdatedBlock;
    self->_changeTokensUpdatedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)changeTokensUpdatedBlock
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
    v15 = sub_18A789FD4;
    v16 = sub_18A789FFC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A78AC14;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_changeTokensUpdatedBlock);
  }
  return v8;
}

- (BOOL)moreComing
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_status(self, a2, v2, v3) != 3;
}

- (id)relevantZoneIDs
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_recordZoneID;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)operationInfoClass
{
  return (Class)objc_opt_class();
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  char AssetContents;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t AllChanges;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  objc_super v60;
  void *v61;
  void *v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_previousServerChangeToken(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousServerChangeToken_(v5, v10, (uint64_t)v9, v11);

  v15 = objc_msgSend_resultsLimit(self, v12, v13, v14);
  objc_msgSend_setResultsLimit_(v5, v16, v15, v17);
  objc_msgSend_desiredKeys(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(v5, v22, (uint64_t)v21, v23);

  v24 = objc_alloc(MEMORY[0x1E0C99D80]);
  v63[0] = v5;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)v63, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordZoneID(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v30;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v31, (uint64_t)&v62, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend_initWithObjects_forKeys_(v24, v33, (uint64_t)v26, (uint64_t)v32);

  objc_msgSend_setConfigurationsByRecordZoneID_(v4, v35, (uint64_t)v34, v36);
  objc_msgSend_recordZoneID(self, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v40;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v41, (uint64_t)&v61, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(v4, v43, (uint64_t)v42, v44);

  AssetContents = objc_msgSend_shouldFetchAssetContents(self, v45, v46, v47);
  if (v4)
  {
    *((_BYTE *)v4 + 144) = AssetContents;
    *((_QWORD *)v4 + 21) = objc_msgSend_changeTypesFromSetCallbacks(self, v49, v50, v51);
  }
  else
  {
    objc_msgSend_changeTypesFromSetCallbacks(self, v49, v50, v51);
  }
  AllChanges = objc_msgSend_fetchAllChanges(self, v52, v53, v54);
  objc_msgSend_setFetchAllChanges_(v4, v56, AllChanges, v57);
  objc_msgSend_setErrorReportingStyle_(v4, v58, 2, v59);
  v60.receiver = self;
  v60.super_class = (Class)CKFetchRecordChangesOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v60, sel_fillOutOperationInfo_, v4);

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
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t AssetContents;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t AllChanges;
  const char *v58;
  uint64_t v59;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)CKFetchRecordChangesOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v60, sel_fillFromOperationInfo_, v4);
  objc_msgSend_configurationsByRecordZoneID(v4, v5, v6, v7, v60.receiver, v60.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v8, v17, (uint64_t)v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordZoneIDs(v4, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneID_(self, v28, (uint64_t)v27, v29);

  objc_msgSend_previousServerChangeToken(v19, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousServerChangeToken_(self, v34, (uint64_t)v33, v35);

  objc_msgSend_desiredKeys(v19, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(self, v40, (uint64_t)v39, v41);

  v45 = objc_msgSend_resultsLimit(v19, v42, v43, v44);
  objc_msgSend_setResultsLimit_(self, v46, v45, v47);
  AssetContents = objc_msgSend_shouldFetchAssetContents(v4, v48, v49, v50);
  objc_msgSend_setShouldFetchAssetContents_(self, v52, AssetContents, v53);
  AllChanges = objc_msgSend_fetchAllChanges(v4, v54, v55, v56);

  objc_msgSend_setFetchAllChanges_(self, v58, AllChanges, v59);
}

- (int64_t)changeTypesFromSetCallbacks
{
  return 2;
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CKFetchRecordChangesOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v25, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_recordChangedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_recordWithIDWasDeletedBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_serverChangeTokenFetchedBlock(self, v11, v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend_changeTokensUpdatedBlock(self, v15, v16, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend_fetchRecordChangesCompletionBlock(self, v19, v20, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v23 != 0;

        }
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
  void *v10;
  const char *v11;
  int v12;
  objc_class *v14;
  void *v15;
  const char *v16;
  objc_super v17;

  objc_msgSend_recordZoneID(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_recordZoneID(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v11, (uint64_t)v10, (uint64_t)a3);

    if (v12)
    {
      v17.receiver = self;
      v17.super_class = (Class)CKFetchRecordChangesOperation;
      return -[CKDatabaseOperation CKOperationShouldRun:](&v17, sel_CKOperationShouldRun_, a3);
    }
  }
  else if (a3)
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("property recordZoneID must not be nil for %@"), v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchRecordChangesOperation_withBlock_;
}

- (void)performCKOperation
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    objc_msgSend_recordZoneID(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previousServerChangeToken(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2114;
    v20 = v12;
    v21 = 2048;
    v22 = objc_msgSend_resultsLimit(self, v13, v14, v15);
    _os_log_debug_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_DEBUG, "Fetching changes from the server for zone %@ with change token %{public}@. Fetching %lu items at a time.", buf, 0x20u);

  }
  v16.receiver = self;
  v16.super_class = (Class)CKFetchRecordChangesOperation;
  -[CKOperation performCKOperation](&v16, sel_performCKOperation);
}

- (void)handleChangeForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
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
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  CKSignpost *v40;
  CKSignpost *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  CKSignpost *v46;
  CKSignpost *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  os_signpost_id_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void (**v57)(id, id);
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const __CFString *v69;
  void *v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const __CFString *v82;
  void *v83;
  int v84;
  id v85;
  __int16 v86;
  const __CFString *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
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
        v84 = 138412546;
        v85 = v8;
        v86 = 2112;
        v87 = v13;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v24, OS_SIGNPOST_EVENT, v30, "CKFetchRecordChangesOperation", "Record %@ changed with error: %@", (uint8_t *)&v84, 0x16u);
      }

    }
    objc_msgSend_recordErrors(self, v16, v17, v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v13, (uint64_t)v8);

    v9 = 0;
    goto LABEL_14;
  }
  if (v15)
  {
    if (self)
      v40 = self->super.super._signpost;
    else
      v40 = 0;
    v41 = v40;
    objc_msgSend_log(v41, v42, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();

    if (self)
      v46 = self->super.super._signpost;
    else
      v46 = 0;
    v47 = v46;
    v51 = objc_msgSend_identifier(v47, v48, v49, v50);

    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      v84 = 138412290;
      v85 = v8;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v45, OS_SIGNPOST_EVENT, v51, "CKFetchRecordChangesOperation", "Record %@ changed", (uint8_t *)&v84, 0xCu);
    }

  }
  if (v9)
  {
    objc_msgSend_recordChangedBlock(self, v16, v17, v18);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v53 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v71 = v53;
        objc_msgSend_operationID(self, v72, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isMergeableValueDeltaRecord(v9, v76, v77, v78))
          v82 = CFSTR("mergeable delta partial ");
        else
          v82 = &stru_1E1F66ED0;
        objc_msgSend_recordID(v9, v79, v80, v81);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 138543874;
        v85 = v75;
        v86 = 2112;
        v87 = v82;
        v88 = 2112;
        v89 = v83;
        _os_log_debug_impl(&dword_18A5C5000, v71, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a changed %@record with id %@", (uint8_t *)&v84, 0x20u);

      }
      objc_msgSend_recordChangedBlock(self, v54, v55, v56);
      v57 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
      v57[2](v57, v9);
      goto LABEL_34;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v58 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v57 = v58;
      objc_msgSend_operationID(self, v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isMergeableValueDeltaRecord(v9, v63, v64, v65))
        v69 = CFSTR("mergeable delta partial ");
      else
        v69 = &stru_1E1F66ED0;
      objc_msgSend_recordID(v9, v66, v67, v68);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138543874;
      v85 = v62;
      v86 = 2112;
      v87 = v69;
      v88 = 2112;
      v89 = v70;
      _os_log_debug_impl(&dword_18A5C5000, (os_log_t)v57, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a changed %@record (%@), but no recordChangedBlock has been set.", (uint8_t *)&v84, 0x20u);

LABEL_34:
    }
  }
LABEL_14:
  objc_msgSend_configuration(self, v16, v17, v18);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleRecordChanged_changeType_record_error_(v37, v38, (uint64_t)v8, 1, v9, v13);

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v39 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v84 = 138412290;
    v85 = v8;
    _os_log_debug_impl(&dword_18A5C5000, v39, OS_LOG_TYPE_DEBUG, "Progress callback for record %@ is done", (uint8_t *)&v84, 0xCu);
  }

}

- (void)handleDeleteForRecordID:(id)a3
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
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(id, id);
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
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
      v48 = 138412290;
      v49 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordChangesOperation", "Record %@ deleted", (uint8_t *)&v48, 0xCu);
    }

  }
  objc_msgSend_recordWithIDWasDeletedBlock(self, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v23 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v39 = v23;
      objc_msgSend_operationID(self, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543618;
      v49 = v43;
      v50 = 2112;
      v51 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v39, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a deleted record with id %@", (uint8_t *)&v48, 0x16u);

    }
    objc_msgSend_recordWithIDWasDeletedBlock(self, v24, v25, v26);
    v27 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
    v27[2](v27, v4);
    goto LABEL_18;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v31 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v27 = v31;
    objc_msgSend_operationID(self, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138543618;
    v49 = v47;
    v50 = 2112;
    v51 = v4;
    _os_log_debug_impl(&dword_18A5C5000, (os_log_t)v27, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a deleted record (%@), but no recordWithIDWasDeletedBlock has been set.", (uint8_t *)&v48, 0x16u);

LABEL_18:
  }
  objc_msgSend_configuration(self, v28, v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleRecordChanged_changeType_record_error_(v36, v37, (uint64_t)v4, 3, 0, 0);

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v38 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v48 = 138412290;
    v49 = v4;
    _os_log_debug_impl(&dword_18A5C5000, v38, OS_LOG_TYPE_DEBUG, "Progress callback for record %@ is done", (uint8_t *)&v48, 0xCu);
  }

}

- (void)handleChangeSetCompletionWithServerChangeToken:(id)a3 clientChangeTokenData:(id)a4 recordChangesStatus:(int64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  CKSignpost *signpost;
  CKSignpost *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CKSignpost *v18;
  CKSignpost *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  CKSignpost *v24;
  CKSignpost *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  os_signpost_id_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  void *v69;
  __int16 v70;
  int64_t v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v14 = signpost;

  if (v14)
  {
    if (self)
      v18 = self->super.super._signpost;
    else
      v18 = 0;
    v19 = v18;
    objc_msgSend_log(v19, v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    if (self)
      v24 = self->super.super._signpost;
    else
      v24 = 0;
    v25 = v24;
    v29 = objc_msgSend_identifier(v25, v26, v27, v28);

    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v68) = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v23, OS_SIGNPOST_EVENT, v29, "CKFetchRecordChangesOperation", "Progress callback", (uint8_t *)&v68, 2u);
    }

  }
  if (a5 != -1)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v30 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v63 = v30;
      objc_msgSend_operationID(self, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 138543618;
      v69 = v67;
      v70 = 2048;
      v71 = a5;
      _os_log_debug_impl(&dword_18A5C5000, v63, OS_LOG_TYPE_DEBUG, "Operation %{public}@ updating recordChangesStatus to %ld", (uint8_t *)&v68, 0x16u);

    }
    objc_msgSend_setStatus_(self, v31, a5, v32);
  }
  objc_msgSend_changeTokensUpdatedBlock(self, v15, v16, v17);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {

LABEL_21:
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v38 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v58 = v38;
      objc_msgSend_operationID(self, v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 138543874;
      v69 = v62;
      v70 = 2114;
      v71 = (int64_t)v10;
      v72 = 2114;
      v73 = v11;
      _os_log_debug_impl(&dword_18A5C5000, v58, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a server change token %{public}@, client change token data %{public}@", (uint8_t *)&v68, 0x20u);

    }
    objc_msgSend_changeTokensUpdatedBlock(self, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend_changeTokensUpdatedBlock(self, v43, v44, v45);
      v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id))v46)[2](v46, v10, v11);
    }
    else
    {
      objc_msgSend_serverChangeTokenFetchedBlock(self, v43, v44, v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v47)
        goto LABEL_30;
      objc_msgSend_serverChangeTokenFetchedBlock(self, v48, v49, v50);
      v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), id))v46[2])(v46, v10);
    }

LABEL_30:
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    goto LABEL_32;
  }
  objc_msgSend_serverChangeTokenFetchedBlock(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
    goto LABEL_21;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v52 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v53 = v52;
    objc_msgSend_operationID(self, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 138543874;
    v69 = v57;
    v70 = 2114;
    v71 = (int64_t)v10;
    v72 = 2114;
    v73 = v11;
    _os_log_debug_impl(&dword_18A5C5000, v53, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a server change token (%{public}@) and client change token data (%{public}@), but neither changeTokensUpdatedBlock nor serverChangeTokenFetchedBlock has been set.", (uint8_t *)&v68, 0x20u);

    goto LABEL_30;
  }
LABEL_32:
  v51 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v68) = 0;
    _os_log_debug_impl(&dword_18A5C5000, v51, OS_LOG_TYPE_DEBUG, "Progress callback for change tokens is done", (uint8_t *)&v68, 2u);
  }
  v12[2](v12, 0);

}

- (void)handleOperationDidCompleteWithServerChangeToken:(id)a3 clientChangeTokenData:(id)a4 recordChangesStatus:(int64_t)a5 metrics:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a6;
  objc_msgSend_setResultServerChangeToken_(self, v16, (uint64_t)v12, v17);
  objc_msgSend_setResultClientChangeTokenData_(self, v18, (uint64_t)v13, v19);
  if (a5 != -1)
    objc_msgSend_setStatus_(self, v20, a5, v21);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v22 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v23 = v22;
    objc_msgSend_operationID(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v27;
    v31 = 2114;
    v32 = v12;
    v33 = 2114;
    v34 = v13;
    v35 = 2048;
    v36 = a5;
    _os_log_debug_impl(&dword_18A5C5000, v23, OS_LOG_TYPE_DEBUG, "Received completion callback for operation %{public}@ with server change token %{public}@, client change token data %{public}@, status %ld", buf, 0x2Au);

  }
  v28.receiver = self;
  v28.super_class = (Class)CKFetchRecordChangesOperation;
  -[CKOperation handleOperationDidCompleteWithMetrics:error:](&v28, sel_handleOperationDidCompleteWithMetrics_error_, v15, v14);

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
  void *v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
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
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void (**v66)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v67;
  void *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
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
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  __CFString *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  __CFString *v98;
  __CFString *v99;
  const __CFString *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  __CFString *v105;
  const __CFString *v106;
  objc_super v107;
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  const __CFString *v111;
  __int16 v112;
  __CFString *v113;
  __int16 v114;
  const __CFString *v115;
  __int16 v116;
  __CFString *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordChangesOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_recordErrors(self, v7, v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordErrors(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Couldn't fetch some records when fetching changes"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_recordZoneID(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v38 = (void *)MEMORY[0x1E0C99E20];
    v39 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend_recordZoneID(self, v35, v36, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(v39, v41, (uint64_t)v40, v42, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v38, v44, (uint64_t)v43, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_zoneIDsToZoneNamesString_(self, v47, (uint64_t)v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v53, v54, (uint64_t)v49, (uint64_t)CFSTR("zoneNames"));

  }
  objc_msgSend_fetchRecordChangesCompletionBlock(self, v35, v36, v37);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v56 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v57, v58, v59);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resultServerChangeToken(self, v88, v89, v90);
      v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resultClientChangeTokenData(self, v92, v93, v94);
      v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v99 = &stru_1E1F66ED0;
      if (v4)
        v100 = CFSTR(" Error was: ");
      else
        v100 = &stru_1E1F66ED0;
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v95, v96, v97);
        v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544386;
      v109 = v87;
      v110 = 2112;
      v111 = v91;
      v112 = 2114;
      v113 = v98;
      v114 = 2114;
      v115 = v100;
      v116 = 2112;
      v117 = v99;
      _os_log_debug_impl(&dword_18A5C5000, v56, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed. Server change token is %@, client change token data is %{public}@.%{public}@%@", buf, 0x34u);
      if (v4)

    }
    objc_msgSend_fetchRecordChangesCompletionBlock(self, v60, v61, v62);
    v66 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v67 = 0;
      v68 = 0;
    }
    else
    {
      objc_msgSend_resultServerChangeToken(self, v63, v64, v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resultClientChangeTokenData(self, v75, v76, v77);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_CKClientSuitableError(v4, v63, v64, v65);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v66)[2](v66, v67, v68, v78);

    if (!v4)
    {

    }
    objc_msgSend_setFetchRecordChangesCompletionBlock_(self, v79, 0, v80);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v69 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v70, v71, v72);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = &stru_1E1F66ED0;
      if (v4)
        v106 = CFSTR(" Error was: ");
      else
        v106 = &stru_1E1F66ED0;
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v101, v102, v103);
        v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v109 = v104;
      v110 = 2114;
      v111 = v106;
      v112 = 2112;
      v113 = v105;
      _os_log_debug_impl(&dword_18A5C5000, v69, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no fetchRecordChangesCompletionBlock was set.%{public}@%@", buf, 0x20u);
      if (v4)

    }
  }
  objc_msgSend_setRecordChangedBlock_(self, v73, 0, v74);
  objc_msgSend_setRecordWithIDWasDeletedBlock_(self, v81, 0, v82);
  objc_msgSend_setServerChangeTokenFetchedBlock_(self, v83, 0, v84);
  objc_msgSend_setChangeTokensUpdatedBlock_(self, v85, 0, v86);
  v107.receiver = self;
  v107.super_class = (Class)CKFetchRecordChangesOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v107, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchRecordChangesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchRecordChangesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-record-changes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleChangeForRecordID_record_error_, 2, 0);

  CKErrorUserInfoClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleOperationDidCompleteWithServerChangeToken_clientChangeTokenData_recordChangesStatus_metrics_error_, 4, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKFetchRecordChangesOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

+ (SEL)daemonCallbackCompletionSelector
{
  return sel_handleOperationDidCompleteWithServerChangeToken_clientChangeTokenData_recordChangesStatus_metrics_error_;
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(CKRecordZoneID *)recordZoneID
{
  objc_setProperty_nonatomic_copy(self, a2, recordZoneID, 560);
}

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
  objc_setProperty_nonatomic_copy(self, a2, previousServerChangeToken, 568);
}

- (NSUInteger)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(NSUInteger)resultsLimit
{
  self->_resultsLimit = resultsLimit;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
  objc_setProperty_nonatomic_copy(self, a2, desiredKeys, 584);
}

- (CKServerChangeToken)resultServerChangeToken
{
  return self->_resultServerChangeToken;
}

- (void)setResultServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_resultServerChangeToken, a3);
}

- (NSData)resultClientChangeTokenData
{
  return self->_resultClientChangeTokenData;
}

- (void)setResultClientChangeTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_resultClientChangeTokenData, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (void)setShouldFetchAssetContents:(BOOL)a3
{
  self->_shouldFetchAssetContents = a3;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
  objc_storeStrong((id *)&self->_recordErrors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_resultClientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_resultServerChangeToken, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong(&self->_changeTokensUpdatedBlock, 0);
  objc_storeStrong(&self->_serverChangeTokenFetchedBlock, 0);
  objc_storeStrong(&self->_fetchRecordChangesCompletionBlock, 0);
  objc_storeStrong(&self->_recordWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_recordChangedBlock, 0);
}

@end
