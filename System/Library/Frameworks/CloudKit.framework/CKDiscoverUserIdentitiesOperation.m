@implementation CKDiscoverUserIdentitiesOperation

- (CKDiscoverUserIdentitiesOperation)init
{
  CKDiscoverUserIdentitiesOperation *v2;
  uint64_t v3;
  NSArray *userIdentityLookupInfos;
  uint64_t v5;
  NSMutableSet *discoveredLookupInfos;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDiscoverUserIdentitiesOperation;
  v2 = -[CKOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    userIdentityLookupInfos = v2->_userIdentityLookupInfos;
    v2->_userIdentityLookupInfos = (NSArray *)v3;

    v5 = objc_opt_new();
    discoveredLookupInfos = v2->_discoveredLookupInfos;
    v2->_discoveredLookupInfos = (NSMutableSet *)v5;

  }
  return v2;
}

- (CKDiscoverUserIdentitiesOperation)initWithUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKDiscoverUserIdentitiesOperation *v11;
  uint64_t v12;
  NSArray *v13;

  v4 = userIdentityLookupInfos;
  v11 = (CKDiscoverUserIdentitiesOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_userIdentityLookupInfos;
    v11->_userIdentityLookupInfos = (NSArray *)v12;

  }
  return v11;
}

- (void)setUserIdentityDiscoveredBlock:(void *)userIdentityDiscoveredBlock
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

  v14 = userIdentityDiscoveredBlock;
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
    block[2] = sub_18A819880;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_userIdentityDiscoveredBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_userIdentityDiscoveredBlock;
    self->_userIdentityDiscoveredBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)userIdentityDiscoveredBlock
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
    v15 = sub_18A819A28;
    v16 = sub_18A819A50;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A819A58;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_userIdentityDiscoveredBlock);
  }
  return v8;
}

