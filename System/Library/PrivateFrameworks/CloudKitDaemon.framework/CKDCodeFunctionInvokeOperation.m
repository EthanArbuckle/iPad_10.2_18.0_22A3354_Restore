@implementation CKDCodeFunctionInvokeOperation

- (CKDCodeFunctionInvokeOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CKDCodeFunctionInvokeOperation *v10;
  uint64_t v11;
  NSString *serviceName;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *functionName;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *requestLocalSerializations;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *requestLocalEnvelopes;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSData *permittedRemoteMeasurement;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSString *trustedTargetDomain;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSString *trustedTargetOID;
  const char *v39;
  uint64_t v40;
  int shouldSendRecordPCSKeys;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  int v52;
  void *v53;
  NSData *serializedResponse;
  PCCKey *pccKey;
  NSArray *pccWrappedKeys;
  NSData *attestationEntropy;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  objc_super v63;
  uint8_t buf[4];
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v63.receiver = self;
  v63.super_class = (Class)CKDCodeFunctionInvokeOperation;
  v10 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v63, sel_initWithOperationInfo_container_, v6, v7);
  if (v10)
  {
    objc_msgSend_serviceName(v6, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    serviceName = v10->_serviceName;
    v10->_serviceName = (NSString *)v11;

    objc_msgSend_functionName(v6, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    functionName = v10->_functionName;
    v10->_functionName = (NSString *)v15;

    objc_msgSend_requestLocalSerializations(v6, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    requestLocalSerializations = v10->_requestLocalSerializations;
    v10->_requestLocalSerializations = (NSArray *)v19;

    objc_msgSend_requestLocalEnvelopes(v6, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    requestLocalEnvelopes = v10->_requestLocalEnvelopes;
    v10->_requestLocalEnvelopes = (NSArray *)v23;

    v10->_dataProtectionType = objc_msgSend_dataProtectionType(v6, v25, v26);
    objc_msgSend_permittedRemoteMeasurement(v6, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    permittedRemoteMeasurement = v10->_permittedRemoteMeasurement;
    v10->_permittedRemoteMeasurement = (NSData *)v29;

    objc_msgSend_trustedTargetDomain(v6, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    trustedTargetDomain = v10->_trustedTargetDomain;
    v10->_trustedTargetDomain = (NSString *)v33;

    objc_msgSend_trustedTargetOID(v6, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    trustedTargetOID = v10->_trustedTargetOID;
    v10->_trustedTargetOID = (NSString *)v37;

    shouldSendRecordPCSKeys = objc_msgSend_shouldSendRecordPCSKeys(v6, v39, v40);
    v10->_shouldSendRecordPCSKeys = shouldSendRecordPCSKeys;
    if (shouldSendRecordPCSKeys)
    {
      objc_msgSend_deviceContext(v10, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountDataSecurityObserver(v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_account(v7, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v47, v51, (uint64_t)v50, 1);

      if (v52)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v53 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v59 = v53;
          objc_msgSend_operationID(v6, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v65 = v62;
          _os_log_debug_impl(&dword_1BE990000, v59, OS_LOG_TYPE_DEBUG, "Overriding shouldSendRecordPCSKeys to NO due to walrus enabled for operation %@", buf, 0xCu);

        }
        v10->_shouldSendRecordPCSKeys = 0;
      }
    }
    v10->_shouldFetchAssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(v6, v42, v43);
    serializedResponse = v10->_serializedResponse;
    v10->_serializedResponse = 0;

    pccKey = v10->_pccKey;
    v10->_pccKey = 0;

    pccWrappedKeys = v10->_pccWrappedKeys;
    v10->_pccWrappedKeys = 0;

    attestationEntropy = v10->_attestationEntropy;
    v10->_attestationEntropy = 0;

  }
  return v10;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/ckcode-function-invoke", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (int)operationType
{
  return 1101;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__checkShouldSendRecordPCSKeys(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__preflightRecords(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__getSerializedRequest(self, v9, v10);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend_resolvedBaseURL(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend__invokeLocalFunction(self, v14, v15);
      else
        objc_msgSend__invokeFunction(self, v14, v15);
      break;
    case 5:
      objc_msgSend_setState_(self, v4, 6);
      objc_msgSend__getDeserializedRecords(self, v16, v17);
      break;
    case 6:
      objc_msgSend_setState_(self, v4, 7);
      objc_msgSend__postflightRecords(self, v18, v19);
      break;
    case 7:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v23, (uint64_t)v22);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 6)
    return off_1E7835F00[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDCodeFunctionInvokeOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)encryptData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v7 = objc_msgSend_dataProtectionType(self, v5, v6);
  if (v7 == 2)
  {
    objc_msgSend_trustedTargetKey(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7 != 1)
    {
      v13 = 0;
      goto LABEL_7;
    }
    objc_msgSend_pccKey(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v10;
  objc_msgSend_encrypt_(v10, v11, (uint64_t)v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v13;
}

- (void)_preflightRecords
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  id v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  int isEqual;
  void *v37;
  NSObject *v38;
  void *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  void *v78;
  _BOOL4 v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  void *v84;
  const char *v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  void *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  id obj;
  void *v105;
  void *v106;
  _QWORD v107[4];
  id v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint8_t buf[4];
  void *v115;
  __int16 v116;
  void *v117;
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  objc_msgSend_requestLocalSerializations(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_count(v3, v4, v5);

  if (!v6)
    goto LABEL_19;
  v105 = (void *)objc_opt_new();
  v106 = (void *)objc_opt_new();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  objc_msgSend_requestLocalSerializations(self, v9, v10);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v110, v118, 16);
  if (!v12)
    goto LABEL_18;
  v13 = *(_QWORD *)v111;
  v102 = *MEMORY[0x1E0C94B20];
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v111 != v13)
        objc_enumerationMutation(obj);
      v15 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i);
      v16 = objc_alloc(MEMORY[0x1E0CB3710]);
      v109 = 0;
      v18 = (void *)objc_msgSend_initForReadingFromData_error_(v16, v17, v15, &v109);
      v20 = v109;
      if (!v18
        || (v21 = objc_alloc(MEMORY[0x1E0C95048]),
            (v23 = (void *)objc_msgSend_initWithCoder_(v21, v22, (uint64_t)v18)) == 0))
      {
        if (!v20)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v19, v102, 1017, CFSTR("Invalid record archive: %@"), v15);
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_setError_(self, v19, (uint64_t)v20);
        goto LABEL_43;
      }
      objc_msgSend_addObject_(v105, v19, (uint64_t)v23);
      objc_msgSend_recordID(v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v106, v27, (uint64_t)v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        objc_msgSend_recordID(v23, v29, v30);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v106, v40, (uint64_t)v23, v39);

        goto LABEL_16;
      }
      objc_msgSend_values(v23, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_values(v28, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v31, v35, (uint64_t)v34);

      v37 = (void *)*MEMORY[0x1E0C952F8];
      if (!isEqual)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v37);
        v86 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v115 = v28;
          v116 = 2112;
          v117 = v23;
          _os_log_error_impl(&dword_1BE990000, v86, OS_LOG_TYPE_ERROR, "Trying to save two RecordTransports for the same record: recordA=%@ recordB=%@", buf, 0x16u);
        }
        v89 = (void *)MEMORY[0x1E0C94FF8];
        objc_msgSend_recordID(v23, v87, v88);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v89, v91, v102, 1017, CFSTR("Cannot send two records for the same record ID in the same request: %@"), v90);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(self, v93, (uint64_t)v92);

LABEL_43:
        return;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v37);
      v38 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v115 = v23;
        _os_log_debug_impl(&dword_1BE990000, v38, OS_LOG_TYPE_DEBUG, "Coalescing identical request record: %@", buf, 0xCu);
      }
LABEL_16:

    }
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v110, v118, 16);
    if (v12)
      continue;
    break;
  }
LABEL_18:

  objc_msgSend_setRequestRecords_(self, v42, (uint64_t)v105);
  v43 = (void *)objc_opt_new();
  objc_msgSend_allValues(v106, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordsToSave_(v43, v47, (uint64_t)v46);

  objc_msgSend_setShouldModifyRecordsInDatabase_(v43, v48, 0);
  objc_msgSend_setAlwaysFetchPCSFromServer_(v43, v49, 1);
  objc_initWeak((id *)buf, self);
  v50 = objc_opt_class();
  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = sub_1BEB97CF4;
  v107[3] = &unk_1E7835D38;
  objc_copyWeak(&v108, (id *)buf);
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v51, v50, v43, v107);
  objc_destroyWeak(&v108);
  objc_destroyWeak((id *)buf);

LABEL_19:
  objc_msgSend_requestLocalEnvelopes(self, v7, v8);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend_count(v52, v53, v54);

  if (!v55)
    goto LABEL_31;
  v58 = objc_msgSend_dataProtectionType(self, v56, v57);
  switch(v58)
  {
    case 2:
      objc_msgSend_trustedTargetDomain(self, v56, v57);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (v67)
      {
        objc_msgSend_trustedTargetOID(self, v56, v57);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v68 == 0;

        if (!v69)
          goto LABEL_31;
      }
      v70 = (void *)MEMORY[0x1E0C94FF8];
      objc_msgSend_serviceName(self, v56, v57);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_functionName(self, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v70, v75, *MEMORY[0x1E0C94B20], 1017, CFSTR("Request with protected envelopes and trusted target data protection type must have target domain and OID: %@.%@"), v71, v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(self, v77, (uint64_t)v76);

      break;
    case 1:
      objc_msgSend_permittedRemoteMeasurement(self, v56, v57);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v78 == 0;

      if (!v79)
        goto LABEL_31;
      v94 = (void *)MEMORY[0x1E0C94FF8];
      objc_msgSend_serviceName(self, v56, v57);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_functionName(self, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v94, v99, *MEMORY[0x1E0C94B20], 1017, CFSTR("Request with protected envelopes and SGX data protection type must have a permittedRemoteMeasurement: %@.%@"), v95, v98);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(self, v101, (uint64_t)v100);

      break;
    case 0:
      v59 = (void *)MEMORY[0x1E0C94FF8];
      objc_msgSend_serviceName(self, v56, v57);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_functionName(self, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v59, v64, *MEMORY[0x1E0C94B20], 1017, CFSTR("Request has protected envelopes, but no data protection type: %@.%@"), v60, v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(self, v66, (uint64_t)v65);

      return;
    default:
LABEL_31:
      v80 = objc_msgSend_dataProtectionType(self, v56, v57);
      switch(v80)
      {
        case 2:
          objc_msgSend__prepareForTrustedTargetEncryption(self, v81, v82);
          break;
        case 1:
          objc_msgSend__prepareForProtectedCloudCompute(self, v81, v82);
          break;
        case 0:
          if (objc_msgSend_shouldSendRecordPCSKeys(self, v81, v82))
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v83, *MEMORY[0x1E0C94B20], 1017, CFSTR("Cannot set shouldSendRecordPCSKeys without data protection. Please specify a dataProtectionType on your operation."));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setError_(self, v85, (uint64_t)v84);

          }
          break;
      }
      break;
  }
}

