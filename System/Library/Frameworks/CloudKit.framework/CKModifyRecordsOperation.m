@implementation CKModifyRecordsOperation

- (CKModifyRecordsOperation)init
{
  CKModifyRecordsOperation *v2;
  uint64_t v3;
  NSMutableDictionary *recordsByRecordIDs;
  uint64_t v5;
  NSMutableDictionary *recordErrors;
  uint64_t v7;
  NSMutableArray *savedRecords;
  uint64_t v9;
  NSMutableArray *deletedRecordIDs;
  uint64_t v11;
  NSMutableDictionary *assetsByRecordIDAndRecordKey;
  uint64_t v13;
  NSMutableSet *packagesToDestroy;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKModifyRecordsOperation;
  v2 = -[CKOperation init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordsByRecordIDs = v2->_recordsByRecordIDs;
    v2->_recordsByRecordIDs = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    recordErrors = v2->_recordErrors;
    v2->_recordErrors = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    savedRecords = v2->_savedRecords;
    v2->_savedRecords = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    deletedRecordIDs = v2->_deletedRecordIDs;
    v2->_deletedRecordIDs = (NSMutableArray *)v9;

    v2->_savePolicy = 0;
    v11 = objc_opt_new();
    assetsByRecordIDAndRecordKey = v2->_assetsByRecordIDAndRecordKey;
    v2->_assetsByRecordIDAndRecordKey = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    packagesToDestroy = v2->_packagesToDestroy;
    v2->_packagesToDestroy = (NSMutableSet *)v13;

    v2->_atomic = 1;
  }
  return v2;
}

- (CKModifyRecordsOperation)initWithRecordsToSave:(NSArray *)records recordIDsToDelete:(NSArray *)recordIDs
{
  NSArray *v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKModifyRecordsOperation *v14;
  uint64_t v15;
  NSArray *recordsToSave;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *recordIDsToDelete;

  v6 = records;
  v7 = recordIDs;
  v14 = (CKModifyRecordsOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    v15 = objc_msgSend_copy(v6, v11, v12, v13);
    recordsToSave = v14->_recordsToSave;
    v14->_recordsToSave = (NSArray *)v15;

    v20 = objc_msgSend_copy(v7, v17, v18, v19);
    recordIDsToDelete = v14->_recordIDsToDelete;
    v14->_recordIDsToDelete = (NSArray *)v20;

  }
  return v14;
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
    block[2] = sub_18A7AF004;
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
    v15 = sub_18A7AF1AC;
    v16 = sub_18A7AF1D4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AF1DC;
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
    block[2] = sub_18A7AF338;
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
    v15 = sub_18A7AF1AC;
    v16 = sub_18A7AF1D4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AF4E0;
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

- (void)setPerRecordSaveBlock:(void *)perRecordSaveBlock
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

  v14 = perRecordSaveBlock;
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
    block[2] = sub_18A7AF63C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordSaveBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perRecordSaveBlock;
    self->_perRecordSaveBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perRecordSaveBlock
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
    v15 = sub_18A7AF1AC;
    v16 = sub_18A7AF1D4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AF7E4;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordSaveBlock);
  }
  return v8;
}

- (void)setPerRecordDeleteBlock:(void *)perRecordDeleteBlock
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

  v14 = perRecordDeleteBlock;
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
    block[2] = sub_18A7AF940;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordDeleteBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perRecordDeleteBlock;
    self->_perRecordDeleteBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perRecordDeleteBlock
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
    v15 = sub_18A7AF1AC;
    v16 = sub_18A7AF1D4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AFAE8;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordDeleteBlock);
  }
  return v8;
}

- (void)setModifyRecordsCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id modifyRecordsCompletionBlock;
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
    block[2] = sub_18A7AFC44;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    modifyRecordsCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_modifyRecordsCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    modifyRecordsCompletionBlock = self->_modifyRecordsCompletionBlock;
    self->_modifyRecordsCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)modifyRecordsCompletionBlock
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
    v15 = sub_18A7AF1AC;
    v16 = sub_18A7AF1D4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AFDEC;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_modifyRecordsCompletionBlock);
  }
  return v8;
}

- (void)setRecordsInFlightBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id recordsInFlightBlock;
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
    block[2] = sub_18A7AFF48;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    recordsInFlightBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordsInFlightBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    recordsInFlightBlock = self->_recordsInFlightBlock;
    self->_recordsInFlightBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)recordsInFlightBlock
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
    v15 = sub_18A7AF1AC;
    v16 = sub_18A7AF1D4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7B00F0;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordsInFlightBlock);
  }
  return v8;
}

