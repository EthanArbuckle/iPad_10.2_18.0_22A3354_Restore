@implementation CKDAcceptSharesURLRequest

- (CKDAcceptSharesURLRequest)initWithOperation:(id)a3 shareMetadatasToAccept:(id)a4
{
  id v7;
  CKDAcceptSharesURLRequest *v8;
  CKDAcceptSharesURLRequest *v9;
  uint64_t v10;
  NSMutableDictionary *shareMetadataByRequestID;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDAcceptSharesURLRequest;
  v8 = -[CKDURLRequest initWithOperation:](&v13, sel_initWithOperation_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_shareMetadatasToAccept, a4);
    v10 = objc_opt_new();
    shareMetadataByRequestID = v9->_shareMetadataByRequestID;
    v9->_shareMetadataByRequestID = (NSMutableDictionary *)v10;

  }
  return v9;
}

- (id)zoneIDsToLock
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend_shareMetadatasToAccept(self, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v23, v27, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend_shareRecordID(*(void **)(*((_QWORD *)&v23 + 1) + 8 * v13), v9, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend_addObject_(v3, v18, (uint64_t)v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v23, v27, 16);
    }
    while (v11);
  }

  objc_msgSend_allObjects(v3, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKDAcceptSharesURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v17, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_shareMetadatasToAccept(self, v5, v6, v17.receiver, v17.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMap_(v7, v8, (uint64_t)&unk_1E7836AF8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_ckEquivalencyProperties(v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v10, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v16, (uint64_t)v15, CFSTR("shareMetadatas"));
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
  objc_super v11;

  v4 = a3;
  objc_msgSend_shareMetadatasToAccept(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMap_(v7, v8, (uint64_t)&unk_1E7836B18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setModifyRecordIDs_(v4, v10, (uint64_t)v9);
  v11.receiver = self;
  v11.super_class = (Class)CKDAcceptSharesURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v11, sel_fillOutRequestProperties_, v4);

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

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  char v12;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_useAnonymousToServerShareParticipants(v9, v10, v11);

  return v12;
}

- (id)generateRequestOperations
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  const char *v113;
  id v114;
  void *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  void *v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  void *v132;
  void *v133;
  const char *v134;
  id obj;
  uint64_t v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  objc_msgSend_shareMetadatasToAccept(self, v4, v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v138, v142, 16);
  if (v7)
  {
    v10 = v7;
    v137 = *(_QWORD *)v139;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v139 != v137)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v11);
        v13 = objc_msgSend_operationType(self, v8, v9);
        objc_msgSend_operationRequestWithType_(self, v14, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_requiresCKAnonymousUserIDs(self, v16, v17))
        {
          objc_msgSend_anonymousCKUserID(v12, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            v115 = (void *)objc_opt_new();
            v116 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend_shareRecordID(v12, v117, v118);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v116, v120, (uint64_t)CFSTR("An anonymousCKUserID is required to accept share %@ when using anonymous to server share participants"), v119);
            v121 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_setObject_forKeyedSubscript_(v115, v122, (uint64_t)v121, *MEMORY[0x1E0CB2D50]);
            objc_msgSend_operation(self, v123, v124);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_topmostParentOperation(v125, v126, v127);
            v128 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_operationID(v128, v129, v130);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            if (v132)
              objc_msgSend_setObject_forKeyedSubscript_(v115, v131, (uint64_t)v132, *MEMORY[0x1E0C947F8]);
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v131, *MEMORY[0x1E0C94B20], 5015, v115);
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_finishWithError_(self, v134, (uint64_t)v133);

            v114 = 0;
            goto LABEL_23;
          }
          objc_msgSend_anonymousCKUserID(v12, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKDPIdentifier_User(v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_request(v15, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAnonymousCKUserID_(v29, v30, (uint64_t)v26);

        }
        v31 = v3;
        v32 = (void *)objc_opt_new();
        objc_msgSend_setShareAcceptRequest_(v15, v33, (uint64_t)v32);
        objc_msgSend_translator(self, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_shareRecordID(v12, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pShareIdentifierFromRecordID_(v36, v40, (uint64_t)v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setShareId_(v32, v42, (uint64_t)v41);

        objc_msgSend_etag(v12, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setEtag_(v32, v46, (uint64_t)v45);

        v49 = objc_msgSend_acceptedInProcess(v12, v47, v48);
        objc_msgSend_setAcceptedInProcess_(v32, v50, v49);
        objc_msgSend_publicPCSData(v12, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          v56 = (void *)objc_opt_new();
          objc_msgSend_setSelfAddedPcs_(v32, v57, (uint64_t)v56);

          objc_msgSend_publicPCSData(v12, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_selfAddedPcs(v32, v61, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setProtectionInfo_(v63, v64, (uint64_t)v60);

          objc_msgSend_publicPCSEtag(v12, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_selfAddedPcs(v32, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setProtectionInfoTag_(v70, v71, (uint64_t)v67);

        }
        objc_msgSend_publicKey(v12, v54, v55);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          v75 = (void *)objc_opt_new();
          objc_msgSend_setPublicKey_(v32, v76, (uint64_t)v75);

          objc_msgSend_publicKey(v12, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_publicKey(v32, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setProtectionInfo_(v82, v83, (uint64_t)v79);

          v86 = objc_msgSend_publicKeyVersion(v12, v84, v85);
          objc_msgSend_setPublicKeyVersion_(v32, v87, v86);
        }
        objc_msgSend_pppcsProtectionInfo(v12, v73, v74);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (v88)
        {
          v91 = (void *)objc_opt_new();
          objc_msgSend_setProtectionInfo_(v32, v92, (uint64_t)v91);

          objc_msgSend_pppcsProtectionInfo(v12, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_protectionInfo(v32, v96, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setProtectionInfo_(v98, v99, (uint64_t)v95);

        }
        objc_msgSend_participantID(v12, v89, v90);
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        if (v100)
        {
          objc_msgSend_participantID(v12, v101, v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setParticipantId_(v32, v104, (uint64_t)v103);

        }
        objc_msgSend_shareMetadataByRequestID(self, v101, v102);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v15, v106, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v105, v112, (uint64_t)v12, v111);

        v3 = v31;
        objc_msgSend_addObject_(v31, v113, (uint64_t)v15);

        ++v11;
      }
      while (v10 != v11);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v138, v142, 16);
      if (v10)
        continue;
      break;
    }
  }

  v114 = v3;
LABEL_23:

  return v114;
}

- (id)returnVerificationKeyAndSignatureForRequestOperation:(id)a3 dataToBeSigned:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
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
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  void *v46;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a3;
  if ((objc_msgSend_requiresCKAnonymousUserIDs(self, v11, v12) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v52, v53, (uint64_t)a2, self, CFSTR("CKDAcceptSharesURLRequest.m"), 139, CFSTR("Signature is only required for anonymous to server requests"));

  }
  objc_msgSend_shareMetadataByRequestID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(v10, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_operationUUID(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v15, v22, (uint64_t)v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_signingPCSIdentity(v23, v24, v25))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareRecordID(v23, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v54, v58, (uint64_t)a2, self, CFSTR("CKDAcceptSharesURLRequest.m"), 143, CFSTR("A signing identity is required to accept share %@ when using anonymous to server share participants."), v57);

  }
  objc_msgSend_container(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_signingPCSIdentity(v23, v32, v33);
  v59 = 0;
  objc_msgSend_createSignatureWithIdentity_dataToBeSigned_useWholePublicKeyAsSigner_error_(v31, v35, v34, v9, 0, &v59);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v59;
  if (objc_msgSend_length(v36, v38, v39) && !v37)
  {
    v40 = objc_alloc(MEMORY[0x1E0C951F8]);
    objc_msgSend_signingPCSIdentity(v23, v41, v42);
    v43 = (void *)PCSIdentityCopyExportedPublicKey();
    v45 = (void *)objc_msgSend_initWithObject1_object2_(v40, v44, (uint64_t)v43, v36);

    if (!a5)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v46 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v48 = v46;
    v51 = objc_msgSend_signingPCSIdentity(v23, v49, v50);
    *(_DWORD *)buf = 138543618;
    v61 = v51;
    v62 = 2112;
    v63 = v37;
    _os_log_error_impl(&dword_1BE990000, v48, OS_LOG_TYPE_ERROR, "Couldn't generate a request signature with signing identity %{public}@ because we got an error from PCS: %@", buf, 0x16u);

  }
  v45 = 0;
  if (a5)
LABEL_14:
    *a5 = objc_retainAutorelease(v37);
LABEL_15:

  return v45;
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
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  id v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void (**v82)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  id v89;
  id v91;
  uint8_t buf[4];
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_shareMetadataByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_hasShareAcceptResponse(v4, v16, v17))
  {
    v23 = 0;
    goto LABEL_11;
  }
  objc_msgSend_shareAcceptResponse(v4, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
LABEL_11:
    v29 = 0;
    v30 = 0;
    goto LABEL_12;
  }
  objc_msgSend_translator(self, v18, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anonymousCKUserID(v15, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0;
  objc_msgSend_shareFromPShare_asAnonymousCKUserID_error_(v24, v28, (uint64_t)v23, v27, &v91);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v91;

  if (!v29 && v30)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v31 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v93 = v30;
      _os_log_error_impl(&dword_1BE990000, v31, OS_LOG_TYPE_ERROR, "Failed to convert share: %@", buf, 0xCu);
    }
    objc_msgSend_result(v4, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCode_(v34, v35, 3);

    v36 = (void *)objc_opt_new();
    objc_msgSend_result(v4, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(v39, v40, (uint64_t)v36);

    v41 = (void *)objc_opt_new();
    objc_msgSend_result(v4, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClientError_(v47, v48, (uint64_t)v41);

    objc_msgSend_result(v4, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setType_(v57, v58, 7);

    objc_msgSend_result(v4, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorKey_(v64, v65, (uint64_t)CFSTR("Invalid share"));

    v66 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_localizedDescription(v30, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v66, v70, (uint64_t)CFSTR("The share could not be converted because it is invalid: %@"), v69);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorDescription_(v77, v78, (uint64_t)v71);

    v29 = 0;
  }
LABEL_12:
  objc_msgSend_shareAcceptedBlock(self, v18, v19);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    objc_msgSend_shareAcceptedBlock(self, v80, v81);
    v82 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareURL(v15, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v82)[2](v82, v85, v29, v88);

  }
  v89 = v30;

  return v89;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a3;
  objc_msgSend_shareMetadataByRequestID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v27, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_shareAcceptedBlock(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_shareAcceptedBlock(self, v18, v19);
    v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareURL(v14, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v27, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD, void *))v20)[2](v20, v23, 0, v26);

  }
}

- (id)shareAcceptedBlock
{
  return self->_shareAcceptedBlock;
}

- (void)setShareAcceptedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSArray)shareMetadatasToAccept
{
  return self->_shareMetadatasToAccept;
}

- (void)setShareMetadatasToAccept:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadatasToAccept, a3);
}

- (NSMutableDictionary)shareMetadataByRequestID
{
  return self->_shareMetadataByRequestID;
}

- (void)setShareMetadataByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadataByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadataByRequestID, 0);
  objc_storeStrong((id *)&self->_shareMetadatasToAccept, 0);
  objc_storeStrong(&self->_shareAcceptedBlock, 0);
}

@end