- (void)_prepareForProtectedCloudCompute
{
  uint64_t v2;
  void *v4;
  NSObject *v5;
  const char *v6;
  PCCKey *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  _QWORD v25[4];
  id v26;
  id buf[2];

  objc_msgSend_resolvedBaseURL(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v5 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      v6 = "Not preparing for PCC because we have a base URL";
LABEL_6:
      _os_log_debug_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    v7 = objc_alloc_init(PCCKey);
    objc_msgSend_setPccKey_(self, v8, (uint64_t)v7);

    if (*MEMORY[0x1E0C95280]
      && (objc_msgSend_unitTestOverrides(self, v9, v10),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("SkipAttestation")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend_BOOLValue(v13, v14, v15),
          v13,
          v11,
          v16))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v5 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        v6 = "Skipping PCC attestation because we were asked to";
        goto LABEL_6;
      }
    }
    else
    {
      v17 = (void *)objc_opt_new();
      objc_msgSend_serviceName(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setServiceName_(v17, v21, (uint64_t)v20);

      objc_msgSend_setFunctionName_(v17, v22, 0);
      objc_initWeak(buf, self);
      v23 = objc_opt_class();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_1BEB98184;
      v25[3] = &unk_1E7835D38;
      objc_copyWeak(&v26, buf);
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v24, v23, v17, v25);
      objc_destroyWeak(&v26);
      objc_destroyWeak(buf);

    }
  }
}

