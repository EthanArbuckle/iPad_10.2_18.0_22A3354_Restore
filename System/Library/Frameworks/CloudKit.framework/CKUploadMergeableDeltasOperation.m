@implementation CKUploadMergeableDeltasOperation

- (void)setPerDeltaCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perDeltaCompletionBlock;
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
    block[2] = sub_18A7C5E84;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perDeltaCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perDeltaCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perDeltaCompletionBlock = self->_perDeltaCompletionBlock;
    self->_perDeltaCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perDeltaCompletionBlock
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
    v15 = sub_18A7C602C;
    v16 = sub_18A7C6054;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7C605C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perDeltaCompletionBlock);
  }
  return v8;
}

- (void)setPerReplacementCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perReplacementCompletionBlock;
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
    block[2] = sub_18A7C61B8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perReplacementCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perReplacementCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perReplacementCompletionBlock = self->_perReplacementCompletionBlock;
    self->_perReplacementCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perReplacementCompletionBlock
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
    v15 = sub_18A7C602C;
    v16 = sub_18A7C6054;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7C6360;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perReplacementCompletionBlock);
  }
  return v8;
}

- (void)setUploadDeltasCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id uploadDeltasCompletionBlock;
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
    block[2] = sub_18A7C64BC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    uploadDeltasCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_uploadDeltasCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    uploadDeltasCompletionBlock = self->_uploadDeltasCompletionBlock;
    self->_uploadDeltasCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)uploadDeltasCompletionBlock
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
    v15 = sub_18A7C602C;
    v16 = sub_18A7C6054;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7C6664;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_uploadDeltasCompletionBlock);
  }
  return v8;
}

- (CKUploadMergeableDeltasOperation)initWithDeltas:(id)a3 replacementRequests:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKUploadMergeableDeltasOperation *v11;
  uint64_t v12;
  NSArray *deltas;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *replacementRequests;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *perItemErrors;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CKUploadMergeableDeltasOperation;
  v11 = -[CKOperation init](&v25, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    deltas = v11->_deltas;
    v11->_deltas = (NSArray *)v12;

    v17 = objc_msgSend_copy(v7, v14, v15, v16);
    replacementRequests = v11->_replacementRequests;
    v11->_replacementRequests = (NSArray *)v17;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    perItemErrors = v11->_perItemErrors;
    v11->_perItemErrors = (NSMutableDictionary *)v22;

  }
  return v11;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  NSArray *deltas;
  NSArray *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  objc_class *v18;
  const char *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CKUploadMergeableDeltasOperation;
  if (!-[CKDatabaseOperation CKOperationShouldRun:](&v21, sel_CKOperationShouldRun_))
    return 0;
  if (self)
    deltas = self->_deltas;
  else
    deltas = 0;
  v6 = deltas;
  v10 = objc_msgSend_count(v6, v7, v8, v9);
  v14 = v10 != 0;
  if (v10)
    goto LABEL_10;
  if (self)
    v15 = objc_msgSend_count(self->_replacementRequests, v11, v12, v13);
  else
    v15 = objc_msgSend_count(0, v11, v12, v13);
  v16 = v15;
  v17 = v15 != 0;

  if (a3 && !v16)
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v19, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("%@ must have at least one delta or replacement"), v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    return v14;
  }
  return v17;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performUploadMergeableDeltasOperation_withBlock_;
}

- (void)fillOutOperationInfo:(id)a3
{
  NSArray *deltas;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  objc_super v16;

  if (self)
  {
    deltas = self->_deltas;
    v6 = a3;
    objc_msgSend_setDeltas_(v6, v7, (uint64_t)deltas, v8);
    objc_msgSend_setReplacementRequests_(a3, v9, (uint64_t)self->_replacementRequests, v10);
  }
  else
  {
    v11 = a3;
    objc_msgSend_setDeltas_(v11, v12, 0, v13);
    objc_msgSend_setReplacementRequests_(a3, v14, 0, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)CKUploadMergeableDeltasOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v16, sel_fillOutOperationInfo_, a3);

}

