@implementation CKModifySubscriptionsOperation

- (CKModifySubscriptionsOperation)init
{
  CKModifySubscriptionsOperation *v2;
  uint64_t v3;
  NSMutableDictionary *subscriptionsBySubscriptionIDs;
  uint64_t v5;
  NSMutableDictionary *subscriptionErrors;
  uint64_t v7;
  NSMutableArray *savedSubscriptions;
  uint64_t v9;
  NSMutableArray *deletedSubscriptionIDs;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKModifySubscriptionsOperation;
  v2 = -[CKOperation init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    subscriptionsBySubscriptionIDs = v2->_subscriptionsBySubscriptionIDs;
    v2->_subscriptionsBySubscriptionIDs = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    subscriptionErrors = v2->_subscriptionErrors;
    v2->_subscriptionErrors = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    savedSubscriptions = v2->_savedSubscriptions;
    v2->_savedSubscriptions = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    deletedSubscriptionIDs = v2->_deletedSubscriptionIDs;
    v2->_deletedSubscriptionIDs = (NSMutableArray *)v9;

  }
  return v2;
}

- (CKModifySubscriptionsOperation)initWithSubscriptionsToSave:(NSArray *)subscriptionsToSave subscriptionIDsToDelete:(NSArray *)subscriptionIDsToDelete
{
  NSArray *v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKModifySubscriptionsOperation *v14;
  uint64_t v15;
  NSArray *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;

  v6 = subscriptionsToSave;
  v7 = subscriptionIDsToDelete;
  v14 = (CKModifySubscriptionsOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    v15 = objc_msgSend_copy(v6, v11, v12, v13);
    v16 = v14->_subscriptionsToSave;
    v14->_subscriptionsToSave = (NSArray *)v15;

    v20 = objc_msgSend_copy(v7, v17, v18, v19);
    v21 = v14->_subscriptionIDsToDelete;
    v14->_subscriptionIDsToDelete = (NSArray *)v20;

  }
  return v14;
}

- (void)setPerSubscriptionSaveBlock:(void *)perSubscriptionSaveBlock
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

  v14 = perSubscriptionSaveBlock;
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
    block[2] = sub_18A7A9CFC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perSubscriptionSaveBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perSubscriptionSaveBlock;
    self->_perSubscriptionSaveBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perSubscriptionSaveBlock
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
    v15 = sub_18A7A9EA4;
    v16 = sub_18A7A9ECC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7A9ED4;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perSubscriptionSaveBlock);
  }
  return v8;
}

- (void)setPerSubscriptionDeleteBlock:(void *)perSubscriptionDeleteBlock
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

  v14 = perSubscriptionDeleteBlock;
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
    block[2] = sub_18A7AA030;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perSubscriptionDeleteBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perSubscriptionDeleteBlock;
    self->_perSubscriptionDeleteBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perSubscriptionDeleteBlock
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
    v15 = sub_18A7A9EA4;
    v16 = sub_18A7A9ECC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AA1D8;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perSubscriptionDeleteBlock);
  }
  return v8;
}

- (void)setModifySubscriptionsCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id modifySubscriptionsCompletionBlock;
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
    block[2] = sub_18A7AA334;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    modifySubscriptionsCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_modifySubscriptionsCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    modifySubscriptionsCompletionBlock = self->_modifySubscriptionsCompletionBlock;
    self->_modifySubscriptionsCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)modifySubscriptionsCompletionBlock
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
    v15 = sub_18A7A9EA4;
    v16 = sub_18A7A9ECC;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7AA4DC;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_modifySubscriptionsCompletionBlock);
  }
  return v8;
}