- (void)setModifyRecordsCompletionBlock:(void *)modifyRecordsCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = modifyRecordsCompletionBlock == 0;
  v9 = modifyRecordsCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setModifyRecordsCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

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
  uint64_t v20;
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
  uint64_t shouldOnlySaveAssetContent;
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
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t PCSFromServer;
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
  objc_msgSend_recordsToSave(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordsToSave_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_recordIDsToDelete(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToDelete_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_savePolicy(self, v17, v18, v19);
  objc_msgSend_setSavePolicy_(v4, v21, v20, v22);
  objc_msgSend_clientChangeTokenData(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientChangeTokenData_(v4, v27, (uint64_t)v26, v28);

  shouldOnlySaveAssetContent = objc_msgSend_shouldOnlySaveAssetContent(self, v29, v30, v31);
  objc_msgSend_setShouldOnlySaveAssetContent_(v4, v33, shouldOnlySaveAssetContent, v34);
  objc_msgSend_recordIDsToDeleteToEtags(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToDeleteToEtags_(v4, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_atomic(self, v41, v42, v43);
  objc_msgSend_setAtomic_(v4, v45, v44, v46);
  objc_msgSend_conflictLosersToResolveByRecordID(self, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConflictLosersToResolveByRecordID_(v4, v51, (uint64_t)v50, v52);

  objc_msgSend_pluginFieldsForRecordDeletesByID(self, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPluginFieldsForRecordDeletesByID_(v4, v57, (uint64_t)v56, v58);

  objc_msgSend_recordsInFlightBlock(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShouldReportRecordsInFlight_(v4, v63, v62 != 0, v64);

  v68 = objc_msgSend_markAsParticipantNeedsNewInvitationToken(self, v65, v66, v67);
  objc_msgSend_setMarkAsParticipantNeedsNewInvitationToken_(v4, v69, v68, v70);
  PCSFromServer = objc_msgSend_alwaysFetchPCSFromServer(self, v71, v72, v73);
  objc_msgSend_setAlwaysFetchPCSFromServer_(v4, v75, PCSFromServer, v76);
  shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v77, v78, v79);
  objc_msgSend_setShouldCloneFileInAssetCache_(v4, v81, shouldCloneFileInAssetCache, v82);
  v83.receiver = self;
  v83.super_class = (Class)CKModifyRecordsOperation;
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
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  uint64_t shouldOnlySaveAssetContent;
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
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
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
  uint64_t PCSFromServer;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t shouldCloneFileInAssetCache;
  const char *v75;
  uint64_t v76;
  objc_super v77;

  v77.receiver = self;
  v77.super_class = (Class)CKModifyRecordsOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v77, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordsToSave(v4, v5, v6, v7, v77.receiver, v77.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordsToSave_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_recordIDsToDelete(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToDelete_(self, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_savePolicy(v4, v17, v18, v19);
  objc_msgSend_setSavePolicy_(self, v21, v20, v22);
  objc_msgSend_clientChangeTokenData(v4, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientChangeTokenData_(self, v27, (uint64_t)v26, v28);

  shouldOnlySaveAssetContent = objc_msgSend_shouldOnlySaveAssetContent(v4, v29, v30, v31);
  objc_msgSend_setShouldOnlySaveAssetContent_(self, v33, shouldOnlySaveAssetContent, v34);
  objc_msgSend_recordIDsToDeleteToEtags(v4, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToDeleteToEtags_(self, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_atomic(v4, v41, v42, v43);
  objc_msgSend_setAtomic_(self, v45, v44, v46);
  objc_msgSend_conflictLosersToResolveByRecordID(v4, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConflictLosersToResolveByRecordID_(self, v51, (uint64_t)v50, v52);

  objc_msgSend_pluginFieldsForRecordDeletesByID(v4, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPluginFieldsForRecordDeletesByID_(self, v57, (uint64_t)v56, v58);

  v62 = objc_msgSend_markAsParticipantNeedsNewInvitationToken(v4, v59, v60, v61);
  objc_msgSend_setMarkAsParticipantNeedsNewInvitationToken_(self, v63, v62, v64);
  PCSFromServer = objc_msgSend_alwaysFetchPCSFromServer(v4, v65, v66, v67);
  objc_msgSend_setAlwaysFetchPCSFromServer_(self, v69, PCSFromServer, v70);
  shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v4, v71, v72, v73);

  objc_msgSend_setShouldCloneFileInAssetCache_(self, v75, shouldCloneFileInAssetCache, v76);
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CKModifyRecordsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v29, sel_hasCKOperationCallbacksSet))
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
      objc_msgSend_perRecordSaveBlock(self, v11, v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend_perRecordDeleteBlock(self, v15, v16, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend_recordsInFlightBlock(self, v19, v20, v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v6 = 1;
          }
          else
          {
            objc_msgSend_modifyRecordsCompletionBlock(self, v23, v24, v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v27 != 0;

          }
        }

      }
    }

  }
  return v6;
}

- (void)destroyPackages:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v5)
  {
    v9 = v5;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v3);
        objc_msgSend_removeDB(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6, v7, v8);
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v9);
  }

}

- (void)destroyPackagesInRecords:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v5)
  {
    v9 = v5;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v3);
        objc_msgSend_removePackages(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6, v7, v8);
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v9);
  }

}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  CKModifyRecordsOperation *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  id v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t Index;
  uint64_t v129;
  void *v130;
  const char *v131;
  const char *v132;
  void *v133;
  const char *v134;
  const char *v135;
  const char *v136;
  _BOOL4 v137;
  id *v138;
  void *v139;
  const char *v140;
  id v141;
  id v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  BOOL v146;
  const char *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t j;
  void *v161;
  uint64_t (**v162)(void *, void *, id *);
  id v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t k;
  void *v169;
  const char *v170;
  const char *v171;
  const char *v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  int isEqualToString;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  id v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  int OnlyManatee;
  void *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  char v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  const __CFString *v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  int v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t m;
  const char *v289;
  const char *v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  CKModifyRecordsOperation *v310;
  void *v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  objc_class *v321;
  void *v322;
  const char *v323;
  BOOL v324;
  objc_class *v326;
  void *v327;
  const char *v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  char v341;
  void *v342;
  const char *v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  const char *v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t n;
  void *v354;
  void *v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  void *v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  int v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  id v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  void *v387;
  id v388;
  void *v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  void *v393;
  const char *v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  void *v398;
  const char *v399;
  uint64_t v400;
  const char *v401;
  uint64_t v402;
  const char *v403;
  uint64_t v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  void *v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  void *v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  void *v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  void *v428;
  const char *v429;
  objc_class *v430;
  const char *v431;
  id v432;
  void *v433;
  const char *v434;
  const char *v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  const char *v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  void *v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  void *v453;
  const char *v454;
  int v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  const char *v459;
  uint64_t v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  void *v467;
  const char *v468;
  int v469;
  const __CFString *v470;
  uint64_t v471;
  void *v472;
  void *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  void *v477;
  void *v478;
  void *v479;
  void *v481;
  void *v482;
  id v483;
  CKModifyRecordsOperation *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  uint64_t v489;
  id obj;
  objc_super v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  _QWORD aBlock[6];
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  id v522;
  uint64_t v523;
  uint64_t v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  _BYTE v537[128];
  _BYTE v538[128];
  _BYTE v539[128];
  _BYTE v540[128];
  _BYTE v541[128];
  _BYTE v542[128];
  _BYTE v543[128];
  _BYTE v544[128];
  _BYTE v545[128];
  _BYTE v546[128];
  uint64_t v547;

  v547 = *MEMORY[0x1E0C80C00];
  v482 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v533 = 0u;
  v534 = 0u;
  v535 = 0u;
  v536 = 0u;
  v484 = self;
  objc_msgSend_recordIDsToDelete(self, v5, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v533, (uint64_t)v546, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v534;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v534 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v533 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a3)
          {
            v321 = (objc_class *)objc_opt_class();
            NSStringFromClass(v321);
            v322 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v323, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected recordID in property recordIDsToDelete passed to %@: %@"), v322, v13);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_128;
        }
        if (objc_msgSend_containsObject_(v4, v14, v13, v15))
        {
          if (a3)
          {
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't delete the same record (%@) twice in a single operation"), v13);
            v324 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_137;
          }
LABEL_128:
          v324 = 0;
          goto LABEL_137;
        }
        objc_msgSend_addObject_(v4, v16, v13, v17);
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v533, (uint64_t)v546, 16);
    }
    while (v10);
  }

  obj = (id)objc_opt_new();
  v481 = (void *)objc_opt_new();
  v529 = 0u;
  v530 = 0u;
  v531 = 0u;
  v532 = 0u;
  v19 = v484;
  objc_msgSend_recordsToSave(v484, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v529, (uint64_t)v545, 16);
  v485 = v4;
  v26 = a3;
  if (!v25)
    goto LABEL_121;
  v27 = v25;
  v28 = *(_QWORD *)v530;
  v478 = v23;
  v475 = *(_QWORD *)v530;
  do
  {
    v29 = 0;
    v474 = v27;
    do
    {
      if (*(_QWORD *)v530 != v28)
      {
        v30 = v29;
        objc_enumerationMutation(v23);
        v29 = v30;
      }
      v476 = v29;
      v31 = *(void **)(*((_QWORD *)&v529 + 1) + 8 * v29);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v26)
          goto LABEL_134;
        v430 = (objc_class *)objc_opt_class();
        NSStringFromClass(v430);
        v479 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v478;
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v431, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected record in property recordsToSave passed to %@: %@"), v479, v31);
        goto LABEL_178;
      }
      objc_msgSend_recordID(v31, v32, v33, v34);
      v479 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_containsObject_(v4, v35, (uint64_t)v479, v36))
      {
        if (!v26)
          goto LABEL_133;
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v37, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't save and delete the same record (%@) in a single operation"), v479, v471);
LABEL_178:
        *v26 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_133;
      }
      objc_msgSend_configuration(v19, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v44, v45, v46, v47);
      v486 = v31;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend_useZoneWidePCS(v48, v49, v50, v51);

      v53 = v486;
      if (!v52)
        goto LABEL_20;
      objc_msgSend_parent(v486, v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        if (!v26)
          goto LABEL_132;
        objc_msgSend_recordID(v486, v58, v59, v60);
        v433 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v434, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Records with a parent reference cannot use zoneish PCS: %@"), v433);
LABEL_189:
        *v26 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_132;
      }
      objc_msgSend_share(v486, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        if (!v26)
          goto LABEL_132;
        objc_msgSend_recordID(v486, v54, v55, v56);
        v433 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v435, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Records with a share reference (root records) cannot use zoneish PCS: %@"), v433);
        goto LABEL_189;
      }
LABEL_20:
      objc_msgSend_changedKeys(v486, v54, v55, v56);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      CKValidateIndexedArrayKeys(v62, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26 && v63)
      {
        v432 = objc_retainAutorelease(v63);
        *v26 = v432;

        goto LABEL_132;
      }
      v477 = v63;
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v64, v65, v66);
      v488 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v67, v68, v69);
      v487 = (void *)objc_claimAutoreleasedReturnValue();
      v525 = 0u;
      v526 = 0u;
      v527 = 0u;
      v528 = 0u;
      objc_msgSend_changedKeys(v486, v70, v71, v72);
      v483 = (id)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v483, v73, (uint64_t)&v525, (uint64_t)v544, 16);
      if (!v74)
      {
LABEL_57:
        v77 = 0;
        v137 = 1;
        v138 = a3;
        v19 = v484;
        goto LABEL_68;
      }
      v75 = v74;
      v489 = *(_QWORD *)v526;