- (void)fillFromOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKUploadMergeableDeltasOperation;
  -[CKDatabaseOperation fillFromOperationInfo:](&v15, sel_fillFromOperationInfo_, v4);
  objc_msgSend_deltas(v4, v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_setProperty_nonatomic_copy(self, v8, v9, 536);

  objc_msgSend_replacementRequests(v4, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_setProperty_nonatomic_copy(self, v13, v14, 544);

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
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKUploadMergeableDeltasOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v17, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perDeltaCompletionBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_perReplacementCompletionBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_uploadDeltasCompletionBlock(self, v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15 != 0;

    }
  }

  return v6;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSMutableDictionary *perItemErrors;
  void *v10;
  NSMutableDictionary *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    if (self)
      v8 = objc_msgSend_count(self->_perItemErrors, v4, v5, v6);
    else
      v8 = objc_msgSend_count(0, v4, v5, v6);
    if (v8)
    {
      v41 = CFSTR("CKPartialErrors");
      if (self)
        perItemErrors = self->_perItemErrors;
      else
        perItemErrors = 0;
      v42[0] = perItemErrors;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = perItemErrors;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(v10, v12, (uint64_t)v42, (uint64_t)&v41, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v14, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v13, CFSTR("Failed to upload some deltas"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }
  objc_msgSend_CKClientSuitableError(v7, v4, v5, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v16 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v26 = v16;
    objc_msgSend_operationID(self, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v30;
    v39 = 2112;
    v40 = v15;
    _os_log_debug_impl(&dword_18A5C5000, v26, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling upload completion block with error: %@", buf, 0x16u);

  }
  objc_msgSend_uploadDeltasCompletionBlock(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_uploadDeltasCompletionBlock(self, v21, v22, v23);
    v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v24)[2](v24, v15);

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v25 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v31 = v25;
    objc_msgSend_operationID(self, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v35;
    v39 = 2112;
    v40 = v15;
    _os_log_debug_impl(&dword_18A5C5000, v31, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished calling upload completion block with error: %@", buf, 0x16u);

  }
  v36.receiver = self;
  v36.super_class = (Class)CKUploadMergeableDeltasOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v36, sel__finishOnCallbackQueueWithError_, v15);

}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/upload-mergeable-deltas", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)handleUploadForDeltaIdentifier:(id)a3 error:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *deltas;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    deltas = self->_deltas;
  else
    deltas = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = sub_18A7C7110;
  v41[3] = &unk_1E1F65728;
  v12 = v6;
  v42 = v12;
  objc_msgSend_CKFirstObjectPassingTest_(deltas, v13, (uint64_t)v41, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (self)
      objc_msgSend_setObject_forKeyedSubscript_(self->_perItemErrors, v15, (uint64_t)v10, (uint64_t)v12);
    else
      objc_msgSend_setObject_forKeyedSubscript_(0, v15, (uint64_t)v10, (uint64_t)v12);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v33 = v17;
      objc_msgSend_operationID(self, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v37;
      v45 = 2112;
      v46 = v12;
      v47 = 2112;
      v48 = v10;
      _os_log_debug_impl(&dword_18A5C5000, v33, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received delta upload callback for identifier %@ with error: %@", buf, 0x20u);

    }
    objc_msgSend_perDeltaCompletionBlock(self, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend_perDeltaCompletionBlock(self, v22, v23, v24);
      v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v25)[2](v25, v16, v10);

    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v26 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v27 = v26;
      objc_msgSend_operationID(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v31;
      v45 = 2112;
      v46 = v12;
      v47 = 2112;
      v48 = v10;
      _os_log_debug_impl(&dword_18A5C5000, v27, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished delta upload callback for identifier %@ with error: %@", buf, 0x20u);
LABEL_21:

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v32 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v27 = v32;
      objc_msgSend_operationID(self, v38, v39, v40);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v31;
      v45 = 2112;
      v46 = v12;
      _os_log_error_impl(&dword_18A5C5000, v27, OS_LOG_TYPE_ERROR, "Operation %{public}@ received delta upload callback for unknown delta with identifier: %@", buf, 0x16u);
      goto LABEL_21;
    }
  }

}

- (void)handleReplacementRequest:(id)a3 error:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *perItemErrors;
  NSMutableDictionary *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    perItemErrors = self->_perItemErrors;
  else
    perItemErrors = 0;
  v12 = perItemErrors;
  objc_msgSend_valueID(v6, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v17, (uint64_t)v10, (uint64_t)v16);

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v18 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v28 = v18;
    objc_msgSend_operationID(self, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543874;
    v39 = v32;
    v40 = 2112;
    v41 = v6;
    v42 = 2112;
    v43 = v10;
    _os_log_debug_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received replacement callback for request %@ with error: %@", (uint8_t *)&v38, 0x20u);

  }
  objc_msgSend_perReplacementCompletionBlock(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_perReplacementCompletionBlock(self, v23, v24, v25);
    v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v26)[2](v26, v6, v10);

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v27 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v33 = v27;
    objc_msgSend_operationID(self, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543362;
    v39 = v37;
    _os_log_debug_impl(&dword_18A5C5000, v33, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished replacement callback", (uint8_t *)&v38, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perItemErrors, 0);
  objc_storeStrong((id *)&self->_replacementRequests, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
  objc_storeStrong(&self->_uploadDeltasCompletionBlock, 0);
  objc_storeStrong(&self->_perReplacementCompletionBlock, 0);
  objc_storeStrong(&self->_perDeltaCompletionBlock, 0);
}

@end
