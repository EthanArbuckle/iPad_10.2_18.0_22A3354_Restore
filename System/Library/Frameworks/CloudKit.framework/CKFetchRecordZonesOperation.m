@implementation CKFetchRecordZonesOperation

- (CKFetchRecordZonesOperation)init
{
  CKFetchRecordZonesOperation *v2;
  uint64_t v3;
  NSMutableDictionary *recordZonesByZoneID;
  uint64_t v5;
  NSMutableDictionary *recordZoneErrors;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKFetchRecordZonesOperation;
  v2 = -[CKOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordZonesByZoneID = v2->_recordZonesByZoneID;
    v2->_recordZonesByZoneID = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    recordZoneErrors = v2->_recordZoneErrors;
    v2->_recordZoneErrors = (NSMutableDictionary *)v5;

  }
  return v2;
}

+ (CKFetchRecordZonesOperation)fetchAllRecordZonesOperation
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_setIsFetchAllRecordZonesOperation_(v2, v3, 1, v4);
  return (CKFetchRecordZonesOperation *)v2;
}

- (CKFetchRecordZonesOperation)initWithRecordZoneIDs:(NSArray *)zoneIDs
{
  NSArray *v4;
  char v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKFetchRecordZonesOperation *v13;
  uint64_t v14;
  NSArray *recordZoneIDs;
  void *v17;
  CKException *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;
  id v29;

  v4 = zoneIDs;
  v29 = 0;
  v5 = _CKCheckArgument((uint64_t)"zoneIDs", v4, 0, 0, 0, &v29);
  v6 = v29;
  if ((v5 & 1) == 0)
  {
    v17 = v6;
    v18 = [CKException alloc];
    v22 = objc_msgSend_code(v17, v19, v20, v21);
    objc_msgSend_localizedDescription(v17, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, (uint64_t)CFSTR("%@"), v26);

    objc_exception_throw(v28);
  }

  v13 = (CKFetchRecordZonesOperation *)objc_msgSend_init(self, v7, v8, v9);
  if (v13)
  {
    v14 = objc_msgSend_copy(v4, v10, v11, v12);
    recordZoneIDs = v13->_recordZoneIDs;
    v13->_recordZoneIDs = (NSArray *)v14;

  }
  return v13;
}

- (void)setPerRecordZoneCompletionBlock:(void *)perRecordZoneCompletionBlock
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

  v14 = perRecordZoneCompletionBlock;
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
    block[2] = sub_18A703EB4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordZoneCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perRecordZoneCompletionBlock;
    self->_perRecordZoneCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perRecordZoneCompletionBlock
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
    v15 = sub_18A70405C;
    v16 = sub_18A704084;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A70408C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordZoneCompletionBlock);
  }
  return v8;
}

- (void)setFetchRecordZonesCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id fetchRecordZonesCompletionBlock;
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
    block[2] = sub_18A7041E8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    fetchRecordZonesCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchRecordZonesCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    fetchRecordZonesCompletionBlock = self->_fetchRecordZonesCompletionBlock;
    self->_fetchRecordZonesCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)fetchRecordZonesCompletionBlock
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
    v15 = sub_18A70405C;
    v16 = sub_18A704084;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A704390;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordZonesCompletionBlock);
  }
  return v8;
}

