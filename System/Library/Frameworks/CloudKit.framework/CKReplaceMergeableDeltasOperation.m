@implementation CKReplaceMergeableDeltasOperation

- (void)setPerReplacementBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perReplacementBlock;
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
    block[2] = sub_18A815CE4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perReplacementBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perReplacementBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perReplacementBlock = self->_perReplacementBlock;
    self->_perReplacementBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perReplacementBlock
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
    v15 = sub_18A815E8C;
    v16 = sub_18A815EB4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A815EBC;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perReplacementBlock);
  }
  return v8;
}

- (void)setReplaceMergeableDeltasCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id replaceMergeableDeltasCompletionBlock;
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
    block[2] = sub_18A816018;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    replaceMergeableDeltasCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_replaceMergeableDeltasCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    replaceMergeableDeltasCompletionBlock = self->_replaceMergeableDeltasCompletionBlock;
    self->_replaceMergeableDeltasCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)replaceMergeableDeltasCompletionBlock
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
    v15 = sub_18A815E8C;
    v16 = sub_18A815EB4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A8161C0;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_replaceMergeableDeltasCompletionBlock);
  }
  return v8;
}

- (CKReplaceMergeableDeltasOperation)initWithReplaceDeltasRequests:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKReplaceMergeableDeltasOperation *v8;
  uint64_t v9;
  NSArray *replaceDeltasRequests;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *perValueErrors;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKReplaceMergeableDeltasOperation;
  v8 = -[CKOperation init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    replaceDeltasRequests = v8->_replaceDeltasRequests;
    v8->_replaceDeltasRequests = (NSArray *)v9;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    perValueErrors = v8->_perValueErrors;
    v8->_perValueErrors = (NSMutableDictionary *)v14;

  }
  return v8;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKReplaceMergeableDeltasOperation;
  v5 = -[CKDatabaseOperation CKOperationShouldRun:](&v20, sel_CKOperationShouldRun_);
  if (v5)
  {
    objc_msgSend_replaceDeltasRequests(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_count(v9, v10, v11, v12);

    if (v13)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (a3)
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v18, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("%@ cannot run without a %@"), v15, v17);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performReplaceMergeableDeltasOperation_withBlock_;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKReplaceMergeableDeltasOperation;
  v4 = a3;
  -[CKDatabaseOperation fillOutOperationInfo:](&v11, sel_fillOutOperationInfo_, v4);
  objc_msgSend_replaceDeltasRequests(self, v5, v6, v7, v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setReplaceDeltasRequests_(v4, v9, (uint64_t)v8, v10);

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKReplaceMergeableDeltasOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v11, sel_fillFromOperationInfo_, v4);
  objc_msgSend_replaceDeltasRequests(v4, v5, v6, v7, v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setReplaceDeltasRequests_(self, v9, (uint64_t)v8, v10);
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
  v13.super_class = (Class)CKReplaceMergeableDeltasOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perReplacementBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_replaceMergeableDeltasCompletionBlock(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11 != 0;

  }
  return v6;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
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
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD);
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
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend_perValueErrors(self, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_count(v8, v9, v10, v11);

    if (v12)
    {
      v43 = CFSTR("CKPartialErrors");
      objc_msgSend_perValueErrors(self, v4, v5, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v13;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v44, (uint64_t)&v43, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v16, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v15, CFSTR("Failed to replace some delta metadata"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }
  objc_msgSend_CKClientSuitableError(v7, v4, v5, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v18 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v28 = v18;
    objc_msgSend_operationID(self, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v32;
    v41 = 2112;
    v42 = v17;
    _os_log_debug_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling replace mergeable deltas completion block with error: %@", buf, 0x16u);

  }
  objc_msgSend_replaceMergeableDeltasCompletionBlock(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_replaceMergeableDeltasCompletionBlock(self, v23, v24, v25);
    v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v26)[2](v26, v17);

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v27 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v33 = v27;
    objc_msgSend_operationID(self, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v37;
    v41 = 2112;
    v42 = v17;
    _os_log_debug_impl(&dword_18A5C5000, v33, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished calling replace mergeable deltas completion block with error: %@", buf, 0x16u);

  }
  v38.receiver = self;
  v38.super_class = (Class)CKReplaceMergeableDeltasOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v38, sel__finishOnCallbackQueueWithError_, v17);

}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/replace-mergeable-deltas", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)handleCompletedReplaceDeltasRequest:(id)a3 error:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_perValueErrors(self, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueID(v6, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v14, v19, (uint64_t)v13, (uint64_t)v18);

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v20 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v30 = v20;
    objc_msgSend_operationID(self, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138543874;
    v41 = v34;
    v42 = 2112;
    v43 = v6;
    v44 = 2112;
    v45 = v13;
    _os_log_debug_impl(&dword_18A5C5000, v30, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received replace mergeable deltas request callback for %@ with error: %@", (uint8_t *)&v40, 0x20u);

  }
  objc_msgSend_perReplacementBlock(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_perReplacementBlock(self, v25, v26, v27);
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v28)[2](v28, v6, v13);

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v29 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v35 = v29;
    objc_msgSend_operationID(self, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138543874;
    v41 = v39;
    v42 = 2112;
    v43 = v6;
    v44 = 2112;
    v45 = v13;
    _os_log_debug_impl(&dword_18A5C5000, v35, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished replace mergeable deltas request callback for %@ with error: %@", (uint8_t *)&v40, 0x20u);

  }
}

- (NSArray)replaceDeltasRequests
{
  return self->_replaceDeltasRequests;
}

- (void)setReplaceDeltasRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSMutableDictionary)perValueErrors
{
  return self->_perValueErrors;
}

- (void)setPerValueErrors:(id)a3
{
  objc_storeStrong((id *)&self->_perValueErrors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perValueErrors, 0);
  objc_storeStrong((id *)&self->_replaceDeltasRequests, 0);
  objc_storeStrong(&self->_replaceMergeableDeltasCompletionBlock, 0);
  objc_storeStrong(&self->_perReplacementBlock, 0);
}

@end
