@implementation CKFetchSubscriptionsOperation

- (CKFetchSubscriptionsOperation)init
{
  CKFetchSubscriptionsOperation *v2;
  uint64_t v3;
  NSMutableDictionary *subscriptionsBySubscriptionID;
  uint64_t v5;
  NSMutableDictionary *subscriptionErrors;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKFetchSubscriptionsOperation;
  v2 = -[CKOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    subscriptionsBySubscriptionID = v2->_subscriptionsBySubscriptionID;
    v2->_subscriptionsBySubscriptionID = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    subscriptionErrors = v2->_subscriptionErrors;
    v2->_subscriptionErrors = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)setPerSubscriptionCompletionBlock:(void *)perSubscriptionCompletionBlock
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

  v14 = perSubscriptionCompletionBlock;
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
    block[2] = sub_18A7CA1E0;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perSubscriptionCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perSubscriptionCompletionBlock;
    self->_perSubscriptionCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perSubscriptionCompletionBlock
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
    v15 = sub_18A7CA388;
    v16 = sub_18A7CA3B0;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7CA3B8;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perSubscriptionCompletionBlock);
  }
  return v8;
}

- (void)setFetchSubscriptionCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id fetchSubscriptionCompletionBlock;
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
    block[2] = sub_18A7CA514;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    fetchSubscriptionCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchSubscriptionCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    fetchSubscriptionCompletionBlock = self->_fetchSubscriptionCompletionBlock;
    self->_fetchSubscriptionCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)fetchSubscriptionCompletionBlock
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
    v15 = sub_18A7CA388;
    v16 = sub_18A7CA3B0;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7CA6BC;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchSubscriptionCompletionBlock);
  }
  return v8;
}

- (void)setFetchSubscriptionCompletionBlock:(void *)fetchSubscriptionCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = fetchSubscriptionCompletionBlock == 0;
  v9 = fetchSubscriptionCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setFetchSubscriptionCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

}

+ (CKFetchSubscriptionsOperation)fetchAllSubscriptionsOperation
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_setIsFetchAllSubscriptionsOperation_(v2, v3, 1, v4);
  return (CKFetchSubscriptionsOperation *)v2;
}

- (CKFetchSubscriptionsOperation)initWithSubscriptionIDs:(NSArray *)subscriptionIDs
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKFetchSubscriptionsOperation *v11;
  uint64_t v12;
  NSArray *v13;

  v4 = subscriptionIDs;
  v11 = (CKFetchSubscriptionsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_subscriptionIDs;
    v11->_subscriptionIDs = (NSArray *)v12;

  }
  return v11;
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
  uint64_t AllSubscriptionsOperation;
  const char *v15;
  uint64_t v16;
  objc_super v17;

  v4 = a3;
  objc_msgSend_subscriptionIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubscriptionIDs_(v4, v9, (uint64_t)v8, v10);

  AllSubscriptionsOperation = objc_msgSend_isFetchAllSubscriptionsOperation(self, v11, v12, v13);
  objc_msgSend_setIsFetchAllSubscriptionsOperation_(v4, v15, AllSubscriptionsOperation, v16);
  v17.receiver = self;
  v17.super_class = (Class)CKFetchSubscriptionsOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v17, sel_fillOutOperationInfo_, v4);

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
  uint64_t AllSubscriptionsOperation;
  const char *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKFetchSubscriptionsOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v17, sel_fillFromOperationInfo_, v4);
  objc_msgSend_subscriptionIDs(v4, v5, v6, v7, v17.receiver, v17.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubscriptionIDs_(self, v9, (uint64_t)v8, v10);

  AllSubscriptionsOperation = objc_msgSend_isFetchAllSubscriptionsOperation(v4, v11, v12, v13);
  objc_msgSend_setIsFetchAllSubscriptionsOperation_(self, v15, AllSubscriptionsOperation, v16);
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
  v13.super_class = (Class)CKFetchSubscriptionsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perSubscriptionCompletionBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_fetchSubscriptionCompletionBlock(self, v7, v8, v9);
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
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  objc_class *v36;
  void *v37;
  const char *v38;
  objc_class *v40;
  void *v41;
  const char *v42;
  void *v43;
  objc_super v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend_subscriptionIDs(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else if ((objc_msgSend_isFetchAllSubscriptionsOperation(self, v7, v8, v9) & 1) == 0)
  {
    if (a3)
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v42, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("property subscriptionIDs must not be be nil for %@"), v41);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend_subscriptionIDs(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v46;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v46 != v17)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a3)
          {
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v38, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected subscriptionID passed to %@: %@"), v37, v19);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          return 0;
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v20, (uint64_t)&v45, (uint64_t)v49, 16);
      if (v16)
        continue;
      break;
    }
  }

  if ((objc_msgSend_isFetchAllSubscriptionsOperation(self, v21, v22, v23) & 1) == 0)
  {
    objc_msgSend_subscriptionIDs(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_count(v27, v28, v29, v30);

    if (!v31)
      return 0;
  }
  objc_msgSend_fetchSubscriptionCompletionBlock(self, v24, v25, v26);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    objc_msgSend_perSubscriptionCompletionBlock(self, v33, v34, v35);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
      goto LABEL_23;
    return 0;
  }

