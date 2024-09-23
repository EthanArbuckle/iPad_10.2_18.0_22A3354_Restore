@implementation CKDFetchShareParticipantKeyOperation

- (CKDFetchShareParticipantKeyOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchShareParticipantKeyOperation *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *shareIDs;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *baseTokensByShareID;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *childRecordIDsByShareID;
  uint64_t v23;
  NSMutableDictionary *sharesNeedingUpdateByID;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKDFetchShareParticipantKeyOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v26, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_shareIDs(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_mutableCopy(v10, v11, v12);
    shareIDs = v9->_shareIDs;
    v9->_shareIDs = (NSMutableArray *)v13;

    objc_msgSend_baseTokensByShareID(v6, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    baseTokensByShareID = v9->_baseTokensByShareID;
    v9->_baseTokensByShareID = (NSDictionary *)v17;

    objc_msgSend_childRecordIDsByShareID(v6, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    childRecordIDsByShareID = v9->_childRecordIDsByShareID;
    v9->_childRecordIDsByShareID = (NSDictionary *)v21;

    v23 = objc_opt_new();
    sharesNeedingUpdateByID = v9->_sharesNeedingUpdateByID;
    v9->_sharesNeedingUpdateByID = (NSMutableDictionary *)v23;

  }
  return v9;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  char hasAttemptedShareUpdate;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      goto LABEL_4;
    case 2:
      objc_msgSend_sharesNeedingUpdateByID(self, v5, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v9, v10, v11))
      {
        hasAttemptedShareUpdate = objc_msgSend_hasAttemptedShareUpdate(self, v12, v13);

        if ((hasAttemptedShareUpdate & 1) == 0)
        {
          objc_msgSend_setState_(self, v15, 3);
          objc_msgSend_setHasAttemptedShareUpdate_(self, v17, 1);
          objc_msgSend_updateShares(self, v18, v19);
          return 1;
        }
      }
      else
      {

      }
      objc_msgSend__sendErrorForFailedShares(self, v15, v16);
      objc_msgSend_setState_(self, v20, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v24, (uint64_t)v23);

      return 1;
    case 1:
LABEL_4:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend_fetchSharesFromServer(self, v7, v8);
      break;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 2)
    return CFSTR("Fetching Shares");
  if (a3 == 3)
  {
    v5 = CFSTR("Updating Shares");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchShareParticipantKeyOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-share-participant-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_performCallbackForShareID:(id)a3 withParticipantKey:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_shareParticipantKeyFetchedBlock(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)*MEMORY[0x1E0C952F8];
    if (v9)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v14);
      v15 = *MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      v18 = "Returning participant key for share %@";
      v19 = v15;
      v20 = 12;
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v14);
      v21 = *MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      v29 = 2112;
      v30 = v10;
      v18 = "Returning error for share %@: %@";
      v19 = v21;
      v20 = 22;
    }
    _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, v18, buf, v20);
LABEL_10:
    objc_msgSend_callbackQueue(self, v16, v17);
    v22 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1BEBE8790;
    v23[3] = &unk_1E782F4A8;
    v23[4] = self;
    v24 = v8;
    v25 = v9;
    v26 = v10;
    dispatch_async(v22, v23);

  }
}

- (void)_sendErrorForFailedShares
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend_sharesNeedingUpdateByID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v18, v22, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v19;
    v13 = *MEMORY[0x1E0C94B20];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v7);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v10, v13, 2043, CFSTR("Share %@ couldn't be upgraded"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__performCallbackForShareID_withParticipantKey_error_(self, v17, v15, 0, v16);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v18, v22, 16);
    }
    while (v11);
  }

}

