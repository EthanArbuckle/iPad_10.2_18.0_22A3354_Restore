@implementation CKCodeFunctionInvokeOperation

- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedRequest:(id)a5 local:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  char v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKCodeFunctionInvokeOperation *v19;
  uint64_t v20;
  NSString *serviceName;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *functionName;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSData *serializedRequest;
  void *v33;
  CKException *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  id v44;
  objc_super v45;
  id v46;
  id v47;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v47 = 0;
  v13 = _CKCheckArgument((uint64_t)"serviceName", v10, 0, 0, 0, &v47);
  v14 = v47;
  if ((v13 & 1) == 0
    || (v14,
        v46 = 0,
        v15 = _CKCheckArgument((uint64_t)"functionName", v11, 0, 0, 0, &v46),
        v14 = v46,
        (v15 & 1) == 0))
  {
    v33 = v14;
    v34 = [CKException alloc];
    v38 = objc_msgSend_code(v33, v35, v36, v37);
    objc_msgSend_localizedDescription(v33, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (id)objc_msgSend_initWithCode_format_(v34, v43, v38, (uint64_t)CFSTR("%@"), v42);

    objc_exception_throw(v44);
  }

  v45.receiver = self;
  v45.super_class = (Class)CKCodeFunctionInvokeOperation;
  v19 = -[CKOperation init](&v45, sel_init);
  if (v19)
  {
    v20 = objc_msgSend_copy(v10, v16, v17, v18);
    serviceName = v19->_serviceName;
    v19->_serviceName = (NSString *)v20;

    v25 = objc_msgSend_copy(v11, v22, v23, v24);
    functionName = v19->_functionName;
    v19->_functionName = (NSString *)v25;

    v30 = objc_msgSend_copy(v12, v27, v28, v29);
    serializedRequest = v19->_serializedRequest;
    v19->_serializedRequest = (NSData *)v30;

    v19->_local = a6;
  }

  return v19;
}

- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedRequest:(id)a5
{
  return (CKCodeFunctionInvokeOperation *)MEMORY[0x1E0DE7D20](self, sel_initWithServiceName_functionName_serializedRequest_local_, a3, a4);
}

- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedParameters:(id)a5 local:(BOOL)a6
{
  return (CKCodeFunctionInvokeOperation *)MEMORY[0x1E0DE7D20](self, sel_initWithServiceName_functionName_serializedRequest_local_, a3, a4);
}

- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedParameters:(id)a5
{
  return (CKCodeFunctionInvokeOperation *)MEMORY[0x1E0DE7D20](self, sel_initWithServiceName_functionName_serializedRequest_, a3, a4);
}

