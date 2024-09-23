@implementation CKDReplaceMergeableDeltasURLRequest

- (CKDReplaceMergeableDeltasURLRequest)initWithOperation:(id)a3 replaceDeltasRequests:(id)a4 ignoreMissingDeltas:(BOOL)a5
{
  id v9;
  CKDReplaceMergeableDeltasURLRequest *v10;
  CKDReplaceMergeableDeltasURLRequest *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *replacementRequestsByRequestID;
  objc_super v17;

  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKDReplaceMergeableDeltasURLRequest;
  v10 = -[CKDURLRequest initWithOperation:](&v17, sel_initWithOperation_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_replaceDeltasRequests, a4);
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    replacementRequestsByRequestID = v11->_replacementRequestsByRequestID;
    v11->_replacementRequestsByRequestID = (NSMutableDictionary *)v14;

    v11->_ignoreMissingDeltas = a5;
  }

  return v11;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKDReplaceMergeableDeltasURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v15, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_replaceDeltasRequests(self, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("requests"));
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  objc_super v12;

  v4 = a3;
  objc_msgSend_replaceDeltasRequests(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)&unk_1E7837D88);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setModifyMergeableValueIDs_(v4, v10, (uint64_t)v9);
  objc_msgSend_setDeleteMergeableValueIDs_(v4, v11, (uint64_t)v9);
  v12.receiver = self;
  v12.super_class = (Class)CKDReplaceMergeableDeltasURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v12, sel_fillOutRequestProperties_, v4);

}