LABEL_24:
      v76 = 0;
      while (1)
      {
        if (*(_QWORD *)v526 != v489)
          objc_enumerationMutation(v483);
        v77 = *(void **)(*((_QWORD *)&v525 + 1) + 8 * v76);
        v524 = 0;
        v523 = 0;
        v522 = 0;
        CKProcessIndexedArrayKey(v77, &v522, &v524, &v523);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v522;
        v83 = v79;
        if (v78)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v80, v81, v82);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v133, v134, (uint64_t)a2, (uint64_t)v484, CFSTR("CKModifyRecordsOperation.m"), 230, CFSTR("Error processing indexed array key, which should have been caught earlier: %@"), v78);

          if (!v83)
          {
LABEL_54:

            goto LABEL_55;
          }
        }
        else if (!v79)
        {
          goto LABEL_54;
        }
        objc_msgSend_valueStore(v53, v80, v81, v82);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v84, v85, (uint64_t)v77, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v87;
        if (v87)
        {
          v92 = v87;
        }
        else
        {
          objc_msgSend_encryptedValueStore(v53, v88, v89, v90);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v93, v94, (uint64_t)v77, v95);
          v92 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v138 = a3;
          if (a3)
          {
            objc_msgSend_recordID(v486, v96, v97, v98);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v140, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Value type for indexed list key %@ in record %@ needs to be NSArray"), v77, v139);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          v77 = 0;
          v137 = 0;
          v19 = v484;
          v53 = v486;
          goto LABEL_68;
        }
        objc_msgSend_objectForKeyedSubscript_(v488, v96, (uint64_t)v83, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v99;
        if (v99)
        {
          v101 = v99;
        }
        else
        {
          v101 = (id)objc_opt_new();

        }
        objc_msgSend_objectForKeyedSubscript_(v487, v102, (uint64_t)v83, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = v524;
        v106 = v523;
        if (v106 == objc_msgSend_count(v92, v107, v108, v109))
        {
          if (v524 < 0)
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v110, v111, v112);
            v472 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v472, v135, (uint64_t)a2, (uint64_t)v484, CFSTR("CKModifyRecordsOperation.m"), 262, CFSTR("For now, negative indexed list keys (%@) can only be appends: should have been caught in CKProcessIndexedArrayKey"), v77);

          }
          if (objc_msgSend_containsIndexesInRange_(v101, v110, v105, v106))
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v113, v114, v115);
            v473 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v473, v136, (uint64_t)a2, (uint64_t)v484, CFSTR("CKModifyRecordsOperation.m"), 264, CFSTR("Overlapping replacements: should have been caught in CKValidateIndexedArrayKeys"));

          }
          objc_msgSend_addIndexesInRange_(v101, v113, v105, v106);
          if (v104)
          {
            if ((objc_msgSend_integerValue(v104, v116, v117, v118) & 0x8000000000000000) == 0
              && objc_msgSend_lastIndex(v101, v116, v119, v120) != 0x7FFFFFFFFFFFFFFFLL)
            {
              v123 = objc_msgSend_integerValue(v104, v116, v121, v122);
              if (v123 <= objc_msgSend_lastIndex(v101, v124, v125, v126))
              {
LABEL_61:
                v141 = v77;

                goto LABEL_63;
              }
            }
          }
          objc_msgSend_setObject_forKeyedSubscript_(v488, v116, (uint64_t)v101, (uint64_t)v83);
          goto LABEL_52;
        }
        if (v104)
          goto LABEL_61;
        v127 = v524;
        if (v524 >= 1)
        {
          Index = objc_msgSend_lastIndex(v101, v110, v111, v112);
          v127 = v524;
          if (Index != 0x7FFFFFFFFFFFFFFFLL)
            break;
        }
LABEL_51:
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v110, v127, v112);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v487, v131, (uint64_t)v130, (uint64_t)v83);

LABEL_52:
        v4 = v485;
        v53 = v486;
LABEL_55:
        if (v75 == ++v76)
        {
          v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v483, v132, (uint64_t)&v525, (uint64_t)v544, 16);
          if (v75)
            goto LABEL_24;
          goto LABEL_57;
        }
      }
      if (v127 > objc_msgSend_lastIndex(v101, v110, v129, v112))
      {
        v127 = v524;
        goto LABEL_51;
      }
      v142 = v77;
LABEL_63:

      v137 = v77 == 0;
      v146 = a3 == 0;
      if (!v77)
        v146 = 1;
      v19 = v484;
      v4 = v485;
      v138 = a3;
      if (v146)
      {
        v53 = v486;
        goto LABEL_69;
      }
      v53 = v486;
      objc_msgSend_recordID(v486, v143, v144, v145);
      v483 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v147, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Found non-commutative indexed list key %@ in record %@: every mutation for a given list key must commute"), v77, v483);
      v137 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:

LABEL_69:
      if (!v137)
        goto LABEL_132;
      v520 = 0u;
      v521 = 0u;
      v518 = 0u;
      v519 = 0u;
      objc_msgSend_valueStore(v53, v148, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allRawValues(v151, v152, v153, v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();

      v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v155, v156, (uint64_t)&v518, (uint64_t)v543, 16);
      if (v157)
      {
        v158 = v157;
        v159 = *(_QWORD *)v519;
        do
        {
          for (j = 0; j != v158; ++j)
          {
            if (*(_QWORD *)v519 != v159)
              objc_enumerationMutation(v155);
            v161 = *(void **)(*((_QWORD *)&v518 + 1) + 8 * j);
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = sub_18A7B1EC0;
            aBlock[3] = &unk_1E1F654B0;
            aBlock[4] = v19;
            aBlock[5] = v486;
            v162 = (uint64_t (**)(void *, void *, id *))_Block_copy(aBlock);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if ((v162[2](v162, v161, v138) & 1) != 0)
                goto LABEL_89;
LABEL_130:

              goto LABEL_131;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_89;
            v515 = 0u;
            v516 = 0u;
            v513 = 0u;
            v514 = 0u;
            v163 = v161;
            v165 = objc_msgSend_countByEnumeratingWithState_objects_count_(v163, v164, (uint64_t)&v513, (uint64_t)v542, 16);
            if (!v165)
              goto LABEL_88;
            v166 = v165;
            v167 = *(_QWORD *)v514;
            do
            {
              for (k = 0; k != v166; ++k)
              {
                if (*(_QWORD *)v514 != v167)
                  objc_enumerationMutation(v163);
                v169 = *(void **)(*((_QWORD *)&v513 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && !v162[2](v162, v169, a3))
                {

                  v4 = v485;
                  goto LABEL_130;
                }
              }
              v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v163, v170, (uint64_t)&v513, (uint64_t)v542, 16);
            }
            while (v166);
LABEL_88:

            v4 = v485;
            v138 = a3;
LABEL_89:

            v19 = v484;
          }
          v158 = objc_msgSend_countByEnumeratingWithState_objects_count_(v155, v171, (uint64_t)&v518, (uint64_t)v543, 16);
        }
        while (v158);
      }

      objc_msgSend_addObject_(v481, v172, (uint64_t)v479, v173);
      objc_msgSend_recordType(v486, v174, v175, v176);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v177, v178, (uint64_t)CFSTR("cloudkit.share"), v179);

      if (isEqualToString)
      {
        v184 = v486;
        objc_msgSend_rootRecordID(v184, v185, v186, v187);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        if (v191 && (objc_msgSend_isKnownToServer(v184, v188, v189, v190) & 1) == 0)
        {
          objc_msgSend_recordID(v184, v192, v193, v194);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(obj, v196, (uint64_t)v195, (uint64_t)v191);

        }
      }
      objc_msgSend_configuration(v19, v181, v182, v183);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(v197, v198, v199, v200);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v201, v202, v203, v204);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_bypassPCSEncryption(v205, v206, v207, v208))
      {

      }
      else
      {
        objc_msgSend_configuration(v19, v209, v210, v211);
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_container(v215, v216, v217, v218);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_options(v219, v220, v221, v222);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(v223, v224, v225, v226);

        v19 = v484;
        if (!OnlyManatee)
          goto LABEL_119;
      }
      objc_msgSend_configuration(v19, v212, v213, v214);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(v228, v229, v230, v231);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v232, v233, v234, v235);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v240 = objc_msgSend_bypassPCSEncryption(v236, v237, v238, v239);

      v244 = CFSTR("no encryption");
      if ((v240 & 1) == 0)
      {
        objc_msgSend_configuration(v484, v241, v242, v243);
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_container(v245, v246, v247, v248);
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_options(v249, v250, v251, v252);
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        v257 = objc_msgSend_forceEnableReadOnlyManatee(v253, v254, v255, v256);

        if (v257)
          v244 = CFSTR("manatee force enabled");
        else
          v244 = CFSTR("?");
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!a3)
          goto LABEL_132;
        v470 = CFSTR("This container has requested %@ but record %@ is a share");
LABEL_218:
        v23 = v478;
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v258, (uint64_t)CFSTR("CKErrorDomain"), 12, v470, v244, v479);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_133;
      }
      objc_msgSend_share(v486, v258, v259, v260);
      v261 = (void *)objc_claimAutoreleasedReturnValue();

      if (v261)
      {
        if (!a3)
          goto LABEL_132;
        v470 = CFSTR("This container has requested %@ but record %@ has a share reference");
        goto LABEL_218;
      }
      objc_msgSend_parent(v486, v258, v262, v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();

      if (v264)
      {
        if (!a3)
          goto LABEL_132;
        v470 = CFSTR("This container has requested %@ but record %@ has a parent reference");
        goto LABEL_218;
      }
      if (objc_msgSend_wantsChainPCS(v486, v258, v265, v266))
      {
        if (!a3)
          goto LABEL_132;
        v470 = CFSTR("This container has requested %@ but record %@ wants chain PCS");
        goto LABEL_218;
      }
      objc_msgSend_encryptedValueStore(v486, v258, v267, v268);
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allKeys(v269, v270, v271, v272);
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      v277 = objc_msgSend_count(v273, v274, v275, v276);

      if (v277)
      {
        if (!a3)
          goto LABEL_132;
        v470 = CFSTR("This container has requested %@ but record %@ has encrypted values");
        goto LABEL_218;
      }
      v511 = 0u;
      v512 = 0u;
      v509 = 0u;
      v510 = 0u;
      objc_msgSend_valueStore(v486, v258, v278, v279);
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allRawValues(v280, v281, v282, v283);
      v155 = (void *)objc_claimAutoreleasedReturnValue();

      v285 = objc_msgSend_countByEnumeratingWithState_objects_count_(v155, v284, (uint64_t)&v509, (uint64_t)v541, 16);
      if (!v285)
        goto LABEL_118;
      v286 = v285;
      v287 = *(_QWORD *)v510;
      do
      {
        for (m = 0; m != v286; ++m)
        {
          if (*(_QWORD *)v510 != v287)
            objc_enumerationMutation(v155);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
            }
          }
          if (a3)
          {
            v326 = (objc_class *)objc_opt_class();
            NSStringFromClass(v326);
            v327 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v328, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("This container has requested %@ but record %@ has a value of class %@"), v244, v479, v327);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
LABEL_131:

LABEL_132:
          v23 = v478;
LABEL_133:

          goto LABEL_134;
        }
        v286 = objc_msgSend_countByEnumeratingWithState_objects_count_(v155, v289, (uint64_t)&v509, (uint64_t)v541, 16);
      }
      while (v286);
