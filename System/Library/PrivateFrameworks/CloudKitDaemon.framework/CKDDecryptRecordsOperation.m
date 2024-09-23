@implementation CKDDecryptRecordsOperation

- (CKDDecryptRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDDecryptRecordsOperation *v9;
  void *v10;
  const char *v11;
  dispatch_group_t v12;
  OS_dispatch_group *recordDecryptGroup;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  OS_dispatch_queue *recordDecryptQueue;
  uint64_t v18;
  NSMutableArray *outstandingDecryptions;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKDDecryptRecordsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v26, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_webSharingIdentityDataByRecordID(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWebSharingIdentityDataByRecordID_(v9, v11, (uint64_t)v10);

    v12 = dispatch_group_create();
    recordDecryptGroup = v9->_recordDecryptGroup;
    v9->_recordDecryptGroup = (OS_dispatch_group *)v12;

    objc_msgSend_createInactiveSerialQueue(v9, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    recordDecryptQueue = v9->_recordDecryptQueue;
    v9->_recordDecryptQueue = (OS_dispatch_queue *)v16;

    v18 = objc_opt_new();
    outstandingDecryptions = v9->_outstandingDecryptions;
    v9->_outstandingDecryptions = (NSMutableArray *)v18;

    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_maxUnwrapAttempts = (int)objc_msgSend_PCSRetryCount(v22, v23, v24);

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/decrypt-records", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)decryptRecord:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  CKRecordDecryptInfo *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  void *v39;
  const char *v40;
  _QWORD block[5];
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend_isMarkedToFinish(self, v9, v10))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, self, CFSTR("CKDDecryptRecordsOperation.m"), 115, CFSTR("Operation %@ has already been marked to finished. You can't enqueue any more decrypts"), self);

  }
  objc_msgSend_recordDecryptGroup(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v13);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    objc_msgSend_recordID(v7, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v47 = v18;
    _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_INFO, "Enqueuing decryption for record %@", buf, 0xCu);

  }
  v19 = [CKRecordDecryptInfo alloc];
  objc_msgSend_callbackQueue(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend_initWithRecord_callbackQueue_(v19, v23, (uint64_t)v7, v22);

  objc_initWeak((id *)buf, v24);
  v25 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = sub_1BEC28A68;
  v43[3] = &unk_1E7838060;
  v43[4] = self;
  objc_copyWeak(&v45, (id *)buf);
  v26 = v8;
  v44 = v26;
  objc_msgSend_setCallback_(v24, v27, (uint64_t)v43);
  objc_msgSend_outstandingDecryptions(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v30);
  objc_msgSend_outstandingDecryptions(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v33, v34, (uint64_t)v24);

  objc_sync_exit(v30);
  objc_msgSend_recordDecryptQueue(self, v35, v36);
  v37 = objc_claimAutoreleasedReturnValue();
  block[0] = v25;
  block[1] = 3221225472;
  block[2] = sub_1BEC28AB0;
  block[3] = &unk_1E782EE20;
  block[4] = self;
  v42 = v24;
  v38 = v24;
  dispatch_async(v37, block);

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)buf);

}

- (void)_recordInfoWasDecrypted:(id)a3 nextSteps:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
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
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  void *v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  int v76;
  void *v77;
  __int16 v78;
  const __CFString *v79;
  __int16 v80;
  const __CFString *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  objc_msgSend_callbackQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v14 = v11;
    objc_msgSend_record(v6, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v6, v21, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      v26 = CFSTR(" with error: ");
    else
      v26 = &stru_1E7838F48;
    objc_msgSend_error(v6, v23, v24);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = (const __CFString *)v27;
    else
      v29 = &stru_1E7838F48;
    v76 = 138412802;
    v77 = v20;
    v78 = 2114;
    v79 = v26;
    v80 = 2112;
    v81 = v29;
    _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_INFO, "Record %@ was decrypted%{public}@%@", (uint8_t *)&v76, 0x20u);

  }
  objc_msgSend_error(v6, v12, v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend_error(v6, v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = CKIsPCSError();

    if (v34)
    {
      v35 = objc_msgSend_numUnwrapAttempts(v6, v30, v31);
      v38 = objc_msgSend_maxUnwrapAttempts(self, v36, v37);
      v39 = (void *)*MEMORY[0x1E0C952F8];
      v40 = *MEMORY[0x1E0C95300];
      if (v35 < v38)
      {
        if (v40 != -1)
          dispatch_once(MEMORY[0x1E0C95300], v39);
        v41 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v43 = v41;
          objc_msgSend_record(v6, v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v46, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 138412290;
          v77 = v49;
          _os_log_impl(&dword_1BE990000, v43, OS_LOG_TYPE_INFO, "Clearing protection data for record %@ and retrying decryption", (uint8_t *)&v76, 0xCu);

        }
        objc_msgSend_setError_(v6, v42, 0);
        objc_msgSend_callbackQueue(self, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__setupDecryptCallbackForQueue_(v6, v53, (uint64_t)v52);

        objc_msgSend__clearProtectionDataForRecordInfo_(self, v54, (uint64_t)v6);
        objc_msgSend__decryptRecordInfo_(self, v55, (uint64_t)v6);
        goto LABEL_26;
      }
      if (v40 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v39);
      v56 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v57 = v56;
        objc_msgSend_record(v6, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v60, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 138412290;
        v77 = v63;
        _os_log_impl(&dword_1BE990000, v57, OS_LOG_TYPE_INFO, "Decryption has failed for record %@ too many times. Giving up", (uint8_t *)&v76, 0xCu);

      }
    }
  }
  if (v7)
  {
    objc_msgSend_record(v6, v30, v31);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v6, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v64, v67);

  }
  objc_msgSend_outstandingDecryptions(self, v30, v31);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v68);
  objc_msgSend_outstandingDecryptions(self, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v71, v72, (uint64_t)v6);

  objc_sync_exit(v68);
  objc_msgSend_recordDecryptGroup(self, v73, v74);
  v75 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v75);

