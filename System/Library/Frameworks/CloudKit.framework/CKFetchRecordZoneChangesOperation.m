@implementation CKFetchRecordZoneChangesOperation

- (NSDictionary)supplementalChangeTokenByZoneID
{
  return self->_supplementalChangeTokenByZoneID;
}

- (NSMutableDictionary)statusByZoneID
{
  return self->_statusByZoneID;
}

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (void)setRecordZoneFetchCompletionBlockIVar:(id)a3
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
    block[2] = sub_18A7ACA90;
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

- (void)setRecordZoneFetchCompletionBlock:(void *)recordZoneFetchCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = recordZoneFetchCompletionBlock == 0;
  v9 = recordZoneFetchCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setRecordZoneFetchCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

}

- (void)setRecordZoneChangeTokensUpdatedBlock:(void *)recordZoneChangeTokensUpdatedBlock
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

  v14 = recordZoneChangeTokensUpdatedBlock;
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
    block[2] = sub_18A7AC8A8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordZoneChangeTokensUpdatedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_recordZoneChangeTokensUpdatedBlock;
    self->_recordZoneChangeTokensUpdatedBlock = v11;
LABEL_9:

    v10 = v14;
  }

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
    block[2] = sub_18A7AC6C0;
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

- (void)setRecordWasChangedBlock:(void *)recordWasChangedBlock
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

  v14 = recordWasChangedBlock;
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
    block[2] = sub_18A7ABFEC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordWasChangedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_recordWasChangedBlock;
    self->_recordWasChangedBlock = v11;
LABEL_9:

    v10 = v14;
  }

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
    block[2] = sub_18A7ABDD4;
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

- (void)setPerRecordChangeCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perRecordChangeCompletionBlock;
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
    block[2] = sub_18A7AC4D8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perRecordChangeCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordChangeCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perRecordChangeCompletionBlock = self->_perRecordChangeCompletionBlock;
    self->_perRecordChangeCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setFetchRecordZoneChangesCompletionBlock:(void *)fetchRecordZoneChangesCompletionBlock
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

  v14 = fetchRecordZoneChangesCompletionBlock;
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
    block[2] = sub_18A7ACB20;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchRecordZoneChangesCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_fetchRecordZoneChangesCompletionBlock;
    self->_fetchRecordZoneChangesCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (id)recordZoneFetchCompletionBlock_wrapper
{
  return self->_recordZoneFetchCompletionBlock_wrapper;
}

- (void)recordZoneFetchCompletionBlock
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
    v15 = sub_18A7ABF7C;
    v16 = sub_18A7ABFA4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7ACAE0;
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
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    objc_msgSend_recordZoneIDs(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_count(v8, v9, v10, v11);
    objc_msgSend_recordZoneIDs(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v16, v17, v18, v19) == 1)
      v23 = &stru_1E1F66ED0;
    else
      v23 = CFSTR("s");
    if (objc_msgSend_fetchAllChanges(self, v20, v21, v22))
      v27 = &stru_1E1F66ED0;
    else
      v27 = CFSTR(" NOT");
    objc_msgSend_configurationsByRecordZoneID(self, v24, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v31 = v12;
    v32 = 2114;
    v33 = v23;
    v34 = 2114;
    v35 = v27;
    v36 = 2112;
    v37 = v28;
    _os_log_debug_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_DEBUG, "Fetching changes from the server for %lu zone%{public}@. Will%{public}@ fetch all changes. Options by zone:\n%@", buf, 0x2Au);

  }
  v29.receiver = self;
  v29.super_class = (Class)CKFetchRecordZoneChangesOperation;
  -[CKOperation performCKOperation](&v29, sel_performCKOperation);
}

- (NSMutableDictionary)perItemErrors
{
  return self->_perItemErrors;
}

- (id)partialFailureForItemsInZone:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  CKFetchRecordZoneChangesOperation *v38;

  v7 = a3;
  if (v7
    && (objc_msgSend_perItemErrors(self, v4, v5, v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend_count(v8, v9, v10, v11),
        v8,
        v12))
  {
    objc_msgSend_perItemErrors(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_18A7ADEB0;
    v36[3] = &unk_1E1F65440;
    v21 = v7;
    v37 = v21;
    v38 = self;
    objc_msgSend_CKCompactMapToDictionary_(v20, v22, (uint64_t)v36, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v24, v25, v26, v27))
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v24, (uint64_t)CFSTR("CKPartialErrors"));
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v31, CFSTR("Couldn't fetch some items when fetching changes in zone %@"), v21);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (CKFetchRecordZoneChangesOperation)init
{
  CKFetchRecordZoneChangesOperation *v2;
  uint64_t v3;
  NSMutableDictionary *statusByZoneID;
  uint64_t v5;
  NSMutableSet *zoneIDsWithPendingArchivedRecords;
  uint64_t v7;
  NSMutableSet *zoneIDsWithSyncObligations;
  uint64_t v9;
  NSMutableDictionary *perItemErrors;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKFetchRecordZoneChangesOperation;
  v2 = -[CKOperation init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    statusByZoneID = v2->_statusByZoneID;
    v2->_statusByZoneID = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    zoneIDsWithPendingArchivedRecords = v2->_zoneIDsWithPendingArchivedRecords;
    v2->_zoneIDsWithPendingArchivedRecords = (NSMutableSet *)v5;

    v7 = objc_opt_new();
    zoneIDsWithSyncObligations = v2->_zoneIDsWithSyncObligations;
    v2->_zoneIDsWithSyncObligations = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    perItemErrors = v2->_perItemErrors;
    v2->_perItemErrors = (NSMutableDictionary *)v9;

    v2->_shouldFetchAssetContents = 1;
    v2->_fetchAllChanges = 1;
    v2->_errorReportingStyle = 1;
  }
  return v2;
}