LABEL_23:
  v44.receiver = self;
  v44.super_class = (Class)CKFetchSubscriptionsOperation;
  return -[CKDatabaseOperation CKOperationShouldRun:](&v44, sel_CKOperationShouldRun_, a3);
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchSubscriptionsOperation_withBlock_;
}

- (void)handleSubscriptionFetchForSubscriptionID:(id)a3 subscription:(id)a4 error:(id)a5
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
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void (**v57)(void *, id, id, void *);
  void *v58;
  _BYTE v59[24];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
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
      if ((objc_msgSend_canDropItemResultsEarly(self, v16, v17, v18) & 1) == 0)
        goto LABEL_27;
      goto LABEL_29;
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
    *(_DWORD *)v59 = 138412290;
    *(_QWORD *)&v59[4] = v8;
    v31 = "Subscription %@ fetched";
    v32 = v24;
    v33 = v45;
    v34 = 12;
    goto LABEL_20;
  }
  if (!v15)
  {
    if ((objc_msgSend_canDropItemResultsEarly(self, v16, v17, v18) & 1) == 0)
      goto LABEL_25;
    goto LABEL_29;
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
    *(_DWORD *)v59 = 138412546;
    *(_QWORD *)&v59[4] = v8;
    *(_WORD *)&v59[12] = 2112;
    *(_QWORD *)&v59[14] = v13;
    v31 = "Subscription %@ fetched with error: %@";
    v32 = v24;
    v33 = v30;
    v34 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v32, OS_SIGNPOST_EVENT, v33, "CKFetchSubscriptionsOperation", v31, v59, v34);
  }
LABEL_21:

  if ((objc_msgSend_canDropItemResultsEarly(self, v46, v47, v48) & 1) == 0)
  {
    if (!v13)
    {
LABEL_27:
      if (self)
        objc_msgSend_setObject_forKeyedSubscript_(self->_subscriptionsBySubscriptionID, v49, (uint64_t)v9, (uint64_t)v8, *(_QWORD *)v59, *(_QWORD *)&v59[8]);
      else
        objc_msgSend_setObject_forKeyedSubscript_(0, v49, (uint64_t)v9, (uint64_t)v8, *(_QWORD *)v59, *(_QWORD *)&v59[8]);
      goto LABEL_29;
    }
LABEL_25:
    if (self)
      objc_msgSend_setObject_forKeyedSubscript_(self->_subscriptionErrors, v49, (uint64_t)v13, (uint64_t)v8, *(_OWORD *)v59, *(_QWORD *)&v59[16], v60);
    else
      objc_msgSend_setObject_forKeyedSubscript_(0, v49, (uint64_t)v13, (uint64_t)v8, *(_OWORD *)v59, *(_QWORD *)&v59[16], v60);
    goto LABEL_27;
  }
