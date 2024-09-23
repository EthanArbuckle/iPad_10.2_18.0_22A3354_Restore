@implementation CKDAcceptSharesOperation

- (CKDAcceptSharesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  CKDAcceptSharesOperation *v7;
  uint64_t v8;
  NSMutableDictionary *clientProvidedMetadatasByURL;
  uint64_t v10;
  NSMutableArray *shareURLsToAccept;
  uint64_t v12;
  NSMutableDictionary *shareMetadatasToAcceptByURL;
  uint64_t v14;
  NSMutableArray *acceptedShareURLsToFetch;
  uint64_t v16;
  NSMutableDictionary *anonymousShareTuplesAcceptAttempted;
  uint64_t v18;
  NSMutableArray *anonymousShareTuplesAccepted;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  const char *v33;
  NSMutableArray *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSMutableDictionary *URLsWaitingKRSByServiceType;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CKDAcceptSharesOperation;
  v7 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v47, sel_initWithOperationInfo_container_, v6, a4);
  if (v7)
  {
    v8 = objc_opt_new();
    clientProvidedMetadatasByURL = v7->_clientProvidedMetadatasByURL;
    v7->_clientProvidedMetadatasByURL = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    shareURLsToAccept = v7->_shareURLsToAccept;
    v7->_shareURLsToAccept = (NSMutableArray *)v10;

    v12 = objc_opt_new();
    shareMetadatasToAcceptByURL = v7->_shareMetadatasToAcceptByURL;
    v7->_shareMetadatasToAcceptByURL = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    acceptedShareURLsToFetch = v7->_acceptedShareURLsToFetch;
    v7->_acceptedShareURLsToFetch = (NSMutableArray *)v14;

    v16 = objc_opt_new();
    anonymousShareTuplesAcceptAttempted = v7->_anonymousShareTuplesAcceptAttempted;
    v7->_anonymousShareTuplesAcceptAttempted = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    anonymousShareTuplesAccepted = v7->_anonymousShareTuplesAccepted;
    v7->_anonymousShareTuplesAccepted = (NSMutableArray *)v18;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v42 = v6;
    objc_msgSend_shareMetadatasToAccept(v6, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v43, v48, 16);
    if (v24)
    {
      v27 = v24;
      v28 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v44 != v28)
            objc_enumerationMutation(v22);
          v30 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v31 = v7->_clientProvidedMetadatasByURL;
          objc_msgSend_invitationURL(v30, v25, v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v31, v33, (uint64_t)v30, v32);

          v34 = v7->_shareURLsToAccept;
          objc_msgSend_invitationURL(v30, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v34, v38, (uint64_t)v37);

        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v43, v48, 16);
      }
      while (v27);
    }

    v7->_canSynchronizeUserKeyRegistry = 1;
    v39 = objc_opt_new();
    URLsWaitingKRSByServiceType = v7->_URLsWaitingKRSByServiceType;
    v7->_URLsWaitingKRSByServiceType = (NSMutableDictionary *)v39;

    v6 = v42;
  }

  return v7;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/accept-shares", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      goto LABEL_8;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__prepareShareMetadata(self, v6, v7);
      return 1;
    case 3:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend__fetchAcceptedShares(self, v8, v9);
      return 1;
    case 4:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__synchronizeUserKeyRegistryIfNeeded(self, v10, v11);
      return 1;
    case 5:
      objc_msgSend_setState_(self, v4, 6);
      objc_msgSend__decryptShareMetadata(self, v12, v13);
      return 1;
    case 6:
      objc_msgSend_setState_(self, v4, 7);
      return MEMORY[0x1E0DE7D20](self, sel__acceptShares, v26);
    case 7:
      objc_msgSend_shareURLsToAccept(self, v4, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_count(v14, v15, v16);

      if (v17)
      {
LABEL_8:
        objc_msgSend_setState_(self, v4, 2);
        objc_msgSend__fetchMetadataForShares(self, v18, v19);
      }
      else
      {
        objc_msgSend_setState_(self, v4, 8);
        objc_msgSend__processAnonymousShares(self, v24, v25);
      }
      return 1;
    case 8:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v23, (uint64_t)v22);

      return 1;
    default:
      return 1;
  }
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 7)
    return off_1E7838370[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDAcceptSharesOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_performCallbackForURL:(id)a3 withShare:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  const char *v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;

  v9 = a3;
  v10 = a4;
  v13 = a5;
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, CFSTR("CKDAcceptSharesOperation.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shareURL"));

  }
  objc_msgSend_shareURLsToAccept(self, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v14, v15, (uint64_t)v9);

  objc_msgSend_acceptedShareURLsToFetch(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v18, v19, (uint64_t)v9);

  objc_msgSend_callbackQueue(self, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC39BC4;
  block[3] = &unk_1E782F4A8;
  block[4] = self;
  v29 = v9;
  v30 = v10;
  v31 = v13;
  v23 = v13;
  v24 = v10;
  v25 = v9;
  dispatch_async(v22, block);

}

- (void)_handleShareURLAccepted:(id)a3 forShare:(id)a4 responseCode:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  BOOL v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  NSObject *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  BOOL v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  _BOOL4 v90;
  void *v91;
  NSObject *v92;
  void *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  id v124;
  _QWORD v125[4];
  id v126;
  CKDAcceptSharesOperation *v127;
  id v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;
  uint8_t buf[4];
  id v137;
  __int16 v138;
  void *v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v124 = a4;
  v9 = a5;
  v130 = 0;
  v131 = &v130;
  v132 = 0x3032000000;
  v133 = sub_1BE9BB1F0;
  v134 = sub_1BE9BAEA0;
  v135 = 0;
  if (objc_msgSend_code(v9, v10, v11) == 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v137 = v8;
      _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_INFO, "Share with URL %@ was successfully accepted", buf, 0xCu);
    }
    objc_msgSend_container(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_useAnonymousToServerShareParticipants(v20, v21, v22))
    {
      objc_msgSend_anonymousShareTuplesAcceptAttempted(self, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27 == 0;

      if (v28)
      {
LABEL_10:
        objc_msgSend_shareMetadatasToAcceptByURL(self, v29, v30);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v36, v37, (uint64_t)v8);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_host(v8, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDisplayedHostname_(v124, v42, (uint64_t)v41);

        if ((objc_msgSend_isCallingParticipantUsingOTL(v38, v43, v44) & 1) == 0)
          objc_msgSend_setMutableURL_(v124, v45, (uint64_t)v8);
        objc_msgSend_stateTransitionGroup(self, v45, v46);
        v47 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v47);

        objc_msgSend_container(self, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_topmostParentOperation(self, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationID(v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v125[0] = MEMORY[0x1E0C809B0];
        v125[1] = 3221225472;
        v125[2] = sub_1BEC3A330;
        v125[3] = &unk_1E7838328;
        v129 = &v130;
        v126 = v124;
        v127 = self;
        v128 = v8;
        objc_msgSend__prepPCSDataWithContainer_databaseScope_removeServerSpecifiedKeys_requestorOperationID_completionHandler_(v126, v57, (uint64_t)v50, 3, 1, v56, v125);

        goto LABEL_34;
      }
      objc_msgSend_anonymousShareTuplesAccepted(self, v29, v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_anonymousShareTuplesAcceptAttempted(self, v31, v32);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v20, v33, (uint64_t)v8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v17, v35, (uint64_t)v34);

    }
    goto LABEL_10;
  }
  objc_msgSend_error(v9, v12, v13);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v61, v62, v63) == 52)
    goto LABEL_16;
  objc_msgSend_error(v9, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v69, v70, v71) == 53)
  {

LABEL_16:
LABEL_17:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v74 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v137 = v8;
      _os_log_impl(&dword_1BE990000, v74, OS_LOG_TYPE_INFO, "PCS oplock failure for share with url %@.", buf, 0xCu);
    }
    goto LABEL_34;
  }
  objc_msgSend_error(v9, v72, v73);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend_type(v78, v79, v80) == 15;

  if (v81)
    goto LABEL_17;
  objc_msgSend_error(v9, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend_type(v87, v88, v89) == 90;

  v91 = (void *)*MEMORY[0x1E0C952F8];
  if (v90)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v91);
    v92 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v137 = v8;
      _os_log_error_impl(&dword_1BE990000, v92, OS_LOG_TYPE_ERROR, "Participant can be found on the share, but the participantID sent in request does not belong to the found participant. Share url: %@", buf, 0xCu);
    }
    v93 = (void *)MEMORY[0x1E0C94FF8];
    v94 = sub_1BEB10D5C(v9);
    objc_msgSend_error(v9, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v97, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v93, v101, *MEMORY[0x1E0C94B20], v94, CFSTR("Error accepting share %@: %@"), v8, v100);
    v102 = objc_claimAutoreleasedReturnValue();
    v103 = (void *)v131[5];
    v131[5] = v102;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v91);
    v104 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_error(v9, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v107, v108, v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v137 = v8;
      v138 = 2114;
      v139 = v110;
      _os_log_impl(&dword_1BE990000, v104, OS_LOG_TYPE_INFO, "Error accepting share with URL %@: %{public}@", buf, 0x16u);

    }
    v111 = (void *)MEMORY[0x1E0C94FF8];
    v112 = sub_1BEB10D5C(v9);
    objc_msgSend_request(self, v113, v114);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v97, v9);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v9, v115, v116);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v103, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v111, v120, *MEMORY[0x1E0C94B20], v112, v100, CFSTR("Error accepting share %@: %@"), v8, v119);
    v121 = objc_claimAutoreleasedReturnValue();
    v122 = (void *)v131[5];
    v131[5] = v121;

  }
  objc_msgSend__performCallbackForURL_withShare_error_(self, v123, (uint64_t)v8, v124, v131[5]);
