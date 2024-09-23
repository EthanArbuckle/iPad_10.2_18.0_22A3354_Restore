@implementation CKCodeOperation

- (CKCodeOperation)initWithFunctionName:(id)a3 responseClass:(Class)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKCodeOperation *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *functionName;
  uint64_t v15;
  NSMutableDictionary *assetInfoByArrayIndexByRecordKeyByRecordID;
  CKException *v18;
  void *v19;
  const char *v20;
  id v21;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKCodeOperation;
  v9 = -[CKOperation init](&v22, sel_init);
  if (v9)
  {
    if ((objc_msgSend_conformsToProtocol_(a4, v7, (uint64_t)&unk_1EDFB4648, v8) & 1) == 0)
    {
      v18 = [CKException alloc];
      NSStringFromClass(a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend_initWithCode_format_(v18, v20, 12, (uint64_t)CFSTR("Response class named %@ doesn't conform to CKCodeOperationMessageMutation"), v19);

      objc_exception_throw(v21);
    }
    v13 = objc_msgSend_copy(v6, v10, v11, v12);
    functionName = v9->_functionName;
    v9->_functionName = (NSString *)v13;

    objc_storeStrong((id *)&v9->_responseClass, a4);
    v9->_destinationServer = 0;
    v9->_dropInMemoryAssetContentASAP = 1;
    v15 = objc_opt_new();
    assetInfoByArrayIndexByRecordKeyByRecordID = v9->_assetInfoByArrayIndexByRecordKeyByRecordID;
    v9->_assetInfoByArrayIndexByRecordKeyByRecordID = (NSMutableDictionary *)v15;

  }
  return v9;
}

- (CKCodeOperation)initWithServiceName:(id)a3 functionName:(id)a4 responseClass:(Class)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  CKCodeOperation *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *serviceName;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *functionName;
  uint64_t v23;
  NSMutableDictionary *assetInfoByArrayIndexByRecordKeyByRecordID;
  CKException *v26;
  void *v27;
  const char *v28;
  id v29;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CKCodeOperation;
  v12 = -[CKOperation init](&v30, sel_init);
  if (v12)
  {
    if ((objc_msgSend_conformsToProtocol_(a5, v10, (uint64_t)&unk_1EDFB4648, v11) & 1) == 0)
    {
      v26 = [CKException alloc];
      NSStringFromClass(a5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend_initWithCode_format_(v26, v28, 12, (uint64_t)CFSTR("Response class named %@ doesn't conform to CKCodeOperationMessageMutation"), v27);

      objc_exception_throw(v29);
    }
    v16 = objc_msgSend_copy(v8, v13, v14, v15);
    serviceName = v12->_serviceName;
    v12->_serviceName = (NSString *)v16;

    v21 = objc_msgSend_copy(v9, v18, v19, v20);
    functionName = v12->_functionName;
    v12->_functionName = (NSString *)v21;

    objc_storeStrong((id *)&v12->_responseClass, a5);
    v12->_destinationServer = 0;
    v12->_dropInMemoryAssetContentASAP = 1;
    v23 = objc_opt_new();
    assetInfoByArrayIndexByRecordKeyByRecordID = v12->_assetInfoByArrayIndexByRecordKeyByRecordID;
    v12->_assetInfoByArrayIndexByRecordKeyByRecordID = (NSMutableDictionary *)v23;

  }
  return v12;
}

- (void)setCodeService:(id)a3
{
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  id v31;

  v31 = a3;
  objc_storeStrong((id *)&self->_codeService, a3);
  objc_msgSend_container(v31, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_boxedDatabaseScope(v31, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_boxedDatabaseScope(v31, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_integerValue(v16, v17, v18, v19);
    objc_msgSend_databaseWithDatabaseScope_(v8, v21, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setDatabase_(self, v24, (uint64_t)v23, v25);
  }
  else
  {
    objc_msgSend_setDatabase_(self, v13, 0, v15);
    objc_msgSend_configuration(self, v26, v27, v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainer_(v23, v29, (uint64_t)v8, v30);
  }

}

- (void)setPerRecordProgressBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perRecordProgressBlock;
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
    block[2] = sub_18A757DAC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perRecordProgressBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordProgressBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perRecordProgressBlock = self->_perRecordProgressBlock;
    self->_perRecordProgressBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perRecordProgressBlock
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
    v15 = sub_18A757F54;
    v16 = sub_18A757F7C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A757F84;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordProgressBlock);
  }
  return v8;
}

- (void)setPerRecordCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perRecordCompletionBlock;
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
    block[2] = sub_18A7580E0;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perRecordCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perRecordCompletionBlock = self->_perRecordCompletionBlock;
    self->_perRecordCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perRecordCompletionBlock
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
    v15 = sub_18A757F54;
    v16 = sub_18A757F7C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A758288;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordCompletionBlock);
  }
  return v8;
}