- (CKFetchRecordZoneChangesOperation)initWithRecordZoneIDs:(NSArray *)recordZoneIDs configurationsByRecordZoneID:(NSDictionary *)configurationsByRecordZoneID
{
  NSArray *v6;
  NSDictionary *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKFetchRecordZoneChangesOperation *v14;
  uint64_t v15;
  NSArray *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSDictionary *v21;

  v6 = recordZoneIDs;
  v7 = configurationsByRecordZoneID;
  v14 = (CKFetchRecordZoneChangesOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    v15 = objc_msgSend_copy(v6, v11, v12, v13);
    v16 = v14->_recordZoneIDs;
    v14->_recordZoneIDs = (NSArray *)v15;

    v20 = objc_msgSend_copy(v7, v17, v18, v19);
    v21 = v14->_configurationsByRecordZoneID;
    v14->_configurationsByRecordZoneID = (NSDictionary *)v20;

  }
  return v14;
}

- (void)handleChangeSetCompletionForRecordZoneID:(id)a3 serverChangeToken:(id)a4 clientChangeTokenData:(id)a5 recordChangesStatus:(int64_t)a6 hasPendingArchivedRecords:(BOOL)a7 syncObligationZoneIDs:(id)a8 error:(id)a9 reply:(id)a10
{
  _BOOL4 v11;
  id v15;
  id v16;
  void (**v17)(id, _QWORD);
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
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
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  CKSignpost *signpost;
  CKSignpost *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  CKSignpost *v50;
  CKSignpost *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  CKSignpost *v56;
  CKSignpost *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  os_signpost_id_t v61;
  int AllChanges;
  const char *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  __CFString *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void (**v98)(void *, id, void *, id, BOOL, _QWORD);
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  NSObject *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  NSObject *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  NSObject *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  NSObject *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const __CFString *v127;
  const __CFString *v128;
  void *v129;
  id v130;
  id v131;
  uint8_t buf[4];
  void *v134;
  __int16 v135;
  int64_t v136;
  __int16 v137;
  id v138;
  __int16 v139;
  id v140;
  __int16 v141;
  const __CFString *v142;
  __int16 v143;
  const __CFString *v144;
  uint64_t v145;

  v11 = a7;
  v145 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v130 = a4;
  v131 = a5;
  v16 = a8;
  v17 = (void (**)(id, _QWORD))a10;
  objc_msgSend_CKClientSuitableError(a9, v18, v19, v20);
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend_perItemErrors(self, v21, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v24, (uint64_t)v15);

  }
  if (a6 != -1)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v27 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v107 = v27;
      objc_msgSend_operationID(self, v108, v109, v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v134 = v111;
      v135 = 2048;
      v136 = a6;
      v137 = 2112;
      v138 = v15;
      _os_log_debug_impl(&dword_18A5C5000, v107, OS_LOG_TYPE_DEBUG, "Operation %{public}@ updating recordChangesStatus to %ld for record zone %@", buf, 0x20u);

    }
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v28, a6, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_statusByZoneID(self, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v30, (uint64_t)v15);

  }
  if (v11)
  {
    objc_msgSend_zoneIDsWithPendingArchivedRecords(self, v21, v22, v23);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v36, v37, (uint64_t)v15, v38);

  }
  if (objc_msgSend_count(v16, v21, v22, v23))
  {
    objc_msgSend_zoneIDsWithSyncObligations(self, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(v42, v43, (uint64_t)v16, v44);

  }
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v46 = signpost;

  if (v46)
  {
    if (self)
      v50 = self->super.super._signpost;
    else
      v50 = 0;
    v51 = v50;
    objc_msgSend_log(v51, v52, v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();

    if (self)
      v56 = self->super.super._signpost;
    else
      v56 = 0;
    v57 = v56;
    v61 = objc_msgSend_identifier(v57, v58, v59, v60);

    if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v55, OS_SIGNPOST_EVENT, v61, "CKFetchRecordZoneChangesOperation", "Progress callback", buf, 2u);
    }

  }
  AllChanges = objc_msgSend_fetchAllChanges(self, v47, v48, v49);
  if (v24 || a6 == 3 || !AllChanges)
  {
    v65 = v130;
    if (v24)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v76 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v117 = v76;
        objc_msgSend_operationID(self, v118, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v134 = v121;
        v135 = 2114;
        v136 = (int64_t)v130;
        v137 = 2114;
        v138 = v131;
        v139 = 2112;
        v140 = v15;
        v141 = 2112;
        v142 = v24;
        _os_log_debug_impl(&dword_18A5C5000, v117, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about per-zone completion with server change token %{public}@, client change token data %{public}@ for zoneID %@. Error was: %@", buf, 0x34u);

      }
      objc_msgSend_recordZoneFetchCompletionBlock_wrapper(self, v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v80;
      if (v80)
      {
        v75 = (__CFString *)_Block_copy(v80);
      }
      else
      {
        objc_msgSend_recordZoneFetchCompletionBlock(self, v81, v82, v83);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = (__CFString *)_Block_copy(v99);

      }
      v66 = v131;
      if (v75)
        ((void (*)(__CFString *, id, _QWORD, _QWORD, _QWORD, __CFString *))v75->data)(v75, v15, 0, 0, 0, v24);
    }
    else
    {
      objc_msgSend_partialFailureForItemsInZone_(self, v63, (uint64_t)v15, v64);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKClientSuitableError(v85, v86, v87, v88);
      v75 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v89 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v122 = v89;
        objc_msgSend_operationID(self, v123, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v127 = CFSTR(" Error was: ");
        v134 = v126;
        v128 = &stru_1E1F66ED0;
        v135 = 2112;
        if (!v75)
          v127 = &stru_1E1F66ED0;
        v136 = (int64_t)v130;
        if (v75)
          v128 = v75;
        v137 = 2114;
        v138 = v131;
        v139 = 2112;
        v140 = v15;
        v141 = 2114;
        v142 = v127;
        v143 = 2112;
        v144 = v128;
        _os_log_debug_impl(&dword_18A5C5000, v122, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about per-zone completion with server change token %@, client change token data %{public}@ for zoneID %@.%{public}@%@", buf, 0x3Eu);

      }
      objc_msgSend_recordZoneFetchCompletionBlock_wrapper(self, v90, v91, v92, v16);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v93;
      if (v93)
      {
        v98 = (void (**)(void *, id, void *, id, BOOL, _QWORD))_Block_copy(v93);
      }
      else
      {
        objc_msgSend_recordZoneFetchCompletionBlock(self, v94, v95, v96);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = (void (**)(void *, id, void *, id, BOOL, _QWORD))_Block_copy(v100);

        v65 = v130;
      }

      if (v98)
        ((void (**)(void *, id, void *, id, BOOL, __CFString *))v98)[2](v98, v15, v65, v131, a6 != 3, v75);

      v66 = v131;
      v16 = v129;
    }
    goto LABEL_52;
  }
  v65 = v130;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v66 = v131;
  v67 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v112 = v67;
    objc_msgSend_operationID(self, v113, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v134 = v116;
    v135 = 2114;
    v136 = (int64_t)v130;
    v137 = 2114;
    v138 = v131;
    v139 = 2112;
    v140 = v15;
    _os_log_debug_impl(&dword_18A5C5000, v112, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a server change token %{public}@, client change token data %{public}@ for zoneID %@", buf, 0x2Au);

    v66 = v131;
  }
  objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v72, v73, v74);
    v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
    ((void (*)(__CFString *, id, id, void *))v75->data)(v75, v15, v130, v66);
LABEL_52:

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v101 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v102 = v101;
    objc_msgSend_operationID(self, v103, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v134 = v106;
    v135 = 2112;
    v136 = (int64_t)v15;
    _os_log_debug_impl(&dword_18A5C5000, v102, OS_LOG_TYPE_DEBUG, "Progress callback for operation %{public}@ zoneID %@ is done", buf, 0x16u);

    v65 = v130;
  }
  v17[2](v17, 0);

}

- (void)fillOutOperationInfo:(id)a3
{
  id *v4;
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
  char AssetContents;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t AllChanges;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
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
  objc_super v47;

  v4 = (id *)a3;
  objc_msgSend_recordZoneIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_configurationsByRecordZoneID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConfigurationsByRecordZoneID_(v4, v15, (uint64_t)v14, v16);

  AssetContents = objc_msgSend_shouldFetchAssetContents(self, v17, v18, v19);
  if (v4)
  {
    *((_BYTE *)v4 + 144) = AssetContents;
    v4[21] = (id)objc_msgSend_changeTypesFromSetCallbacks(self, v21, v22, v23);
  }
  else
  {
    objc_msgSend_changeTypesFromSetCallbacks(self, v21, v22, v23);
  }
  AllChanges = objc_msgSend_fetchAllChanges(self, v24, v25, v26);
  objc_msgSend_setFetchAllChanges_(v4, v28, AllChanges, v29);
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v4)
    objc_storeStrong(v4 + 22, v33);

  objc_msgSend_supplementalChangeTokenByZoneID(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSupplementalChangeTokenByZoneID_(v4, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_errorReportingStyle(self, v41, v42, v43);
  objc_msgSend_setErrorReportingStyle_(v4, v45, v44, v46);
  v47.receiver = self;
  v47.super_class = (Class)CKFetchRecordZoneChangesOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v47, sel_fillOutOperationInfo_, v4);

}

- (id)fetchRecordZoneChangesCompletionBlock_wrapper
{
  return self->_fetchRecordZoneChangesCompletionBlock_wrapper;
}

- (void)fetchRecordZoneChangesCompletionBlock
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
    v15 = sub_18A7ABF7C;
    v16 = sub_18A7ABFA4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7ACB70;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordZoneChangesCompletionBlock);
  }
  return v8;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (int64_t)errorReportingStyle
{
  return self->_errorReportingStyle;
}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchRecordZoneChangesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchRecordZoneChangesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

    }
  }
}