- (void)_participantKeyFromShare:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
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
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
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
  void *v34;
  const char *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  void (**v71)(id, uint64_t, uint64_t);
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = sub_1BE9BB170;
  v92 = sub_1BE9BAE60;
  v93 = 0;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = sub_1BE9BB170;
  v86 = sub_1BE9BAE60;
  v87 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = sub_1BE9BB170;
  v80 = sub_1BE9BAE60;
  v81 = 0;
  objc_msgSend_childRecordIDsByShareID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_container(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortToken(v6, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v36 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_recordID(v6, v37, v38);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v66;
      _os_log_debug_impl(&dword_1BE990000, v36, OS_LOG_TYPE_DEBUG, "Couldn't get a short token for share %@", (uint8_t *)location, 0xCu);

    }
    v39 = (void *)MEMORY[0x1E0C94FF8];
    objc_msgSend_recordID(v6, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v39, v43, *MEMORY[0x1E0C94B20], 2003, CFSTR("Couldn't get a short token for share %@"), v42);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v83[5];
    v83[5] = v44;

    v46 = 0;
    v47 = v83[5];
    goto LABEL_13;
  }
  if (objc_msgSend_publicPermission(v6, v21, v22) != 1)
  {
    v48 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_containerScopedUserID(v18, v24, v25);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend_recordName(v15, v49, v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKBase64EncodedURLSafeString(v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v48, v56, (uint64_t)CFSTR("v3:%@:%@:%@"), v23, v51, v55);
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = (void *)v89[5];
      v89[5] = v57;

    }
    else
    {
      objc_msgSend_stringWithFormat_(v48, v49, (uint64_t)CFSTR("v1:%@:%@"), v23, v51);
      v59 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)v89[5];
      v89[5] = v59;
    }

    objc_msgSend_dataUsingEncoding_((void *)v89[5], v60, 4);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKBase64URLSafeString(v61, v62, v63);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)v77[5];
    v77[5] = v64;

    v47 = 0;
    v46 = v77[5];
LABEL_13:
    v7[2](v7, v46, v47);
    goto LABEL_14;
  }
  objc_initWeak(location, v18);
  objc_msgSend_pcsManager(v18, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUserParticipant(v6, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionInfo(v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = sub_1BEBE8E64;
  v67[3] = &unk_1E78370F8;
  objc_copyWeak(&v75, location);
  v71 = v7;
  v72 = &v82;
  v68 = v15;
  v73 = &v88;
  v69 = v23;
  v70 = v6;
  v74 = &v76;
  objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(v28, v35, (uint64_t)v34, 4, 2, v67);

  objc_destroyWeak(&v75);
  objc_destroyWeak(location);
LABEL_14:

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);

  _Block_object_dispose(&v88, 8);
}

- (void)_handleFetchedShare:(id)a3 withID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
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
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  NSObject *v48;
  const char *v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  _QWORD v57[5];
  id v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
    goto LABEL_15;
  if (!v8)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 2003, CFSTR("Couldn't fetch a share with ID %@"), v9);
LABEL_14:
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v35 = v10;
    objc_msgSend__performCallbackForShareID_withParticipantKey_error_(self, v11, (uint64_t)v9, 0, v10);

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v12, *MEMORY[0x1E0C94B20], 2020, CFSTR("Item with ID %@ was not a share"), v9);
    goto LABEL_14;
  }
  objc_msgSend_baseTokensByShareID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v8, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v18, (uint64_t)v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBaseToken_(v8, v20, (uint64_t)v19);

  objc_msgSend_baseToken(v8, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v50 = v26;
      objc_msgSend_baseToken(v8, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v8, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v53;
      v61 = 2112;
      v62 = v56;
      _os_log_debug_impl(&dword_1BE990000, v50, OS_LOG_TYPE_DEBUG, "Using base token \"%{public}@\" on share %@", buf, 0x16u);

    }
  }
  if (objc_msgSend_publicPermission(v8, v24, v25) != 1)
    goto LABEL_23;
  objc_msgSend_currentUserParticipant(v8, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionInfo(v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {

LABEL_23:
    objc_msgSend_stateTransitionGroup(self, v27, v28);
    v48 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v48);

    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = sub_1BEBE98DC;
    v57[3] = &unk_1E7837120;
    v57[4] = self;
    v58 = v9;
    objc_msgSend__participantKeyFromShare_completionHandler_(self, v49, (uint64_t)v8, v57);

    goto LABEL_16;
  }
  objc_msgSend_currentUserParticipant(v8, v33, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_role(v36, v37, v38);

  if (v39 != 1)
    goto LABEL_23;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v40 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v9;
    _os_log_debug_impl(&dword_1BE990000, v40, OS_LOG_TYPE_DEBUG, "Share %@ needs to be updated on the server so that it gets a PPPCS for the owner", buf, 0xCu);
  }
  objc_msgSend_sharesNeedingUpdateByID(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v8, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v43, v47, (uint64_t)v8, v46);

LABEL_16:
}

