@implementation CKAcceptSharesOperation

- (CKAcceptSharesOperation)init
{
  CKAcceptSharesOperation *v2;
  uint64_t v3;
  NSMutableDictionary *errorsByShareURL;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKAcceptSharesOperation;
  v2 = -[CKOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    errorsByShareURL = v2->_errorsByShareURL;
    v2->_errorsByShareURL = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (CKAcceptSharesOperation)initWithShareMetadatas:(NSArray *)shareMetadatas
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKAcceptSharesOperation *v8;
  const char *v9;
  uint64_t v10;
  CKAcceptSharesOperation *v11;

  v4 = shareMetadatas;
  v8 = (CKAcceptSharesOperation *)objc_msgSend_init(self, v5, v6, v7);
  v11 = v8;
  if (v8)
    objc_msgSend_setShareMetadatas_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (void)setPerShareCompletionBlock:(void *)perShareCompletionBlock
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

  v14 = perShareCompletionBlock;
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
    block[2] = sub_18A795368;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perShareCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perShareCompletionBlock;
    self->_perShareCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perShareCompletionBlock
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
    v15 = sub_18A795510;
    v16 = sub_18A795538;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A795540;
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

- (void)setAcceptSharesCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id acceptSharesCompletionBlock;
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
    block[2] = sub_18A79569C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    acceptSharesCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_acceptSharesCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    acceptSharesCompletionBlock = self->_acceptSharesCompletionBlock;
    self->_acceptSharesCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)acceptSharesCompletionBlock
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
    v15 = sub_18A795510;
    v16 = sub_18A795538;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A795844;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_acceptSharesCompletionBlock);
  }
  return v8;
}

- (void)setAcceptSharesCompletionBlock:(void *)acceptSharesCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = acceptSharesCompletionBlock == 0;
  v9 = acceptSharesCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setAcceptSharesCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

}

- (void)setShareMetadatas:(NSArray *)shareMetadatas
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *shareMetadatasByShareURL;
  NSArray *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  const char *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = shareMetadatas;
  v8 = (NSArray *)objc_msgSend_copy(v4, v5, v6, v7);
  v9 = self->_shareMetadatas;
  self->_shareMetadatas = v8;

  v10 = (NSMutableDictionary *)objc_opt_new();
  shareMetadatasByShareURL = self->_shareMetadatasByShareURL;
  self->_shareMetadatasByShareURL = v10;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v4;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v14)
  {
    v18 = v14;
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v12);
        v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend_invitationURL(v21, v15, v16, v17, (_QWORD)v24);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend_setObject_forKeyedSubscript_(self->_shareMetadatasByShareURL, v22, (uint64_t)v21, (uint64_t)v23);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v18);
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
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  objc_super v15;

  v4 = a3;
  objc_msgSend_shareMetadatas(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setShareMetadatasToAccept_(v4, v13, (uint64_t)v12, v14);

  v15.receiver = self;
  v15.super_class = (Class)CKAcceptSharesOperation;
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
  v15.super_class = (Class)CKAcceptSharesOperation;
  v4 = a3;
  -[CKOperation fillFromOperationInfo:](&v15, sel_fillFromOperationInfo_, v4);
  objc_msgSend_shareMetadatasToAccept(v4, v5, v6, v7, v15.receiver, v15.super_class);
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
  v13.super_class = (Class)CKAcceptSharesOperation;
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
    objc_msgSend_acceptSharesCompletionBlock(self, v7, v8, v9);
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  BOOL result;
  id v28;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend_shareMetadatas(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, (uint64_t)v34, 16);
  if (!v8)
    goto LABEL_10;
  v9 = v8;
  v10 = *(_QWORD *)v31;
  while (2)
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v31 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v13, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected shareMetadata in shares to accept: %@"), v12);
LABEL_16:
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_17:

        return 0;
      }
      objc_msgSend_invitationURL(v12, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v17, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("shareMetadata lacks share URL: %@"), v12);
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      ++v11;
    }
    while (v9 != v11);
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v17, (uint64_t)&v30, (uint64_t)v34, 16);
    if (v9)
      continue;
    break;
  }