- (int64_t)changeTypesFromSetCallbacks
{
  return 2;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-record-changes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  void (**v39)(void *, void *);
  void *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  unint64_t assetBackedMergeableDeltaCount;
  uint64_t v69;
  unint64_t mergeableValueCount;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  unint64_t mergeableDeltaCount;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  __CFString *v119;
  const __CFString *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  __CFString *v125;
  const __CFString *v126;
  objc_super v127;
  uint8_t buf[4];
  void *v129;
  __int16 v130;
  const __CFString *v131;
  __int16 v132;
  __CFString *v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordZoneChangesOperation", "Finishing", buf, 2u);
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
  objc_msgSend_fetchRecordZoneChangesCompletionBlock_wrapper(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v34;
  if (v34)
  {
    v39 = (void (**)(void *, void *))_Block_copy(v34);
  }
  else
  {
    objc_msgSend_fetchRecordZoneChangesCompletionBlock(self, v35, v36, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void (**)(void *, void *))_Block_copy(v40);

  }
  if (v39)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v41 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v42, v43, v44);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = &stru_1E1F66ED0;
      if (v4)
        v120 = CFSTR(" Error was: ");
      else
        v120 = &stru_1E1F66ED0;
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v115, v116, v117);
        v119 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v129 = v118;
      v130 = 2114;
      v131 = v120;
      v132 = 2112;
      v133 = v119;
      _os_log_debug_impl(&dword_18A5C5000, v41, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed. %{public}@%@", buf, 0x20u);
      if (v4)

    }
    objc_msgSend_CKClientSuitableError(v4, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2](v39, v48);

    objc_msgSend_setFetchRecordZoneChangesCompletionBlock_(self, v49, 0, v50);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v53 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v54, v55, v56);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = &stru_1E1F66ED0;
      if (v4)
        v126 = CFSTR(" Error was: ");
      else
        v126 = &stru_1E1F66ED0;
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v121, v122, v123);
        v125 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v129 = v124;
      v130 = 2114;
      v131 = v126;
      v132 = 2112;
      v133 = v125;
      _os_log_debug_impl(&dword_18A5C5000, v53, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no fetchRecordZoneChangesCompletionBlock was set.%{public}@%@", buf, 0x20u);
      if (v4)

    }
  }
  objc_msgSend_setRecordChangedBlock_(self, v51, 0, v52);
  objc_msgSend_setRecordWasChangedBlock_(self, v57, 0, v58);
  objc_msgSend_setRecordWithIDWasDeletedBlock_(self, v59, 0, v60);
  objc_msgSend_setRecordZoneChangeTokensUpdatedBlock_(self, v61, 0, v62);
  objc_msgSend_setRecordZoneFetchCompletionBlock_(self, v63, 0, v64);
  objc_msgSend_setPerRecordChangeCompletionBlock_(self, v65, 0, v66);
  if (self)
  {
    mergeableValueCount = self->_mergeableValueCount;
    if (mergeableValueCount)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v67, mergeableValueCount, v69);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationMetric(self, v72, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v75, v76, (uint64_t)v71, (uint64_t)CFSTR("mergeable_valueCount"));

    }
    mergeableDeltaCount = self->_mergeableDeltaCount;
    if (mergeableDeltaCount)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v67, mergeableDeltaCount, v69);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationMetric(self, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v82, v83, (uint64_t)v78, (uint64_t)CFSTR("mergeable_fetchedDeltaCount"));

    }
    assetBackedMergeableDeltaCount = self->_assetBackedMergeableDeltaCount;
    if (assetBackedMergeableDeltaCount)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v67, assetBackedMergeableDeltaCount, v69);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationMetric(self, v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v88, v89, (uint64_t)v84, (uint64_t)CFSTR("mergeable_assetCount"));

    }
  }
  objc_msgSend_recordZoneIDs(self, v67, assetBackedMergeableDeltaCount, v69);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend_count(v90, v91, v92, v93);

  if (v94)
  {
    v98 = (void *)MEMORY[0x1E0C99E20];
    v99 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend_recordZoneIDs(self, v95, v96, v97);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(v99, v101, (uint64_t)v100, v102, 0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v98, v104, (uint64_t)v103, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_zoneIDsToZoneNamesString_(self, v107, (uint64_t)v106, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v113, v114, (uint64_t)v109, (uint64_t)CFSTR("zoneNames"));

  }
  v127.receiver = self;
  v127.super_class = (Class)CKFetchRecordZoneChangesOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v127, sel__finishOnCallbackQueueWithError_, v4);

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
    v25.super_class = (Class)CKFetchRecordZoneChangesOperation;
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_zoneAttributesChangedBlock_wrapper, 0);
  objc_storeStrong(&self->_fetchRecordZoneChangesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_recordZoneFetchCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_recordWithIDWasDeletedBlock_wrapper, 0);
  objc_storeStrong(&self->_recordWasChangedBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_perItemErrors, 0);
  objc_storeStrong((id *)&self->_zoneIDsWithSyncObligations, 0);
  objc_storeStrong((id *)&self->_zoneIDsWithPendingArchivedRecords, 0);
  objc_storeStrong((id *)&self->_statusByZoneID, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong(&self->_fetchRecordZoneChangesCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneFetchCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneChangeTokensUpdatedBlock, 0);
  objc_storeStrong(&self->_recordWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_perRecordChangeCompletionBlock, 0);
  objc_storeStrong(&self->_zoneAttributesChangedBlock, 0);
  objc_storeStrong(&self->_recordWasChangedBlock, 0);
  objc_storeStrong(&self->_recordChangedBlock, 0);
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchRecordZoneChangesOperation_withBlock_;
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
    v15 = sub_18A7ABF7C;
    v16 = sub_18A7ABFA4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7ABFAC;
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

- (void)recordWasChangedBlock
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
    v15 = sub_18A7ABF7C;
    v16 = sub_18A7ABFA4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AC194;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordWasChangedBlock);
  }
  return v8;
}

