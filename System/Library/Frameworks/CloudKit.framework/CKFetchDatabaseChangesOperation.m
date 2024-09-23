@implementation CKFetchDatabaseChangesOperation

- (NSMutableSet)zoneIDsForMetrics
{
  return self->_zoneIDsForMetrics;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_serverChangeToken, a3);
}

- (void)setRecordZoneWithIDWasPurgedBlock:(void *)recordZoneWithIDWasPurgedBlock
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

  v14 = recordZoneWithIDWasPurgedBlock;
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
    block[2] = sub_18A7265D4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordZoneWithIDWasPurgedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_recordZoneWithIDWasPurgedBlock;
    self->_recordZoneWithIDWasPurgedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:(void *)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock
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

  v14 = recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock;
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
    block[2] = sub_18A7268DC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock;
    self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setRecordZoneWithIDWasDeletedBlock:(void *)recordZoneWithIDWasDeletedBlock
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

  v14 = recordZoneWithIDWasDeletedBlock;
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
    block[2] = sub_18A7263EC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordZoneWithIDWasDeletedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_recordZoneWithIDWasDeletedBlock;
    self->_recordZoneWithIDWasDeletedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setRecordZoneWithIDChangedBlock:(void *)recordZoneWithIDChangedBlock
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

  v14 = recordZoneWithIDChangedBlock;
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
    block[2] = sub_18A72632C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordZoneWithIDChangedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_recordZoneWithIDChangedBlock;
    self->_recordZoneWithIDChangedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setFetchDatabaseChangesCompletionBlock:(void *)fetchDatabaseChangesCompletionBlock
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

  v14 = fetchDatabaseChangesCompletionBlock;
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
    block[2] = sub_18A72684C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchDatabaseChangesCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_fetchDatabaseChangesCompletionBlock;
    self->_fetchDatabaseChangesCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setFetchAllChanges:(BOOL)fetchAllChanges
{
  self->_fetchAllChanges = fetchAllChanges;
}

- (void)setChangeTokenUpdatedBlock:(void *)changeTokenUpdatedBlock
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

  v14 = changeTokenUpdatedBlock;
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
    block[2] = sub_18A7267BC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_changeTokenUpdatedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_changeTokenUpdatedBlock;
    self->_changeTokenUpdatedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (NSUInteger)resultsLimit
{
  return self->_resultsLimit;
}

- (id)recordZoneWithIDChangedBlock_wrapper
{
  return self->_recordZoneWithIDChangedBlock_wrapper;
}

- (void)recordZoneWithIDChangedBlock
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
    v15 = sub_18A72637C;
    v16 = sub_18A7263A4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7263AC;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordZoneWithIDChangedBlock);
  }
  return v8;
}

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
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
  unint64_t v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    objc_msgSend_operationID(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_databaseScope(self, v9, v10, v11);
    CKDatabaseScopeString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v13;
    _os_log_debug_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_DEBUG, "Fetching database changes with operation %{public}@ for database scope %{public}@", buf, 0x16u);

  }
  v14.receiver = self;
  v14.super_class = (Class)CKFetchDatabaseChangesOperation;
  -[CKOperation performCKOperation](&v14, sel_performCKOperation);
}

- (CKFetchDatabaseChangesOperation)init
{
  CKFetchDatabaseChangesOperation *v2;
  CKFetchDatabaseChangesOperation *v3;
  NSMutableSet *v4;
  NSMutableSet *zoneIDsForMetrics;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKFetchDatabaseChangesOperation;
  v2 = -[CKOperation init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fetchAllChanges = 1;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    zoneIDsForMetrics = v3->_zoneIDsForMetrics;
    v3->_zoneIDsForMetrics = v4;

  }
  return v3;
}

- (CKFetchDatabaseChangesOperation)initWithPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
  CKServerChangeToken *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKFetchDatabaseChangesOperation *v11;
  uint64_t v12;
  CKServerChangeToken *v13;

  v4 = previousServerChangeToken;
  v11 = (CKFetchDatabaseChangesOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_previousServerChangeToken;
    v11->_previousServerChangeToken = (CKServerChangeToken *)v12;

  }
  return v11;
}

