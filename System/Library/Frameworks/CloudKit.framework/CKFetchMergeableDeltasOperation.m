@implementation CKFetchMergeableDeltasOperation

- (void)setDeltasFetchedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id deltasFetchedBlock;
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
    block[2] = sub_18A7D9A7C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    deltasFetchedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_deltasFetchedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    deltasFetchedBlock = self->_deltasFetchedBlock;
    self->_deltasFetchedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)deltasFetchedBlock
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
    v15 = sub_18A7D9C24;
    v16 = sub_18A7D9C4C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7D9C54;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_deltasFetchedBlock);
  }
  return v8;
}

- (void)setFetchMergeableDeltasCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id fetchMergeableDeltasCompletionBlock;
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
    block[2] = sub_18A7D9DB0;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    fetchMergeableDeltasCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchMergeableDeltasCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    fetchMergeableDeltasCompletionBlock = self->_fetchMergeableDeltasCompletionBlock;
    self->_fetchMergeableDeltasCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)fetchMergeableDeltasCompletionBlock
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
    v15 = sub_18A7D9C24;
    v16 = sub_18A7D9C4C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7D9F58;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchMergeableDeltasCompletionBlock);
  }
  return v8;
}

- (CKFetchMergeableDeltasOperation)initWithMergeableValueIDs:(id)a3
{
  id v4;
  CKFetchMergeableDeltasOperation *v5;
  const char *v6;
  uint64_t v7;
  CKFetchMergeableDeltasOperation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKFetchMergeableDeltasOperation;
  v5 = -[CKOperation init](&v10, sel_init);
  v8 = v5;
  if (v5)
    objc_msgSend_setMergeableValueIDs_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKFetchMergeableDeltasOperation;
  if (!-[CKDatabaseOperation CKOperationShouldRun:](&v18, sel_CKOperationShouldRun_))
    return 0;
  objc_msgSend_mergeableValueIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_count(v8, v9, v10, v11);
  v13 = v12 != 0;

  if (a3 && !v12)
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("%@ must have at least one mergeable ID to fetch"), v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  return v13;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchMergeableDeltasOperation_withBlock_;
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

  v4 = a3;
  objc_msgSend_mergeableValueIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMergeableValueIDs_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKFetchMergeableDeltasOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v11, sel_fillOutOperationInfo_, v4);

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
  v11.super_class = (Class)CKFetchMergeableDeltasOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v11, sel_fillFromOperationInfo_, v4);
  objc_msgSend_mergeableValueIDs(v4, v5, v6, v7, v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setMergeableValueIDs_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKFetchMergeableDeltasOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v9, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_fetchMergeableDeltasCompletionBlock(self, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7 != 0;

  return v6;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend_CKClientSuitableError(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v16 = v6;
    objc_msgSend_operationID(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v20;
    v29 = 2112;
    v30 = v5;
    _os_log_debug_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling fetch completion block with error: %@", buf, 0x16u);

  }
  objc_msgSend_fetchMergeableDeltasCompletionBlock(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_fetchMergeableDeltasCompletionBlock(self, v11, v12, v13);
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v14)[2](v14, v5);

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v15 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v21 = v15;
    objc_msgSend_operationID(self, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v25;
    v29 = 2112;
    v30 = v5;
    _os_log_debug_impl(&dword_18A5C5000, v21, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished calling fetch completion block with error: %@", buf, 0x16u);

  }
  v26.receiver = self;
  v26.super_class = (Class)CKFetchMergeableDeltasOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v26, sel__finishOnCallbackQueueWithError_, v5);

}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-mergeable-deltas", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___CKFetchMergeableDeltasOperation;
  v3 = a3;
  objc_msgSendSuper2(&v11, sel_applyDaemonCallbackInterfaceTweaks_, v3);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v7, v5, v8, v6, 0, v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v10, (uint64_t)v9, (uint64_t)sel_handleFetchForMergeableValueID_fetchedDeltas_error_, 1, 0);

}

- (void)handleFetchForMergeableValueID:(id)a3 fetchedDeltas:(id)a4 error:(id)a5
{
  id v8;
  id v9;
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
  uint64_t v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v24 = v14;
    objc_msgSend_operationID(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138544130;
    v38 = v28;
    v39 = 2112;
    v40 = v8;
    v41 = 2048;
    v42 = objc_msgSend_count(v9, v29, v30, v31);
    v43 = 2112;
    v44 = v13;
    _os_log_debug_impl(&dword_18A5C5000, v24, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received deltas fetched callback for mergeable %@ with %ld deltas and error: %@", (uint8_t *)&v37, 0x2Au);

  }
  objc_msgSend_deltasFetchedBlock(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_deltasFetchedBlock(self, v19, v20, v21);
    v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, void *))v22)[2](v22, v8, v9, v13);

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v23 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v32 = v23;
    objc_msgSend_operationID(self, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543874;
    v38 = v36;
    v39 = 2112;
    v40 = v8;
    v41 = 2112;
    v42 = (uint64_t)v13;
    _os_log_debug_impl(&dword_18A5C5000, v32, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished deltas fetched callback for mergeable %@ with error: %@", (uint8_t *)&v37, 0x20u);

  }
}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValueIDs, 0);
  objc_storeStrong(&self->_fetchMergeableDeltasCompletionBlock, 0);
  objc_storeStrong(&self->_deltasFetchedBlock, 0);
}

@end
