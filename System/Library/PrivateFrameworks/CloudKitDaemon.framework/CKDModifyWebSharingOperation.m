@implementation CKDModifyWebSharingOperation

- (CKDModifyWebSharingOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDModifyWebSharingOperation *v9;
  uint64_t v10;
  NSArray *recordIDsToShare;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *recordIDsToUnshare;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *recordIDsToShareReadWrite;
  uint64_t v20;
  NSMutableDictionary *recordsToSaveByID;
  uint64_t v22;
  NSMutableSet *fetchedRecordIDs;
  objc_super v25;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKDModifyWebSharingOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v25, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordIDsToShare(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    recordIDsToShare = v9->_recordIDsToShare;
    v9->_recordIDsToShare = (NSArray *)v10;

    objc_msgSend_recordIDsToUnshare(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    recordIDsToUnshare = v9->_recordIDsToUnshare;
    v9->_recordIDsToUnshare = (NSArray *)v14;

    objc_msgSend_recordIDsToShareReadWrite(v6, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    recordIDsToShareReadWrite = v9->_recordIDsToShareReadWrite;
    v9->_recordIDsToShareReadWrite = (NSArray *)v18;

    v20 = objc_opt_new();
    recordsToSaveByID = v9->_recordsToSaveByID;
    v9->_recordsToSaveByID = (NSMutableDictionary *)v20;

    v22 = objc_opt_new();
    fetchedRecordIDs = v9->_fetchedRecordIDs;
    v9->_fetchedRecordIDs = (NSMutableSet *)v22;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/modify-web-sharing", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;

  v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 3)
  {
    objc_msgSend_recordsToSaveByID(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v7, v8, v9))
    {
      v12 = objc_msgSend_numSaveAttempts(self, v10, v11);
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend_PCSRetryCount(v15, v16, v17);

      if (v12 < v18)
        goto LABEL_7;
    }
    else
    {

    }
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    objc_msgSend_error(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v26, (uint64_t)v25);

    return 1;
  }
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 3);
    objc_msgSend__saveRecords(self, v21, v22);
    return 1;
  }
  if (v4 != 1)
    return 1;
