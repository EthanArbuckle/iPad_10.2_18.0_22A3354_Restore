@implementation CKFetchShareParticipantsOperation

- (CKFetchShareParticipantsOperation)init
{
  CKFetchShareParticipantsOperation *v2;
  uint64_t v3;
  NSMutableSet *discoveredUserIdentities;
  uint64_t v5;
  NSMutableDictionary *lookupErrors;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKFetchShareParticipantsOperation;
  v2 = -[CKOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    discoveredUserIdentities = v2->_discoveredUserIdentities;
    v2->_discoveredUserIdentities = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    lookupErrors = v2->_lookupErrors;
    v2->_lookupErrors = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (CKFetchShareParticipantsOperation)initWithUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKFetchShareParticipantsOperation *v11;
  uint64_t v12;
  NSArray *v13;

  v4 = userIdentityLookupInfos;
  v11 = (CKFetchShareParticipantsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_userIdentityLookupInfos;
    v11->_userIdentityLookupInfos = (NSArray *)v12;

  }
  return v11;
}

- (void)setShareParticipantFetchedBlock:(void *)shareParticipantFetchedBlock
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

  v14 = shareParticipantFetchedBlock;
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
    block[2] = sub_18A8111B0;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_shareParticipantFetchedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_shareParticipantFetchedBlock;
    self->_shareParticipantFetchedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)shareParticipantFetchedBlock
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
    v15 = sub_18A811358;
    v16 = sub_18A811380;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A811388;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_shareParticipantFetchedBlock);
  }
  return v8;
}

- (void)setPerShareParticipantCompletionBlock:(void *)perShareParticipantCompletionBlock
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

  v14 = perShareParticipantCompletionBlock;
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
    block[2] = sub_18A8114E4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perShareParticipantCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perShareParticipantCompletionBlock;
    self->_perShareParticipantCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perShareParticipantCompletionBlock
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
    v15 = sub_18A811358;
    v16 = sub_18A811380;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A81168C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perShareParticipantCompletionBlock);
  }
  return v8;
}

- (void)setFetchShareParticipantsCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id fetchShareParticipantsCompletionBlock;
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
    block[2] = sub_18A8117E8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    fetchShareParticipantsCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchShareParticipantsCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    fetchShareParticipantsCompletionBlock = self->_fetchShareParticipantsCompletionBlock;
    self->_fetchShareParticipantsCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)fetchShareParticipantsCompletionBlock
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
    v15 = sub_18A811358;
    v16 = sub_18A811380;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A811990;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchShareParticipantsCompletionBlock);
  }
  return v8;
}

- (void)setFetchShareParticipantsCompletionBlock:(void *)fetchShareParticipantsCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = fetchShareParticipantsCompletionBlock == 0;
  v9 = fetchShareParticipantsCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setFetchShareParticipantsCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

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
  v11.super_class = (Class)CKFetchShareParticipantsOperation;
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
  v11.super_class = (Class)CKFetchShareParticipantsOperation;
  v4 = a3;
  -[CKOperation fillFromOperationInfo:](&v11, sel_fillFromOperationInfo_, v4);
  objc_msgSend_userIdentityLookupInfos(v4, v5, v6, v7, v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUserIdentityLookupInfos_(self, v9, (uint64_t)v8, v10);
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
  v17.super_class = (Class)CKFetchShareParticipantsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v17, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_shareParticipantFetchedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_perShareParticipantCompletionBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_fetchShareParticipantsCompletionBlock(self, v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15 != 0;

    }
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
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  objc_class *v42;
  void *v43;
  const char *v44;
  const char *v45;
  void *v47;
  objc_super v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend_set(MEMORY[0x1E0C99E20], a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend_userIdentityLookupInfos(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v49, (uint64_t)v53, 16);
  if (!v12)
    goto LABEL_10;
  v13 = v12;
  v14 = *(_QWORD *)v50;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v50 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v44, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected identity fetch info passed to %@: %@"), v43, v16);
LABEL_19:
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_20:

        goto LABEL_21;
      }
      if (objc_msgSend_containsObject_(v6, v17, (uint64_t)v16, v18))
      {
        if (a3)
        {
          objc_msgSend_emailAddress(v16, v19, v20, v21);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Email addresses must be unique. \"%@\" was used in two different CKUserIdentityLookupInfos"), v43);
          goto LABEL_19;
        }
        goto LABEL_20;
      }
      objc_msgSend_addObject_(v6, v19, (uint64_t)v16, v21);
    }
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v22, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v13)
      continue;
    break;
  }