- (void)setZoneAttributesChangedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id zoneAttributesChangedBlock;
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
    block[2] = sub_18A7AC2F0;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    zoneAttributesChangedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_zoneAttributesChangedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    zoneAttributesChangedBlock = self->_zoneAttributesChangedBlock;
    self->_zoneAttributesChangedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)zoneAttributesChangedBlock
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
    v15 = sub_18A7ABF7C;
    v16 = sub_18A7ABFA4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AC498;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_zoneAttributesChangedBlock);
  }
  return v8;
}

- (id)perRecordChangeCompletionBlock
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
    v15 = sub_18A7ABF7C;
    v16 = sub_18A7ABFA4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AC680;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordChangeCompletionBlock);
  }
  return v8;
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
    v15 = sub_18A7ABF7C;
    v16 = sub_18A7ABFA4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AC868;
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

- (void)recordZoneChangeTokensUpdatedBlock
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
    v15 = sub_18A7ABF7C;
    v16 = sub_18A7ABFA4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7ACA50;
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

- (id)recordZoneChangesStatusByZoneID
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

- (id)recordZoneIDsWithPendingArchivedRecords
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_zoneIDsWithPendingArchivedRecords(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copy(v4, v5, v6, v7);

  return v8;
}

- (id)recordZoneIDsWithSyncObligations
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_zoneIDsWithSyncObligations(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)relevantZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setErrorReportingStyle:(int64_t)a3
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  const char *v9;

  if (a3 == 2)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 2, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v9, (uint64_t)a2, (uint64_t)self, CFSTR("CKFetchRecordZoneChangesOperation.m"), 121, CFSTR("%@ doesn't support error reporting style %lld"), v8, 2);

  }
  self->_errorReportingStyle = a3;
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
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CKFetchRecordZoneChangesOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v47, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordZoneIDs(v4, v5, v6, v7, v47.receiver, v47.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_configurationsByRecordZoneID(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConfigurationsByRecordZoneID_(self, v15, (uint64_t)v14, v16);

  AssetContents = objc_msgSend_shouldFetchAssetContents(v4, v17, v18, v19);
  objc_msgSend_setShouldFetchAssetContents_(self, v21, AssetContents, v22);
  AllChanges = objc_msgSend_fetchAllChanges(v4, v23, v24, v25);
  objc_msgSend_setFetchAllChanges_(self, v27, AllChanges, v28);
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v4, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(self, v33, (uint64_t)v32, v34);

  objc_msgSend_supplementalChangeTokenByZoneID(v4, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSupplementalChangeTokenByZoneID_(self, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_errorReportingStyle(v4, v41, v42, v43);
  objc_msgSend_setErrorReportingStyle_(self, v45, v44, v46);
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CKFetchRecordZoneChangesOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v33, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_recordChangedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_recordWasChangedBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_perRecordChangeCompletionBlock(self, v11, v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend_recordWithIDWasDeletedBlock(self, v15, v16, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v19, v20, v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v6 = 1;
          }
          else
          {
            objc_msgSend_recordZoneFetchCompletionBlock(self, v23, v24, v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v6 = 1;
            }
            else
            {
              objc_msgSend_fetchRecordZoneChangesCompletionBlock(self, v27, v28, v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v31 != 0;

            }
          }

        }
      }

    }
  }

  return v6;
}

- (void)handleChangeForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  __CFString *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  const char *v14;
  uint64_t v15;
  CKSignpost *signpost;
  CKSignpost *v17;
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
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  uint32_t v33;
  CKSignpost *v34;
  CKSignpost *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  CKSignpost *v39;
  CKSignpost *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void (**v68)(void *, id, id, void *);
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void (**v81)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void (**v86)(_QWORD, _QWORD);
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  __CFString *v91;
  NSObject *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  __CFString *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const __CFString *v103;
  void *v104;
  void *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  __CFString *v118;
  _QWORD v119[5];
  uint8_t buf[4];
  __CFString *v121;
  __int16 v122;
  const __CFString *v123;
  __int16 v124;
  __CFString *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  __CFString *v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v119[0] = MEMORY[0x1E0C809B0];
  v119[1] = 3221225472;
  v119[2] = sub_18A7AD6B4;
  v119[3] = &unk_1E1F645F0;
  v119[4] = self;
  objc_msgSend_countMergeableValueMetrics_(v9, v14, (uint64_t)v119, v15);
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v17 = signpost;

  if (v13)
  {
    if (!v17)
      goto LABEL_22;
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

    if ((unint64_t)(v29 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v23))
      goto LABEL_21;
    *(_DWORD *)buf = 138412546;
    v121 = v8;
    v122 = 2112;
    v123 = v13;
    v30 = "Record %@ changed with error: %@";
    v31 = v23;
    v32 = v29;
    v33 = 22;
    goto LABEL_20;
  }
  if (!v17)
    goto LABEL_22;
  if (self)
    v34 = self->super.super._signpost;
  else
    v34 = 0;
  v35 = v34;
  objc_msgSend_log(v35, v36, v37, v38);
  v23 = objc_claimAutoreleasedReturnValue();

  if (self)
    v39 = self->super.super._signpost;
  else
    v39 = 0;
  v40 = v39;
  v44 = objc_msgSend_identifier(v40, v41, v42, v43);

  if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_DWORD *)buf = 138412290;
    v121 = v8;
    v30 = "Record %@ changed";
    v31 = v23;
    v32 = v44;
    v33 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v31, OS_SIGNPOST_EVENT, v32, "CKFetchRecordZoneChangesOperation", v30, buf, v33);
  }
