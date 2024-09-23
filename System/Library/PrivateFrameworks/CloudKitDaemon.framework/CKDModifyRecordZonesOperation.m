@implementation CKDModifyRecordZonesOperation

- (CKDModifyRecordZonesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDModifyRecordZonesOperation *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *recordZonesToSave;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *recordZoneIDsToDelete;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *recordZonesByZoneID;
  NSMutableArray *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  NSMutableDictionary *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  NSMutableDictionary *retryableErrorsByZoneID;
  uint64_t v51;
  NSMutableArray *zonesWaitingOnKeyRegistrySync;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CKDModifyRecordZonesOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v58, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordZonesToSave(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_mutableCopy(v10, v11, v12);
    recordZonesToSave = v9->_recordZonesToSave;
    v9->_recordZonesToSave = (NSMutableArray *)v13;

    v9->_hasZoneSaves = objc_msgSend_count(v9->_recordZonesToSave, v15, v16) != 0;
    objc_msgSend_recordZoneIDsToDelete(v6, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    recordZoneIDsToDelete = v9->_recordZoneIDsToDelete;
    v9->_recordZoneIDsToDelete = (NSArray *)v19;

    v9->_hasZoneDeletes = objc_msgSend_count(v9->_recordZoneIDsToDelete, v21, v22) != 0;
    v9->_allowDefaultZoneSave = objc_msgSend_allowDefaultZoneSave(v6, v23, v24);
    v9->_markZonesAsUserPurged = objc_msgSend_markZonesAsUserPurged(v6, v25, v26);
    v29 = objc_msgSend_maxZoneSaveAttempts(v6, v27, v28);
    v9->_maxZoneSaveAttempts = v29;
    if (v29 <= 0)
    {
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_maxZoneSaveAttempts = (int)objc_msgSend_PCSRetryCount(v32, v33, v34);

    }
    v9->_dontFetchFromServer = objc_msgSend_dontFetchFromServer(v6, v30, v31);
    v35 = objc_opt_new();
    recordZonesByZoneID = v9->_recordZonesByZoneID;
    v9->_recordZonesByZoneID = (NSMutableDictionary *)v35;

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v37 = v9->_recordZonesToSave;
    v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v54, v59, 16);
    if (v39)
    {
      v42 = v39;
      v43 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v55 != v43)
            objc_enumerationMutation(v37);
          v45 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v46 = v9->_recordZonesByZoneID;
          objc_msgSend_zoneID(v45, v40, v41, (_QWORD)v54);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v46, v48, (uint64_t)v45, v47);

        }
        v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v54, v59, 16);
      }
      while (v42);
    }

    v49 = objc_opt_new();
    retryableErrorsByZoneID = v9->_retryableErrorsByZoneID;
    v9->_retryableErrorsByZoneID = (NSMutableDictionary *)v49;

    v51 = objc_opt_new();
    zonesWaitingOnKeyRegistrySync = v9->_zonesWaitingOnKeyRegistrySync;
    v9->_zonesWaitingOnKeyRegistrySync = (NSMutableArray *)v51;

  }
  return v9;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  _BOOL4 v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      goto LABEL_10;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      v8 = objc_msgSend_numZoneSaveAttempts(self, v6, v7);
      objc_msgSend_setNumZoneSaveAttempts_(self, v9, (v8 + 1));
      return MEMORY[0x1E0DE7D20](self, sel__saveZonesToServer, v36);
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__synchronizeSigningIdentitiesIfNeeded(self, v19, v20);
      return 1;
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend__synchronizeUserKeyRegistryIfNeeded(self, v21, v22);
      return 1;
    case 5:
      v10 = objc_msgSend_numZoneSaveAttempts(self, v4, v5);
      if (objc_msgSend_maxZoneSaveAttempts(self, v11, v12) <= v10)
      {
        v18 = 0;
      }
      else
      {
        objc_msgSend_recordZonesToSave(self, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend_count(v15, v16, v17) != 0;

      }
      objc_msgSend_zonesWaitingOnKeyRegistrySync(self, v13, v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_count(v23, v24, v25);

      if (v26 || !v18)
      {
        objc_msgSend__sendErrorForFailedZones(self, v4, v27);
        objc_msgSend__sendCoreAnalyticsEventForKeySync(self, v29, v30);
        objc_msgSend_setState_(self, v31, 0xFFFFFFFFLL);
        objc_msgSend_error(self, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_finishWithError_(self, v35, (uint64_t)v34);

      }
      else
      {
LABEL_10:
        objc_msgSend_setState_(self, v4, 2);
        objc_msgSend__fetchPCSDataForZonesFromServer_(self, v28, 1);
      }
      return 1;
    default:
      return 1;
  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/modify-record-zones", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 4)
    return off_1E7832A58[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDModifyRecordZonesOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)relevantZoneIDs
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  NSArray *v22;
  const char *v23;
  NSArray *v24;
  NSArray *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_count(self->_recordZonesToSave, a2, v2);
  v7 = objc_msgSend_count(self->_recordZoneIDsToDelete, v5, v6);
  v8 = v7;
  if (!v4)
  {
    if (!v7)
    {
      v24 = 0;
      v25 = 0;
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v11 = (void *)objc_msgSend_initWithCapacity_(v9, v10, v8 + v4);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = self->_recordZonesToSave;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, v31, 16);
  if (v14)
  {
    v17 = v14;
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v12);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v27 + 1) + 8 * i), v15, v16, (_QWORD)v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v11, v21, (uint64_t)v20);

      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v27, v31, 16);
    }
    while (v17);
  }

  v22 = v11;
  v24 = v22;
  if (!v8)
    goto LABEL_12;
  if (!v22)
  {
LABEL_14:
    v25 = self->_recordZoneIDsToDelete;
    v24 = 0;
    goto LABEL_16;
  }
  objc_msgSend_addObjectsFromArray_(v22, v23, (uint64_t)self->_recordZoneIDsToDelete);