LABEL_118:

      v19 = v484;
LABEL_119:

      v29 = v476 + 1;
      v28 = v475;
      v26 = a3;
      v23 = v478;
    }
    while (v476 + 1 != v474);
    v291 = objc_msgSend_countByEnumeratingWithState_objects_count_(v478, v290, (uint64_t)&v529, (uint64_t)v545, 16);
    v28 = v475;
    v27 = v291;
  }
  while (v291);
LABEL_121:

  objc_msgSend_database(v19, v292, v293, v294);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_databaseScope(v295, v296, v297, v298) == 3)
  {
    objc_msgSend_configuration(v19, v299, v300, v301);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v302, v303, v304, v305);
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v306, v307, v308, v309);
    v310 = v19;
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_bypassPCSEncryption(v311, v312, v313, v314) & 1) != 0)
    {

      v19 = v310;
      goto LABEL_142;
    }
    objc_msgSend_configuration(v310, v315, v316, v317);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v329, v330, v331, v332);
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v333, v334, v335, v336);
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    v341 = objc_msgSend_forceEnableReadOnlyManatee(v337, v338, v339, v340);

    v26 = a3;
    v19 = v310;
    if ((v341 & 1) != 0)
    {
LABEL_142:
      if (v26)
      {
        objc_msgSend_operationID(v19, v318, v319, v320);
        v342 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v343, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("This container has requested no encryption but CKModifyRecordsOperation %@ is targeting the shared database, which requires encryption"), v342);
        *v26 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_135;
    }
  }
  else
  {

  }
  if (objc_msgSend_count(obj, v318, v319, v320) && (objc_msgSend_atomic(v19, v344, v345, v346) & 1) == 0)
  {
    if (v26)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v344, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("When saving an added share with its rootRecord, the operation must be marked as atomic = YES"));
      v324 = 0;
      *v26 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_136;
    }
    goto LABEL_135;
  }
  v507 = 0u;
  v508 = 0u;
  v505 = 0u;
  v506 = 0u;
  objc_msgSend_allKeys(obj, v344, v345, v346);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v348 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v347, (uint64_t)&v505, (uint64_t)v540, 16);
  if (!v348)
    goto LABEL_154;
  v351 = v348;
  v352 = *(_QWORD *)v506;
  do
  {
    for (n = 0; n != v351; ++n)
    {
      if (*(_QWORD *)v506 != v352)
        objc_enumerationMutation(v23);
      v354 = *(void **)(*((_QWORD *)&v505 + 1) + 8 * n);
      if ((objc_msgSend_containsObject_(v481, v349, (uint64_t)v354, v350) & 1) == 0)
      {
        if (a3)
        {
          objc_msgSend_objectForKeyedSubscript_(obj, v349, (uint64_t)v354, v350);
          v418 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ckShortDescription(v418, v419, v420, v421);
          v422 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ckShortDescription(v354, v423, v424, v425);
          v426 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v427, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("An added share is being saved without its rootRecord being saved in the same operation. (Share ID: %@, Root Record ID: %@)"), v422, v426);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_134:

LABEL_135:
        v324 = 0;
        goto LABEL_136;
      }
    }
    v351 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v349, (uint64_t)&v505, (uint64_t)v540, 16);
  }
  while (v351);
LABEL_154:

  v355 = (void *)objc_opt_new();
  v356 = (void *)objc_opt_new();
  v501 = 0u;
  v502 = 0u;
  v503 = 0u;
  v504 = 0u;
  objc_msgSend_recordsToSave(v484, v357, v358, v359);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  v362 = objc_msgSend_countByEnumeratingWithState_objects_count_(v360, v361, (uint64_t)&v501, (uint64_t)v539, 16);
  if (!v362)
    goto LABEL_165;
  v366 = v362;
  v367 = *(_QWORD *)v502;
  while (2)
  {
    v368 = 0;
    while (2)
    {
      if (*(_QWORD *)v502 != v367)
        objc_enumerationMutation(v360);
      v369 = *(void **)(*((_QWORD *)&v501 + 1) + 8 * v368);
      objc_msgSend_recordID(v369, v363, v364, v365);
      v370 = (void *)objc_claimAutoreleasedReturnValue();
      v373 = objc_msgSend_containsObject_(v482, v371, (uint64_t)v370, v372);

      if (v373)
      {
        if (a3)
        {
          objc_msgSend_recordID(v369, v374, v375, v376);
          v428 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v429, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't save the same record twice: %@"), v428);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend_destroyPackagesInRecords_(v484, v374, (uint64_t)v355, v376);
        goto LABEL_181;
      }
      v377 = v369;
      if (!objc_msgSend_containsPackageValues(v377, v378, v379, v380))
        goto LABEL_163;
      objc_msgSend_recordWithDuplicatedPackagesOfRecord_error_(CKRecord, v381, (uint64_t)v377, (uint64_t)a3);
      v384 = objc_claimAutoreleasedReturnValue();
      if (!v384)
      {
        objc_msgSend_destroyPackagesInRecords_(v484, v385, (uint64_t)v355, v386);

LABEL_181:
        v4 = v485;
        goto LABEL_182;
      }
      v387 = (void *)v384;
      objc_msgSend_addObject_(v355, v385, v384, v386);
      v388 = v387;

      v377 = v388;
LABEL_163:
      objc_msgSend_recordsByRecordIDs(v484, v381, v382, v383);
      v389 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v377, v390, v391, v392);
      v393 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v389, v394, (uint64_t)v377, (uint64_t)v393);

      objc_msgSend_recordID(v377, v395, v396, v397);
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v482, v399, (uint64_t)v398, v400);

      objc_msgSend_addObject_(v356, v401, (uint64_t)v377, v402);
      if (v366 != ++v368)
        continue;
      break;
    }
    v366 = objc_msgSend_countByEnumeratingWithState_objects_count_(v360, v363, (uint64_t)&v501, (uint64_t)v539, 16);
    if (v366)
      continue;
    break;
  }
LABEL_165:

  objc_msgSend_setRecordsToSave_(v484, v403, (uint64_t)v356, v404);
  objc_msgSend_recordsToSave(v484, v405, v406, v407);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v408, v409, v410, v411))
  {

    v4 = v485;
    goto LABEL_191;
  }
  objc_msgSend_recordIDsToDelete(v484, v412, v413, v414);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  v440 = objc_msgSend_count(v436, v437, v438, v439);

  v4 = v485;
  if (!v440)
    goto LABEL_183;
LABEL_191:
  v499 = 0u;
  v500 = 0u;
  v497 = 0u;
  v498 = 0u;
  objc_msgSend_recordsToSave(v484, v415, v416, v417);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  v442 = objc_msgSend_countByEnumeratingWithState_objects_count_(v360, v441, (uint64_t)&v497, (uint64_t)v538, 16);
  if (v442)
  {
    v446 = v442;
    v447 = *(_QWORD *)v498;
LABEL_193:
    v448 = 0;
    while (1)
    {
      if (*(_QWORD *)v498 != v447)
        objc_enumerationMutation(v360);
      objc_msgSend_recordID(*(void **)(*((_QWORD *)&v497 + 1) + 8 * v448), v443, v444, v445);
      v449 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v449, v450, v451, v452);
      v453 = (void *)objc_claimAutoreleasedReturnValue();
      v455 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(v484, v454, (uint64_t)v453, (uint64_t)a3);

      if (!v455)
        break;
      if (v446 == ++v448)
      {
        v446 = objc_msgSend_countByEnumeratingWithState_objects_count_(v360, v443, (uint64_t)&v497, (uint64_t)v538, 16);
        if (v446)
          goto LABEL_193;
        goto LABEL_199;
      }
    }
LABEL_182:

