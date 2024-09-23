@implementation CKDCodeLocalFunctionInvokeURLRequest

- (CKDCodeLocalFunctionInvokeURLRequest)initWithOperation:(id)a3 serviceName:(id)a4 functionName:(id)a5 serializedParameters:(id)a6 resolvedBaseURL:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CKDCodeLocalFunctionInvokeURLRequest *v17;
  CKDCodeLocalFunctionInvokeURLRequest *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CKDCodeLocalFunctionInvokeURLRequest;
  v17 = -[CKDURLRequest initWithOperation:](&v20, sel_initWithOperation_, a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_serviceName, a4);
    objc_storeStrong((id *)&v18->_functionName, a5);
    objc_storeStrong((id *)&v18->_serializedParameters, a6);
    objc_storeStrong((id *)&v18->_resolvedBaseURL, a7);
  }

  return v18;
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
  v13.super_class = (Class)CKDCodeLocalFunctionInvokeURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v13, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_serviceName(self, v5, v6, v13.receiver, v13.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("serviceName"));

  objc_msgSend_functionName(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, CFSTR("functionName"));

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

- (BOOL)allowsAnonymousAccount
{
  uint64_t v2;

  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (int64_t)partitionType
{
  uint64_t v2;
  uint64_t v3;

  v3 = objc_msgSend_databaseScope(self, a2, v2);
  if (v3 == 4 || v3 == 1)
    return 2;
  else
    return 1;
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
    v12.super_class = (Class)CKDCodeLocalFunctionInvokeURLRequest;
    v10 = -[CKDURLRequest databaseScope](&v12, sel_databaseScope);
  }

  return v10;
}

- (int64_t)serverType
{
  return 5;
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
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_serviceName(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_functionName(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("%@/%@"), v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = 0x1E7840F28;
  v14[1] = 0x1E7840C68;
  v15[0] = v10;
  v15[1] = CFSTR("application/protobuf");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)shouldCompressBody
{
  return 0;
}

- (BOOL)parsingStandaloneMessage
{
  return 1;
}

- (BOOL)wantsProtocolTranslator
{
  return 1;
}

- (id)requestBodyStream
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  int v70;
  const char *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  const char *v83;
  void *v84;

  v4 = (void *)objc_opt_new();
  objc_msgSend_functionName(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFunctionName_(v4, v8, (uint64_t)v7);

  objc_msgSend_serializedParameters(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSerializedParameters_(v4, v12, (uint64_t)v11);

  objc_msgSend_setSerializationFormat_(v4, v13, 1);
  objc_msgSend_container(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  if (objc_msgSend_allowsAuthedAccount(self, v18, v19)
    && (objc_msgSend_sendRequestAnonymously(self, v20, v21) & 1) == 0)
  {
    objc_msgSend_containerScopedUserID(v16, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserId_(v17, v23, (uint64_t)v22);

  }
  objc_msgSend_containerID(v16, v20, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContainerName_(v17, v28, (uint64_t)v27);

  objc_msgSend_containerID(v16, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_environment(v31, v32, v33);

  objc_msgSend_setDatabaseEnvironment_(v17, v35, v34 == 1);
  objc_msgSend_hardwareID(v16, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeviceId_(v17, v39, (uint64_t)v38);

  switch(objc_msgSend_databaseScope(self, v40, v41))
  {
    case 1:
      objc_msgSend_setDatabaseType_(v17, v42, 1);
      break;
    case 2:
      objc_msgSend_setDatabaseType_(v17, v42, 0);
      break;
    case 3:
      objc_msgSend_setDatabaseType_(v17, v42, 2);
      break;
    case 4:
      objc_msgSend_setDatabaseType_(v17, v42, 3);
      break;
    default:
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, self, CFSTR("CKDCodeLocalFunctionInvokeURLRequest.m"), 127, CFSTR("Invalid database environment for local code request"));

      break;
  }
  v46 = (void *)objc_opt_new();
  objc_msgSend_operation(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationId_(v46, v53, (uint64_t)v52);

  objc_msgSend_operationGroupID(v49, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationGroupId_(v46, v57, (uint64_t)v56);

  objc_msgSend_operationGroupName(v49, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationGroupName_(v46, v61, (uint64_t)v60);

  objc_msgSend_operationGroupQuantityNumber(v49, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend_operationGroupQuantityNumber(v49, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend_intValue(v67, v68, v69);
    objc_msgSend_setOperationGroupQuantity_(v46, v71, v70);

  }
  objc_msgSend_setOperationGroup_(v17, v65, (uint64_t)v46);
  objc_msgSend_setRequestContext_(v4, v72, (uint64_t)v17);
  objc_msgSend_data(v4, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shared(CKDTrafficLogger, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestUUID(self, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logPartialRequestObjectDataWithRequestUUID_objectData_completionHandler_(v78, v82, (uint64_t)v81, v75, &unk_1E7832250);

  objc_msgSend_inputStreamWithData_(MEMORY[0x1E0C99DB0], v83, (uint64_t)v75);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  return v84;
}

- (Class)requestMessageClass
{
  return (Class)objc_opt_class();
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  objc_msgSend_serializedResultsCallback(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_serializedResultsCallback(self, v8, v9);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_serializedResult(v4, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v10)[2](v10, v13, v16);

  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  objc_msgSend_serializedResultsCallback(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v10 = (id)objc_opt_new();
    objc_msgSend_setCode_(v10, v5, 3);
    objc_msgSend_setMessage_(v10, v6, (uint64_t)CFSTR("Failed to parse node"));
    objc_msgSend_serializedResultsCallback(self, v7, v8);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v10);

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

- (NSURL)resolvedBaseURL
{
  return self->_resolvedBaseURL;
}

- (void)setResolvedBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedBaseURL, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_serializedResultsCallback, 0);
}

@end