- (void)setCodeOperationCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id codeOperationCompletionBlock;
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
    block[2] = sub_18A7583E4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    codeOperationCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_codeOperationCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    codeOperationCompletionBlock = self->_codeOperationCompletionBlock;
    self->_codeOperationCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)codeOperationCompletionBlock
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
    v15 = sub_18A757F54;
    v16 = sub_18A757F7C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A75858C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_codeOperationCompletionBlock);
  }
  return v8;
}

- (void)setIncompleteResponsePreviewBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id incompleteResponsePreviewBlock;
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
    block[2] = sub_18A7586E8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    incompleteResponsePreviewBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_incompleteResponsePreviewBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    incompleteResponsePreviewBlock = self->_incompleteResponsePreviewBlock;
    self->_incompleteResponsePreviewBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)incompleteResponsePreviewBlock
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
    v15 = sub_18A757F54;
    v16 = sub_18A757F7C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A758890;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_incompleteResponsePreviewBlock);
  }
  return v8;
}

- (void)setDidSubstituteRequestRecordTransportsBlock:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id didSubstituteRequestRecordTransportsBlock;
  NSObject *v15;
  void *v16;
  const char *v17;
  char *v18;
  _QWORD block[5];
  char *v20;

  v5 = (const char *)a3;
  v18 = (char *)v5;
  if (__sTestOverridesAvailable)
  {
    v8 = objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v5, v6, v7);
    v5 = v18;
    if (v8)
    {
      objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v18, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
      v5 = v18;
    }
  }
  if (v5 && !__sTestOverridesAvailable)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CKCodeOperation.m"), 92, CFSTR("Only suitable for testing"));

  }
  if (objc_msgSend_queueHasStarted(self, v5, v6, v7)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v9, v10, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A758A48;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v20 = v18;
    dispatch_sync(v15, block);

    didSubstituteRequestRecordTransportsBlock = v20;
    goto LABEL_12;
  }
  v12 = v18;
  if (self->_didSubstituteRequestRecordTransportsBlock != v18)
  {
    v13 = (void *)objc_msgSend_copy(v18, v9, v10, v11);
    didSubstituteRequestRecordTransportsBlock = self->_didSubstituteRequestRecordTransportsBlock;
    self->_didSubstituteRequestRecordTransportsBlock = v13;
LABEL_12:

    v12 = v18;
  }

}