- (void)handleChangeSetCompletionWithServerChangeToken:(id)a3 databaseChangesStatus:(int64_t)a4 error:(id)a5 reply:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CKSignpost *signpost;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
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
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  uint32_t v36;
  CKSignpost *v37;
  CKSignpost *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  CKSignpost *v42;
  CKSignpost *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void (**v59)(id, id);
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
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
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  _BYTE v81[24];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, void *))a6;
  objc_msgSend_CKClientSuitableError(a5, v12, v13, v14);
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

    if ((unint64_t)(v32 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v26))
      goto LABEL_21;
    *(_DWORD *)v81 = 138412546;
    *(_QWORD *)&v81[4] = v10;
    *(_WORD *)&v81[12] = 2112;
    *(_QWORD *)&v81[14] = v15;
    v33 = "Server change token updated to %@ with error: %@";
    v34 = v26;
    v35 = v32;
    v36 = 22;
    goto LABEL_20;
  }
  if (!v17)
    goto LABEL_22;
  if (self)
    v37 = self->super.super._signpost;
  else
    v37 = 0;
  v38 = v37;
  objc_msgSend_log(v38, v39, v40, v41);
  v26 = objc_claimAutoreleasedReturnValue();

  if (self)
    v42 = self->super.super._signpost;
  else
    v42 = 0;
  v43 = v42;
  v47 = objc_msgSend_identifier(v43, v44, v45, v46);

  if ((unint64_t)(v47 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_DWORD *)v81 = 138412290;
    *(_QWORD *)&v81[4] = v10;
    v33 = "Server change token updated to %@";
    v34 = v26;
    v35 = v47;
    v36 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v34, OS_SIGNPOST_EVENT, v35, "CKFetchDatabaseChangesOperation", v33, v81, v36);
  }
LABEL_21:

LABEL_22:
  if (a4 != -1)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v48 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v67 = v48;
      objc_msgSend_operationID(self, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v81 = 138543618;
      *(_QWORD *)&v81[4] = v71;
      *(_WORD *)&v81[12] = 2048;
      *(_QWORD *)&v81[14] = a4;
      _os_log_debug_impl(&dword_18A5C5000, v67, OS_LOG_TYPE_DEBUG, "Operation %{public}@ updating databaseChangesStatus to %ld", v81, 0x16u);

    }
    objc_msgSend_setStatus_(self, v49, a4, v50, *(_OWORD *)v81, *(_QWORD *)&v81[16], v82);
  }
  if (v10)
  {
    objc_msgSend_setServerChangeToken_(self, v18, (uint64_t)v10, v20);
    objc_msgSend_changeTokenUpdatedBlock(self, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v55 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v72 = v55;
        objc_msgSend_operationID(self, v73, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v81 = 138543618;
        *(_QWORD *)&v81[4] = v76;
        *(_WORD *)&v81[12] = 2114;
        *(_QWORD *)&v81[14] = v10;
        _os_log_debug_impl(&dword_18A5C5000, v72, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a server change token %{public}@", v81, 0x16u);

      }
      objc_msgSend_changeTokenUpdatedBlock(self, v56, v57, v58, *(_QWORD *)v81, *(_QWORD *)&v81[8]);
      v59 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
      v59[2](v59, v10);
      goto LABEL_35;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v60 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v59 = v60;
      objc_msgSend_operationID(self, v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v81 = 138543618;
      *(_QWORD *)&v81[4] = v80;
      *(_WORD *)&v81[12] = 2114;
      *(_QWORD *)&v81[14] = v10;
      _os_log_debug_impl(&dword_18A5C5000, (os_log_t)v59, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a server change token (%{public}@) but no changeTokenUpdatedBlock has been set.", v81, 0x16u);

LABEL_35:
    }
  }
  if (__sTestOverridesAvailable
    && (objc_msgSend_unitTestOverrides(self, v18, v19, v20),
        v61 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)CFSTR("FailMetasyncOperationDueToClientReturnedCancellationError"), v63), v64 = (void *)objc_claimAutoreleasedReturnValue(), v64, v61, v64))
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v65, (uint64_t)CFSTR("CKInternalErrorDomain"), 1, CFSTR("Cancelling operation for tests"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = 0;
  }
  v11[2](v11, v66);

}