LABEL_34:
  _Block_object_dispose(&v130, 8);

}

- (int)operationType
{
  return 503;
}

- (BOOL)_acceptShares
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
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  int v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  int IsManatee;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  int v47;
  const char *v48;
  uint64_t v49;
  int v50;
  int v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  void *v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  void *v90;
  _BOOL8 v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  void *v103;
  id v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  BOOL v109;
  char v110;
  const char *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  const char *v142;
  CKDAnonymousShareTuple *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  _BOOL4 v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  const void *v174;
  void *v175;
  void *v176;
  const char *v177;
  void *v178;
  const char *v179;
  void *v180;
  const char *v181;
  void *v182;
  _BOOL4 v183;
  const char *v184;
  const __CFString *v185;
  NSObject *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  void *v192;
  void *v193;
  _BOOL4 v194;
  void *v195;
  const char *v196;
  NSObject *v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  NSObject *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  NSObject *v211;
  const char *v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  void *v218;
  const char *v219;
  void *v220;
  const char *v221;
  void *v222;
  const char *v223;
  void *v224;
  const char *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  BOOL v231;
  uint64_t v232;
  const char *v233;
  CKDAcceptSharesURLRequest *v234;
  const char *v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  NSObject *v239;
  uint64_t v240;
  const char *v241;
  const char *v242;
  const char *v243;
  const char *v244;
  NSObject *v245;
  NSObject *v246;
  void *v249;
  uint64_t v250;
  id obj;
  void *v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  uint64_t v256;
  _QWORD v258[4];
  id v259;
  id v260;
  _QWORD v261[4];
  id v262;
  id location;
  id v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  uint8_t buf[4];
  void *v270;
  _BYTE v271[128];
  uint64_t v272;

  v272 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareURLsToAccept(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_count(v3, v4, v5);

  if (v6)
  {
    objc_msgSend_container(self, v7, v8);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    v249 = (void *)objc_opt_new();
    v265 = 0u;
    v266 = 0u;
    v267 = 0u;
    v268 = 0u;
    objc_msgSend_shareMetadatasToAcceptByURL(self, v9, v10);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v254 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v265, v271, 16);
    if (!v254)
      goto LABEL_69;
    v253 = *(_QWORD *)v266;
    v250 = *MEMORY[0x1E0C94B20];
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v266 != v253)
          objc_enumerationMutation(obj);
        v256 = *(_QWORD *)(*((_QWORD *)&v265 + 1) + 8 * v14);
        objc_msgSend_shareMetadatasToAcceptByURL(self, v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v15, v16, v256);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)objc_opt_new();
        objc_msgSend_setShareURL_(v18, v19, v256);
        objc_msgSend_share(v17, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setShareRecordID_(v18, v26, (uint64_t)v25);

        v29 = objc_msgSend_acceptedInProcess(v17, v27, v28);
        objc_msgSend_setAcceptedInProcess_(v18, v30, v29);
        v33 = objc_msgSend_participantRole(v17, v31, v32);
        v35 = objc_msgSend__callingParticipantOONForShareMetadata_(self, v34, (uint64_t)v17);
        objc_msgSend_pcsManager(v255, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        IsManatee = objc_msgSend_currentServiceIsManatee(v38, v39, v40);

        objc_msgSend_options(v255, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend_useAnonymousToServerShareParticipants(v44, v45, v46);

        if ((v35 & IsManatee) == 1)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v48, v49);
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v218, v219, (uint64_t)a2, self, CFSTR("CKDAcceptSharesOperation.m"), 273, CFSTR("OON Participants not supported in manatee"));

        }
        if (v33 == 4)
          v50 = IsManatee;
        else
          v50 = 0;
        if (v50 == 1)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v48, v49);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v220, v221, (uint64_t)a2, self, CFSTR("CKDAcceptSharesOperation.m"), 274, CFSTR("Public sharing not supported in manatee"));

        }
        if (v33 == 4)
          v51 = v47;
        else
          v51 = 0;
        if (v51 == 1)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v48, v49);
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v222, v223, (uint64_t)a2, self, CFSTR("CKDAcceptSharesOperation.m"), 275, CFSTR("Public sharing not supported when using anonymous to server share participants"));

        }
        if ((v35 & v47) == 1)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v48, v49);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v224, v225, (uint64_t)a2, self, CFSTR("CKDAcceptSharesOperation.m"), 276, CFSTR("OON participants not supported when using anonymous to server share participants"));

        }
        if (v33 == 4)
        {
          objc_msgSend_share(v17, v48, v49);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_etag(v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setEtag_(v18, v56, (uint64_t)v55);

          objc_msgSend_share(v17, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_publicProtectionData(v59, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setPublicPCSData_(v18, v63, (uint64_t)v62);

          objc_msgSend_share(v17, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_publicProtectionEtag(v66, v67, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setPublicPCSEtag_(v18, v70, (uint64_t)v69);
LABEL_26:

          goto LABEL_27;
        }
        if ((IsManatee | v47) == 1 || v35)
        {
          objc_msgSend_callingParticipant(v17, v48, v49);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_protectionInfo(v66, v71, v72);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setPppcsProtectionInfo_(v18, v73, (uint64_t)v69);
          goto LABEL_26;
        }
LABEL_27:
        objc_msgSend_callingParticipant(v17, v48, v49);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_participantID(v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setParticipantID_(v18, v78, (uint64_t)v77);

        if (*MEMORY[0x1E0C95280])
        {
          objc_msgSend_unitTestOverrides(self, v79, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v81, v82, (uint64_t)CFSTR("OverwriteParticipantID"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          if (v83)
          {
            objc_msgSend_unitTestOverrides(self, v79, v80);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v84, v85, (uint64_t)CFSTR("OverwriteParticipantID"));
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setParticipantID_(v18, v87, (uint64_t)v86);

          }
        }
        if (!v47)
        {
          v92 = objc_msgSend_sharingServiceTypeForShareMetadata_(self, v79, (uint64_t)v17);
          objc_msgSend_pcsManager(v255, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend_publicKeyVersionForServiceType_(v95, v96, v92);
          objc_msgSend_setPublicKeyVersion_(v18, v98, v97);

          objc_msgSend_pcsManager(v255, v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v264 = 0;
          objc_msgSend_participantPublicKeyForServiceType_error_(v101, v102, v92, &v264);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = v264;
          objc_msgSend_setPublicKey_(v18, v105, (uint64_t)v103);

          objc_msgSend_publicKey(v18, v106, v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          if (v108)
            v109 = v104 == 0;
          else
            v109 = 0;
          v110 = v109;

          if ((v110 & 1) == 0)
          {
            objc_msgSend__performCallbackForURL_withShare_error_(self, v111, v256, 0, v104);

            goto LABEL_67;
          }
          goto LABEL_52;
        }
        if (*MEMORY[0x1E0C95280])
        {
          objc_msgSend_unitTestOverrides(self, v79, v80);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v88, v89, (uint64_t)CFSTR("AcceptA2AShareUsingVersionOneAnonymousIdentifier"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v90 != 0;

        }
        else
        {
          v91 = 0;
        }
        objc_msgSend_pcsManager(v255, v79, v80);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_share(v17, v113, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v115, v116, v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_containerID(v255, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_generateAnonymousCKUserIDForCurrentUserInShare_containerID_acceptA2AShareUsingVersionOneAnonymousIdentifier_(v112, v122, (uint64_t)v118, v121, v91);
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        if (v123)
        {
          objc_msgSend_share(v17, v124, v125);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v126, v127, v128);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v252 = (void *)objc_msgSend_copyWithAnonymousCKUserID_(v129, v130, (uint64_t)v123);

          objc_msgSend_share(v17, v131, v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_replaceRecordIDWith_(v133, v134, (uint64_t)v252);

          objc_msgSend_share(v17, v135, v136);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v137, v138, v139);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setShareRecordID_(v18, v141, (uint64_t)v140);

          objc_msgSend_setAnonymousCKUserID_(v18, v142, (uint64_t)v123);
          v143 = [CKDAnonymousShareTuple alloc];
          objc_msgSend_share(v17, v144, v145);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v146, v147, v148);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneID(v149, v150, v151);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_share(v17, v153, v154);
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v155, v156, v157);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = (void *)objc_msgSend_initWithZoneID_shareID_(v143, v159, (uint64_t)v152, v158);

          if (v160)
          {
            objc_msgSend_anonymousShareTuplesAcceptAttempted(self, v161, v162);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v163, v164, (uint64_t)v160, v256);

          }
          objc_msgSend_share(v17, v161, v162);
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = objc_msgSend_myParticipantPCS(v165, v166, v167) == 0;

          if (v168)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v182 = (void *)*MEMORY[0x1E0C952B0];
            v183 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR);
            v185 = CFSTR("Share does not have the per-participant PCS to generate a signature for accepting share at %@");
            if (v183)
            {
              v186 = v182;
              objc_msgSend_share(v17, v187, v188);
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v189, v190, v191);
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v270 = v192;
              _os_log_error_impl(&dword_1BE990000, v186, OS_LOG_TYPE_ERROR, "Share does not have the per-participant PCS to generate a signature. Failing to accept share %@.", buf, 0xCu);

              v185 = CFSTR("Share does not have the per-participant PCS to generate a signature for accepting share at %@");
            }
          }
          else
          {
            objc_msgSend_share(v17, v169, v170);
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_myParticipantPCS(v171, v172, v173);
            v174 = (const void *)PCSFPCopyCurrentPrivateKey();

            v175 = (void *)*MEMORY[0x1E0C952F8];
            if (v174)
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], v175);
              v176 = (void *)*MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
              {
                v204 = v176;
                objc_msgSend_share(v17, v205, v206);
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_recordID(v207, v208, v209);
                v210 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v270 = v210;
                _os_log_error_impl(&dword_1BE990000, v204, OS_LOG_TYPE_ERROR, "Setting per-participant PCS for signing ShareAcceptRequest for share %@.", buf, 0xCu);

              }
              objc_msgSend_setSigningPCSIdentity_(v18, v177, (uint64_t)v174);
              CFRelease(v174);

LABEL_52:
              objc_msgSend_addObject_(v249, v111, (uint64_t)v18);
              goto LABEL_67;
            }
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], v175);
            v193 = (void *)*MEMORY[0x1E0C952B0];
            v194 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR);
            v185 = CFSTR("Share does not have the per-participant to generate a signature for accepting share at %@");
            if (v194)
            {
              v211 = v193;
              objc_msgSend_share(v17, v212, v213);
              v214 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v214, v215, v216);
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v270 = v217;
              _os_log_error_impl(&dword_1BE990000, v211, OS_LOG_TYPE_ERROR, "Failed to get private key from per-participant PCS to generate a signature. Failing to accept share %@.", buf, 0xCu);

              v185 = CFSTR("Share does not have the per-participant to generate a signature for accepting share at %@");
            }
          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v184, v250, 5005, v185, v256);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__performCallbackForURL_withShare_error_(self, v196, v256, 0, v195);

        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v178 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            v197 = v178;
            objc_msgSend_share(v17, v198, v199);
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v200, v201, v202);
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v270 = v203;
            _os_log_error_impl(&dword_1BE990000, v197, OS_LOG_TYPE_ERROR, "Could not generate anonymous CK userID to accept share %@. Failing to accept share.", buf, 0xCu);

          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v179, v250, 5005, CFSTR("Couldn't generate an anonymous userID to accept share at %@"), v256);
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__performCallbackForURL_withShare_error_(self, v181, v256, 0, v180);

        }