- (void)fetchSharesFromServer
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
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareIDs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    objc_msgSend_stateTransitionGroup(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v21 = v11;
      objc_msgSend_shareIDs(self, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_count(v24, v25, v26);
      objc_msgSend_operationID(self, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v33 = v27;
      v34 = 2114;
      v35 = v30;
      _os_log_debug_impl(&dword_1BE990000, v21, OS_LOG_TYPE_DEBUG, "Fetching %lu shares from the server for operation %{public}@", buf, 0x16u);

    }
    v12 = (void *)objc_opt_new();
    objc_msgSend_shareIDs(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordIDs_(v12, v16, (uint64_t)v15);

    objc_msgSend_setDesiredKeys_(v12, v17, MEMORY[0x1E0C9AA60]);
    v18 = objc_opt_class();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1BEBE9B9C;
    v31[3] = &unk_1E782E508;
    v31[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v19, v18, v12, v31);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v20 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "No shares to fetch from the server. Returning early", buf, 2u);
    }
  }
}

- (void)updateShares
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  _QWORD v31[5];

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  objc_msgSend_shareIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v7, v8, v9);

  v12 = (void *)objc_opt_new();
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("NoProtectectionInfoTagOnShareUpgrade"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend_sharesNeedingUpdateByID(self, v10, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allValues(v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setPreviousProtectionEtagFromUnitTest_(v22, v23, (uint64_t)&stru_1E7838F48);
    }
  }
  objc_msgSend_sharesNeedingUpdateByID(self, v10, v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordsToSave_(v12, v28, (uint64_t)v27);

  v29 = objc_opt_class();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1BEBEA0AC;
  v31[3] = &unk_1E782E508;
  v31[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v30, v29, v12, v31);

}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  _BOOL8 v7;
  const char *v8;

  objc_msgSend_shareIDs(self, a2, v2);
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
  objc_msgSend_setShareParticipantKeyFetchedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchShareParticipantKeyOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)shareParticipantKeyFetchedBlock
{
  return self->_shareParticipantKeyFetchedBlock;
}

- (void)setShareParticipantKeyFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSMutableArray)shareIDs
{
  return self->_shareIDs;
}

- (void)setShareIDs:(id)a3
{
  objc_storeStrong((id *)&self->_shareIDs, a3);
}

- (NSDictionary)baseTokensByShareID
{
  return self->_baseTokensByShareID;
}

- (void)setBaseTokensByShareID:(id)a3
{
  objc_storeStrong((id *)&self->_baseTokensByShareID, a3);
}

- (NSDictionary)childRecordIDsByShareID
{
  return self->_childRecordIDsByShareID;
}

- (void)setChildRecordIDsByShareID:(id)a3
{
  objc_storeStrong((id *)&self->_childRecordIDsByShareID, a3);
}

- (NSMutableDictionary)sharesNeedingUpdateByID
{
  return self->_sharesNeedingUpdateByID;
}

- (void)setSharesNeedingUpdateByID:(id)a3
{
  objc_storeStrong((id *)&self->_sharesNeedingUpdateByID, a3);
}

- (BOOL)hasAttemptedShareUpdate
{
  return self->_hasAttemptedShareUpdate;
}

- (void)setHasAttemptedShareUpdate:(BOOL)a3
{
  self->_hasAttemptedShareUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharesNeedingUpdateByID, 0);
  objc_storeStrong((id *)&self->_childRecordIDsByShareID, 0);
  objc_storeStrong((id *)&self->_baseTokensByShareID, 0);
  objc_storeStrong((id *)&self->_shareIDs, 0);
  objc_storeStrong(&self->_shareParticipantKeyFetchedBlock, 0);
}

@end