- (void)handleChangeForRecordZoneID:(id)a3
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void (**v33)(void *, id);
  void *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
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
      v41 = 138412290;
      v42 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchDatabaseChangesOperation", "Record zone %@ changed", (uint8_t *)&v41, 0xCu);
    }

  }
  objc_msgSend_zoneIDsForMetrics(self, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v22, v23, (uint64_t)v4, v24);

  objc_msgSend_recordZoneWithIDChangedBlock_wrapper(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28;
  if (v28)
  {
    v33 = (void (**)(void *, id))_Block_copy(v28);
  }
  else
  {
    objc_msgSend_recordZoneWithIDChangedBlock(self, v29, v30, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void (**)(void *, id))_Block_copy(v34);

  }
  if (v33)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v35 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v36 = v35;
      objc_msgSend_operationID(self, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543618;
      v42 = v40;
      v43 = 2112;
      v44 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v36, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a changed zone with ID %@", (uint8_t *)&v41, 0x16u);

    }
    v33[2](v33, v4);
  }

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
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t AllChanges;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousServerChangeToken_(v4, v9, (uint64_t)v8, v10);

  v14 = objc_msgSend_resultsLimit(self, v11, v12, v13);
  objc_msgSend_setResultsLimit_(v4, v15, v14, v16);
  AllChanges = objc_msgSend_fetchAllChanges(self, v17, v18, v19);
  objc_msgSend_setFetchAllChanges_(v4, v21, AllChanges, v22);
  v23.receiver = self;
  v23.super_class = (Class)CKFetchDatabaseChangesOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v23, sel_fillOutOperationInfo_, v4);

}

- (id)fetchDatabaseChangesCompletionBlock_wrapper
{
  return self->_fetchDatabaseChangesCompletionBlock_wrapper;
}

- (void)fetchDatabaseChangesCompletionBlock
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
    v15 = sub_18A72637C;
    v16 = sub_18A7263A4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A72689C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchDatabaseChangesCompletionBlock);
  }
  return v8;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchDatabaseChangesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchDatabaseChangesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

    }
  }
}

- (void)changeTokenUpdatedBlock
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
    v15 = sub_18A72637C;
    v16 = sub_18A7263A4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A72680C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_changeTokenUpdatedBlock);
  }
  return v8;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-database-changes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  _BOOL8 v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  objc_super v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  NSObject *v103;
  __int16 v104;
  void *v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchDatabaseChangesOperation", "Finishing", buf, 2u);
    }

  }
  objc_msgSend_zoneIDsForMetrics(self, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_count(v22, v23, v24, v25);

  if (v26)
  {
    objc_msgSend_zoneIDsForMetrics(self, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneIDsToZoneNamesString_(self, v31, (uint64_t)v30, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v37, v38, (uint64_t)v33, (uint64_t)CFSTR("zoneNames"));

  }
  objc_msgSend_fetchDatabaseChangesCompletionBlock_wrapper(self, v27, v28, v29);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v39;
  if (v39)
  {
    v44 = _Block_copy(v39);
  }
  else
  {
    objc_msgSend_fetchDatabaseChangesCompletionBlock(self, v40, v41, v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = _Block_copy(v45);

  }
  if (v44)
  {
    objc_msgSend_CKClientSuitableError(v4, v46, v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v50 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v85 = v50;
        objc_msgSend_operationID(self, v86, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v101 = v89;
        v102 = 2112;
        v103 = v49;
        _os_log_debug_impl(&dword_18A5C5000, v85, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed - error:%@", buf, 0x16u);

      }
      (*((void (**)(void *, _QWORD, _QWORD, NSObject *))v44 + 2))(v44, 0, 0, v49);
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v68 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v90 = v68;
        objc_msgSend_operationID(self, v91, v92, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_serverChangeToken(self, v95, v96, v97);
        v98 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v101 = v94;
        v102 = 2114;
        v103 = v98;
        _os_log_debug_impl(&dword_18A5C5000, v90, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed - server-change-token:%{public}@", buf, 0x16u);

      }
      objc_msgSend_serverChangeToken(self, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend_status(self, v73, v74, v75) == 1;
      (*((void (**)(void *, void *, _BOOL8, _QWORD))v44 + 2))(v44, v72, v76, 0);

    }
    objc_msgSend_setFetchDatabaseChangesCompletionBlock_(self, v51, 0, v52);
    goto LABEL_34;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v53 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v49 = v53;
    objc_msgSend_operationID(self, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverChangeToken(self, v60, v61, v62);
    v63 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v101 = v59;
    v102 = 2114;
    v103 = v63;
    v104 = 2112;
    v105 = v67;
    _os_log_debug_impl(&dword_18A5C5000, v49, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no fetchDatabaseChangesCompletionBlock - server-change-token:%{public}@, error:%@", buf, 0x20u);

LABEL_34:
  }
  objc_msgSend_setRecordZoneWithIDChangedBlock_(self, v54, 0, v55);
  objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(self, v77, 0, v78);
  objc_msgSend_setRecordZoneWithIDWasPurgedBlock_(self, v79, 0, v80);
  objc_msgSend_setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_(self, v81, 0, v82);
  objc_msgSend_setChangeTokenUpdatedBlock_(self, v83, 0, v84);
  v99.receiver = self;
  v99.super_class = (Class)CKFetchDatabaseChangesOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v99, sel__finishOnCallbackQueueWithError_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchDatabaseChangesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasPurgedBlock_wrapper, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedBlock_wrapper, 0);
  objc_storeStrong(&self->_recordZoneWithIDChangedBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_zoneIDsForMetrics, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock, 0);
  objc_storeStrong(&self->_fetchDatabaseChangesCompletionBlock, 0);
  objc_storeStrong(&self->_changeTokenUpdatedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasPurgedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDChangedBlock, 0);
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchDatabaseChangesOperation_withBlock_;
}

- (void)recordZoneWithIDWasDeletedBlock
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
    v15 = sub_18A72637C;
    v16 = sub_18A7263A4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A726594;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordZoneWithIDWasDeletedBlock);
  }
  return v8;
}

- (void)recordZoneWithIDWasPurgedBlock
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
    v15 = sub_18A72637C;
    v16 = sub_18A7263A4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A72677C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordZoneWithIDWasPurgedBlock);
  }
  return v8;
}