LABEL_67:

        ++v14;
      }
      while (v254 != v14);
      v254 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v265, v271, 16);
      if (!v254)
      {
LABEL_69:

        v228 = objc_msgSend_count(v249, v226, v227);
        v231 = v228 != 0;
        if (v228)
        {
          v232 = objc_msgSend_numShareAcceptAttempts(self, v229, v230);
          objc_msgSend_setNumShareAcceptAttempts_(self, v233, v232 + 1);
          v234 = [CKDAcceptSharesURLRequest alloc];
          v236 = (void *)objc_msgSend_initWithOperation_shareMetadatasToAccept_(v234, v235, (uint64_t)self, v249);
          objc_initWeak((id *)buf, self);
          objc_initWeak(&location, v236);
          objc_msgSend_stateTransitionGroup(self, v237, v238);
          v239 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v239);

          v240 = MEMORY[0x1E0C809B0];
          v261[0] = MEMORY[0x1E0C809B0];
          v261[1] = 3221225472;
          v261[2] = sub_1BEC3B524;
          v261[3] = &unk_1E78382B0;
          objc_copyWeak(&v262, (id *)buf);
          objc_msgSend_setShareAcceptedBlock_(v236, v241, (uint64_t)v261);
          v258[0] = v240;
          v258[1] = 3221225472;
          v258[2] = sub_1BEC3B59C;
          v258[3] = &unk_1E782E468;
          objc_copyWeak(&v259, (id *)buf);
          objc_copyWeak(&v260, &location);
          objc_msgSend_setCompletionBlock_(v236, v242, (uint64_t)v258);
          objc_msgSend_setRequest_(self, v243, (uint64_t)v236);
          objc_msgSend_performRequest_(v255, v244, (uint64_t)v236);
          objc_destroyWeak(&v260);
          objc_destroyWeak(&v259);
          objc_destroyWeak(&v262);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v246 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE990000, v246, OS_LOG_TYPE_INFO, "No shares to accept", buf, 2u);
          }
        }

        return v231;
      }
    }
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v245 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v245, OS_LOG_TYPE_INFO, "No shares to accept", buf, 2u);
  }
  return 0;
}

- (unint64_t)sharingServiceTypeForShareMetadata:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  _BOOL4 v21;
  unint64_t v22;

  v3 = a3;
  objc_msgSend_containerID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_specialContainerType(v6, v7, v8);

  v12 = objc_msgSend_participantRole(v3, v10, v11);
  objc_msgSend_callingParticipant(v3, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userIdentity(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (unint64_t)objc_msgSend_publicKeyVersion(v18, v19, v20) < 3;

  v22 = 1;
  if (v9 != 4)
    v22 = 2;
  if (v12 == 4)
    return v22;
  else
    return 2 * v21;
}

- (void)_decryptShareMetadata
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  const char *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[4];
  id v50;
  CKDAcceptSharesOperation *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareURLsToAccept(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend_shareMetadatasToAcceptByURL(self, v8, v9);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v53, v57, 16);
    if (v48)
    {
      v47 = *(_QWORD *)v54;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v54 != v47)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v13);
          objc_msgSend_shareMetadatasToAcceptByURL(self, v11, v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v15, v16, v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_clientProvidedMetadatasByURL(self, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v20, v21, v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = objc_msgSend_sharingServiceTypeForShareMetadata_(self, v23, (uint64_t)v17);
          objc_msgSend_stateTransitionGroup(self, v25, v26);
          v27 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v27);

          objc_msgSend_container(self, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsManager(v30, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_share(v17, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_topmostParentOperation(self, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_operationID(v39, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = sub_1BEC3BA14;
          v49[3] = &unk_1E7838088;
          v50 = v22;
          v51 = self;
          v52 = v17;
          v43 = v17;
          v44 = v22;
          objc_msgSend_pcsDataFromFetchedShare_withServiceType_requestorOperationID_completionHandler_(v33, v45, (uint64_t)v36, v24, v42, v49);

          ++v13;
        }
        while (v48 != v13);
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v53, v57, 16);
      }
      while (v48);
    }

  }
}