LABEL_21:

LABEL_22:
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v45 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v92 = v45;
    objc_msgSend_operationID(self, v93, v94, v95);
    v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isMergeableValueDeltaRecord(v9, v97, v98, v99))
      v103 = CFSTR("mergeable delta partial ");
    else
      v103 = &stru_1E1F66ED0;
    objc_msgSend_recordChangeTag(v9, v100, v101, v102);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v121 = v96;
    v122 = 2112;
    v123 = v103;
    v124 = 2112;
    v125 = v8;
    v126 = 2112;
    v127 = v104;
    v128 = 2112;
    v129 = v13;
    _os_log_debug_impl(&dword_18A5C5000, v92, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a changed %@record with id %@ etag=%@, error %@", buf, 0x34u);

    if (!v13)
      goto LABEL_31;
  }
  else if (!v13)
  {
    goto LABEL_31;
  }
  if ((objc_msgSend_canDropItemResultsEarly(self, v46, v47, v48) & 1) == 0)
  {
    objc_msgSend_perItemErrors(self, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v52, v53, (uint64_t)v13, (uint64_t)v8);

  }
  if (objc_msgSend_CKHasTopLevelUnderlyingError(v13, v49, v50, v51))
  {
    objc_msgSend_perItemErrors(self, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v8, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v57, v62, (uint64_t)v13, (uint64_t)v61);

  }
  v9 = 0;
