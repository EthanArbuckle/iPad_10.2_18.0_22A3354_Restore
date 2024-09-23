@implementation CKDModifyRecordAccessOperation

- (CKDModifyRecordAccessOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDModifyRecordAccessOperation *v9;
  uint64_t v10;
  NSArray *recordIDsToGrant;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *recordIDsToRevoke;
  uint64_t v16;
  NSMutableDictionary *recordsToSaveByID;
  uint64_t v18;
  NSMutableSet *fetchedRecordIDs;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDModifyRecordAccessOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v21, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordIDsToGrant(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    recordIDsToGrant = v9->_recordIDsToGrant;
    v9->_recordIDsToGrant = (NSArray *)v10;

    objc_msgSend_recordIDsToRevoke(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    recordIDsToRevoke = v9->_recordIDsToRevoke;
    v9->_recordIDsToRevoke = (NSArray *)v14;

    v16 = objc_opt_new();
    recordsToSaveByID = v9->_recordsToSaveByID;
    v9->_recordsToSaveByID = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    fetchedRecordIDs = v9->_fetchedRecordIDs;
    v9->_fetchedRecordIDs = (NSMutableSet *)v18;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/modify-record-access", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    v7.super_class = (Class)&OBJC_METACLASS___CKDModifyRecordAccessOperation;
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
  CKDModifyRecordAccessOperation *v58;
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
  objc_msgSend_recordIDsToGrant(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v6);

  v13 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = (os_log_t *)MEMORY[0x1E0C952B0];
  v15 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v50 = CFSTR("revocation");
    if (v12)
      v50 = CFSTR("grant");
    v51 = CFSTR(" with error ");
    *(_DWORD *)buf = 138544130;
    v67 = v50;
    v68 = 2112;
    v69 = v6;
    if (!v7)
      v51 = &stru_1E7838F48;
    v70 = 2114;
    v71 = v51;
    if (v7)
      v52 = v7;
    else
      v52 = &stru_1E7838F48;
    v72 = 2112;
    v73 = v52;
    _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "Record for access %{public}@ (%@) was saved%{public}@%@", buf, 0x2Au);
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
      v53 = CFSTR("revoke");
      if (v12)
        v53 = CFSTR("grant");
      *(_DWORD *)buf = 138543618;
      v67 = v53;
      v68 = 2112;
      v69 = v6;
      _os_log_debug_impl(&dword_1BE990000, v49, OS_LOG_TYPE_DEBUG, "Oplock failure while trying to %{public}@ access on record %@. Retrying.", buf, 0x16u);
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
      objc_msgSend_objectForKeyedSubscript_(v32, v33, *MEMORY[0x1E0C949A0]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKeyedSubscript_(v29, v35, *MEMORY[0x1E0C94B48]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accessWasGrantedBlock(self, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend_callbackQueue(self, v40, v41);
        v42 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1BEA86D68;
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
      objc_msgSend_accessWasRevokedBlock(self, v18, v19);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend_callbackQueue(self, v43, v44);
        v46 = objc_claimAutoreleasedReturnValue();
        v54 = MEMORY[0x1E0C809B0];
        v55 = 3221225472;
        v56 = sub_1BEA86DD8;
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
    v39[2] = sub_1BEA870B0;
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
  void *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
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
      goto LABEL_24;
    }
LABEL_5:
    objc_msgSend_encryptedValues(v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v11, v12, *MEMORY[0x1E0C949A0]);
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
        v28 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v31 = v28;
          objc_msgSend_recordID(v9, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v46 = v34;
          v47 = 2112;
          v48 = v21;
          v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1BE990000, v31, OS_LOG_TYPE_INFO, "Warn: Couldn't deserialize access token protection data on record %@: %@.\nData was %@", buf, 0x20u);

        }
        if (a4)
        {
          v35 = (void *)MEMORY[0x1E0C94FF8];
          v36 = *MEMORY[0x1E0C94B20];
          objc_msgSend_recordID(v9, v29, v30);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_error_format_(v35, v38, v36, 5001, v21, CFSTR("Couldn't deserialize access token protection data on record %@"), v37);
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
      goto LABEL_22;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v40 = v22;
      objc_msgSend_recordID(v9, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v43;
      _os_log_debug_impl(&dword_1BE990000, v40, OS_LOG_TYPE_DEBUG, "Record %@ didn't have any access token protection data on it", buf, 0xCu);

      if (a4)
        goto LABEL_13;
    }
    else if (a4)
    {
LABEL_13:
      v25 = (void *)MEMORY[0x1E0C94FF8];
      v26 = *MEMORY[0x1E0C94B20];
      objc_msgSend_recordID(v9, v23, v24);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v25, v27, v26, 5001, CFSTR("Record %@ didn't contain any access token protection data"), v21);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    v10 = 0;
    goto LABEL_23;
  }
  *a4 = 0;
  if (v6)
    goto LABEL_5;
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v7, *MEMORY[0x1E0C94B20], 2003, CFSTR("Couldn't fetch record from the server"));
  v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v10;
}

- (void)_handleRecordFetched:(id)a3 recordID:(id)a4 error:(id)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  uint64_t *p_aBlock;
  void *v24;
  const char *v25;
  int v26;
  void (**v27)(void *, id, id);
  void *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  const void *RandomSharingIdentityWithError;
  __CFString *v34;
  const char *v35;
  uint64_t v36;
  __CFString *v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  NSObject *v68;
  const __CFString *v69;
  NSObject *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  NSObject *v95;
  const __CFString *v96;
  const __CFString *v97;
  void *v98;
  _BOOL4 v99;
  const char *v100;
  void *v101;
  const char *v102;
  void *v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  __CFString *v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  __CFString *v116;
  const __CFString *v117;
  void *v118;
  id v119;
  _QWORD v120[5];
  id v121;
  id v122;
  id v123;
  uint64_t aBlock;
  uint64_t v125;
  uint8_t buf[4];
  const __CFString *v127;
  __int16 v128;
  const __CFString *v129;
  __int16 v130;
  __CFString *v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a5;
  objc_msgSend_container(self, v11, v12);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_objectForKeyedSubscript_(v8, v13, *MEMORY[0x1E0C94B48]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBaseToken_(v8, v16, (uint64_t)v15);

  }
  objc_msgSend_recordIDsToGrant(self, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_containsObject_(v17, v18, (uint64_t)v9);

  if ((_DWORD)v19)
  {
    v125 = MEMORY[0x1E0C809B0];
    v22 = sub_1BEA88660;
    p_aBlock = &v125;
    goto LABEL_7;
  }
  objc_msgSend_recordIDsToRevoke(self, v20, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_containsObject_(v24, v25, (uint64_t)v9);

  if (v26)
  {
    aBlock = MEMORY[0x1E0C809B0];
    v22 = sub_1BEA887A8;
    p_aBlock = &aBlock;
LABEL_7:
    p_aBlock[1] = 3221225472;
    p_aBlock[2] = (uint64_t)v22;
    p_aBlock[3] = (uint64_t)&unk_1E7831E38;
    p_aBlock[4] = (uint64_t)self;
    v27 = (void (**)(void *, id, id))_Block_copy(p_aBlock);
    v28 = (void *)*MEMORY[0x1E0C952F8];
    if (((v10 == 0) & ~(v8 == 0)) == 0)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v28);
      v29 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v127 = v9;
        v128 = 2112;
        v129 = v10;
        _os_log_debug_impl(&dword_1BE990000, v29, OS_LOG_TYPE_DEBUG, "Couldn't fetch record %@ from the server: %@", buf, 0x16u);
        if (v10)
          goto LABEL_13;
      }
      else if (v10)
      {
LABEL_13:
        v27[2](v27, v9, v10);

        goto LABEL_85;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v30, *MEMORY[0x1E0C94B20], 2003, CFSTR("Couldn't find record %@ on the server"), v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v28);
    v31 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v97 = CFSTR("revoking");
      if ((_DWORD)v19)
        v97 = CFSTR("granting");
      *(_DWORD *)buf = 138412546;
      v127 = v9;
      v128 = 2114;
      v129 = v97;
      _os_log_debug_impl(&dword_1BE990000, v31, OS_LOG_TYPE_DEBUG, "Fetched record with ID %@ from the server. Unwrapping access token and %{public}@ access to the record", buf, 0x16u);
    }
    v123 = 0;
    RandomSharingIdentityWithError = (const void *)objc_msgSend__copyShareProtectionFromRecord_error_(self, v32, (uint64_t)v8, &v123);
    v34 = (__CFString *)v123;
    v37 = v34;
    if (v34 || !RandomSharingIdentityWithError)
    {
      if (!(_DWORD)v19)
      {
        if (!v34)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v35, *MEMORY[0x1E0C94B20], 2003, CFSTR("Record %@ didn't have an access token so it can't be revoked"), v9);
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v27[2](v27, v9, v37);
        if (RandomSharingIdentityWithError)
          CFRelease(RandomSharingIdentityWithError);
        goto LABEL_84;
      }
      if (RandomSharingIdentityWithError)
        CFRelease(RandomSharingIdentityWithError);
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v49 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v127 = v9;
        v128 = 2112;
        v129 = v37;
        _os_log_debug_impl(&dword_1BE990000, v49, OS_LOG_TYPE_DEBUG, "Record %@ had no access token on it. Creating a new one. (%@)", buf, 0x16u);
      }

      objc_msgSend_pcsManager(v118, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = 0;
      RandomSharingIdentityWithError = (const void *)objc_msgSend_createRandomSharingIdentityWithError_(v52, v53, (uint64_t)&v122);
      v37 = (__CFString *)v122;

      if (v37 || !RandomSharingIdentityWithError)
      {
        if (!v37)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v35, *MEMORY[0x1E0C94B20], 2003, CFSTR("Couldn't create an access token identity for record %@"), v9);
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v27[2](v27, v9, v37);
        if (RandomSharingIdentityWithError)
          CFRelease(RandomSharingIdentityWithError);
        goto LABEL_84;
      }
    }
    else if (!(_DWORD)v19)
    {
      objc_msgSend_encryptedValues(v8, v35, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v38, v39, 0, *MEMORY[0x1E0C949A0]);

      v44 = objc_msgSend_recordPCS(v8, v40, v41);
      if (v44)
      {
        objc_msgSend_pcsManager(v118, v42, v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeSharingIdentity_fromSharePCS_(v45, v46, (uint64_t)RandomSharingIdentityWithError, v44);
        v47 = objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
      goto LABEL_54;
    }
    objc_msgSend_pcsManager(v118, v35, v36);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = 0;
    objc_msgSend_dataFromSharingIdentity_error_(v54, v55, (uint64_t)RandomSharingIdentityWithError, &v121);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (__CFString *)v121;

    if (v37 || !v56)
    {
      if (!v37)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v57, *MEMORY[0x1E0C94B20], 2003, CFSTR("Couldn't create access token data for record %@"), v9);
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v27[2](v27, v9, v37);
      CFRelease(RandomSharingIdentityWithError);

      goto LABEL_84;
    }
    objc_msgSend_encryptedValues(v8, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v59, v60, (uint64_t)v56, *MEMORY[0x1E0C949A0]);

    v44 = objc_msgSend_recordPCS(v8, v61, v62);
    if (v44)
    {
      objc_msgSend_pcsManager(v118, v63, v64);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addSharingIdentity_toSharePCS_permission_(v45, v65, (uint64_t)RandomSharingIdentityWithError, v44, 0);
      v47 = objc_claimAutoreleasedReturnValue();
LABEL_39:
      v37 = (__CFString *)v47;

      CFRelease(RandomSharingIdentityWithError);
      if (v37)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v68 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v69 = CFSTR("revoking");
          *(_DWORD *)buf = 138543874;
          if ((_DWORD)v19)
            v69 = CFSTR("granting");
          v127 = v69;
          v128 = 2112;
          v129 = v9;
          v130 = 2112;
          v131 = v37;
          _os_log_impl(&dword_1BE990000, v68, OS_LOG_TYPE_INFO, "Warn: Error %{public}@ access to record %@: %@", buf, 0x20u);
        }
        v27[2](v27, v9, v37);
      }
      else
      {
        objc_msgSend_pcsManager(v118, v66, v67);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsKeysToRemove(v8, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_protectionEtag(v8, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v72, v79, (uint64_t)v75, v44, v78, self);

        if (v80)
        {
          v120[0] = MEMORY[0x1E0C809B0];
          v120[1] = 3221225472;
          v120[2] = sub_1BEA888E8;
          v120[3] = &unk_1E7831868;
          v120[4] = v80;
          objc_msgSend_updateCloudKitMetrics_(self, v81, (uint64_t)v120);
        }
        objc_msgSend_protectionData(v8, v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_etagFromPCSData_(CKDPCSManager, v84, (uint64_t)v83);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPreviousProtectionEtag_(v8, v86, (uint64_t)v85);

        objc_msgSend_pcsManager(v118, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = 0;
        objc_msgSend_dataFromRecordPCS_error_(v89, v90, v44, &v119);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (__CFString *)v119;
        objc_msgSend_setProtectionData_(v8, v92, (uint64_t)v91);

        if (v37
          || (objc_msgSend_protectionData(v8, v93, v94),
              v98 = (void *)objc_claimAutoreleasedReturnValue(),
              v99 = v98 == 0,
              v98,
              v99))
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v95 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
          {
            v96 = CFSTR("revocation");
            *(_DWORD *)buf = 138543874;
            if ((_DWORD)v19)
              v96 = CFSTR("grant");
            v127 = v96;
            v128 = 2112;
            v129 = v9;
            v130 = 2112;
            v131 = v37;
            _os_log_impl(&dword_1BE990000, v95, OS_LOG_TYPE_INFO, "Warn: Error serializing record PCS data for access %{public}@ of record %@: %@", buf, 0x20u);
          }
          v27[2](v27, v9, v37);
        }
        else
        {
          objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v100, v19);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v8, v102, (uint64_t)v101, *MEMORY[0x1E0C94998]);

          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v103 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v112 = (_DWORD)v19 ? CFSTR("granting") : CFSTR("revoking");
            v113 = v103;
            objc_msgSend_protectionData(v8, v114, v115);
            v116 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v127 = v9;
            v128 = 2114;
            v129 = v112;
            v130 = 2112;
            v131 = v116;
            _os_log_debug_impl(&dword_1BE990000, v113, OS_LOG_TYPE_DEBUG, "New protection data for record %@ after %{public}@ access is %@", buf, 0x20u);

            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          }
          v104 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v117 = CFSTR("removed");
            if ((_DWORD)v19)
              v117 = CFSTR("added");
            *(_DWORD *)buf = 138543618;
            v127 = v117;
            v128 = 2112;
            v129 = v9;
            _os_log_debug_impl(&dword_1BE990000, v104, OS_LOG_TYPE_DEBUG, "Successfully %{public}@ sharing info to record %@. Preparing to save the record back to the server", buf, 0x16u);
          }
          objc_msgSend_recordsToSaveByID(self, v105, v106);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_sync_enter(v107);
          objc_msgSend_recordsToSaveByID(self, v108, v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v110, v111, (uint64_t)v8, v9);

          objc_sync_exit(v107);
          v37 = 0;
        }
      }