- (void)_fetchAcceptedShares
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[5];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend_acceptedShareURLsToFetch(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    v49 = (void *)objc_opt_new();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend_acceptedShareURLsToFetch(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend_copy(v11, v12, v13);

    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v52, v58, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v53;
      v48 = *MEMORY[0x1E0C94B20];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v53 != v20)
            objc_enumerationMutation(v14);
          v22 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend_shareMetadatasToAcceptByURL(self, v17, v18, v48);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v23, v24, v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_share(v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend_addObject_(v8, v32, (uint64_t)v31);
            objc_msgSend_setObject_forKeyedSubscript_(v49, v33, v22, v31);
          }
          else
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v32, v48, 2003, CFSTR("Fetched share metadata didn't have a share ID"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend__performCallbackForURL_withShare_error_(self, v35, v22, 0, v34);

          }
        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v52, v58, 16);
      }
      while (v19);
    }

    v36 = v8;
    if (objc_msgSend_count(v8, v37, v38))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v39 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v8;
        _os_log_impl(&dword_1BE990000, v39, OS_LOG_TYPE_INFO, "Fetching shares for already accepted share IDs: %@", buf, 0xCu);
      }
      objc_msgSend_stateTransitionGroup(self, v40, v41);
      v42 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v42);

      v43 = (void *)objc_opt_new();
      objc_msgSend_setRecordIDs_(v43, v44, (uint64_t)v8);
      objc_msgSend_setDatabaseScope_(v43, v45, 3);
      v46 = objc_opt_class();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = sub_1BEC3C23C;
      v50[3] = &unk_1E782E558;
      v50[4] = self;
      v51 = v49;
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v47, v46, v43, v50);

    }
  }
}

