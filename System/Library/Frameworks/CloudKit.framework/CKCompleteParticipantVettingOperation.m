@implementation CKCompleteParticipantVettingOperation

- (CKCompleteParticipantVettingOperation)init
{
  CKCompleteParticipantVettingOperation *v2;
  CKCompleteParticipantVettingOperation *v3;
  NSString *vettingToken;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKCompleteParticipantVettingOperation;
  v2 = -[CKOperation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    vettingToken = v2->_vettingToken;
    v2->_vettingToken = 0;

  }
  return v3;
}

- (CKCompleteParticipantVettingOperation)initWithVettingToken:(id)a3 vettingRecord:(id)a4 displayedHostname:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKCompleteParticipantVettingOperation *v17;
  uint64_t v18;
  NSString *vettingToken;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *vettingEmail;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSString *vettingPhone;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSString *routingKey;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSData *encryptedKey;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSString *baseToken;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSString *displayedHostname;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = (CKCompleteParticipantVettingOperation *)objc_msgSend_init(self, v11, v12, v13);
  if (v17)
  {
    v18 = objc_msgSend_copy(v8, v14, v15, v16);
    vettingToken = v17->_vettingToken;
    v17->_vettingToken = (NSString *)v18;

    objc_msgSend_objectForKeyedSubscript_(v9, v20, (uint64_t)CFSTR("email"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_copy(v22, v23, v24, v25);
    vettingEmail = v17->_vettingEmail;
    v17->_vettingEmail = (NSString *)v26;

    objc_msgSend_objectForKeyedSubscript_(v9, v28, (uint64_t)CFSTR("phone"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_copy(v30, v31, v32, v33);
    vettingPhone = v17->_vettingPhone;
    v17->_vettingPhone = (NSString *)v34;

    objc_msgSend_objectForKeyedSubscript_(v9, v36, (uint64_t)CFSTR("shareRoutingKey"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_copy(v38, v39, v40, v41);
    routingKey = v17->_routingKey;
    v17->_routingKey = (NSString *)v42;

    objc_msgSend_objectForKeyedSubscript_(v9, v44, (uint64_t)CFSTR("encryptedKey"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_copy(v46, v47, v48, v49);
    encryptedKey = v17->_encryptedKey;
    v17->_encryptedKey = (NSData *)v50;

    objc_msgSend_objectForKeyedSubscript_(v9, v52, (uint64_t)CFSTR("baseToken"), v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_copy(v54, v55, v56, v57);
    baseToken = v17->_baseToken;
    v17->_baseToken = (NSString *)v58;

    v63 = objc_msgSend_copy(v10, v60, v61, v62);
    displayedHostname = v17->_displayedHostname;
    v17->_displayedHostname = (NSString *)v63;

  }
  return v17;
}

- (void)setCompleteParticipantVettingCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id completeParticipantVettingCompletionBlock;
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
    block[2] = sub_18A7C7A34;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    completeParticipantVettingCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_completeParticipantVettingCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    completeParticipantVettingCompletionBlock = self->_completeParticipantVettingCompletionBlock;
    self->_completeParticipantVettingCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)completeParticipantVettingCompletionBlock
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
    v15 = sub_18A7C7BDC;
    v16 = sub_18A7C7C04;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7C7C0C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_completeParticipantVettingCompletionBlock);
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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  objc_super v47;

  v4 = a3;
  objc_msgSend_vettingToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVettingToken_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_vettingEmail(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVettingEmail_(v4, v15, (uint64_t)v14, v16);

  objc_msgSend_vettingPhone(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVettingPhone_(v4, v21, (uint64_t)v20, v22);

  objc_msgSend_routingKey(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRoutingKey_(v4, v27, (uint64_t)v26, v28);

  objc_msgSend_encryptedKey(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEncryptedKey_(v4, v33, (uint64_t)v32, v34);

  objc_msgSend_baseToken(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBaseToken_(v4, v39, (uint64_t)v38, v40);

  objc_msgSend_displayedHostname(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDisplayedHostname_(v4, v45, (uint64_t)v44, v46);

  v47.receiver = self;
  v47.super_class = (Class)CKCompleteParticipantVettingOperation;
  -[CKOperation fillOutOperationInfo:](&v47, sel_fillOutOperationInfo_, v4);

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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CKCompleteParticipantVettingOperation;
  v4 = a3;
  -[CKOperation fillFromOperationInfo:](&v47, sel_fillFromOperationInfo_, v4);
  objc_msgSend_vettingToken(v4, v5, v6, v7, v47.receiver, v47.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVettingToken_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_vettingEmail(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVettingEmail_(self, v15, (uint64_t)v14, v16);

  objc_msgSend_vettingPhone(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVettingPhone_(self, v21, (uint64_t)v20, v22);

  objc_msgSend_routingKey(v4, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRoutingKey_(self, v27, (uint64_t)v26, v28);

  objc_msgSend_encryptedKey(v4, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEncryptedKey_(self, v33, (uint64_t)v32, v34);

  objc_msgSend_baseToken(v4, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBaseToken_(self, v39, (uint64_t)v38, v40);

  objc_msgSend_displayedHostname(v4, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setDisplayedHostname_(self, v45, (uint64_t)v44, v46);
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
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
  objc_super v42;

  objc_msgSend_vettingToken(self, a2, (uint64_t)a3, v3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_15;
  v11 = (void *)v7;
  objc_msgSend_vettingEmail(self, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend_vettingPhone(self, v12, v13, v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_11:

      goto LABEL_15;
    }
  }
  objc_msgSend_routingKey(self, v12, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (v15)
      v22 = v15;
    else
      v22 = v4;

    goto LABEL_11;
  }
  v20 = (void *)v16;
  objc_msgSend_encryptedKey(self, v17, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  else

  if (v21)
  {
    v42.receiver = self;
    v42.super_class = (Class)CKCompleteParticipantVettingOperation;
    return -[CKOperation CKOperationShouldRun:](&v42, sel_CKOperationShouldRun_, a3);
  }
LABEL_15:
  if (a3)
  {
    objc_msgSend_vettingToken(self, v8, v9, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vettingEmail(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vettingPhone(self, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_routingKey(self, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptedKey(self, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v41, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Incomplete vetting info: vettingToken: %@, vettingEmail: %@, vettingPhone: %@, routingKey: %@, encryptedKey: %@"), v24, v28, v32, v36, v40);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performCompleteParticipantVettingOperation_withBlock_;
}

- (void)handleReconstructedShareURL:(id)a3
{
  ((void (*)(CKCompleteParticipantVettingOperation *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_setReconstructedShareURL_, a3);
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
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  objc_super v41;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKCompleteParticipantVettingOperation", "Finishing", buf, 2u);
    }

  }
  objc_msgSend_completeParticipantVettingCompletionBlock(self, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_completeParticipantVettingCompletionBlock(self, v23, v24, v25);
    v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_reconstructedShareURL(self, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareMetadata(self, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v26)[2](v26, v30, v34, v38);

    objc_msgSend_setCompleteParticipantVettingCompletionBlock_(self, v39, 0, v40);
  }
  v41.receiver = self;
  v41.super_class = (Class)CKCompleteParticipantVettingOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v41, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKCompleteParticipantVettingOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKCompleteParticipantVettingOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/verify-share-vetting", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (NSString)vettingToken
{
  return self->_vettingToken;
}

- (void)setVettingToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (NSString)vettingEmail
{
  return self->_vettingEmail;
}

- (void)setVettingEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSString)vettingPhone
{
  return self->_vettingPhone;
}

- (void)setVettingPhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (NSString)baseToken
{
  return self->_baseToken;
}

- (void)setBaseToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSString)displayedHostname
{
  return self->_displayedHostname;
}

- (void)setDisplayedHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (NSURL)reconstructedShareURL
{
  return self->_reconstructedShareURL;
}

- (void)setReconstructedShareURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_reconstructedShareURL, 0);
  objc_storeStrong((id *)&self->_displayedHostname, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_vettingPhone, 0);
  objc_storeStrong((id *)&self->_vettingEmail, 0);
  objc_storeStrong((id *)&self->_vettingToken, 0);
  objc_storeStrong(&self->_completeParticipantVettingCompletionBlock, 0);
}

@end