LABEL_12:
  v25 = v24;
LABEL_16:

  return v25;
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (void)_synchronizeSigningIdentitiesIfNeeded
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_needsSynchronizeSigningIdentities(self, a2, v2)
    && (objc_msgSend_didSynchronizeSigningIdentities(self, v4, v5) & 1) == 0)
  {
    objc_msgSend_topmostParentOperation(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v11;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Will attempt user key sync to update signing identities for operation %{public}@.", buf, 0xCu);
    }
    objc_msgSend_stateTransitionGroup(self, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v15);

    objc_initWeak((id *)buf, self);
    objc_msgSend_noteOperationWillWaitOnPCS(self, v16, v17);
    objc_msgSend_container(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1BEAAB36C;
    v26[3] = &unk_1E7832920;
    objc_copyWeak(&v28, (id *)buf);
    v24 = v11;
    v27 = v24;
    objc_msgSend_synchronizeUserKeyRegistryForSigningIdentitiesForRequestorOperationID_completionHandler_(v23, v25, (uint64_t)v24, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_synchronizeUserKeyRegistryIfNeeded
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
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend_zonesWaitingOnKeyRegistrySync(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    objc_msgSend_topmostParentOperation(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v13;
      _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_INFO, "Will attempt user key sync for operation %{public}@.", buf, 0xCu);
    }
    objc_msgSend_stateTransitionGroup(self, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v17);

    objc_initWeak((id *)buf, self);
    objc_msgSend_noteOperationWillWaitOnPCS(self, v18, v19);
    objc_msgSend_container(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1BEAAB748;
    v28[3] = &unk_1E7832948;
    objc_copyWeak(&v30, (id *)buf);
    v26 = v13;
    v29 = v26;
    objc_msgSend_synchronizeUserKeyRegistryForServiceType_shouldThrottle_context_requestorOperationID_completionHandler_(v25, v27, 0, 1, 0x1E784B808, v26, v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_sendCoreAnalyticsEventForKeySync
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  id v36;

  objc_msgSend_keySyncAnalytics(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_recordZonesToSave(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_count(v7, v8, v9);

    if (v10)
    {
      objc_msgSend_keySyncAnalytics(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOverallResult_(v13, v14, (uint64_t)CFSTR("failure"));

      objc_msgSend_keySyncAnalytics(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
LABEL_8:
        objc_msgSend_container(self, v21, v22);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsManager(v36, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_keySyncAnalytics(self, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sendCoreAnalyticsEventForKeySync_(v31, v35, (uint64_t)v34);

        return;
      }
      objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v21, *MEMORY[0x1E0C94B20], 2037, 0, CFSTR("Error saving record zone to server: Protection data didn't match"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_keySyncAnalytics(self, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v26, v27, (uint64_t)v23);

    }
    else
    {
      objc_msgSend_keySyncAnalytics(self, v11, v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOverallResult_(v23, v28, (uint64_t)CFSTR("success"));
    }

    goto LABEL_8;
  }
}

- (void)_sendErrorForFailedZones
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  int v11;
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
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  dispatch_once_t *v30;
  os_log_t *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  os_log_t v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  int v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id obj;
  _QWORD block[6];
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  _BYTE v81[18];
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordZonesToSave(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6) && objc_msgSend_didSynchronizeUserKeyRegistry(self, v7, v8))
  {
    v11 = objc_msgSend_numZoneSaveAttempts(self, v9, v10);

    if (v11 < 2)
      goto LABEL_10;
    objc_msgSend_container(self, v12, v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processName(v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(v4, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      v59 = v23;
      objc_msgSend_recordZonesToSave(self, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend_count(v62, v63, v64);
      objc_msgSend_operationID(self, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v79 = v65;
      v80 = 2114;
      *(_QWORD *)v81 = v68;
      *(_WORD *)&v81[8] = 2114;
      *(_QWORD *)&v81[10] = v16;
      v82 = 2114;
      v83 = v22;
      _os_log_fault_impl(&dword_1BE990000, v59, OS_LOG_TYPE_FAULT, "Failed to save %lu zones for operation %{public}@ despite user key sync. procName=%{public}@, containerID=%{public}@", buf, 0x2Au);

    }
  }

LABEL_10:
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend_recordZonesToSave(self, v12, v13);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v73, v77, 16);
  if (v25)
  {
    v28 = v25;
    v29 = *(_QWORD *)v74;
    v69 = *MEMORY[0x1E0C94B20];
    v30 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    v31 = (os_log_t *)MEMORY[0x1E0C952B0];
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v74 != v29)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v32);
        objc_msgSend_retryableErrorsByZoneID(self, v26, v27);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v33, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v34, v38, (uint64_t)v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
          v42 = (void *)MEMORY[0x1E0C94FF8];
          objc_msgSend_zoneID(v33, v40, v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_format_(v42, v44, v69, 2037, 0, CFSTR("Error saving record zone %@ to server: Protection data didn't match"), v43);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (*v30 != -1)
          dispatch_once(v30, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v45 = *v31;
        if (os_log_type_enabled(*v31, OS_LOG_TYPE_INFO))
        {
          v48 = v45;
          objc_msgSend_zoneID(v33, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend_numZoneSaveAttempts(self, v52, v53);
          *(_DWORD *)buf = 138412802;
          v79 = (uint64_t)v51;
          v80 = 1024;
          *(_DWORD *)v81 = v54;
          *(_WORD *)&v81[4] = 2112;
          *(_QWORD *)&v81[6] = v39;
          _os_log_impl(&dword_1BE990000, v48, OS_LOG_TYPE_INFO, "Failed to save zone %@ to the server %d times. Bailing with error: %@.", buf, 0x1Cu);

        }
        objc_msgSend_saveCompletionBlock(self, v46, v47);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          objc_msgSend_callbackQueue(self, v56, v57);
          v58 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = 0x1BEAAC000;
          block[3] = &unk_1E782E418;
          block[4] = self;
          block[5] = v33;
          v72 = v39;
          dispatch_async(v58, block);

        }
        ++v32;
      }
      while (v28 != v32);
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v73, v77, 16);
    }
    while (v28);
  }

}

- (void)_handleRecordZoneSaved:(id)a3 responseCode:(id)a4 serverCapabilities:(unint64_t)a5 expirationDate:(id)a6 expired:(BOOL)a7
{
  _BOOL8 v7;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  int v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  char isEqual;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  NSObject *v63;
  _QWORD *v64;
  os_log_t *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  int hasPrefix;
  const char *v81;
  os_log_t v82;
  const char *v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  char hasErrorDescription;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  void *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  NSObject *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  NSObject *v132;
  const char *v133;
  uint64_t v134;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  void *v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  NSObject *v169;
  const char *v170;
  uint64_t v171;
  int v172;
  void *v173;
  void *v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  NSObject *v196;
  id v197;
  id v198;
  id v199;
  _QWORD v200[5];
  id v201;
  id v202;
  id v203;
  _QWORD v204[4];
  id v205;
  _QWORD block[5];
  id v207;
  id v208;
  _QWORD v209[4];
  id v210;
  id v211;
  CKDModifyRecordZonesOperation *v212;
  id v213;
  id v214;
  uint8_t buf[4];
  _BYTE v216[18];
  uint64_t v217;

  v7 = a7;
  v217 = *MEMORY[0x1E0C80C00];
  v199 = a3;
  v198 = a4;
  v197 = a6;
  objc_msgSend_recordZonesByZoneID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v199);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v19 = sub_1BEB10D5C(v198);
    v20 = (_BYTE *)MEMORY[0x1E0C95280];
    if (*MEMORY[0x1E0C95280])
    {
      if (objc_msgSend_checkAndClearUnitTestOverrides_(self, v17, (uint64_t)CFSTR("SwizzleZoneSaveResponseToErrorZonePCSIdentityUnknown")))
      {
        objc_msgSend_setCode_(v198, v17, 3);
        v19 = 2053;
      }
      if (*v20
        && objc_msgSend_checkAndClearUnitTestOverrides_(self, v17, (uint64_t)CFSTR("SwizzleZoneSaveResponseToErrorZoneNotFound")))
      {
        objc_msgSend_setCode_(v198, v17, 3);
        v19 = 2036;
      }
    }
    v21 = objc_msgSend_code(v198, v17, v18);
    if (v199 && v21 == 1)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v24 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v216 = v16;
        _os_log_impl(&dword_1BE990000, v24, OS_LOG_TYPE_INFO, "RecordZone %@ was successfully saved to the server", buf, 0xCu);
      }
      objc_msgSend_setCapabilities_(v16, v25, a5);
      objc_msgSend_setExpirationDate_(v16, v26, (uint64_t)v197);
      objc_msgSend_setExpired_(v16, v27, v7);
      objc_msgSend_setHasUpdatedExpirationTimeInterval_(v16, v28, 0);
      objc_msgSend_setUpdatedExpirationTimeInterval_(v16, v29, 0);
      objc_msgSend_originalRequiredFeatures(v16, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requiredFeatures(v16, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v32, v36, (uint64_t)v35);

      if ((isEqual & 1) == 0)
      {
        objc_msgSend_requiredFeatures(v16, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setOriginalRequiredFeatures_(v16, v41, (uint64_t)v40);

      }
      objc_msgSend_recordZonesToSave(self, v38, v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v42);
      objc_msgSend_recordZonesToSave(self, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObject_(v45, v46, (uint64_t)v16);

      objc_sync_exit(v42);
      objc_msgSend_protectionData(v16, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend_stateTransitionGroup(self, v50, v51);
        v52 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v52);

        objc_initWeak((id *)buf, self);
        objc_msgSend_container(self, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsManager(v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_protectionData(v16, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v209[0] = MEMORY[0x1E0C809B0];
        v209[1] = 3221225472;
        v209[2] = sub_1BEAACD84;
        v209[3] = &unk_1E7832970;
        objc_copyWeak(&v213, (id *)buf);
        v210 = v199;
        v211 = v16;
        v212 = self;
        objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(v58, v62, (uint64_t)v61, 3, 0, v209);

        objc_destroyWeak(&v213);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        objc_msgSend_saveCompletionBlock(self, v50, v51);
        v117 = (void *)objc_claimAutoreleasedReturnValue();

        if (v117)
        {
          objc_msgSend_callbackQueue(self, v118, v119);
          v120 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_1BEAAD1C4;
          block[3] = &unk_1E782E418;
          block[4] = self;
          v207 = v199;
          v208 = v16;
          dispatch_async(v120, block);

        }
      }
      goto LABEL_63;
    }
    if (v19 == 2036)
    {
      objc_msgSend_container(self, v22, v23);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v121, v122, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      if (((v199 != 0) & objc_msgSend_useAnonymousToServerShareParticipants(v124, v125, v126)) == 1)
      {
        v129 = objc_msgSend_databaseScope(self, v127, v128);

        if (v129 == 3)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v132 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v216 = v199;
            _os_log_debug_impl(&dword_1BE990000, v132, OS_LOG_TYPE_DEBUG, "Possible anonymous share %@ not found. Removing share from anonymous share list", buf, 0xCu);
          }
          objc_initWeak((id *)buf, self);
          objc_msgSend_stateTransitionGroup(self, v133, v134);
          v135 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v135);

          objc_msgSend_container(self, v136, v137);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousSharingManager(v138, v139, v140);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          v214 = v199;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v142, (uint64_t)&v214, 1);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v204[0] = MEMORY[0x1E0C809B0];
          v204[1] = 3221225472;
          v204[2] = sub_1BEAAD234;
          v204[3] = &unk_1E78309E8;
          objc_copyWeak(&v205, (id *)buf);
          objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v141, v144, (uint64_t)v143, self, v204);

          objc_destroyWeak(&v205);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {

      }
      objc_msgSend_container(self, v130, v131);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordCache(v149, v150, v151);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clearAllRecordsForZoneWithID_(v152, v153, (uint64_t)v199);

      if (objc_msgSend_databaseScope(self, v154, v155) != 1 && objc_msgSend_databaseScope(self, v156, v157) != 4)
      {
        objc_msgSend_setPCSData_forFetchedZoneID_(self, v158, 0, v199);
        objc_msgSend_container(self, v159, v160);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsCache(v161, v162, v163);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removePCSDataForItemsInZoneWithID_(v164, v165, (uint64_t)v199);

      }
    }
    else if (v19 == 2053 || v19 == 2037)
    {
      v64 = (_QWORD *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v65 = (os_log_t *)MEMORY[0x1E0C952B0];
      v66 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v69 = v66;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v216 = v199;
        *(_WORD *)&v216[8] = 1024;
        *(_DWORD *)&v216[10] = objc_msgSend_code(v198, v70, v71);
        _os_log_impl(&dword_1BE990000, v69, OS_LOG_TYPE_INFO, "Received a failure for save of zone %@ with error code %d. Re-fetching the zone PCS and trying again", buf, 0x12u);

      }
      if (v19 == 2053)
        goto LABEL_31;
      objc_msgSend_error(v198, v67, v68);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v72, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v75, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      hasPrefix = objc_msgSend_hasPrefix_(v78, v79, (uint64_t)CFSTR("zone pcs is created without the user's public key"));

      if (hasPrefix)
      {
LABEL_31:
        if (*v64 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v82 = *v65;
        if (os_log_type_enabled(*v65, OS_LOG_TYPE_INFO))
        {
          v85 = v82;
          objc_msgSend_operationID(self, v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v216 = v199;
          *(_WORD *)&v216[8] = 2114;
          *(_QWORD *)&v216[10] = v88;
          _os_log_impl(&dword_1BE990000, v85, OS_LOG_TYPE_INFO, "Zone PCS for %@ failed server validation. Will attempt user key sync for operation %{public}@ before trying again.", buf, 0x16u);

        }
        if (!v199)
          __assert_rtn("-[CKDModifyRecordZonesOperation _handleRecordZoneSaved:responseCode:serverCapabilities:expirationDate:expired:]", "CKDModifyRecordZonesOperation.m", 392, "zoneID");
        objc_msgSend_zonesWaitingOnKeyRegistrySync(self, v83, v84);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v89, v90, (uint64_t)v199);

      }
      objc_msgSend_setProtectionData_(v16, v81, 0);
      objc_msgSend_setZoneishProtectionData_(v16, v91, 0);
      objc_msgSend_setProtectionEtag_(v16, v92, 0);
      objc_msgSend_setPreviousProtectionEtag_(v16, v93, 0);
      objc_msgSend_setZonePCS_(v16, v94, 0);
      objc_msgSend_setZoneishPCS_(v16, v95, 0);
      objc_msgSend_setPCSData_forFetchedZoneID_(self, v96, 0, v199);
      v97 = (void *)MEMORY[0x1E0C94FF8];
      objc_msgSend_request(self, v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(v100, v198);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v198, v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      hasErrorDescription = objc_msgSend_hasErrorDescription(v104, v105, v106);
      v110 = *MEMORY[0x1E0C94B20];
      if ((hasErrorDescription & 1) != 0)
      {
        objc_msgSend_error(v198, v108, v109);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDescription(v111, v112, v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_format_(v97, v115, v110, v19, v101, CFSTR("Error saving record zone %@ to server: %@"), v16, v114);
        v116 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend_errorWithDomain_code_userInfo_format_(v97, v108, v110, v19, v101, CFSTR("Error saving record zone %@ to server: %@"), v16, CFSTR("Protection data didn't match"));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (v199)
      {
        objc_msgSend_retryableErrorsByZoneID(self, v145, v146);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v147, v148, (uint64_t)v116, v199);

      }
      goto LABEL_63;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v166 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v169 = v166;
      v172 = objc_msgSend_code(v198, v170, v171);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v216 = v172;
      *(_WORD *)&v216[4] = 2112;
      *(_QWORD *)&v216[6] = v16;
      _os_log_impl(&dword_1BE990000, v169, OS_LOG_TYPE_INFO, "Error %d when saving record zone %@ to the server", buf, 0x12u);

    }
    v173 = (void *)MEMORY[0x1E0C94FF8];
    objc_msgSend_request(self, v167, v168);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v174, v198);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v198, v176, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v178, v179, v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v173, v182, *MEMORY[0x1E0C94B20], v19, v175, CFSTR("Error saving record zone %@ to server: %@"), v16, v181);
    v183 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_recordZonesToSave(self, v184, v185);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v186);
    objc_msgSend_recordZonesToSave(self, v187, v188);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v189, v190, (uint64_t)v16);

    objc_sync_exit(v186);
    objc_msgSend_saveCompletionBlock(self, v191, v192);
    v193 = (void *)objc_claimAutoreleasedReturnValue();

    if (v193)
    {
      objc_msgSend_callbackQueue(self, v194, v195);
      v196 = objc_claimAutoreleasedReturnValue();
      v200[0] = MEMORY[0x1E0C809B0];
      v200[1] = 3221225472;
      v200[2] = sub_1BEAAD344;
      v200[3] = &unk_1E782F4A8;
      v200[4] = self;
      v201 = v199;
      v202 = v16;
      v203 = v183;
      dispatch_async(v196, v200);

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v63 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v216 = v199;
      _os_log_error_impl(&dword_1BE990000, v63, OS_LOG_TYPE_ERROR, "Got a response for record zone with ID %@, but we didn't try to put that record zone.", buf, 0xCu);
    }
  }
LABEL_63:

}

- (void)_handleRecordZoneDeleted:(id)a3 responseCode:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
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
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  _QWORD block[5];
  id v50;
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_code(v7, v8, v9);
  v11 = (void *)*MEMORY[0x1E0C952F8];
  v12 = *MEMORY[0x1E0C95300];
  if (v10 == 1)
  {
    if (v12 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v13 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v6;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "RecordZone %@ was successfully deleted from the server", buf, 0xCu);
    }
    objc_msgSend_setPCSData_forFetchedZoneID_(self, v14, 0, v6);
    objc_msgSend_container(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsCache(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removePCSDataForItemsInZoneWithID_(v20, v21, (uint64_t)v6);

    objc_msgSend_container(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordCache(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearAllRecordsForZoneWithID_(v27, v28, (uint64_t)v6);
    v29 = 0;
  }
  else
  {
    if (v12 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v30 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v53 = v7;
      v54 = 2112;
      v55 = v6;
      _os_log_impl(&dword_1BE990000, v30, OS_LOG_TYPE_INFO, "Error %@ when deleting record zone %@ from the server", buf, 0x16u);
    }
    v31 = (void *)MEMORY[0x1E0C94FF8];
    v32 = *MEMORY[0x1E0C94B20];
    v33 = sub_1BEB10D5C(v7);
    objc_msgSend_request(self, v34, v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v24, v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v7, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v31, v42, v32, v33, v27, CFSTR("Error deleting record zone %@: %@"), v6, v41);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_deleteCompletionBlock(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend_callbackQueue(self, v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEAAD6C8;
    block[3] = &unk_1E782E418;
    block[4] = self;
    v50 = v6;
    v51 = v29;
    dispatch_async(v48, block);

  }
}

- (BOOL)_saveZonesToServer
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  BOOL v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  int v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  id v58;
  const char *v59;
  const char *v60;
  void *v61;
  const char *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  CKDModifyRecordZonesURLRequest *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  int v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  _BOOL4 v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  BOOL v117;
  NSObject *v119;
  void *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  NSObject *v124;
  __int128 v125;
  _QWORD v126[4];
  id v127;
  id v128;
  _QWORD v129[4];
  id v130;
  id location;
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint8_t v137[128];
  uint8_t buf[4];
  uint64_t v139;
  __int16 v140;
  uint64_t v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordZonesToSave(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {

    goto LABEL_4;
  }
  objc_msgSend_recordZoneIDsToDelete(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_count(v9, v10, v11);

  if (v12)
  {
LABEL_4:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v16 = v13;
      objc_msgSend_recordZonesToSave(self, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_count(v19, v20, v21);
      objc_msgSend_recordZoneIDsToDelete(self, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v139 = v22;
      v140 = 2048;
      v141 = objc_msgSend_count(v25, v26, v27);
      _os_log_impl(&dword_1BE990000, v16, OS_LOG_TYPE_INFO, "Saving %ld, deleting %ld record zones on the server.", buf, 0x16u);

    }
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v14, v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)CFSTR("AddRandomShareeIdentityToZonePCS"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30 == 0;

      if (!v31)
      {
        v135 = 0u;
        v136 = 0u;
        v133 = 0u;
        v134 = 0u;
        objc_msgSend_recordZonesToSave(self, v14, v15);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v133, v137, 16);
        if (v36)
        {
          v38 = *(_QWORD *)v134;
          *(_QWORD *)&v37 = 138412290;
          v125 = v37;
          do
          {
            v39 = 0;
            do
            {
              if (*(_QWORD *)v134 != v38)
                objc_enumerationMutation(v32);
              v40 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v39);
              v43 = objc_msgSend_zonePCS(v40, v34, v35, v125);
              if (v43)
              {
                objc_msgSend_container(self, v41, v42);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_pcsManager(v44, v45, v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend_addRandomShareeToPCS_(v47, v48, v43);

                if (v49)
                {
                  objc_msgSend_setZonePCS_(v40, v34, v43);
                  objc_msgSend_container(self, v50, v51);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_pcsManager(v52, v53, v54);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v132 = 0;
                  objc_msgSend_dataFromZonePCS_error_(v55, v56, v43, &v132);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = v132;

                  if (!v57 || v58)
                  {
                    if (*MEMORY[0x1E0C95300] != -1)
                      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                    v64 = *MEMORY[0x1E0C952B0];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = v125;
                      v139 = (uint64_t)v58;
                      _os_log_error_impl(&dword_1BE990000, v64, OS_LOG_TYPE_ERROR, "Failed to create PCS data, skipping AddRandomShareeIdentityToZonePCS. error: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    objc_msgSend_setProtectionData_(v40, v59, (uint64_t)v57);
                    objc_msgSend_etagFromPCSData_(CKDPCSManager, v60, (uint64_t)v57);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setProtectionEtag_(v40, v62, (uint64_t)v61);

                  }
                }
              }
              else
              {
                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v63 = *MEMORY[0x1E0C952B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BE990000, v63, OS_LOG_TYPE_INFO, "Warn: PCS not available for the zone, skipping AddRandomShareeIdentityToZonePCS", buf, 2u);
                }
              }
              ++v39;
            }
            while (v36 != v39);
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v133, v137, 16);
          }
          while (v36);
        }

      }
    }
    objc_msgSend_stateTransitionGroup(self, v14, v15);
    v65 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v65);

    v66 = [CKDModifyRecordZonesURLRequest alloc];
    objc_msgSend_recordZonesToSave(self, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordZoneIDsToDelete(self, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_msgSend_initWithOperation_recordZonesToSave_recordZoneIDsToDelete_(v66, v73, (uint64_t)self, v69, v72);

    v77 = objc_msgSend_markZonesAsUserPurged(self, v75, v76);
    objc_msgSend_setMarkZonesAsUserPurged_(v74, v78, v77);
    objc_msgSend_container(self, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_bypassPCSEncryption(v84, v85, v86) & 1) == 0)
    {
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend_useEncryption(v89, v90, v91);

      if (!v92)
        goto LABEL_36;
      objc_msgSend_container(self, v93, v94);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v81, v95, v96);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastMissingManateeIdentityErrorDateForCurrentService(v84, v97, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLastMissingManateeIdentityErrorDate_(v74, v100, (uint64_t)v99);

    }
    if (!*MEMORY[0x1E0C95280])
      goto LABEL_39;
    objc_msgSend_unitTestOverrides(self, v93, v94);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v101, v102, (uint64_t)CFSTR("EnsureLastMissingManateeIdentityErrorDateOnZoneDelete"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v103)
      goto LABEL_39;
LABEL_36:
    objc_msgSend_lastMissingManateeIdentityErrorDate(v74, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v106 == 0;

    if (v107)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v108, *MEMORY[0x1E0C94B20], 1, CFSTR("Failing zone delete for unit tests because we should have had a lastMissingManateeIdentityErrorDate"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(self, v121, (uint64_t)v120);

      objc_msgSend_stateTransitionGroup(self, v122, v123);
      v124 = objc_claimAutoreleasedReturnValue();
      dispatch_group_leave(v124);

      v117 = 0;
    }
    else
    {
LABEL_39:
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v74);
      v109 = MEMORY[0x1E0C809B0];
      v129[0] = MEMORY[0x1E0C809B0];
      v129[1] = 3221225472;
      v129[2] = sub_1BEAADF10;
      v129[3] = &unk_1E7832998;
      objc_copyWeak(&v130, (id *)buf);
      objc_msgSend_setRecordZoneModifiedBlock_(v74, v110, (uint64_t)v129);
      v126[0] = v109;
      v126[1] = 3221225472;
      v126[2] = sub_1BEAADFEC;
      v126[3] = &unk_1E782E468;
      objc_copyWeak(&v127, (id *)buf);
      objc_copyWeak(&v128, &location);
      objc_msgSend_setCompletionBlock_(v74, v111, (uint64_t)v126);
      objc_msgSend_setRequest_(self, v112, (uint64_t)v74);
      objc_msgSend_container(self, v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_performRequest_(v115, v116, (uint64_t)v74);

      objc_destroyWeak(&v128);
      objc_destroyWeak(&v127);
      objc_destroyWeak(&v130);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
      v117 = 1;
    }

    return v117;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v119 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v119, OS_LOG_TYPE_INFO, "Skipping save of zones because there is nothing to do", buf, 2u);
  }
  return 0;
}

- (int)operationType
{
  _BOOL4 hasZoneSaves;
  int result;

  hasZoneSaves = self->_hasZoneSaves;
  result = 200;
  if (!hasZoneSaves)
  {
    if (self->_hasZoneDeletes)
      return 202;
    else
      return 200;
  }
  return result;
}

- (BOOL)isOperationType:(int)a3
{
  int *v3;

  if (a3 == 200)
  {
    v3 = &OBJC_IVAR___CKDModifyRecordZonesOperation__hasZoneSaves;
    return *((_BYTE *)&self->super.super.super.super.isa + *v3) != 0;
  }
  if (a3 == 202)
  {
    v3 = &OBJC_IVAR___CKDModifyRecordZonesOperation__hasZoneDeletes;
    return *((_BYTE *)&self->super.super.super.super.isa + *v3) != 0;
  }
  return 0;
}

- (void)_createNewPCSForZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
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
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  CKDModifyRecordZonesOperation *v39;
  id v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v43[4];
  NSObject *v44;
  _QWORD *v45;
  _QWORD *v46;
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = sub_1BE9BAFE8;
  v50[4] = sub_1BE9BADA8;
  v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = sub_1BE9BAFE8;
  v48[4] = sub_1BE9BADA8;
  v49 = 0;
  objc_msgSend_container(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_group_create();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v12 = (id)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_zoneID(v6, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v53 = v15;
    _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Creating new PCS data for zone %@", buf, 0xCu);

  }
  dispatch_group_enter(v11);
  objc_msgSend_noteOperationWillWaitOnPCS(self, v16, v17);
  objc_initWeak((id *)buf, self);
  objc_msgSend_pcsManager(v10, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topmostParentOperation(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = sub_1BEAAE654;
  v43[3] = &unk_1E78329C0;
  objc_copyWeak(&v47, (id *)buf);
  v45 = v50;
  v46 = v48;
  v28 = v11;
  v44 = v28;
  objc_msgSend_createZonePCSWithRequestorOperationID_completionHandler_(v20, v29, (uint64_t)v26, v43);

  objc_msgSend_callbackQueue(self, v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  v36[0] = v27;
  v36[1] = 3221225472;
  v36[2] = sub_1BEAAE6F0;
  v36[3] = &unk_1E78329E8;
  v37 = v10;
  v38 = v6;
  v41 = v48;
  v42 = v50;
  v39 = self;
  v40 = v7;
  v33 = v7;
  v34 = v6;
  v35 = v10;
  dispatch_group_notify(v28, v32, v36);

  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

}

- (void)_fetchPCSDataForZone:(id)a3 fromServer:(BOOL)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
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
  id v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  _QWORD block[4];
  id v28;
  CKDModifyRecordZonesOperation *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[4];
  id v33;
  CKDModifyRecordZonesOperation *v34;
  NSObject *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;

  v5 = a3;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_1BE9BAFE8;
  v40[4] = sub_1BE9BADA8;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1BE9BAFE8;
  v38[4] = sub_1BE9BADA8;
  v39 = 0;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  objc_msgSend_stateTransitionGroup(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v9);

  objc_msgSend_container(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsCache(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v5, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1BEAAF1C4;
  v32[3] = &unk_1E7832A10;
  v36 = v38;
  v20 = v5;
  v33 = v20;
  v34 = self;
  v37 = v40;
  v21 = v6;
  v35 = v21;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v15, v22, (uint64_t)v18, self, 0, v32);

  objc_msgSend_callbackQueue(self, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = sub_1BEAAF710;
  block[3] = &unk_1E7832A38;
  v30 = v40;
  v31 = v38;
  v28 = v20;
  v29 = self;
  v26 = v20;
  dispatch_group_notify(v21, v25, block);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

}

- (void)_fetchPCSDataForZonesFromServer:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  dispatch_once_t *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
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
  const char *v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  os_log_t *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  os_log_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  const char *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  uint64_t v60;

  v3 = a3;
  v60 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_dontFetchFromServer(self, a2, a3))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v7 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v8 = v7;
      objc_msgSend_operationID(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = (uint64_t)v11;
      _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "Skipping fetch of zones from the server for operation %{public}@ because it has dontFetchFromServer set", buf, 0xCu);

    }
    return;
  }
  if (objc_msgSend_useEncryption(self, v5, v6))
  {
    objc_msgSend_recordZonesToSave(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_count(v14, v15, v16);

    v18 = (void *)*MEMORY[0x1E0C952F8];
    v19 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    if (v17)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v18);
      v20 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v23 = v20;
        objc_msgSend_recordZonesToSave(self, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        v59 = objc_msgSend_count(v26, v27, v28);
        _os_log_impl(&dword_1BE990000, v23, OS_LOG_TYPE_INFO, "Preparing PCS data for %ld zones", buf, 0xCu);

      }
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend_recordZonesToSave(self, v21, v22);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend_copy(v29, v30, v31);

      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v53, v57, 16);
      if (v34)
      {
        v38 = v34;
        v39 = *(_QWORD *)v54;
        v40 = (os_log_t *)MEMORY[0x1E0C952D8];
        *(_QWORD *)&v37 = 138412290;
        v52 = v37;
        do
        {
          v41 = 0;
          do
          {
            if (*(_QWORD *)v54 != v39)
              objc_enumerationMutation(v32);
            v42 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v41);
            objc_msgSend_protectionData(v42, v35, v36, v52);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43)
            {
              if (*v19 != -1)
                dispatch_once(v19, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v45 = *v40;
              if (os_log_type_enabled(*v40, OS_LOG_TYPE_INFO))
              {
                v46 = v45;
                objc_msgSend_zoneID(v42, v47, v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v52;
                v59 = (uint64_t)v49;
                _os_log_impl(&dword_1BE990000, v46, OS_LOG_TYPE_INFO, "Zone %@ already has PCS data.", buf, 0xCu);

              }
            }
            else
            {
              objc_msgSend__fetchPCSDataForZone_fromServer_(self, v44, (uint64_t)v42, v3);
            }
            ++v41;
          }
          while (v38 != v41);
          v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v53, v57, 16);
        }
        while (v38);
      }

      if (*v19 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v50 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v51 = "Waiting to fetch zone PCS data";
LABEL_37:
        _os_log_impl(&dword_1BE990000, v50, OS_LOG_TYPE_INFO, v51, buf, 2u);
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v18);
      v50 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v51 = "No zone to save in this operation.";
        goto LABEL_37;
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v50 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v51 = "Skipping zone PCS stuff because encryption is disabled";
      goto LABEL_37;
    }
  }
}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)_checkAndPrepareZones
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
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  int isDefaultRecordZoneID;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  _QWORD block[6];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_allowDefaultZoneSave(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_recordZonesToSave(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend_mutableCopy(v6, v7, v8);

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend_recordZonesToSave(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v44, v48, 16);
    if (v14)
    {
      v17 = v14;
      v18 = *(_QWORD *)v45;
      v19 = *MEMORY[0x1E0C94B20];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v12);
          v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend_zoneID(v21, v15, v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          isDefaultRecordZoneID = objc_msgSend_isDefaultRecordZoneID(v22, v23, v24);

          if (isDefaultRecordZoneID)
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v15, v19, 1017, CFSTR("You can't save the default zone"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_callbackQueue(self, v27, v28);
            v29 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = 0x1BEAB0000;
            block[3] = &unk_1E782E418;
            block[4] = self;
            block[5] = v21;
            v43 = v26;
            v30 = v26;
            dispatch_async(v29, block);

            objc_msgSend_removeObject_(v9, v31, (uint64_t)v21);
          }
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v44, v48, 16);
      }
      while (v17);
    }

    v34 = objc_msgSend_count(v9, v32, v33);
    objc_msgSend_recordZonesToSave(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_count(v37, v38, v39);

    if (v34 != v40)
      objc_msgSend_setRecordZonesToSave_(self, v41, (uint64_t)v9);

  }
}

- (void)main
{
  uint64_t v2;
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

  objc_msgSend__checkAndPrepareZones(self, a2, v2);
  objc_msgSend_recordZonesToSave(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v7, v8))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend_recordZoneIDsToDelete(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_count(v12, v13, v14) == 0;

  }
  objc_msgSend_makeStateTransition_(self, v15, v11);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend_recordZonesByZoneID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v13, v14, v15))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1BEAB020C;
    v20[3] = &unk_1E78305B0;
    v21 = v13;
    objc_msgSend_updateCloudKitMetrics_(self, v17, (uint64_t)v20);

  }
  objc_msgSend_setSaveCompletionBlock_(self, v16, 0);
  objc_msgSend_setDeleteCompletionBlock_(self, v18, 0);
  v19.receiver = self;
  v19.super_class = (Class)CKDModifyRecordZonesOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v19, sel__finishOnCallbackQueueWithError_, v5);

}

