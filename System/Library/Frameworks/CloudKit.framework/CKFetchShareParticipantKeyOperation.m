@implementation CKFetchShareParticipantKeyOperation

- (CKFetchShareParticipantKeyOperation)initWithShareIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKFetchShareParticipantKeyOperation *v8;
  uint64_t v9;
  NSArray *shareIDs;
  uint64_t v11;
  NSMutableDictionary *errorsByShareID;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKFetchShareParticipantKeyOperation;
  v8 = -[CKOperation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    shareIDs = v8->_shareIDs;
    v8->_shareIDs = (NSArray *)v9;

    v11 = objc_opt_new();
    errorsByShareID = v8->_errorsByShareID;
    v8->_errorsByShareID = (NSMutableDictionary *)v11;

  }
  return v8;
}

- (void)setShareParticipantKeyFetchedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id shareParticipantKeyFetchedBlock;
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
    block[2] = sub_18A79A068;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    shareParticipantKeyFetchedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_shareParticipantKeyFetchedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    shareParticipantKeyFetchedBlock = self->_shareParticipantKeyFetchedBlock;
    self->_shareParticipantKeyFetchedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)shareParticipantKeyFetchedBlock
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
    v15 = sub_18A79A210;
    v16 = sub_18A79A238;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A79A240;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_shareParticipantKeyFetchedBlock);
  }
  return v8;
}

- (void)setShareParticipantKeyCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id shareParticipantKeyCompletionBlock;
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
    block[2] = sub_18A79A39C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    shareParticipantKeyCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_shareParticipantKeyCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    shareParticipantKeyCompletionBlock = self->_shareParticipantKeyCompletionBlock;
    self->_shareParticipantKeyCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)shareParticipantKeyCompletionBlock
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
    v15 = sub_18A79A210;
    v16 = sub_18A79A238;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A79A544;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_shareParticipantKeyCompletionBlock);
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
  objc_msgSend_shareIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareIDs_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_baseTokensByShareID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBaseTokensByShareID_(v4, v15, (uint64_t)v14, v16);

  objc_msgSend_childRecordIDsByShareID(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChildRecordIDsByShareID_(v4, v21, (uint64_t)v20, v22);

  v23.receiver = self;
  v23.super_class = (Class)CKFetchShareParticipantKeyOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v23, sel_fillOutOperationInfo_, v4);

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
  v23.super_class = (Class)CKFetchShareParticipantKeyOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v23, sel_fillFromOperationInfo_, v4);
  objc_msgSend_shareIDs(v4, v5, v6, v7, v23.receiver, v23.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareIDs_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_baseTokensByShareID(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBaseTokensByShareID_(self, v15, (uint64_t)v14, v16);

  objc_msgSend_childRecordIDsByShareID(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setChildRecordIDsByShareID_(self, v21, (uint64_t)v20, v22);
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
  v13.super_class = (Class)CKFetchShareParticipantKeyOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_shareParticipantKeyFetchedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_shareParticipantKeyCompletionBlock(self, v7, v8, v9);
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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int v25;
  objc_class *v27;
  void *v28;
  const char *v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareIDs(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (v10)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend_shareIDs(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v16)
    {
      v20 = v16;
      v21 = *(_QWORD *)v32;
      while (2)
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v14);
          objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v31 + 1) + 8 * v22), v17, v18, v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v24, (uint64_t)v23, (uint64_t)a3);

          if (!v25)
          {

            return 0;
          }
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v31, (uint64_t)v35, 16);
        if (v20)
          continue;
        break;
      }
    }

    v30.receiver = self;
    v30.super_class = (Class)CKFetchShareParticipantKeyOperation;
    return -[CKDatabaseOperation CKOperationShouldRun:](&v30, sel_CKOperationShouldRun_, a3);
  }
  else
  {
    if (a3)
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v29, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("No share IDs were passed to %@"), v28);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchShareParticipantKeyOperation_withBlock_;
}