- (id)_addSelfIdentityToShareMetadataPublicPCS:(id)a3 serviceType:(unint64_t)a4 forShareWithURL:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  _QWORD *v23;
  os_log_t *v24;
  void *v25;
  void *v26;
  os_log_t v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const void *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const void *v58;
  const char *v59;
  uint64_t v60;
  os_log_t *v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  os_log_t v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  const char *v70;
  os_log_t v71;
  os_log_t *v72;
  os_log_t v73;
  void *v74;
  void *v75;
  void *v76;
  const char *v77;
  const char *v78;
  os_log_t v80;
  os_log_t v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  void *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  void *v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  NSObject *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  NSObject *v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  id *v115;
  void *v116;
  CFTypeRef cf;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  uint8_t buf[4];
  id v124;
  __int16 v125;
  id v126;
  __int16 v127;
  id v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend_container(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v10, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicProtectionData(v17, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v23 = (_QWORD *)MEMORY[0x1E0C95300];
  v24 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (!v20)
  {

    goto LABEL_20;
  }
  v25 = (void *)v20;
  objc_msgSend_privateToken(v10, v21, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
LABEL_20:
    if (*v23 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v69 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v11;
      _os_log_impl(&dword_1BE990000, v69, OS_LOG_TYPE_INFO, "Share metadata for the share at URL %@ doesn't have protection data on it, skipping", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v70, *MEMORY[0x1E0C94B20], 5001, CFSTR("Share metadata for the share at URL %@ doesn't have protection data on it"), v11);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (*v23 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v27 = *v24;
  if (os_log_type_enabled(*v24, OS_LOG_TYPE_INFO))
  {
    v30 = v27;
    objc_msgSend_privateToken(v10, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v124 = v11;
    v125 = 2112;
    v126 = v33;
    _os_log_impl(&dword_1BE990000, v30, OS_LOG_TYPE_INFO, "Preparing public PCS metadata for share at URL %@ using public sharing token %@", buf, 0x16u);

  }
  objc_msgSend_pcsManager(v14, v28, v29);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateToken(v10, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = 0;
  v39 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v34, v38, (uint64_t)v37, &v122);
  v40 = v122;

  if (!v39 || v40)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v71 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_ERROR))
    {
      v94 = v71;
      objc_msgSend_privateToken(v10, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v124 = v97;
      v125 = 2112;
      v126 = v40;
      _os_log_error_impl(&dword_1BE990000, v94, OS_LOG_TYPE_ERROR, "Couldn't create a sharing public identity from %@: %@", buf, 0x16u);

    }
    if (!v39)
      goto LABEL_37;
    goto LABEL_36;
  }
  v115 = a6;
  objc_msgSend_pcsManager(v14, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v10, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicProtectionData(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = 0;
  v50 = v39;
  v52 = objc_msgSend_createSharePCSFromData_sharingIdentity_error_(v43, v51, (uint64_t)v49, v39, &v121);
  v40 = v121;

  cf = (CFTypeRef)v52;
  if (!v52 || v40)
  {
    v72 = (os_log_t *)MEMORY[0x1E0C952B0];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v39 = v50;
    v73 = *v72;
    a6 = v115;
    if (os_log_type_enabled(*v72, OS_LOG_TYPE_ERROR))
    {
      v98 = v73;
      objc_msgSend_share(v10, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicProtectionData(v101, v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v124 = v104;
      v125 = 2112;
      v126 = (id)v39;
      _os_log_error_impl(&dword_1BE990000, v98, OS_LOG_TYPE_ERROR, "Couldn't create a public PCS from the PCS data %{public}@ for identity %@", buf, 0x16u);

    }
    if (cf)
      goto LABEL_49;
LABEL_36:
    CFRelease(v39);
LABEL_37:
    v74 = 0;
    v75 = 0;
    goto LABEL_38;
  }
  objc_msgSend_pcsManager(v14, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v55;
  if (a4 == 2)
  {
    v120 = 0;
    v58 = (const void *)objc_msgSend_copyDiversifiedPublicIdentityForService_withError_(v55, v56, 2, &v120);
    v40 = v120;

    v61 = (os_log_t *)MEMORY[0x1E0C952B0];
    v39 = v50;
    if (!v58 || v40)
    {
      a6 = v115;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v81 = *v61;
      if (os_log_type_enabled(*v61, OS_LOG_TYPE_ERROR))
      {
        v107 = v81;
        sub_1BEA5D408(2);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v124 = v108;
        v125 = 2112;
        v126 = v11;
        v127 = 2112;
        v128 = v40;
        _os_log_error_impl(&dword_1BE990000, v107, OS_LOG_TYPE_ERROR, "Couldn't get a diversified %{public}@ identity to the public PCS for share at URL %@: %@", buf, 0x20u);

        if (v40)
          goto LABEL_70;
      }
      else if (v40)
      {
LABEL_70:
        v75 = 0;
        v74 = 0;
        goto LABEL_71;
      }
      v82 = (void *)MEMORY[0x1E0C94FF8];
      v83 = *MEMORY[0x1E0C94B20];
      sub_1BEA5D408(2);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v82, v84, v83, 5000, CFSTR("Couldn't get a diversified %@ identity to accept share at %@"), v75, v11);
      v40 = (id)objc_claimAutoreleasedReturnValue();
LABEL_69:

      goto LABEL_70;
    }
    objc_msgSend_pcsManager(v14, v59, v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addPublicIdentity_toSharePCS_permission_(v62, v63, (uint64_t)v58, cf, 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();

    a6 = v115;
    if (v40)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v66 = *v61;
      if (os_log_type_enabled(*v61, OS_LOG_TYPE_ERROR))
      {
        v67 = v66;
        sub_1BEA5D408(2);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v124 = v68;
        v125 = 2112;
        v126 = v11;
        v127 = 2112;
        v128 = v40;
        _os_log_error_impl(&dword_1BE990000, v67, OS_LOG_TYPE_ERROR, "Couldn't add our %{public}@ identity to the public PCS for share at URL %@: %@", buf, 0x20u);

      }
      goto LABEL_70;
    }
LABEL_56:
    objc_msgSend_pcsManager(v14, v64, v65);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = 0;
    objc_msgSend_dataFromSharePCS_pcsBlobType_error_(v85, v86, (uint64_t)cf, 0, &v119);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v119;

    if (v75 && !v40)
    {
      objc_msgSend_pcsManager(v14, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = 0;
      objc_msgSend_etagFromSharePCS_error_(v89, v90, (uint64_t)cf, &v118);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v118;

      if (v74 && !v40)
        goto LABEL_71;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v91 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v109 = v91;
        objc_msgSend_share(v10, v110, v111);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v116, v112, v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v124 = v114;
        _os_log_error_impl(&dword_1BE990000, v109, OS_LOG_TYPE_ERROR, "Couldn't get an etag for public PCS data on share %@", buf, 0xCu);

      }
      goto LABEL_70;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v92 = *v61;
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v124 = v11;
      v125 = 2112;
      v126 = v40;
      _os_log_error_impl(&dword_1BE990000, v92, OS_LOG_TYPE_ERROR, "Couldn't serialize share public PCS for share at URL %@: %@", buf, 0x16u);
    }
    goto LABEL_69;
  }
  objc_msgSend_addIdentityForService_toPCS_(v55, v56, a4, v52);
  v40 = (id)objc_claimAutoreleasedReturnValue();

  v61 = (os_log_t *)MEMORY[0x1E0C952B0];
  v39 = v50;
  if (!v40)
  {
    v58 = 0;
    a6 = v115;
    goto LABEL_56;
  }
  a6 = v115;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v80 = *v61;
  if (os_log_type_enabled(*v61, OS_LOG_TYPE_ERROR))
  {
    v105 = v80;
    sub_1BEA5D408(a4);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v124 = v106;
    v125 = 2112;
    v126 = v11;
    v127 = 2112;
    v128 = v40;
    _os_log_error_impl(&dword_1BE990000, v105, OS_LOG_TYPE_ERROR, "Couldn't add our %{public}@ identity to the public PCS for share at URL %@: %@", buf, 0x20u);

  }
LABEL_49:
  v75 = 0;
  v74 = 0;
  v58 = 0;
LABEL_71:
  CFRelease(cf);
  CFRelease(v39);
  if (v58)
    CFRelease(v58);
  if (v75)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v93 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v11;
      _os_log_impl(&dword_1BE990000, v93, OS_LOG_TYPE_INFO, "Successfully added our public identity to the share's public PCS at %@", buf, 0xCu);
    }
  }
LABEL_38:
  if (a6)
    *a6 = objc_retainAutorelease(v40);
  if (v75)
  {
    v76 = (void *)objc_opt_new();
    objc_msgSend_setPublicPCSData_(v76, v77, (uint64_t)v75);
    objc_msgSend_setPublicPCSEtag_(v76, v78, (uint64_t)v74);
  }
  else
  {
    v76 = 0;
  }

  return v76;
}

- (void)_validateInvitedPCSCanBeDecryptedForShare:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
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
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  const char *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v32 = v8;
    objc_msgSend_callingParticipant(v6, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v35;
    _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Decrypting the per-participant PCS for calling participant %@", buf, 0xCu);

  }
  v10 = objc_msgSend_sharingServiceTypeForShareMetadata_(self, v9, (uint64_t)v6);
  objc_msgSend_container(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v6, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invitedProtectionData(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callingParticipant(v6, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionInfo(v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = sub_1BEC3D468;
  v36[3] = &unk_1E7838300;
  v37 = v6;
  v38 = v7;
  v29 = v7;
  v30 = v6;
  objc_msgSend_canDecryptInvitedProtectionData_participantProtectionInfo_serviceType_completionHandler_(v16, v31, (uint64_t)v22, v28, v10, v36);

}

- (id)_keySwapForOONParticipant:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
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
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  char *v30;
  const char *v31;
  uint64_t v32;
  _BOOL4 v33;
  void *v34;
  const char *v35;
  NSObject *v36;
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
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  NSObject *v97;
  const char *v98;
  char *v99;
  void *v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  SEL v114;
  char *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  char *v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_privateToken(v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v11 = (void *)v8;
    objc_msgSend_callingParticipant(v5, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userIdentity(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outOfNetworkPrivateKey(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_callingParticipant(v5, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(self, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = 0;
      v29 = (void *)objc_msgSend_copyDiversifiedPublicKeyForService_withError_(v27, v28, 2, &v120);
      v30 = (char *)v120;

      if (*MEMORY[0x1E0C95280]
        && objc_msgSend_checkAndClearUnitTestOverrides_(self, v31, (uint64_t)CFSTR("ForceUserKeyRegistrySyncRetryDuringShareAccept")))
      {

        v29 = 0;
        v33 = v30 == 0;
      }
      else
      {
        v33 = v30 == 0;
        if (!v30 && v29)
        {
          v114 = a2;
          v116 = (uint64_t)v29;
          v117 = v21;
          objc_msgSend_container(self, v31, v32);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsManager(v118, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_callingParticipant(v5, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_userIdentity(v47, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_outOfNetworkPrivateKey(v50, v51, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_privateToken(v5, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_callingParticipant(v5, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_protectionInfo(v59, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = 0;
          objc_msgSend_createProtectionInfoFromOONPrivateKey_privateToken_OONProtectionInfo_error_(v44, v63, (uint64_t)v53, v56, v62, &v119);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = (char *)v119;

          if (v64)
          {
            v67 = v115;
            v21 = v117;
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v29 = (void *)v116;
            v68 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
            {
              v71 = v68;
              objc_msgSend_participantID(v117, v72, v73);
              v74 = (char *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_share(v5, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v77, v78, v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v122 = v74;
              v123 = 2112;
              v124 = v80;
              _os_log_impl(&dword_1BE990000, v71, OS_LOG_TYPE_INFO, "Create protection info in OON key-swap for participantID: %@, recordID: %@", buf, 0x16u);

            }
            objc_msgSend_callingParticipant(v5, v69, v70);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setProtectionInfo_(v81, v82, (uint64_t)v64);

            objc_msgSend_callingParticipant(v5, v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_userIdentity(v85, v86, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPublicSharingKey_(v88, v89, v116);

            objc_msgSend_callingParticipant(v5, v90, v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_userIdentity(v92, v93, v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPublicKeyVersion_(v95, v96, 2);

            v41 = 0;
            goto LABEL_28;
          }
          if (!v115)
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v65, v66);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v112, v113, (uint64_t)v114, self, CFSTR("CKDAcceptSharesOperation.m"), 673, CFSTR("OON key-swap failed, but without error"));

          }
          v29 = (void *)v116;
          v21 = v117;
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v101 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            v102 = v101;
            objc_msgSend_participantID(v117, v103, v104);
            v105 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_share(v5, v106, v107);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v108, v109, v110);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v122 = v105;
            v123 = 2112;
            v124 = v111;
            v125 = 2112;
            v126 = v115;
            _os_log_error_impl(&dword_1BE990000, v102, OS_LOG_TYPE_ERROR, "Failed to create protection info in OON key-swap for participantID: %@, recordID: %@, error: %@", buf, 0x20u);

          }
          v99 = v115;
LABEL_27:
          v67 = v99;
          v41 = v99;
LABEL_28:

          goto LABEL_29;
        }
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v97 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v122 = v30;
        _os_log_error_impl(&dword_1BE990000, v97, OS_LOG_TYPE_ERROR, "Couldn't create a diversified public key for the owner participant: %@", buf, 0xCu);
        if (!v33)
          goto LABEL_26;
      }
      else if (!v33)
      {
LABEL_26:
        v99 = v30;
        goto LABEL_27;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v98, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't create a diversified public key for the owner participant"));
      v30 = (char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v34 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v36 = v34;
    objc_msgSend_privateToken(v5, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = "outOfNetworkPrivateKey";
    if (!v39)
      v40 = "privateToken";
    *(_DWORD *)buf = 136315138;
    v122 = v40;
    _os_log_impl(&dword_1BE990000, v36, OS_LOG_TYPE_INFO, "OON keyswap: Not swapping OON keys as %s is missing", buf, 0xCu);

  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v35, *MEMORY[0x1E0C94B20], 5000, CFSTR("We don't have the necessary keys to perform an OON key swap"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v41;
}

- (BOOL)_callingParticipantOONForShareMetadata:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  int v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  v3 = a3;
  objc_msgSend_callingParticipant(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userIdentity(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasiCloudAccount(v9, v10, v11) & 1) != 0)
  {
    LOBYTE(v14) = 0;
  }
  else
  {
    objc_msgSend_callingParticipant(v3, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_isAnonymousInvitedParticipant(v15, v16, v17) ^ 1;

  }
  return v14;
}

- (void)_prepareShareMetadata
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  int isAnonymousInvitedParticipant;
  const char *v30;
  uint64_t v31;
  int v32;
  void *v33;
  const char *v34;
  char v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  id *v48;
  const char *v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  int canSynchronizeUserKeyRegistry;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  void *v99;
  const char *v100;
  void *v101;
  _BOOL4 v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  void *v112;
  const char *v113;
  void *v114;
  const char *v115;
  void *v116;
  const char *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  _BOOL4 v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  int v137;
  uint64_t v138;
  void *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  int v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  void *v151;
  const char *v152;
  void *v153;
  _BOOL4 v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  void *v162;
  const char *v163;
  void *v164;
  const char *v165;
  void *v166;
  const char *v167;
  void *v168;
  const char *v169;
  const char *v170;
  const char *v171;
  uint64_t v172;
  const char *v173;
  NSObject *v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  id obj;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  _QWORD v186[4];
  id v187;
  uint64_t v188;
  CKDAcceptSharesOperation *v189;
  uint64_t *v190;
  id v191;
  uint64_t v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t (*v195)(uint64_t, uint64_t);
  void (*v196)(uint64_t);
  id v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  uint8_t buf[4];
  uint64_t v203;
  __int16 v204;
  id v205;
  _BYTE v206[128];
  uint64_t v207;

  v207 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareURLsToAccept(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v200 = 0u;
    v201 = 0u;
    v199 = 0u;
    v198 = 0u;
    objc_msgSend_shareMetadatasToAcceptByURL(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v10, v11, v12);
    obj = (id)objc_claimAutoreleasedReturnValue();

    v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v198, v206, 16);
    if (!v185)
      goto LABEL_72;
    v184 = *(_QWORD *)v199;
    v183 = (void *)*MEMORY[0x1E0C94B20];
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v199 != v184)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v198 + 1) + 8 * v16);
        objc_msgSend_shareMetadatasToAcceptByURL(self, v14, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v18, v19, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v192 = 0;
        v193 = &v192;
        v194 = 0x3032000000;
        v195 = sub_1BE9BB1F0;
        v196 = sub_1BE9BAEA0;
        v197 = 0;
        v23 = objc_msgSend_participantStatus(v20, v21, v22);
        objc_msgSend_callingParticipant(v20, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        isAnonymousInvitedParticipant = objc_msgSend_isAnonymousInvitedParticipant(v26, v27, v28);

        if (isAnonymousInvitedParticipant & 1 | (v23 != 2))
        {
          if (v23 == 2)
            v32 = isAnonymousInvitedParticipant;
          else
            v32 = 0;
          if (v32 != 1)
            goto LABEL_15;
        }
        else if ((objc_msgSend__callingParticipantOONForShareMetadata_(self, v30, (uint64_t)v20) & 1) != 0)
        {
          goto LABEL_15;
        }
        objc_msgSend_acceptedShareURLsToFetch(self, v30, v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend_containsObject_(v33, v34, v17);

        if ((v35 & 1) == 0)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v85 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v203 = v17;
            _os_log_impl(&dword_1BE990000, v85, OS_LOG_TYPE_INFO, "Share at URL %@ has already been accepted by an in-network user. Fetching the share instead of re-accepting it", buf, 0xCu);
          }
          objc_msgSend_acceptedShareURLsToFetch(self, v86, v87);
          v50 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v50, v88, v17);
          goto LABEL_69;
        }
LABEL_15:
        v36 = objc_msgSend_sharingServiceTypeForShareMetadata_(self, v30, (uint64_t)v20);
        if (objc_msgSend_participantRole(v20, v37, v38) == 4)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v41 = (id)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_share(v20, v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v44, v45, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v203 = (uint64_t)v47;
            _os_log_impl(&dword_1BE990000, v41, OS_LOG_TYPE_INFO, "Adding ourselves to the public PCS for share %@", buf, 0xCu);

          }
          v48 = (id *)(v193 + 5);
          v191 = (id)v193[5];
          objc_msgSend__addSelfIdentityToShareMetadataPublicPCS_serviceType_forShareWithURL_error_(self, v49, (uint64_t)v20, v36, v17, &v191);
          v50 = (id)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v48, v191);
          if (*MEMORY[0x1E0C95280]
            && objc_msgSend_checkAndClearUnitTestOverrides_(self, v51, (uint64_t)CFSTR("ForceUserKeyRegistrySyncRetryDuringShareAccept")))
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v51, (uint64_t)v183, 5000, CFSTR("Forcing no public identity error"));
            v53 = objc_claimAutoreleasedReturnValue();
            v54 = (void *)v193[5];
            v193[5] = v53;

          }
          v55 = (void *)v193[5];
          if (v55 || !v50)
          {
            objc_msgSend_domain(v55, v51, v52);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            if (v91 == v183 && objc_msgSend_code((void *)v193[5], v89, v90) == 5000)
            {
              canSynchronizeUserKeyRegistry = objc_msgSend_canSynchronizeUserKeyRegistry(self, v92, v93);

              if (canSynchronizeUserKeyRegistry)
              {
                objc_msgSend_URLsWaitingKRSByServiceType(self, v95, v96);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v98, v36);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v97, v100, (uint64_t)v99);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                v102 = v101 == 0;

                if (v102)
                {
                  v105 = (void *)objc_opt_new();
                  objc_msgSend_URLsWaitingKRSByServiceType(self, v106, v107);
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v109, v36);
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v108, v111, (uint64_t)v105, v110);

                }
                objc_msgSend_URLsWaitingKRSByServiceType(self, v103, v104);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v113, v36);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v112, v115, (uint64_t)v114);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v116, v117, v17);

                objc_msgSend_setState_(self, v118, 4);
                goto LABEL_69;
              }
            }
            else
            {

            }
            objc_msgSend__performCallbackForURL_withShare_error_(self, v95, v17, 0, v193[5]);
            objc_msgSend_shareMetadatasToAcceptByURL(self, v119, v120);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeObjectForKey_(v66, v121, v17);
          }
          else
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v56 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v203 = v17;
              v204 = 2112;
              v205 = v50;
              _os_log_impl(&dword_1BE990000, v56, OS_LOG_TYPE_INFO, "Updated share public PCS for share at URL %@ is %@", buf, 0x16u);
            }
            objc_msgSend_publicPCSData(v50, v57, v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_share(v20, v60, v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPublicProtectionData_(v62, v63, (uint64_t)v59);

            objc_msgSend_publicPCSEtag(v50, v64, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_share(v20, v67, v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPublicProtectionEtag_(v69, v70, (uint64_t)v66);

          }
LABEL_69:

          goto LABEL_70;
        }
        if (objc_msgSend_participantRole(v20, v39, v40) != 3 && objc_msgSend_participantRole(v20, v71, v72) != 2)
        {
          v122 = v193[5];
          if (!v122)
          {
            objc_msgSend_outOfNetworkMatches(v20, v71, v73);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = objc_msgSend_count(v123, v124, v125) == 0;

            v129 = (void *)MEMORY[0x1E0C94FF8];
            if (v126)
            {
              v176 = objc_msgSend_participantRole(v20, v127, v128);
              objc_msgSend_errorWithDomain_code_format_(v129, v177, (uint64_t)v183, 2007, CFSTR("Can not accept share at URL %@ because participant type %ld is unsupported"), v17, v176);
            }
            else
            {
              objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v127, (uint64_t)v183, 8000, CFSTR("Can not accept share at URL %@: vetting of the invited email is needed"), v17);
            }
            v130 = objc_claimAutoreleasedReturnValue();
            v178 = (void *)v193[5];
            v193[5] = v130;

            v122 = v193[5];
          }
          objc_msgSend__performCallbackForURL_withShare_error_(self, v71, v17, 0, v122);
          objc_msgSend_shareMetadatasToAcceptByURL(self, v179, v180);
          v50 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v50, v181, v17);
          goto LABEL_69;
        }
        if (objc_msgSend__callingParticipantOONForShareMetadata_(self, v71, (uint64_t)v20))
        {
          objc_msgSend_container(self, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsManager(v76, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_currentServiceIsManatee(v79, v80, v81))
          {

            goto LABEL_53;
          }
          objc_msgSend_container(self, v82, v83);
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_options(v131, v132, v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = objc_msgSend_useAnonymousToServerShareParticipants(v134, v135, v136);

          if (v137)
          {
LABEL_53:
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v84, (uint64_t)v183, 8014, CFSTR("Cannot accept share %@ as an out-of-network participant"), v17);
            v138 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend__keySwapForOONParticipant_(self, v84, (uint64_t)v20);
            v138 = objc_claimAutoreleasedReturnValue();
          }
          v139 = (void *)v193[5];
          v193[5] = v138;

        }
        v140 = (void *)v193[5];
        if (!v140)
        {
          objc_msgSend_stateTransitionGroup(self, v74, v75);
          v174 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v174);

          v186[0] = MEMORY[0x1E0C809B0];
          v186[1] = 3221225472;
          v186[2] = sub_1BEC3E800;
          v186[3] = &unk_1E7838328;
          v187 = v20;
          v188 = v17;
          v189 = self;
          v190 = &v192;
          objc_msgSend__validateInvitedPCSCanBeDecryptedForShare_completionHandler_(self, v175, (uint64_t)v187, v186);
          v50 = v187;
          goto LABEL_69;
        }
        objc_msgSend_domain(v140, v74, v75);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        if (v143 != v183 || objc_msgSend_code((void *)v193[5], v141, v142) != 5000)
        {

LABEL_64:
          objc_msgSend__performCallbackForURL_withShare_error_(self, v147, v17, 0, v193[5]);
          objc_msgSend_shareMetadatasToAcceptByURL(self, v171, v172);
          v50 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v50, v173, v17);
          goto LABEL_69;
        }
        v146 = objc_msgSend_canSynchronizeUserKeyRegistry(self, v144, v145);

        if (!v146)
          goto LABEL_64;
        objc_msgSend_URLsWaitingKRSByServiceType(self, v147, v148);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v150, v36);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v149, v152, (uint64_t)v151);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v153 == 0;

        if (v154)
        {
          v157 = (void *)objc_opt_new();
          objc_msgSend_URLsWaitingKRSByServiceType(self, v158, v159);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v161, v36);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v160, v163, (uint64_t)v157, v162);

        }
        objc_msgSend_URLsWaitingKRSByServiceType(self, v155, v156);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v165, v36);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v164, v167, (uint64_t)v166);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v168, v169, v17);

        objc_msgSend_setState_(self, v170, 4);
LABEL_70:
        _Block_object_dispose(&v192, 8);

        ++v16;
      }
      while (v185 != v16);
      v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v198, v206, 16);
      if (!v185)
      {
LABEL_72:

        return;
      }
    }
  }
}