- (BOOL)allowsAnonymousAccount
{
  uint64_t v2;

  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)zoneIDsToLock
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend_replaceDeltasRequests(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1E7837DC8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v3, v9, (uint64_t)v8);

  objc_msgSend_allObjects(v3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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

- (int)isolationLevel
{
  return 2;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (id)anonymousUserIDForHTTPHeader
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_zoneIDsToLock(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anonymousCKUserID(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)generateRequestOperations
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  id v36;

  v3 = (void *)objc_opt_class();
  objc_msgSend_replaceDeltasRequests(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_ignoreMissingDeltas(self, v7, v8);
  v36 = 0;
  objc_msgSend_requestOperationsForRequest_replaceDeltasRequests_ignoreMissingDeltas_error_(v3, v10, (uint64_t)self, v6, v9, &v36);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v36;

  if (!v11)
    objc_msgSend_finishWithError_(self, v13, (uint64_t)v12);
  if (objc_msgSend_count(v11, v13, v14))
  {
    v17 = 0;
    do
    {
      objc_msgSend_replaceDeltasRequests(self, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v18, v19, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectAtIndexedSubscript_(v11, v21, v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_replacementRequestsByRequestID(self, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_request(v22, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationUUID(v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v25, v32, (uint64_t)v20, v31);

      ++v17;
    }
    while (v17 < objc_msgSend_count(v11, v33, v34));
  }

  return v11;
}

+ (id)requestOperationsForRequest:(id)a3 replaceDeltasRequests:(id)a4 ignoreMissingDeltas:(BOOL)a5 error:(id *)a6
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
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
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  id v81;
  const char *v82;
  const char *v83;
  const char *v84;
  void *v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  id *v101;
  id obj;
  void *v103;
  uint64_t v104;
  _BOOL4 v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint8_t buf[4];
  id v119;
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v105 = a5;
  v122 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = v9;
  v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v114, v121, 16);
  if (!v106)
  {
    v81 = 0;
    goto LABEL_32;
  }
  v101 = a6;
  v103 = v12;
  v104 = *(_QWORD *)v115;
  while (2)
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v115 != v104)
        objc_enumerationMutation(obj);
      v107 = v15;
      v16 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v15);
      objc_msgSend_operationRequestWithType_(v8, v14, 313);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v17;
      if (objc_msgSend_requiresCKAnonymousUserIDs(v8, v18, v19))
      {
        objc_msgSend_valueID(v16, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousCKUserID(v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v45 = (void *)objc_opt_new();
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v87, (uint64_t)CFSTR("An anonymousCKUserID is required to replace deltas for %@ when using anonymous to server share participants"), v16);
          v88 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v45, v89, v88, *MEMORY[0x1E0CB2D50]);
          objc_msgSend_operation(v8, v90, v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_topmostParentOperation(v92, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_operationID(v95, v96, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          if (v98)
            objc_msgSend_setObject_forKeyedSubscript_(v45, v99, (uint64_t)v98, *MEMORY[0x1E0C947F8]);
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v99, *MEMORY[0x1E0C94B20], 5015, v45);
          v81 = (id)objc_claimAutoreleasedReturnValue();

          v85 = (void *)v88;
          v17 = v108;
LABEL_30:

          v12 = 0;
          goto LABEL_31;
        }
        objc_msgSend_valueID(v16, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousCKUserID(v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKDPIdentifier_User(v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v17, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAnonymousCKUserID_(v43, v44, (uint64_t)v40);

      }
      v45 = (void *)objc_opt_new();
      objc_msgSend_translator(v8, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueID(v16, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pMergeableValueIdentifierFromMergeableValueID_(v48, v52, (uint64_t)v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setIdentifier_(v45, v54, (uint64_t)v53);

      objc_msgSend_deltaIdentifiersToReplace(v16, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend_mutableCopy(v57, v58, v59);
      objc_msgSend_setDeltaIdentifiers_(v45, v61, (uint64_t)v60);

      objc_msgSend_setIgnoreMissingDeltas_(v45, v62, v105);
      v65 = objc_msgSend_replacementDeltasContainNewData(v16, v63, v64);
      objc_msgSend_setContainsNewData_(v45, v66, v65);
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      objc_msgSend_replacementDeltas(v16, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v110, v120, 16);
      if (v71)
      {
        v74 = v71;
        v75 = *(_QWORD *)v111;
LABEL_11:
        v76 = 0;
        while (1)
        {
          if (*(_QWORD *)v111 != v75)
            objc_enumerationMutation(v69);
          v77 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v76);
          objc_msgSend_translator(v8, v72, v73);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = 0;
          objc_msgSend_pMergeableDeltaFromDelta_error_(v78, v79, v77, &v109);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v109;

          if (!v80)
            break;
          objc_msgSend_addDeltas_(v45, v82, (uint64_t)v80);

          if (v74 == ++v76)
          {
            v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v72, (uint64_t)&v110, v120, 16);
            v17 = v108;
            if (v74)
              goto LABEL_11;
            goto LABEL_17;
          }
        }

        v17 = v108;
        if (!v81)
          goto LABEL_19;
        v85 = v103;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v86 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v119 = v81;
          _os_log_fault_impl(&dword_1BE990000, v86, OS_LOG_TYPE_FAULT, "Error creating mergeable delta proto for replacement request: %@", buf, 0xCu);
        }
        goto LABEL_30;
      }
LABEL_17:

LABEL_19:
      objc_msgSend_setMergeableDeltaReplaceRequest_(v17, v83, (uint64_t)v45);
      v12 = v103;
      objc_msgSend_addObject_(v103, v84, (uint64_t)v17);

      v15 = v107 + 1;
    }
    while (v107 + 1 != v106);
    v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v114, v121, 16);
    if (v106)
      continue;
    break;
  }
  v81 = 0;
LABEL_31:
  a6 = v101;
LABEL_32:

  if (a6)
    *a6 = objc_retainAutorelease(v81);

  return v12;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v5;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  char hasMergeableDeltaReplaceResponse;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_replacementRequestsByRequestID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, self, CFSTR("CKDReplaceMergeableDeltasURLRequest.m"), 176, CFSTR("Expected non-nil replacement request for response: %@"), v5);

  }
  hasMergeableDeltaReplaceResponse = objc_msgSend_hasMergeableDeltaReplaceResponse(v5, v17, v18);
  v20 = (void *)*MEMORY[0x1E0C952F8];
  if ((hasMergeableDeltaReplaceResponse & 1) != 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v20);
    v21 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
    {
      v33 = v21;
      objc_msgSend_requestUUID(self, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v36;
      v45 = 2112;
      v46 = v16;
      _os_log_debug_impl(&dword_1BE990000, v33, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Received response for request %@\", buf, 0x16u);

    }
    objc_msgSend_perReplacementCompletionBlock(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend_perReplacementCompletionBlock(self, v25, v26);
      v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v27)[2](v27, v16, v30);

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v20);
    v31 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      v37 = v31;
      objc_msgSend_requestUUID(self, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v44 = v40;
      _os_log_fault_impl(&dword_1BE990000, v37, OS_LOG_TYPE_FAULT, "No mergeableDeltaReplaceResponse for mergeableDeltaReplaceRequest in request UUID %@", buf, 0xCu);

    }
  }

  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v5;
  void *v6;
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
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  const char *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
  {
    v27 = v6;
    objc_msgSend_requestUUID(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v30;
    v35 = 2112;
    v36 = v5;
    _os_log_error_impl(&dword_1BE990000, v27, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Node failure in replace deltas request: %@\", buf, 0x16u);

  }
  objc_msgSend_replacementRequestsByRequestID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, CFSTR("CKDReplaceMergeableDeltasURLRequest.m"), 194, CFSTR("Expected non-nil replacement request for response: %@"), v5);

  }
  objc_msgSend_perReplacementCompletionBlock(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_perReplacementCompletionBlock(self, v21, v22);
    v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v23)[2](v23, v17, v26);

  }
}

- (NSArray)replaceDeltasRequests
{
  return self->_replaceDeltasRequests;
}

- (void)setReplaceDeltasRequests:(id)a3
{
  objc_storeStrong((id *)&self->_replaceDeltasRequests, a3);
}

- (id)perReplacementCompletionBlock
{
  return self->_perReplacementCompletionBlock;
}

- (void)setPerReplacementCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSMutableDictionary)replacementRequestsByRequestID
{
  return self->_replacementRequestsByRequestID;
}

- (void)setReplacementRequestsByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_replacementRequestsByRequestID, a3);
}

- (BOOL)ignoreMissingDeltas
{
  return self->_ignoreMissingDeltas;
}

- (void)setIgnoreMissingDeltas:(BOOL)a3
{
  self->_ignoreMissingDeltas = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementRequestsByRequestID, 0);
  objc_storeStrong(&self->_perReplacementCompletionBlock, 0);
  objc_storeStrong((id *)&self->_replaceDeltasRequests, 0);
}

@end
