@implementation CKInitiateParticipantVettingOperation

- (CKInitiateParticipantVettingOperation)initWithShareMetadata:(id)a3 participantID:(id)a4 address:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKInitiateParticipantVettingOperation *v14;
  uint64_t v15;
  CKShareMetadata *shareMetadata;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString *participantID;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *address;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKInitiateParticipantVettingOperation;
  v14 = -[CKOperation init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v8, v11, v12, v13);
    shareMetadata = v14->_shareMetadata;
    v14->_shareMetadata = (CKShareMetadata *)v15;

    v20 = objc_msgSend_copy(v9, v17, v18, v19);
    participantID = v14->_participantID;
    v14->_participantID = (NSString *)v20;

    v25 = objc_msgSend_copy(v10, v22, v23, v24);
    address = v14->_address;
    v14->_address = (NSString *)v25;

  }
  return v14;
}

- (void)setParticipantVettingInitiatedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id participantVettingInitiatedBlock;
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
    block[2] = sub_18A781718;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    participantVettingInitiatedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_participantVettingInitiatedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    participantVettingInitiatedBlock = self->_participantVettingInitiatedBlock;
    self->_participantVettingInitiatedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)participantVettingInitiatedBlock
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
    v15 = sub_18A7818C0;
    v16 = sub_18A7818E8;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7818F0;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_participantVettingInitiatedBlock);
  }
  return v8;
}

- (void)setParticipantVettingInitiationCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id participantVettingInitiationCompletionBlock;
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
    block[2] = sub_18A781A4C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    participantVettingInitiationCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_participantVettingInitiationCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    participantVettingInitiationCompletionBlock = self->_participantVettingInitiationCompletionBlock;
    self->_participantVettingInitiationCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)participantVettingInitiationCompletionBlock
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
    v15 = sub_18A7818C0;
    v16 = sub_18A7818E8;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A781BF4;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_participantVettingInitiationCompletionBlock);
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
  objc_super v23;

  v4 = a3;
  objc_msgSend_shareMetadata(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareMetadata_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_participantID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setParticipantID_(v4, v15, (uint64_t)v14, v16);

  objc_msgSend_address(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAddress_(v4, v21, (uint64_t)v20, v22);

  v23.receiver = self;
  v23.super_class = (Class)CKInitiateParticipantVettingOperation;
  -[CKOperation fillOutOperationInfo:](&v23, sel_fillOutOperationInfo_, v4);

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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKInitiateParticipantVettingOperation;
  v4 = a3;
  -[CKOperation fillFromOperationInfo:](&v23, sel_fillFromOperationInfo_, v4);
  objc_msgSend_shareMetadata(v4, v5, v6, v7, v23.receiver, v23.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareMetadata_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_participantID(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setParticipantID_(self, v15, (uint64_t)v14, v16);

  objc_msgSend_address(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAddress_(self, v21, (uint64_t)v20, v22);
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v13;
  void *v14;
  const char *v15;
  objc_super v16;

  objc_msgSend_shareMetadata(self, a2, (uint64_t)a3, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v10 = (void *)v6,
        objc_msgSend_participantID(self, v7, v8, v9),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v16.receiver = self;
    v16.super_class = (Class)CKInitiateParticipantVettingOperation;
    return -[CKOperation CKOperationShouldRun:](&v16, sel_CKOperationShouldRun_, a3);
  }
  else
  {
    if (a3)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You must set share metadata and a participant ID on %@"), v14);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

- (void)retryTimes:(unint64_t)a3 container:(id)a4 participantVettingInitiatedBlock:(id)a5 participantVettingInitiationCompletionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, void *);
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  unint64_t v54;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3 - 1;
  objc_msgSend_setParticipantVettingInitiatedBlock_(self, v14, (uint64_t)v11, v15);
  objc_msgSend_description(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareMetadata(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantID(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_address(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = sub_18A78201C;
  v46 = &unk_1E1F64C50;
  v47 = v19;
  v48 = v23;
  v49 = v27;
  v50 = v31;
  v51 = v10;
  v52 = v12;
  v53 = v11;
  v54 = v13;
  v32 = v11;
  v33 = v10;
  v34 = v31;
  v35 = v27;
  v36 = v23;
  v37 = v19;
  v38 = v12;
  objc_msgSend_setParticipantVettingInitiationCompletionBlock_(self, v39, (uint64_t)&v43, v40);
  objc_msgSend_addOperation_(v33, v41, (uint64_t)self, v42, v43, v44, v45, v46);

}

+ (SEL)daemonInvocationSelector
{
  return sel_performInitiateParticipantVettingOperation_withBlock_;
}

- (void)handleParticipantVettingProgressWithError:(id)a3
{
  uint64_t v3;
  void *v5;
  CKSignpost *signpost;
  CKSignpost *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKSignpost *v11;
  CKSignpost *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  CKSignpost *v17;
  CKSignpost *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  uint32_t v26;
  CKSignpost *v27;
  CKSignpost *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  CKSignpost *v32;
  CKSignpost *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void (**v42)(_QWORD, _QWORD);
  uint8_t v43[24];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend_CKClientSuitableError(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v7 = signpost;

  if (v5)
  {
    if (!v7)
      goto LABEL_22;
    if (self)
      v11 = self->super._signpost;
    else
      v11 = 0;
    v12 = v11;
    objc_msgSend_log(v12, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    if (self)
      v17 = self->super._signpost;
    else
      v17 = 0;
    v18 = v17;
    v22 = objc_msgSend_identifier(v18, v19, v20, v21);

    if ((unint64_t)(v22 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16))
      goto LABEL_21;
    *(_DWORD *)v43 = 138412290;
    *(_QWORD *)&v43[4] = v5;
    v23 = "Participant vetting initialiated with error: %@";
    v24 = v16;
    v25 = v22;
    v26 = 12;
    goto LABEL_20;
  }
  if (!v7)
    goto LABEL_22;
  if (self)
    v27 = self->super._signpost;
  else
    v27 = 0;
  v28 = v27;
  objc_msgSend_log(v28, v29, v30, v31);
  v16 = objc_claimAutoreleasedReturnValue();

  if (self)
    v32 = self->super._signpost;
  else
    v32 = 0;
  v33 = v32;
  v37 = objc_msgSend_identifier(v33, v34, v35, v36);

  if ((unint64_t)(v37 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)v43 = 0;
    v23 = "Participant vetting initialiated";
    v24 = v16;
    v25 = v37;
    v26 = 2;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v24, OS_SIGNPOST_EVENT, v25, "CKInitiateParticipantVettingOperation", v23, v43, v26);
  }
LABEL_21:

LABEL_22:
  objc_msgSend_participantVettingInitiatedBlock(self, v8, v9, v10, *(_OWORD *)v43);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend_participantVettingInitiatedBlock(self, v39, v40, v41);
    v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v42)[2](v42, v5);

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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void (**v29)(_QWORD, _QWORD);
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  objc_super v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  CKInitiateParticipantVettingOperation *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKInitiateParticipantVettingOperation", "Finishing", buf, 2u);
    }

  }
  objc_msgSend_participantVettingInitiationCompletionBlock(self, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v25 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v36 = v25;
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKClientSuitableError(v4, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v49 = v38;
      v50 = 2048;
      v51 = self;
      v52 = 2114;
      v53 = v42;
      v54 = 2112;
      v55 = v46;
      _os_log_debug_impl(&dword_18A5C5000, v36, OS_LOG_TYPE_DEBUG, "Calling participantVettingInitiationCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);

    }
    objc_msgSend_participantVettingInitiationCompletionBlock(self, v26, v27, v28);
    v29 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v29)[2](v29, v33);

    objc_msgSend_setParticipantVettingInitiationCompletionBlock_(self, v34, 0, v35);
  }
  objc_msgSend_setParticipantVettingInitiatedBlock_(self, v23, 0, v24);
  v47.receiver = self;
  v47.super_class = (Class)CKInitiateParticipantVettingOperation;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKInitiateParticipantVettingOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKInitiateParticipantVettingOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleParticipantVettingProgressWithError_, 0, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKInitiateParticipantVettingOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong(&self->_participantVettingInitiationCompletionBlock, 0);
  objc_storeStrong(&self->_participantVettingInitiatedBlock, 0);
}

@end