LABEL_29:
  objc_msgSend_perSubscriptionCompletionBlock_wrapper(self, v49, v50, v51, *(_QWORD *)v59, *(_QWORD *)&v59[8]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v52;
  if (v52)
  {
    v57 = (void (**)(void *, id, id, void *))_Block_copy(v52);
  }
  else
  {
    objc_msgSend_perSubscriptionCompletionBlock(self, v53, v54, v55);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void (**)(void *, id, id, void *))_Block_copy(v58);

  }
  if (v57)
    v57[2](v57, v8, v9, v13);

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
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void (**v32)(void *, id, void *);
  void *v33;
  const char *v34;
  uint64_t v35;
  NSMutableDictionary *subscriptionsBySubscriptionID;
  NSMutableDictionary *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  objc_super v44;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchSubscriptionsOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    if (self)
      v22 = objc_msgSend_count(self->_subscriptionErrors, v7, v8, v9);
    else
      v22 = objc_msgSend_count(0, v7, v8, v9);
    if (v22)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23;
      if (self)
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)self->_subscriptionErrors, (uint64_t)CFSTR("CKPartialErrors"));
      else
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, 0, (uint64_t)CFSTR("CKPartialErrors"));
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v25, CFSTR("Failed to fetch some subscriptions"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_fetchSubscriptionCompletionBlock_wrapper(self, v7, v8, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v27;
  if (v27)
  {
    v32 = (void (**)(void *, id, void *))_Block_copy(v27);
  }
  else
  {
    objc_msgSend_fetchSubscriptionCompletionBlock(self, v28, v29, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void (**)(void *, id, void *))_Block_copy(v33);

  }
  if (v32)
  {
    if (self)
      subscriptionsBySubscriptionID = self->_subscriptionsBySubscriptionID;
    else
      subscriptionsBySubscriptionID = 0;
    v37 = subscriptionsBySubscriptionID;
    objc_msgSend_CKClientSuitableError(v4, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2](v32, v37, v41);

    objc_msgSend_setFetchSubscriptionCompletionBlock_(self, v42, 0, v43);
  }
  objc_msgSend_setPerSubscriptionCompletionBlock_(self, v34, 0, v35);
  v44.receiver = self;
  v44.super_class = (Class)CKFetchSubscriptionsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v44, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchSubscriptionsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchSubscriptionsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-subscriptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleSubscriptionFetchForSubscriptionID_subscription_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchSubscriptionsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)subscriptionIDs
{
  return self->_subscriptionIDs;
}

- (void)setSubscriptionIDs:(NSArray *)subscriptionIDs
{
  objc_setProperty_nonatomic_copy(self, a2, subscriptionIDs, 536);
}

- (id)perSubscriptionCompletionBlock_wrapper
{
  return self->_perSubscriptionCompletionBlock_wrapper;
}

- (void)setPerSubscriptionCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (id)fetchSubscriptionCompletionBlock_wrapper
{
  return self->_fetchSubscriptionCompletionBlock_wrapper;
}

- (void)setFetchSubscriptionCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (BOOL)isFetchAllSubscriptionsOperation
{
  return self->_isFetchAllSubscriptionsOperation;
}

- (void)setIsFetchAllSubscriptionsOperation:(BOOL)a3
{
  self->_isFetchAllSubscriptionsOperation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionErrors, 0);
  objc_storeStrong((id *)&self->_subscriptionsBySubscriptionID, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong(&self->_fetchSubscriptionCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perSubscriptionCompletionBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_subscriptionIDs, 0);
  objc_storeStrong(&self->_fetchSubscriptionCompletionBlock, 0);
  objc_storeStrong(&self->_perSubscriptionCompletionBlock, 0);
}

@end