- (void)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock
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
    v15 = sub_18A72637C;
    v16 = sub_18A7263A4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A726A84;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock);
  }
  return v8;
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
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t AllChanges;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKFetchDatabaseChangesOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v23, sel_fillFromOperationInfo_, v4);
  objc_msgSend_previousServerChangeToken(v4, v5, v6, v7, v23.receiver, v23.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousServerChangeToken_(self, v9, (uint64_t)v8, v10);

  v14 = objc_msgSend_resultsLimit(v4, v11, v12, v13);
  objc_msgSend_setResultsLimit_(self, v15, v14, v16);
  AllChanges = objc_msgSend_fetchAllChanges(v4, v17, v18, v19);

  objc_msgSend_setFetchAllChanges_(self, v21, AllChanges, v22);
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
  v21.super_class = (Class)CKFetchDatabaseChangesOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v21, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_recordZoneWithIDChangedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_recordZoneWithIDWasDeletedBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_fetchDatabaseChangesCompletionBlock(self, v11, v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock(self, v15, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v19 != 0;

      }
    }

  }
  return v6;
}

- (void)handleDeleteForRecordZoneID:(id)a3
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void (**v33)(void *, id);
  void *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
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
      v41 = 138412290;
      v42 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchDatabaseChangesOperation", "Record zone %@ deleted", (uint8_t *)&v41, 0xCu);
    }

  }
  objc_msgSend_zoneIDsForMetrics(self, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v22, v23, (uint64_t)v4, v24);

  objc_msgSend_recordZoneWithIDWasDeletedBlock_wrapper(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28;
  if (v28)
  {
    v33 = (void (**)(void *, id))_Block_copy(v28);
  }
  else
  {
    objc_msgSend_recordZoneWithIDWasDeletedBlock(self, v29, v30, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void (**)(void *, id))_Block_copy(v34);

  }
  if (v33)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v35 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v36 = v35;
      objc_msgSend_operationID(self, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543618;
      v42 = v40;
      v43 = 2112;
      v44 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v36, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a deleted zone with ID %@", (uint8_t *)&v41, 0x16u);

    }
    v33[2](v33, v4);
  }

}