- (void)_prepareForTrustedTargetEncryption
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  CKDTrustedTargetKey *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[5];
  id v15;
  id location[2];

  if (objc_msgSend_shouldSendRecordPCSKeys(self, a2, v2))
  {
    objc_msgSend_stateTransitionGroup(self, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v6);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v7 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_1BE990000, v7, OS_LOG_TYPE_DEBUG, "About to fetch public key for trusted target encryption", (uint8_t *)location, 2u);
    }
    v8 = objc_alloc_init(CKDTrustedTargetKey);
    objc_msgSend_setTrustedTargetKey_(self, v9, (uint64_t)v8);

    objc_initWeak(location, self);
    v10 = (void *)objc_opt_new();
    objc_msgSend_setType_(v10, v11, 1);
    v12 = objc_opt_class();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1BEB989B4;
    v14[3] = &unk_1E7835DC8;
    objc_copyWeak(&v15, location);
    v14[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v13, v12, v10, v14);
    objc_destroyWeak(&v15);

    objc_destroyWeak(location);
  }
}

- (void)_checkShouldSendRecordPCSKeys
{
  uint64_t v2;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  _QWORD v17[5];
  uint8_t buf[16];

  if (objc_msgSend_shouldSendRecordPCSKeys(self, a2, v2))
  {
    v4 = (_QWORD *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v5 = (os_log_t *)MEMORY[0x1E0C952B0];
    v6 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v6, OS_LOG_TYPE_DEBUG, "Adopter set shouldSendRecordPCSKeys. Checking if we should actually do that.", buf, 2u);
    }
    if (objc_msgSend_dataProtectionType(self, v7, v8) == 2)
    {
      if (*v4 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE990000, v9, OS_LOG_TYPE_DEBUG, "Will check server configuration to see if we should send the record keys", buf, 2u);
      }
      objc_msgSend_stateTransitionGroup(self, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v12);

      objc_msgSend_sharedManager(CKDServerConfigurationManager, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = sub_1BEB98E7C;
      v17[3] = &unk_1E7830560;
      v17[4] = self;
      objc_msgSend_configurationForOperation_completionHandler_(v15, v16, (uint64_t)self, v17);

    }
  }
}