LABEL_183:
    v324 = 0;
  }
  else
  {
LABEL_199:

    v495 = 0u;
    v496 = 0u;
    v493 = 0u;
    v494 = 0u;
    objc_msgSend_recordIDsToDelete(v484, v456, v457, v458);
    v360 = (void *)objc_claimAutoreleasedReturnValue();
    v460 = objc_msgSend_countByEnumeratingWithState_objects_count_(v360, v459, (uint64_t)&v493, (uint64_t)v537, 16);
    if (v460)
    {
      v464 = v460;
      v465 = *(_QWORD *)v494;
LABEL_201:
      v466 = 0;
      while (1)
      {
        if (*(_QWORD *)v494 != v465)
          objc_enumerationMutation(v360);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v493 + 1) + 8 * v466), v461, v462, v463);
        v467 = (void *)objc_claimAutoreleasedReturnValue();
        v469 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(v484, v468, (uint64_t)v467, (uint64_t)a3);

        if (!v469)
          goto LABEL_182;
        if (v464 == ++v466)
        {
          v464 = objc_msgSend_countByEnumeratingWithState_objects_count_(v360, v461, (uint64_t)&v493, (uint64_t)v537, 16);
          if (v464)
            goto LABEL_201;
          break;
        }
      }
    }

    v492.receiver = v484;
    v492.super_class = (Class)CKModifyRecordsOperation;
    v324 = -[CKDatabaseOperation CKOperationShouldRun:](&v492, sel_CKOperationShouldRun_, a3);
  }

LABEL_136:
LABEL_137:

  return v324;
}

- (BOOL)_prepareFieldValuesForUploadWithError:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  const char *v24;
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
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  id v73;
  void *v74;
  _QWORD v75[4];
  id v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[3];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v103 = 0;
  v104 = &v103;
  v105 = 0x2020000000;
  v106 = 0;
  v99 = 0;
  v100 = &v99;
  v101 = 0x2020000000;
  v102 = 0;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v98 = 0;
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  objc_msgSend_database(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v7, v8, v9, v10);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend_recordsToSave(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v83, (uint64_t)v108, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v84;
LABEL_3:
    v20 = 0;
    v21 = v16;
    while (1)
    {
      if (*(_QWORD *)v84 != v19)
        objc_enumerationMutation(v14);
      v22 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v20);
      v82 = v21;
      v23 = objc_msgSend_prepareMergeablesForUploadInContainer_useAssetsIfNecessary_error_(v22, v17, (uint64_t)v74, 1, &v82);
      v16 = v82;

      if ((v23 & 1) == 0)
        break;
      v107[0] = objc_opt_class();
      v107[1] = objc_opt_class();
      v107[2] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)v107, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = sub_18A7B2640;
      v75[3] = &unk_1E1F654D8;
      v76 = v73;
      v77 = &v87;
      v78 = &v95;
      v79 = &v91;
      v80 = &v103;
      v81 = &v99;
      objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v22, v26, (uint64_t)v25, (uint64_t)v75);

      ++v20;
      v21 = v16;
      if (v18 == v20)
      {
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v83, (uint64_t)v108, 16);
        if (v18)
          goto LABEL_3;
        break;
      }
    }
  }

  v29 = v104[3];
  if (v29)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v27, v29, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v30, (uint64_t)CFSTR("mergeable_valueCount"));

  }
  v36 = v100[3];
  if (v36)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v27, v36, v28);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v41, v42, (uint64_t)v37, (uint64_t)CFSTR("mergeable_savedDeltaCount"));

  }
  v43 = v96[3];
  if (v43)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v27, v43, v28);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v48, v49, (uint64_t)v44, (uint64_t)CFSTR("mergeable_savedReplacementDeltaCount"));

  }
  v50 = v92[3];
  if (v50)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v27, v50, v28);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v55, v56, (uint64_t)v51, (uint64_t)CFSTR("mergeable_replacedDeltaCount"));

  }
  v57 = v88[3];
  if (v57)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v27, v57, v28);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v62, v63, (uint64_t)v58, (uint64_t)CFSTR("mergeable_assetCount"));

  }
  if (!v16)
  {
    objc_msgSend_deviceContext(self, v27, v57, v28);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceScopedStateManager(v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trackAssets_(v68, v69, (uint64_t)v73, v70);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v16);

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);

  return v16 == 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performModifyRecordsOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  char v12;
  const char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  objc_super v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordsToSave(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMap_(v5, v6, (uint64_t)&unk_1E1F58918, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v9 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v16 = v9;
    objc_msgSend_operationID(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordIDsToDelete(self, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v20;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v24;
    _os_log_debug_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_DEBUG, "Modifying records with operation %{public}@ recordsToSave=%@ recordIDsToDelete=%@", buf, 0x20u);

  }
  v26 = 0;
  v12 = objc_msgSend__prepareFieldValuesForUploadWithError_(self, v10, (uint64_t)&v26, v11);
  v15 = v26;
  if ((v12 & 1) != 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)CKModifyRecordsOperation;
    -[CKOperation performCKOperation](&v25, sel_performCKOperation);
  }
  else
  {
    objc_msgSend_finishWithError_(self, v13, (uint64_t)v15, v14);
  }

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
  CKModifyRecordsOperation *v24;

  v6 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_18A7B2E00;
  v23[4] = sub_18A7B2E10;
  v24 = self;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_18A7B2E00;
  v17 = sub_18A7B2E10;
  v18 = 0;
  v11[5] = &v13;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A7B2E18;
  v12[3] = &unk_1E1F626E8;
  v12[4] = v23;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A7B2E68;
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

- (void)handleRecordIDsInFlight:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  CKSignpost *signpost;
  CKSignpost *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKSignpost *v13;
  CKSignpost *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  CKSignpost *v19;
  CKSignpost *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  os_signpost_id_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void (**v30)(void *, id);
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  id v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v9 = signpost;

  if (v9)
  {
    if (self)
      v13 = self->super.super._signpost;
    else
      v13 = 0;
    v14 = v13;
    objc_msgSend_log(v14, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    if (self)
      v19 = self->super.super._signpost;
    else
      v19 = 0;
    v20 = v19;
    v24 = objc_msgSend_identifier(v20, v21, v22, v23);

    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      v48 = 138412290;
      v49 = v6;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v18, OS_SIGNPOST_EVENT, v24, "CKModifyRecordsOperation", "Records in flight: %@", (uint8_t *)&v48, 0xCu);
    }

  }
  objc_msgSend_recordsInFlightBlock_wrapper(self, v10, v11, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v25;
  if (v25)
  {
    v30 = (void (**)(void *, id))_Block_copy(v25);
  }
  else
  {
    objc_msgSend_recordsInFlightBlock(self, v26, v27, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void (**)(void *, id))_Block_copy(v31);

  }
  if (v30)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v32 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v34 = v32;
      objc_msgSend_operationID(self, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543618;
      v49 = v38;
      v50 = 2112;
      v51 = (uint64_t)v6;
      _os_log_debug_impl(&dword_18A5C5000, v34, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about records in flight %@", (uint8_t *)&v48, 0x16u);

    }
    v30[2](v30, v6);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v33 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v39 = v33;
      objc_msgSend_operationID(self, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend_count(v6, v44, v45, v46);
      v48 = 138543618;
      v49 = v43;
      v50 = 2048;
      v51 = v47;
      _os_log_debug_impl(&dword_18A5C5000, v39, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received %lu records in flight, but no recordsInFlightBlock has been set.", (uint8_t *)&v48, 0x16u);

    }
  }
  v7[2](v7, 0);

}

- (void)handleRecordModificationForRecordID:(id)a3 didProgress:(double)a4
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
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void (**v36)(void *, void *, double);
  NSObject *v37;
  void *v38;
  int v39;
  id v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
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
      v39 = 138412546;
      v40 = v6;
      v41 = 2048;
      v42 = a4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v17, OS_SIGNPOST_EVENT, v23, "CKModifyRecordsOperation", "Record %@ updated progress %f", (uint8_t *)&v39, 0x16u);
    }

  }
  objc_msgSend_recordsByRecordIDs(self, v9, v10, v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)v6, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend_perRecordProgressBlock_wrapper(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v31;
    if (v31)
    {
      v36 = (void (**)(void *, void *, double))_Block_copy(v31);
    }
    else
    {
      objc_msgSend_perRecordProgressBlock(self, v32, v33, v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void (**)(void *, void *, double))_Block_copy(v38);

    }
    if (v36)
      v36[2](v36, v27, a4);

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v37 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v39 = 138412290;
      v40 = v6;
      _os_log_error_impl(&dword_18A5C5000, v37, OS_LOG_TYPE_ERROR, "Received progress callback with nil record for recordID %@", (uint8_t *)&v39, 0xCu);
    }
  }

}