- (void)_synchronizeUserKeyRegistryIfNeeded
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  int v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  id obj;
  void *v47;
  _QWORD v48[4];
  id v49;
  CKDAcceptSharesOperation *v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_canSynchronizeUserKeyRegistry(self, a2, v2))
  {
    objc_msgSend_URLsWaitingKRSByServiceType(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_count(v9, v10, v11);

    if (v12)
    {
      objc_msgSend_setCanSynchronizeUserKeyRegistry_(self, v13, 0);
      objc_msgSend_topmostParentOperation(self, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(v16, v17, v18);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v19 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v59 = v47;
        _os_log_impl(&dword_1BE990000, v19, OS_LOG_TYPE_INFO, "Will attempt user key sync for operation %{public}@.", buf, 0xCu);
      }
      objc_msgSend_URLsWaitingKRSByServiceType(self, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allKeys(v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = v25;
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v53, v57, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v54 != v30)
              objc_enumerationMutation(obj);
            v32 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            v33 = objc_msgSend_intValue(v32, v27, v28);
            objc_initWeak((id *)buf, self);
            objc_msgSend_noteOperationWillWaitOnPCS(self, v34, v35);
            objc_msgSend_stateTransitionGroup(self, v36, v37);
            v38 = objc_claimAutoreleasedReturnValue();
            dispatch_group_enter(v38);

            objc_msgSend_container(self, v39, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_pcsManager(v41, v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v48[0] = MEMORY[0x1E0C809B0];
            v48[1] = 3221225472;
            v48[2] = sub_1BEC3EDB8;
            v48[3] = &unk_1E7838350;
            objc_copyWeak(&v52, (id *)buf);
            v49 = v47;
            v50 = self;
            v51 = v32;
            objc_msgSend_synchronizeUserKeyRegistryForServiceType_shouldThrottle_context_requestorOperationID_completionHandler_(v44, v45, v33, 1, 0x1E784B7E8, v49, v48);

            objc_destroyWeak(&v52);
            objc_destroyWeak((id *)buf);
          }
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v53, v57, 16);
        }
        while (v29);
      }

    }
  }
}