- (void)setFetchRecordZonesCompletionBlock:(void *)fetchRecordZonesCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = fetchRecordZonesCompletionBlock == 0;
  v9 = fetchRecordZonesCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setFetchRecordZonesCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

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
  uint64_t AllRecordZonesOperation;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  objc_msgSend_recordZoneIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(v4, v9, (uint64_t)v8, v10);

  AllRecordZonesOperation = objc_msgSend_isFetchAllRecordZonesOperation(self, v11, v12, v13);
  objc_msgSend_setIsFetchAllRecordZonesOperation_(v4, v15, AllRecordZonesOperation, v16);
  v20 = objc_msgSend_ignorePCSFailures(self, v17, v18, v19);
  objc_msgSend_setIgnorePCSFailures_(v4, v21, v20, v22);
  v23.receiver = self;
  v23.super_class = (Class)CKFetchRecordZonesOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v23, sel_fillOutOperationInfo_, v4);

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
  uint64_t AllRecordZonesOperation;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKFetchRecordZonesOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v23, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordZoneIDs(v4, v5, v6, v7, v23.receiver, v23.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(self, v9, (uint64_t)v8, v10);

  AllRecordZonesOperation = objc_msgSend_isFetchAllRecordZonesOperation(v4, v11, v12, v13);
  objc_msgSend_setIsFetchAllRecordZonesOperation_(self, v15, AllRecordZonesOperation, v16);
  v20 = objc_msgSend_ignorePCSFailures(v4, v17, v18, v19);

  objc_msgSend_setIgnorePCSFailures_(self, v21, v20, v22);
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
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKFetchRecordZonesOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perRecordZoneCompletionBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_fetchRecordZonesCompletionBlock(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11 != 0;

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
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  objc_class *v37;
  void *v38;
  const char *v39;
  objc_class *v41;
  void *v42;
  const char *v43;
  void *v44;
  objc_super v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordZoneIDs(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else if ((objc_msgSend_isFetchAllRecordZonesOperation(self, v7, v8, v9) & 1) == 0)
  {
    if (a3)
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v43, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("property recordZoneIDs must not be nil for %@"), v42);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend_recordZoneIDs(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v46, (uint64_t)v50, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v47;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v47 != v17)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a3)
          {
            v37 = (objc_class *)objc_opt_class();
            NSStringFromClass(v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected zoneID passed to %@: %@"), v38, v19);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
LABEL_19:

          return 0;
        }
        if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v20, v19, (uint64_t)a3))
          goto LABEL_19;
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v21, (uint64_t)&v46, (uint64_t)v50, 16);
      if (v16)
        continue;
      break;
    }
  }

  if ((objc_msgSend_isFetchAllRecordZonesOperation(self, v22, v23, v24) & 1) == 0)
  {
    objc_msgSend_recordZoneIDs(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_count(v28, v29, v30, v31);

    if (!v32)
      return 0;
  }
  objc_msgSend_fetchRecordZonesCompletionBlock(self, v25, v26, v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    objc_msgSend_perRecordZoneCompletionBlock(self, v34, v35, v36);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
      goto LABEL_24;
    return 0;
  }

LABEL_24:
  v45.receiver = self;
  v45.super_class = (Class)CKFetchRecordZonesOperation;
  return -[CKDatabaseOperation CKOperationShouldRun:](&v45, sel_CKOperationShouldRun_, a3);
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchRecordZonesOperation_withBlock_;
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
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    objc_msgSend_operationID(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordZoneIDs(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v12;
    _os_log_debug_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_DEBUG, "Fetching record zones with operation %{public}@ zoneIDs=%@", buf, 0x16u);

  }
  v13.receiver = self;
  v13.super_class = (Class)CKFetchRecordZonesOperation;
  -[CKOperation performCKOperation](&v13, sel_performCKOperation);
}

- (void)handleFetchForRecordZoneID:(id)a3 recordZone:(id)a4 error:(id)a5
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
  char v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  void *v54;
  const char *v55;
  char canDropItemResultsEarly;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void (**v63)(void *, id, void *, void *);
  void *v64;
  id v65;
  void *v66;
  void *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  _BYTE v73[24];
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v15 = signpost;

  if (!v13)
  {
    if (!v15)
    {
      canDropItemResultsEarly = objc_msgSend_canDropItemResultsEarly(self, v16, v17, v18);
      if (!v8 || (canDropItemResultsEarly & 1) != 0)
        goto LABEL_32;
LABEL_30:
      objc_msgSend_recordZonesByZoneID(self, v50, v51, v52, *(_QWORD *)v73, *(_OWORD *)&v73[8]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v54, v57, (uint64_t)v9, (uint64_t)v8);
      goto LABEL_31;
    }
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
    *(_DWORD *)v73 = 138412290;
    *(_QWORD *)&v73[4] = v8;
    v31 = "Record zone %@ fetched";
    v32 = v24;
    v33 = v45;
    v34 = 12;
    goto LABEL_20;
  }
  if (!v15)
  {
    v53 = objc_msgSend_canDropItemResultsEarly(self, v16, v17, v18);
    if (!v8 || (v53 & 1) != 0)
      goto LABEL_32;
    goto LABEL_27;
  }
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

  if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)v73 = 138412546;
    *(_QWORD *)&v73[4] = v8;
    *(_WORD *)&v73[12] = 2112;
    *(_QWORD *)&v73[14] = v13;
    v31 = "Record zone %@ fetched with error: %@";
    v32 = v24;
    v33 = v30;
    v34 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v32, OS_SIGNPOST_EVENT, v33, "CKFetchRecordZonesOperation", v31, v73, v34);
  }
LABEL_21:

  v49 = objc_msgSend_canDropItemResultsEarly(self, v46, v47, v48);
  if (!v8 || (v49 & 1) != 0)
    goto LABEL_32;
  if (!v13)
    goto LABEL_30;