LABEL_26:
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (void)_clearProtectionDataForRecordInfo:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
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
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  id v40;
  const char *v41;
  const char *v42;
  id v43;

  objc_msgSend_record(a3, a2, (uint64_t)a3);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v43, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedRecordID_(self, v7, 0, v6);

  objc_msgSend_recordID(v43, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedZoneID_(self, v14, 0, v13);

  objc_msgSend_share(v43, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedShareID_(self, v21, 0, v20);

  objc_msgSend_parent(v43, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedRecordID_(self, v28, 0, v27);

  v29 = objc_alloc(MEMORY[0x1E0C95070]);
  v30 = *MEMORY[0x1E0C949F0];
  objc_msgSend_recordID(v43, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend_initWithRecordName_zoneID_(v29, v37, v30, v36);

  objc_msgSend_setPCSData_forFetchedShareID_(self, v39, 0, v38);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = v43;
    objc_msgSend_setPrivatePCS_(v40, v41, 0);
    objc_msgSend_setPublicPCS_(v40, v42, 0);

  }
}

- (void)_decryptRecordInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
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
  const char *v29;
  int v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  int hasPropertiesRequiringDecryption;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  int v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  uint8_t buf[4];
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_record(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_numUnwrapAttempts(v4, v8, v9);
  objc_msgSend_setNumUnwrapAttempts_(v4, v11, v10 + 1);
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isAppleInternalInstall(v14, v15, v16) & 1) != 0)
  {
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordNamesForFakingDecryptionFailure(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v7, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_containsObject_(v22, v29, (uint64_t)v28);

    if (v30)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v31, *MEMORY[0x1E0C94B20], 5004, 0, CFSTR("Faking decryption failure on record because you asked for it"));
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v4, v34, (uint64_t)v33);
LABEL_19:

      goto LABEL_20;
    }
  }
  else
  {

  }
  hasPropertiesRequiringDecryption = objc_msgSend_hasPropertiesRequiringDecryption(v7, v31, v32);
  if (objc_msgSend_isCancelled(self, v36, v37))
  {
    v40 = (void *)MEMORY[0x1E0C94FF8];
    v41 = *MEMORY[0x1E0C94B20];
    objc_msgSend_operationID(self, v38, v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v40, v43, v41, 1, CFSTR("Decrypt operation %@ was cancelled"), v42);
    v33 = objc_claimAutoreleasedReturnValue();

    if (!v33)
      goto LABEL_20;
    goto LABEL_18;
  }
  if ((hasPropertiesRequiringDecryption & 1) != 0 || objc_msgSend_forcePCSDecrypt(self, v38, v39))
  {
    if (objc_msgSend_useEncryption(self, v38, v39))
    {
      objc_msgSend_protectionData(v7, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {

LABEL_22:
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v59 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v78 = v59;
          objc_msgSend_recordID(v7, v79, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v83 = v81;
          _os_log_debug_impl(&dword_1BE990000, v78, OS_LOG_TYPE_DEBUG, "We need to decrypt properties on record %@. Fetching PCS data for that record", buf, 0xCu);

        }
        objc_msgSend__handleProtectionDataForRecordInfo_(self, v60, (uint64_t)v4);
        goto LABEL_20;
      }
      objc_msgSend_zoneishKeyID(v7, v47, v48);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
        goto LABEL_22;
      v61 = objc_msgSend_forcePCSDecrypt(self, v57, v58);
      v62 = (void *)*MEMORY[0x1E0C952F8];
      if (((v61 ^ 1 | hasPropertiesRequiringDecryption) & 1) != 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v62);
        v63 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v66 = v63;
          objc_msgSend_recordID(v7, v67, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v83 = v69;
          _os_log_impl(&dword_1BE990000, v66, OS_LOG_TYPE_INFO, "Record %@ has items that require encryption but no protection data was found on the record", buf, 0xCu);

        }
        v70 = (void *)MEMORY[0x1E0C94FF8];
        v71 = *MEMORY[0x1E0C94B20];
        objc_msgSend_recordID(v7, v64, v65);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v70, v73, v71, 5001, CFSTR("Record %@ has items that require encryption but no protection data was found on the record"), v72);
        v33 = objc_claimAutoreleasedReturnValue();

        if (!v33)
          goto LABEL_20;
LABEL_18:
        objc_msgSend_setError_(v4, v38, (uint64_t)v33);
        goto LABEL_19;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v62);
      v74 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v33 = v74;
        objc_msgSend_recordID(v7, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v83 = v77;
        _os_log_impl(&dword_1BE990000, v33, OS_LOG_TYPE_INFO, "Suppressing error for record %@ because no protection data was found on the record while forcing decryption and it has no properties requiring decryption", buf, 0xCu);

        goto LABEL_19;
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v49 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v51 = v49;
        objc_msgSend_recordID(v7, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v83 = v54;
        _os_log_impl(&dword_1BE990000, v51, OS_LOG_TYPE_INFO, "Encryption is disabled, so we're only going to pretend to unwrap the data on record %@. You asked for it!", buf, 0xCu);

      }
      objc_msgSend__unwrapEncryptedPropertiesOnRecord_withPCS_(self, v50, (uint64_t)v7, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
        goto LABEL_18;
    }
  }
LABEL_20:
  objc_msgSend_decryptGroup(v4, v38, v39);
  v55 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v55);

}