- (void)_fetchMetadataForShares
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  NSObject *v82;
  id v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  id v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const __CFString *v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  int IsManatee;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t i;
  uint64_t v129;
  void *v130;
  const char *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  void *v145;
  id obj;
  id obja;
  _QWORD v148[5];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _QWORD v153[6];
  id v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _QWORD v159[6];
  void *v160;
  _QWORD block[6];
  void *v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  uint8_t v167[128];
  uint8_t buf[4];
  uint64_t v169;
  __int16 v170;
  uint64_t v171;
  __int16 v172;
  void *v173;
  _BYTE v174[128];
  _BYTE v175[128];
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  v145 = (void *)objc_opt_new();
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  objc_msgSend_shareURLsToAccept(self, v3, v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v163, v175, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v164;
    v11 = *MEMORY[0x1E0C94B20];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v164 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * v12);
        objc_msgSend_clientProvidedMetadatasByURL(self, v7, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v14, v15, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_container(self, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsManager(v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_currentServiceIsManatee(v22, v23, v24) & 1) != 0)
        {
          objc_msgSend_invitationToken(v16, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v30 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v169 = v13;
              _os_log_impl(&dword_1BE990000, v30, OS_LOG_TYPE_INFO, "Failing to accept manatee share with URL %@ since we were not given a sharing invitation blob by the client", buf, 0xCu);
            }
            objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v31, v11, 2006, 0, CFSTR("Error accepting share at URL %@: No manatee sharing invitation blob provided"), v13);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_callbackQueue(self, v33, v34);
            v35 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = sub_1BEC3F9CC;
            block[3] = &unk_1E782E418;
            block[4] = self;
            block[5] = v13;
            v162 = v32;
            v36 = v32;
            dispatch_async(v35, block);

            v37 = v162;
            goto LABEL_22;
          }
        }
        else
        {

        }
        if (objc_msgSend_participantRole(v16, v28, v29) != 1 && objc_msgSend_participantRole(v16, v38, v39))
        {
          objc_msgSend_addObject_(v145, v40, v13);
          goto LABEL_23;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v41 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v44 = v41;
          objc_msgSend_participantRole(v16, v45, v46);
          CKStringFromParticipantRole();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v169 = v13;
          v170 = 2114;
          v171 = (uint64_t)v47;
          _os_log_impl(&dword_1BE990000, v44, OS_LOG_TYPE_INFO, "Failing to accept share with URL %@ since we are ineligible to accept as role %{public}@", buf, 0x16u);

        }
        v48 = (void *)MEMORY[0x1E0C94FF8];
        objc_msgSend_participantRole(v16, v42, v43);
        CKStringFromParticipantRole();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_format_(v48, v50, v11, 2006, 0, CFSTR("Error accepting share at URL %@: %@ participant tried to accept share"), v13, v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_callbackQueue(self, v52, v53);
        v54 = objc_claimAutoreleasedReturnValue();
        v159[0] = MEMORY[0x1E0C809B0];
        v159[1] = 3221225472;
        v159[2] = sub_1BEC3FA3C;
        v159[3] = &unk_1E782E418;
        v159[4] = self;
        v159[5] = v13;
        v160 = v51;
        v36 = v51;
        dispatch_async(v54, v159);

        v37 = v160;
LABEL_22:

LABEL_23:
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v163, v175, 16);
    }
    while (v9);
  }

  objc_msgSend_setShareURLsToAccept_(self, v55, (uint64_t)v145);
  objc_msgSend_shareURLsToAccept(self, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_count(v58, v59, v60);

  if (v61)
  {
    if (objc_msgSend_numShareAcceptAttempts(self, v62, v63)
      && (unint64_t)objc_msgSend_numShareAcceptAttempts(self, v64, v65) >= 5)
    {
      v157 = 0u;
      v158 = 0u;
      v155 = 0u;
      v156 = 0u;
      objc_msgSend_shareURLsToAccept(self, v64, v65);
      obja = (id)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v66, (uint64_t)&v155, v174, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v156;
        v70 = *MEMORY[0x1E0C94B20];
        do
        {
          v71 = 0;
          do
          {
            if (*(_QWORD *)v156 != v69)
              objc_enumerationMutation(obja);
            v72 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * v71);
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v73 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
            {
              v75 = v73;
              v78 = objc_msgSend_numShareAcceptAttempts(self, v76, v77);
              *(_DWORD *)buf = 138412546;
              v169 = v72;
              v170 = 2048;
              v171 = v78;
              _os_log_impl(&dword_1BE990000, v75, OS_LOG_TYPE_INFO, "Failed to accept share with URL %@ %lu times with a PCS oplock error", buf, 0x16u);

            }
            objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v74, v70, 2037, 0, CFSTR("Error accepting share at URL %@: Protection data didn't match"), v72);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_callbackQueue(self, v80, v81);
            v82 = objc_claimAutoreleasedReturnValue();
            v153[0] = MEMORY[0x1E0C809B0];
            v153[1] = 3221225472;
            v153[2] = sub_1BEC3FAAC;
            v153[3] = &unk_1E782E418;
            v153[4] = self;
            v153[5] = v72;
            v154 = v79;
            v83 = v79;
            dispatch_async(v82, v153);

            ++v71;
          }
          while (v68 != v71);
          v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v84, (uint64_t)&v155, v174, 16);
        }
        while (v68);
      }

      objc_msgSend_shareURLsToAccept(self, v85, v86);
      v87 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeAllObjects(v87, v88, v89);
    }
    else
    {
      objc_msgSend_shareMetadatasToAcceptByURL(self, v64, v65);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeAllObjects(v90, v91, v92);

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v93 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v96 = v93;
        objc_msgSend_shareURLsToAccept(self, v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = objc_msgSend_count(v99, v100, v101);
        objc_msgSend_shareURLsToAccept(self, v103, v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend_count(v105, v106, v107) <= 1)
          v110 = &stru_1E7838F48;
        else
          v110 = CFSTR("s");
        objc_msgSend_shareURLsToAccept(self, v108, v109);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v169 = v102;
        v170 = 2114;
        v171 = (uint64_t)v110;
        v172 = 2112;
        v173 = v111;
        _os_log_impl(&dword_1BE990000, v96, OS_LOG_TYPE_INFO, "Fetching share metadata for %ld URL%{public}@: %@", buf, 0x20u);

      }
      objc_msgSend_container(self, v94, v95);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v112, v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      IsManatee = objc_msgSend_currentServiceIsManatee(v115, v116, v117);

      if (IsManatee)
      {
        v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v149 = 0u;
        v150 = 0u;
        v151 = 0u;
        v152 = 0u;
        objc_msgSend_shareURLsToAccept(self, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v122, (uint64_t)&v149, v167, 16);
        if (v123)
        {
          v126 = v123;
          v127 = *(_QWORD *)v150;
          do
          {
            for (i = 0; i != v126; ++i)
            {
              if (*(_QWORD *)v150 != v127)
                objc_enumerationMutation(v121);
              v129 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * i);
              objc_msgSend_clientProvidedMetadatasByURL(self, v124, v125);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v130, v131, v129);
              v132 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_invitationToken(v132, v133, v134);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v87, v136, (uint64_t)v135, v129);

            }
            v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v124, (uint64_t)&v149, v167, 16);
          }
          while (v126);
        }

      }
      else
      {
        v87 = 0;
      }
      v137 = (void *)objc_opt_new();
      objc_msgSend_shareURLsToAccept(self, v138, v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setShareURLsToFetch_(v137, v141, (uint64_t)v140);

      objc_msgSend_setShareInvitationTokensByShareURL_(v137, v142, (uint64_t)v87);
      v143 = objc_opt_class();
      v148[0] = MEMORY[0x1E0C809B0];
      v148[1] = 3221225472;
      v148[2] = sub_1BEC3FB1C;
      v148[3] = &unk_1E782E508;
      v148[4] = self;
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v144, v143, v137, v148);

    }
  }

}