- (id)saveCompletionBlock
{
  return self->_saveCompletionBlock;
}

- (void)setSaveCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (id)deleteCompletionBlock
{
  return self->_deleteCompletionBlock;
}

- (void)setDeleteCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSMutableArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
  objc_storeStrong((id *)&self->_recordZonesToSave, a3);
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, a3);
}

- (NSMutableDictionary)recordZonesByZoneID
{
  return self->_recordZonesByZoneID;
}

- (void)setRecordZonesByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_recordZonesByZoneID, a3);
}

- (NSMutableDictionary)retryableErrorsByZoneID
{
  return self->_retryableErrorsByZoneID;
}

- (void)setRetryableErrorsByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_retryableErrorsByZoneID, a3);
}

- (BOOL)allowDefaultZoneSave
{
  return self->_allowDefaultZoneSave;
}

- (void)setAllowDefaultZoneSave:(BOOL)a3
{
  self->_allowDefaultZoneSave = a3;
}

- (BOOL)markZonesAsUserPurged
{
  return self->_markZonesAsUserPurged;
}

- (void)setMarkZonesAsUserPurged:(BOOL)a3
{
  self->_markZonesAsUserPurged = a3;
}

- (int)numZoneSaveAttempts
{
  return self->_numZoneSaveAttempts;
}