LABEL_31:
  objc_msgSend_recordWasChangedBlock_wrapper(self, v46, v47, v48);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v63;
  if (v63)
  {
    v68 = (void (**)(void *, id, id, void *))_Block_copy(v63);
  }
  else
  {
    objc_msgSend_recordWasChangedBlock(self, v64, v65, v66);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void (**)(void *, id, id, void *))_Block_copy(v69);

  }
  if (v68)
  {
    v68[2](v68, v8, v9, v13);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v73 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
LABEL_51:
      v87 = v73;
      objc_msgSend_operationID(self, v88, v89, v90);
      v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v121 = v91;
      v122 = 2112;
      v123 = v8;
      _os_log_debug_impl(&dword_18A5C5000, v87, OS_LOG_TYPE_DEBUG, "Progress callback for operation %{public}@ recordID %@ is done", buf, 0x16u);
LABEL_52:

    }
  }
  else
  {
    objc_msgSend_perRecordChangeCompletionBlock(self, v70, v71, v72);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      objc_msgSend_perRecordChangeCompletionBlock(self, v78, v79, v80);
      v81 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, __CFString *, __CFString *))v81)[2](v81, v9, v8, v13);

      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v73 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        goto LABEL_51;
    }
    else
    {
      objc_msgSend_recordChangedBlock(self, v78, v79, v80);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        if (!v13 && v9)
        {
          objc_msgSend_recordChangedBlock(self, v83, v84, v85);
          v86 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v86)[2](v86, v9);

        }
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v73 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          goto LABEL_51;
      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v105 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          v87 = v105;
          objc_msgSend_operationID(self, v112, v113, v114);
          v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v9, v115, v116, v117);
          v118 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v121 = v91;
          v122 = 2112;
          v123 = v118;
          _os_log_debug_impl(&dword_18A5C5000, v87, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a changed record (%@), but no recordWasChangedBlock or recordChangedBlock has been set.", buf, 0x16u);

          goto LABEL_52;
        }
      }
    }
  }
  objc_msgSend_configuration(self, v74, v75, v76);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v106, v107, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleRecordChanged_changeType_record_error_(v110, v111, (uint64_t)v8, 1, v9, v13);

}