LABEL_27:
  objc_msgSend_recordZoneErrors(self, v50, v51, v52, *(_OWORD *)v73, *(_QWORD *)&v73[16]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v54, v55, (uint64_t)v13, (uint64_t)v8);
LABEL_31:

LABEL_32:
  objc_msgSend_perRecordZoneCompletionBlock_wrapper(self, v50, v51, v52, *(_QWORD *)v73, *(_QWORD *)&v73[8]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v58;
  if (v58)
  {
    v63 = (void (**)(void *, id, void *, void *))_Block_copy(v58);
  }
  else
  {
    objc_msgSend_perRecordZoneCompletionBlock(self, v59, v60, v61);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void (**)(void *, id, void *, void *))_Block_copy(v64);

  }
  if (v63)
  {
    v65 = v9;
    v66 = v65;
    if (v13)
    {

      v66 = 0;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v67 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v68 = v67;
      objc_msgSend_operationID(self, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v73 = 138543874;
      *(_QWORD *)&v73[4] = v72;
      *(_WORD *)&v73[12] = 2112;
      *(_QWORD *)&v73[14] = v8;
      *(_WORD *)&v73[22] = 2112;
      v74 = v13;
      _os_log_debug_impl(&dword_18A5C5000, v68, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about fetched zone with ID %@: %@", v73, 0x20u);

    }
    v63[2](v63, v8, v66, v13);

  }
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
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void (**v56)(void *, void *, void *);
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  objc_super v68;
  uint8_t buf[16];

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordZonesOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_recordZoneErrors(self, v7, v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordZoneErrors(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to fetch some record zones"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  v34 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend_recordZoneIDs(self, v7, v8, v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v34, v36, (uint64_t)v35, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v38, v39, v40, v41))
  {
    objc_msgSend_zoneIDsToZoneNamesString_(self, v42, (uint64_t)v38, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v49, v50, (uint64_t)v45, (uint64_t)CFSTR("zoneNames"));

  }
  objc_msgSend_fetchRecordZonesCompletionBlock_wrapper(self, v42, v43, v44);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v51;
  if (v51)
  {
    v56 = (void (**)(void *, void *, void *))_Block_copy(v51);
  }
  else
  {
    objc_msgSend_fetchRecordZonesCompletionBlock(self, v52, v53, v54);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void (**)(void *, void *, void *))_Block_copy(v57);

  }
  if (v56)
  {
    objc_msgSend_recordZonesByZoneID(self, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2](v56, v61, v65);

    objc_msgSend_setFetchRecordZonesCompletionBlock_(self, v66, 0, v67);
  }
  objc_msgSend_setPerRecordZoneCompletionBlock_(self, v58, 0, v60);
  v68.receiver = self;
  v68.super_class = (Class)CKFetchRecordZonesOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v68, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchRecordZonesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchRecordZonesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-record-zones", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleFetchForRecordZoneID_recordZone_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchRecordZonesOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(NSArray *)recordZoneIDs
{
  objc_setProperty_nonatomic_copy(self, a2, recordZoneIDs, 536);
}

- (id)perRecordZoneCompletionBlock_wrapper
{
  return self->_perRecordZoneCompletionBlock_wrapper;
}

- (void)setPerRecordZoneCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (id)fetchRecordZonesCompletionBlock_wrapper
{
  return self->_fetchRecordZonesCompletionBlock_wrapper;
}

- (void)setFetchRecordZonesCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSMutableDictionary)recordZonesByZoneID
{
  return self->_recordZonesByZoneID;
}

- (void)setRecordZonesByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_recordZonesByZoneID, a3);
}

- (NSMutableDictionary)recordZoneErrors
{
  return self->_recordZoneErrors;
}

- (void)setRecordZoneErrors:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneErrors, a3);
}

- (BOOL)isFetchAllRecordZonesOperation
{
  return self->_isFetchAllRecordZonesOperation;
}

- (void)setIsFetchAllRecordZonesOperation:(BOOL)a3
{
  self->_isFetchAllRecordZonesOperation = a3;
}

- (BOOL)ignorePCSFailures
{
  return self->_ignorePCSFailures;
}

- (void)setIgnorePCSFailures:(BOOL)a3
{
  self->_ignorePCSFailures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneErrors, 0);
  objc_storeStrong((id *)&self->_recordZonesByZoneID, 0);
  objc_storeStrong(&self->_fetchRecordZonesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordZoneCompletionBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong(&self->_fetchRecordZonesCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordZoneCompletionBlock, 0);
}

@end