- (void)handlePurgeForRecordZoneID:(id)a3
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void (**v33)(void *, id);
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void (**v43)(void *, id);
  void *v44;
  void *v45;
  _BOOL4 v46;
  void (**v47)(void *, id);
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  int v60;
  id v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
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
      v60 = 138412290;
      v61 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchDatabaseChangesOperation", "Record zone %@ purged", (uint8_t *)&v60, 0xCu);
    }

  }
  objc_msgSend_zoneIDsForMetrics(self, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v22, v23, (uint64_t)v4, v24);

  objc_msgSend_recordZoneWithIDWasPurgedBlock_wrapper(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28;
  if (v28)
  {
    v33 = (void (**)(void *, id))_Block_copy(v28);
  }
  else
  {
    objc_msgSend_recordZoneWithIDWasPurgedBlock(self, v29, v30, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void (**)(void *, id))_Block_copy(v34);

  }
  objc_msgSend_recordZoneWithIDWasDeletedBlock_wrapper(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v38;
  if (v38)
  {
    v43 = (void (**)(void *, id))_Block_copy(v38);
  }
  else
  {
    objc_msgSend_recordZoneWithIDWasDeletedBlock(self, v39, v40, v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void (**)(void *, id))_Block_copy(v44);

  }
  if (v33)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v45 = (void *)ck_log_facility_ck;
    v46 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG);
    v47 = v33;
    if (v46)
    {
      v48 = v45;
      objc_msgSend_operationID(self, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 138543618;
      v61 = v52;
      v62 = 2112;
      v63 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v48, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a purged zone with ID %@", (uint8_t *)&v60, 0x16u);

      v47 = v33;
    }
LABEL_28:
    v47[2](v47, v4);
    goto LABEL_29;
  }
  if (v43)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v53 = (void *)ck_log_facility_ck;
    v54 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG);
    v47 = v43;
    if (v54)
    {
      v55 = v53;
      objc_msgSend_operationID(self, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 138543618;
      v61 = v59;
      v62 = 2112;
      v63 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v55, OS_LOG_TYPE_DEBUG, "Operation %{public}@ making a delete callback about a purged zone with ID %@", (uint8_t *)&v60, 0x16u);

      v47 = v43;
    }
    goto LABEL_28;
  }
LABEL_29:

}

- (void)handleEncryptedDataResetForRecordZoneID:(id)a3
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void (**v33)(void *, id);
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void (**v43)(void *, id);
  void *v44;
  void *v45;
  _BOOL4 v46;
  void (**v47)(void *, id);
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  int v60;
  id v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
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
      v60 = 138412290;
      v61 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchDatabaseChangesOperation", "Record zone %@ encrypted data reset", (uint8_t *)&v60, 0xCu);
    }

  }
  objc_msgSend_zoneIDsForMetrics(self, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v22, v23, (uint64_t)v4, v24);

  objc_msgSend_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28;
  if (v28)
  {
    v33 = (void (**)(void *, id))_Block_copy(v28);
  }
  else
  {
    objc_msgSend_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock(self, v29, v30, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void (**)(void *, id))_Block_copy(v34);

  }
  objc_msgSend_recordZoneWithIDWasDeletedBlock_wrapper(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v38;
  if (v38)
  {
    v43 = (void (**)(void *, id))_Block_copy(v38);
  }
  else
  {
    objc_msgSend_recordZoneWithIDWasDeletedBlock(self, v39, v40, v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void (**)(void *, id))_Block_copy(v44);

  }
  if (v33)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v45 = (void *)ck_log_facility_ck;
    v46 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG);
    v47 = v33;
    if (v46)
    {
      v48 = v45;
      objc_msgSend_operationID(self, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 138543618;
      v61 = v52;
      v62 = 2112;
      v63 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v48, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a zone deleted due to encrypted data reset with ID %@", (uint8_t *)&v60, 0x16u);

      v47 = v33;
    }
LABEL_28:
    v47[2](v47, v4);
    goto LABEL_29;
  }
  if (v43)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v53 = (void *)ck_log_facility_ck;
    v54 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG);
    v47 = v43;
    if (v54)
    {
      v55 = v53;
      objc_msgSend_operationID(self, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 138543618;
      v61 = v59;
      v62 = 2112;
      v63 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v55, OS_LOG_TYPE_DEBUG, "Operation %{public}@ making a delete callback about a zone deleted due to encrypted data reset with ID %@", (uint8_t *)&v60, 0x16u);

      v47 = v43;
    }
    goto LABEL_28;
  }
LABEL_29:

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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleChangeSetCompletionWithServerChangeToken_databaseChangesStatus_error_reply_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchDatabaseChangesOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
  objc_setProperty_nonatomic_copy(self, a2, previousServerChangeToken, 568);
}

- (void)setResultsLimit:(NSUInteger)resultsLimit
{
  self->_resultsLimit = resultsLimit;
}

- (void)setZoneIDsForMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDsForMetrics, a3);
}

- (void)setRecordZoneWithIDChangedBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (id)recordZoneWithIDWasDeletedBlock_wrapper
{
  return self->_recordZoneWithIDWasDeletedBlock_wrapper;
}

- (void)setRecordZoneWithIDWasDeletedBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (id)recordZoneWithIDWasPurgedBlock_wrapper
{
  return self->_recordZoneWithIDWasPurgedBlock_wrapper;
}

- (void)setRecordZoneWithIDWasPurgedBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (id)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper
{
  return self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper;
}

- (void)setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (void)setFetchDatabaseChangesCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

@end