- (void)handleDeleteForRecordID:(id)a3 recordType:(id)a4
{
  id v6;
  id v7;
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
  void (**v30)(void *, id, id);
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[24];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
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
      *(_DWORD *)v58 = 138412290;
      *(_QWORD *)&v58[4] = v6;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v18, OS_SIGNPOST_EVENT, v24, "CKFetchRecordZoneChangesOperation", "Record %@ deleted", v58, 0xCu);
    }

  }
  objc_msgSend_recordWithIDWasDeletedBlock_wrapper(self, v10, v11, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v25;
  if (v25)
  {
    v30 = (void (**)(void *, id, id))_Block_copy(v25);
  }
  else
  {
    objc_msgSend_recordWithIDWasDeletedBlock(self, v26, v27, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void (**)(void *, id, id))_Block_copy(v31);

  }
  if (v30)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v32 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v50 = v32;
      objc_msgSend_operationID(self, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v58 = 138543618;
      *(_QWORD *)&v58[4] = v54;
      *(_WORD *)&v58[12] = 2112;
      *(_QWORD *)&v58[14] = v6;
      _os_log_debug_impl(&dword_18A5C5000, v50, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a deleted record with id %@", v58, 0x16u);

    }
    v30[2](v30, v6, v7);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v33 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v37 = v33;
      objc_msgSend_operationID(self, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v58 = 138543618;
      *(_QWORD *)&v58[4] = v41;
      *(_WORD *)&v58[12] = 2112;
      *(_QWORD *)&v58[14] = v6;
      v42 = "Progress callback for operation %{public}@ recordID %@ is done";
LABEL_29:
      _os_log_debug_impl(&dword_18A5C5000, v37, OS_LOG_TYPE_DEBUG, v42, v58, 0x16u);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v43 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v37 = v43;
      objc_msgSend_operationID(self, v55, v56, v57);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v58 = 138543618;
      *(_QWORD *)&v58[4] = v41;
      *(_WORD *)&v58[12] = 2112;
      *(_QWORD *)&v58[14] = v6;
      v42 = "Operation %{public}@ received a deleted record (%@), but no recordWithIDWasDeletedBlock has been set.";
      goto LABEL_29;
    }
  }
  objc_msgSend_configuration(self, v34, v35, v36, *(_OWORD *)v58, *(_QWORD *)&v58[16], v59);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleRecordChanged_changeType_record_error_(v48, v49, (uint64_t)v6, 3, 0, 0);

}

- (void)handleAttributesChangedForZone:(id)a3
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void (**v31)(void *, id);
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[24];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend_zoneID(v4, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v71 = 138412290;
      *(_QWORD *)&v71[4] = v25;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordZoneChangesOperation", "Zone %@ attributes changed", v71, 0xCu);

    }
  }
  objc_msgSend_zoneAttributesChangedBlock_wrapper(self, v7, v8, v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v26;
  if (v26)
  {
    v31 = (void (**)(void *, id))_Block_copy(v26);
  }
  else
  {
    objc_msgSend_zoneAttributesChangedBlock(self, v27, v28, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void (**)(void *, id))_Block_copy(v32);

  }
  if (v31)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v33 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v56 = v33;
      objc_msgSend_operationID(self, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v4, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v71 = 138543618;
      *(_QWORD *)&v71[4] = v60;
      *(_WORD *)&v71[12] = 2112;
      *(_QWORD *)&v71[14] = v64;
      _os_log_debug_impl(&dword_18A5C5000, v56, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about zone attributes changed for zone with ID %@", v71, 0x16u);

    }
    v31[2](v31, v4);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v34 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v38 = v34;
      objc_msgSend_operationID(self, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v4, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v71 = 138543618;
      *(_QWORD *)&v71[4] = v42;
      *(_WORD *)&v71[12] = 2112;
      *(_QWORD *)&v71[14] = v46;
      v47 = "Progress callback for zone attributes changed operation %{public}@ zoneID %@ is done";
LABEL_29:
      _os_log_debug_impl(&dword_18A5C5000, v38, OS_LOG_TYPE_DEBUG, v47, v71, 0x16u);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v48 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v38 = v48;
      objc_msgSend_operationID(self, v65, v66, v67);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v4, v68, v69, v70);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v71 = 138543618;
      *(_QWORD *)&v71[4] = v42;
      *(_WORD *)&v71[12] = 2112;
      *(_QWORD *)&v71[14] = v46;
      v47 = "Operation %{public}@ received a zone attributes change (%@), but no zoneAttributesChangedBlock has been set.";
      goto LABEL_29;
    }
  }
  objc_msgSend_configuration(self, v35, v36, v37, *(_OWORD *)v71, *(_QWORD *)&v71[16], v72);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleAttributesChangedForZone_(v53, v54, (uint64_t)v4, v55);

}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  objc_super v16;

  v4 = a3;
  CKErrorUserInfoClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleChangeForRecordID_record_error_, 2, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v13, (uint64_t)v12, (uint64_t)sel_handleChangeSetCompletionForRecordZoneID_serverChangeToken_clientChangeTokenData_recordChangesStatus_hasPendingArchivedRecords_syncObligationZoneIDs_error_reply_, 5, 0);

  CKErrorUserInfoClasses();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v15, (uint64_t)v14, (uint64_t)sel_handleChangeSetCompletionForRecordZoneID_serverChangeToken_clientChangeTokenData_recordChangesStatus_hasPendingArchivedRecords_syncObligationZoneIDs_error_reply_, 6, 0);

  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___CKFetchRecordZoneChangesOperation;
  objc_msgSendSuper2(&v16, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (void)setRecordZoneIDs:(NSArray *)recordZoneIDs
{
  objc_setProperty_nonatomic_copy(self, a2, recordZoneIDs, 584);
}

- (void)setConfigurationsByRecordZoneID:(NSDictionary *)configurationsByRecordZoneID
{
  objc_setProperty_nonatomic_copy(self, a2, configurationsByRecordZoneID, 592);
}

- (void)setFetchAllChanges:(BOOL)fetchAllChanges
{
  self->_fetchAllChanges = fetchAllChanges;
}

- (void)setStatusByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_statusByZoneID, a3);
}