- (void)handleParticipantKeyFetchForRecordID:(id)a3 participantKey:(id)a4 error:(id)a5
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
  os_signpost_id_t v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD);
  CKSignpost *v38;
  CKSignpost *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  CKSignpost *v43;
  CKSignpost *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  os_signpost_id_t v48;
  int v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v15 = signpost;

  if (v13)
  {
    if (v15)
    {
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

      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        v49 = 138412546;
        v50 = v8;
        v51 = 2112;
        v52 = v13;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v24, OS_SIGNPOST_EVENT, v30, "CKFetchShareParticipantKeyOperation", "Share %@ fetched participant key with error: %@", (uint8_t *)&v49, 0x16u);
      }

    }
    objc_msgSend_errorsByShareID(self, v16, v17, v18);
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v13, (uint64_t)v8);
LABEL_14:

    goto LABEL_15;
  }
  if (v15)
  {
    if (self)
      v38 = self->super.super._signpost;
    else
      v38 = 0;
    v39 = v38;
    objc_msgSend_log(v39, v40, v41, v42);
    v31 = objc_claimAutoreleasedReturnValue();

    if (self)
      v43 = self->super.super._signpost;
    else
      v43 = 0;
    v44 = v43;
    v48 = objc_msgSend_identifier(v44, v45, v46, v47);

    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      v49 = 138412290;
      v50 = v8;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v31, OS_SIGNPOST_EVENT, v48, "CKFetchShareParticipantKeyOperation", "Share %@ fetched participant key", (uint8_t *)&v49, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend_shareParticipantKeyFetchedBlock(self, v16, v17, v18);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend_shareParticipantKeyFetchedBlock(self, v34, v35, v36);
    v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, void *))v37)[2](v37, v8, v9, v13);

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
  id v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
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
  void *v37;
  id v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void (**v50)(_QWORD, _QWORD);
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  objc_super v57;
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
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_EVENT, v18, "CKFetchShareParticipantKeyOperation", "Finishing", buf, 2u);
    }

  }
  v22 = v4;
  v23 = v22;
  if (!v22)
  {
    objc_msgSend_errorsByShareID(self, v19, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_count(v24, v25, v26, v27);

    if (v28)
    {
      objc_msgSend_userInfo(0, v19, v20, v21);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend_mutableCopy(v29, v30, v31, v32);
      v37 = v33;
      if (v33)
      {
        v38 = v33;
      }
      else
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v34, v35, v36);
        v38 = (id)objc_claimAutoreleasedReturnValue();
      }
      v39 = v38;

      objc_msgSend_errorsByShareID(self, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v39, v44, (uint64_t)v43, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v45, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v39, CFSTR("Failed to fetch some share participant keys"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }
  }
  objc_msgSend_shareParticipantKeyCompletionBlock(self, v19, v20, v21);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend_shareParticipantKeyCompletionBlock(self, v47, v48, v49);
    v50 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v23, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v50)[2](v50, v54);

    objc_msgSend_setShareParticipantKeyCompletionBlock_(self, v55, 0, v56);
  }
  objc_msgSend_setShareParticipantKeyFetchedBlock_(self, v47, 0, v49);
  v57.receiver = self;
  v57.super_class = (Class)CKFetchShareParticipantKeyOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v57, sel__finishOnCallbackQueueWithError_, v23);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchShareParticipantKeyOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchShareParticipantKeyOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-share-participant-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleParticipantKeyFetchForRecordID_participantKey_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchShareParticipantKeyOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSDictionary)baseTokensByShareID
{
  return self->_baseTokensByShareID;
}

- (void)setBaseTokensByShareID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSDictionary)childRecordIDsByShareID
{
  return self->_childRecordIDsByShareID;
}

- (void)setChildRecordIDsByShareID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NSArray)shareIDs
{
  return self->_shareIDs;
}

- (void)setShareIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (NSMutableDictionary)errorsByShareID
{
  return self->_errorsByShareID;
}

- (void)setErrorsByShareID:(id)a3
{
  objc_storeStrong((id *)&self->_errorsByShareID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByShareID, 0);
  objc_storeStrong((id *)&self->_shareIDs, 0);
  objc_storeStrong((id *)&self->_childRecordIDsByShareID, 0);
  objc_storeStrong((id *)&self->_baseTokensByShareID, 0);
  objc_storeStrong(&self->_shareParticipantKeyCompletionBlock, 0);
  objc_storeStrong(&self->_shareParticipantKeyFetchedBlock, 0);
}

@end