- (void)setModifySubscriptionsCompletionBlock:(void *)modifySubscriptionsCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = modifySubscriptionsCompletionBlock == 0;
  v9 = modifySubscriptionsCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setModifySubscriptionsCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

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
  objc_super v17;

  v4 = a3;
  objc_msgSend_subscriptionsToSave(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubscriptionsToSave_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_subscriptionIDsToDelete(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubscriptionIDsToDelete_(v4, v15, (uint64_t)v14, v16);

  v17.receiver = self;
  v17.super_class = (Class)CKModifySubscriptionsOperation;
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
  void *v14;
  const char *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKModifySubscriptionsOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v17, sel_fillFromOperationInfo_, v4);
  objc_msgSend_subscriptionsToSave(v4, v5, v6, v7, v17.receiver, v17.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubscriptionsToSave_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_subscriptionIDsToDelete(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setSubscriptionIDsToDelete_(self, v15, (uint64_t)v14, v16);
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
  v17.super_class = (Class)CKModifySubscriptionsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v17, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perSubscriptionSaveBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_perSubscriptionDeleteBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_modifySubscriptionsCompletionBlock(self, v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15 != 0;

    }
  }

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *subscriptionsBySubscriptionIDs;
  NSMutableDictionary *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  char v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  int v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  id *v73;
  objc_class *v74;
  void *v75;
  const char *v76;
  BOOL v77;
  objc_class *v78;
  void *v79;
  const char *v80;
  id *v81;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  objc_super v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend_subscriptionsToSave(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v94, (uint64_t)v99, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v95;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v95 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a3)
          {
            v74 = (objc_class *)objc_opt_class();
            NSStringFromClass(v74);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v76, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected subscription object passed to %@: %@"), v75, v14);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_43;
        }
        if (self)
          subscriptionsBySubscriptionIDs = self->_subscriptionsBySubscriptionIDs;
        else
          subscriptionsBySubscriptionIDs = 0;
        v16 = subscriptionsBySubscriptionIDs;
        objc_msgSend_subscriptionID(v14, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v16, v21, (uint64_t)v14, (uint64_t)v20);

        objc_msgSend_subscriptionID(v14, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = objc_msgSend_containsObject_(v4, v26, (uint64_t)v25, v27);

        if ((_DWORD)v20)
        {
          if (!a3)
            goto LABEL_43;
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v28, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't save the same subscription twice: %@"), v14);
          v77 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_44;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_zoneID(v14, v29, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v33, (uint64_t)v32, (uint64_t)a3);

          if ((v34 & 1) == 0)
            goto LABEL_43;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_zoneID(v14, v35, v36, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v39, (uint64_t)v38, (uint64_t)a3);

            if (!v40)
              goto LABEL_43;
          }
        }
        objc_msgSend_subscriptionID(v14, v35, v36, v37);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v4, v42, (uint64_t)v41, v43);

        ++v13;
      }
      while (v11 != v13);
      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v44, (uint64_t)&v94, (uint64_t)v99, 16);
      v11 = v45;
    }
    while (v45);
  }

  v8 = (void *)objc_opt_new();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  objc_msgSend_subscriptionIDsToDelete(self, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v90, (uint64_t)v98, 16);
  if (!v51)
    goto LABEL_29;
  v52 = v51;
  v53 = *(_QWORD *)v91;
  while (2)
  {
    for (i = 0; i != v52; ++i)
    {
      if (*(_QWORD *)v91 != v53)
        objc_enumerationMutation(v49);
      v55 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          v78 = (objc_class *)objc_opt_class();
          NSStringFromClass(v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v80, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected subscription ID object passed to %@: %@"), v79, v55);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_42;
      }
      if (objc_msgSend_containsObject_(v4, v56, v55, v57))
      {
        v81 = a3;
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v58, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't save and delete a subscription in the same operation: %@"), v55);
LABEL_41:
          *v81 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_42:

        goto LABEL_43;
      }
      if (objc_msgSend_containsObject_(v8, v58, v55, v59))
      {
        v81 = a3;
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v60, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't delete the same subscription twice: %@"), v55);
          goto LABEL_41;
        }
        goto LABEL_42;
      }
      objc_msgSend_addObject_(v8, v60, v55, v61);
    }
    v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v62, (uint64_t)&v90, (uint64_t)v98, 16);
    if (v52)
      continue;
    break;
  }
LABEL_29:

  objc_msgSend_subscriptionsToSave(self, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v66, v67, v68, v69))
  {

    v73 = a3;
    goto LABEL_46;
  }
  objc_msgSend_subscriptionIDsToDelete(self, v70, v71, v72);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend_count(v83, v84, v85, v86);

  v73 = a3;
  if (v87)
  {
LABEL_46:
    v89.receiver = self;
    v89.super_class = (Class)CKModifySubscriptionsOperation;
    v77 = -[CKDatabaseOperation CKOperationShouldRun:](&v89, sel_CKOperationShouldRun_, v73);
    goto LABEL_44;
  }
LABEL_43:
  v77 = 0;
LABEL_44:

  return v77;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performModifySubscriptionsOperation_withBlock_;
}