LABEL_10:

  objc_msgSend_userIdentityLookupInfos(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_count(v26, v27, v28, v29);

  if (!v30)
    goto LABEL_21;
  objc_msgSend_fetchShareParticipantsCompletionBlock(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34
    || (objc_msgSend_shareParticipantFetchedBlock(self, v35, v36, v37),
        (v34 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_14;
  }
  objc_msgSend_perShareParticipantCompletionBlock(self, v38, v39, v40);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
LABEL_14:
    v48.receiver = self;
    v48.super_class = (Class)CKFetchShareParticipantsOperation;
    v41 = -[CKOperation CKOperationShouldRun:](&v48, sel_CKOperationShouldRun_, a3);
  }
  else
  {
LABEL_21:
    v41 = 0;
  }

  return v41;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchShareParticipantsOperation_withBlock_;
}

- (void)handleShareParticipantFetchForLookupInfo:(id)a3 shareParticipant:(id)a4 error:(id)a5
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
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void (**v67)(void *, id, id, void *);
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void (**v76)(_QWORD, _QWORD);
  _BYTE v77[24];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v15 = signpost;

  if (v13)
  {
    if (v15)
    {
      if (self)
        v19 = self->super._signpost;
      else
        v19 = 0;
      v20 = v19;
      objc_msgSend_log(v20, v21, v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();

      if (self)
        v25 = self->super._signpost;
      else
        v25 = 0;
      v26 = v25;
      v30 = objc_msgSend_identifier(v26, v27, v28, v29);

      if ((unint64_t)(v30 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24))
        goto LABEL_21;
      *(_DWORD *)v77 = 138412546;
      *(_QWORD *)&v77[4] = v8;
      *(_WORD *)&v77[12] = 2112;
      *(_QWORD *)&v77[14] = v13;
      v31 = "Share participant %@ fetched with error: %@";
      v32 = v24;
      v33 = v30;
      v34 = 22;
LABEL_20:
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v32, OS_SIGNPOST_EVENT, v33, "CKFetchShareParticipantsOperation", v31, v77, v34);
LABEL_21:

    }
  }
  else if (v15)
  {
    if (self)
      v35 = self->super._signpost;
    else
      v35 = 0;
    v36 = v35;
    objc_msgSend_log(v36, v37, v38, v39);
    v24 = objc_claimAutoreleasedReturnValue();

    if (self)
      v40 = self->super._signpost;
    else
      v40 = 0;
    v41 = v40;
    v45 = objc_msgSend_identifier(v41, v42, v43, v44);

    if ((unint64_t)(v45 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24))
      goto LABEL_21;
    *(_DWORD *)v77 = 138412290;
    *(_QWORD *)&v77[4] = v8;
    v31 = "Share participant %@ fetched";
    v32 = v24;
    v33 = v45;
    v34 = 12;
    goto LABEL_20;
  }
  if (v9)
  {
    objc_msgSend_userIdentity(v9, v16, v17, v18);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lookupInfo(v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50)
    {
      objc_msgSend_userIdentity(v9, v16, v17, v18);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLookupInfo_(v51, v52, (uint64_t)v8, v53);

    }
  }
  if ((objc_msgSend_canDropItemResultsEarly(self, v16, v17, v18, *(_OWORD *)v77, *(_QWORD *)&v77[16], v78) & 1) == 0)
  {
    if (a5)
    {
      objc_msgSend_lookupErrors(self, v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v57, v58, (uint64_t)v13, (uint64_t)v8);

    }
    objc_msgSend_discoveredUserIdentities(self, v54, v55, v56);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v59, v60, (uint64_t)v8, v61);

  }
  objc_msgSend_perShareParticipantCompletionBlock_wrapper(self, v54, v55, v56);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v62;
  if (v62)
  {
    v67 = (void (**)(void *, id, id, void *))_Block_copy(v62);
  }
  else
  {
    objc_msgSend_perShareParticipantCompletionBlock(self, v63, v64, v65);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void (**)(void *, id, id, void *))_Block_copy(v68);

  }
  if (v67)
  {
    v67[2](v67, v8, v9, v13);
  }
  else
  {
    objc_msgSend_shareParticipantFetchedBlock(self, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v72)
    {
      objc_msgSend_shareParticipantFetchedBlock(self, v73, v74, v75);
      v76 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v76)[2](v76, v9);

    }
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
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void (**v73)(void *, void *);
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  id v83;
  objc_super v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[16];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v10 = self->super._signpost;
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend_log(v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    if (self)
      v16 = self->super._signpost;
    else
      v16 = 0;
    v17 = v16;
    v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchShareParticipantsOperation", "Finishing", buf, 2u);
    }

  }
  v22 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend_userIdentityLookupInfos(self, v7, v8, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v22, v24, (uint64_t)v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_discoveredUserIdentities(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v26, v31, (uint64_t)v30, v32);

  if (objc_msgSend_count(v26, v33, v34, v35))
  {
    v83 = v4;
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v36, (uint64_t)CFSTR("CKErrorDomain"), 11, CFSTR("Share participant not found in iCloud"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v40 = v26;
    v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v85, (uint64_t)v90, 16);
    if (v42)
    {
      v46 = v42;
      v47 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v86 != v47)
            objc_enumerationMutation(v40);
          v49 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
          objc_msgSend_lookupErrors(self, v43, v44, v45);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v50, v51, v49, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v53)
          {
            objc_msgSend_lookupErrors(self, v43, v44, v45);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v54, v55, (uint64_t)v39, v49);

          }
        }
        v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v85, (uint64_t)v90, 16);
      }
      while (v46);
    }

    v4 = v83;
  }
  if (!v4)
  {
    objc_msgSend_lookupErrors(self, v36, v37, v38);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend_count(v56, v57, v58, v59);

    if (v60)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v36, v37, v38);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lookupErrors(self, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v61, v66, (uint64_t)v65, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v67, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v61, CFSTR("Failed to lookup some share participants"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_fetchShareParticipantsCompletionBlock_wrapper(self, v36, v37, v38);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v68;
  if (v68)
  {
    v73 = (void (**)(void *, void *))_Block_copy(v68);
  }
  else
  {
    objc_msgSend_fetchShareParticipantsCompletionBlock(self, v69, v70, v71);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void (**)(void *, void *))_Block_copy(v74);

  }
  if (v73)
  {
    objc_msgSend_CKClientSuitableError(v4, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2](v73, v78);

    objc_msgSend_setFetchShareParticipantsCompletionBlock_(self, v79, 0, v80);
  }
  objc_msgSend_setShareParticipantFetchedBlock_(self, v75, 0, v77);
  objc_msgSend_setPerShareParticipantCompletionBlock_(self, v81, 0, v82);
  v84.receiver = self;
  v84.super_class = (Class)CKFetchShareParticipantsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v84, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchShareParticipantsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchShareParticipantsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-user-identities", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleShareParticipantFetchForLookupInfo_shareParticipant_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchShareParticipantsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)userIdentityLookupInfos
{
  return self->_userIdentityLookupInfos;
}

- (void)setUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos
{
  objc_setProperty_nonatomic_copy(self, a2, userIdentityLookupInfos, 528);
}

- (NSMutableSet)discoveredUserIdentities
{
  return self->_discoveredUserIdentities;
}

- (void)setDiscoveredUserIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredUserIdentities, a3);
}

- (NSMutableDictionary)lookupErrors
{
  return self->_lookupErrors;
}

- (void)setLookupErrors:(id)a3
{
  objc_storeStrong((id *)&self->_lookupErrors, a3);
}

- (id)perShareParticipantCompletionBlock_wrapper
{
  return self->_perShareParticipantCompletionBlock_wrapper;
}

- (void)setPerShareParticipantCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (id)fetchShareParticipantsCompletionBlock_wrapper
{
  return self->_fetchShareParticipantsCompletionBlock_wrapper;
}

- (void)setFetchShareParticipantsCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchShareParticipantsCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perShareParticipantCompletionBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_lookupErrors, 0);
  objc_storeStrong((id *)&self->_discoveredUserIdentities, 0);
  objc_storeStrong((id *)&self->_userIdentityLookupInfos, 0);
  objc_storeStrong(&self->_fetchShareParticipantsCompletionBlock, 0);
  objc_storeStrong(&self->_perShareParticipantCompletionBlock, 0);
  objc_storeStrong(&self->_shareParticipantFetchedBlock, 0);
}

@end