- (id)didSubstituteRequestRecordTransportsBlock
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
    v15 = sub_18A757F54;
    v16 = sub_18A757F7C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A758BF0;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_didSubstituteRequestRecordTransportsBlock);
  }
  return v8;
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CKCodeOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v21, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perRecordCompletionBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_perRecordProgressBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_codeOperationCompletionBlock(self, v11, v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend_incompleteResponsePreviewBlock(self, v15, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v19 != 0;

      }
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
  int isLongLived;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  BOOL result;
  id v32;
  objc_super v33;

  objc_msgSend_codeService(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend_serviceName(self, v7, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You must a) enqueue this on a CKCodeService, b) set the codeService property, or c) use the deprecated initializer to specify a serviceName at init-time"));
        goto LABEL_17;
      }
      return 0;
    }
  }
  objc_msgSend_request(self, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_resolvedConfiguration(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isLongLived = objc_msgSend_isLongLived(v18, v19, v20, v21);

    if (isLongLived)
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v23, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("This operation cannot be long lived"));
LABEL_17:
        v32 = (id)objc_claimAutoreleasedReturnValue();
        result = 0;
        *a3 = v32;
        return result;
      }
    }
    else
    {
      if (objc_msgSend_destinationServer(self, v23, v24, v25) != 2
        || (objc_msgSend_destinationServerExplicitURL(self, v26, v27, v28),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            v29,
            v29))
      {
        v33.receiver = self;
        v33.super_class = (Class)CKCodeOperation;
        return -[CKDatabaseOperation CKOperationShouldRun:](&v33, sel_CKOperationShouldRun_, a3);
      }
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v30, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You must provide a destinationServerExplictURL if you specify destinationServer == .explicitURL"));
        goto LABEL_17;
      }
    }
  }
  else if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You must provide a non-nil request"));
    goto LABEL_17;
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performCodeOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  char v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend_request(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend_request(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extractRecordTransports(v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = v14;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v18)
  {
    v22 = v18;
    v23 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(v16);
        v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend_contents(v25, v19, v20, v21) != 1)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Request RecordTransport had unexpected contents: %@"), v25);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_finishWithError_(self, v35, (uint64_t)v34, v36);

          goto LABEL_14;
        }
        objc_msgSend_localSerialization(v25, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v15, v30, (uint64_t)v29, v31);

      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v22)
        continue;
      break;
    }
  }

  objc_msgSend_setRequestLocalSerializations_(self, v32, (uint64_t)v15, v33);
  v37.receiver = self;
  v37.super_class = (Class)CKCodeOperation;
  -[CKOperation performCKOperation](&v37, sel_performCKOperation);