LABEL_84:

      v10 = (__CFString *)v27;
      goto LABEL_85;
    }
LABEL_54:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v70 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v127 = v9;
      _os_log_debug_impl(&dword_1BE990000, v70, OS_LOG_TYPE_DEBUG, "Fetched record %@ had no PCS data", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v71, *MEMORY[0x1E0C94B20], 5001, CFSTR("Fetched record %@ had no PCS data"), v9);
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v27[2](v27, v9, v37);
    CFRelease(RandomSharingIdentityWithError);
    goto LABEL_84;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v48 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v127 = v9;
    _os_log_error_impl(&dword_1BE990000, v48, OS_LOG_TYPE_ERROR, "Received a record ID that we don't know anything about: %@", buf, 0xCu);
  }
LABEL_85:

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
  objc_msgSend_recordIDsToGrant(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v4, v8, (uint64_t)v7);

  objc_msgSend_recordIDsToRevoke(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v4, v12, (uint64_t)v11);

  objc_msgSend_setRecordIDs_(v3, v13, (uint64_t)v4);
  v14 = *MEMORY[0x1E0C94B48];
  v23[0] = *MEMORY[0x1E0C949A0];
  v23[1] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v23, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(v3, v17, (uint64_t)v16);

  v18 = objc_opt_class();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1BEA88AA4;
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
  CKDModifyRecordAccessOperation *v32;
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
    _os_log_debug_impl(&dword_1BE990000, v16, OS_LOG_TYPE_DEBUG, "Starting web access modification operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v29,
      0x2Au);

  }
  objc_msgSend_recordIDsToGrant(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v7, v8))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend_recordIDsToRevoke(self, v9, v10);
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
  const char *v32;
  const char *v33;
  const char *v34;
  objc_super v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend_recordIDsToGrant(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v42, v47, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v43;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v8);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v42 + 1) + 8 * v15), v11, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v5, v17, (uint64_t)v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v42, v47, 16);
    }
    while (v13);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend_recordIDsToRevoke(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v38, v46, 16);
  if (v22)
  {
    v25 = v22;
    v26 = *(_QWORD *)v39;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v39 != v26)
          objc_enumerationMutation(v20);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v38 + 1) + 8 * v27), v23, v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v5, v29, (uint64_t)v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v38, v46, 16);
    }
    while (v25);
  }

  if (objc_msgSend_count(v5, v30, v31))
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1BEA893D0;
    v36[3] = &unk_1E78305B0;
    v37 = v5;
    objc_msgSend_updateCloudKitMetrics_(self, v33, (uint64_t)v36);

  }
  objc_msgSend_setAccessWasGrantedBlock_(self, v32, 0);
  objc_msgSend_setAccessWasRevokedBlock_(self, v34, 0);
  v35.receiver = self;
  v35.super_class = (Class)CKDModifyRecordAccessOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v35, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)accessWasGrantedBlock
{
  return self->_accessWasGrantedBlock;
}

- (void)setAccessWasGrantedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (id)accessWasRevokedBlock
{
  return self->_accessWasRevokedBlock;
}

- (void)setAccessWasRevokedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSArray)recordIDsToGrant
{
  return self->_recordIDsToGrant;
}

- (void)setRecordIDsToGrant:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToGrant, a3);
}

- (NSArray)recordIDsToRevoke
{
  return self->_recordIDsToRevoke;
}

- (void)setRecordIDsToRevoke:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToRevoke, a3);
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
  objc_storeStrong((id *)&self->_recordIDsToRevoke, 0);
  objc_storeStrong((id *)&self->_recordIDsToGrant, 0);
  objc_storeStrong(&self->_accessWasRevokedBlock, 0);
  objc_storeStrong(&self->_accessWasGrantedBlock, 0);
}

@end