LABEL_7:
  objc_msgSend_setState_(self, v5, 2);
  objc_msgSend__fetchRecords(self, v19, v20);
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
    return CFSTR("Fetching Records");
  if (a3 == 3)
  {
    v5 = CFSTR("Saving Records");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDModifyWebSharingOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_handleRecordSaved:(id)a3 error:(id)a4
{
  id v6;
  __CFString *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int v12;
  _QWORD *v13;
  os_log_t *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, const char *, uint64_t);
  void *v57;
  CKDModifyWebSharingOperation *v58;
  id v59;
  __CFString *v60;
  _QWORD block[5];
  id v62;
  id v63;
  id v64;
  __CFString *v65;
  uint8_t buf[4];
  const __CFString *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  const __CFString *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  objc_msgSend_recordIDsToShare(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v6);

  v13 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = (os_log_t *)MEMORY[0x1E0C952B0];
  v15 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v50 = CFSTR("un");
    v51 = &stru_1E7838F48;
    if (v12)
      v50 = &stru_1E7838F48;
    *(_DWORD *)buf = 138544130;
    v52 = CFSTR(" with error ");
    v67 = v50;
    v68 = 2112;
    v69 = v6;
    if (!v7)
      v52 = &stru_1E7838F48;
    v70 = 2114;
    v71 = v52;
    if (v7)
      v51 = v7;
    v72 = 2112;
    v73 = v51;
    _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "Record for %{public}@share (%@) was saved%{public}@%@", buf, 0x2Au);
  }
  if (objc_msgSend_code(v7, v16, v17) == 2037
    && (v20 = objc_msgSend_numSaveAttempts(self, v18, v19),
        objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v21, v22),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v26 = objc_msgSend_PCSRetryCount(v23, v24, v25),
        v23,
        v20 <= v26))
  {
    if (*v13 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v49 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
    {
      v53 = CFSTR("un");
      if (v12)
        v53 = &stru_1E7838F48;
      *(_DWORD *)buf = 138543618;
      v67 = v53;
      v68 = 2112;
      v69 = v6;
      _os_log_debug_impl(&dword_1BE990000, v49, OS_LOG_TYPE_DEBUG, "Oplock failure while trying to %{public}@share record %@. Retrying.", buf, 0x16u);
    }
  }
  else
  {
    if (v12)
    {
      objc_msgSend_recordsToSaveByID(self, v18, v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_encryptedValues(v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v32, v33, *MEMORY[0x1E0C94B60]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKeyedSubscript_(v29, v35, *MEMORY[0x1E0C94B48]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordWebSharedBlock(self, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend_callbackQueue(self, v40, v41);
        v42 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1BEA837E8;
        block[3] = &unk_1E782E490;
        block[4] = self;
        v62 = v6;
        v63 = v34;
        v64 = v36;
        v65 = v7;
        dispatch_async(v42, block);

      }
    }
    else
    {
      objc_msgSend_recordWebUnsharedBlock(self, v18, v19);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend_callbackQueue(self, v43, v44);
        v46 = objc_claimAutoreleasedReturnValue();
        v54 = MEMORY[0x1E0C809B0];
        v55 = 3221225472;
        v56 = sub_1BEA83858;
        v57 = &unk_1E782E418;
        v58 = self;
        v59 = v6;
        v60 = v7;
        dispatch_async(v46, &v54);

      }
    }
    objc_msgSend_recordsToSaveByID(self, v43, v44, v54, v55, v56, v57, v58);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v47, v48, (uint64_t)v6);

  }
}

- (void)_saveRecords
{
  uint64_t v2;
  int v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_numSaveAttempts(self, a2, v2);
  objc_msgSend_setNumSaveAttempts_(self, v5, (v4 + 1));
  objc_msgSend_recordsToSaveByID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v8, v9, v10);

  v12 = (void *)*MEMORY[0x1E0C952F8];
  if (v11)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v12);
    v13 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v26 = v13;
      objc_msgSend_recordsToSaveByID(self, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_count(v29, v30, v31);
      objc_msgSend_recordsToSaveByID(self, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allKeys(v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v41 = v32;
      v42 = 2112;
      v43 = v38;
      _os_log_debug_impl(&dword_1BE990000, v26, OS_LOG_TYPE_DEBUG, "Saving %ld records: %@", buf, 0x16u);

    }
    v14 = (void *)objc_opt_new();
    objc_msgSend_recordsToSaveByID(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allValues(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordsToSave_(v14, v21, (uint64_t)v20);

    objc_msgSend_setSavePolicy_(v14, v22, 1);
    v23 = objc_opt_class();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = sub_1BEA83B30;
    v39[3] = &unk_1E782E508;
    v39[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v24, v23, v14, v39);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v12);
    v25 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v25, OS_LOG_TYPE_DEBUG, "We don't have any records to save, so bailing now.", buf, 2u);
    }
  }
}