- (void)handleSubscriptionSaveForSubscriptionID:(id)a3 error:(id)a4
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
  os_signpost_id_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  CKSignpost *v32;
  CKSignpost *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  CKSignpost *v38;
  CKSignpost *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  os_signpost_id_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void (**v52)(void *, id, void *, void *);
  void *v53;
  int v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v12 = signpost;

  if (v10)
  {
    if (v12)
    {
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

      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        v54 = 138412546;
        v55 = v6;
        v56 = 2112;
        v57 = v10;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v21, OS_SIGNPOST_EVENT, v27, "CKModifySubscriptionsOperation", "Subscription %@ saved with error: %@", (uint8_t *)&v54, 0x16u);
      }

    }
    if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0)
    {
      if (self)
        objc_msgSend_setObject_forKeyedSubscript_(self->_subscriptionErrors, v28, (uint64_t)v10, (uint64_t)v6);
      else
        objc_msgSend_setObject_forKeyedSubscript_(0, v28, (uint64_t)v10, (uint64_t)v6);
    }
    v31 = 0;
  }
  else
  {
    if (v12)
    {
      if (self)
        v32 = self->super.super._signpost;
      else
        v32 = 0;
      v33 = v32;
      objc_msgSend_log(v33, v34, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();

      if (self)
        v38 = self->super.super._signpost;
      else
        v38 = 0;
      v39 = v38;
      v43 = objc_msgSend_identifier(v39, v40, v41, v42);

      if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        v54 = 138412290;
        v55 = v6;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v37, OS_SIGNPOST_EVENT, v43, "CKModifySubscriptionsOperation", "Subscription %@ saved", (uint8_t *)&v54, 0xCu);
      }

    }
    if (self)
      objc_msgSend_objectForKeyedSubscript_(self->_subscriptionsBySubscriptionIDs, v13, (uint64_t)v6, v15);
    else
      objc_msgSend_objectForKeyedSubscript_(0, v13, (uint64_t)v6, v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_canDropItemResultsEarly(self, v44, v45, v46) & 1) == 0)
    {
      if (self)
        objc_msgSend_addObject_(self->_savedSubscriptions, v28, (uint64_t)v31, v30);
      else
        objc_msgSend_addObject_(0, v28, (uint64_t)v31, v30);
    }
  }
  objc_msgSend_perSubscriptionSaveBlock_wrapper(self, v28, v29, v30);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v47;
  if (v47)
  {
    v52 = (void (**)(void *, id, void *, void *))_Block_copy(v47);
  }
  else
  {
    objc_msgSend_perSubscriptionSaveBlock(self, v48, v49, v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void (**)(void *, id, void *, void *))_Block_copy(v53);

  }
  if (v52)
    v52[2](v52, v6, v31, v10);

}

- (void)handleSubscriptionDeleteForSubscriptionID:(id)a3 error:(id)a4
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
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void (**v54)(void *, id, void *);
  void *v55;
  _BYTE v56[24];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
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
      if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0)
        goto LABEL_28;
      goto LABEL_30;
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
    *(_DWORD *)v56 = 138412290;
    *(_QWORD *)&v56[4] = v6;
    v28 = "Subscription %@ deleted";
    v29 = v21;
    v30 = v42;
    v31 = 12;
    goto LABEL_20;
  }
  if (!v12)
  {
    if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0)
      goto LABEL_25;
    goto LABEL_30;
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
    *(_DWORD *)v56 = 138412546;
    *(_QWORD *)&v56[4] = v6;
    *(_WORD *)&v56[12] = 2112;
    *(_QWORD *)&v56[14] = v10;
    v28 = "Subscription %@ deleted with error: %@";
    v29 = v21;
    v30 = v27;
    v31 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v29, OS_SIGNPOST_EVENT, v30, "CKModifySubscriptionsOperation", v28, v56, v31);
  }
LABEL_21:

  if ((objc_msgSend_canDropItemResultsEarly(self, v43, v44, v45) & 1) == 0)
  {
    if (!v10)
    {
LABEL_28:
      if (self)
        objc_msgSend_addObject_(self->_deletedSubscriptionIDs, v46, (uint64_t)v6, v48, *(_QWORD *)v56, *(_OWORD *)&v56[8], v57);
      else
        objc_msgSend_addObject_(0, v46, (uint64_t)v6, v48, *(_QWORD *)v56, *(_OWORD *)&v56[8], v57);
      goto LABEL_30;
    }
LABEL_25:
    if (self)
      objc_msgSend_setObject_forKeyedSubscript_(self->_subscriptionErrors, v46, (uint64_t)v10, (uint64_t)v6, *(_OWORD *)v56, *(_QWORD *)&v56[16], v57);
    else
      objc_msgSend_setObject_forKeyedSubscript_(0, v46, (uint64_t)v10, (uint64_t)v6, *(_OWORD *)v56, *(_QWORD *)&v56[16], v57);
  }
