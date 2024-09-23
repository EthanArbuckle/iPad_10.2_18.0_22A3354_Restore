@implementation CKDFetchMergeableDeltaMetadataURLRequest

- (CKDFetchMergeableDeltaMetadataURLRequest)initWithOperation:(id)a3 mergeableValueIDs:(id)a4 continuationTokens:(id)a5
{
  id v9;
  id v10;
  CKDFetchMergeableDeltaMetadataURLRequest *v11;
  CKDFetchMergeableDeltaMetadataURLRequest *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *mergeableValueIDByRequestID;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CKDFetchMergeableDeltaMetadataURLRequest;
  v11 = -[CKDURLRequest initWithOperation:](&v18, sel_initWithOperation_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mergeableValueIDs, a4);
    objc_storeStrong((id *)&v12->_continuationTokens, a5);
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    mergeableValueIDByRequestID = v12->_mergeableValueIDByRequestID;
    v12->_mergeableValueIDByRequestID = (NSMutableDictionary *)v15;

  }
  return v12;
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
  v15.super_class = (Class)CKDFetchMergeableDeltaMetadataURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v15, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_mergeableValueIDs(self, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("mvIDs"));
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v4 = a3;
  objc_msgSend_mergeableValueIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFetchMergeableValueIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchMergeableDeltaMetadataURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v9, sel_fillOutRequestProperties_, v4);

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
  objc_msgSend_mergeableValueIDs(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1E7837928);
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
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  __objc2_class **p_superclass;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  CKDFetchMergeableDeltaMetadataURLRequest *v46;
  __objc2_class **v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  const char *v65;
  id v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  void *v81;
  const char *v82;
  id obj;
  void *v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend_mergeableValueIDs(self, v5, v6);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v87, v91, 16);
  if (v86)
  {
    v10 = *(_QWORD *)v88;
    p_superclass = &OBJC_METACLASS___CKDMoveRecordHandler.superclass;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v88 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v12);
        v14 = objc_msgSend_operationType(self, v8, v9);
        objc_msgSend_operationRequestWithType_(self, v15, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mergeableValueIDByRequestID(self, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v16, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v19, v26, (uint64_t)v13, v25);

        if (objc_msgSend_requiresCKAnonymousUserIDs(self, v27, v28))
        {
          objc_msgSend_zoneID(v13, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousCKUserID(v31, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v34)
          {
            v67 = (void *)objc_opt_new();
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v68, (uint64_t)CFSTR("An anonymousCKUserID is required to fetch metadata for %@ when using anonymous to server share participants"), v13);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v67, v70, (uint64_t)v69, *MEMORY[0x1E0CB2D50]);
            objc_msgSend_operation(self, v71, v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_topmostParentOperation(v73, v74, v75);
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_operationID(v76, v77, v78);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (v80)
              objc_msgSend_setObject_forKeyedSubscript_(v67, v79, (uint64_t)v80, *MEMORY[0x1E0C947F8]);
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v79, *MEMORY[0x1E0C94B20], 5015, v67);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_finishWithError_(self, v82, (uint64_t)v81);

            v66 = 0;
            goto LABEL_17;
          }
          objc_msgSend_zoneID(v13, v35, v36);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousCKUserID(v85, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKDPIdentifier_User(v39, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_request(v16, v43, v44);
          v45 = v16;
          v46 = self;
          v47 = p_superclass;
          v48 = v10;
          v49 = v4;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAnonymousCKUserID_(v50, v51, (uint64_t)v42);

          v4 = v49;
          v10 = v48;
          p_superclass = v47;
          self = v46;
          v16 = v45;

        }
        v52 = (void *)objc_opt_new();
        objc_msgSend_translator(self, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pMergeableValueIdentifierFromMergeableValueID_(v55, v56, (uint64_t)v13);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setIdentifier_(v52, v58, (uint64_t)v57);

        objc_msgSend_continuationTokens(self, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)v13);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v63)
          objc_msgSend_setContinuation_(v52, v64, (uint64_t)v63);
        objc_msgSend_setMergeableDeltaMetadataRetrieveRequest_(v16, v64, (uint64_t)v52);
        objc_msgSend_addObject_(v4, v65, (uint64_t)v16);

        ++v12;
      }
      while (v86 != v12);
      v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v87, v91, 16);
      if (v86)
        continue;
      break;
    }
  }

  v66 = v4;