- (_PCSIdentityData)_copyShareProtectionFromRecord:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  _PCSIdentityData *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9 = v6;
  if (!a4)
  {
    if (!v6)
    {
      v10 = 0;
      goto LABEL_25;
    }
LABEL_5:
    objc_msgSend_encryptedValues(v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v11, v12, *MEMORY[0x1E0C94B60]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend_container(self, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      v10 = (_PCSIdentityData *)objc_msgSend_createSharingIdentityFromData_error_(v19, v20, (uint64_t)v13, &v44);
      v21 = v44;

      if (v21 || !v10)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v32 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v35 = v32;
          objc_msgSend_recordID(v9, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v46 = v38;
          v47 = 2112;
          v48 = v21;
          v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1BE990000, v35, OS_LOG_TYPE_INFO, "Warn: Couldn't deserialize share protection data on record %@: %@.\nData was %@", buf, 0x20u);

        }
        if (a4)
        {
          v39 = (void *)MEMORY[0x1E0C94FF8];
          v40 = *MEMORY[0x1E0C94B20];
          objc_msgSend_recordID(v9, v33, v34);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_error_format_(v39, v42, v40, 5001, v21, CFSTR("Couldn't deserialize share protection data on record %@"), v41);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (v10)
        {
          CFRelease(v10);
          v10 = 0;
        }
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v22 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v25 = v22;
        objc_msgSend_recordID(v9, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v28;
        _os_log_impl(&dword_1BE990000, v25, OS_LOG_TYPE_INFO, "Warn: Record %@ didn't have any share protection data on it", buf, 0xCu);

      }
      if (!a4)
      {
        v10 = 0;
        goto LABEL_24;
      }
      v29 = (void *)MEMORY[0x1E0C94FF8];
      v30 = *MEMORY[0x1E0C94B20];
      objc_msgSend_recordID(v9, v23, v24);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v29, v31, v30, 5001, CFSTR("Record %@ didn't contain any share protection data"), v21);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_24:
    goto LABEL_25;
  }
  *a4 = 0;
  if (v6)
    goto LABEL_5;
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v7, *MEMORY[0x1E0C94B20], 2003, CFSTR("Couldn't fetch record from the server"));
  v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v10;
}

