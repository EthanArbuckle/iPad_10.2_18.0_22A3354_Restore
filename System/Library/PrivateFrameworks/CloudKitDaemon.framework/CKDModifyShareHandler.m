@implementation CKDModifyShareHandler

+ (id)modifyHandlerWithShare:(id)a3 operation:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  v9 = (void *)objc_msgSend__initWithRecord_operation_(v7, v8, (uint64_t)v6, v5);

  objc_msgSend_setState_(v9, v10, 0);
  return v9;
}

+ (id)modifyHandlerForDeleteWithShareID:(id)a3 operation:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  v9 = (void *)objc_msgSend__initForDeleteWithRecordID_operation_(v7, v8, (uint64_t)v6, v5);

  objc_msgSend_setState_(v9, v10, 0);
  return v9;
}

- (CKRecordID)shareID
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_recordID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend_share(self, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v9, v10, v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (CKRecordID *)v8;
}

- (BOOL)isShare
{
  return 1;
}

- (BOOL)isCloudDocsContainer
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
  BOOL v12;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_specialContainerType(v9, v10, v11) == 4;

  return v12;
}

- (unint64_t)serviceType
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
  unint64_t v12;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_serviceTypeForSharing(v9, v10, v11);

  return v12;
}

- (id)sideEffectRecordIDs
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  char isKnownToServer;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v27;
  const char *v28;

  if (objc_msgSend_state(self, a2, v2))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, CFSTR("CKDModifyShareHandler.m"), 106, CFSTR("%s called on handler %@ but it isn't in the state %s"), "-[CKDModifyShareHandler sideEffectRecordIDs]", self, "CKDModifyRecordHandlerStateNeedRecordSideEffects");

  }
  objc_msgSend_share(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootRecordID(v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v20 = 0;
LABEL_8:

    return v20;
  }
  v13 = (void *)v10;
  objc_msgSend_share(self, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isKnownToServer = objc_msgSend_isKnownToServer(v14, v15, v16);

  if ((isKnownToServer & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend_share(self, v18, v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rootRecordID(v7, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithObject_(v21, v25, (uint64_t)v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v20 = 0;
  return v20;
}

- (void)noteSideEffectRecordPendingModify:(id)a3
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
  int isEqual;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  id v22;

  v22 = a3;
  objc_msgSend_recordID(v22, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootRecordID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v6, v13, (uint64_t)v12);

  if (isEqual)
  {
    v15 = objc_alloc(MEMORY[0x1E0C950C0]);
    objc_msgSend_share(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend_initWithRecord_action_(v15, v19, (uint64_t)v18, 0);
    objc_msgSend_setShare_(v22, v21, (uint64_t)v20);

  }
}

- (void)noteSideEffectRecordPendingDelete:(id)a3
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
  int isEqual;
  const char *v16;
  uint64_t v17;
  const char *v18;
  id v19;

  v4 = a3;
  objc_msgSend_record(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v13, v14, (uint64_t)v4);

  if (isEqual)
  {
    objc_msgSend_record(self, v16, v17);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShare_(v19, v18, 0);

  }
}

- (void)fetchSharePCSData
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
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
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  NSObject *v40;
  id v41;
  void *v42;
  const char *v43;
  _QWORD block[4];
  id v45;
  _QWORD *v46;
  _QWORD *v47;
  id v48;
  _QWORD v49[5];
  NSObject *v50;
  _QWORD *v51;
  _QWORD *v52;
  id v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[3];
  char v57;
  id location;
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, v2) != 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, CFSTR("CKDModifyShareHandler.m"), 132, CFSTR("%s called on handler %@ but it isn't in the state %s"), "-[CKDModifyShareHandler fetchSharePCSData]", self, "CKDModifyRecordHandlerStateNeedSharePCSData");

  }
  objc_msgSend_operation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stateTransitionGroup(v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v10);

  objc_initWeak(&location, self);
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v57 = 1;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = sub_1BE9BB068;
  v54[4] = sub_1BE9BADE8;
  v55 = 0;
  objc_msgSend_share(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_group_create();
  objc_msgSend_invitedProtectionData(v13, v15, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  if (v19)
  {
    objc_msgSend_publicProtectionData(v13, v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

    if (!v22)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v23 = (id)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_shareID(self, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v60 = v26;
        _os_log_impl(&dword_1BE990000, v23, OS_LOG_TYPE_INFO, "Share %@ already has PCS data. Decrypting it.", buf, 0xCu);

      }
      dispatch_group_enter(v14);
      objc_msgSend_pcsManager(self, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_share(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_topmostParentOperation(v7, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v20;
      v49[1] = 3221225472;
      v49[2] = sub_1BEB20298;
      v49[3] = &unk_1E7833CA0;
      objc_copyWeak(&v53, &location);
      v52 = v56;
      v51 = v54;
      v49[4] = self;
      v50 = v14;
      objc_msgSend_pcsDataFromFetchedShare_requestorOperationID_completionHandler_(v29, v39, (uint64_t)v32, v38, v49);

      objc_destroyWeak(&v53);
    }
  }
  objc_msgSend_modifyRecordsQueue(v7, v17, v18);
  v40 = objc_claimAutoreleasedReturnValue();
  block[0] = v20;
  block[1] = 3221225472;
  block[2] = sub_1BEB204D0;
  block[3] = &unk_1E7833D90;
  objc_copyWeak(&v48, &location);
  v47 = v54;
  v45 = v7;
  v46 = v56;
  v41 = v7;
  dispatch_group_notify(v14, v40, block);

  objc_destroyWeak(&v48);
  _Block_object_dispose(v54, 8);

  _Block_object_dispose(v56, 8);
  objc_destroyWeak(&location);
}

- (void)_fetchSharePCSData
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[6];
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD *v30;
  id v31;
  id location;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_operation(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stateTransitionGroup(v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v7);

  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_1BE9BB068;
  v35[4] = sub_1BE9BADE8;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1BE9BB068;
  v33[4] = sub_1BE9BADE8;
  v34 = 0;
  objc_initWeak(&location, self);
  v8 = dispatch_group_create();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v9 = (id)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_shareID(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v12;
    _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Fetching PCS data for share %@", buf, 0xCu);

  }
  dispatch_group_enter(v8);
  objc_msgSend_pcsCache(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BEB20870;
  v27[3] = &unk_1E7833CF0;
  objc_copyWeak(&v31, &location);
  v20 = v8;
  v28 = v20;
  v29 = v35;
  v30 = v33;
  objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v15, v21, (uint64_t)v18, v4, 0, v27);

  objc_msgSend_modifyRecordsQueue(v4, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = sub_1BEB213B4;
  v25[3] = &unk_1E7833D18;
  objc_copyWeak(&v26, &location);
  v25[4] = v35;
  v25[5] = v33;
  dispatch_group_notify(v20, v24, v25);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&location);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
}

- (void)_fetchRootRecordPublicSharingIdentityWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
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
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_share(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootRecordID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)*MEMORY[0x1E0C952F8];
  if (v10)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v12 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v27 = v12;
      objc_msgSend_share(self, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rootRecordID(v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v33;
      _os_log_debug_impl(&dword_1BE990000, v27, OS_LOG_TYPE_DEBUG, "Fetching public sharing identity for root record %@", buf, 0xCu);

    }
    objc_msgSend_pcsCache(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_share(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rootRecordID(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operation(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = sub_1BEB216B0;
    v38[3] = &unk_1E7833D40;
    v39 = v4;
    objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v15, v25, (uint64_t)v21, v24, 0, v38);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v26 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v34 = v26;
      objc_msgSend_shareID(self, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v37;
      _os_log_debug_impl(&dword_1BE990000, v34, OS_LOG_TYPE_DEBUG, "Share %@ has no root record ID, so we'll generate a new PSI for the share", buf, 0xCu);

    }
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (id)_createNewSharePCSDataWithError:(id *)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  dispatch_block_t *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  const void *RandomSharingIdentityWithError;
  id v50;
  void *v51;
  const char *v52;
  id v53;
  NSObject *v54;
  const char *v55;
  _BOOL8 v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  void *v63;
  id v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  const char *v79;
  id v80;
  id v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_operation(self, a2, (uint64_t)a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unitTestOverrides(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("DisallowSharePCSToBeCreated"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v78, v79, (uint64_t)a2, self, CFSTR("CKDModifyShareHandler.m"), 274, CFSTR("Share PCS creation not allowed by unit test"));

    }
  }
  objc_msgSend_share(self, a2, (uint64_t)a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_databaseScope(v15, v16, v17) != 2 && objc_msgSend_databaseScope(v15, v18, v19) != 3)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v54 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v54, OS_LOG_TYPE_ERROR, "Someone is trying to save a share in the public database. That's not going to go very well.", buf, 2u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v55, *MEMORY[0x1E0C94B20], 5005, CFSTR("Can't save a share in the public database"));
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    goto LABEL_30;
  }
  objc_msgSend_container(v15, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_cachedEnvironment(v20, v21, v22);

  objc_msgSend_mutableEncryptedPSK(v12, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
  v31 = (void *)*MEMORY[0x1E0C952F8];
  v32 = (_QWORD *)MEMORY[0x1E0C95300];
  if (v29)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v31);
    v33 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      v36 = v33;
      objc_msgSend_recordID(v12, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v84 = v39;
      v85 = 2112;
      v86 = v29;
      _os_log_impl(&dword_1BE990000, v36, OS_LOG_TYPE_INFO, "Using passed in data to create a public sharing identity for %@: %@", buf, 0x16u);

    }
    goto LABEL_24;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v31);
  v40 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v43 = v40;
    objc_msgSend_recordID(v12, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v46;
    _os_log_impl(&dword_1BE990000, v43, OS_LOG_TYPE_INFO, "Creating a new random sharing identity for share %@", buf, 0xCu);

  }
  objc_msgSend_pcsManager(self, v41, v42);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;
  RandomSharingIdentityWithError = (const void *)objc_msgSend_createRandomSharingIdentityWithError_(v47, v48, (uint64_t)&v82);
  v50 = v82;

  if (RandomSharingIdentityWithError)
  {
    objc_msgSend_pcsManager(self, v34, v35);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v50;
    objc_msgSend_dataFromSharingIdentity_error_(v51, v52, (uint64_t)RandomSharingIdentityWithError, &v81);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v81;

    v30 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
    CFRelease(RandomSharingIdentityWithError);
    v50 = v53;
    v32 = (_QWORD *)MEMORY[0x1E0C95300];
  }
  else
  {
    v29 = 0;
  }
  if (v50)
  {
LABEL_30:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v68 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      v69 = v68;
      objc_msgSend_recordID(v12, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v84 = v72;
      v85 = 2112;
      v86 = v50;
      _os_log_error_impl(&dword_1BE990000, v69, OS_LOG_TYPE_ERROR, "Error creating PCS data for share %@: %@", buf, 0x16u);

      if (a3)
        goto LABEL_34;
    }
    else if (a3)
    {
LABEL_34:
      v50 = objc_retainAutorelease(v50);
      v62 = 0;
      *a3 = v50;
      goto LABEL_37;
    }
    v62 = 0;
    goto LABEL_37;
  }
LABEL_24:
  v56 = v23 > 0;
  objc_msgSend_pcsManager(self, v34, v35);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v12, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  objc_msgSend_createNewSharePCSDataForShareWithID_withPublicSharingKey_addDebugIdentity_error_(v57, v61, (uint64_t)v60, v29, v56, &v80);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v80;

  if (!v62)
    goto LABEL_30;
  if (*v32 != -1)
    dispatch_once(MEMORY[0x1E0C95300], *v30);
  v63 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v74 = v63;
    objc_msgSend_recordID(v12, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v77;
    _os_log_debug_impl(&dword_1BE990000, v74, OS_LOG_TYPE_DEBUG, "Successfully created PCS data for share %@", buf, 0xCu);

    if (!v29)
      goto LABEL_37;
    goto LABEL_29;
  }
  if (v29)
  {
LABEL_29:
    v64 = objc_alloc(MEMORY[0x1E0C94D18]);
    v66 = (void *)objc_msgSend_initWithData_(v64, v65, (uint64_t)v29);
    objc_msgSend_setMutableEncryptedPSK_(v12, v67, (uint64_t)v66);

  }
LABEL_37:

  return v62;
}

- (id)_handleSharePCSData:(id)a3 zonePCSData:(id)a4
{
  id v6;
  id v7;
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
  __CFString *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  char isEqual;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
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
  void *v52;
  id v53;
  _QWORD *v54;
  os_log_t *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  os_log_t v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  os_log_t v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  NSObject *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  id v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  NSObject *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  __CFString *v132;
  id v133;
  uint8_t buf[4];
  void *v135;
  __int16 v136;
  const __CFString *v137;
  __int16 v138;
  const __CFString *v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_pcs(v6, v8, v9) && objc_msgSend_publicPCS(v6, v10, v11))
  {
    objc_msgSend_pcsManager(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_publicPCS(v6, v15, v16);
    v133 = 0;
    objc_msgSend_sharingIdentityDataFromPCS_error_(v14, v18, v17, &v133);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = v133;

    if (!v19 || v20)
    {
      if (!v20)
      {
        v86 = (void *)MEMORY[0x1E0C94FF8];
        v87 = *MEMORY[0x1E0C94B20];
        objc_msgSend_shareID(self, v21, v22);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v86, v89, v87, 5000, CFSTR("Couldn't create a public sharing identity for share %@"), v88);
        v20 = (id)objc_claimAutoreleasedReturnValue();

      }
      v53 = v20;
      v52 = v53;
      goto LABEL_36;
    }
    objc_msgSend_share(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_publicSharingIdentity(v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v29 = (void *)v26;
      objc_msgSend_share(self, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicSharingIdentity(v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v33, v34, (uint64_t)v19);

      if ((isEqual & 1) == 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v36 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          v123 = v36;
          objc_msgSend_shareID(self, v124, v125);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_share(self, v127, v128);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_publicSharingIdentity(v129, v130, v131);
          v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v135 = v126;
          v136 = 2114;
          v137 = v132;
          v138 = 2114;
          v139 = v19;
          _os_log_error_impl(&dword_1BE990000, v123, OS_LOG_TYPE_ERROR, "Public sharing identity on share %@ is different. Expected %{public}@, got %{public}@", buf, 0x20u);

        }
        v39 = (void *)MEMORY[0x1E0C94FF8];
        v40 = *MEMORY[0x1E0C94B20];
        objc_msgSend_shareID(self, v37, v38);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_share(self, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mutableEncryptedPSK(v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(v47, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v39, v51, v40, 5000, CFSTR("Public sharing identity on share %@ is different. Expected %@, got %@"), v41, v50, v19);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {

    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v90 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      v91 = v90;
      objc_msgSend_shareID(self, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v135 = v94;
      _os_log_impl(&dword_1BE990000, v91, OS_LOG_TYPE_INFO, "Fetched pcs info for share %@", buf, 0xCu);

    }
    v95 = objc_alloc(MEMORY[0x1E0C94D18]);
    v97 = (void *)objc_msgSend_initWithData_(v95, v96, (uint64_t)v19);
    objc_msgSend_share(self, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMutableEncryptedPSK_(v100, v101, (uint64_t)v97);

    objc_msgSend_share(self, v102, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operation(self, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceContext(v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDeviceReference(v113, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSharePCSData_isUnitTestAccount_(v104, v117, (uint64_t)v6, v116 != 0);

    objc_msgSend_setSharePCSData_(self, v118, (uint64_t)v6);
    v53 = 0;
    v52 = 0;
    goto LABEL_36;
  }
  v54 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v55 = (os_log_t *)MEMORY[0x1E0C952D8];
  v56 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v59 = v56;
    objc_msgSend_shareID(self, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v135 = v62;
    v136 = 2114;
    v137 = &stru_1E7838F48;
    v138 = 2112;
    v139 = &stru_1E7838F48;
    _os_log_impl(&dword_1BE990000, v59, OS_LOG_TYPE_INFO, "Warn: Can't save share %@ if we have no PCS data for it%{public}@%@", buf, 0x20u);

  }
  if (!objc_msgSend_pcs(v6, v57, v58))
  {
    if (*v54 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v65 = *v55;
    if (os_log_type_enabled(*v55, OS_LOG_TYPE_INFO))
    {
      v66 = v65;
      objc_msgSend_shareID(self, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v135 = v69;
      _os_log_impl(&dword_1BE990000, v66, OS_LOG_TYPE_INFO, "Warn: Private PCS data for share %@ is nil", buf, 0xCu);

    }
  }
  if (!objc_msgSend_publicPCS(v6, v63, v64))
  {
    if (*v54 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v72 = *v55;
    if (os_log_type_enabled(*v55, OS_LOG_TYPE_INFO))
    {
      v73 = v72;
      objc_msgSend_shareID(self, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v135 = v76;
      _os_log_impl(&dword_1BE990000, v73, OS_LOG_TYPE_INFO, "Warn: Public PCS data for share %@ is nil", buf, 0xCu);

    }
  }
  v77 = (void *)MEMORY[0x1E0C94FF8];
  v78 = *MEMORY[0x1E0C94B20];
  objc_msgSend_shareID(self, v70, v71);
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend_publicPCS(v6, v79, v80);
  v84 = objc_msgSend_pcs(v6, v82, v83);
  objc_msgSend_errorWithDomain_code_format_(v77, v85, v78, 5005, CFSTR("Can't save share %@ because we're missing PCS data. Public PCS: %@, Private PCS: %@"), v53, v81, v84);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

  if (!v52 && objc_msgSend_pcs(v7, v119, v120))
    objc_msgSend_setSharedZonePCSData_(self, v121, (uint64_t)v7);

  return v52;
}

- (void)_prepareDependentPCSUpdateIfNeededForShareWithSharePCS:(id)a3 error:(id)a4
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
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  int isZoneWideShare;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  id v33;
  _QWORD block[4];
  id v35;
  uint64_t *v36;
  _QWORD *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  CKDModifyShareHandler *v41;
  id v42;
  NSObject *v43;
  _QWORD *v44;
  uint64_t *v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id location;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v6 = a3;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_1BE9BB068;
  v54 = sub_1BE9BADE8;
  v7 = a4;
  v55 = v7;
  objc_msgSend_shareID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_operation(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v17 = dispatch_group_create();
  objc_msgSend_stateTransitionGroup(v16, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v20);

  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = sub_1BE9BB068;
  v47[4] = sub_1BE9BADE8;
  v48 = 0;
  v23 = MEMORY[0x1E0C809B0];
  if (!v51[5])
  {
    objc_msgSend_share(self, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    isZoneWideShare = objc_msgSend_isZoneWideShare(v24, v25, v26);

    if (isZoneWideShare)
    {
      dispatch_group_enter(v17);
      objc_msgSend_pcsCache(self, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v23;
      v39[1] = 3221225472;
      v39[2] = sub_1BEB22714;
      v39[3] = &unk_1E7833D68;
      objc_copyWeak(&v46, &location);
      v40 = v13;
      v41 = self;
      v42 = v6;
      v44 = v47;
      v45 = &v50;
      v43 = v17;
      objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v30, v31, (uint64_t)v40, v16, 0, v39);

      objc_destroyWeak(&v46);
    }
  }
  objc_msgSend_modifyRecordsQueue(v16, v21, v22);
  v32 = objc_claimAutoreleasedReturnValue();
  block[0] = v23;
  block[1] = 3221225472;
  block[2] = sub_1BEB22AD0;
  block[3] = &unk_1E7833D90;
  objc_copyWeak(&v38, &location);
  v35 = v6;
  v36 = &v50;
  v37 = v47;
  v33 = v6;
  dispatch_group_notify(v17, v32, block);

  objc_destroyWeak(&v38);
  _Block_object_dispose(v47, 8);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v50, 8);

}

- (void)prepareForSaveWithCompletionHandler:(id)a3
{
  void (**v5)(_QWORD);
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  objc_super v15;
  _QWORD v16[5];
  void (**v17)(_QWORD);
  id v18;
  id location;

  v5 = (void (**)(_QWORD))a3;
  if (objc_msgSend_state(self, v6, v7) != 5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, CFSTR("CKDModifyShareHandler.m"), 431, CFSTR("%s called on handler %@ but it isn't in the state %s"), "-[CKDModifyShareHandler prepareForSaveWithCompletionHandler:]", self, "CKDModifyRecordHandlerStateNeedRecordPrepareForUpload");

  }
  if ((objc_msgSend_isDelete(self, v8, v9) & 1) != 0)
  {
    if (objc_msgSend_state(self, v10, v11) == 5)
    {
      v15.receiver = self;
      v15.super_class = (Class)CKDModifyShareHandler;
      -[CKDModifyRecordHandler prepareForSaveWithCompletionHandler:](&v15, sel_prepareForSaveWithCompletionHandler_, v5);
    }
    else
    {
      v5[2](v5);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1BEB22E88;
    v16[3] = &unk_1E7833DE0;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    v17 = v5;
    objc_msgSend_decryptSelfParticipantPCSWithCompletionHandler_(self, v12, (uint64_t)v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

- (void)decryptSelfParticipantPCSWithCompletionHandler:(id)a3
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
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _BYTE location[12];
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_share(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUserParticipant(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_role(v10, v11, v12) == 1 || objc_msgSend_role(v10, v13, v14) == 2)
  {
    objc_msgSend_protectionInfo(v10, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_length(v15, v16, v17);

    if (v18)
    {
      objc_initWeak((id *)location, self);
      objc_msgSend_userIdentity(v10, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_publicKeyVersion(v21, v22, v23);

      v25 = v24 < 3;
      objc_msgSend_pcsManager(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionInfo(v10, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = sub_1BEB23708;
      v41[3] = &unk_1E7833E08;
      objc_copyWeak(&v44, (id *)location);
      v42 = v10;
      v43 = v4;
      objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(v28, v32, (uint64_t)v31, 4, 2 * v25, v41);

      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)location);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v33 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v34 = v33;
        objc_msgSend_participantID(v10, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_shareID(self, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v37;
        v46 = 2114;
        v47 = v40;
        _os_log_impl(&dword_1BE990000, v34, OS_LOG_TYPE_INFO, "Current participant %{public}@ does not have a protection info on share %{public}@, possibly due to owner adding themselves for the first time", location, 0x16u);

      }
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)_rollShareAndZonePCSIfNeededForSharePCS:(id)a3 zonePCSData:(id)a4
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
  void *v17;
  const char *v18;
  void *v19;
  BOOL v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  os_log_t *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  int canRollShareKeys;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  __CFString *v55;
  const char *v56;
  os_log_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  const __CFString *v67;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  NSObject *log;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_share(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("ShouldRollSharePCSOnFetch"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19 != 0;
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend_invitedKeysToRemove(v10, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v21, v22, v23);

  objc_msgSend_removedParticipants(v10, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_count(v27, v28, v29);

  if (!v20 && !v24 && !v30)
    goto LABEL_23;
  objc_msgSend_share(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isZoneWideShare(v33, v34, v35) & 1) == 0)
  {

LABEL_23:
    v55 = 0;
    goto LABEL_24;
  }
  objc_msgSend_currentUserParticipant(v10, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_role(v38, v39, v40);

  if (v41 != 1)
    goto LABEL_23;
  v42 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v43 = (os_log_t *)MEMORY[0x1E0C952B0];
  v44 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    log = v44;
    objc_msgSend_operationID(v16, v69, v70);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v10, v71, v72);
    *(_DWORD *)buf = 138544130;
    v77 = v74;
    v78 = 2112;
    v79 = objc_claimAutoreleasedReturnValue();
    v73 = (void *)v79;
    v80 = 2048;
    v81 = v24;
    v82 = 2048;
    v83 = v30;
    _os_log_debug_impl(&dword_1BE990000, log, OS_LOG_TYPE_DEBUG, "Operation %{public}@ needs to key roll for zone-wide share %@ due to %tu invited keys to remove and %tu removed participants", buf, 0x2Au);

  }
  objc_msgSend_pcsManager(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  canRollShareKeys = objc_msgSend_canRollShareKeys(v47, v48, v49);

  if (!canRollShareKeys)
    goto LABEL_23;
  objc_msgSend_pcsManager(self, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyRollForZoneWideShareWithZonePCS_sharePCS_forOperation_(v53, v54, (uint64_t)v7, v6, v16);
  v55 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setDidAttemptZoneWideShareKeyRoll_(self, v56, 1);
  if (*v42 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v57 = *v43;
  if (os_log_type_enabled(*v43, OS_LOG_TYPE_DEBUG))
  {
    v58 = v57;
    objc_msgSend_operationID(v16, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v10, v62, v63);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)v64;
    v66 = CFSTR(" error: ");
    *(_DWORD *)buf = 138413058;
    v67 = &stru_1E7838F48;
    v77 = v61;
    v78 = 2112;
    if (!v55)
      v66 = &stru_1E7838F48;
    v79 = v64;
    if (v55)
      v67 = v55;
    v80 = 2114;
    v81 = (uint64_t)v66;
    v82 = 2112;
    v83 = (uint64_t)v67;
    _os_log_debug_impl(&dword_1BE990000, v58, OS_LOG_TYPE_DEBUG, "Operation %@ did attempt a key roll for zone-wide share %@%{public}@%@", buf, 0x2Au);

  }
LABEL_24:

  return v55;
}

- (void)_alignParticipantPermissions
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  dispatch_once_t *v25;
  os_log_t *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  os_log_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  dispatch_once_t *v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  __int128 v53;
  uint64_t v55;
  id obj;
  NSObject *log;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  objc_msgSend_share(self, a2, v2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUserParticipant(v58, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_role(v5, v6, v7) == 1)
  {

  }
  else
  {
    objc_msgSend_currentUserParticipant(v58, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_role(v12, v13, v14);

    if (v15 != 2)
      goto LABEL_20;
  }
  if (objc_msgSend_publicPermission(v58, v10, v11) >= 2)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend_participants(v58, v16, v17);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v59, v73, 16);
    if (v19)
    {
      v23 = v19;
      v24 = *(_QWORD *)v60;
      v25 = (dispatch_once_t *)MEMORY[0x1E0C95300];
      v26 = (os_log_t *)MEMORY[0x1E0C952B0];
      *(_QWORD *)&v22 = 138413314;
      v53 = v22;
      do
      {
        v27 = 0;
        v55 = v23;
        do
        {
          if (*(_QWORD *)v60 != v24)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v27);
          if (objc_msgSend_role(v28, v20, v21, v53) == 3 || objc_msgSend_role(v28, v29, v30) == 2)
          {
            if (*v25 != -1)
              dispatch_once(v25, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v31 = *v26;
            if (os_log_type_enabled(*v26, OS_LOG_TYPE_INFO))
            {
              log = v31;
              objc_msgSend_role(v28, v34, v35);
              CKStringFromParticipantRole();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_participantID(v28, v37, v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_permission(v28, v40, v41);
              CKStringFromParticipantPermission();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_publicPermission(v58, v43, v44);
              CKStringFromParticipantPermission();
              v45 = v24;
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_shareID(self, v47, v48);
              v49 = v25;
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v53;
              v64 = v36;
              v65 = 2112;
              v66 = v39;
              v67 = 2114;
              v68 = v42;
              v69 = 2114;
              v70 = v46;
              v71 = 2112;
              v72 = v50;
              _os_log_impl(&dword_1BE990000, log, OS_LOG_TYPE_INFO, "Updating permission for %@ participant %@ from %{public}@ -> %{public}@ to match the public permission on share %@", buf, 0x34u);

              v25 = v49;
              v23 = v55;

              v24 = v45;
              v26 = (os_log_t *)MEMORY[0x1E0C952B0];

            }
            v51 = objc_msgSend_publicPermission(v58, v32, v33);
            objc_msgSend_setPermission_(v28, v52, v51);
          }
          ++v27;
        }
        while (v23 != v27);
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v59, v73, 16);
      }
      while (v23);
    }

  }
LABEL_20:

}

- (BOOL)_serializePCSDataForShareWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
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
  uint64_t v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
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
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  NSObject *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  void *v137;
  NSObject *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  void *v146;
  NSObject *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  void *v155;
  NSObject *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  NSObject *v164;
  void *v165;
  BOOL v166;
  NSObject *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  id v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  const char *v184;
  const char *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  const char *v212;
  uint64_t v213;
  const char *v214;
  const char *v215;
  void *v216;
  const char *v217;
  void *v218;
  const char *v219;
  const char *v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  const char *v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  void *v242;
  NSObject *v243;
  const char *v244;
  uint64_t v245;
  void *v246;
  NSObject *v247;
  const char *v248;
  uint64_t v249;
  void *v250;
  NSObject *v251;
  const char *v252;
  uint64_t v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  id v265;
  id v266;
  id v267;
  id v268;
  id v269;
  id v270;
  uint8_t buf[4];
  id v272;
  __int16 v273;
  id v274;
  uint64_t v275;

  v275 = *MEMORY[0x1E0C80C00];
  objc_msgSend_share(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUserParticipant(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_role(v8, v9, v10) == 1 || objc_msgSend_role(v8, v11, v12) == 2)
  {
    objc_msgSend_pcsManager(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_share(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_privatePCS(v16, v17, v18);
    v270 = 0;
    objc_msgSend_dataFromSharePCS_pcsBlobType_error_(v13, v20, v19, 5, &v270);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v270;

    if (!v21 || v22)
    {
      if (!v22)
      {
        v31 = (void *)MEMORY[0x1E0C94FF8];
        v32 = *MEMORY[0x1E0C94B20];
        objc_msgSend_shareID(self, v23, v24);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v31, v34, v32, 5002, CFSTR("Couldn't serialize private share PCS for share %@: %@"), v33, 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v35 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        v36 = v35;
        objc_msgSend_shareID(self, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v272 = v39;
        v273 = 2112;
        v274 = v22;
        _os_log_impl(&dword_1BE990000, v36, OS_LOG_TYPE_INFO, "Warn: Couldn't serialize private share PCS for share %@: %@", buf, 0x16u);

      }
      v40 = 0;
      v41 = 0;
LABEL_49:
      v78 = 0;
      if (!a3)
        goto LABEL_75;
LABEL_66:
      if (v22)
      {
        *a3 = objc_retainAutorelease(v22);
LABEL_76:
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v165 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          v168 = v165;
          objc_msgSend_shareID(self, v169, v170);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v272 = v171;
          v273 = 2112;
          v274 = v22;
          _os_log_error_impl(&dword_1BE990000, v168, OS_LOG_TYPE_ERROR, "Failed to serialize PCS data for share %@: %@", buf, 0x16u);

        }
        v166 = 0;
        goto LABEL_81;
      }
      goto LABEL_75;
    }
    objc_msgSend_share(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInvitedProtectionData_(v25, v26, (uint64_t)v21);

    objc_msgSend_sharePCSData(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPcsData_(v29, v30, (uint64_t)v21);

  }
  else
  {
    v21 = 0;
  }
  objc_msgSend_pcsManager(self, v11, v12);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_privatePCS(v45, v46, v47);
  v269 = 0;
  objc_msgSend_etagFromSharePCS_error_(v42, v49, v48, &v269);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v269;

  if (!v41 || v22)
  {
    if (!v22)
    {
      v133 = (void *)MEMORY[0x1E0C94FF8];
      v134 = *MEMORY[0x1E0C94B20];
      objc_msgSend_shareID(self, v50, v51);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v133, v136, v134, 5002, CFSTR("Couldn't create a PCS etag for share %@: %@"), v135, 0);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v137 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      v138 = v137;
      objc_msgSend_shareID(self, v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v272 = v141;
      v273 = 2112;
      v274 = v22;
      _os_log_impl(&dword_1BE990000, v138, OS_LOG_TYPE_INFO, "Warn: Couldn't create a PCS etag for share %@: %@", buf, 0x16u);

    }
    v40 = 0;
    goto LABEL_49;
  }
  objc_msgSend_share(self, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInvitedProtectionEtag_(v52, v53, (uint64_t)v41);

  objc_msgSend_sharePCSData(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEtag_(v56, v57, (uint64_t)v41);

  objc_msgSend_share(self, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend_privatePCS(v60, v61, v62);
  objc_msgSend_sharePCSData(self, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInvitedPCS_(v66, v67, v63);

  objc_msgSend_pcsManager(self, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(self, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend_publicPCS(v73, v74, v75);
  v268 = 0;
  objc_msgSend_dataFromSharePCS_pcsBlobType_error_(v70, v77, v76, 0, &v268);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v268;

  if (!v78 || v22)
  {
    if (!v22)
    {
      v142 = (void *)MEMORY[0x1E0C94FF8];
      v143 = *MEMORY[0x1E0C94B20];
      objc_msgSend_shareID(self, v79, v80);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v142, v145, v143, 5002, CFSTR("Couldn't serialize public share PCS for share %@: %@"), v144, 0);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v146 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      v147 = v146;
      objc_msgSend_shareID(self, v148, v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v272 = v150;
      v273 = 2112;
      v274 = v22;
      _os_log_impl(&dword_1BE990000, v147, OS_LOG_TYPE_INFO, "Warn: Couldn't serialize public share PCS for share %@: %@", buf, 0x16u);

    }
    v40 = 0;
    if (!a3)
      goto LABEL_75;
    goto LABEL_66;
  }
  objc_msgSend_pcsManager(self, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(self, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend_publicPCS(v84, v85, v86);
  v267 = 0;
  objc_msgSend_etagFromSharePCS_error_(v81, v88, v87, &v267);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v267;

  if (!v40 || v22)
  {
    if (!v22)
    {
      v151 = (void *)MEMORY[0x1E0C94FF8];
      v152 = *MEMORY[0x1E0C94B20];
      objc_msgSend_shareID(self, v89, v90);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v151, v154, v152, 5002, CFSTR("Couldn't create a public PCS etag for share %@: %@"), v153, 0);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v155 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      v156 = v155;
      objc_msgSend_shareID(self, v157, v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v272 = v159;
      v273 = 2112;
      v274 = v22;
      _os_log_impl(&dword_1BE990000, v156, OS_LOG_TYPE_INFO, "Warn: Couldn't create a public PCS etag for share %@: %@", buf, 0x16u);

    }
    if (!a3)
      goto LABEL_75;
    goto LABEL_66;
  }
  objc_msgSend_sharedZonePCSData(self, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_pcs(v91, v92, v93))
  {
LABEL_90:

    goto LABEL_91;
  }
  v96 = objc_msgSend_role(v8, v94, v95);

  if (v96 != 1)
  {
LABEL_91:
    objc_msgSend_share(self, v97, v98);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicProtectionData_(v218, v219, (uint64_t)v78);

    objc_msgSend_share(self, v220, v221);
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicProtectionEtag_(v222, v223, (uint64_t)v40);

    objc_msgSend_share(self, v224, v225);
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v229 = objc_msgSend_publicPCS(v226, v227, v228);
    objc_msgSend_sharePCSData(self, v230, v231);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicPCS_(v232, v233, v229);

    objc_msgSend_sharePCSData(self, v234, v235);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicPCSData_(v236, v237, (uint64_t)v78);

    objc_msgSend_sharePCSData(self, v238, v239);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicPCSEtag_(v240, v241, (uint64_t)v40);

    v166 = 1;
    goto LABEL_92;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v99 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v247 = v99;
    objc_msgSend_shareID(self, v248, v249);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v272 = v250;
    _os_log_debug_impl(&dword_1BE990000, v247, OS_LOG_TYPE_DEBUG, "Serializing zone PCS for plugin-field update to create zone-wide share %@", buf, 0xCu);

  }
  objc_msgSend_pcsManager(self, v100, v101);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedZonePCSData(self, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend_pcs(v104, v105, v106);
  v266 = 0;
  objc_msgSend_dataFromZonePCS_error_(v259, v108, v107, &v266);
  v109 = objc_claimAutoreleasedReturnValue();
  v22 = v266;

  v110 = (void *)v109;
  if (v109 && !v22)
  {
    objc_msgSend_sharedZonePCSData(self, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend_zoneishPCS(v113, v114, v115);

    v263 = v110;
    if (v116)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v117 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v251 = v117;
        objc_msgSend_shareID(self, v252, v253);
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v272 = v254;
        _os_log_debug_impl(&dword_1BE990000, v251, OS_LOG_TYPE_DEBUG, "Serializing zoneish PCS for plugin-field update to create zone-wide share %@", buf, 0xCu);

      }
      objc_msgSend_pcsManager(self, v118, v119);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedZonePCSData(self, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend_zoneishPCS(v122, v123, v124);
      v265 = 0;
      objc_msgSend_dataFromRecordPCS_error_(v260, v126, v125, &v265);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v265;

      if (!v91 || v22)
      {
        if (!v22)
        {
          v261 = (void *)MEMORY[0x1E0C94FF8];
          v129 = *MEMORY[0x1E0C94B20];
          objc_msgSend_shareID(self, v127, v128);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v261, v131, v129, 5002, CFSTR("Couldn't serialize zoneish update PCS for share %@: %@"), v130, 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v132 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v272 = v22;
          _os_log_error_impl(&dword_1BE990000, v132, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS trying to create zone-wide share: %@", buf, 0xCu);
        }

        v110 = v263;
        goto LABEL_74;
      }
    }
    else
    {
      v91 = 0;
    }
    v172 = objc_alloc(MEMORY[0x1E0C95088]);
    objc_msgSend_shareID(self, v173, v174);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v175, v176, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = (void *)objc_msgSend_initWithZoneID_(v172, v179, (uint64_t)v178);

    objc_msgSend_etagFromPCSData_(CKDPCSManager, v181, (uint64_t)v263);
    v182 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionData_(v180, v183, (uint64_t)v263);
    v257 = (void *)v182;
    objc_msgSend_setProtectionEtag_(v180, v184, v182);
    objc_msgSend_setZoneishProtectionData_(v180, v185, (uint64_t)v91);
    objc_msgSend_operation(self, v186, v187);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_translator(v188, v189, v190);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v258 = v180;
    objc_msgSend_pRecordZoneFromRecordZone_(v191, v192, (uint64_t)v180);
    v262 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_share(self, v193, v194);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pluginFields(v195, v196, v197);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    if (v200)
    {
      objc_msgSend_share(self, v198, v199);
      v255 = v200;
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pluginFields(v201, v202, v203);
      v256 = v195;
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v207 = (void *)objc_msgSend_mutableCopy(v204, v205, v206);

      v195 = v256;
      v200 = v255;
    }
    else
    {
      v207 = (void *)objc_opt_new();
    }

    objc_msgSend_data(v262, v208, v209);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v207, v211, (uint64_t)v210, CFSTR("___zoneUpdateData"));

    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_setObject_forKeyedSubscript_(v207, v212, (uint64_t)v263, CFSTR("_rawZonePCSUpdateByes"));
      objc_msgSend_setObject_forKeyedSubscript_(v207, v214, (uint64_t)v257, CFSTR("_rawZonePCSUpdateEtag"));
      objc_msgSend_setObject_forKeyedSubscript_(v207, v215, (uint64_t)v91, CFSTR("_rawZoneishPCSUpdateByes"));
    }
    objc_msgSend_share(self, v212, v213);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPluginFields_(v216, v217, (uint64_t)v207);

    goto LABEL_90;
  }
  if (!v22)
  {
    v160 = (void *)MEMORY[0x1E0C94FF8];
    v161 = *MEMORY[0x1E0C94B20];
    objc_msgSend_shareID(self, v111, v112);
    v264 = v110;
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v160, v163, v161, 5002, CFSTR("Couldn't serialize zone update PCS for share %@: %@"), v162, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v110 = v264;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v164 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v272 = v22;
    _os_log_error_impl(&dword_1BE990000, v164, OS_LOG_TYPE_ERROR, "Couldn't serialize zone PCS trying to create zone-wide share: %@", buf, 0xCu);
  }
LABEL_74:

  if (a3)
    goto LABEL_66;
LABEL_75:
  if (v22)
    goto LABEL_76;
  v166 = 0;
LABEL_92:
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v242 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v243 = v242;
    objc_msgSend_shareID(self, v244, v245);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v272 = v246;
    _os_log_impl(&dword_1BE990000, v243, OS_LOG_TYPE_INFO, "Successfully serialized PCS data for share %@", buf, 0xCu);

  }
LABEL_81:

  return v166;
}

- (BOOL)_updateSharePublicPCSWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  char v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  const char *v57;
  char v58;
  id v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  char v100;
  const char *v101;
  char v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  const char *v112;
  void *v114;
  const char *v115;
  uint64_t v116;
  NSObject *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  const char *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  uint8_t buf[4];
  void *v129;
  __int16 v130;
  id v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  objc_msgSend_pcsManager(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_privatePCS(v8, v9, v10);
  objc_msgSend_share(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_publicPCS(v14, v15, v16);
  v127 = 0;
  v19 = objc_msgSend_addSharePCS_toRecordPCS_permission_error_(v5, v18, v11, v17, 0, &v127);
  v20 = v127;

  if ((v19 & 1) != 0)
  {
    objc_msgSend_share(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentUserParticipant(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_role(v26, v27, v28) == 1 || objc_msgSend_role(v26, v29, v30) == 2)
    {
      objc_msgSend_share(self, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_publicPermission(v31, v32, v33) == 2)
      {
LABEL_7:

LABEL_8:
        objc_msgSend_pcsManager(self, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_share(self, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend_publicPCS(v46, v47, v48);
        objc_msgSend_share(self, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend_privatePCS(v52, v53, v54);
        v126 = v20;
        v56 = 1;
        v58 = objc_msgSend_addSharePCS_toRecordPCS_permission_error_(v43, v57, v49, v55, 1, &v126);
        v59 = v126;

        if ((v58 & 1) != 0)
        {
LABEL_36:
          v20 = v59;
          goto LABEL_37;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v60 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        {
          v63 = v60;
          objc_msgSend_shareID(self, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v129 = v66;
          v130 = 2112;
          v131 = v59;
          _os_log_impl(&dword_1BE990000, v63, OS_LOG_TYPE_INFO, "Error adding public sharing PCS to private sharing PCS for share %@: %@", buf, 0x16u);

        }
        if (a3)
        {
          v67 = (void *)MEMORY[0x1E0C94FF8];
          v68 = *MEMORY[0x1E0C94B20];
          objc_msgSend_shareID(self, v61, v62);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v67, v70, v68, 5004, CFSTR("Error adding public sharing PCS to private sharing PCS for share %@: %@"), v69, v59);
LABEL_15:
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v59;
          goto LABEL_22;
        }
LABEL_35:
        v56 = 0;
        goto LABEL_36;
      }
      objc_msgSend_share(self, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_publicPermission(v36, v37, v38) == 3)
      {

        goto LABEL_7;
      }
      objc_msgSend_share(self, v39, v40);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend_publicPermission(v82, v83, v84);

      if (v85 == 4)
        goto LABEL_8;
      objc_msgSend_pcsManager(self, v41, v42);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_share(self, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend_publicPCS(v89, v90, v91);
      objc_msgSend_share(self, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend_privatePCS(v95, v96, v97);
      v125 = v20;
      v100 = objc_msgSend_removeSharePCS_fromRecordPCS_error_(v86, v99, v92, v98, &v125);
      v59 = v125;

      if ((v100 & 1) == 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v103 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        {
          v106 = v103;
          objc_msgSend_shareID(self, v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v129 = v109;
          v130 = 2112;
          v131 = v59;
          _os_log_impl(&dword_1BE990000, v106, OS_LOG_TYPE_INFO, "Error removing public sharing PCS from private sharing PCS for share %@: %@", buf, 0x16u);

        }
        if (a3)
        {
          v110 = (void *)MEMORY[0x1E0C94FF8];
          v111 = *MEMORY[0x1E0C94B20];
          objc_msgSend_shareID(self, v104, v105);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v110, v112, v111, 5004, CFSTR("Error removing public sharing PCS from private sharing PCS for share %@: %@"), v69, v59);
          goto LABEL_15;
        }
        goto LABEL_35;
      }
      v124 = v59;
      v102 = objc_msgSend__cleanPublicPCSforShareWithError_(self, v101, (uint64_t)&v124);
      v20 = v124;

      if ((v102 & 1) == 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v114 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        {
          v117 = v114;
          objc_msgSend_shareID(self, v118, v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v129 = v120;
          v130 = 2112;
          v131 = v20;
          _os_log_impl(&dword_1BE990000, v117, OS_LOG_TYPE_INFO, "Error cleaning up public PCS for share %@: %@", buf, 0x16u);

        }
        if (!a3)
          goto LABEL_24;
        v121 = (void *)MEMORY[0x1E0C94FF8];
        v122 = *MEMORY[0x1E0C94B20];
        objc_msgSend_shareID(self, v115, v116);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v121, v123, v122, 5004, CFSTR("Error cleaning up public PCS for share %@: %@"), v69, v20);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
    }
    v56 = 1;
    goto LABEL_37;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v72 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v75 = v72;
    objc_msgSend_shareID(self, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v129 = v78;
    v130 = 2112;
    v131 = v20;
    _os_log_impl(&dword_1BE990000, v75, OS_LOG_TYPE_INFO, "Error adding private sharing PCS to public sharing PCS for share %@: %@", buf, 0x16u);

  }
  if (!a3)
  {
    v26 = 0;
    goto LABEL_24;
  }
  v79 = (void *)MEMORY[0x1E0C94FF8];
  v80 = *MEMORY[0x1E0C94B20];
  objc_msgSend_shareID(self, v73, v74);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_format_(v79, v81, v80, 5004, CFSTR("Error adding private sharing PCS to public sharing PCS for share %@: %@"), v69, v20);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
LABEL_22:
  *a3 = v71;

LABEL_24:
  v56 = 0;
LABEL_37:

  return v56;
}

- (BOOL)_cleanPublicPCSforShareWithError:(id *)a3
{
  CKDModifyShareHandler *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
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
  const char *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  dispatch_once_t *v23;
  uint64_t v24;
  os_log_t *v25;
  uint64_t v26;
  void *v27;
  os_log_t v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  dispatch_once_t *v38;
  os_log_t *v39;
  CKDModifyShareHandler *v40;
  void *v41;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v3 = self;
  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend_share(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_publicPermission(v4, v5, v6);

  if (v7 <= 1)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend_share(v3, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participants(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_copy(v13, v14, v15);

    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v45, v53, 16);
    if (v18)
    {
      v22 = v18;
      v23 = (dispatch_once_t *)MEMORY[0x1E0C95300];
      v24 = *(_QWORD *)v46;
      v25 = (os_log_t *)MEMORY[0x1E0C952B0];
      *(_QWORD *)&v21 = 138412546;
      v43 = v21;
      do
      {
        v26 = 0;
        v44 = v22;
        do
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v16);
          v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v26);
          if (objc_msgSend_role(v27, v19, v20, v43) == 4)
          {
            if (*v23 != -1)
              dispatch_once(v23, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v28 = *v25;
            if (os_log_type_enabled(*v25, OS_LOG_TYPE_INFO))
            {
              v30 = v28;
              objc_msgSend_participantID(v27, v31, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_shareID(v3, v34, v35);
              v36 = v24;
              v37 = v16;
              v38 = v23;
              v39 = v25;
              v40 = v3;
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v43;
              v50 = v33;
              v51 = 2112;
              v52 = v41;
              _os_log_impl(&dword_1BE990000, v30, OS_LOG_TYPE_INFO, "Removing public participant %@ from share %@.", buf, 0x16u);

              v3 = v40;
              v25 = v39;
              v23 = v38;
              v16 = v37;
              v24 = v36;
              v22 = v44;

            }
            objc_msgSend_setAcceptanceStatus_(v27, v29, 3);
          }
          ++v26;
        }
        while (v22 != v26);
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v45, v53, 16);
      }
      while (v22);
    }

  }
  return 1;
}

- (void)_addPublicKeyToSelfParticipantWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
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
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  int IsManatee;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v75;
  BOOL v76;
  void *v77;
  const char *v78;
  _QWORD *v79;
  os_log_t *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  char v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  NSObject *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  NSObject *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  os_log_t v126;
  NSObject *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  NSObject *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  _QWORD v142[4];
  id v143;
  void (**v144)(id, _QWORD);
  id v145[2];
  id v146;
  _BYTE location[12];
  __int16 v148;
  id v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (!objc_msgSend_haveAddedOwnerToShare(self, v5, v6)
    || !objc_msgSend_isALegacyPublicShareThatNeedsOwnerPPPCSUpgrade(self, v7, v8))
  {
    if ((objc_msgSend_haveAddedOwnerToShare(self, v7, v8) & 1) != 0
      || (objc_msgSend_share(self, v27, v28),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_currentUserParticipant(v29, v30, v31),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = objc_msgSend_role(v32, v33, v34),
          v32,
          v29,
          v35 != 1))
    {
      v4[2](v4, 0);
      goto LABEL_45;
    }
    objc_msgSend_setHaveAddedOwnerToShare_(self, v36, 1);
    objc_msgSend_share(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentUserParticipant(v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_operation(self, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isCloudDocsContainer(self, v46, v47) & 1) != 0)
    {
      v50 = 1;
    }
    else
    {
      objc_msgSend_container(v45, v48, v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      IsManatee = objc_msgSend_currentServiceIsManatee(v55, v56, v57);

      if (IsManatee)
        v50 = 0;
      else
        v50 = 2;
    }
    objc_msgSend_pcsManager(self, v48, v49);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend_publicKeyVersionForServiceType_(v59, v60, v50);
    objc_msgSend_userIdentity(v42, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicKeyVersion_(v64, v65, v61);

    objc_msgSend_pcsManager(self, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = 0;
    objc_msgSend_participantPublicKeyForServiceType_error_(v68, v69, v50, &v146);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v146;

    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(v45, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v73, v74, (uint64_t)CFSTR("NoOwnerPublicKey"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v75 == 0;

      if (!v76)
      {

        v141 = 0;
LABEL_30:
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v87 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          v118 = v87;
          objc_msgSend_shareID(self, v119, v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138412546;
          *(_QWORD *)&location[4] = v121;
          v148 = 2112;
          v149 = v70;
          _os_log_error_impl(&dword_1BE990000, v118, OS_LOG_TYPE_ERROR, "Couldn't get a current public sharing identity for the owner on share %@. Error: %@. Synchronizing key chain and retrying...", location, 0x16u);

        }
        objc_initWeak((id *)location, self);
        objc_msgSend_container(v45, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsManager(v90, v91, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationID(v45, v94, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v142[0] = MEMORY[0x1E0C809B0];
        v142[1] = 3221225472;
        v142[2] = sub_1BEB26074;
        v142[3] = &unk_1E7833E30;
        objc_copyWeak(v145, (id *)location);
        v143 = v42;
        v145[1] = (id)v50;
        v144 = v4;
        objc_msgSend_synchronizeUserKeyRegistryForServiceType_shouldThrottle_context_requestorOperationID_completionHandler_(v93, v97, v50, 1, 0x1E784B7C8, v96, v142);

        objc_destroyWeak(v145);
        objc_destroyWeak((id *)location);
        goto LABEL_44;
      }
    }
    if (!v141 || v70)
      goto LABEL_30;
    objc_msgSend_userIdentity(v42, v71, v72);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicSharingKey_(v77, v78, (uint64_t)v141);

    v79 = (_QWORD *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v80 = (os_log_t *)MEMORY[0x1E0C952B0];
    v81 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v127 = v81;
      objc_msgSend_userIdentity(v42, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicSharingKey(v130, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shareID(self, v134, v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v133;
      v148 = 2112;
      v149 = v136;
      _os_log_debug_impl(&dword_1BE990000, v127, OS_LOG_TYPE_DEBUG, "Added public sharing identity %{public}@ to our self owner user on share %@", location, 0x16u);

    }
    objc_msgSend_protectionInfo(v42, v82, v83, v141);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {

    }
    else
    {
      objc_msgSend_share(self, v85, v86);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addedParticipants(v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend_containsObject_(v101, v102, (uint64_t)v42);

      if ((v103 & 1) == 0)
      {
        objc_msgSend_setIsALegacyPublicShareThatNeedsOwnerPPPCSUpgrade_(self, v104, 1);
        objc_msgSend_share(self, v105, v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = objc_msgSend_privatePCS(v107, v108, v109);

        if (v110)
        {
          objc_msgSend_share(self, v111, v112);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = objc_msgSend_privatePCS(v113, v114, v115);
          objc_msgSend__ensurePrivateParticipant_isInInvitedSharePCS_(self, v117, (uint64_t)v42, v116);
          v70 = (id)objc_claimAutoreleasedReturnValue();

LABEL_43:
          ((void (**)(id, id))v4)[2](v4, v70);
LABEL_44:

          goto LABEL_45;
        }
        if (*v79 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v126 = *v80;
        if (os_log_type_enabled(*v80, OS_LOG_TYPE_DEBUG))
        {
          v137 = v126;
          objc_msgSend_shareID(self, v138, v139);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138412290;
          *(_QWORD *)&location[4] = v140;
          _os_log_debug_impl(&dword_1BE990000, v137, OS_LOG_TYPE_DEBUG, "Couldn't get a private PCS for the share %@, so we can't upgrade our owner's PPPCS", location, 0xCu);

        }
      }
    }
    v70 = 0;
    goto LABEL_43;
  }
  objc_msgSend_share(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_privatePCS(v9, v10, v11);

  if (v12)
  {
    objc_msgSend_share(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentUserParticipant(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_share(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_privatePCS(v21, v22, v23);
    objc_msgSend__ensurePrivateParticipant_isInInvitedSharePCS_(self, v25, (uint64_t)v18, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v51 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v122 = v51;
      objc_msgSend_shareID(self, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = v125;
      _os_log_debug_impl(&dword_1BE990000, v122, OS_LOG_TYPE_DEBUG, "Couldn't get a private PCS for the share %@, so we can't upgrade our owner's PPPCS", location, 0xCu);

    }
    v26 = 0;
  }
  ((void (**)(id, void *))v4)[2](v4, v26);

LABEL_45:
}

- (BOOL)_setupParticipantsProtectionInfos:(id *)a3
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
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
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  CKDModifyShareHandler *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  const char *v99;
  void *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  id v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  id v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  id v143;
  const char *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  id v156;
  NSObject *v157;
  const char *v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t i;
  void *v184;
  uint64_t v185;
  id v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  NSObject *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  const char *v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  BOOL v221;
  id v222;
  NSObject *v223;
  const char *v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  void *v230;
  int v231;
  id v232;
  id v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  void *v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  void *v242;
  id v243;
  uint64_t v244;
  void *v245;
  uint64_t v246;
  const char *v247;
  CKDModifyShareHandler *v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  id v262;
  NSObject *v263;
  void *v264;
  void *v265;
  id v266;
  void *v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t j;
  void *v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  void *v293;
  id v294;
  NSObject *v295;
  const char *v296;
  uint64_t v297;
  NSObject *v298;
  const char *v299;
  uint64_t v300;
  void *v301;
  NSObject *v302;
  const char *v303;
  uint64_t v304;
  id v305;
  void *v306;
  NSObject *v307;
  const char *v308;
  uint64_t v309;
  void *v310;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  void *v315;
  NSObject *v316;
  const char *v317;
  uint64_t v318;
  void *v319;
  void *v320;
  id *v321;
  void *v322;
  uint64_t v323;
  id v324;
  id v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  void *obja;
  void *obj;
  CKDModifyShareHandler *v331;
  uint64_t v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  id v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  uint64_t v346;
  uint64_t v347;
  void (*v348)(uint64_t);
  void *v349;
  id v350;
  id v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  id v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  uint8_t buf[4];
  uint64_t v370;
  __int16 v371;
  id v372;
  __int16 v373;
  void *v374;
  __int16 v375;
  void *v376;
  _BYTE v377[128];
  _BYTE v378[128];
  _BYTE v379[128];
  _BYTE v380[128];
  _BYTE v381[128];
  _BYTE v382[128];
  _BYTE v383[128];
  uint64_t v384;

  v384 = *MEMORY[0x1E0C80C00];
  v5 = (id)*MEMORY[0x1E0C952F8];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v5);

  v6 = (id)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_shareID(self, v7, v8);
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v370 = (uint64_t)v267;
    _os_log_debug_impl(&dword_1BE990000, v6, OS_LOG_TYPE_DEBUG, "Checking participants on share %@", buf, 0xCu);

  }
  objc_msgSend_share(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allParticipants(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v14, v15, v16);

  if (!v17)
    return 1;
  objc_msgSend_share(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_privatePCS(v20, v21, v22);

  v332 = v23;
  if (!v23)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v35 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v298 = v35;
      objc_msgSend_shareID(self, v299, v300);
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v370 = (uint64_t)v301;
      _os_log_error_impl(&dword_1BE990000, v298, OS_LOG_TYPE_ERROR, "Couldn't get invitedPCS for share %@", buf, 0xCu);

    }
    v38 = (void *)MEMORY[0x1E0C94FF8];
    v39 = *MEMORY[0x1E0C94B20];
    objc_msgSend_shareID(self, v36, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v38, v41, v39, 5004, CFSTR("Couldn't create invited PCS for share %@"), v40);
    v42 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v42 = objc_retainAutorelease(v42);
      v34 = 0;
      *a3 = v42;
      goto LABEL_169;
    }
    goto LABEL_168;
  }
  objc_msgSend_share(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUserParticipant(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v331 = self;
  if (objc_msgSend_role(v29, v30, v31) == 2)
  {

  }
  else
  {
    objc_msgSend_share(self, v32, v33);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentUserParticipant(v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend_role(v46, v47, v48);

    if (v49 != 1)
    {
      v200 = 0;
      goto LABEL_111;
    }
  }
  v321 = a3;
  v52 = (void *)objc_opt_new();
  objc_msgSend_share(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addedParticipants(v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v52, v59, (uint64_t)v58);

  v367 = 0u;
  v368 = 0u;
  v365 = 0u;
  v366 = 0u;
  objc_msgSend_share(self, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allParticipants(v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v365, v383, 16);
  if (v67)
  {
    v70 = v67;
    v71 = *(_QWORD *)v366;
    do
    {
      v72 = 0;
      do
      {
        if (*(_QWORD *)v366 != v71)
          objc_enumerationMutation(v65);
        v73 = *(void **)(*((_QWORD *)&v365 + 1) + 8 * v72);
        if (objc_msgSend_wantsNewInvitationToken(v73, v68, v69))
        {
          v74 = (id)*MEMORY[0x1E0C952F8];
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v74);

          v75 = (id)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_shareID(v331, v76, v77);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v370 = (uint64_t)v73;
            v371 = 2112;
            v372 = v79;
            _os_log_debug_impl(&dword_1BE990000, v75, OS_LOG_TYPE_DEBUG, "Participant %@ wants a new invitation token on share %@", buf, 0x16u);

          }
          objc_msgSend_addObject_(v52, v78, (uint64_t)v73);
        }
        ++v72;
      }
      while (v70 != v72);
      v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v68, (uint64_t)&v365, v383, 16);
    }
    while (v70);
  }

  objc_msgSend_share(v331, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_oneTimeURLMetadatasByParticipantID(v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85;
  if (v85)
  {
    v325 = v85;
  }
  else
  {
    v325 = (id)objc_opt_new();

  }
  v363 = 0u;
  v364 = 0u;
  v361 = 0u;
  v362 = 0u;
  v87 = v52;
  v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v361, v382, 16);
  v92 = v331;
  v93 = v325;
  if (v89)
  {
    v94 = v89;
    v95 = *(_QWORD *)v362;
    v323 = *(_QWORD *)v362;
    do
    {
      v96 = 0;
      v326 = v94;
      do
      {
        if (*(_QWORD *)v362 != v95)
          objc_enumerationMutation(v87);
        v97 = *(void **)(*((_QWORD *)&v361 + 1) + 8 * v96);
        if (objc_msgSend_usesOneTimeURL(v97, v90, v91))
        {
          objc_msgSend_participantID(v97, v90, v91);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v93, v99, (uint64_t)v98);
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v100)
          {
            objc_msgSend_operation(v92, v90, v91);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_container(v101, v102, v103);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_pcsManager(v104, v105, v106);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v360 = 0;
            objc_msgSend_generateOONPrivateKeyWithError_(v107, v108, (uint64_t)&v360);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v360;

            if (v42 || !v109)
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v180 = v325;
              v239 = (void *)*MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
              {
                v302 = v239;
                objc_msgSend_shareID(v331, v303, v304);
                v305 = v42;
                v306 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v370 = (uint64_t)v306;
                v371 = 2112;
                v372 = v305;
                _os_log_error_impl(&dword_1BE990000, v302, OS_LOG_TYPE_ERROR, "Couldn't configure new one-time URL participant on share %@: %@", buf, 0x16u);

                v42 = v305;
                if (v321)
                {
LABEL_108:
                  v242 = (void *)MEMORY[0x1E0C94FF8];
                  v243 = v42;
                  v244 = *MEMORY[0x1E0C94B20];
                  objc_msgSend_shareID(v331, v240, v241);
                  v245 = (void *)objc_claimAutoreleasedReturnValue();
                  v246 = v244;
                  v42 = v243;
                  objc_msgSend_errorWithDomain_code_error_format_(v242, v247, v246, 5005, v243, CFSTR("Couldn't configure new participant on share %@"), v245);
                  *v321 = (id)objc_claimAutoreleasedReturnValue();

                }
              }
              else if (v321)
              {
                goto LABEL_108;
              }

              v175 = v87;
              goto LABEL_167;
            }
            objc_msgSend_userIdentity(v97, v110, v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setOutOfNetworkPrivateKey_(v112, v113, (uint64_t)v109);

            v114 = objc_alloc(MEMORY[0x1E0C94F68]);
            obja = v109;
            v92 = v331;
            objc_msgSend_share(v331, v115, v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_mutableEncryptedPSK(v117, v118, v119);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_data(v120, v121, v122);
            v123 = v87;
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_oneTimeURLSharingKeySeed(v97, v125, v126);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_participantID(v97, v128, v129);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = (void *)objc_msgSend_initWithSharingKeyBytes_sharingKeySeed_participantID_(v114, v131, (uint64_t)v124, v127, v130);

            v87 = v123;
            v94 = v326;

            objc_msgSend_participantID(v97, v133, v134);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = v325;
            objc_msgSend_setObject_forKeyedSubscript_(v325, v136, (uint64_t)v132, v135);

            v95 = v323;
          }
        }
        ++v96;
      }
      while (v94 != v96);
      v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v361, v382, 16);
    }
    while (v94);
  }

  if (objc_msgSend_count(v93, v137, v138))
  {
    objc_msgSend_share(v92, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v141, v142, (uint64_t)v93);

  }
  v358 = 0u;
  v359 = 0u;
  v356 = 0u;
  v357 = 0u;
  v143 = v87;
  v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v144, (uint64_t)&v356, v381, 16);
  v322 = v143;
  if (v145)
  {
    v148 = v145;
    v149 = *(_QWORD *)v357;
    do
    {
      v150 = 0;
      do
      {
        if (*(_QWORD *)v357 != v149)
          objc_enumerationMutation(v143);
        v151 = *(void **)(*((_QWORD *)&v356 + 1) + 8 * v150);
        if (objc_msgSend_role(v151, v146, v147) == 3
          || objc_msgSend_role(v151, v152, v153) == 2
          || objc_msgSend_role(v151, v154, v155) == 1)
        {
          v156 = (id)*MEMORY[0x1E0C952F8];
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v156);

          v157 = (id)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_shareID(v331, v158, v159);
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v370 = (uint64_t)v151;
            v371 = 2112;
            v372 = v169;
            _os_log_debug_impl(&dword_1BE990000, v157, OS_LOG_TYPE_DEBUG, "Setting up private participant %@ on share %@", buf, 0x16u);

          }
          objc_msgSend__ensurePrivateParticipant_isInInvitedSharePCS_(v331, v160, (uint64_t)v151, v332);
          v161 = objc_claimAutoreleasedReturnValue();
          if (v161)
          {
            v264 = (void *)v161;
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v180 = v325;
            v265 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              v307 = v265;
              objc_msgSend_shareID(v331, v308, v309);
              v310 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v370 = (uint64_t)v310;
              v371 = 2112;
              v372 = v264;
              _os_log_error_impl(&dword_1BE990000, v307, OS_LOG_TYPE_ERROR, "Couldn't configure new participant on share %@: %@", buf, 0x16u);

              if (!v321)
                goto LABEL_165;
LABEL_131:
              v266 = objc_retainAutorelease(v264);
              *v321 = v266;
              v42 = v266;
            }
            else
            {
              if (v321)
                goto LABEL_131;
LABEL_165:
              v42 = v264;
            }
            v175 = v322;
            goto LABEL_167;
          }
          if (objc_msgSend_isCurrentUser(v151, v162, v163))
          {
            objc_msgSend_protectionInfo(v151, v146, v147);
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_sharePCSData(v331, v165, v166);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setMyParticipantPCSData_(v167, v168, (uint64_t)v164);

            v143 = v322;
          }
        }
        ++v150;
      }
      while (v148 != v150);
      v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v146, (uint64_t)&v356, v381, 16);
    }
    while (v148);
  }

  v354 = 0u;
  v355 = 0u;
  v352 = 0u;
  v353 = 0u;
  objc_msgSend_share(v331, v170, v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removedParticipants(v172, v173, v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v176, (uint64_t)&v352, v380, 16);
  v180 = v325;
  if (!v177)
    goto LABEL_74;
  v181 = v177;
  v182 = *(_QWORD *)v353;
  do
  {
    for (i = 0; i != v181; ++i)
    {
      if (*(_QWORD *)v353 != v182)
        objc_enumerationMutation(v175);
      v184 = *(void **)(*((_QWORD *)&v352 + 1) + 8 * i);
      if (objc_msgSend_role(v184, v178, v179) == 3 || objc_msgSend_role(v184, v178, v185) == 2)
      {
        v351 = 0;
        objc_msgSend__removePrivateParticipantsFromInvitedPCS_error_(v331, v178, v332, &v351);
        v186 = v351;
        if (v186)
        {
          v289 = v186;
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v290 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            v316 = v290;
            objc_msgSend_shareID(v331, v317, v318);
            v319 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v370 = (uint64_t)v319;
            v371 = 2112;
            v372 = v289;
            _os_log_error_impl(&dword_1BE990000, v316, OS_LOG_TYPE_ERROR, "Couldn't remove participant participant PCS for share %@: %@", buf, 0x16u);

            if (!v321)
              goto LABEL_172;
LABEL_147:
            v42 = objc_retainAutorelease(v289);
            *v321 = v42;
          }
          else
          {
            if (v321)
              goto LABEL_147;
LABEL_172:
            v42 = v289;
          }
LABEL_167:

LABEL_168:
          v34 = 0;
          goto LABEL_169;
        }
      }
    }
    v181 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v178, (uint64_t)&v352, v380, 16);
  }
  while (v181);
LABEL_74:

  v187 = PCSFPCopyPublicIdentities();
  v188 = (void *)objc_opt_new();
  v346 = MEMORY[0x1E0C809B0];
  v347 = 3221225472;
  v348 = sub_1BEB27920;
  v349 = &unk_1E7831360;
  v324 = v188;
  v350 = v324;
  v320 = (void *)v187;
  CKCFArrayForEach();
  v344 = 0u;
  v345 = 0u;
  v342 = 0u;
  v343 = 0u;
  objc_msgSend_share(v331, v189, v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allParticipants(v191, v192, v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v194;
  v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v195, (uint64_t)&v342, v379, 16);
  if (!v196)
  {
    v200 = 0;
    goto LABEL_163;
  }
  v199 = v196;
  v200 = 0;
  v201 = *(_QWORD *)v343;
  v327 = *(_QWORD *)v343;
  while (2)
  {
    v202 = 0;
    while (2)
    {
      if (*(_QWORD *)v343 != v201)
        objc_enumerationMutation(obj);
      v203 = *(void **)(*((_QWORD *)&v342 + 1) + 8 * v202);
      objc_msgSend_share(v331, v197, v198);
      v204 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_addedParticipants(v204, v205, v206);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_containsObject_(v207, v208, (uint64_t)v203))
      {
LABEL_82:

        goto LABEL_83;
      }
      objc_msgSend_share(v331, v209, v210);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removedParticipants(v211, v212, v213);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_containsObject_(v214, v215, (uint64_t)v203) & 1) != 0)
      {

        goto LABEL_82;
      }
      if (objc_msgSend_role(v203, v216, v217) == 3)
      {

        goto LABEL_90;
      }
      v220 = objc_msgSend_role(v203, v218, v219);

      v221 = v220 == 2;
      v201 = v327;
      if (v221)
      {
LABEL_90:
        v222 = (id)*MEMORY[0x1E0C952F8];
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v222);

        v223 = (id)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled(v223, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_shareID(v331, v224, v225);
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v370 = (uint64_t)v203;
          v371 = 2112;
          v372 = v236;
          _os_log_debug_impl(&dword_1BE990000, v223, OS_LOG_TYPE_DEBUG, "Modifying per participant PCS permission for participant %@ on share %@", buf, 0x16u);

        }
        v228 = (void *)objc_msgSend_copy(v324, v226, v227);
        v341 = v200;
        v230 = v200;
        v231 = objc_msgSend__modifyRoleForParticipant_invitedPCS_shareeIdentities_error_(v331, v229, (uint64_t)v203, v332, v228, &v341);
        v232 = v341;

        if (v231 && !v232)
        {
          v200 = 0;
          v201 = v327;
          goto LABEL_84;
        }
        v233 = (id)*MEMORY[0x1E0C952F8];
        v201 = v327;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v233);

        v204 = (id)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_shareID(v331, v234, v235);
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v370 = (uint64_t)v237;
          v371 = 2112;
          v372 = v232;
          _os_log_error_impl(&dword_1BE990000, v204, OS_LOG_TYPE_ERROR, "Couldn't update participant PCS for participant's role on share %@: %@", buf, 0x16u);

          v201 = v327;
        }
        v200 = v232;
LABEL_83:

      }
LABEL_84:
      if (v199 != ++v202)
        continue;
      break;
    }
    v238 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v197, (uint64_t)&v342, v379, 16);
    v199 = v238;
    if (v238)
      continue;
    break;
  }
LABEL_163:

LABEL_111:
  v328 = v200;
  v339 = 0u;
  v340 = 0u;
  v337 = 0u;
  v338 = 0u;
  v248 = v331;
  objc_msgSend_share(v331, v50, v51);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invitedKeysToRemove(v249, v250, v251);
  v252 = (void *)objc_claimAutoreleasedReturnValue();

  v254 = objc_msgSend_countByEnumeratingWithState_objects_count_(v252, v253, (uint64_t)&v337, v378, 16);
  if (!v254)
  {

    goto LABEL_133;
  }
  v256 = v254;
  v257 = 0;
  v258 = *(_QWORD *)v338;
  do
  {
    v259 = 0;
    do
    {
      if (*(_QWORD *)v338 != v258)
        objc_enumerationMutation(v252);
      v260 = *(_QWORD *)(*((_QWORD *)&v337 + 1) + 8 * v259);
      objc_msgSend__removePublicKey_fromInvitedPCS_(v248, v255, v260, v332);
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      if (v261)
      {
        v262 = (id)*MEMORY[0x1E0C952F8];
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v262);

        v263 = (id)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled(v263, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v370 = v260;
          v371 = 2112;
          v372 = v261;
          _os_log_impl(&dword_1BE990000, v263, OS_LOG_TYPE_INFO, "Error removing public key %{public}@ from the invited PCS blob: %@", buf, 0x16u);
        }

        v248 = v331;
      }
      else
      {
        ++v257;
      }

      ++v259;
    }
    while (v256 != v259);
    v256 = objc_msgSend_countByEnumeratingWithState_objects_count_(v252, v255, (uint64_t)&v337, v378, 16);
  }
  while (v256);

  if (!v257)
  {
LABEL_133:
    v268 = (void *)PCSFPCopyPublicIdentities();
    objc_msgSend_share(v248, v269, v270);
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    v274 = objc_msgSend_publicPermission(v271, v272, v273);

    v335 = 0u;
    v336 = 0u;
    v333 = 0u;
    v334 = 0u;
    objc_msgSend_share(v248, v275, v276);
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participants(v277, v278, v279);
    v280 = (void *)objc_claimAutoreleasedReturnValue();

    v282 = objc_msgSend_countByEnumeratingWithState_objects_count_(v280, v281, (uint64_t)&v333, v377, 16);
    if (v282)
    {
      v285 = v282;
      v286 = 0;
      v287 = *(_QWORD *)v334;
      do
      {
        for (j = 0; j != v285; ++j)
        {
          if (*(_QWORD *)v334 != v287)
            objc_enumerationMutation(v280);
          if (objc_msgSend_role(*(void **)(*((_QWORD *)&v333 + 1) + 8 * j), v283, v284) != 4)
            ++v286;
        }
        v285 = objc_msgSend_countByEnumeratingWithState_objects_count_(v280, v283, (uint64_t)&v333, v377, 16);
      }
      while (v285);
    }
    else
    {
      v286 = 0;
    }

    if (v274 <= 1)
      v293 = (void *)v286;
    else
      v293 = (void *)(v286 + 1);
    if ((void *)objc_msgSend_count(v268, v291, v292) != v293)
    {
      v294 = (id)*MEMORY[0x1E0C952F8];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v294);

      v295 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v295, OS_LOG_TYPE_ERROR))
      {
        v312 = objc_msgSend_count(v268, v296, v297);
        objc_msgSend_shareID(v331, v313, v314);
        v315 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v370 = v312;
        v371 = 2048;
        v372 = v293;
        v373 = 2112;
        v374 = v315;
        v375 = 2112;
        v376 = v268;
        _os_log_error_impl(&dword_1BE990000, v295, OS_LOG_TYPE_ERROR, "Unexpected: The invitedPCS has a different number of public identities than expected (%tu vs. %tu) on the share %@: %@", buf, 0x2Au);

      }
    }

  }
  v34 = 1;
  v42 = v328;
LABEL_169:

  return v34;
}

- (BOOL)_modifyRoleForParticipant:(id)a3 invitedPCS:(_OpaquePCSShareProtection *)a4 shareeIdentities:(id)a5 error:(id *)a6
{
  _OpaquePCSShareProtection *v10;
  id v11;
  const char *v12;
  uint64_t v13;
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
  void *v24;
  _OpaquePCSShareProtection *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  char v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  BOOL v53;
  void *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  _OpaquePCSShareProtection *v71;
  uint64_t v72;
  id *v73;
  id v74;
  id v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  _OpaquePCSShareProtection *v79;
  __int16 v80;
  _OpaquePCSShareProtection *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v10 = (_OpaquePCSShareProtection *)a3;
  v11 = a5;
  v13 = objc_msgSend_invitedPCSPermissionForParticipant_(self, v12, (uint64_t)v10);
  objc_msgSend_protectionInfo(v10, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend_protectionInfoPublicKey(v10, v17, v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_57;
    v73 = a6;
    objc_msgSend_pcsManager(self, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfoPublicKey(v10, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0;
    v32 = (void *)objc_msgSend_createPublicSharingIdentityFromPublicKey_error_(v35, v39, (uint64_t)v38, &v74);
    v25 = (_OpaquePCSShareProtection *)v74;

    if (v32 && !v25)
    {
      v24 = 0;
      v26 = 0;
      goto LABEL_21;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v49 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      v63 = v49;
      objc_msgSend_protectionInfoPublicKey(v10, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v77 = v66;
      v78 = 2112;
      v79 = v10;
      v80 = 2112;
      v81 = v25;
      _os_log_error_impl(&dword_1BE990000, v63, OS_LOG_TYPE_ERROR, "Error deserializing protectionInfoPublicKey %@ on participant %@: %@", buf, 0x20u);

      if (!v32)
        goto LABEL_33;
    }
    else if (!v32)
    {
LABEL_33:
      v26 = 0;
      goto LABEL_56;
    }
    CFRelease(v32);
    goto LABEL_33;
  }
  v73 = a6;
  objc_msgSend_pcsManager(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionInfo(v10, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  v24 = (void *)objc_msgSend_createSharePCSFromEncryptedData_error_(v19, v23, (uint64_t)v22, &v75);
  v25 = (_OpaquePCSShareProtection *)v75;

  if (v24 && !v25)
  {
    v26 = (void *)PCSShareProtectionCopyPublicKeys();
    if ((unint64_t)objc_msgSend_count(v26, v27, v28) >= 2)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v31 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v77 = v24;
        _os_log_debug_impl(&dword_1BE990000, v31, OS_LOG_TYPE_DEBUG, "Found more than one public identity on per-participant PCS %@. Which one will be returned is undefined.", buf, 0xCu);
      }
      v25 = 0;
      v32 = 0;
      goto LABEL_40;
    }
    objc_msgSend_firstObject(v26, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    CFRetain(v32);
    if (!v32)
    {
      v25 = 0;
LABEL_40:
      v41 = 0;
      goto LABEL_48;
    }
LABEL_21:
    PCSPublicIdentityGetPublicID();
    v72 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_containsObject_(v11, v42, v72))
    {
      objc_msgSend_pcsManager(self, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addPublicIdentity_toSharePCS_permission_(v45, v46, (uint64_t)v32, a4, v13);
      v25 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

      v47 = (void *)*MEMORY[0x1E0C952F8];
      if (v25)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v47);
        v48 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v77 = v32;
          v78 = 2112;
          v79 = a4;
          _os_log_debug_impl(&dword_1BE990000, v48, OS_LOG_TYPE_DEBUG, "Cannot add public identity %@ to invitedPCS %@ for per participant PCS permission update", buf, 0x16u);
        }
        v41 = 0;
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v47);
        v52 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v67 = v52;
          CKStringFromSharePermission(v13);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_shareID(self, v69, v70);
          v71 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v77 = v68;
          v78 = 2112;
          v79 = v10;
          v80 = 2112;
          v81 = v71;
          _os_log_debug_impl(&dword_1BE990000, v67, OS_LOG_TYPE_DEBUG, "Successfully modified per participant PCS permission to %@ on invitedPCS for participant %@ on share %@", buf, 0x20u);

        }
        v25 = 0;
        v41 = 1;
      }
      v50 = (void *)v72;
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v50 = (void *)v72;
      v51 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v77 = v32;
        _os_log_error_impl(&dword_1BE990000, v51, OS_LOG_TYPE_ERROR, "Public identity %@ can be found on participant, but invitedPCS is not shared to it", buf, 0xCu);
      }
      v41 = 0;
      v25 = 0;
    }

    if (v24)
      goto LABEL_48;
LABEL_53:
    if (!v32)
    {
LABEL_49:
      a6 = v73;
      if ((v41 & 1) == 0)
      {
        if (v25)
          goto LABEL_51;
LABEL_57:
        v54 = (void *)MEMORY[0x1E0C94FF8];
        v55 = *MEMORY[0x1E0C94B20];
        objc_msgSend_shareID(self, v33, v34);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v54, v57, v55, 5005, CFSTR("Couldn't change per participant PCS permission on share %@"), v56);
        v25 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

        if (a6)
          goto LABEL_52;
LABEL_58:
        v53 = 0;
        goto LABEL_59;
      }
LABEL_55:
      v53 = 1;
      goto LABEL_59;
    }
    goto LABEL_54;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v40 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
  {
    v59 = v40;
    objc_msgSend_protectionInfo(v10, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v77 = v62;
    v78 = 2112;
    v79 = v25;
    _os_log_error_impl(&dword_1BE990000, v59, OS_LOG_TYPE_ERROR, "Error creating PCS from encrypted data %@: %@", buf, 0x16u);

  }
  v41 = 0;
  v26 = 0;
  v32 = 0;
  if (!v24)
    goto LABEL_53;
LABEL_48:
  CFRelease(v24);
  if (!v32)
    goto LABEL_49;
LABEL_54:
  CFRelease(v32);
  if ((v41 & 1) != 0)
    goto LABEL_55;
LABEL_56:
  a6 = v73;
  if (!v25)
    goto LABEL_57;
LABEL_51:
  if (!a6)
    goto LABEL_58;
LABEL_52:
  v25 = objc_retainAutorelease(v25);
  v53 = 0;
  *a6 = v25;
LABEL_59:

  return v53;
}

- (BOOL)_removePrivateParticipantsFromInvitedPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend_share(self, a2, (uint64_t)a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removedParticipants(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v29, v37, 16);
  if (!v12)
  {
    v22 = 0;
    goto LABEL_19;
  }
  v15 = v12;
  v16 = 0;
  v17 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v30 != v17)
        objc_enumerationMutation(v10);
      v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (objc_msgSend_role(v19, v13, v14) == 3 || objc_msgSend_role(v19, v13, v20) == 2)
      {
        objc_msgSend__removePrivateParticipant_fromInvitedSharePCS_(self, v13, (uint64_t)v19, a3);
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v16 = 1;
          continue;
        }
        v22 = (id)v21;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v23 = (void *)*MEMORY[0x1E0C952B0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          if (!a4)
            goto LABEL_19;
          goto LABEL_17;
        }
        v25 = v23;
        objc_msgSend_shareID(self, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v28;
        v35 = 2112;
        v36 = v22;
        _os_log_error_impl(&dword_1BE990000, v25, OS_LOG_TYPE_ERROR, "Couldn't remove participant from share %@: %@", buf, 0x16u);

        if (a4)
        {
LABEL_17:
          v22 = objc_retainAutorelease(v22);
          v16 = 0;
          *a4 = v22;
          goto LABEL_20;
        }
LABEL_19:
        v16 = 0;
        goto LABEL_20;
      }
    }
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v29, v37, 16);
    if (v15)
      continue;
    break;
  }
  v22 = 0;
LABEL_20:

  return v16 & 1;
}

- (id)_removePrivateParticipant:(id)a3 fromInvitedSharePCS:(_OpaquePCSShareProtection *)a4
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
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  char isEqualToString;
  _QWORD *v25;
  os_log_t *v26;
  void *v27;
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
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  char v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  os_log_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  os_log_t v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  os_log_t v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  os_log_t v79;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  NSObject *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint8_t buf[4];
  id v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_operation(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContext(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v21 = (void *)v18;
    objc_msgSend_participantID(v6, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)CFSTR("DONT-REMOVE-MY-KEY"));

    if ((isEqualToString & 1) != 0)
    {
LABEL_38:
      v68 = 0;
      goto LABEL_39;
    }
  }
  else
  {

  }
  v25 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v26 = (os_log_t *)MEMORY[0x1E0C952B0];
  v27 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v81 = v27;
    objc_msgSend_userIdentity(v6, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userIdentity(v6, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_publicSharingKey(v87, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfoPublicKey(v6, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v104 = v84;
    v105 = 2114;
    v106 = v90;
    v107 = 2114;
    v108 = v93;
    _os_log_debug_impl(&dword_1BE990000, v81, OS_LOG_TYPE_DEBUG, "Removing share participant with identity %@ and public key %{public}@, PPPCS public key: %{public}@", buf, 0x20u);

  }
  objc_msgSend_protectionInfo(v6, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend_pcsManager(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v6, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeEncryptedPCS_fromSharePCS_(v33, v37, (uint64_t)v36, a4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_protectionInfoPublicKey(v6, v31, v32);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend_pcsManager(self, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionInfoPublicKey(v6, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v45;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v46, (uint64_t)&v102, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_removePublicKeys_fromPCS_(v42, v48, (uint64_t)v47, a4);

      if ((v49 & 1) != 0)
      {
LABEL_30:
        if (*v25 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v74 = *v26;
        if (!os_log_type_enabled(*v26, OS_LOG_TYPE_DEBUG))
          goto LABEL_36;
        v75 = v74;
        objc_msgSend_participantID(v6, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v104 = v78;
        _os_log_debug_impl(&dword_1BE990000, v75, OS_LOG_TYPE_DEBUG, "Removed per-participant PCS from invited PCS for participant %@", buf, 0xCu);

LABEL_34:
        if (*v25 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
LABEL_36:
        v79 = *v26;
        if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEBUG))
        {
          v94 = v79;
          objc_msgSend_participantID(v6, v95, v96);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v104 = v97;
          _os_log_debug_impl(&dword_1BE990000, v94, OS_LOG_TYPE_DEBUG, "Successfully configured PCS data for removed participant %@", buf, 0xCu);

        }
        goto LABEL_38;
      }
      v52 = (void *)MEMORY[0x1E0C94FF8];
      v53 = *MEMORY[0x1E0C94B20];
      objc_msgSend_participantID(v6, v50, v51);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v52, v54, v53, 5001, CFSTR("Could not remove PPPCS public key from invited PCS for participant %@"), v33);
    }
    else
    {
      if (*v25 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v55 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v104 = v6;
        _os_log_error_impl(&dword_1BE990000, v55, OS_LOG_TYPE_ERROR, "No participant PCS nor public key found for participant %@. We can't remove them from the share", buf, 0xCu);
      }
      v58 = (void *)MEMORY[0x1E0C94FF8];
      v59 = *MEMORY[0x1E0C94B20];
      objc_msgSend_participantID(v6, v56, v57);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v58, v60, v59, 5001, CFSTR("No participant PCS or PPPCS public key exists for participant %@"), v33);
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v38)
    goto LABEL_30;
  if (*v25 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v61 = *v26;
  if (os_log_type_enabled(*v26, OS_LOG_TYPE_ERROR))
  {
    v98 = v61;
    objc_msgSend_participantID(v6, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v104 = v101;
    v105 = 2112;
    v106 = v38;
    _os_log_error_impl(&dword_1BE990000, v98, OS_LOG_TYPE_ERROR, "Couldn't remove per-participant PCS from invited PCS for participant %@: %@", buf, 0x16u);

  }
  v64 = (void *)MEMORY[0x1E0C94FF8];
  v65 = *MEMORY[0x1E0C94B20];
  objc_msgSend_participantID(v6, v62, v63);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_format_(v64, v67, v65, 5005, CFSTR("Couldn't remove per-participant PCS from invited PCS for participant %@: %@"), v66, v38);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v68)
    goto LABEL_34;
  if (*v25 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v69 = *v26;
  if (os_log_type_enabled(*v26, OS_LOG_TYPE_ERROR))
  {
    v70 = v69;
    objc_msgSend_participantID(v6, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v104 = v73;
    v105 = 2112;
    v106 = v68;
    _os_log_error_impl(&dword_1BE990000, v70, OS_LOG_TYPE_ERROR, "Couldn't configure PCS data for removed participant %@: %@", buf, 0x16u);

  }
LABEL_39:

  return v68;
}

- (id)_publicKeyForParticipant:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
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
  int IsManatee;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  id *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  int isOutOfNetwork;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
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
  const void *CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity;
  void *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  id v67;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint8_t buf[4];
  id v83;
  __int16 v84;
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend_role(v6, v7, v8) != 1 || !objc_msgSend_isCurrentUser(v6, v9, v10))
  {
    objc_msgSend_userIdentity(v6, v9, v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    isOutOfNetwork = objc_msgSend_isOutOfNetwork(v28, v29, v30);

    objc_msgSend_userIdentity(v6, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v34;
    if (!isOutOfNetwork)
    {
      objc_msgSend_publicSharingKey(v34, v35, v36);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    objc_msgSend_outOfNetworkPrivateKey(v34, v35, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend_pcsManager(self, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userIdentity(v6, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_outOfNetworkPrivateKey(v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_share(self, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mutableEncryptedPSK(v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity = (const void *)objc_msgSend_createCombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity_(v41, v57, (uint64_t)v47, v56);

      if (CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity)
      {
        v59 = (void *)PCSIdentityCopyExportedPublicKey();
        CFRelease(CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity);
        goto LABEL_19;
      }
LABEL_15:
      v59 = 0;
      goto LABEL_19;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v60 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v83 = v6;
      _os_log_error_impl(&dword_1BE990000, v60, OS_LOG_TYPE_ERROR, "No private OON key exists for participant %@. We can't add them to the share", buf, 0xCu);
      if (!a4)
        goto LABEL_15;
    }
    else if (!a4)
    {
      goto LABEL_15;
    }
    v63 = (void *)MEMORY[0x1E0C94FF8];
    v64 = *MEMORY[0x1E0C94B20];
    objc_msgSend_participantID(v6, v61, v62);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v63, v66, v64, 5005, CFSTR("No private OON key exists for participant %@"), v65);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  objc_msgSend_operation(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  IsManatee = objc_msgSend_currentServiceIsManatee(v17, v18, v19);

  objc_msgSend_pcsManager(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23;
  if (IsManatee)
  {
    v81 = 0;
    v26 = (id *)&v81;
    v27 = objc_msgSend_copyPublicKeyForService_withError_(v23, v24, 0, &v81);
  }
  else
  {
    v80 = 0;
    v26 = (id *)&v80;
    v27 = objc_msgSend_copyDiversifiedPublicKeyForService_withError_(v23, v24, 2, &v80);
  }
  v59 = (void *)v27;
  v67 = *v26;

  if (v67 || !v59)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v69 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v76 = v69;
      objc_msgSend_shareID(self, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v83 = v79;
      v84 = 2112;
      v85 = v67;
      _os_log_error_impl(&dword_1BE990000, v76, OS_LOG_TYPE_ERROR, "Couldn't create a public key for the owner participant on share %@: %@", buf, 0x16u);

      if (!a4)
        goto LABEL_20;
    }
    else if (!a4)
    {
      goto LABEL_20;
    }
    v72 = (void *)MEMORY[0x1E0C94FF8];
    v73 = *MEMORY[0x1E0C94B20];
    objc_msgSend_shareID(self, v70, v71);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v72, v75, v73, 5000, CFSTR("Couldn't create a public key for the owner participant on share %@"), v74);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
LABEL_19:
  v67 = 0;
LABEL_20:

  return v59;
}

- (BOOL)_addedPrivateParticipantNeedsAManateeInvitation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  objc_msgSend_pcsManager(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_currentServiceIsManatee(v7, v8, v9))
    v12 = objc_msgSend_role(v4, v10, v11) != 1;
  else
    v12 = 0;

  return v12;
}

- (_PCSPublicIdentityData)createPublicIdentityFromPublicKeyForParticipant:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  _PCSPublicIdentityData *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = 0;
  objc_msgSend__publicKeyForParticipant_error_(self, v7, (uint64_t)v6, &v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v35;
  v12 = v9;
  if (!v8 || v9)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v16 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v6;
      _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, "No public sharing key exists for participant %@. We can't add them to the share", buf, 0xCu);
      if (v12)
      {
LABEL_10:
        v15 = 0;
        if (!a4)
          goto LABEL_25;
        goto LABEL_23;
      }
    }
    else if (v12)
    {
      goto LABEL_10;
    }
    v22 = (void *)MEMORY[0x1E0C94FF8];
    v23 = *MEMORY[0x1E0C94B20];
    objc_msgSend_participantID(v6, v17, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v22, v25, v23, 5000, CFSTR("No public sharing key exists for participant %@"), v24);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    goto LABEL_22;
  }
  objc_msgSend_pcsManager(self, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v15 = (_PCSPublicIdentityData *)objc_msgSend_createPublicSharingIdentityFromPublicKey_error_(v13, v14, (uint64_t)v8, &v34);
  v12 = v34;

  if (!v12 && v15)
  {
    v12 = 0;
    goto LABEL_25;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v19 = (void *)*MEMORY[0x1E0C952B0];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    if (v12)
      goto LABEL_16;
    goto LABEL_21;
  }
  v26 = v19;
  objc_msgSend_participantID(v6, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138412802;
  v37 = v29;
  v38 = 2112;
  v39 = v12;
  v40 = 2114;
  v41 = v8;
  _os_log_error_impl(&dword_1BE990000, v26, OS_LOG_TYPE_ERROR, "Couldn't create an identity from the public sharing key for participant %@: %@ (key was %{public}@)", buf, 0x20u);

  if (!v12)
  {
LABEL_21:
    v30 = (void *)MEMORY[0x1E0C94FF8];
    v31 = *MEMORY[0x1E0C94B20];
    objc_msgSend_participantID(v6, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v30, v32, v31, 5000, CFSTR("Couldn't create an identity from the public sharing key for participant %@: %@ (key was %@)"), v24, 0, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    if (!a4)
      goto LABEL_25;
    goto LABEL_23;
  }
LABEL_16:
  if (!a4)
    goto LABEL_25;
LABEL_23:
  if (v12)
  {
    v12 = objc_retainAutorelease(v12);
    *a4 = v12;
  }
LABEL_25:

  return v15;
}

- (unint64_t)invitedPCSPermissionForParticipant:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;

  v3 = a3;
  v8 = objc_msgSend_role(v3, v4, v5) != 1 && objc_msgSend_role(v3, v6, v7) != 2;

  return v8;
}

- (id)_ensurePrivateParticipant:(id)a3 isInInvitedSharePCS:(_OpaquePCSShareProtection *)a4
{
  __CFString *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
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
  _BOOL4 v39;
  const char *v40;
  int v41;
  _OpaquePCSShareProtection *v42;
  _OpaquePCSShareProtection *v43;
  os_log_t *v44;
  os_log_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  const char *v62;
  void *v63;
  os_log_t v64;
  _BOOL4 v65;
  const char *v66;
  uint64_t v67;
  dispatch_block_t *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  _OpaquePCSShareProtection *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const __CFString *v81;
  _OpaquePCSShareProtection *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  _OpaquePCSShareProtection *v88;
  NSObject *v89;
  _OpaquePCSShareProtection *selfParticipantPCS;
  const char *v91;
  uint64_t v92;
  int v93;
  void *v94;
  const char *v95;
  _OpaquePCSShareProtection *v96;
  dispatch_block_t v97;
  uint64_t v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  int IsManatee;
  uint64_t v108;
  void *v109;
  const char *v110;
  _OpaquePCSShareProtection *selfPPPCSOwnerIdentity;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  os_log_t v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
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
  uint64_t v132;
  os_log_t v133;
  void *v134;
  const char *v135;
  _OpaquePCSShareProtection *v136;
  dispatch_block_t v137;
  uint64_t v138;
  os_log_t v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  void *v146;
  const char *v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  id v152;
  const char *v153;
  void *v154;
  const char *v155;
  _OpaquePCSShareProtection *v156;
  dispatch_block_t v157;
  uint64_t v158;
  os_log_t v159;
  void *v160;
  const char *v161;
  _OpaquePCSShareProtection *v162;
  os_log_t v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  os_log_t v170;
  void *v171;
  const char *v172;
  char v173;
  void *v174;
  _OpaquePCSShareProtection *v175;
  os_log_t v176;
  const char *v177;
  const char *v178;
  uint64_t v179;
  os_log_t v180;
  id v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  void *v192;
  const char *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  void *v198;
  _OpaquePCSShareProtection *v199;
  const char *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  const char *v210;
  os_log_t v211;
  const char *v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  NSObject *v219;
  const char *v220;
  uint64_t v221;
  __CFString *v222;
  os_log_t v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  os_log_t v230;
  os_log_t v231;
  const char *v232;
  uint64_t v233;
  void *v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  _OpaquePCSShareProtection *v239;
  _OpaquePCSShareProtection *v240;
  void *v241;
  void *v242;
  const char *v243;
  _OpaquePCSShareProtection *v244;
  const char *v245;
  const char *v246;
  uint64_t v247;
  _OpaquePCSShareProtection *v248;
  os_log_t v249;
  os_log_t v250;
  NSObject *v251;
  const char *v252;
  uint64_t v253;
  __CFString *v254;
  os_log_t v255;
  const char *v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  NSObject *v262;
  const char *v263;
  uint64_t v264;
  __CFString *v265;
  _OpaquePCSShareProtection *v266;
  dispatch_block_t v267;
  NSObject *v268;
  NSObject *v269;
  const char *v270;
  uint64_t v271;
  __CFString *v272;
  NSObject *v273;
  _OpaquePCSShareProtection *v274;
  const char *v276;
  uint64_t v277;
  NSObject *v278;
  const char *v279;
  uint64_t v280;
  __CFString *v281;
  NSObject *v282;
  const char *v283;
  uint64_t v284;
  __CFString *v285;
  NSObject *v286;
  const char *v287;
  uint64_t v288;
  __CFString *v289;
  NSObject *v290;
  const char *v291;
  uint64_t v292;
  __CFString *v293;
  NSObject *v294;
  const char *v295;
  uint64_t v296;
  __CFString *v297;
  NSObject *v298;
  const char *v299;
  uint64_t v300;
  __CFString *v301;
  _OpaquePCSShareProtection *v302;
  NSObject *v303;
  const char *v304;
  uint64_t v305;
  __CFString *v306;
  NSObject *v307;
  const char *v308;
  uint64_t v309;
  __CFString *v310;
  NSObject *v311;
  const char *v312;
  uint64_t v313;
  __CFString *v314;
  void *v315;
  NSObject *v316;
  _OpaquePCSShareProtection *v317;
  NSObject *v318;
  const char *v319;
  uint64_t v320;
  __CFString *v321;
  NSObject *v322;
  const char *v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  _OpaquePCSShareProtection *v327;
  const char *v328;
  uint64_t v329;
  void *v330;
  NSObject *v331;
  const char *v332;
  uint64_t v333;
  __CFString *v334;
  NSObject *v335;
  const char *v336;
  uint64_t v337;
  __CFString *v338;
  void *v339;
  const char *v340;
  unsigned int v341;
  _OpaquePCSShareProtection *v342;
  int v343;
  void *v344;
  SEL v345;
  uint64_t v346;
  void *v347;
  _OpaquePCSShareProtection *cf;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  _OpaquePCSShareProtection *v354;
  _OpaquePCSShareProtection *v355;
  id v356;
  id v357;
  id v358;
  id v359;
  uint8_t buf[4];
  const __CFString *v361;
  __int16 v362;
  _OpaquePCSShareProtection *v363;
  __int16 v364;
  _OpaquePCSShareProtection *v365;
  __int16 v366;
  void *v367;
  uint64_t v368;

  v368 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v345 = a2;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v73 = v7;
    objc_msgSend_userIdentity(v6, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isOutOfNetwork(v76, v77, v78))
      v81 = CFSTR("OON ");
    else
      v81 = &stru_1E7838F48;
    objc_msgSend_userIdentity(v6, v79, v80);
    v82 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userIdentity(v6, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_publicSharingKey(v85, v86, v87);
    v88 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v361 = v81;
    v362 = 2112;
    v363 = v82;
    v364 = 2114;
    v365 = v88;
    _os_log_debug_impl(&dword_1BE990000, v73, OS_LOG_TYPE_DEBUG, "Ensuring %{public}@share participant with identity %@ and public key %{public}@ is in invitedPCS", buf, 0x20u);

  }
  objc_msgSend_protectionInfo(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v346 = objc_msgSend_invitedPCSPermissionForParticipant_(self, v14, (uint64_t)v6);
  objc_msgSend_userIdentity(v6, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isOutOfNetwork(v17, v18, v19))
    v20 = 2;
  else
    v20 = 1;

  objc_msgSend_container(v13, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_useAnonymousToServerShareParticipants(v26, v27, v28) & 1) != 0)
  {
    objc_msgSend_share(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentUserParticipant(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_role(v34, v35, v36) == 1 && objc_msgSend_role(v6, v37, v38) != 1;

    if (v39)
      v41 = 4;
    else
      v41 = 0;
  }
  else
  {

    v41 = 0;
  }
  v359 = 0;
  v42 = (_OpaquePCSShareProtection *)objc_msgSend_createPublicIdentityFromPublicKeyForParticipant_error_(self, v40, (uint64_t)v6, &v359);
  v43 = (_OpaquePCSShareProtection *)v359;
  v44 = (os_log_t *)MEMORY[0x1E0C952B0];
  v353 = v13;
  if (v43 || !v42)
  {
    v71 = 0;
    v72 = 0;
    v68 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
    if (v42)
      goto LABEL_164;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v343 = v20;
    v45 = *v44;
    if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
    {
      v219 = v45;
      objc_msgSend_participantID(v6, v220, v221);
      v222 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v361 = v222;
      v362 = 2112;
      v363 = v42;
      _os_log_debug_impl(&dword_1BE990000, v219, OS_LOG_TYPE_DEBUG, "Created public identity for participant %@: %@", buf, 0x16u);

    }
    cf = v42;
    if (*MEMORY[0x1E0C95280] && objc_msgSend_role(v6, v46, v47) == 1)
    {
      objc_msgSend_container(v13, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceContext(v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_testDeviceReference(v51, v52, v53);
      v54 = objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        v57 = v13;
        v58 = (void *)v54;
        objc_msgSend_unitTestOverrides(v57, v55, v56);
        v59 = v41;
        v60 = v10;
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)CFSTR("NoOwnerPPPCS"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v60;
        v41 = v59;

        v44 = (os_log_t *)MEMORY[0x1E0C952B0];
        if (v63)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v64 = *v44;
          v65 = os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG);
          v68 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
          v42 = cf;
          if (v65)
          {
            v282 = v64;
            objc_msgSend_shareID(self, v283, v284);
            v285 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v361 = v285;
            _os_log_debug_impl(&dword_1BE990000, v282, OS_LOG_TYPE_DEBUG, "Skipping PPPCS for the owner on share %@ because the unit tests told us to do it.", buf, 0xCu);

          }
          if ((objc_msgSend_isCloudDocsContainer(self, v66, v67) & 1) != 0)
          {
            v43 = 0;
          }
          else
          {
            objc_msgSend_pcsManager(self, v69, v70);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addPublicIdentity_toSharePCS_permission_(v160, v161, (uint64_t)cf, a4, v346);
            v162 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

            if (v162)
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], *v68);
              v163 = *v44;
              if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
              {
                v311 = v163;
                objc_msgSend_participantID(v6, v312, v313);
                v314 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v361 = v314;
                v362 = 2112;
                v363 = v162;
                _os_log_error_impl(&dword_1BE990000, v311, OS_LOG_TYPE_ERROR, "Couldn't add per-participant PCS to invited PCS for participant %@: %@", buf, 0x16u);

              }
              v166 = (void *)MEMORY[0x1E0C94FF8];
              v167 = *MEMORY[0x1E0C94B20];
              objc_msgSend_participantID(v6, v164, v165);
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_format_(v166, v169, v167, 5005, CFSTR("Couldn't add per-participant PCS to invited PCS for participant %@: %@"), v168, v162);
              v43 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

              v42 = cf;
            }
            else
            {
              v43 = 0;
            }
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], *v68);
            v250 = *v44;
            if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
            {
              v294 = v250;
              objc_msgSend_participantID(v6, v295, v296);
              v297 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v361 = v297;
              _os_log_debug_impl(&dword_1BE990000, v294, OS_LOG_TYPE_DEBUG, "Added owner public key to invited PCS for participant %@", buf, 0xCu);

            }
          }
          v71 = 0;
          v72 = 0;
          goto LABEL_164;
        }
      }
      else
      {

      }
    }
    v68 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
    if (v10 && objc_msgSend_isCurrentUser(v6, v46, v47))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], *v68);
      v89 = *v44;
      if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE990000, v89, OS_LOG_TYPE_DEBUG, "Using the self participant PCS...", buf, 2u);
      }
      selfParticipantPCS = self->_selfParticipantPCS;
      if (selfParticipantPCS)
      {
        CFRetain(self->_selfParticipantPCS);
        v93 = 0;
        v72 = 0;
        v342 = 0;
        goto LABEL_100;
      }
    }
    objc_msgSend_pcsManager(self, v46, v47);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v358 = 0;
    selfParticipantPCS = (_OpaquePCSShareProtection *)objc_msgSend_createEmptySharePCSOfType_error_(v94, v95, 4, &v358);
    v96 = (_OpaquePCSShareProtection *)v358;

    v97 = *v68;
    v98 = *MEMORY[0x1E0C95300];
    if (!v96 && selfParticipantPCS)
    {
      if (v98 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v97);
      v99 = *v44;
      if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v361 = v6;
        v362 = 2112;
        v363 = selfParticipantPCS;
        _os_log_debug_impl(&dword_1BE990000, v99, OS_LOG_TYPE_DEBUG, "Created a new per-participant PCS blob for participant %@: %@", buf, 0x16u);
      }
      v341 = v41;
      if (objc_msgSend_role(v6, v100, v101) == 1
        && (objc_msgSend_pcsManager(self, v102, v103),
            v104 = (void *)objc_claimAutoreleasedReturnValue(),
            IsManatee = objc_msgSend_currentServiceIsManatee(v104, v105, v106),
            v104,
            IsManatee))
      {
        objc_msgSend_pcsManager(self, v102, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        selfPPPCSOwnerIdentity = (_OpaquePCSShareProtection *)objc_msgSend_copyPublicAuthorshipIdentityFromPCS_(v109, v110, (uint64_t)a4);

        if (!selfPPPCSOwnerIdentity)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], *v68);
          v249 = *v44;
          if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
          {
            v331 = v249;
            objc_msgSend_participantID(v6, v332, v333);
            v334 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v361 = v334;
            _os_log_debug_impl(&dword_1BE990000, v331, OS_LOG_TYPE_DEBUG, "Couldn't get the share authorship identity for participant %@", buf, 0xCu);

          }
          v43 = 0;
          v71 = 0;
          v72 = 0;
          v240 = cf;
          goto LABEL_163;
        }
        objc_msgSend_pcsManager(self, v112, v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setOwnerIdentity_onPCS_(v114, v115, (uint64_t)selfPPPCSOwnerIdentity, selfParticipantPCS);

      }
      else
      {
        selfPPPCSOwnerIdentity = 0;
      }
      if (!objc_msgSend__addedPrivateParticipantNeedsAManateeInvitation_(self, v102, (uint64_t)v6))
      {
        objc_msgSend_pcsManager(self, v123, v124);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPublicIdentity_toSharePCS_permission_(v134, v135, (uint64_t)cf, selfParticipantPCS, v341 | v343);
        v136 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

        v137 = *v68;
        v138 = *MEMORY[0x1E0C95300];
        v342 = selfPPPCSOwnerIdentity;
        if (v136)
        {
          if (v138 != -1)
            dispatch_once(MEMORY[0x1E0C95300], v137);
          v139 = *v44;
          if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
          {
            v286 = v139;
            objc_msgSend_participantID(v6, v287, v288);
            v289 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v361 = v289;
            v362 = 2112;
            v363 = v136;
            _os_log_error_impl(&dword_1BE990000, v286, OS_LOG_TYPE_ERROR, "Couldn't add public identity to per-participant PCS for participant %@: %@", buf, 0x16u);

          }
          v142 = (void *)MEMORY[0x1E0C94FF8];
          v143 = *MEMORY[0x1E0C94B20];
          objc_msgSend_participantID(v6, v140, v141);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v142, v145, v143, 5005, CFSTR("Couldn't add public identity to per-participant PCS for participant %@: %@"), v144, v136);
          v43 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

          v72 = 0;
          v71 = 0;
          goto LABEL_158;
        }
        if (v138 != -1)
          dispatch_once(MEMORY[0x1E0C95300], v137);
        v170 = *v44;
        if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
        {
          v298 = v170;
          objc_msgSend_participantID(v6, v299, v300);
          v301 = (__CFString *)objc_claimAutoreleasedReturnValue();
          CKStringFromSharePermission(v343 | v341);
          v302 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v361 = v301;
          v362 = 2114;
          v363 = v302;
          _os_log_debug_impl(&dword_1BE990000, v298, OS_LOG_TYPE_DEBUG, "Added participant's public identity to their per-participant blob for participant %@ with permission %{public}@", buf, 0x16u);

        }
        v72 = 0;
        goto LABEL_99;
      }
      objc_msgSend_share(self, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_currentUserParticipant(v125, v126, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_role(v128, v129, v130) != 2)
      {
        if (!selfPPPCSOwnerIdentity)
        {
          objc_msgSend_pcsManager(self, v131, v132);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          selfPPPCSOwnerIdentity = (_OpaquePCSShareProtection *)objc_msgSend_copyPublicAuthorshipIdentityFromPCS_(v146, v147, (uint64_t)a4);

          if (!selfPPPCSOwnerIdentity)
            goto LABEL_123;
        }
LABEL_80:
        objc_msgSend_userIdentity(v6, v131, v132);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_publicSharingKey(v148, v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();

        v342 = selfPPPCSOwnerIdentity;
        if (!v151)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], *v68);
          v223 = *v44;
          if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
          {
            v303 = v223;
            objc_msgSend_participantID(v6, v304, v305);
            v306 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v361 = v306;
            _os_log_error_impl(&dword_1BE990000, v303, OS_LOG_TYPE_ERROR, "Cannot add participant %@ with missing public key to share", buf, 0xCu);

          }
          v226 = (void *)MEMORY[0x1E0C94FF8];
          v227 = *MEMORY[0x1E0C94B20];
          objc_msgSend_participantID(v6, v224, v225);
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v226, v229, v227, 8014, CFSTR("Cannot add participant %@ with missing public key to share"), v228);
          v43 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

          v175 = cf;
          goto LABEL_128;
        }
        v344 = v128;
        v152 = objc_alloc(MEMORY[0x1E0D82610]);
        v154 = (void *)objc_msgSend_initWithShareProtectionRef_(v152, v153, (uint64_t)selfParticipantPCS);
        v357 = 0;
        objc_msgSend_sharingRequestDataForIdentity_owner_flags_error_(v154, v155, (uint64_t)cf, selfPPPCSOwnerIdentity, v341, &v357);
        v72 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
        v156 = (_OpaquePCSShareProtection *)v357;
        v157 = *v68;
        v158 = *MEMORY[0x1E0C95300];
        if (v156 || !v72)
        {
          if (v158 != -1)
            dispatch_once(MEMORY[0x1E0C95300], v157);
          v351 = v154;
          v231 = *v44;
          if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
          {
            v318 = v231;
            objc_msgSend_participantID(v6, v319, v320);
            v321 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v361 = v321;
            v362 = 2112;
            v363 = v156;
            _os_log_error_impl(&dword_1BE990000, v318, OS_LOG_TYPE_ERROR, "Couldn't create manatee sharing invitation data for participant %@: %@", buf, 0x16u);

          }
          v234 = (void *)MEMORY[0x1E0C94FF8];
          v235 = *MEMORY[0x1E0C94B20];
          objc_msgSend_participantID(v6, v232, v233);
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v234, v237, v235, 5005, CFSTR("Couldn't create a manatee sharing invitation data for participant %@: %@"), v236, v156);
          v238 = objc_claimAutoreleasedReturnValue();
          v239 = v156;
          v43 = (_OpaquePCSShareProtection *)v238;

          CFRelease(cf);
          v71 = 0;
          v240 = v342;
          goto LABEL_163;
        }
        if (v158 != -1)
          dispatch_once(MEMORY[0x1E0C95300], v157);
        v159 = *v44;
        if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
        {
          v315 = v154;
          v316 = v159;
          CKStringFromSharePermission(v341);
          v317 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v361 = v6;
          v362 = 2114;
          v363 = v317;
          v364 = 2112;
          v365 = v72;
          _os_log_debug_impl(&dword_1BE990000, v316, OS_LOG_TYPE_DEBUG, "Created a new manatee sharing invitation blob for participant %@ with permission %{public}@: %@", buf, 0x20u);

          v154 = v315;
        }

LABEL_99:
        v93 = 1;
LABEL_100:
        objc_msgSend_pcsManager(self, v91, v92);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        v356 = 0;
        v173 = objc_msgSend_addSharePCS_toRecordPCS_permission_error_(v171, v172, (uint64_t)selfParticipantPCS, a4, v346, &v356);
        v43 = (_OpaquePCSShareProtection *)v356;

        v174 = (void *)*MEMORY[0x1E0C952F8];
        if ((v173 & 1) == 0)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v174);
          v68 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
          v211 = *v44;
          if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
          {
            v278 = v211;
            objc_msgSend_participantID(v6, v279, v280);
            v281 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v361 = v281;
            v362 = 2112;
            v363 = v43;
            _os_log_error_impl(&dword_1BE990000, v278, OS_LOG_TYPE_ERROR, "Couldn't add per-participant PCS to invited PCS for participant %@: %@", buf, 0x16u);

          }
          v214 = (void *)MEMORY[0x1E0C94FF8];
          v215 = *MEMORY[0x1E0C94B20];
          objc_msgSend_participantID(v6, v212, v213);
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v214, v217, v215, 5005, CFSTR("Couldn't add per-participant PCS to invited PCS for participant %@: %@"), v216, v43);
          v218 = objc_claimAutoreleasedReturnValue();

          v71 = 0;
          v43 = (_OpaquePCSShareProtection *)v218;
          goto LABEL_158;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v174);
        v175 = cf;
        v176 = *v44;
        if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
        {
          v262 = v176;
          objc_msgSend_participantID(v6, v263, v264);
          v265 = (__CFString *)objc_claimAutoreleasedReturnValue();
          CKStringFromSharePermission(v346);
          v352 = v10;
          v266 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v361 = v265;
          v362 = 2114;
          v363 = v266;
          _os_log_debug_impl(&dword_1BE990000, v262, OS_LOG_TYPE_DEBUG, "Added per-participant PCS to invited PCS for participant %@ with permission %{public}@", buf, 0x16u);

          v175 = cf;
          v10 = v352;

          if (v93)
            goto LABEL_105;
        }
        else if (v93)
        {
LABEL_105:
          if (objc_msgSend__addedPrivateParticipantNeedsAManateeInvitation_(self, v177, (uint64_t)v6))
          {
            if (!v72)
            {
              objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v178, v179);
              v339 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v339, v340, (uint64_t)v345, self, CFSTR("CKDModifyShareHandler.m"), 1333, CFSTR("Should never get here with a nil manateeInvitationData"));

            }
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v350 = v10;
            v180 = *v44;
            if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
            {
              v322 = v180;
              objc_msgSend_share(self, v323, v324);
              v347 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_URL(v347, v325, v326);
              v327 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_participantID(v6, v328, v329);
              v330 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v361 = v6;
              v362 = 2112;
              v363 = v72;
              v364 = 2112;
              v365 = v327;
              v366 = 2112;
              v367 = v330;
              _os_log_debug_impl(&dword_1BE990000, v322, OS_LOG_TYPE_DEBUG, "Creating invitation token for participant %@. Invitation data: %@, shareURL %@, participantID: %@", buf, 0x2Au);

            }
            v181 = objc_alloc(MEMORY[0x1E0C94CE0]);
            objc_msgSend_share(self, v182, v183);
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_URL(v184, v185, v186);
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_participantID(v6, v188, v189);
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            v192 = (void *)objc_msgSend_initWithSharingInvitationData_shareURL_participantID_(v181, v191, (uint64_t)v72, v187, v190);
            objc_msgSend_setInvitationToken_(v6, v193, (uint64_t)v192);

            objc_msgSend_pcsManager(self, v194, v195);
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            v355 = v43;
            objc_msgSend_publicKeyDataFromPCS_error_(v196, v197, (uint64_t)selfParticipantPCS, &v355);
            v198 = (void *)objc_claimAutoreleasedReturnValue();
            v199 = v355;

            objc_msgSend_setProtectionInfoPublicKey_(v6, v200, (uint64_t)v198);
            objc_msgSend_pcsManager(self, v201, v202);
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            v205 = objc_msgSend_publicKeyVersionForServiceType_(v203, v204, 0);
            objc_msgSend_userIdentity(v6, v206, v207);
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPublicKeyVersion_(v208, v209, v205);

            objc_msgSend_setMutableInvitationTokenStatus_(v6, v210, 1);
            v71 = 0;
            v43 = v199;
            v10 = v350;
            goto LABEL_157;
          }
          v241 = v10;
          objc_msgSend_pcsManager(self, v178, v179);
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          v354 = v43;
          objc_msgSend_dataFromSharePCS_pcsBlobType_error_(v242, v243, (uint64_t)selfParticipantPCS, 4, &v354);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v244 = v354;

          if (v244 || !v71)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v255 = *v44;
            if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
            {
              v335 = v255;
              objc_msgSend_participantID(v6, v336, v337);
              v338 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v361 = v338;
              v362 = 2112;
              v363 = v244;
              _os_log_error_impl(&dword_1BE990000, v335, OS_LOG_TYPE_ERROR, "Couldn't serialize per-participant PCS for participant %@: %@", buf, 0x16u);

            }
            v258 = (void *)MEMORY[0x1E0C94FF8];
            v259 = *MEMORY[0x1E0C94B20];
            objc_msgSend_participantID(v6, v256, v257);
            v260 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(v258, v261, v259, 5005, CFSTR("Couldn't serialize per-participant PCS for participant %@: %@"), v260, v244);
            v43 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

            v10 = v241;
            goto LABEL_157;
          }
          objc_msgSend_setProtectionInfo_(v6, v245, (uint64_t)v71);
          v10 = v241;
          if (!objc_msgSend_isCurrentUser(v6, v246, v247))
          {
            v43 = 0;
LABEL_157:
            v68 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
LABEL_158:
            v175 = cf;
            goto LABEL_162;
          }
          v248 = self->_selfParticipantPCS;
          v175 = cf;
          if (v248)
            CFRelease(v248);
          self->_selfParticipantPCS = selfParticipantPCS;
          CFRetain(selfParticipantPCS);
          v43 = 0;
LABEL_161:
          v68 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
LABEL_162:
          CFRelease(v175);
          v42 = selfParticipantPCS;
          v240 = v342;
          if (v342)
          {
LABEL_163:
            CFRelease(v240);
            v42 = selfParticipantPCS;
          }
LABEL_164:
          CFRelease(v42);
          goto LABEL_165;
        }
        v71 = 0;
        goto LABEL_161;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], *v68);
      v133 = *v44;
      if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
      {
        v290 = v133;
        objc_msgSend_participantID(v128, v291, v292);
        v293 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v361 = v293;
        _os_log_debug_impl(&dword_1BE990000, v290, OS_LOG_TYPE_DEBUG, "Admin %@ using the owner identity of self PPPCS to setup new participant", buf, 0xCu);

        if (selfPPPCSOwnerIdentity)
        {
LABEL_70:
          CFRetain(selfPPPCSOwnerIdentity);
          if (!selfPPPCSOwnerIdentity)
          {
LABEL_123:
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], *v68);
            v175 = cf;
            v230 = *v44;
            if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
            {
              v307 = v230;
              objc_msgSend_participantID(v6, v308, v309);
              v310 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v361 = v310;
              _os_log_debug_impl(&dword_1BE990000, v307, OS_LOG_TYPE_DEBUG, "Couldn't get the share authorship identity for participant %@", buf, 0xCu);

            }
            v342 = 0;
            v43 = 0;
LABEL_128:

            v72 = 0;
            v71 = 0;
            goto LABEL_162;
          }
          goto LABEL_80;
        }
      }
      else if (selfPPPCSOwnerIdentity)
      {
        goto LABEL_70;
      }
      selfPPPCSOwnerIdentity = (_OpaquePCSShareProtection *)self->_selfPPPCSOwnerIdentity;
      goto LABEL_70;
    }
    if (v98 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v97);
    v116 = *v44;
    if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
    {
      v251 = v116;
      objc_msgSend_participantID(v6, v252, v253);
      v254 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v361 = v254;
      v362 = 2112;
      v363 = v96;
      _os_log_error_impl(&dword_1BE990000, v251, OS_LOG_TYPE_ERROR, "Couldn't create a per-participant PCS for participant %@: %@", buf, 0x16u);

    }
    v119 = (void *)MEMORY[0x1E0C94FF8];
    v120 = *MEMORY[0x1E0C94B20];
    objc_msgSend_participantID(v6, v117, v118);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v119, v122, v120, 5005, CFSTR("Couldn't create a per-participant PCS for participant %@: %@"), v121, v96);
    v43 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

    CFRelease(cf);
    v71 = 0;
    v72 = 0;
    v42 = selfParticipantPCS;
    if (selfParticipantPCS)
      goto LABEL_164;
  }
LABEL_165:
  v267 = *v68;
  if (v43)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v267);
    v268 = *v44;
    if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR))
    {
      v269 = v268;
      objc_msgSend_participantID(v6, v270, v271);
      v272 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v361 = v272;
      v362 = 2112;
      v363 = v43;
      _os_log_error_impl(&dword_1BE990000, v269, OS_LOG_TYPE_ERROR, "Couldn't set up PCS data for new participant %@: %@", buf, 0x16u);
LABEL_175:

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v267);
    v273 = *v44;
    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEBUG))
    {
      v269 = v273;
      objc_msgSend_participantID(v6, v276, v277);
      v272 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v361 = v272;
      _os_log_debug_impl(&dword_1BE990000, v269, OS_LOG_TYPE_DEBUG, "Successfully set up PCS data for new participant %@", buf, 0xCu);
      goto LABEL_175;
    }
  }
  v274 = v43;

  return v274;
}

- (id)_removePublicKey:(id)a3 fromInvitedPCS:(_OpaquePCSShareProtection *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_pcsManager(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v11 = (const void *)objc_msgSend_createPublicSharingIdentityFromPublicKey_error_(v9, v10, (uint64_t)v6, &v22);
  v12 = v22;

  if (v12)
    v15 = 1;
  else
    v15 = v11 == 0;
  if (!v15)
  {
    objc_msgSend_pcsManager(self, v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removePublicIdentity_fromSharePCS_(v18, v19, (uint64_t)v11, a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v20 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v24 = v6;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_1BE990000, v20, OS_LOG_TYPE_INFO, "Couldn't remove public key %{public}@ from the invited pcs: %@", buf, 0x16u);
      }
    }
LABEL_19:
    CFRelease(v11);
    goto LABEL_20;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v16 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_1BE990000, v16, OS_LOG_TYPE_INFO, "Couldn't create an identity from the public sharing key %{public}@: %@", buf, 0x16u);
  }
  if (!v12)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't create an identity from the public sharing key %@"), v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
    goto LABEL_19;
LABEL_20:

  return v12;
}

- (void)clearProtectionDataForRecord
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
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
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  const char *v41;
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
  void *v56;
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
  objc_super v71;
  uint8_t buf[4];
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)CKDModifyShareHandler;
  -[CKDModifyRecordHandler clearProtectionDataForRecord](&v71, sel_clearProtectionDataForRecord);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v6 = v3;
    objc_msgSend_shareID(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v73 = v9;
    _os_log_impl(&dword_1BE990000, v6, OS_LOG_TYPE_INFO, "Clearing share protection data for share %@", buf, 0xCu);

  }
  objc_msgSend_share(self, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPrivatePCS_(v10, v11, 0);

  objc_msgSend_share(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInvitedProtectionData_(v14, v15, 0);

  objc_msgSend_share(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInvitedProtectionEtag_(v18, v19, 0);

  objc_msgSend_share(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicPCS_(v22, v23, 0);

  objc_msgSend_share(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicProtectionData_(v26, v27, 0);

  objc_msgSend_share(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicProtectionEtag_(v30, v31, 0);

  objc_msgSend_share(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousProtectionEtag_(v34, v35, 0);

  objc_msgSend_share(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousPublicProtectionEtag_(v38, v39, 0);

  objc_msgSend_setSharePCSData_(self, v40, 0);
  objc_msgSend_setSharedZonePCSData_(self, v41, 0);
  objc_msgSend_operation(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareID(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedShareID_(v44, v48, 0, v47);

  objc_msgSend_share(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participants(v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v54, v55, (uint64_t)&unk_1E7833E70);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_container(v44, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backgroundPublicIdentityLookupService(v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeCacheForLookupInfos_(v62, v63, (uint64_t)v56);
  objc_msgSend_container(v44, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_foregroundPublicIdentityLookupService(v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeCacheForLookupInfos_(v69, v70, (uint64_t)v56);
}

- (void)setServerRecord:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  int isZoneWideShare;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  id v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  id v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t j;
  void *v144;
  void *v145;
  const char *v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  void *v162;
  const char *v163;
  CKDModifyShareHandler *v164;
  void *v165;
  id v166;
  void *v167;
  id obj;
  objc_super v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _BYTE v178[128];
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_operation(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_47;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v162, v163, (uint64_t)a2, self, CFSTR("CKDModifyShareHandler.m"), 1434, CFSTR("Share handler called back with a CKRecord instead of a CKShare"));

  }
  v11 = v5;
  objc_msgSend_mutableEncryptedPSK(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v17 = objc_alloc(MEMORY[0x1E0C94D18]);
    objc_msgSend_mutableEncryptedPSK(v11, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend_initWithData_(v17, v24, (uint64_t)v23);
    objc_msgSend_share(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMutableEncryptedPSK_(v28, v29, (uint64_t)v25);
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend_share(self, v15, v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mutableEncryptedPSK(v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v36 = objc_alloc(MEMORY[0x1E0C94D18]);
    objc_msgSend_share(self, v37, v38);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mutableEncryptedPSK(v20, v39, v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v23, v41, v42);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend_initWithData_(v36, v43, (uint64_t)v25);
    objc_msgSend_setMutableEncryptedPSK_(v11, v44, (uint64_t)v28);
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend_share(self, v34, v35);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  isZoneWideShare = objc_msgSend_isZoneWideShare(v45, v46, v47);

  v167 = v11;
  if (!isZoneWideShare)
    goto LABEL_32;
  v165 = v8;
  v166 = v5;
  objc_msgSend_oneTimeURLMetadatasByParticipantID(v11, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = self;
  objc_msgSend_share(self, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_oneTimeURLMetadatasByParticipantID(v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_allKeys(v51, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v57, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v61, v65, (uint64_t)v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v58, v67, (uint64_t)v66);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  obj = v68;
  v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v69, (uint64_t)&v174, v179, 16);
  if (!v70)
    goto LABEL_27;
  v72 = v70;
  v73 = *(_QWORD *)v175;
  do
  {
    for (i = 0; i != v72; ++i)
    {
      if (*(_QWORD *)v175 != v73)
        objc_enumerationMutation(obj);
      v75 = *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * i);
      objc_msgSend_objectForKeyedSubscript_(v51, v71, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v57, v77, v75);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v78;
      if (v78)
      {
        if (v76)
        {
          objc_msgSend_encryptedOneTimeFullToken(v76, v79, v80);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_data(v82, v83, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          if (v85)
          {
            v88 = objc_alloc(MEMORY[0x1E0C94D18]);
            objc_msgSend_encryptedOneTimeFullToken(v76, v89, v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_data(v91, v92, v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = (void *)objc_msgSend_initWithData_(v88, v95, (uint64_t)v94);
            objc_msgSend_setEncryptedOneTimeFullToken_(v81, v97, (uint64_t)v96);
          }
          else
          {
            objc_msgSend_encryptedOneTimeFullToken(v81, v86, v87);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_data(v100, v101, v102);
            v103 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v103)
              goto LABEL_25;
            v104 = objc_alloc(MEMORY[0x1E0C94D18]);
            objc_msgSend_encryptedOneTimeFullToken(v81, v105, v106);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_data(v91, v107, v108);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = (void *)objc_msgSend_initWithData_(v104, v109, (uint64_t)v94);
            objc_msgSend_setEncryptedOneTimeFullToken_(v76, v110, (uint64_t)v96);
          }

        }
        else
        {
          v91 = (void *)objc_msgSend_copy(v78, v79, v80);
          objc_msgSend_setObject_forKeyedSubscript_(v51, v99, (uint64_t)v91, v75);
        }
      }
      else
      {
        v91 = (void *)objc_msgSend_copy(v76, v79, v80);
        objc_msgSend_setObject_forKeyedSubscript_(v57, v98, (uint64_t)v91, v75);
      }

LABEL_25:
    }
    v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v71, (uint64_t)&v174, v179, 16);
  }
  while (v72);
LABEL_27:

  v11 = v167;
  if (objc_msgSend_count(v51, v111, v112))
    objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v167, v113, (uint64_t)v51);
  v8 = v165;
  v5 = v166;
  self = v164;
  if (objc_msgSend_count(v57, v113, v114))
  {
    objc_msgSend_share(v164, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v117, v118, (uint64_t)v57);

  }
LABEL_32:
  objc_msgSend_etag(v11, v49, v50);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  if (v119)
  {
    objc_msgSend_etag(v11, v120, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_share(self, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEtag_(v125, v126, (uint64_t)v122);
    goto LABEL_36;
  }
  objc_msgSend_share(self, v120, v121);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_etag(v127, v128, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  if (v130)
  {
    objc_msgSend_share(self, v131, v132);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_etag(v122, v133, v134);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEtag_(v11, v135, (uint64_t)v125);
LABEL_36:

  }
  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  objc_msgSend_participants(v11, v131, v132);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v137, (uint64_t)&v170, v178, 16);
  if (v138)
  {
    v141 = v138;
    v142 = *(_QWORD *)v171;
    do
    {
      for (j = 0; j != v141; ++j)
      {
        if (*(_QWORD *)v171 != v142)
          objc_enumerationMutation(v136);
        v144 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * j);
        objc_msgSend_share(self, v139, v140);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__knownParticipantEqualToParticipant_(v145, v146, (uint64_t)v144);
        v147 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_invitationToken(v147, v148, v149);
        v150 = (void *)objc_claimAutoreleasedReturnValue();

        if (v150)
        {
          objc_msgSend_invitationToken(v147, v151, v152);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setInvitationToken_(v144, v154, (uint64_t)v153);

        }
      }
      v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v139, (uint64_t)&v170, v178, 16);
    }
    while (v141);
  }

  objc_msgSend_container(v8, v155, v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = objc_msgSend_databaseScope(v8, v158, v159);
  objc_msgSend__prepPCSDataUsingPreDecryptedPCSOnlyWithContainer_databaseScope_(v167, v161, (uint64_t)v157, v160);

LABEL_47:
  v169.receiver = self;
  v169.super_class = (Class)CKDModifyShareHandler;
  -[CKDModifyRecordHandler setServerRecord:](&v169, sel_setServerRecord_, v5);

}

- (void)savePCSDataToCache
{
  uint64_t v2;
  void *v4;
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
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
  objc_super v39;

  objc_msgSend_operation(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_record(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_etag(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_record(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_etag(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharePCSData(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShareEtag_(v19, v20, (uint64_t)v16);

  }
  objc_msgSend_sharePCSData(self, v11, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareID(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedShareID_(v4, v25, (uint64_t)v21, v24);

  objc_msgSend_sharedZonePCSData(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend_sharedZonePCSData(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareID(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPCSData_forFetchedZoneID_(v4, v38, (uint64_t)v31, v37);

  }
  v39.receiver = self;
  v39.super_class = (Class)CKDModifyShareHandler;
  -[CKDModifyRecordHandler savePCSDataToCache](&v39, sel_savePCSDataToCache);

}

- (void)updateParticipantsForFetchedShare:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v11 = v8;
  if (v8)
  {
    if (objc_msgSend_CKIsObjectNotFoundError(v8, v9, v10))
    {
      objc_msgSend_clearProtectionDataForRecord(self, v12, v13);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend_share(self, v14, v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addedParticipants(v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v38, v42, 16);
      if (v21)
      {
        v23 = v21;
        v24 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v39 != v24)
              objc_enumerationMutation(v19);
            objc_msgSend_setProtectionInfo_(*(void **)(*((_QWORD *)&v38 + 1) + 8 * i), v22, 0);
          }
          v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v38, v42, 16);
        }
        while (v23);
      }

      objc_msgSend_setState_(self, v26, 1);
      objc_msgSend_setError_(self, v27, 0);
    }
    else
    {
      objc_msgSend_setState_(self, v12, 12);
      objc_msgSend_setError_(self, v35, (uint64_t)v11);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v28, v29);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, self, CFSTR("CKDModifyShareHandler.m"), 1521, CFSTR("Share handler called back with a CKRecord instead of a CKShare"));

    }
    objc_msgSend_share(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateFromServerShare_(v30, v31, (uint64_t)v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend_setState_(self, v33, 12);
      objc_msgSend_setError_(self, v34, (uint64_t)v32);
    }
    else
    {
      objc_msgSend_setState_(self, v33, 1);
    }

  }
}

- (void)dealloc
{
  _PCSPublicIdentityData *selfPPPCSOwnerIdentity;
  _OpaquePCSShareProtection *selfParticipantPCS;
  objc_super v5;

  selfPPPCSOwnerIdentity = self->_selfPPPCSOwnerIdentity;
  if (selfPPPCSOwnerIdentity)
  {
    CFRelease(selfPPPCSOwnerIdentity);
    self->_selfPPPCSOwnerIdentity = 0;
  }
  selfParticipantPCS = self->_selfParticipantPCS;
  if (selfParticipantPCS)
  {
    CFRelease(selfParticipantPCS);
    self->_selfParticipantPCS = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CKDModifyShareHandler;
  -[CKDModifyShareHandler dealloc](&v5, sel_dealloc);
}

- (BOOL)haveAddedOwnerToShare
{
  return self->_haveAddedOwnerToShare;
}

- (void)setHaveAddedOwnerToShare:(BOOL)a3
{
  self->_haveAddedOwnerToShare = a3;
}

- (BOOL)isALegacyPublicShareThatNeedsOwnerPPPCSUpgrade
{
  return self->_isALegacyPublicShareThatNeedsOwnerPPPCSUpgrade;
}

- (void)setIsALegacyPublicShareThatNeedsOwnerPPPCSUpgrade:(BOOL)a3
{
  self->_isALegacyPublicShareThatNeedsOwnerPPPCSUpgrade = a3;
}

@end
