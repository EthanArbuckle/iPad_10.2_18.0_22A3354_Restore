@implementation CKDCodeFunctionInvokeURLRequest

- (CKDCodeFunctionInvokeURLRequest)initWithOperation:(id)a3 serviceName:(id)a4 functionName:(id)a5 serializedParameters:(id)a6 attestationEntropy:(id)a7 pccWrappedInvocationKeys:(id)a8 trustedTargetWrappedInvocationKey:(id)a9
{
  id v16;
  id v17;
  CKDCodeFunctionInvokeURLRequest *v18;
  CKDCodeFunctionInvokeURLRequest *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)CKDCodeFunctionInvokeURLRequest;
  v18 = -[CKDURLRequest initWithOperation:](&v25, sel_initWithOperation_, a3);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_serviceName, a4);
    objc_storeStrong((id *)&v19->_functionName, a5);
    objc_storeStrong((id *)&v19->_serializedParameters, a6);
    objc_storeStrong((id *)&v19->_pccWrappedInvocationKeys, a8);
    objc_storeStrong((id *)&v19->_trustedTargetWrappedInvocationKey, a9);
    objc_storeStrong((id *)&v19->_attestationEntropy, a7);
  }

  return v19;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKDCodeFunctionInvokeURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v13, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_serviceName(self, v5, v6, v13.receiver, v13.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("serviceName"));

  objc_msgSend_functionName(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, CFSTR("functionName"));

}

- (BOOL)allowsAnonymousAccount
{
  uint64_t v2;

  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)additionalHeaderValues
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_serviceName(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_functionName(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("%@/%@"), v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = CFSTR("X-CloudKit-FunctionRoutingHint");
  v15[0] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)databaseScope
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int64_t v10;
  objc_super v12;

  objc_msgSend_operation(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfo(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_enqueuedOnContainerService(v7, v8, v9) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKDCodeFunctionInvokeURLRequest;
    v10 = -[CKDURLRequest databaseScope](&v12, sel_databaseScope);
  }

  return v10;
}

- (id)requestOperationClasses
{
  const char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requestGETPreAuth
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_usePreauth(v3, v4, v5);

  return v6;
}

- (id)generateRequestOperations
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  CKDPCodeFunctionInvokeRequestAttestationRequest *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  const char *v76;
  void *v77;
  _QWORD v79[2];

  v79[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend_serviceName(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServiceName_(v3, v7, (uint64_t)v6);

  objc_msgSend_functionName(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFunctionName_(v3, v11, (uint64_t)v10);

  objc_msgSend_serializedParameters(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSerializedParameters_(v3, v15, (uint64_t)v14);

  objc_msgSend_pccWrappedInvocationKeys(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_pccWrappedInvocationKeys(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v21, v22, (uint64_t)&unk_1E7833B68);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_opt_new();
    v27 = (void *)objc_msgSend_mutableCopy(v23, v25, v26);
    objc_msgSend_setCryptoSessions_(v24, v28, (uint64_t)v27);

    objc_msgSend_setProtectedCloudComputeMetadata_(v3, v29, (uint64_t)v24);
  }
  objc_msgSend_attestationEntropy(self, v19, v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v33 = objc_alloc_init(CKDPCodeFunctionInvokeRequestAttestationRequest);
    objc_msgSend_attestationEntropy(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEntropy_(v33, v37, (uint64_t)v36);

    objc_msgSend_setAttestationRequest_(v3, v38, (uint64_t)v33);
  }
  objc_msgSend_trustedTargetWrappedInvocationKey(self, v31, v32);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v42 = (void *)objc_opt_new();
    objc_msgSend_trustedTargetWrappedInvocationKey(self, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_wrappedKey(v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEncryptedInvocationKey_(v42, v49, (uint64_t)v48);

    objc_msgSend_trustedTargetWrappedInvocationKey(self, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_publicKey(v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionSource(v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionSource_(v42, v59, (uint64_t)v58);

    objc_msgSend_trustedTargetWrappedInvocationKey(self, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_publicKey(v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_version(v65, v66, v67);
    objc_msgSend_setKeyVersion_(v42, v69, v68);

    objc_msgSend_setScheme_(v42, v70, 1);
    objc_msgSend_setTrustedTargetCryptoMetadata_(v3, v71, (uint64_t)v42);

  }
  v72 = objc_msgSend_operationType(self, v40, v41);
  objc_msgSend_operationRequestWithType_(self, v73, v72);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFunctionInvokeRequest_(v74, v75, (uint64_t)v3);
  v79[0] = v74;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v76, (uint64_t)v79, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  return v77;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  const char *v37;
  uint64_t v38;
  void *v39;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_fakeResponseOperationResultByItemID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_fakeResponseOperationResultByItemID(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_functionName(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v16 = (void *)*MEMORY[0x1E0C952E0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
      {
        v41 = v16;
        objc_msgSend_requestUUID(self, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_functionName(self, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138543618;
        v49 = v44;
        v50 = 2114;
        v51 = v47;
        _os_log_error_impl(&dword_1BE990000, v41, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Inlining fake response operation result for function %{public}@\", (uint8_t *)&v48, 0x16u);

      }
      objc_msgSend_setResult_(v4, v17, (uint64_t)v15);
    }

  }
  if (objc_msgSend_hasFunctionInvokeResponse(v4, v8, v9))
  {
    objc_msgSend_functionInvokeResponse(v4, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasAttestationResponse(v20, v21, v22))
    {
      v25 = objc_alloc_init(MEMORY[0x1E0D82B98]);
      objc_msgSend_attestationResponse(v20, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writeTo_(v28, v29, (uint64_t)v25);

      objc_msgSend_data(v25, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_serializedResult(v20, v23, v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v32 = 0;
  }
  objc_msgSend_serializedResultsCallback(self, v18, v19);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend_serializedResultsCallback(self, v34, v35);
    v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v36)[2](v36, v32, v39);

  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend_serializedResultsCallback(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_serializedResultsCallback(self, v7, v8);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v13, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v12);

  }
}

- (id)serializedResultsCallback
{
  return self->_serializedResultsCallback;
}

- (void)setSerializedResultsCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSData)serializedParameters
{
  return self->_serializedParameters;
}

- (void)setSerializedParameters:(id)a3
{
  objc_storeStrong((id *)&self->_serializedParameters, a3);
}

- (NSData)attestationEntropy
{
  return self->_attestationEntropy;
}

- (void)setAttestationEntropy:(id)a3
{
  objc_storeStrong((id *)&self->_attestationEntropy, a3);
}

- (NSArray)pccWrappedInvocationKeys
{
  return self->_pccWrappedInvocationKeys;
}

- (void)setPccWrappedInvocationKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (CKDTrustedTargetWrappedKey)trustedTargetWrappedInvocationKey
{
  return self->_trustedTargetWrappedInvocationKey;
}

- (void)setTrustedTargetWrappedInvocationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedTargetWrappedInvocationKey, 0);
  objc_storeStrong((id *)&self->_pccWrappedInvocationKeys, 0);
  objc_storeStrong((id *)&self->_attestationEntropy, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_serializedResultsCallback, 0);
}

@end