- (void)handleDeleteForRecordID:(id)a3 error:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CKSignpost *signpost;
  CKSignpost *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKSignpost *v16;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  CKSignpost *v22;
  CKSignpost *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  uint32_t v31;
  CKSignpost *v32;
  CKSignpost *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  CKSignpost *v37;
  CKSignpost *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void (**v58)(void *, id, void *);
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  _BYTE v75[24];
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v12 = signpost;

  if (!v10)
  {
    if (!v12)
    {
      if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) != 0)
        goto LABEL_29;
      goto LABEL_27;
    }
    if (self)
      v32 = self->super.super._signpost;
    else
      v32 = 0;
    v33 = v32;
    objc_msgSend_log(v33, v34, v35, v36);
    v21 = objc_claimAutoreleasedReturnValue();

    if (self)
      v37 = self->super.super._signpost;
    else
      v37 = 0;
    v38 = v37;
    v42 = objc_msgSend_identifier(v38, v39, v40, v41);

    if ((unint64_t)(v42 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21))
      goto LABEL_21;
    *(_DWORD *)v75 = 138412290;
    *(_QWORD *)&v75[4] = v6;
    v28 = "Record %@ deleted";
    v29 = v21;
    v30 = v42;
    v31 = 12;
    goto LABEL_20;
  }
  if (!v12)
  {
    if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) != 0)
      goto LABEL_29;
    goto LABEL_25;
  }
  if (self)
    v16 = self->super.super._signpost;
  else
    v16 = 0;
  v17 = v16;
  objc_msgSend_log(v17, v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();

  if (self)
    v22 = self->super.super._signpost;
  else
    v22 = 0;
  v23 = v22;
  v27 = objc_msgSend_identifier(v23, v24, v25, v26);

  if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)v75 = 138412546;
    *(_QWORD *)&v75[4] = v6;
    *(_WORD *)&v75[12] = 2112;
    *(_QWORD *)&v75[14] = v10;
    v28 = "Record %@ deleted with error: %@";
    v29 = v21;
    v30 = v27;
    v31 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v29, OS_SIGNPOST_EVENT, v30, "CKModifyRecordsOperation", v28, v75, v31);
  }
LABEL_21:

  if ((objc_msgSend_canDropItemResultsEarly(self, v43, v44, v45) & 1) != 0)
    goto LABEL_29;
  if (!v10)
  {
LABEL_27:
    objc_msgSend_deletedRecordIDs(self, v46, v47, v48, *(_QWORD *)v75, *(_OWORD *)&v75[8]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v49, v51, (uint64_t)v6, v52);
    goto LABEL_28;
  }
LABEL_25:
  objc_msgSend_recordErrors(self, v46, v47, v48, *(_OWORD *)v75, *(_QWORD *)&v75[16]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v49, v50, (uint64_t)v10, (uint64_t)v6);
LABEL_28:

LABEL_29:
  objc_msgSend_perRecordDeleteBlock_wrapper(self, v46, v47, v48, *(_QWORD *)v75, *(_QWORD *)&v75[8]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v53;
  if (v53)
  {
    v58 = (void (**)(void *, id, void *))_Block_copy(v53);
  }
  else
  {
    objc_msgSend_perRecordDeleteBlock(self, v54, v55, v56);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void (**)(void *, id, void *))_Block_copy(v59);

  }
  if (v58)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v63 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v70 = v63;
      objc_msgSend_operationID(self, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v75 = 138543874;
      *(_QWORD *)&v75[4] = v74;
      *(_WORD *)&v75[12] = 2112;
      *(_QWORD *)&v75[14] = v6;
      *(_WORD *)&v75[22] = 2112;
      v76 = v10;
      _os_log_debug_impl(&dword_18A5C5000, v70, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about deleted record with ID %@: %@", v75, 0x20u);

    }
    v58[2](v58, v6, v10);
  }
  objc_msgSend_configuration(self, v60, v61, v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleRecordChanged_changeType_record_error_(v68, v69, (uint64_t)v6, 3, 0, v10);

}

- (void)handleSaveForRecordID:(id)a3 recordMetadata:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CKSignpost *signpost;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  CKSignpost *v22;
  CKSignpost *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  CKSignpost *v28;
  CKSignpost *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  uint32_t v37;
  CKSignpost *v38;
  CKSignpost *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  CKSignpost *v43;
  CKSignpost *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  _BOOL4 v58;
  CKModifyRecordsOperation *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  uint64_t v91;
  void *v92;
  id v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t shouldOnlySaveAssetContent;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void (**v118)(void *, void *, id, _QWORD);
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void (**v124)(id, void *, _QWORD);
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  id v144;
  NSObject *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  NSObject *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  id v175;
  id v176;
  void *v177;
  CKModifyRecordsOperation *v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  id v183;
  uint8_t buf[4];
  id v185;
  __int16 v186;
  id v187;
  __int16 v188;
  void *v189;
  __int16 v190;
  void *v191;
  _BYTE v192[128];
  uint64_t v193;

  v193 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend_CKClientSuitableError(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v17 = signpost;

  if (v15)
  {
    if (!v17)
      goto LABEL_22;
    v21 = v11;
    if (self)
      v22 = self->super.super._signpost;
    else
      v22 = 0;
    v23 = v22;
    objc_msgSend_log(v23, v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    if (self)
      v28 = self->super.super._signpost;
    else
      v28 = 0;
    v29 = v28;
    v33 = objc_msgSend_identifier(v29, v30, v31, v32);

    if ((unint64_t)(v33 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v27))
      goto LABEL_21;
    *(_DWORD *)buf = 138412546;
    v185 = v9;
    v186 = 2112;
    v187 = v15;
    v34 = "Record %@ saved with error: %@";
    v35 = v27;
    v36 = v33;
    v37 = 22;
    goto LABEL_20;
  }
  if (!v17)
    goto LABEL_22;
  v21 = v11;
  if (self)
    v38 = self->super.super._signpost;
  else
    v38 = 0;
  v39 = v38;
  objc_msgSend_log(v39, v40, v41, v42);
  v27 = objc_claimAutoreleasedReturnValue();

  if (self)
    v43 = self->super.super._signpost;
  else
    v43 = 0;
  v44 = v43;
  v48 = objc_msgSend_identifier(v44, v45, v46, v47);

  if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 138412290;
    v185 = v9;
    v34 = "Record %@ saved";
    v35 = v27;
    v36 = v48;
    v37 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v35, OS_SIGNPOST_EVENT, v36, "CKModifyRecordsOperation", v34, buf, v37);
  }
LABEL_21:

  v11 = v21;
LABEL_22:
  objc_msgSend_recordsByRecordIDs(self, v18, v19, v20);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v49, v50, (uint64_t)v9, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    v183 = 0;
    v178 = self;
    v54 = objc_msgSend_claimPackagesInRecord_error_(self, v53, (uint64_t)v52, (uint64_t)&v183);
    v176 = v183;
    v58 = v176 != 0;
    if (!v54)
      v58 = v176 == 0;
    if (v58)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v55, v56, v57);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v62;
      if (v54)
        v65 = "succeeded";
      else
        v65 = "failed";
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v62, v63, (uint64_t)a2, (uint64_t)v178, CFSTR("CKModifyRecordsOperation.m"), 649, CFSTR("Expecting packageClaimError(%@) only on failure (%s)"), v176, v65);

      if ((v54 & 1) != 0)
        goto LABEL_27;
    }
    else if ((v54 & 1) != 0)
    {
LABEL_27:
      v59 = v178;
      goto LABEL_43;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v66 = ck_log_facility_ck;
    v59 = v178;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v185 = v52;
      v186 = 2112;
      v187 = v176;
      _os_log_impl(&dword_18A5C5000, v66, OS_LOG_TYPE_INFO, "Claim package failed for record: %@, error: %@", buf, 0x16u);
    }
    if (!v11)
      v11 = v176;