- (void)_getSerializedRequest
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  CKDProtocolTranslator *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  NSObject *v53;
  dispatch_group_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  NSObject *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  _QWORD block[5];
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  NSObject *v75;
  CKDCodeFunctionInvokeOperation *v76;
  id v77;
  uint8_t buf[16];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (objc_msgSend_shouldSendRecordPCSKeys(self, v4, v5))
    v69 = (void *)objc_opt_new();
  else
    v69 = 0;
  objc_msgSend_requestLocalEnvelopes(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v8, v9, v10);

  v14 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    objc_msgSend_requestLocalEnvelopes(self, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v14;
    v83[1] = 3221225472;
    v83[2] = sub_1BEB995D0;
    v83[3] = &unk_1E7835DF0;
    v83[4] = self;
    objc_msgSend_CKMap_(v15, v16, (uint64_t)v83);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend_requestRecords(self, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_count(v18, v19, v20);

  if (v21)
  {
    v68 = v17;
    v24 = [CKDProtocolTranslator alloc];
    objc_msgSend_container(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_databaseScope(self, v28, v29);
    v32 = (void *)objc_msgSend_initWithContainer_databaseScope_(v24, v31, (uint64_t)v27, v30);

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend_requestRecords(self, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v79, v84, 16);
    if (v37)
    {
      v39 = v37;
      v40 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v80 != v40)
            objc_enumerationMutation(v35);
          objc_msgSend_pRecordFromRecord_(v32, v38, *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_data(v42, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v3, v46, (uint64_t)v45);
          if (objc_msgSend_shouldSendRecordPCSKeys(self, v47, v48))
          {
            objc_msgSend_null(MEMORY[0x1E0C99E38], v49, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v69, v52, (uint64_t)v51);

          }
        }
        v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v79, v84, 16);
      }
      while (v39);
    }

    v14 = MEMORY[0x1E0C809B0];
    v17 = v68;
  }
  objc_msgSend_stateTransitionGroup(self, v22, v23);
  v53 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v53);

  v54 = dispatch_group_create();
  if (objc_msgSend_shouldSendRecordPCSKeys(self, v55, v56))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v59 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v59, OS_LOG_TYPE_DEBUG, "About to fetch PCS data for secure compute operation", buf, 2u);
    }
    objc_msgSend_requestRecords(self, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v14;
    v74[1] = 3221225472;
    v74[2] = sub_1BEB995DC;
    v74[3] = &unk_1E7835E40;
    v75 = v54;
    v76 = self;
    v77 = v69;
    objc_msgSend_enumerateObjectsUsingBlock_(v62, v63, (uint64_t)v74);

  }
  objc_msgSend_callbackQueue(self, v57, v58);
  v64 = objc_claimAutoreleasedReturnValue();
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = sub_1BEB99BBC;
  block[3] = &unk_1E782F4A8;
  block[4] = self;
  v71 = v3;
  v72 = v69;
  v73 = v17;
  v65 = v17;
  v66 = v69;
  v67 = v3;
  dispatch_group_notify(v54, v64, block);

}

