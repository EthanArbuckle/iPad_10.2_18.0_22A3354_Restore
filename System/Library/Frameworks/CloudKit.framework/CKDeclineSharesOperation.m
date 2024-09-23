@implementation CKDeclineSharesOperation

- (CKDeclineSharesOperation)init
{
  CKDeclineSharesOperation *v2;
  uint64_t v3;
  NSMutableDictionary *errorsByShareURL;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDeclineSharesOperation;
  v2 = -[CKOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    errorsByShareURL = v2->_errorsByShareURL;
    v2->_errorsByShareURL = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (CKDeclineSharesOperation)initWithShareMetadatas:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKDeclineSharesOperation *v8;
  const char *v9;
  uint64_t v10;
  CKDeclineSharesOperation *v11;

  v4 = a3;
  v8 = (CKDeclineSharesOperation *)objc_msgSend_init(self, v5, v6, v7);
  v11 = v8;
  if (v8)
    objc_msgSend_setShareMetadatas_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (void)setShareMetadatas:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *shareMetadatas;
  NSMutableDictionary *v10;
  NSMutableDictionary *shareMetadatasByShareURL;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = (NSArray *)objc_msgSend_copy(v4, v5, v6, v7);
  shareMetadatas = self->_shareMetadatas;
  self->_shareMetadatas = v8;

  v10 = (NSMutableDictionary *)objc_opt_new();
  shareMetadatasByShareURL = self->_shareMetadatasByShareURL;
  self->_shareMetadatasByShareURL = v10;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = v4;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v14)
  {
    v18 = v14;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v12);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend_share(v21, v15, v16, v17, (_QWORD)v28);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_URL(v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          objc_msgSend_setObject_forKeyedSubscript_(self->_shareMetadatasByShareURL, v27, (uint64_t)v21, (uint64_t)v26);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v18);
  }

}

- (void)setPerShareCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perShareCompletionBlock;
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
    block[2] = sub_18A6EA510;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perShareCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perShareCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perShareCompletionBlock = self->_perShareCompletionBlock;
    self->_perShareCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perShareCompletionBlock
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
    v15 = sub_18A6EA6B8;
    v16 = sub_18A6EA6E0;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A6EA6E8;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perShareCompletionBlock);
  }
  return v8;
}

- (void)setDeclineSharesCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id declineSharesCompletionBlock;
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
    block[2] = sub_18A6EA844;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    declineSharesCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_declineSharesCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    declineSharesCompletionBlock = self->_declineSharesCompletionBlock;
    self->_declineSharesCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)declineSharesCompletionBlock
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
    v15 = sub_18A6EA6B8;
    v16 = sub_18A6EA6E0;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A6EA9EC;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_declineSharesCompletionBlock);
  }
  return v8;
}

- (void)setDeclineSharesCompletionBlock:(id)a3
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = a3 == 0;
  v9 = a3;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setDeclineSharesCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

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
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  objc_super v15;

  v4 = a3;
  objc_msgSend_shareMetadatas(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setShareMetadatasToDecline_(v4, v13, (uint64_t)v12, v14);

  v15.receiver = self;
  v15.super_class = (Class)CKDeclineSharesOperation;
  -[CKOperation fillOutOperationInfo:](&v15, sel_fillOutOperationInfo_, v4);

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
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKDeclineSharesOperation;
  v4 = a3;
  -[CKOperation fillFromOperationInfo:](&v15, sel_fillFromOperationInfo_, v4);
  objc_msgSend_shareMetadatasToDecline(v4, v5, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setShareMetadatas_(self, v13, (uint64_t)v12, v14);

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
  v13.super_class = (Class)CKDeclineSharesOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perShareCompletionBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_declineSharesCompletionBlock(self, v7, v8, v9);
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
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
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
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL result;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  id v48;
  objc_super v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend_shareMetadatas(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v50, (uint64_t)v54, 16);
  if (!v8)
    goto LABEL_10;
  v9 = v8;
  v10 = *(_QWORD *)v51;
  while (2)
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v51 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v13, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected shareMetadata in shares to decline: %@"), v12);
LABEL_17:
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_18:

        return 0;
      }
      objc_msgSend_share(v12, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v21, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("shareMetadata lacks share URL: %@"), v12);
          goto LABEL_17;
        }
        goto LABEL_18;
      }
      ++v11;
    }
    while (v9 != v11);
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v21, (uint64_t)&v50, (uint64_t)v54, 16);
    if (v9)
      continue;
    break;
  }
LABEL_10:

  objc_msgSend_resolvedConfiguration(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_useAnonymousToServerShareParticipants(v33, v34, v35, v36);

  if (v37)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v38, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Decline does not yet support Anonymous to Apple shares"));
      goto LABEL_25;
    }
    return 0;
  }
  else
  {
    objc_msgSend_shareMetadatas(self, v38, v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend_count(v42, v43, v44, v45);

    if (v46)
    {
      v49.receiver = self;
      v49.super_class = (Class)CKDeclineSharesOperation;
      return -[CKOperation CKOperationShouldRun:](&v49, sel_CKOperationShouldRun_, a3);
    }
    else
    {
      if (!a3)
        return 0;
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v47, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You must specify some share metadatas to decline"));
LABEL_25:
      v48 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v48;
    }
  }
  return result;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performDeclineSharesOperation_withBlock_;
}