- (void)setDiscoverUserIdentitiesCompletionBlock:(void *)discoverUserIdentitiesCompletionBlock
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

  v14 = discoverUserIdentitiesCompletionBlock;
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
    block[2] = sub_18A819BB4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_discoverUserIdentitiesCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_discoverUserIdentitiesCompletionBlock;
    self->_discoverUserIdentitiesCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)discoverUserIdentitiesCompletionBlock
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
    v15 = sub_18A819A28;
    v16 = sub_18A819A50;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A819D5C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_discoverUserIdentitiesCompletionBlock);
  }
  return v8;
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
  objc_msgSend_userIdentityLookupInfos(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIdentityLookupInfos_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKDiscoverUserIdentitiesOperation;
  -[CKOperation fillOutOperationInfo:](&v11, sel_fillOutOperationInfo_, v4);

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
  v11.super_class = (Class)CKDiscoverUserIdentitiesOperation;
  v4 = a3;
  -[CKOperation fillFromOperationInfo:](&v11, sel_fillFromOperationInfo_, v4);
  objc_msgSend_userIdentityLookupInfos(v4, v5, v6, v7, v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUserIdentityLookupInfos_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  const char *v29;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend_userIdentityLookupInfos(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a3)
          {
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v29, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected user identity lookup info passed to %@: %@"), v28, v12);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_15;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v32, (uint64_t)v36, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend_discoverUserIdentitiesCompletionBlock(self, v14, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v21 = (void *)v17;
    objc_msgSend_userIdentityLookupInfos(self, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      v31.receiver = self;
      v31.super_class = (Class)CKDiscoverUserIdentitiesOperation;
      LOBYTE(v17) = -[CKOperation CKOperationShouldRun:](&v31, sel_CKOperationShouldRun_, a3);
    }
    else
    {
LABEL_15:
      LOBYTE(v17) = 0;
    }
  }
  return v17;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performDiscoverUserIdentitiesOperation_withBlock_;
}

- (void)handleUserIdentityDiscoveryForLookupInfo:(id)a3 userIdentity:(id)a4
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
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  int v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v9 = signpost;

  if (v9)
  {
    if (self)
      v13 = self->super._signpost;
    else
      v13 = 0;
    v14 = v13;
    objc_msgSend_log(v14, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    if (self)
      v19 = self->super._signpost;
    else
      v19 = 0;
    v20 = v19;
    v24 = objc_msgSend_identifier(v20, v21, v22, v23);

    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      v36 = 138412290;
      v37 = v6;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v18, OS_SIGNPOST_EVENT, v24, "CKDiscoverUserIdentitiesOperation", "User identity discovered for %@", (uint8_t *)&v36, 0xCu);
    }

  }
  objc_msgSend_discoveredLookupInfos(self, v10, v11, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v25, v26, (uint64_t)v6, v27);

  objc_msgSend_userIdentityDiscoveredBlock(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend_userIdentityDiscoveredBlock(self, v32, v33, v34);
    v35 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v35)[2](v35, v7, v6);

  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  char v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void (**v42)(_QWORD, _QWORD);
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  objc_super v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[8];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v7 = self->super._signpost;
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend_log(v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (self)
      v13 = self->super._signpost;
    else
      v13 = 0;
    v14 = v13;
    v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_EVENT, v18, "CKDiscoverUserIdentitiesOperation", "Finishing", buf, 2u);
    }

  }
  if ((CKCurrentProcessLinkCheck32f5805a68adfc1b65f94a0de69aa32177c7cd24() & 1) == 0)
  {
    objc_msgSend_userIdentityDiscoveredBlock(self, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend_userIdentityLookupInfos(self, v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v50, (uint64_t)v55, 16);
      if (v25)
      {
        v29 = v25;
        v30 = *(_QWORD *)v51;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v51 != v30)
              objc_enumerationMutation(v23);
            v32 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v31);
            objc_msgSend_discoveredLookupInfos(self, v26, v27, v28);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend_containsObject_(v33, v34, v32, v35);

            if ((v36 & 1) == 0)
            {
              objc_msgSend_userIdentityDiscoveredBlock(self, v26, v27, v28);
              v37 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v37[2](v37, 0, v32);

            }
            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v50, (uint64_t)v55, 16);
        }
        while (v29);
      }

    }
  }
  objc_msgSend_discoverUserIdentitiesCompletionBlock(self, v19, v20, v21);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend_discoverUserIdentitiesCompletionBlock(self, v39, v40, v41);
    v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v42)[2](v42, v46);

    objc_msgSend_setDiscoverUserIdentitiesCompletionBlock_(self, v47, 0, v48);
  }
  objc_msgSend_setUserIdentityDiscoveredBlock_(self, v39, 0, v41);
  v49.receiver = self;
  v49.super_class = (Class)CKDiscoverUserIdentitiesOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v49, sel__finishOnCallbackQueueWithError_, v4);

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
    signpost = self->super._signpost;
  else
    signpost = 0;
  v4 = signpost;

  if (v4)
  {
    if (self)
      v5 = self->super._signpost;
    else
      v5 = 0;
    v6 = v5;
    objc_msgSend_log(v6, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (self)
      v11 = self->super._signpost;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKDiscoverUserIdentitiesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
    signpost = self->super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v7 = self->super._signpost;
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend_log(v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (self)
      v13 = self->super._signpost;
    else
      v13 = 0;
    v14 = v13;
    v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v19 = 138412290;
      v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKDiscoverUserIdentitiesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/discover-user-identities", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (NSArray)userIdentityLookupInfos
{
  return self->_userIdentityLookupInfos;
}

- (void)setUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos
{
  objc_setProperty_nonatomic_copy(self, a2, userIdentityLookupInfos, 520);
}

- (NSMutableSet)discoveredLookupInfos
{
  return self->_discoveredLookupInfos;
}

- (void)setDiscoveredLookupInfos:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredLookupInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredLookupInfos, 0);
  objc_storeStrong((id *)&self->_userIdentityLookupInfos, 0);
  objc_storeStrong(&self->_discoverUserIdentitiesCompletionBlock, 0);
  objc_storeStrong(&self->_userIdentityDiscoveredBlock, 0);
}

@end