- (void)_invokeFunction
{
  uint64_t v2;
  NSObject *v4;
  CKDCodeFunctionInvokeURLRequest *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint8_t buf[16];
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id from;
  id location;

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  v5 = [CKDCodeFunctionInvokeURLRequest alloc];
  objc_msgSend_serviceName(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_functionName(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serializedArguments(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attestationEntropy(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pccWrappedKeys(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trustedTargetWrappedKey(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_initWithOperation_serviceName_functionName_serializedParameters_attestationEntropy_pccWrappedInvocationKeys_trustedTargetWrappedInvocationKey_(v5, v24, (uint64_t)self, v8, v11, v14, v17, v20, v23);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v25);
  v26 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1BEB99FA8;
  v39[3] = &unk_1E7835E90;
  objc_copyWeak(&v40, &location);
  objc_copyWeak(&v41, &from);
  objc_msgSend_setSerializedResultsCallback_(v25, v27, (uint64_t)v39);
  v36[0] = v26;
  v36[1] = 3221225472;
  v36[2] = sub_1BEB9A2D4;
  v36[3] = &unk_1E782E468;
  objc_copyWeak(&v37, &location);
  objc_copyWeak(&v38, &from);
  objc_msgSend_setCompletionBlock_(v25, v28, (uint64_t)v36);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v29 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v29, OS_LOG_TYPE_INFO, "Invoking CKCode function", buf, 2u);
  }
  objc_msgSend_setRequest_(self, v30, (uint64_t)v25);
  objc_msgSend_container(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v33, v34, (uint64_t)v25);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)_invokeLocalFunction
{
  uint64_t v2;
  NSObject *v4;
  CKDCodeLocalFunctionInvokeURLRequest *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint8_t v29[16];
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id from;
  id location;

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  v5 = [CKDCodeLocalFunctionInvokeURLRequest alloc];
  objc_msgSend_serviceName(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_functionName(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serializedArguments(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedBaseURL(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithOperation_serviceName_functionName_serializedParameters_resolvedBaseURL_(v5, v18, (uint64_t)self, v8, v11, v14, v17);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v19);
  v20 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1BEB9A6F0;
  v33[3] = &unk_1E7835EB8;
  objc_copyWeak(&v34, &location);
  objc_copyWeak(&v35, &from);
  objc_msgSend_setSerializedResultsCallback_(v19, v21, (uint64_t)v33);
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = sub_1BEB9AD00;
  v30[3] = &unk_1E782E468;
  objc_copyWeak(&v31, &location);
  objc_copyWeak(&v32, &from);
  objc_msgSend_setCompletionBlock_(v19, v22, (uint64_t)v30);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v23 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_1BE990000, v23, OS_LOG_TYPE_INFO, "Invoking CKCode function", v29, 2u);
  }
  objc_msgSend_setRequest_(self, v24, (uint64_t)v19);
  objc_msgSend_container(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v27, v28, (uint64_t)v19);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)_getDeserializedRecords
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  v3 = (void *)objc_opt_new();
  objc_msgSend_stateTransitionGroup(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v6);

  objc_initWeak(&location, self);
  objc_msgSend_initialResponseReceivedCallback(self, v7, v8);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend_serializedResponse(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEB9AFA0;
  v14[3] = &unk_1E7835EE0;
  objc_copyWeak(&v16, &location);
  v14[4] = self;
  v13 = v3;
  v15 = v13;
  ((void (**)(_QWORD, void *, _QWORD *))v9)[2](v9, v12, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_postflightRecords
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t AssetContentInMemory;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  _QWORD v21[5];
  id v22;

  objc_msgSend_responseRecords(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    objc_msgSend_stateTransitionGroup(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);

    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    objc_msgSend_setShouldFetchAssetContent_(v12, v13, 1);
    AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v14, v15);
    objc_msgSend_setShouldFetchAssetContentInMemory_(v12, v17, AssetContentInMemory);
    v18 = objc_opt_class();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1BEB9B2CC;
    v21[3] = &unk_1E782E558;
    v21[4] = self;
    v22 = v11;
    v19 = v11;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v20, v18, v12, v21);

  }
}

+ (int64_t)isPredominatelyDownload
{
  return -1;
}

- (void)main
{
  void *v3;
  const char *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  CKDCodeFunctionInvokeOperation *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v8, 1, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v13, 0, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v7;
    v20 = 2048;
    v21 = self;
    v22 = 2114;
    v23 = v12;
    v24 = 2112;
    v25 = v17;
    _os_log_debug_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEBUG, "Starting CKCode function invoke operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v18,
      0x2Au);

  }
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

+ (id)URLFromEntitlementString:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend_hasPrefix_(v3, v4, (uint64_t)CFSTR("http")) & 1) == 0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("http://%@"), v3);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }
  objc_msgSend_componentsWithString_(MEMORY[0x1E0CB3998], v5, (uint64_t)v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyDefaultParametersToServiceURLComponents_(MEMORY[0x1E0C94C10], v8, (uint64_t)v7);
  objc_msgSend_URL(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v3;
      _os_log_error_impl(&dword_1BE990000, v12, OS_LOG_TYPE_ERROR, "Couldn't generate URL from entitlement string %{public}@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)entitlementURLForServiceName:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  objc_msgSend_entitlements(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_codeServiceURLByContainerAndServiceEntitlement(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v7, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v20, (uint64_t)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    goto LABEL_4;
  objc_msgSend_entitlements(v7, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_codeServiceURLByServiceEntitlement(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23
    || (objc_msgSend_entitlements(v7, v24, v31),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_codeServiceURLEntitlement(v32, v33, v34),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v32,
        v23))
  {
LABEL_4:
    objc_msgSend_URLFromEntitlementString_(a1, v24, (uint64_t)v23);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char hasExplicitCodeOperationURLEntitlement;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  BOOL v23;
  int IsLocalBit;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  objc_super v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CKDCodeFunctionInvokeOperation;
  if (-[CKDOperation validateAgainstLiveContainer:error:](&v41, sel_validateAgainstLiveContainer_error_, v6, a4))
  {
    objc_msgSend_operationInfo(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientRuntimeProvidedServiceURL(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      IsLocalBit = objc_msgSend_legacyIsLocalBit(v9, v13, v14);
      v25 = (void *)objc_opt_class();
      v28 = v25;
      if (!IsLocalBit)
      {
        objc_msgSend_serviceName(self, v26, v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_entitlementURLForServiceName_container_(v28, v33, (uint64_t)v32, v6);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setResolvedBaseURL_(self, v35, (uint64_t)v34);

        goto LABEL_15;
      }
      objc_msgSend_URLFromEntitlementString_(v25, v26, (uint64_t)CFSTR("http://127.0.0.1:31234"));
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v29 = (void *)v21;
      objc_msgSend_setResolvedBaseURL_(self, v22, v21);

LABEL_15:
      v23 = 1;
      goto LABEL_16;
    }
    objc_msgSend_entitlements(v6, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    hasExplicitCodeOperationURLEntitlement = objc_msgSend_hasExplicitCodeOperationURLEntitlement(v15, v16, v17);

    if ((hasExplicitCodeOperationURLEntitlement & 1) != 0)
    {
      objc_msgSend_clientRuntimeProvidedServiceURL(v9, v19, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v30 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v37 = v30;
      objc_msgSend_clientRuntimeProvidedServiceURL(v9, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v40;
      _os_log_error_impl(&dword_1BE990000, v37, OS_LOG_TYPE_ERROR, "Un-entitled client is not allowed to set explicit code operation url of %{public}@", buf, 0xCu);

      if (a4)
        goto LABEL_13;
    }
    else if (a4)
    {
LABEL_13:
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v31, *MEMORY[0x1E0C94B20], 1017, CFSTR("Process not entitled to set explicit code operation url"));
      v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
    v23 = 0;
    goto LABEL_16;
  }
  v23 = 0;
LABEL_17:

  return v23;
}

- (id)replaceLocalSerializationsBlobs
{
  return self->_replaceLocalSerializationsBlobs;
}

- (void)setReplaceLocalSerializationsBlobs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (id)initialResponseReceivedCallback
{
  return self->_initialResponseReceivedCallback;
}

- (void)setInitialResponseReceivedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (id)replaceWireSerializations
{
  return self->_replaceWireSerializations;
}

- (void)setReplaceWireSerializations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (id)recordFetchCompletionBlock
{
  return self->_recordFetchCompletionBlock;
}

- (void)setRecordFetchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (id)recordFetchProgressBlock
{
  return self->_recordFetchProgressBlock;
}

- (void)setRecordFetchProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (id)recordFetchCommandBlock
{
  return self->_recordFetchCommandBlock;
}

- (void)setRecordFetchCommandBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (PCCKey)pccKey
{
  return self->_pccKey;
}

- (void)setPccKey:(id)a3
{
  objc_storeStrong((id *)&self->_pccKey, a3);
}

- (NSArray)pccWrappedKeys
{
  return self->_pccWrappedKeys;
}

- (void)setPccWrappedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_pccWrappedKeys, a3);
}

- (NSData)attestationEntropy
{
  return self->_attestationEntropy;
}

- (void)setAttestationEntropy:(id)a3
{
  objc_storeStrong((id *)&self->_attestationEntropy, a3);
}

- (NSArray)requestLocalSerializations
{
  return self->_requestLocalSerializations;
}

- (void)setRequestLocalSerializations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSArray)requestLocalEnvelopes
{
  return self->_requestLocalEnvelopes;
}

- (void)setRequestLocalEnvelopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (unint64_t)dataProtectionType
{
  return self->_dataProtectionType;
}

- (void)setDataProtectionType:(unint64_t)a3
{
  self->_dataProtectionType = a3;
}

- (NSData)permittedRemoteMeasurement
{
  return self->_permittedRemoteMeasurement;
}

- (void)setPermittedRemoteMeasurement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (BOOL)shouldSendRecordPCSKeys
{
  return self->_shouldSendRecordPCSKeys;
}

- (void)setShouldSendRecordPCSKeys:(BOOL)a3
{
  self->_shouldSendRecordPCSKeys = a3;
}

- (NSString)trustedTargetDomain
{
  return self->_trustedTargetDomain;
}

- (void)setTrustedTargetDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (NSString)trustedTargetOID
{
  return self->_trustedTargetOID;
}

- (void)setTrustedTargetOID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (CKDTrustedTargetKey)trustedTargetKey
{
  return self->_trustedTargetKey;
}

- (void)setTrustedTargetKey:(id)a3
{
  objc_storeStrong((id *)&self->_trustedTargetKey, a3);
}

- (CKDTrustedTargetWrappedKey)trustedTargetWrappedKey
{
  return self->_trustedTargetWrappedKey;
}

- (void)setTrustedTargetWrappedKey:(id)a3
{
  objc_storeStrong((id *)&self->_trustedTargetWrappedKey, a3);
}

- (NSURL)resolvedBaseURL
{
  return self->_resolvedBaseURL;
}

- (void)setResolvedBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchAssetContentInMemory = a3;
}

- (NSArray)requestRecords
{
  return self->_requestRecords;
}

- (void)setRequestRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (NSData)serializedArguments
{
  return self->_serializedArguments;
}

- (void)setSerializedArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (NSData)serializedResponse
{
  return self->_serializedResponse;
}

- (void)setSerializedResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (NSArray)responseRecords
{
  return self->_responseRecords;
}

- (void)setResponseRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (CKDProtocolTranslator)translator
{
  return self->_translator;
}

- (void)setTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_translator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_responseRecords, 0);
  objc_storeStrong((id *)&self->_serializedResponse, 0);
  objc_storeStrong((id *)&self->_serializedArguments, 0);
  objc_storeStrong((id *)&self->_requestRecords, 0);
  objc_storeStrong((id *)&self->_resolvedBaseURL, 0);
  objc_storeStrong((id *)&self->_trustedTargetWrappedKey, 0);
  objc_storeStrong((id *)&self->_trustedTargetKey, 0);
  objc_storeStrong((id *)&self->_trustedTargetOID, 0);
  objc_storeStrong((id *)&self->_trustedTargetDomain, 0);
  objc_storeStrong((id *)&self->_permittedRemoteMeasurement, 0);
  objc_storeStrong((id *)&self->_requestLocalEnvelopes, 0);
  objc_storeStrong((id *)&self->_requestLocalSerializations, 0);
  objc_storeStrong((id *)&self->_attestationEntropy, 0);
  objc_storeStrong((id *)&self->_pccWrappedKeys, 0);
  objc_storeStrong((id *)&self->_pccKey, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_recordFetchCommandBlock, 0);
  objc_storeStrong(&self->_recordFetchProgressBlock, 0);
  objc_storeStrong(&self->_recordFetchCompletionBlock, 0);
  objc_storeStrong(&self->_replaceWireSerializations, 0);
  objc_storeStrong(&self->_initialResponseReceivedCallback, 0);
  objc_storeStrong(&self->_replaceLocalSerializationsBlobs, 0);
}

@end