- (void)_decryptRecordInfo:(id)a3 usingWebSharingIdentityData:(id)a4
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
  const void *v18;
  id v19;
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
  const void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  const void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_record(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v18 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v16, v17, (uint64_t)v7, &v45);

  v19 = v45;
  if (v19 || !v18)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v36 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v19;
      _os_log_error_impl(&dword_1BE990000, v36, OS_LOG_TYPE_ERROR, "Couldn't create a sharing identity from sharing identity data: %@", buf, 0xCu);
      if (v19)
      {
LABEL_15:
        if (!v18)
          goto LABEL_25;
        goto LABEL_24;
      }
    }
    else if (v19)
    {
      goto LABEL_15;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v37, *MEMORY[0x1E0C94B20], 5003, CFSTR("Couldn't create a sharing identity"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend_container(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionData(v10, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v30 = (const void *)objc_msgSend_createSharePCSFromData_sharingIdentity_error_(v25, v29, (uint64_t)v28, v18, &v44);
  v19 = v44;

  v31 = (void *)*MEMORY[0x1E0C952F8];
  v32 = *MEMORY[0x1E0C95300];
  if (!v19 && v30)
  {
    if (v32 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v31);
    v33 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v40 = v33;
      objc_msgSend_recordID(v10, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v43;
      v48 = 2112;
      v49 = v30;
      _os_log_debug_impl(&dword_1BE990000, v40, OS_LOG_TYPE_DEBUG, "Setting CKRecordPCS on record %@: %@", buf, 0x16u);

    }
    objc_msgSend_setRecordPCS_(v10, v34, (uint64_t)v30);
    objc_msgSend__unwrapEncryptedPropertiesOnRecord_withPCS_(self, v35, (uint64_t)v10, v30);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (v32 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v31);
  v38 = *MEMORY[0x1E0C952B0];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    if (v19)
      goto LABEL_22;
    goto LABEL_21;
  }
  *(_DWORD *)buf = 138412290;
  v47 = v19;
  _os_log_error_impl(&dword_1BE990000, v38, OS_LOG_TYPE_ERROR, "Couldn't create a sharing identity from sharing identity data: %@", buf, 0xCu);
  if (!v19)
  {
LABEL_21:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v39, *MEMORY[0x1E0C94B20], 5003, CFSTR("Couldn't unwrap record PCS with web sharing PCS"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:
  if (v30)
LABEL_23:
    CFRelease(v30);
LABEL_24:
  CFRelease(v18);
LABEL_25:
  objc_msgSend_setError_(v6, v37, (uint64_t)v19);

}

- (void)_handleZoneProtectionDataForRecordInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
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
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  id v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  _BOOL4 v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  _QWORD v47[4];
  id v48;
  CKDDecryptRecordsOperation *v49;
  id v50;
  _QWORD v51[4];
  void *v52;
  CKDDecryptRecordsOperation *v53;
  id v54;

  v4 = a3;
  objc_msgSend_record(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend_isZoneWideShare(v7, v8, v9) & 1) == 0
    && objc_msgSend_privatePCS(v7, v8, v9)
    && objc_msgSend_publicPCS(v7, v8, v9))
  {
    objc_msgSend_decryptGroup(v4, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);

    objc_msgSend_container(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topmostParentOperation(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = sub_1BEC29BF4;
    v51[3] = &unk_1E7838088;
    v52 = v7;
    v53 = self;
    v54 = v4;
    v23 = v4;
    v24 = v7;
    objc_msgSend_pcsDataFromFetchedShare_requestorOperationID_completionHandler_(v16, v25, (uint64_t)v24, v22, v51);

    v26 = v52;
  }
  else
  {
    objc_msgSend_container(self, v8, v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsCache(v27, v28, v29);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_record(v4, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishKeyID(v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35 != 0;

    objc_msgSend_decryptGroup(v4, v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v39);

    objc_msgSend_recordID(v7, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = sub_1BEC29E94;
    v47[3] = &unk_1E78380B0;
    v48 = v7;
    v49 = self;
    v50 = v4;
    v26 = v4;
    v23 = v7;
    objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v24, v46, (uint64_t)v45, self, 8 * v36, v47);

  }
}

- (id)_decryptRecordPCSForRecord:(id)a3 usingZonePCS:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const char *v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
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
  const char *v36;
  uint64_t v37;
  int v38;
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
  const char *v50;
  uint64_t v51;
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
  int v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  void *v83;
  void *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  void *v91;
  const char *v92;
  const char *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  NSObject *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  const __CFString *v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_zoneishKeyID(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend_zoneishPCS(v7, v11, v12))
    {
      v15 = (const __CFString *)objc_msgSend_zoneishPCS(v7, v13, v14);
      if (v15)
      {
        v16 = v15;
        CFRetain(v15);
        v18 = 0;
LABEL_24:
        objc_msgSend_dataWithRecord_(CKDRecordPCSData, v17, (uint64_t)v6);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPcs_(v84, v85, (uint64_t)v16);
        objc_msgSend_setZonePCSData_(v84, v86, (uint64_t)v7);
        objc_msgSend_recordID(v6, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPCSData_forFetchedRecordID_(self, v90, (uint64_t)v84, v89);

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v91 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v106 = v91;
          objc_msgSend_recordID(v6, v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v114 = v109;
          v115 = 2112;
          v116 = v16;
          _os_log_debug_impl(&dword_1BE990000, v106, OS_LOG_TYPE_DEBUG, "Setting CKRecordPCS on record %@: %@", buf, 0x16u);

        }
        objc_msgSend_setRecordPCS_(v6, v92, (uint64_t)v16);
        objc_msgSend__unwrapEncryptedPropertiesOnRecord_withPCS_(self, v93, (uint64_t)v6, v16);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        CFRelease(v16);
        goto LABEL_34;
      }
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      objc_msgSend_recordID(v6, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v114 = v26;
      _os_log_impl(&dword_1BE990000, v20, OS_LOG_TYPE_INFO, "Couldn't get a zoneish PCS for zone %@. We'll try the record PCS if it exists, just in case.", buf, 0xCu);

    }
  }
  if (objc_msgSend_pcs(v7, v11, v12)
    && (objc_msgSend_protectionData(v6, v27, v28),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v29,
        v29))
  {
    objc_msgSend_container(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_acceptServerSignedRecords(v35, v36, v37);

    objc_msgSend_container(self, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionData(v6, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend_pcs(v7, v48, v49);
    if (v38)
    {
      objc_msgSend_validatedTrusts(CKDServerTrustCache, v50, v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = 0;
      v16 = (const __CFString *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_trusts_error_(v44, v54, (uint64_t)v47, 1, v52, v53, &v112);
      v18 = (__CFString *)v112;

      if (!v18)
      {
        objc_msgSend_container(self, v17, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsManager(v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_protectionData(v6, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = 0;
        v64 = objc_msgSend_recordProtectionDataNeedsCounterSign_error_(v59, v63, (uint64_t)v62, &v111);
        v18 = (__CFString *)v111;

        if (v64)
          objc_msgSend_setNeedsRollAndCounterSign_(v6, v17, 1);
      }
    }
    else
    {
      v110 = 0;
      v16 = (const __CFString *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v44, v50, (uint64_t)v47, 1, v52, &v110);
      v18 = (__CFString *)v110;

    }
    if (v16)
      goto LABEL_24;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v94 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v97 = v94;
      objc_msgSend_recordID(v6, v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v114 = v100;
      v115 = 2112;
      v116 = v18;
      _os_log_impl(&dword_1BE990000, v97, OS_LOG_TYPE_INFO, "Couldn't create record PCS for record %@: %@", buf, 0x16u);

    }
    v101 = (void *)MEMORY[0x1E0C94FF8];
    v102 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(v6, v95, v96);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v101, v104, v102, 5001, CFSTR("Record %@ has items that require encryption but no protection data was found: %@"), v103, v18);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v65 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v68 = v65;
      objc_msgSend_recordID(v6, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionData(v6, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = &stru_1E7838F48;
      if (!v77)
        v78 = CFSTR(" - record has no protection data");
      *(_DWORD *)buf = 138412546;
      v114 = v74;
      v115 = 2114;
      v116 = v78;
      _os_log_impl(&dword_1BE990000, v68, OS_LOG_TYPE_INFO, "Couldn't fetch a PCS for zone %@%{public}@", buf, 0x16u);

    }
    v79 = (void *)MEMORY[0x1E0C94FF8];
    v80 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(v6, v66, v67);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v79, v82, v80, 5001, CFSTR("Record %@ has items that require encryption but no zone protection data was found"), v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_34:

  return v83;
}

- (id)_decryptRecordPCSForRecord:(id)a3 usingSharePCS:(id)a4
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
  uint64_t v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  void *v35;
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
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_container(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionData(v6, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_pcs(v7, v17, v18);
  v51 = 0;
  v21 = (void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v13, v20, (uint64_t)v16, 1, v19, &v51);
  v22 = v51;

  if (v21)
  {
    objc_msgSend_dataWithRecord_(CKDRecordPCSData, v23, (uint64_t)v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPcs_(v24, v25, (uint64_t)v21);
    objc_msgSend_setSharePCSData_(v24, v26, (uint64_t)v7);
    objc_msgSend_recordID(v6, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPCSData_forFetchedRecordID_(self, v30, (uint64_t)v24, v29);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v31 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v47 = v31;
      objc_msgSend_recordID(v6, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = v50;
      v54 = 2112;
      v55 = v21;
      _os_log_debug_impl(&dword_1BE990000, v47, OS_LOG_TYPE_DEBUG, "Setting CKRecordPCS on record %@: %@", buf, 0x16u);

    }
    objc_msgSend_setRecordPCS_(v6, v32, (uint64_t)v21);
    objc_msgSend__unwrapEncryptedPropertiesOnRecord_withPCS_(self, v33, (uint64_t)v6, v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v21);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v35 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v38 = v35;
      objc_msgSend_recordID(v6, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = v41;
      v54 = 2112;
      v55 = v22;
      _os_log_impl(&dword_1BE990000, v38, OS_LOG_TYPE_INFO, "Couldn't create record PCS for record %@ from share: %@", buf, 0x16u);

    }
    objc_msgSend_recordID(v6, v36, v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v6, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(self, v45, (uint64_t)v22, v24, 5001, CFSTR("Record %@ has items that require encryption but no protection data was found"), v44);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v34;
}

- (id)_decryptRecordPCSForRecord:(id)a3 usingChainPCS:(id)a4
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
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
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
  void *v36;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v56;
  const char *v57;
  void *v58;
  id v59;
  const char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  id v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_container(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decryptChainPCSForRecordPCS_(v13, v14, (uint64_t)v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    || (objc_msgSend_chainPCSData(v7, v16, v17),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        v41 = objc_msgSend_pcs(v38, v39, v40),
        v38,
        !v41))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v18 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v21 = v18;
      objc_msgSend_recordID(v6, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v89 = v24;
      v90 = 2112;
      v91 = v15;
      _os_log_impl(&dword_1BE990000, v21, OS_LOG_TYPE_INFO, "Couldn't create record PCS for record %@ from parent PCS: %@", buf, 0x16u);

    }
    objc_msgSend_parent(v6, v19, v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parent(v6, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(self, v35, (uint64_t)v15, v28, 5001, CFSTR("Couldn't unwrap chain PCS on parent %@"), v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_container(self, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionData(v6, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chainPCSData(v7, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend_pcs(v53, v54, v55);
    v87 = 0;
    v58 = (void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v47, v57, (uint64_t)v50, 1, v56, &v87);
    v59 = v87;

    if (!v59 && v58)
    {
      objc_msgSend_dataWithRecord_(CKDRecordPCSData, v60, (uint64_t)v6);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPcs_(v61, v62, (uint64_t)v58);
      objc_msgSend_setParentPCSData_(v61, v63, (uint64_t)v7);
      objc_msgSend_recordID(v6, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPCSData_forFetchedRecordID_(self, v67, (uint64_t)v61, v66);

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v68 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v83 = v68;
        objc_msgSend_recordID(v6, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v89 = v86;
        v90 = 2112;
        v91 = v58;
        _os_log_debug_impl(&dword_1BE990000, v83, OS_LOG_TYPE_DEBUG, "Setting CKRecordPCS on record %@: %@", buf, 0x16u);

      }
      objc_msgSend_setRecordPCS_(v6, v69, (uint64_t)v58);
      objc_msgSend__unwrapEncryptedPropertiesOnRecord_withPCS_(self, v70, (uint64_t)v6, v58);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
      CFRelease(v58);
      goto LABEL_7;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v71 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v74 = v71;
      objc_msgSend_recordID(v6, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v89 = v77;
      v90 = 2112;
      v91 = 0;
      _os_log_impl(&dword_1BE990000, v74, OS_LOG_TYPE_INFO, "Couldn't create record PCS for record %@ from parent PCS: %@", buf, 0x16u);

    }
    objc_msgSend_recordID(v6, v72, v73);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v6, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(self, v82, (uint64_t)v59, v78, 5001, CFSTR("Record %@ has items that require encryption but no protection data was found"), v81);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
      goto LABEL_21;
  }
LABEL_7:

  return v36;
}

- (void)_handleShareProtectionDataForRecordInfo:(id)a3
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
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
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
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  _QWORD v73[4];
  id v74;
  CKDDecryptRecordsOperation *v75;
  id v76;
  _QWORD v77[4];
  id v78;
  CKDDecryptRecordsOperation *v79;
  id v80;
  _QWORD v81[4];
  id v82;
  CKDDecryptRecordsOperation *v83;
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  CKDDecryptRecordsOperation *v88;
  id v89;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend_record(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_decryptGroup(v4, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v13);

    objc_msgSend_container(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsCache(v16, v17, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_share(v7, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = sub_1BEC2B400;
    v86[3] = &unk_1E7838088;
    v87 = v7;
    v88 = self;
    v89 = v4;
    objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v19, v26, (uint64_t)v25, self, 0, v86);

    v27 = v87;
  }
  else
  {
    objc_msgSend_parent(v7, v11, v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_decryptGroup(v4, v29, v30);
      v31 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v31);

      objc_msgSend_container(self, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsCache(v34, v35, v36);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_parent(v7, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = sub_1BEC2B6D8;
      v81[3] = &unk_1E78380D8;
      v82 = v7;
      objc_copyWeak(&v85, &location);
      v83 = self;
      v84 = v4;
      objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v19, v43, (uint64_t)v42, self, 4, v81);

      objc_destroyWeak(&v85);
      v27 = v82;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend_isZoneWideShare(v7, v44, v45) & 1) == 0)
      {
        objc_msgSend_decryptGroup(v4, v44, v45);
        v59 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v59);

        objc_msgSend_container(self, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsManager(v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_topmostParentOperation(self, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationID(v68, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = sub_1BEC2B9B0;
        v77[3] = &unk_1E7838088;
        v78 = v7;
        v79 = self;
        v80 = v4;
        objc_msgSend_pcsDataFromFetchedShare_requestorOperationID_completionHandler_(v65, v72, (uint64_t)v78, v71, v77);

        v19 = v78;
        goto LABEL_9;
      }
      objc_msgSend_decryptGroup(v4, v44, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v46);

      objc_msgSend_container(self, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsCache(v49, v50, v51);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_recordID(v7, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = sub_1BEC2BC50;
      v73[3] = &unk_1E78380B0;
      v74 = v7;
      v75 = self;
      v76 = v4;
      objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v19, v58, (uint64_t)v57, self, 0, v73);

      v27 = v74;
    }
  }

LABEL_9:
  objc_destroyWeak(&location);

}

- (void)_handleProtectionDataForRecordInfo:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
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
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_record(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v9 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v43 = v9;
    objc_msgSend_recordID(v8, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v8, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 134218498;
    v54 = v8;
    v55 = 2112;
    v56 = v46;
    v57 = 2112;
    v58 = v52;
    _os_log_debug_impl(&dword_1BE990000, v43, OS_LOG_TYPE_DEBUG, "Fetching PCS data. Record %p recordID %@ zoneID %@", (uint8_t *)&v53, 0x20u);

  }
  objc_msgSend_container(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContext(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v21 = (void *)v18;
    objc_msgSend_webSharingIdentityDataByRecordID(self, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v8, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v22, v26, (uint64_t)v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend_webSharingIdentityDataByRecordID(self, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v8, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v30, v34, (uint64_t)v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__decryptRecordInfo_usingWebSharingIdentityData_(self, v36, (uint64_t)v5, v35);

      goto LABEL_14;
    }
  }
  else
  {

  }
  if (objc_msgSend_databaseScope(self, v28, v29) == 2)
  {
    objc_msgSend__handleZoneProtectionDataForRecordInfo_(self, v37, (uint64_t)v5);
  }
  else if (objc_msgSend_databaseScope(self, v37, v38) == 3)
  {
    objc_msgSend__handleShareProtectionDataForRecordInfo_(self, v39, (uint64_t)v5);
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, self, CFSTR("CKDDecryptRecordsOperation.m"), 499, CFSTR("You can't decrypt a record in the public database"));

  }
LABEL_14:

}

- (id)_unwrapAssetKeyForAsset:(id)a3 inRecordWithID:(id)a4 forField:(id)a5 withPCS:(_OpaquePCSShareProtection *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  CKDWrappingContext *v15;
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
  void *v37;
  id v38;
  const char *v39;
  void *v40;
  NSObject *v41;
  const char *v42;
  id v43;
  id v45;
  id v46;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend_useEncryption(self, v13, v14))
  {
    if (a6)
    {
      v15 = [CKDWrappingContext alloc];
      objc_msgSend_mergeableDeltaID(v10, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signature(v10, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_referenceSignature(v10, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v12;
      v26 = (void *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v15, v25, (uint64_t)v11, v12, v18, v21, v24);

      objc_msgSend_container(self, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_wrappedAssetKey(v10, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      objc_msgSend_unwrapAssetKey_withRecordPCS_inContext_withError_(v32, v36, (uint64_t)v35, a6, v26, &v46);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v46;

      if (v37)
      {
        objc_msgSend_setAssetKey_(v10, v39, (uint64_t)v37);
        v40 = 0;
      }
      else
      {
        objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(self, v39, (uint64_t)v38, v11, 5004, CFSTR("Error unwrapping asset key with PCS %@ for record %@"), a6, v11);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v12 = v45;
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v41 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v11;
        _os_log_impl(&dword_1BE990000, v41, OS_LOG_TYPE_INFO, "Couldn't get a PCS object for record %@", buf, 0xCu);
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v42, *MEMORY[0x1E0C94B20], 5001, CFSTR("Couldn't get a PCS object for record %@"), v11);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v38 = 0;
    }
  }
  else
  {
    v37 = 0;
    v38 = 0;
    v40 = 0;
  }
  v43 = v40;

  return v43;
}

- (id)_unwrapPackageAssets:(id)a3 inRecordWithID:(id)a4 forField:(id)a5 withPCS:(_OpaquePCSShareProtection *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_assets(a3, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v25;
    while (2)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v14);
        objc_msgSend__unwrapAssetKeyForAsset_inRecordWithID_forField_withPCS_(self, v17, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20), v10, v11, a6);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          goto LABEL_11;
        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
      if (v18)
        continue;
      break;
    }
  }
  v22 = 0;
LABEL_11:

  return v22;
}

- (id)_unwrapMergeableRecordValue:(id)a3 inRecordWithID:(id)a4 forField:(id)a5 withPCS:(_OpaquePCSShareProtection *)a6
{
  id v8;
  const char *v9;
  uint64_t v10;
  int v11;
  void *v12;
  CKDKeyEnvelopeContext *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *i;
  void *v29;
  char v30;
  id v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11 = objc_msgSend_useEncryption(self, v9, v10);
  v12 = 0;
  if (a6 && v11)
  {
    v13 = objc_alloc_init(CKDKeyEnvelopeContext);
    objc_msgSend_setShareProtection_(v13, v14, (uint64_t)a6);
    objc_msgSend_container(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPcsManager_(v13, v21, (uint64_t)v20);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend_unmergedDeltas(v8, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v37, v43, 16);
    if (v12)
    {
      v27 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v36 = 0;
          v30 = objc_msgSend_decryptWithContext_error_(v29, v26, (uint64_t)v13, &v36);
          v31 = v36;
          v32 = v31;
          if ((v30 & 1) == 0)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v33 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v32;
              _os_log_error_impl(&dword_1BE990000, v33, OS_LOG_TYPE_ERROR, "Failed to decrypt mergeable delta with error: %@", buf, 0xCu);
            }
            objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v34, *MEMORY[0x1E0C94B20], 5004, v32, CFSTR("Failed to decrypt mergeable delta"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_17;
          }

        }
        v12 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v37, v43, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_17:

  }
  return v12;
}

- (id)_unwrapEncryptedPropertiesForRecordValueStore:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  CKDWrappingContext *v17;
  const char *v18;
  uint64_t v19;
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
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  CKDWrappingContext *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  CKDDecryptRecordsOperation *v101;
  id obj;
  uint64_t v103;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  objc_msgSend_allKeys(v5, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v121, v129, 16);
  if (!v9)
    goto LABEL_65;
  v11 = v9;
  v12 = 0x1E0C94000uLL;
  v103 = *(_QWORD *)v122;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v122 != v103)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v13);
      objc_msgSend_rawValueForKey_(v5, v10, v14, v91);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v12;
        v17 = [CKDWrappingContext alloc];
        objc_msgSend_recordID(v5, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v17, v21, (uint64_t)v20, v14, 0, 0, 0);

        objc_msgSend_container(self, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsManager(v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v28, v29, (uint64_t)v15, a4, v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v16;
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_recordID(v5, v31, v32);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__unwrapAssetKeyForAsset_inRecordWithID_forField_withPCS_(self, v33, (uint64_t)v15, v22, v14, a4);
        v34 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v30 = (void *)v34;
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_recordID(v5, v35, v36);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__unwrapPackageAssets_inRecordWithID_forField_withPCS_(self, v37, (uint64_t)v15, v22, v14, a4);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_recordID(v5, v38, v39);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__unwrapMergeableRecordValue_inRecordWithID_forField_withPCS_(self, v40, (uint64_t)v15, v22, v14, a4);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend_count(v15, v41, v42))
        goto LABEL_63;
      objc_msgSend_firstObject(v15, v43, v44);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v101 = self;
      v91 = v11;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v92 = v15;
        v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v45, (uint64_t)&v117, v128, 16);
        if (v97)
        {
          v93 = *(id *)v118;
LABEL_23:
          v46 = 0;
          while (1)
          {
            if (*(id *)v118 != v93)
              objc_enumerationMutation(v92);
            v47 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * v46);
            v48 = [CKDWrappingContext alloc];
            objc_msgSend_recordID(v5, v49, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (void *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v48, v52, (uint64_t)v51, v14, 0, 0, 0);

            objc_msgSend_container(v101, v54, v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_pcsManager(v56, v57, v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v59, v60, v47, a4, v53);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
              goto LABEL_61;
            if (v97 == ++v46)
            {
              v30 = 0;
              v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v61, (uint64_t)&v117, v128, 16);
              if (v97)
                goto LABEL_23;
              goto LABEL_61;
            }
          }
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v94 = v15;
          v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v62, (uint64_t)&v113, v127, 16);
          if (v63)
          {
            v66 = v63;
            v98 = *(_QWORD *)v114;
LABEL_33:
            v67 = 0;
            while (1)
            {
              if (*(_QWORD *)v114 != v98)
                objc_enumerationMutation(v94);
              v68 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * v67);
              objc_msgSend_recordID(v5, v64, v65, v91);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend__unwrapAssetKeyForAsset_inRecordWithID_forField_withPCS_(v101, v70, v68, v69, v14, a4);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
                goto LABEL_61;
              if (v66 == ++v67)
              {
                v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v64, (uint64_t)&v113, v127, 16);
                v30 = 0;
                if (v66)
                  goto LABEL_33;
                goto LABEL_61;
              }
            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v111 = 0u;
            v112 = 0u;
            v109 = 0u;
            v110 = 0u;
            v95 = v15;
            v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v71, (uint64_t)&v109, v126, 16);
            if (v72)
            {
              v75 = v72;
              v99 = *(_QWORD *)v110;
LABEL_43:
              v76 = 0;
              while (1)
              {
                if (*(_QWORD *)v110 != v99)
                  objc_enumerationMutation(v95);
                v77 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * v76);
                objc_msgSend_recordID(v5, v73, v74, v91);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend__unwrapPackageAssets_inRecordWithID_forField_withPCS_(v101, v79, v77, v78, v14, a4);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (v30)
                  goto LABEL_61;
                if (v75 == ++v76)
                {
                  v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v73, (uint64_t)&v109, v126, 16);
                  v30 = 0;
                  if (v75)
                    goto LABEL_43;
                  goto LABEL_61;
                }
              }
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

LABEL_63:
              goto LABEL_16;
            }
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v96 = v15;
            v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v80, (uint64_t)&v105, v125, 16);
            if (v81)
            {
              v84 = v81;
              v100 = *(_QWORD *)v106;
LABEL_53:
              v85 = 0;
              while (1)
              {
                if (*(_QWORD *)v106 != v100)
                  objc_enumerationMutation(v96);
                v86 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v85);
                objc_msgSend_recordID(v5, v82, v83, v91);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend__unwrapMergeableRecordValue_inRecordWithID_forField_withPCS_(v101, v88, v86, v87, v14, a4);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (v30)
                  goto LABEL_61;
                if (v84 == ++v85)
                {
                  v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v82, (uint64_t)&v105, v125, 16);
                  v30 = 0;
                  if (v84)
                    goto LABEL_53;
                  goto LABEL_61;
                }
              }
            }
          }
        }
      }
      v30 = 0;
LABEL_61:

      self = v101;
      v12 = 0x1E0C94000;
      v11 = v91;
LABEL_15:

      if (v30)
        goto LABEL_66;
LABEL_16:
      ++v13;
    }
    while (v13 != v11);
    v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v121, v129, 16);
    v11 = v89;
  }
  while (v89);
LABEL_65:
  v30 = 0;
LABEL_66:

  return v30;
}

- (id)_unwrapEncryptedPropertiesOnRecord:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  CKDWrappingContext *v36;
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
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  CKDWrappingContext *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  int isEqualToString;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t i;
  void *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  CKDWrappingContext *v94;
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
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  void *v115;
  NSObject *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  id v127;
  void *v128;
  id obj;
  uint64_t v130;
  CKDDecryptRecordsOperation *v131;
  uint64_t v132;
  uint64_t v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint8_t buf[4];
  void *v139;
  __int16 v140;
  void *v141;
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a4 && objc_msgSend_useEncryption(self, v6, v7))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v12 = v9;
      objc_msgSend_recordID(v8, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v139 = v15;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Couldn't get a PCS object for the record %@", buf, 0xCu);

    }
    v16 = (void *)MEMORY[0x1E0C94FF8];
    v17 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(v8, v10, v11);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v16, v19, v17, 5001, CFSTR("Couldn't get a PCS object for the record %@. "), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_11;
  }
  objc_msgSend_valueStore(v8, v6, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__unwrapEncryptedPropertiesForRecordValueStore_withPCS_(self, v22, (uint64_t)v21, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend_encryptedValueStore(v8, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__unwrapEncryptedPropertiesForRecordValueStore_withPCS_(self, v26, (uint64_t)v25, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend_chainPrivateKey(v8, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encryptedData(v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
        goto LABEL_14;
      v36 = [CKDWrappingContext alloc];
      objc_msgSend_recordID(v8, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend_initWithRecordID_fieldName_(v36, v40, (uint64_t)v39, *MEMORY[0x1E0C95330]);

      objc_msgSend_container(self, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_chainPrivateKey(v8, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v47, v51, (uint64_t)v50, a4, v41);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
LABEL_14:
        objc_msgSend_mutableEncryptedPSK(v8, v34, v35);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_encryptedData(v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          v58 = [CKDWrappingContext alloc];
          objc_msgSend_recordID(v8, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (id)objc_msgSend_initWithRecordID_fieldName_(v58, v62, (uint64_t)v61, *MEMORY[0x1E0C95380]);

          objc_msgSend_container(self, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsManager(v65, v66, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_mutableEncryptedPSK(v8, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v68, v72, (uint64_t)v71, a4, v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v73 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              v116 = v73;
              objc_msgSend_recordID(v8, v117, v118);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v139 = v119;
              _os_log_debug_impl(&dword_1BE990000, v116, OS_LOG_TYPE_DEBUG, "Record %@ is unable to decrypt its mutableEncryptedPSK.  Dropping the value", buf, 0xCu);

            }
            objc_msgSend_setMutableEncryptedPSK_(v8, v74, 0);
            goto LABEL_8;
          }

        }
        objc_msgSend_recordID(v8, v56, v57);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v75, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v78, v79, *MEMORY[0x1E0C949F0]);

        if (!isEqualToString)
        {
          v20 = 0;
          goto LABEL_11;
        }
        v131 = self;
        v127 = v8;
        v18 = v8;
        objc_msgSend_oneTimeURLMetadatasByParticipantID(v18, v81, v82);
        v134 = 0u;
        v135 = 0u;
        v136 = 0u;
        v137 = 0u;
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allValues(v128, v83, v84);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v85, (uint64_t)&v134, v142, 16);
        if (v133)
        {
          v132 = *(_QWORD *)v135;
          v130 = *MEMORY[0x1E0C95378];
          while (2)
          {
            for (i = 0; i != v133; ++i)
            {
              if (*(_QWORD *)v135 != v132)
                objc_enumerationMutation(obj);
              v89 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * i);
              objc_msgSend_encryptedOneTimeFullToken(v89, v86, v87);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_encryptedData(v90, v91, v92);
              v93 = (void *)objc_claimAutoreleasedReturnValue();

              if (v93)
              {
                v94 = [CKDWrappingContext alloc];
                v95 = v18;
                objc_msgSend_recordID(v18, v96, v97);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v100 = (void *)objc_msgSend_initWithRecordID_fieldName_(v94, v99, (uint64_t)v98, v130);

                objc_msgSend_container(v131, v101, v102);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_pcsManager(v103, v104, v105);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_encryptedOneTimeFullToken(v89, v107, v108);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v106, v110, (uint64_t)v109, a4, v100);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                {
                  if (*MEMORY[0x1E0C95300] != -1)
                    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                  v18 = v95;
                  v8 = v127;
                  v115 = (void *)*MEMORY[0x1E0C952B0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
                  {
                    v120 = v115;
                    objc_msgSend_recordID(v95, v121, v122);
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_participantID(v89, v124, v125);
                    v126 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v139 = v123;
                    v140 = 2112;
                    v141 = v126;
                    _os_log_debug_impl(&dword_1BE990000, v120, OS_LOG_TYPE_DEBUG, "Record %@ is unable to decrypt its encryptedOneTimeFullToken for participant %@. Bailing.", buf, 0x16u);

                    v18 = v95;
                  }

                  v111 = v128;
                  goto LABEL_42;
                }

                v18 = v95;
              }
            }
            v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v86, (uint64_t)&v134, v142, 16);
            if (v133)
              continue;
            break;
          }
        }

        v111 = v128;
        if (objc_msgSend_count(v128, v112, v113))
          objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v18, v114, (uint64_t)v128);
        v20 = 0;
        v8 = v127;
LABEL_42:

        goto LABEL_8;
      }
    }
  }
LABEL_11:

  return v20;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v5;
  _QWORD *v6;
  os_log_t *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_t v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  _QWORD block[5];
  id v36;
  SEL v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = (os_log_t *)MEMORY[0x1E0C952B0];
  v8 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v22 = v8;
    objc_msgSend_operationID(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v25;
    _os_log_debug_impl(&dword_1BE990000, v22, OS_LOG_TYPE_DEBUG, "Finished decrypt operation %{public}@", buf, 0xCu);

  }
  if (objc_msgSend_isFinished(self, v9, v10))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v34, (uint64_t)a2, self, CFSTR("CKDDecryptRecordsOperation.m"), 665, CFSTR("Operation %@ was already marked as finished"), v33);

  }
  objc_msgSend_recordDecryptQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v13);

  if (*v6 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
  {
    v26 = v14;
    objc_msgSend_operationID(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v29;
    _os_log_debug_impl(&dword_1BE990000, v26, OS_LOG_TYPE_DEBUG, "Decrypt operation %{public}@ is finishing. Waiting for all records to finish decrypting in case it never started", buf, 0xCu);

  }
  objc_msgSend_recordDecryptGroup(self, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC2D8F0;
  block[3] = &unk_1E7830158;
  v36 = v5;
  v37 = a2;
  block[4] = self;
  v21 = v5;
  dispatch_group_notify(v17, v20, block);

}

- (void)finishDecryption
{
  void *v3;
  CKDDecryptRecordsOperation *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v10 = v3;
    objc_msgSend_operationID(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v13;
    _os_log_debug_impl(&dword_1BE990000, v10, OS_LOG_TYPE_DEBUG, "Finishing decryption operation %{public}@", (uint8_t *)&v14, 0xCu);

  }
  v4 = self;
  objc_sync_enter(v4);
  if ((objc_msgSend_isStarted(v4, v5, v6) & 1) != 0)
  {
    objc_sync_exit(v4);

    objc_msgSend__finishDecryptOperation(v4, v8, v9);
  }
  else
  {
    objc_msgSend_setMarkedToFinish_(v4, v7, 1);
    objc_sync_exit(v4);

  }
}

- (void)_finishDecryptOperation
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  _QWORD *v7;
  os_log_t *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  _QWORD block[5];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isFinished(self, a2, v2))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, CFSTR("CKDDecryptRecordsOperation.m"), 696, CFSTR("You can't finish a decrypt operation twice"));

  }
  v7 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = (os_log_t *)MEMORY[0x1E0C952B0];
  v9 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v20 = v9;
    objc_msgSend_operationID(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v23;
    _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "Finishing decrypt records operation %{public}@", buf, 0xCu);

  }
  objc_msgSend_recordDecryptQueue(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v12);

  if (*v7 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
  {
    v24 = v13;
    objc_msgSend_operationID(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v27;
    _os_log_debug_impl(&dword_1BE990000, v24, OS_LOG_TYPE_DEBUG, "Decrypt operation %{public}@ is finishing. Waiting for all records to finish decrypting first...", buf, 0xCu);

  }
  objc_msgSend_recordDecryptGroup(self, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC2DD90;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_group_notify(v16, v19, block);

}

- (id)_possiblyWrapError:(id)a3 forRecordWithID:(id)a4 withCode:(int64_t)a5 format:(id)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  id v18;
  void *v19;
  id v20;
  const char *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if ((CKShouldWrapErrorFetchingRecords() & 1) == 0)
  {
    v18 = v9;
    goto LABEL_5;
  }
  if (CKCanRetryForError())
  {
    v14 = (void *)MEMORY[0x1E0C94FF8];
    v15 = *MEMORY[0x1E0C94B20];
    v16 = objc_msgSend_code(v9, v12, v13);
    objc_msgSend_errorWithDomain_code_error_format_(v14, v17, v15, v16, v9, CFSTR("Encountered a transient error fetching protection data for record %@. Please try again."), v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v19 = v18;
    goto LABEL_9;
  }
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v23 = (void *)objc_msgSend_initWithFormat_arguments_(v20, v21, (uint64_t)v11, &v26);
  if (v9)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v22, (uint64_t)CFSTR("%@: %@"), v23, v9);
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v24;
  }
  objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], a5, v9, CFSTR("%@"), v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v19;
}

- (void)main
{
  CKDDecryptRecordsOperation *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_isMarkedToFinish(v2, v3, v4) & 1) != 0)
  {
    objc_sync_exit(v2);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v6 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v13 = v6;
      objc_msgSend_operationID(v2, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v16;
      _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "Record decrypt operation %{public}@ was asked to finish before it started", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend__finishDecryptOperation(v2, v7, v8);
  }
  else
  {
    objc_msgSend_setStarted_(v2, v5, 1);
    objc_sync_exit(v2);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v17 = v9;
      objc_msgSend_operationID(v2, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Starting decrypt records operation %{public}@", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend_recordDecryptQueue(v2, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v12);

  }
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (BOOL)forcePCSDecrypt
{
  return self->_forcePCSDecrypt;
}

- (void)setForcePCSDecrypt:(BOOL)a3
{
  self->_forcePCSDecrypt = a3;
}

- (NSMutableArray)outstandingDecryptions
{
  return self->_outstandingDecryptions;
}

- (void)setOutstandingDecryptions:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingDecryptions, a3);
}

- (OS_dispatch_group)recordDecryptGroup
{
  return self->_recordDecryptGroup;
}

- (void)setRecordDecryptGroup:(id)a3
{
  objc_storeStrong((id *)&self->_recordDecryptGroup, a3);
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isMarkedToFinish
{
  return self->_markedToFinish;
}

- (void)setMarkedToFinish:(BOOL)a3
{
  self->_markedToFinish = a3;
}

- (OS_dispatch_queue)recordDecryptQueue
{
  return self->_recordDecryptQueue;
}

- (void)setRecordDecryptQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recordDecryptQueue, a3);
}

- (unint64_t)maxUnwrapAttempts
{
  return self->_maxUnwrapAttempts;
}

- (void)setMaxUnwrapAttempts:(unint64_t)a3
{
  self->_maxUnwrapAttempts = a3;
}

- (NSDictionary)webSharingIdentityDataByRecordID
{
  return self->_webSharingIdentityDataByRecordID;
}

- (void)setWebSharingIdentityDataByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, 0);
  objc_storeStrong((id *)&self->_recordDecryptQueue, 0);
  objc_storeStrong((id *)&self->_recordDecryptGroup, 0);
  objc_storeStrong((id *)&self->_outstandingDecryptions, 0);
}

@end