- (void)_handleRecordFetched:(id)a3 recordID:(id)a4 error:(id)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  uint64_t *p_aBlock;
  void *v20;
  const char *v21;
  int v22;
  void (**v23)(void *, id, id);
  void *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  const void *v28;
  const char *v29;
  uint64_t v30;
  __CFString *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  const __CFString *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  NSObject *v74;
  const __CFString *v75;
  const __CFString *v76;
  void *v77;
  _BOOL4 v78;
  const char *v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  int v86;
  const char *v87;
  void *v88;
  const char *v89;
  NSObject **v90;
  void *v91;
  NSObject *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  __CFString *v100;
  NSObject *v101;
  const char *v102;
  uint64_t v103;
  __CFString *v104;
  const __CFString *v105;
  void *v106;
  id v107;
  _QWORD v108[5];
  id v109;
  uint64_t aBlock;
  uint64_t v111;
  uint8_t buf[4];
  const __CFString *v113;
  __int16 v114;
  const __CFString *v115;
  __int16 v116;
  __CFString *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a5;
  objc_msgSend_recordIDsToShare(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_containsObject_(v13, v14, (uint64_t)v9);

  if ((_DWORD)v15)
  {
    v111 = MEMORY[0x1E0C809B0];
    v18 = sub_1BEA84F44;
    p_aBlock = &v111;
LABEL_5:
    p_aBlock[1] = 3221225472;
    p_aBlock[2] = (uint64_t)v18;
    p_aBlock[3] = (uint64_t)&unk_1E7831E38;
    p_aBlock[4] = (uint64_t)self;
    v23 = (void (**)(void *, id, id))_Block_copy(p_aBlock);
    v24 = (void *)*MEMORY[0x1E0C952F8];
    v25 = *MEMORY[0x1E0C95300];
    if (v8 && !v10)
    {
      if (v25 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v24);
      v26 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v76 = CFSTR("un");
        if ((_DWORD)v15)
          v76 = &stru_1E7838F48;
        *(_DWORD *)buf = 138412546;
        v113 = v9;
        v114 = 2114;
        v115 = v76;
        _os_log_debug_impl(&dword_1BE990000, v26, OS_LOG_TYPE_DEBUG, "Fetched record with ID %@ from the server. Unwrapping sharing identity and %{public}@sharing the record", buf, 0x16u);
      }
      v109 = 0;
      v28 = (const void *)objc_msgSend__copyShareProtectionFromRecord_error_(self, v27, (uint64_t)v8, &v109);
      v31 = (__CFString *)v109;
      if (!v31 && v28)
      {
        v34 = objc_msgSend_recordPCS(v8, v29, v30);
        if (v34)
        {
          objc_msgSend_container(self, v32, v33);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsManager(v106, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v37;
          if ((_DWORD)v15)
            objc_msgSend_addSharingIdentity_toSharePCS_permission_(v37, v38, (uint64_t)v28, v34, 0);
          else
            objc_msgSend_removeSharingIdentity_fromSharePCS_(v37, v38, (uint64_t)v28, v34);
          v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

          CFRelease(v28);
          if (v31)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v49 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
            {
              v50 = CFSTR("un");
              *(_DWORD *)buf = 138543874;
              if ((_DWORD)v15)
                v50 = &stru_1E7838F48;
              v113 = v50;
              v114 = 2112;
              v115 = v9;
              v116 = 2112;
              v117 = v31;
              _os_log_impl(&dword_1BE990000, v49, OS_LOG_TYPE_INFO, "Warn: Error %{public}@sharing record %@: %@", buf, 0x20u);
            }
            v23[2](v23, v9, v31);
          }
          else
          {
            objc_msgSend_pcsManager(v106, v47, v48);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_pcsKeysToRemove(v8, v52, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_protectionEtag(v8, v55, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v51, v58, (uint64_t)v54, v34, v57, self);

            if (v59)
            {
              v108[0] = MEMORY[0x1E0C809B0];
              v108[1] = 3221225472;
              v108[2] = sub_1BEA851CC;
              v108[3] = &unk_1E7831868;
              v108[4] = v59;
              objc_msgSend_updateCloudKitMetrics_(self, v60, (uint64_t)v108);
            }
            objc_msgSend_protectionData(v8, v60, v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_etagFromPCSData_(CKDPCSManager, v63, (uint64_t)v62);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPreviousProtectionEtag_(v8, v65, (uint64_t)v64);

            objc_msgSend_pcsManager(v106, v66, v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = 0;
            objc_msgSend_dataFromRecordPCS_error_(v68, v69, v34, &v107);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (__CFString *)v107;
            objc_msgSend_setProtectionData_(v8, v71, (uint64_t)v70);

            if (v31
              || (objc_msgSend_protectionData(v8, v72, v73),
                  v77 = (void *)objc_claimAutoreleasedReturnValue(),
                  v78 = v77 == 0,
                  v77,
                  v78))
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v74 = *MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
              {
                v75 = CFSTR("un");
                *(_DWORD *)buf = 138543874;
                if ((_DWORD)v15)
                  v75 = &stru_1E7838F48;
                v113 = v75;
                v114 = 2112;
                v115 = v9;
                v116 = 2112;
                v117 = v31;
                _os_log_impl(&dword_1BE990000, v74, OS_LOG_TYPE_INFO, "Warn: Error serializing record PCS data for %{public}@share of record %@: %@", buf, 0x20u);
              }
              v23[2](v23, v9, v31);
            }
            else
            {
              objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v79, v15);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v8, v81, (uint64_t)v80, *MEMORY[0x1E0C94B58]);

              objc_msgSend_recordIDsToShareReadWrite(self, v82, v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = objc_msgSend_containsObject_(v84, v85, (uint64_t)v9);

              objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v87, v86 ^ 1u);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v8, v89, (uint64_t)v88, *MEMORY[0x1E0C94B50]);

              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v90 = (NSObject **)MEMORY[0x1E0C952B0];
              v91 = (void *)*MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
              {
                v100 = (_DWORD)v15 ? &stru_1E7838F48 : CFSTR("un");
                v101 = v91;
                objc_msgSend_protectionData(v8, v102, v103);
                v104 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v113 = v9;
                v114 = 2114;
                v115 = v100;
                v116 = 2112;
                v117 = v104;
                _os_log_debug_impl(&dword_1BE990000, v101, OS_LOG_TYPE_DEBUG, "New protection data for record %@ after %{public}@sharing is %@", buf, 0x20u);

                v90 = (NSObject **)MEMORY[0x1E0C952B0];
                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              }
              v92 = *v90;
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
              {
                v105 = CFSTR("removed");
                if ((_DWORD)v15)
                  v105 = CFSTR("added");
                *(_DWORD *)buf = 138543618;
                v113 = v105;
                v114 = 2112;
                v115 = v9;
                _os_log_debug_impl(&dword_1BE990000, v92, OS_LOG_TYPE_DEBUG, "Successfully %{public}@ sharing info to record %@. Preparing to save the record back to the server", buf, 0x16u);
              }
              objc_msgSend_recordsToSaveByID(self, v93, v94);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_sync_enter(v95);
              objc_msgSend_recordsToSaveByID(self, v96, v97);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v98, v99, (uint64_t)v8, v9);

              objc_sync_exit(v95);
              v31 = 0;
            }
          }

        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v45 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v113 = v9;
            _os_log_debug_impl(&dword_1BE990000, v45, OS_LOG_TYPE_DEBUG, "Fetched record %@ had no PCS data", buf, 0xCu);
          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v46, *MEMORY[0x1E0C94B20], 5001, CFSTR("Fetched record %@ had no PCS data"), v9);
          v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v23[2](v23, v9, v31);
          CFRelease(v28);
        }