LABEL_14:

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKCodeOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKCodeOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/code-operation-objc", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (Class)operationInfoClass
{
  return (Class)objc_opt_class();
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
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
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
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t AssetContentInMemory;
  const char *v65;
  uint64_t v66;
  objc_super v67;

  v4 = a3;
  objc_msgSend_codeService(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serviceName(v8, v9, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend_setServiceName_(v4, v12, (uint64_t)v15, v14);
  }
  else
  {
    objc_msgSend_serviceName(self, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setServiceName_(v4, v17, (uint64_t)v16, v18);

  }
  objc_msgSend_functionName(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFunctionName_(v4, v23, (uint64_t)v22, v24);

  objc_msgSend_requestLocalSerializations(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestLocalSerializations_(v4, v29, (uint64_t)v28, v30);

  objc_msgSend_codeService(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend_codeService(self, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serviceInstanceURL(v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClientRuntimeProvidedServiceURL_(v4, v43, (uint64_t)v42, v44);

    objc_msgSend_codeService(self, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_boxedDatabaseScope(v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEnqueuedOnContainerService_(v4, v53, v52 == 0, v54);

LABEL_6:
    goto LABEL_13;
  }
  v58 = objc_msgSend_destinationServer(self, v35, v36, v37);
  switch(v58)
  {
    case 2:
      objc_msgSend_setLegacyIsLocalBit_(v4, v55, 1, v57);
      objc_msgSend_destinationServerExplicitURL(self, v59, v60, v61);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setClientRuntimeProvidedServiceURL_(v4, v62, (uint64_t)v48, v63);
      goto LABEL_6;
    case 1:
      objc_msgSend_setLegacyIsLocalBit_(v4, v55, 1, v57);
      break;
    case 0:
      objc_msgSend_setLegacyIsLocalBit_(v4, v55, 0, v57);
      break;
  }
LABEL_13:
  AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v55, v56, v57);
  objc_msgSend_setShouldFetchAssetContentInMemory_(v4, v65, AssetContentInMemory, v66);
  v67.receiver = self;
  v67.super_class = (Class)CKCodeOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v67, sel_fillOutOperationInfo_, v4);

}

- (void)fillFromOperationInfo:(id)a3
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  objc_super v12;

  v5 = (void *)MEMORY[0x1E0CB3488];
  v6 = a3;
  objc_msgSend_currentHandler(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, CFSTR("CKCodeOperation.m"), 195, CFSTR("You cannot inflate a CKCodeOperation from operation info; they are not suitable as long lived operations"));

  v12.receiver = self;
  v12.super_class = (Class)CKCodeOperation;
  -[CKDatabaseOperation fillFromOperationInfo:](&v12, sel_fillFromOperationInfo_, v6);

}

+ (id)operationDaemonCallbackProtocol
{
  return &unk_1EDF908B0;
}

- (void)setDestinationServerExplicitURL:(id)a3
{
  _BOOL4 v4;

  v4 = a3 != 0;
  objc_storeStrong((id *)&self->_destinationServerExplicitURL, a3);
  self->_destinationServer = 2 * v4;
}

- (void)handleReplaceLocalWithWireSerializations:(id)a3 encryptedMasterKeys:(id)a4 wireEnvelopes:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, _QWORD);
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void (**v40)(void);
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, _QWORD))a6;
  if (!objc_msgSend_count(v9, v12, v13, v14))
    goto LABEL_12;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = sub_18A759958;
  v50[3] = &unk_1E1F63F60;
  v51 = v10;
  objc_msgSend_CKMapWithIndex_(v9, v18, (uint64_t)v50, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    objc_msgSend_request(self, v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_substituteRecordTransports_(v29, v30, (uint64_t)v20, v31);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v35 = (void *)ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v29 = v35;
    objc_msgSend_request(self, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v53 = v49;
    _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Found wire serializations to substitute, but request claims to not support substituting: %@", buf, 0xCu);

  }
LABEL_8:
  if (__sTestOverridesAvailable)
  {
    objc_msgSend_didSubstituteRequestRecordTransportsBlock(self, v32, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend_didSubstituteRequestRecordTransportsBlock(self, v37, v38, v39);
      v40 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v40[2]();

    }
  }

LABEL_12:
  objc_msgSend_request(self, v15, v16, v17);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v45, 0);

}

- (void)handleInitialResponseReceived:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  char v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void (**v79)(_QWORD, _QWORD);
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  void *v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v11 = (void *)objc_msgSend_responseClass(self, v8, v9, v10);
  v15 = (void *)objc_msgSend_alloc(v11, v12, v13, v14);
  v18 = (void *)objc_msgSend_initWithData_(v15, v16, (uint64_t)v6, v17);
  objc_msgSend_setResponse_(self, v19, (uint64_t)v18, v20);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_extractRecordTransports(v18, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  v25 = (void *)objc_opt_new();
  if (objc_msgSend_count(v24, v26, v27, v28))
  {
    v89 = v6;
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v32 = v24;
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v90, (uint64_t)v96, 16);
    if (v34)
    {
      v38 = v34;
      v39 = *(_QWORD *)v91;
      while (2)
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v91 != v39)
            objc_enumerationMutation(v32);
          v41 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          if (objc_msgSend_contents(v41, v35, v36, v37) != 2)
          {
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v42, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Request RecordTransport had unexpected contents: %@"), v41);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_finishWithError_(self, v69, (uint64_t)v68, v70);
            v7[2](v7, 0, v68);

            v6 = v89;
            goto LABEL_28;
          }
          objc_msgSend_wireSerialization(v41, v42, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v25, v46, (uint64_t)v45, v47);

        }
        v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v90, (uint64_t)v96, 16);
        if (v38)
          continue;
        break;
      }
    }

    v48 = (void *)objc_opt_new();
    v49 = (void *)objc_opt_new();
    if (objc_msgSend_count(v25, v50, v51, v52))
    {
      v56 = 0;
      do
      {
        objc_msgSend_addObject_(v49, v53, (uint64_t)v48, v55);
        ++v56;
      }
      while (v56 < objc_msgSend_count(v25, v57, v58, v59));
    }
    objc_msgSend_response(self, v53, v54, v55);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_opt_respondsToSelector();

    if ((v61 & 1) != 0)
    {
      objc_msgSend_response(self, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substituteRecordTransports_(v65, v66, (uint64_t)v49, v67);

      v6 = v89;
    }
    else
    {
      v6 = v89;
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v71 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v84 = v71;
        objc_msgSend_response(self, v85, v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v95 = v88;
        _os_log_error_impl(&dword_18A5C5000, v84, OS_LOG_TYPE_ERROR, "Found record transports to substitute, but response claims to not support substituting: %@", buf, 0xCu);

      }
    }

  }
  if (objc_msgSend_count(v25, v29, v30, v31))
  {
    objc_msgSend_incompleteResponsePreviewBlock(self, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      objc_msgSend_incompleteResponsePreviewBlock(self, v76, v77, v78);
      v79 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_response(self, v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v79)[2](v79, v83);

    }
  }
  ((void (**)(id, void *, void *))v7)[2](v7, v25, 0);