- (void)handleShareDeclineForURL:(id)a3 error:(id)a4
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
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void (**v65)(_QWORD, _QWORD, _QWORD);
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
  v6 = a3;
  objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v12 = signpost;

  if (v10)
  {
    if (!v12)
      goto LABEL_22;
    if (self)
      v16 = self->super._signpost;
    else
      v16 = 0;
    v17 = v16;
    objc_msgSend_log(v17, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    if (self)
      v22 = self->super._signpost;
    else
      v22 = 0;
    v23 = v22;
    v27 = objc_msgSend_identifier(v23, v24, v25, v26);

    if ((unint64_t)(v27 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21))
      goto LABEL_21;
    *(_DWORD *)v81 = 138412546;
    *(_QWORD *)&v81[4] = v6;
    *(_WORD *)&v81[12] = 2112;
    *(_QWORD *)&v81[14] = v10;
    v28 = "Share %@ declined with error: %@";
    v29 = v21;
    v30 = v27;
    v31 = 22;
    goto LABEL_20;
  }
  if (!v12)
    goto LABEL_22;
  if (self)
    v32 = self->super._signpost;
  else
    v32 = 0;
  v33 = v32;
  objc_msgSend_log(v33, v34, v35, v36);
  v21 = objc_claimAutoreleasedReturnValue();

  if (self)
    v37 = self->super._signpost;
  else
    v37 = 0;
  v38 = v37;
  v42 = objc_msgSend_identifier(v38, v39, v40, v41);

  if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)v81 = 138412290;
    *(_QWORD *)&v81[4] = v6;
    v28 = "Share %@ declined";
    v29 = v21;
    v30 = v42;
    v31 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v29, OS_SIGNPOST_EVENT, v30, "CKDeclineSharesOperation", v28, v81, v31);
  }
LABEL_21:

LABEL_22:
  objc_msgSend_shareMetadatasByShareURL(self, v13, v14, v15, *(_OWORD *)v81, *(_QWORD *)&v81[16], v82);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v43, v44, (uint64_t)v6, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    if (v10 && (objc_msgSend_canDropItemResultsEarly(self, v47, v48, v49) & 1) == 0)
    {
      objc_msgSend_errorsByShareURL(self, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_share(v46, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v54, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v50, v59, (uint64_t)v10, (uint64_t)v58);

    }
    objc_msgSend_perShareCompletionBlock(self, v47, v48, v49);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v61 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v67 = v61;
        objc_msgSend_operationID(self, v68, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v81 = 138543618;
        *(_QWORD *)&v81[4] = v71;
        *(_WORD *)&v81[12] = 2112;
        *(_QWORD *)&v81[14] = v10;
        _os_log_debug_impl(&dword_18A5C5000, v67, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about decline share: %@", v81, 0x16u);

      }
      objc_msgSend_perShareCompletionBlock(self, v62, v63, v64);
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v65)[2](v65, v46, v10);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v66 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v72 = v66;
      objc_msgSend_shareMetadatasByShareURL(self, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allKeys(v76, v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v81 = 138412546;
      *(_QWORD *)&v81[4] = v6;
      *(_WORD *)&v81[12] = 2112;
      *(_QWORD *)&v81[14] = v80;
      _os_log_error_impl(&dword_18A5C5000, v72, OS_LOG_TYPE_ERROR, "Received callback for URL I don't know about: %@ %@", v81, 0x16u);

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
  void (**v38)(_QWORD, _QWORD);
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  objc_super v45;
  uint8_t buf[16];

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKDeclineSharesOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_errorsByShareURL(self, v7, v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorsByShareURL(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to decline some shares"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_declineSharesCompletionBlock(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend_declineSharesCompletionBlock(self, v35, v36, v37);
    v38 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v38)[2](v38, v42);

    objc_msgSend_setDeclineSharesCompletionBlock_(self, v43, 0, v44);
  }
  objc_msgSend_setPerShareCompletionBlock_(self, v35, 0, v37);
  v45.receiver = self;
  v45.super_class = (Class)CKDeclineSharesOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v45, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKDeclineSharesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKDeclineSharesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/decline-shares", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleShareDeclineForURL_error_, 1, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKDeclineSharesOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)shareMetadatas
{
  return self->_shareMetadatas;
}

- (NSMutableDictionary)errorsByShareURL
{
  return self->_errorsByShareURL;
}

- (void)setErrorsByShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_errorsByShareURL, a3);
}

- (NSMutableDictionary)shareMetadatasByShareURL
{
  return self->_shareMetadatasByShareURL;
}

- (void)setShareMetadatasByShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadatasByShareURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadatasByShareURL, 0);
  objc_storeStrong((id *)&self->_errorsByShareURL, 0);
  objc_storeStrong((id *)&self->_shareMetadatas, 0);
  objc_storeStrong(&self->_declineSharesCompletionBlock, 0);
  objc_storeStrong(&self->_perShareCompletionBlock, 0);
}

@end