- (void)_processAnonymousShares
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
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
  _QWORD v21[4];
  id v22;
  id location;

  objc_msgSend_anonymousShareTuplesAccepted(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    objc_initWeak(&location, self);
    objc_msgSend_stateTransitionGroup(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);

    objc_msgSend_container(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_anonymousSharingManager(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_anonymousShareTuplesAccepted(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1BEC4001C;
    v21[3] = &unk_1E78309E8;
    objc_copyWeak(&v22, &location);
    objc_msgSend_addAnonymousSharesToSharedDB_operation_withCompletionBlock_(v16, v20, (uint64_t)v19, self, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  _BOOL8 v7;
  const char *v8;

  objc_msgSend_shareURLsToAccept(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6) == 0;

  objc_msgSend_makeStateTransition_(self, v8, v7);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setAcceptCompletionBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDAcceptSharesOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)acceptCompletionBlock
{
  return self->_acceptCompletionBlock;
}

- (void)setAcceptCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSMutableDictionary)clientProvidedMetadatasByURL
{
  return self->_clientProvidedMetadatasByURL;
}

- (void)setClientProvidedMetadatasByURL:(id)a3
{
  objc_storeStrong((id *)&self->_clientProvidedMetadatasByURL, a3);
}

- (NSMutableArray)shareURLsToAccept
{
  return self->_shareURLsToAccept;
}

- (void)setShareURLsToAccept:(id)a3
{
  objc_storeStrong((id *)&self->_shareURLsToAccept, a3);
}

- (NSMutableArray)acceptedShareURLsToFetch
{
  return self->_acceptedShareURLsToFetch;
}

- (void)setAcceptedShareURLsToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedShareURLsToFetch, a3);
}

- (NSMutableDictionary)shareMetadatasToAcceptByURL
{
  return self->_shareMetadatasToAcceptByURL;
}

- (void)setShareMetadatasToAcceptByURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadatasToAcceptByURL, a3);
}

- (unint64_t)numShareAcceptAttempts
{
  return self->_numShareAcceptAttempts;
}

- (void)setNumShareAcceptAttempts:(unint64_t)a3
{
  self->_numShareAcceptAttempts = a3;
}

- (BOOL)canSynchronizeUserKeyRegistry
{
  return self->_canSynchronizeUserKeyRegistry;
}

- (void)setCanSynchronizeUserKeyRegistry:(BOOL)a3
{
  self->_canSynchronizeUserKeyRegistry = a3;
}

- (NSMutableDictionary)URLsWaitingKRSByServiceType
{
  return self->_URLsWaitingKRSByServiceType;
}

- (void)setURLsWaitingKRSByServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_URLsWaitingKRSByServiceType, a3);
}

- (NSMutableDictionary)anonymousShareTuplesAcceptAttempted
{
  return self->_anonymousShareTuplesAcceptAttempted;
}

- (void)setAnonymousShareTuplesAcceptAttempted:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousShareTuplesAcceptAttempted, a3);
}

- (NSMutableArray)anonymousShareTuplesAccepted
{
  return self->_anonymousShareTuplesAccepted;
}

- (void)setAnonymousShareTuplesAccepted:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousShareTuplesAccepted, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousShareTuplesAccepted, 0);
  objc_storeStrong((id *)&self->_anonymousShareTuplesAcceptAttempted, 0);
  objc_storeStrong((id *)&self->_URLsWaitingKRSByServiceType, 0);
  objc_storeStrong((id *)&self->_shareMetadatasToAcceptByURL, 0);
  objc_storeStrong((id *)&self->_acceptedShareURLsToFetch, 0);
  objc_storeStrong((id *)&self->_shareURLsToAccept, 0);
  objc_storeStrong((id *)&self->_clientProvidedMetadatasByURL, 0);
  objc_storeStrong(&self->_acceptCompletionBlock, 0);
}

@end