- (void)setNumZoneSaveAttempts:(int)a3
{
  self->_numZoneSaveAttempts = a3;
}

- (int64_t)maxZoneSaveAttempts
{
  return self->_maxZoneSaveAttempts;
}

- (void)setMaxZoneSaveAttempts:(int64_t)a3
{
  self->_maxZoneSaveAttempts = a3;
}

- (BOOL)dontFetchFromServer
{
  return self->_dontFetchFromServer;
}

- (void)setDontFetchFromServer:(BOOL)a3
{
  self->_dontFetchFromServer = a3;
}

- (BOOL)didSynchronizeUserKeyRegistry
{
  return self->_didSynchronizeUserKeyRegistry;
}

- (void)setDidSynchronizeUserKeyRegistry:(BOOL)a3
{
  self->_didSynchronizeUserKeyRegistry = a3;
}

- (NSMutableArray)zonesWaitingOnKeyRegistrySync
{
  return self->_zonesWaitingOnKeyRegistrySync;
}

- (void)setZonesWaitingOnKeyRegistrySync:(id)a3
{
  objc_storeStrong((id *)&self->_zonesWaitingOnKeyRegistrySync, a3);
}

- (CKDPCSKeySyncCoreAnalytics)keySyncAnalytics
{
  return self->_keySyncAnalytics;
}

- (void)setKeySyncAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_keySyncAnalytics, a3);
}

- (BOOL)needsSynchronizeSigningIdentities
{
  return self->_needsSynchronizeSigningIdentities;
}

- (void)setNeedsSynchronizeSigningIdentities:(BOOL)a3
{
  self->_needsSynchronizeSigningIdentities = a3;
}

- (BOOL)didSynchronizeSigningIdentities
{
  return self->_didSynchronizeSigningIdentities;
}

- (void)setDidSynchronizeSigningIdentities:(BOOL)a3
{
  self->_didSynchronizeSigningIdentities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySyncAnalytics, 0);
  objc_storeStrong((id *)&self->_zonesWaitingOnKeyRegistrySync, 0);
  objc_storeStrong((id *)&self->_retryableErrorsByZoneID, 0);
  objc_storeStrong((id *)&self->_recordZonesByZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
  objc_storeStrong(&self->_deleteCompletionBlock, 0);
  objc_storeStrong(&self->_saveCompletionBlock, 0);
}

@end