LABEL_43:
    objc_msgSend_CKClientSuitableError(v11, v55, v56, v57);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v177 = v52;
    if (v61)
    {
      if ((objc_msgSend_canDropItemResultsEarly(v59, v67, v68, v69) & 1) != 0)
        goto LABEL_60;
      objc_msgSend_recordErrors(v59, v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v73, v74, (uint64_t)v61, (uint64_t)v9);
    }
    else
    {
      objc_msgSend_assetsByRecordIDAndRecordKey(v59, v67, v68, v69);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend_count(v75, v76, v77, v78);

      if (v79)
      {
        v174 = v11;
        v175 = v10;
        v181 = 0u;
        v182 = 0u;
        v179 = 0u;
        v180 = 0u;
        objc_msgSend_allKeys(v52, v80, v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v179, (uint64_t)v192, 16);
        if (v85)
        {
          v88 = v85;
          v89 = *(_QWORD *)v180;
          do
          {
            for (i = 0; i != v88; ++i)
            {
              if (*(_QWORD *)v180 != v89)
                objc_enumerationMutation(v83);
              v91 = *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * i);
              objc_msgSend_objectForKeyedSubscript_(v52, v86, v91, v87);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v93 = v92;
                objc_msgSend_assetsByRecordIDAndRecordKey(v178, v94, v95, v96);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v97, v98, (uint64_t)v9, v99);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v100, v101, v91, v102);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setAssets_(v93, v104, (uint64_t)v103, v105);

                v52 = v177;
              }

            }
            v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v86, (uint64_t)&v179, (uint64_t)v192, 16);
          }
          while (v88);
        }

        v11 = v174;
        v10 = v175;
        v59 = v178;
        v61 = 0;
      }
      shouldOnlySaveAssetContent = objc_msgSend_shouldOnlySaveAssetContent(v59, v80, v81, v82);
      objc_msgSend_updateWithSavedRecordXPCMetadata_shouldOnlySaveAssetContent_(v52, v107, (uint64_t)v10, shouldOnlySaveAssetContent);
      if ((objc_msgSend_canDropItemResultsEarly(v59, v108, v109, v110) & 1) != 0)
      {
LABEL_60:
        objc_msgSend_perRecordSaveBlock_wrapper(v59, v70, v71, v72);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v113;
        if (v113)
        {
          v118 = (void (**)(void *, void *, id, _QWORD))_Block_copy(v113);
        }
        else
        {
          objc_msgSend_perRecordSaveBlock(v59, v114, v115, v116);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = (void (**)(void *, void *, id, _QWORD))_Block_copy(v119);

        }
        if (v118)
        {
          v123 = v61;
          if (v61)
            v124 = 0;
          else
            v124 = v52;
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v133 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          {
            v144 = v10;
            v145 = v133;
            objc_msgSend_operationID(v178, v146, v147, v148);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v52, v150, v151, v152);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordChangeTag(v52, v154, v155, v156);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v185 = v149;
            v186 = 2112;
            v187 = v153;
            v188 = 2112;
            v189 = v157;
            v190 = 2112;
            v191 = v123;
            _os_log_debug_impl(&dword_18A5C5000, v145, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about saved record with ID %@ etag=%@: %@", buf, 0x2Au);

            v52 = v177;
            v10 = v144;
          }
          objc_msgSend_recordID(v52, v134, v135, v136);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(void *, void *, id, void *))v118)[2](v118, v137, v124, v123);

        }
        else
        {
          objc_msgSend_perRecordCompletionBlock(v59, v120, v121, v122);
          v125 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v125)
          {
LABEL_79:
            objc_msgSend_configuration(v59, v126, v127, v128);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_container(v138, v139, v140, v141);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleRecordChanged_changeType_record_error_(v142, v143, (uint64_t)v9, 2, v52, v61);

            goto LABEL_80;
          }
          v123 = v61;
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v129 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          {
            v158 = v129;
            objc_msgSend_operationID(v178, v159, v160, v161);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v52, v163, v164, v165);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordChangeTag(v52, v167, v168, v169);
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v185 = v162;
            v186 = 2112;
            v187 = v166;
            v188 = 2112;
            v189 = v170;
            v190 = 2112;
            v191 = v123;
            _os_log_debug_impl(&dword_18A5C5000, v158, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about saved record with ID %@ etag=%@: %@", buf, 0x2Au);

            v52 = v177;
            objc_msgSend_perRecordCompletionBlock(v178, v171, v172, v173);
          }
          else
          {
            objc_msgSend_perRecordCompletionBlock(v59, v130, v131, v132);
          }
          v124 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, void *))v124)[2](v124, v52, v123);
        }

        v59 = v178;
        v61 = v123;
        goto LABEL_79;
      }
      objc_msgSend_savedRecords(v59, v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v73, v111, (uint64_t)v52, v112);
    }

    goto LABEL_60;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v60 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v185 = v9;
    _os_log_error_impl(&dword_18A5C5000, v60, OS_LOG_TYPE_ERROR, "Received progress callback with nil record for recordID %@", buf, 0xCu);
  }
  v61 = v15;
LABEL_80:

}

- (void)handleRecordUploadForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 signature:(id)a6 size:(unint64_t)a7 paddedFileSize:(unint64_t)a8 uploaded:(BOOL)a9 uploadReceipt:(id)a10 uploadReceiptExpiration:(double)a11 wrappedAssetKey:(id)a12 clearAssetKey:(id)a13 referenceSignature:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  id v36;
  void *inited;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  id v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  id v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int8 v84;
  const char *v85;
  uint64_t v86;
  NSObject *v87;
  id v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  CKAsset *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  NSObject *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  id v118;
  id v119;
  uint8_t buf[4];
  int64_t v121;
  __int16 v122;
  id v123;
  __int16 v124;
  id v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v21 = a6;
  v119 = a10;
  v22 = a12;
  v118 = a13;
  v23 = a14;
  objc_msgSend_recordsByRecordIDs(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)v19, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && v30)
  {
    v115 = (uint64_t)v22;
    objc_msgSend_objectForKeyedSubscript_(v30, v31, (uint64_t)v20, v32);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v114 = (uint64_t)v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = v33;
      v36 = 0;
      inited = v33;
      v38 = v21;
LABEL_5:
      if (inited)
      {
        objc_msgSend_setArrayIndex_(inited, v34, a5, v35);
        objc_msgSend_setSignature_(inited, v39, (uint64_t)v38, v40);
        objc_msgSend_setSize_(inited, v41, a7, v42);
        objc_msgSend_setPaddedFileSize_(inited, v43, a8, v44);
        objc_msgSend_setUploaded_(inited, v45, a9, v46);
        objc_msgSend_setUploadReceipt_(inited, v47, (uint64_t)v119, v48);
        objc_msgSend_setUploadReceiptExpiration_(inited, v49, v50, v51, a11);
        objc_msgSend_setWrappedAssetKey_(inited, v52, v115, v53);
        objc_msgSend_setClearAssetKey_(inited, v54, (uint64_t)v118, v55);
        objc_msgSend_setReferenceSignature_(inited, v56, v114, v57);
        if (v36)
        {
          objc_msgSend_assetsByRecordIDAndRecordKey(self, v58, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)v19, v63);
          v64 = (id)objc_claimAutoreleasedReturnValue();

          if (!v64)
          {
            v64 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend_assetsByRecordIDAndRecordKey(self, v67, v68, v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v70, v71, (uint64_t)v64, (uint64_t)v19);

          }
          objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)v20, v66, v114);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v74)
          {
            v75 = objc_alloc(MEMORY[0x1E0C99DE8]);
            v74 = (void *)objc_msgSend_initWithCapacity_(v75, v76, 2, v77);
            objc_msgSend_setObject_forKeyedSubscript_(v64, v78, (uint64_t)v74, (uint64_t)v20);
            objc_msgSend_setUploaded_(v36, v79, a9, v80);
          }
          objc_msgSend_addObject_(v74, v72, (uint64_t)inited, v73);
          v84 = objc_msgSend_uploaded(v36, v81, v82, v83);
          objc_msgSend_setUploaded_(v36, v85, v84 & a9, v86);

        }
      }
      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v88 = v33;
      v92 = v88;
      if (a5 < 0 || objc_msgSend_count(v88, v89, v90, v91) <= (unint64_t)a5)
      {
        v38 = v21;
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v102 = (void *)ck_log_facility_ck;
        v33 = v92;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          v109 = v102;
          objc_msgSend_recordID(v30, v110, v111, v112);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v121 = a5;
          v122 = 2112;
          v123 = v113;
          _os_log_error_impl(&dword_18A5C5000, v109, OS_LOG_TYPE_ERROR, "Invalid arrayIndex %ld for record %@", buf, 0x16u);

          v33 = v92;
        }
      }
      else
      {
        objc_msgSend_objectAtIndex_(v92, v93, a5, v94);
        v33 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v38 = v21;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = v33;

          v36 = 0;
          inited = v33;
          goto LABEL_5;
        }
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v103 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          v104 = v103;
          objc_msgSend_recordID(v30, v105, v106, v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v121 = a5;
          v122 = 2112;
          v123 = v108;
          _os_log_error_impl(&dword_18A5C5000, v104, OS_LOG_TYPE_ERROR, "Invalid asset at arrayIndex %ld for record %@", buf, 0x16u);

        }
      }

    }
    else
    {
      objc_opt_class();
      v38 = v21;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v33;
        if (objc_msgSend_shouldOnlySaveAssetContent(self, v95, v96, v97))
        {
          v98 = [CKAsset alloc];
          inited = (void *)objc_msgSend_initInternal(v98, v99, v100, v101);
          v33 = v36;
          goto LABEL_5;
        }
        inited = 0;
        v33 = v36;
LABEL_30:

        v23 = (id)v114;
        v22 = (id)v115;
        goto LABEL_31;
      }
    }
    v36 = 0;
    inited = 0;
    goto LABEL_30;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v38 = v21;
  v87 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    v121 = (int64_t)v30;
    v122 = 2114;
    v123 = v20;
    v124 = 2112;
    v125 = v19;
    _os_log_error_impl(&dword_18A5C5000, v87, OS_LOG_TYPE_ERROR, "Received upload completion callback with nil record %p or recordKey %{public}@ for recordID %@", buf, 0x20u);
  }