LABEL_68:

        v10 = (__CFString *)v23;
        goto LABEL_69;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v43 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v113 = v9;
        v114 = 2112;
        v115 = v31;
        _os_log_debug_impl(&dword_1BE990000, v43, OS_LOG_TYPE_DEBUG, "Error getting share identity from record %@: %@", buf, 0x16u);
        if (v31)
        {
LABEL_30:
          v23[2](v23, v9, v31);
          if (v28)
            CFRelease(v28);
          goto LABEL_68;
        }
      }
      else if (v31)
      {
        goto LABEL_30;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v44, *MEMORY[0x1E0C94B20], 2003, CFSTR("Couldn't get a web sharing identity from record %@"), v9);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if (v25 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v24);
    v40 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v113 = v9;
      v114 = 2112;
      v115 = v10;
      _os_log_debug_impl(&dword_1BE990000, v40, OS_LOG_TYPE_DEBUG, "Couldn't fetch record %@ from the server: %@", buf, 0x16u);
      if (v10)
        goto LABEL_20;
    }
    else if (v10)
    {
LABEL_20:
      v23[2](v23, v9, v10);

      goto LABEL_69;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v41, *MEMORY[0x1E0C94B20], 2003, CFSTR("Couldn't find record %@ on the server"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend_recordIDsToUnshare(self, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_containsObject_(v20, v21, (uint64_t)v9);

  if (v22)
  {
    aBlock = MEMORY[0x1E0C809B0];
    v18 = sub_1BEA8508C;
    p_aBlock = &aBlock;
    goto LABEL_5;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v42 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v113 = v9;
    _os_log_error_impl(&dword_1BE990000, v42, OS_LOG_TYPE_ERROR, "Received a record ID that we don't know anything about: %@", buf, 0xCu);
  }
LABEL_69:

}

- (void)_fetchRecords
{
  void *v3;
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
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend_recordIDsToShare(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v4, v8, (uint64_t)v7);

  objc_msgSend_recordIDsToUnshare(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v4, v12, (uint64_t)v11);

  objc_msgSend_setRecordIDs_(v3, v13, (uint64_t)v4);
  v14 = *MEMORY[0x1E0C94B48];
  v23[0] = *MEMORY[0x1E0C94B60];
  v23[1] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v23, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(v3, v17, (uint64_t)v16);

  v18 = objc_opt_class();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1BEA85388;
  v21[3] = &unk_1E782E558;
  v21[4] = self;
  v22 = v4;
  v19 = v4;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v20, v18, v3, v21);

}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)main
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  CKDModifyWebSharingOperation *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v16 = v3;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v19, 1, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v24, 0, 1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544130;
    v30 = v18;
    v31 = 2048;
    v32 = self;
    v33 = 2114;
    v34 = v23;
    v35 = 2112;
    v36 = v28;
    _os_log_debug_impl(&dword_1BE990000, v16, OS_LOG_TYPE_DEBUG, "Starting web share operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v29,
      0x2Au);

  }
  objc_msgSend_recordIDsToShare(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v7, v8))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend_recordIDsToUnshare(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_count(v12, v13, v14) == 0;

  }
  objc_msgSend_makeStateTransition_(self, v15, v11);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  const char *v46;
  objc_super v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend_recordIDsToShare(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v58, v64, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v59;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v59 != v14)
          objc_enumerationMutation(v8);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v58 + 1) + 8 * v15), v11, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v5, v17, (uint64_t)v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v58, v64, 16);
    }
    while (v13);
  }

  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  v54 = 0u;
  objc_msgSend_recordIDsToUnshare(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v54, v63, 16);
  if (v22)
  {
    v25 = v22;
    v26 = *(_QWORD *)v55;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v55 != v26)
          objc_enumerationMutation(v20);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v54 + 1) + 8 * v27), v23, v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v5, v29, (uint64_t)v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v54, v63, 16);
    }
    while (v25);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend_recordIDsToShareReadWrite(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v50, v62, 16);
  if (v34)
  {
    v37 = v34;
    v38 = *(_QWORD *)v51;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v51 != v38)
          objc_enumerationMutation(v32);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v50 + 1) + 8 * v39), v35, v36);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v5, v41, (uint64_t)v40);

        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v50, v62, 16);
    }
    while (v37);
  }

  if (objc_msgSend_count(v5, v42, v43))
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = sub_1BEA85D5C;
    v48[3] = &unk_1E78305B0;
    v49 = v5;
    objc_msgSend_updateCloudKitMetrics_(self, v45, (uint64_t)v48);

  }
  objc_msgSend_setRecordWebSharedBlock_(self, v44, 0);
  objc_msgSend_setRecordWebUnsharedBlock_(self, v46, 0);
  v47.receiver = self;
  v47.super_class = (Class)CKDModifyWebSharingOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v47, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)recordWebSharedBlock
{
  return self->_recordWebSharedBlock;
}