LABEL_10:

  objc_msgSend_shareMetadatas(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_count(v21, v22, v23, v24);

  if (v25)
  {
    v29.receiver = self;
    v29.super_class = (Class)CKAcceptSharesOperation;
    return -[CKOperation CKOperationShouldRun:](&v29, sel_CKOperationShouldRun_, a3);
  }
  else if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You must specify some share metadatas to accept"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v28;
  }
  else
  {
    return 0;
  }
  return result;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performAcceptSharesOperation_withBlock_;
}

- (void)handleShareAcceptanceForURL:(id)a3 share:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CKSignpost *signpost;
  CKSignpost *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  CKSignpost *v20;
  CKSignpost *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  CKSignpost *v26;
  CKSignpost *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  uint32_t v35;
  CKSignpost *v36;
  CKSignpost *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  CKSignpost *v41;
  CKSignpost *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  void (**v64)(id, void *, id, void *);
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  NSObject *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint8_t buf[4];
  id v152;
  __int16 v153;
  void *v154;
  __int16 v155;
  void *v156;
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend_CKClientSuitableError(a5, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v16 = signpost;

  if (v14)
  {
    if (!v16)
      goto LABEL_22;
    if (self)
      v20 = self->super._signpost;
    else
      v20 = 0;
    v21 = v20;
    objc_msgSend_log(v21, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();

    if (self)
      v26 = self->super._signpost;
    else
      v26 = 0;
    v27 = v26;
    v31 = objc_msgSend_identifier(v27, v28, v29, v30);

    if ((unint64_t)(v31 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v25))
      goto LABEL_21;
    *(_DWORD *)buf = 138412546;
    v152 = v9;
    v153 = 2112;
    v154 = v14;
    v32 = "Share %@ accepted with error: %@";
    v33 = v25;
    v34 = v31;
    v35 = 22;
    goto LABEL_20;
  }
  if (!v16)
    goto LABEL_22;
  if (self)
    v36 = self->super._signpost;
  else
    v36 = 0;
  v37 = v36;
  objc_msgSend_log(v37, v38, v39, v40);
  v25 = objc_claimAutoreleasedReturnValue();

  if (self)
    v41 = self->super._signpost;
  else
    v41 = 0;
  v42 = v41;
  v46 = objc_msgSend_identifier(v42, v43, v44, v45);

  if ((unint64_t)(v46 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_DWORD *)buf = 138412290;
    v152 = v9;
    v32 = "Share %@ accepted";
    v33 = v25;
    v34 = v46;
    v35 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v33, OS_SIGNPOST_EVENT, v34, "CKAcceptSharesOperation", v32, buf, v35);
  }
LABEL_21:

LABEL_22:
  objc_msgSend_shareMetadatasByShareURL(self, v17, v18, v19);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)v9, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    if (v14)
    {
      if ((objc_msgSend_canDropItemResultsEarly(self, v51, v52, v53) & 1) != 0)
      {
LABEL_37:
        objc_msgSend_perShareCompletionBlock_wrapper(self, v54, v55, v56);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = v116;
        if (v116)
        {
          v64 = (void (**)(id, void *, id, void *))_Block_copy(v116);
        }
        else
        {
          objc_msgSend_perShareCompletionBlock(self, v117, v118, v119);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void (**)(id, void *, id, void *))_Block_copy(v121);

        }
        if (v64)
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v125 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          {
            v136 = v125;
            objc_msgSend_operationID(self, v137, v138, v139);
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v10, v141, v142, v143);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v152 = v140;
            v153 = 2112;
            v154 = v144;
            v155 = 2112;
            v156 = v14;
            _os_log_debug_impl(&dword_18A5C5000, v136, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about accepted share with ID %@: %@", buf, 0x20u);

          }
          v64[2](v64, v50, v10, v14);
        }
        if (v10)
        {
          objc_msgSend_configuration(self, v122, v123, v124);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_container(v126, v127, v128, v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v10, v131, v132, v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleRecordChanged_changeType_record_error_(v130, v135, (uint64_t)v134, 2, v10, v14);

        }
        goto LABEL_48;
      }
      objc_msgSend_errorsByShareURL(self, v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_invitationURL(v50, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v57, v62, (uint64_t)v14, (uint64_t)v61);

    }
    else
    {
      if (v10)
      {
        objc_msgSend_resolvedConfiguration(self, v51, v52, v53);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_container(v73, v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_options(v77, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend_useAnonymousToServerShareParticipants(v81, v82, v83, v84);

        if (v85)
        {
          objc_msgSend_recordID(v10, v51, v52, v53);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneID(v86, v87, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousCKUserID(v90, v91, v92, v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend_length(v94, v95, v96, v97))
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v98, v99, v100);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v10, v146, v147, v148);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v145, v150, (uint64_t)a2, (uint64_t)self, CFSTR("CKAcceptSharesOperation.m"), 135, CFSTR("Should have generated an anonymous userID for share %@"), v149);

          }
          objc_msgSend_share(v50, v98, v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v101, v102, v103, v104);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = (void *)objc_msgSend_copyWithAnonymousCKUserID_(v105, v106, (uint64_t)v94, v107);

          objc_msgSend_share(v50, v109, v110, v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_replaceRecordIDWith_(v112, v113, (uint64_t)v108, v114);

        }
      }
      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v51, v52, v53);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_postNotificationName_object_userInfo_(v57, v115, (uint64_t)CFSTR("CKAcceptSharesOperationDidAcceptShareNotification"), (uint64_t)self, 0);
    }

    goto LABEL_37;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v63 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    v64 = v63;
    objc_msgSend_shareMetadatasByShareURL(self, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v152 = v9;
    v153 = 2112;
    v154 = v72;
    _os_log_error_impl(&dword_18A5C5000, (os_log_t)v64, OS_LOG_TYPE_ERROR, "Received callback for URL I don't know about: %@ %@", buf, 0x16u);

LABEL_48:
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
  void *v38;
  void (**v39)(void *, void *);
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  objc_super v47;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKAcceptSharesOperation", "Finishing", buf, 2u);
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

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to accept some shares"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_acceptSharesCompletionBlock_wrapper(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v34;
  if (v34)
  {
    v39 = (void (**)(void *, void *))_Block_copy(v34);
  }
  else
  {
    objc_msgSend_acceptSharesCompletionBlock(self, v35, v36, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void (**)(void *, void *))_Block_copy(v40);

  }
  if (v39)
  {
    objc_msgSend_CKClientSuitableError(v4, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2](v39, v44);

    objc_msgSend_setAcceptSharesCompletionBlock_(self, v45, 0, v46);
  }
  objc_msgSend_setPerShareCompletionBlock_(self, v41, 0, v43);
  v47.receiver = self;
  v47.super_class = (Class)CKAcceptSharesOperation;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKAcceptSharesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKAcceptSharesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/accept-shares", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleShareAcceptanceForURL_share_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKAcceptSharesOperation;
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

- (id)perShareCompletionBlock_wrapper
{
  return self->_perShareCompletionBlock_wrapper;
}

- (void)setPerShareCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (id)acceptSharesCompletionBlock_wrapper
{
  return self->_acceptSharesCompletionBlock_wrapper;
}

- (void)setAcceptSharesCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_acceptSharesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perShareCompletionBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_shareMetadatasByShareURL, 0);
  objc_storeStrong((id *)&self->_errorsByShareURL, 0);
  objc_storeStrong((id *)&self->_shareMetadatas, 0);
  objc_storeStrong(&self->_acceptSharesCompletionBlock, 0);
  objc_storeStrong(&self->_perShareCompletionBlock, 0);
}

@end