LABEL_17:

  return v66;
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
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  id v43;
  const char *v44;
  BOOL v45;
  void *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  void *v57;
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
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void (**v80)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v81;
  uint64_t v82;
  void *v83;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  const char *v103;
  void *v104;
  id v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t v111[128];
  uint8_t buf[4];
  id v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  void *v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_mergeableValueIDByRequestID(self, v6, v7);
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
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v102, v103, (uint64_t)a2, self, CFSTR("CKDFetchMergeableDeltaMetadataURLRequest.m"), 131, CFSTR("Expected non-nil value ID for response %@"), v5);

  }
  if ((objc_msgSend_hasMergeableDeltaMetadataRetrieveResponse(v5, v17, v18) & 1) != 0)
  {
    objc_msgSend_mergeableDeltaMetadataRetrieveResponse(v5, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
    {
      v85 = v22;
      objc_msgSend_requestUUID(self, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_metadatas(v21, v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend_count(v91, v92, v93);
      objc_msgSend_continuation(v21, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v113 = v88;
      v114 = 2112;
      v115 = v16;
      v116 = 2048;
      v117 = v94;
      v118 = 2112;
      v119 = v97;
      _os_log_debug_impl(&dword_1BE990000, v85, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Received response for value %@ metadataCount=%ld continuation=%@\", buf, 0x2Au);

    }
    v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v26 = objc_msgSend_metadatasCount(v21, v24, v25);
    v28 = (void *)objc_msgSend_initWithCapacity_(v23, v27, v26);
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    objc_msgSend_metadatas(v21, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v107, v111, 16);
    if (v33)
    {
      v36 = v33;
      v104 = v21;
      v105 = v5;
      v37 = *(_QWORD *)v108;
      while (2)
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v108 != v37)
            objc_enumerationMutation(v31);
          v39 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i);
          objc_msgSend_translator(self, v34, v35);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = 0;
          objc_msgSend_mergeableDeltaMetadataFromPMetadata_mergeableValueID_error_(v40, v41, v39, v16, &v106);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v106;

          if (v42)
            v45 = v43 == 0;
          else
            v45 = 0;
          if (!v45)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v21 = v104;
            v5 = v105;
            v47 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v113 = v43;
              _os_log_error_impl(&dword_1BE990000, v47, OS_LOG_TYPE_ERROR, "Error parsing delta metadata: %@", buf, 0xCu);
            }

            goto LABEL_32;
          }
          objc_msgSend_addObject_(v28, v44, (uint64_t)v42);

        }
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v107, v111, 16);
        if (v36)
          continue;
        break;
      }
      v43 = 0;
      v21 = v104;
      v5 = v105;
    }
    else
    {
      v43 = 0;
    }
LABEL_32:

    objc_msgSend_result(v5, v48, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v53 = (void *)objc_opt_new();

      objc_msgSend_setCode_(v53, v54, 3);
      v55 = (void *)objc_opt_new();
      objc_msgSend_setError_(v53, v56, (uint64_t)v55);

      v57 = (void *)objc_opt_new();
      objc_msgSend_error(v53, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setClientError_(v60, v61, (uint64_t)v57);

      objc_msgSend_error(v53, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clientError(v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setType_(v67, v68, 1);

      objc_msgSend_error(v53, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setErrorKey_(v71, v72, (uint64_t)CFSTR("Unable to parse delta metadata from server response"));

      objc_msgSend_error(v53, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setErrorDescription_(v75, v76, (uint64_t)CFSTR("Unable to parse delta metadata"));

      v52 = v53;
    }
    objc_msgSend_metadataFetchedBlock(self, v50, v51);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      objc_msgSend_metadataFetchedBlock(self, v78, v79);
      v80 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_continuation(v21, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, void *, void *))v80)[2](v80, v16, v28, v83, v52);

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v46 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      v98 = v46;
      objc_msgSend_requestUUID(self, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v113 = v101;
      _os_log_fault_impl(&dword_1BE990000, v98, OS_LOG_TYPE_FAULT, "No mergeableDeltaMetadataRetrieveResponse for mergeableDeltaMetadataRetrieveRequest in request UUID %@", buf, 0xCu);

    }
    v43 = 0;
  }

  return v43;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v4;
  _QWORD *v5;
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
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
  {
    v34 = v6;
    objc_msgSend_requestUUID(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v37;
    v40 = 2112;
    v41 = v4;
    _os_log_error_impl(&dword_1BE990000, v34, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Node failure in list metadatas request: %@\", (uint8_t *)&v38, 0x16u);

  }
  objc_msgSend_response(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_9;
  objc_msgSend_mergeableValueIDByRequestID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v15, v22, (uint64_t)v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_metadataFetchedBlock(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend_metadataFetchedBlock(self, v27, v28);
      v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD, _QWORD, void *))v29)[2](v29, v23, 0, 0, v32);

    }
  }
  else
  {
LABEL_9:
    if (*v5 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v33 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v38) = 0;
      _os_log_fault_impl(&dword_1BE990000, v33, OS_LOG_TYPE_FAULT, "No value ID for list metadatas node failure response", (uint8_t *)&v38, 2u);
    }
    v23 = 0;
  }

}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableValueIDs, a3);
}

- (NSDictionary)continuationTokens
{
  return self->_continuationTokens;
}

- (void)setContinuationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_continuationTokens, a3);
}

- (id)metadataFetchedBlock
{
  return self->_metadataFetchedBlock;
}

- (void)setMetadataFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSMutableDictionary)mergeableValueIDByRequestID
{
  return self->_mergeableValueIDByRequestID;
}

- (void)setMergeableValueIDByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableValueIDByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValueIDByRequestID, 0);
  objc_storeStrong(&self->_metadataFetchedBlock, 0);
  objc_storeStrong((id *)&self->_continuationTokens, 0);
  objc_storeStrong((id *)&self->_mergeableValueIDs, 0);
}

@end