- (void)setRecordWebSharedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (id)recordWebUnsharedBlock
{
  return self->_recordWebUnsharedBlock;
}

- (void)setRecordWebUnsharedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSArray)recordIDsToShare
{
  return self->_recordIDsToShare;
}

- (void)setRecordIDsToShare:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToShare, a3);
}

- (NSArray)recordIDsToUnshare
{
  return self->_recordIDsToUnshare;
}

- (void)setRecordIDsToUnshare:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToUnshare, a3);
}

- (NSArray)recordIDsToShareReadWrite
{
  return self->_recordIDsToShareReadWrite;
}

- (void)setRecordIDsToShareReadWrite:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToShareReadWrite, a3);
}

- (NSMutableSet)fetchedRecordIDs
{
  return self->_fetchedRecordIDs;
}

- (void)setFetchedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedRecordIDs, a3);
}

- (NSMutableDictionary)recordsToSaveByID
{
  return self->_recordsToSaveByID;
}

- (void)setRecordsToSaveByID:(id)a3
{
  objc_storeStrong((id *)&self->_recordsToSaveByID, a3);
}

- (int)numSaveAttempts
{
  return self->_numSaveAttempts;
}

- (void)setNumSaveAttempts:(int)a3
{
  self->_numSaveAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsToSaveByID, 0);
  objc_storeStrong((id *)&self->_fetchedRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordIDsToShareReadWrite, 0);
  objc_storeStrong((id *)&self->_recordIDsToUnshare, 0);
  objc_storeStrong((id *)&self->_recordIDsToShare, 0);
  objc_storeStrong(&self->_recordWebUnsharedBlock, 0);
  objc_storeStrong(&self->_recordWebSharedBlock, 0);
}

@end