- (void)setFunctionInvokeCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id functionInvokeCompletionBlock;
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
    block[2] = sub_18A7DBA10;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    functionInvokeCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_functionInvokeCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    functionInvokeCompletionBlock = self->_functionInvokeCompletionBlock;
    self->_functionInvokeCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)functionInvokeCompletionBlock
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
    v15 = sub_18A7DBBB8;
    v16 = sub_18A7DBBE0;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7DBBE8;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_functionInvokeCompletionBlock);
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t AssetContentInMemory;
  const char *v27;
  uint64_t v28;
  objc_super v29;

  v4 = a3;
  objc_msgSend_serviceName(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServiceName_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_functionName(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFunctionName_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_local(self, v17, v18, v19);
  objc_msgSend_setLegacyIsLocalBit_(v4, v21, v20, v22);
  AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v23, v24, v25);
  objc_msgSend_setShouldFetchAssetContentInMemory_(v4, v27, AssetContentInMemory, v28);
  v29.receiver = self;
  v29.super_class = (Class)CKCodeFunctionInvokeOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v29, sel_fillOutOperationInfo_, v4);

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
  uint64_t IsLocalBit;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t AssetContentInMemory;
  const char *v27;
  uint64_t v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CKCodeFunctionInvokeOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v29, sel_fillFromOperationInfo_, v4);
  objc_msgSend_serviceName(v4, v5, v6, v7, v29.receiver, v29.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServiceName_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_functionName(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFunctionName_(self, v15, (uint64_t)v14, v16);

  IsLocalBit = objc_msgSend_legacyIsLocalBit(v4, v17, v18, v19);
  objc_msgSend_setLocal_(self, v21, IsLocalBit, v22);
  AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(v4, v23, v24, v25);

  objc_msgSend_setShouldFetchAssetContentInMemory_(self, v27, AssetContentInMemory, v28);
}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKCodeFunctionInvokeOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v9, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_functionInvokeCompletionBlock(self, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7 != 0;

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
  void *v14;
  objc_class *v16;
  void *v17;
  const char *v18;
  objc_class *v19;
  const char *v20;
  objc_class *v21;
  const char *v22;
  objc_super v23;

  objc_msgSend_serviceName(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!a3)
      return 0;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v18, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Service name was not specified on %@"), v17);
LABEL_11:
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  objc_msgSend_functionName(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (!a3)
      return 0;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v20, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Function name was not specified on %@"), v17);
    goto LABEL_11;
  }
  objc_msgSend_serializedRequest(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v23.receiver = self;
    v23.super_class = (Class)CKCodeFunctionInvokeOperation;
    return -[CKDatabaseOperation CKOperationShouldRun:](&v23, sel_CKOperationShouldRun_, a3);
  }
  if (a3)
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v22, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Serialized parameters were not specified on %@"), v17);
    goto LABEL_11;
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performCodeFunctionInvokeOperation_withBlock_;
}

- (void)handleReplaceLocalWithWireSerializations:(id)a3 encryptedMasterKeys:(id)a4 wireEnvelopes:(id)a5 reply:(id)a6
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v8 = a6;
  objc_msgSend_serializedRequest(self, v9, v10, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a6 + 2))(v8, v12, 0);

}

- (void)handleInitialResponseReceived:(id)a3 reply:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  objc_msgSend_setSerializedResponse_(self, v6, (uint64_t)a3, v7);
  (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  CKCodeFunctionInvokeOperation *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend_responseError(self, v4, v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_functionInvokeCompletionBlock(self, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v24 = v9;
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v26;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = v30;
      v38 = 2112;
      v39 = v7;
      _os_log_debug_impl(&dword_18A5C5000, v24, OS_LOG_TYPE_DEBUG, "Calling functionInvokeCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);

    }
    objc_msgSend_functionInvokeCompletionBlock(self, v10, v11, v12);
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_serializedResponse(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v7, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v13)[2](v13, v17, v21);

    objc_msgSend_setFunctionInvokeCompletionBlock_(self, v22, 0, v23);
  }
  v31.receiver = self;
  v31.super_class = (Class)CKCodeFunctionInvokeOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v31, sel__finishOnCallbackQueueWithError_, v7);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKCodeFunctionInvokeOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKCodeFunctionInvokeOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/ckcode-function-invoke", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)local
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  BOOL local;

  objc_msgSend_clientRuntimeProvidedServiceURL(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    local = 1;
  else
    local = self->_local;

  return local;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  objc_super v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v11, (uint64_t)v10, (uint64_t)sel_handleReplaceWireSerializationsWithRecords_, 0, 0);

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CKCodeFunctionInvokeOperation;
  objc_msgSendSuper2(&v12, sel_applyDaemonCallbackInterfaceTweaks_, v5);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NSData)serializedRequest
{
  return self->_serializedRequest;
}

- (void)setSerializedRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
}

- (NSURL)clientRuntimeProvidedServiceURL
{
  return self->_clientRuntimeProvidedServiceURL;
}

- (void)setClientRuntimeProvidedServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchAssetContentInMemory = a3;
}

- (NSData)serializedResponse
{
  return self->_serializedResponse;
}

- (void)setSerializedResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
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
  objc_storeStrong((id *)&self->_serializedResponse, 0);
  objc_storeStrong((id *)&self->_clientRuntimeProvidedServiceURL, 0);
  objc_storeStrong((id *)&self->_serializedRequest, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_functionInvokeCompletionBlock, 0);
}

@end