LABEL_31:

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
  void (**v39)(void *, void *, void *, void *);
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
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
  uint64_t v84;
  uint64_t v85;
  uint64_t j;
  void *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t k;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  objc_super v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint8_t buf[16];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKModifyRecordsOperation", "Finishing", buf, 2u);
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

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to modify some records"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_modifyRecordsCompletionBlock_wrapper(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v34;
  if (v34)
  {
    v39 = (void (**)(void *, void *, void *, void *))_Block_copy(v34);
  }
  else
  {
    objc_msgSend_modifyRecordsCompletionBlock(self, v35, v36, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void (**)(void *, void *, void *, void *))_Block_copy(v40);

  }
  if (v39)
  {
    objc_msgSend_savedRecords(self, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deletedRecordIDs(self, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2](v39, v44, v48, v52);

    objc_msgSend_setModifyRecordsCompletionBlock_(self, v53, 0, v54);
  }
  v55 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  objc_msgSend_savedRecords(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v130, (uint64_t)v137, 16);
  if (v61)
  {
    v65 = v61;
    v66 = *(_QWORD *)v131;
    do
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v131 != v66)
          objc_enumerationMutation(v59);
        objc_msgSend_recordID(*(void **)(*((_QWORD *)&v130 + 1) + 8 * i), v62, v63, v64);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v68, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v55, v73, (uint64_t)v72, v74);

      }
      v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v62, (uint64_t)&v130, (uint64_t)v137, 16);
    }
    while (v65);
  }

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  objc_msgSend_deletedRecordIDs(self, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v79, (uint64_t)&v126, (uint64_t)v136, 16);
  if (v80)
  {
    v84 = v80;
    v85 = *(_QWORD *)v127;
    do
    {
      for (j = 0; j != v84; ++j)
      {
        if (*(_QWORD *)v127 != v85)
          objc_enumerationMutation(v78);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v126 + 1) + 8 * j), v81, v82, v83);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v55, v88, (uint64_t)v87, v89);

      }
      v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v81, (uint64_t)&v126, (uint64_t)v136, 16);
    }
    while (v84);
  }

  if (objc_msgSend_count(v55, v90, v91, v92))
  {
    objc_msgSend_zoneIDsToZoneNamesString_(self, v93, (uint64_t)v55, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v97, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v100, v101, (uint64_t)v96, (uint64_t)CFSTR("zoneNames"));

  }
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  objc_msgSend_packagesToDestroy(self, v93, v94, v95);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(v102, v103, (uint64_t)&v122, (uint64_t)v135, 16);
  if (v104)
  {
    v108 = v104;
    v109 = *(_QWORD *)v123;
    do
    {
      for (k = 0; k != v108; ++k)
      {
        if (*(_QWORD *)v123 != v109)
          objc_enumerationMutation(v102);
        objc_msgSend_removeDB(*(void **)(*((_QWORD *)&v122 + 1) + 8 * k), v105, v106, v107);
      }
      v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v102, v105, (uint64_t)&v122, (uint64_t)v135, 16);
    }
    while (v108);
  }

  objc_msgSend_setPerRecordProgressBlock_(self, v111, 0, v112);
  objc_msgSend_setPerRecordCompletionBlock_(self, v113, 0, v114);
  objc_msgSend_setPerRecordSaveBlock_(self, v115, 0, v116);
  objc_msgSend_setPerRecordDeleteBlock_(self, v117, 0, v118);
  objc_msgSend_setRecordsInFlightBlock_(self, v119, 0, v120);
  v121.receiver = self;
  v121.super_class = (Class)CKModifyRecordsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v121, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKModifyRecordsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKModifyRecordsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/modify-records", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  objc_super v16;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v11, (uint64_t)v10, (uint64_t)sel_handleRecordIDsInFlight_reply_, 0, 0);

  CKErrorUserInfoClasses();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v13, (uint64_t)v12, (uint64_t)sel_handleDeleteForRecordID_error_, 1, 0);

  CKErrorUserInfoClasses();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v15, (uint64_t)v14, (uint64_t)sel_handleSaveForRecordID_recordMetadata_error_, 2, 0);

  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___CKModifyRecordsOperation;
  objc_msgSendSuper2(&v16, sel_applyDaemonCallbackInterfaceTweaks_, v5);

}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(NSArray *)recordsToSave
{
  objc_setProperty_nonatomic_copy(self, a2, recordsToSave, 568);
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(NSArray *)recordIDsToDelete
{
  objc_setProperty_nonatomic_copy(self, a2, recordIDsToDelete, 576);
}

- (CKRecordSavePolicy)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(CKRecordSavePolicy)savePolicy
{
  self->_savePolicy = savePolicy;
}

- (NSData)clientChangeTokenData
{
  return self->_clientChangeTokenData;
}

- (void)setClientChangeTokenData:(NSData *)clientChangeTokenData
{
  objc_setProperty_nonatomic_copy(self, a2, clientChangeTokenData, 592);
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)atomic
{
  self->_atomic = atomic;
}

- (NSMutableArray)savedRecords
{
  return self->_savedRecords;
}

- (void)setSavedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_savedRecords, a3);
}

- (NSMutableArray)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (void)setDeletedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, a3);
}

- (NSMutableDictionary)recordsByRecordIDs
{
  return self->_recordsByRecordIDs;
}

- (void)setRecordsByRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordsByRecordIDs, a3);
}

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
  objc_storeStrong((id *)&self->_recordErrors, a3);
}

- (NSMutableDictionary)assetsByRecordIDAndRecordKey
{
  return self->_assetsByRecordIDAndRecordKey;
}

- (void)setAssetsByRecordIDAndRecordKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetsByRecordIDAndRecordKey, a3);
}

- (BOOL)shouldReportRecordsInFlight
{
  return self->_shouldReportRecordsInFlight;
}

- (void)setShouldReportRecordsInFlight:(BOOL)a3
{
  self->_shouldReportRecordsInFlight = a3;
}

- (NSMutableSet)packagesToDestroy
{
  return self->_packagesToDestroy;
}

- (void)setPackagesToDestroy:(id)a3
{
  objc_storeStrong((id *)&self->_packagesToDestroy, a3);
}

- (id)recordsInFlightBlock_wrapper
{
  return self->_recordsInFlightBlock_wrapper;
}

- (void)setRecordsInFlightBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (id)perRecordProgressBlock_wrapper
{
  return self->_perRecordProgressBlock_wrapper;
}

- (void)setPerRecordProgressBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (id)perRecordSaveBlock_wrapper
{
  return self->_perRecordSaveBlock_wrapper;
}

- (void)setPerRecordSaveBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (id)perRecordDeleteBlock_wrapper
{
  return self->_perRecordDeleteBlock_wrapper;
}

- (void)setPerRecordDeleteBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (id)modifyRecordsCompletionBlock_wrapper
{
  return self->_modifyRecordsCompletionBlock_wrapper;
}

- (void)setModifyRecordsCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (BOOL)alwaysFetchPCSFromServer
{
  return self->_alwaysFetchPCSFromServer;
}

- (void)setAlwaysFetchPCSFromServer:(BOOL)a3
{
  self->_alwaysFetchPCSFromServer = a3;
}

- (BOOL)shouldOnlySaveAssetContent
{
  return self->_shouldOnlySaveAssetContent;
}

- (void)setShouldOnlySaveAssetContent:(BOOL)a3
{
  self->_shouldOnlySaveAssetContent = a3;
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

- (NSDictionary)recordIDsToDeleteToEtags
{
  return self->_recordIDsToDeleteToEtags;
}

- (void)setRecordIDsToDeleteToEtags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (NSDictionary)conflictLosersToResolveByRecordID
{
  return self->_conflictLosersToResolveByRecordID;
}

- (void)setConflictLosersToResolveByRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (NSDictionary)pluginFieldsForRecordDeletesByID
{
  return self->_pluginFieldsForRecordDeletesByID;
}

- (void)setPluginFieldsForRecordDeletesByID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, 0);
  objc_storeStrong(&self->_modifyRecordsCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordDeleteBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordSaveBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordProgressBlock_wrapper, 0);
  objc_storeStrong(&self->_recordsInFlightBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_packagesToDestroy, 0);
  objc_storeStrong((id *)&self->_assetsByRecordIDAndRecordKey, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_recordsByRecordIDs, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_savedRecords, 0);
  objc_storeStrong((id *)&self->_clientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong(&self->_recordsInFlightBlock, 0);
  objc_storeStrong(&self->_modifyRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordDeleteBlock, 0);
  objc_storeStrong(&self->_perRecordSaveBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordProgressBlock, 0);
}

@end