LABEL_28:

}

- (void)handleReplaceWireSerializationsWithRecords:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  CKCodeRecordTransport *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    v8 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = v4;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v40, (uint64_t)v46, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(v9);
          v16 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend__wireUpAssetContentForOperation_inRecord_checkSignatures_outError_(CKOperation, v12, (uint64_t)self, v16, 0, 0, (_QWORD)v40);
          v17 = [CKCodeRecordTransport alloc];
          v20 = (void *)objc_msgSend_initWithRecord_(v17, v18, v16, v19);
          objc_msgSend_addObject_(v8, v21, (uint64_t)v20, v22);

        }
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v40, (uint64_t)v46, 16);
      }
      while (v13);
    }

    objc_msgSend_response(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) != 0)
    {
      objc_msgSend_response(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substituteRecordTransports_(v31, v32, (uint64_t)v8, v33);

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v34 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v35 = v34;
        objc_msgSend_response(self, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = v39;
        _os_log_error_impl(&dword_18A5C5000, v35, OS_LOG_TYPE_ERROR, "Found record transports to substitute, but response claims to not support substituting: %@", buf, 0xCu);

      }
    }

  }
}

- (void)handleFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void (**v55)(_QWORD, _QWORD, _QWORD, _QWORD);
  void (**v56)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v12 = signpost;

  if (v10)
  {
    if (!v12)
      goto LABEL_22;
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

    if ((unint64_t)(v27 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21))
      goto LABEL_21;
    *(_DWORD *)buf = 138412546;
    v62 = v8;
    v63 = 2112;
    v64 = v10;
    v28 = "Record %@ fetched with error: %@";
    v29 = v21;
    v30 = v27;
    v31 = 22;
    goto LABEL_20;
  }
  if (!v12)
    goto LABEL_22;
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

  if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v8;
    v28 = "Record %@ fetched";
    v29 = v21;
    v30 = v42;
    v31 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v29, OS_SIGNPOST_EVENT, v30, "CKCodeOperation", v28, buf, v31);
  }
LABEL_21:

LABEL_22:
  objc_msgSend_perRecordCompletionBlock(self, v13, v14, v15);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    if (v9)
    {
      v60 = v10;
      objc_msgSend__wireUpAssetContentForOperation_inRecord_checkSignatures_outError_(CKOperation, v44, (uint64_t)self, (uint64_t)v9, 0, &v60);
      v47 = v60;

      v10 = v47;
    }
    if (objc_msgSend_dropInMemoryAssetContentASAP(self, v44, v45, v46))
    {
      v51 = (void *)MEMORY[0x18D76DE4C]();
      objc_msgSend_perRecordCompletionBlock(self, v52, v53, v54);
      v55 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id, id))v55)[2](v55, v9, v8, v10);

      objc_autoreleasePoolPop(v51);
    }
    else
    {
      objc_msgSend_perRecordCompletionBlock(self, v48, v49, v50);
      v56 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id, id))v56)[2](v56, v9, v8, v10);

    }
  }
  if (objc_msgSend_shouldFetchAssetContentInMemory(self, v44, v45, v46)
    && objc_msgSend_dropInMemoryAssetContentASAP(self, v57, v58, v59))
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_assetInfoByArrayIndexByRecordKeyByRecordID, v57, 0, (uint64_t)v8);
  }
  if (v10)
    objc_msgSend_setResponseError_(self, v57, (uint64_t)v10, v59);

}

- (void)handleFetchForRecordID:(id)a3 didProgress:(double)a4
{
  id v6;
  CKSignpost *signpost;
  CKSignpost *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKSignpost *v12;
  CKSignpost *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  CKSignpost *v18;
  CKSignpost *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  os_signpost_id_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, double);
  int v29;
  id v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v8 = signpost;

  if (v8)
  {
    if (self)
      v12 = self->super.super._signpost;
    else
      v12 = 0;
    v13 = v12;
    objc_msgSend_log(v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (self)
      v18 = self->super.super._signpost;
    else
      v18 = 0;
    v19 = v18;
    v23 = objc_msgSend_identifier(v19, v20, v21, v22);

    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v29 = 138412546;
      v30 = v6;
      v31 = 2048;
      v32 = a4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v17, OS_SIGNPOST_EVENT, v23, "CKCodeOperation", "Record %@ updated progress %f", (uint8_t *)&v29, 0x16u);
    }

  }
  objc_msgSend_perRecordProgressBlock(self, v9, v10, v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_perRecordProgressBlock(self, v25, v26, v27);
    v28 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, double))v28)[2](v28, v6, a4);

  }
}