LABEL_30:
  objc_msgSend_perSubscriptionDeleteBlock_wrapper(self, v46, v47, v48, *(_QWORD *)v56, *(_QWORD *)&v56[8]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v49;
  if (v49)
  {
    v54 = (void (**)(void *, id, void *))_Block_copy(v49);
  }
  else
  {
    objc_msgSend_perSubscriptionDeleteBlock(self, v50, v51, v52);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void (**)(void *, id, void *))_Block_copy(v55);

  }
  if (v54)
    v54[2](v54, v6, v10);

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
  void (**v32)(void *, NSMutableArray *, id, void *);
  void *v33;
  const char *v34;
  uint64_t v35;
  NSMutableArray *v36;
  NSMutableArray *deletedSubscriptionIDs;
  NSMutableArray *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  objc_super v47;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKModifySubscriptionsOperation", "Finishing", buf, 2u);
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
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v25, CFSTR("Failed to modify some subscriptions"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_modifySubscriptionsCompletionBlock_wrapper(self, v7, v8, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v27;
  if (v27)
  {
    v32 = (void (**)(void *, NSMutableArray *, id, void *))_Block_copy(v27);
  }
  else
  {
    objc_msgSend_modifySubscriptionsCompletionBlock(self, v28, v29, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void (**)(void *, NSMutableArray *, id, void *))_Block_copy(v33);

  }
  if (v32)
  {
    if (self)
    {
      v36 = self->_savedSubscriptions;
      deletedSubscriptionIDs = self->_deletedSubscriptionIDs;
    }
    else
    {
      v36 = 0;
      deletedSubscriptionIDs = 0;
    }
    v38 = deletedSubscriptionIDs;
    objc_msgSend_CKClientSuitableError(v4, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2](v32, v36, v38, v42);

    objc_msgSend_setModifySubscriptionsCompletionBlock_(self, v43, 0, v44);
  }
  objc_msgSend_setPerSubscriptionSaveBlock_(self, v34, 0, v35);
  objc_msgSend_setPerSubscriptionDeleteBlock_(self, v45, 0, v46);
  v47.receiver = self;
  v47.super_class = (Class)CKModifySubscriptionsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v47, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKModifySubscriptionsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKModifySubscriptionsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/modify-subscriptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleSubscriptionSaveForSubscriptionID_error_, 1, 0);

  CKErrorUserInfoClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleSubscriptionDeleteForSubscriptionID_error_, 1, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKModifySubscriptionsOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)subscriptionsToSave
{
  return self->_subscriptionsToSave;
}

- (void)setSubscriptionsToSave:(NSArray *)subscriptionsToSave
{
  objc_setProperty_nonatomic_copy(self, a2, subscriptionsToSave, 536);
}

- (NSArray)subscriptionIDsToDelete
{
  return self->_subscriptionIDsToDelete;
}

- (void)setSubscriptionIDsToDelete:(NSArray *)subscriptionIDsToDelete
{
  objc_setProperty_nonatomic_copy(self, a2, subscriptionIDsToDelete, 544);
}

- (id)perSubscriptionSaveBlock_wrapper
{
  return self->_perSubscriptionSaveBlock_wrapper;
}

- (void)setPerSubscriptionSaveBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (id)perSubscriptionDeleteBlock_wrapper
{
  return self->_perSubscriptionDeleteBlock_wrapper;
}

- (void)setPerSubscriptionDeleteBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (id)modifySubscriptionsCompletionBlock_wrapper
{
  return self->_modifySubscriptionsCompletionBlock_wrapper;
}

- (void)setModifySubscriptionsCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modifySubscriptionsCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perSubscriptionDeleteBlock_wrapper, 0);
  objc_storeStrong(&self->_perSubscriptionSaveBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_subscriptionErrors, 0);
  objc_storeStrong((id *)&self->_subscriptionsBySubscriptionIDs, 0);
  objc_storeStrong((id *)&self->_deletedSubscriptionIDs, 0);
  objc_storeStrong((id *)&self->_savedSubscriptions, 0);
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, 0);
  objc_storeStrong((id *)&self->_subscriptionsToSave, 0);
  objc_storeStrong(&self->_modifySubscriptionsCompletionBlock, 0);
  objc_storeStrong(&self->_perSubscriptionDeleteBlock, 0);
  objc_storeStrong(&self->_perSubscriptionSaveBlock, 0);
}

@end