- (NSMutableSet)zoneIDsWithPendingArchivedRecords
{
  return self->_zoneIDsWithPendingArchivedRecords;
}

- (void)setZoneIDsWithPendingArchivedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDsWithPendingArchivedRecords, a3);
}

- (NSMutableSet)zoneIDsWithSyncObligations
{
  return self->_zoneIDsWithSyncObligations;
}

- (void)setZoneIDsWithSyncObligations:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDsWithSyncObligations, a3);
}

- (void)setShouldFetchAssetContents:(BOOL)a3
{
  self->_shouldFetchAssetContents = a3;
}

- (void)setPerItemErrors:(id)a3
{
  objc_storeStrong((id *)&self->_perItemErrors, a3);
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, a3);
}

- (void)setSupplementalChangeTokenByZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (BOOL)shouldReportAllPerItemFailures
{
  return self->_shouldReportAllPerItemFailures;
}

- (void)setShouldReportAllPerItemFailures:(BOOL)a3
{
  self->_shouldReportAllPerItemFailures = a3;
}

- (id)recordWasChangedBlock_wrapper
{
  return self->_recordWasChangedBlock_wrapper;
}

- (void)setRecordWasChangedBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (id)recordWithIDWasDeletedBlock_wrapper
{
  return self->_recordWithIDWasDeletedBlock_wrapper;
}

- (void)setRecordWithIDWasDeletedBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (void)setRecordZoneFetchCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (void)setFetchRecordZoneChangesCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (id)zoneAttributesChangedBlock_wrapper
{
  return self->_zoneAttributesChangedBlock_wrapper;
}

- (void)setZoneAttributesChangedBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (CKFetchRecordZoneChangesOperation)initWithRecordZoneIDs:(NSArray *)recordZoneIDs optionsByRecordZoneID:(NSDictionary *)optionsByRecordZoneID
{
  NSDictionary *v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSDictionary *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  CKFetchRecordZoneChangesOperation *v17;
  _QWORD v19[4];
  NSDictionary *v20;

  v6 = optionsByRecordZoneID;
  v7 = recordZoneIDs;
  objc_msgSend_allKeys(v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18A7AE7F0;
  v19[3] = &unk_1E1F65468;
  v20 = v6;
  v12 = v6;
  objc_msgSend_CKMapToDictionary_(v11, v13, (uint64_t)v19, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (CKFetchRecordZoneChangesOperation *)objc_msgSend_initWithRecordZoneIDs_configurationsByRecordZoneID_(self, v16, (uint64_t)v7, (uint64_t)v15);
  return v17;
}

- (NSDictionary)optionsByRecordZoneID
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];

  objc_msgSend_configurationsByRecordZoneID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return (NSDictionary *)0;
  objc_msgSend_configurationsByRecordZoneID(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_18A7AE918;
  v18[3] = &unk_1E1F65468;
  v18[4] = self;
  objc_msgSend_CKMapToDictionary_(v13, v14, (uint64_t)v18, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v16;
}

- (void)setOptionsByRecordZoneID:(NSDictionary *)optionsByRecordZoneID
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;

  if (optionsByRecordZoneID)
  {
    objc_msgSend_CKMapValues_(optionsByRecordZoneID, a2, (uint64_t)&unk_1E1F588F8, v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConfigurationsByRecordZoneID_(self, v5, (uint64_t)v7, v6);

  }
  else
  {
    objc_msgSend_setConfigurationsByRecordZoneID_(self, a2, 0, v3);
  }
}

@end