- (void)handleAssetDataForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 data:(id)a6 offset:(unint64_t)a7
{
  const char *v12;
  const char *v13;
  void *v14;
  id v15;

  v15 = a6;
  objc_msgSend_assetInfoForOperation_recordID_recordKey_arrayIndex_(CKOperation, v12, (uint64_t)self, (uint64_t)a3, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend_writeData_atOffset_(v14, v13, (uint64_t)v15, a7);

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
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  objc_super v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  CKCodeOperation *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKCodeOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_responseError(self, v7, v8, v9);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend_response(self, v7, v8, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v4 = 0;
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("No response received"));
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  objc_msgSend_codeOperationCompletionBlock(self, v7, v8, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v24 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v40 = v24;
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v49 = v42;
      v50 = 2048;
      v51 = self;
      v52 = 2114;
      v53 = v46;
      v54 = 2112;
      v55 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v40, OS_LOG_TYPE_DEBUG, "Calling codeOperationCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);

    }
    objc_msgSend_response(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v28;
    if (v4)
    {

      v32 = 0;
    }
    objc_msgSend_codeOperationCompletionBlock(self, v29, v30, v31);
    v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v33)[2](v33, v32, v37);

    objc_msgSend_setCodeOperationCompletionBlock_(self, v38, 0, v39);
  }
  v47.receiver = self;
  v47.super_class = (Class)CKCodeOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v47, sel__finishOnCallbackQueueWithError_, v4);

}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  objc_msgSend_applyDaemonCallbackInterfaceTweaks_(CKCodeFunctionInvokeOperation, v5, (uint64_t)v4, v6);
  objc_msgSend_applyDaemonCallbackInterfaceTweaks_(CKFetchRecordsOperation, v7, (uint64_t)v4, v8);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKCodeOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSMutableDictionary)assetInfoByArrayIndexByRecordKeyByRecordID
{
  return self->_assetInfoByArrayIndexByRecordKeyByRecordID;
}

- (void)setAssetInfoByArrayIndexByRecordKeyByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_assetInfoByArrayIndexByRecordKeyByRecordID, a3);
}

- (CKCodeOperationMessageMutation)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (Class)responseClass
{
  return self->_responseClass;
}

- (void)setResponseClass:(Class)a3
{
  objc_storeStrong((id *)&self->_responseClass, a3);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (BOOL)dropInMemoryAssetContentASAP
{
  return self->_dropInMemoryAssetContentASAP;
}

- (void)setDropInMemoryAssetContentASAP:(BOOL)a3
{
  self->_dropInMemoryAssetContentASAP = a3;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchAssetContentInMemory = a3;
}

- (CKCodeService)codeService
{
  return self->_codeService;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (int64_t)destinationServer
{
  return self->_destinationServer;
}

- (void)setDestinationServer:(int64_t)a3
{
  self->_destinationServer = a3;
}

- (NSURL)destinationServerExplicitURL
{
  return self->_destinationServerExplicitURL;
}

- (NSArray)requestLocalSerializations
{
  return self->_requestLocalSerializations;
}

- (void)setRequestLocalSerializations:(id)a3
{
  objc_storeStrong((id *)&self->_requestLocalSerializations, a3);
}

- (CKCodeOperationMessageMutation)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
  objc_storeStrong((id *)&self->_responseError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseError, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requestLocalSerializations, 0);
  objc_storeStrong((id *)&self->_destinationServerExplicitURL, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_codeService, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_responseClass, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_didSubstituteRequestRecordTransportsBlock, 0);
  objc_storeStrong(&self->_incompleteResponsePreviewBlock, 0);
  objc_storeStrong(&self->_codeOperationCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordProgressBlock, 0);
  objc_storeStrong((id *)&self->_assetInfoByArrayIndexByRecordKeyByRecordID, 0);
}

@end
