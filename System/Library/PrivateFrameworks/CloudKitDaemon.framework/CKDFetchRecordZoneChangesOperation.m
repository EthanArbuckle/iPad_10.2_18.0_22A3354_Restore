@implementation CKDFetchRecordZoneChangesOperation

- (NSDictionary)supplementalChangeTokenByZoneID
{
  return self->_supplementalChangeTokenByZoneID;
}

- (void)setServerChangeTokenUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (void)setRecordDeletedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (void)setRecordChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (id)serverChangeTokenUpdatedBlock
{
  return self->_serverChangeTokenUpdatedBlock;
}

- (id)recordChangedBlock
{
  return self->_recordChangedBlock;
}

- (id)pipeliningDescription
{
  return CFSTR("fetchAllZoneChanges");
}

- (int)operationType
{
  return 213;
}

- (CKDFetchRecordZoneChangesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t AssetContents;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t AllChanges;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  CKDFetchRecordZoneChangesOperation *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSDictionary *supplementalChangeTokenByZoneID;
  const char *v45;
  uint64_t v46;
  NSString *v47;
  Class v48;
  uint64_t v49;
  const char *v50;
  objc_super v52;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend_takeValuesFrom_(v8, v9, (uint64_t)v6);
  objc_msgSend_recordZoneIDs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(v8, v13, (uint64_t)v12);

  objc_msgSend_configurationsByRecordZoneID(v6, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConfigurationsByRecordZoneID_(v8, v17, (uint64_t)v16);

  AssetContents = objc_msgSend_shouldFetchAssetContents(v6, v18, v19);
  objc_msgSend_setShouldFetchAssetContents_(v8, v21, AssetContents);
  AllChanges = objc_msgSend_fetchAllChanges(v6, v22, v23);
  objc_msgSend_setFetchAllChanges_(v8, v25, AllChanges);
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v6, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v8, v29, (uint64_t)v28);

  v32 = objc_msgSend_forcePCSDecryptionAttempt(v6, v30, v31);
  objc_msgSend_setForcePCSDecryptionAttempt_(v8, v33, v32);
  v36 = objc_msgSend_errorReportingStyle(v6, v34, v35);
  objc_msgSend_setErrorReportingStyle_(v8, v37, v36);
  v52.receiver = self;
  v52.super_class = (Class)CKDFetchRecordZoneChangesOperation;
  v38 = -[CKDFetchBatchedRecordsOperation initWithOperationInfo:container:](&v52, sel_initWithOperationInfo_container_, v8, v7);

  if (v38)
  {
    v38->_changeTypes = objc_msgSend_changeTypes(v6, v39, v40);
    objc_msgSend_supplementalChangeTokenByZoneID(v6, v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    supplementalChangeTokenByZoneID = v38->_supplementalChangeTokenByZoneID;
    v38->_supplementalChangeTokenByZoneID = (NSDictionary *)v43;

    objc_msgSend_ckOperationClassName(v6, v45, v46);
    v47 = (NSString *)objc_claimAutoreleasedReturnValue();
    v48 = NSClassFromString(v47);
    v49 = objc_opt_class();
    v38->_clientIsUsingLegacyCKFetchRecordChangesOperationAPI = objc_msgSend_isSubclassOfClass_(v48, v50, v49) ^ 1;

  }
  return v38;
}

- (BOOL)clientIsUsingLegacyCKFetchRecordChangesOperationAPI
{
  return self->_clientIsUsingLegacyCKFetchRecordChangesOperationAPI;
}

- (int64_t)changeTypes
{
  return self->_changeTypes;
}

- (id)analyticsPayload
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t AllChanges;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t AssetContents;
  const char *v31;
  void *v32;
  const char *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CKDFetchRecordZoneChangesOperation;
  -[CKDDatabaseOperation analyticsPayload](&v35, sel_analyticsPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_operationInfo(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordZoneIDs(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v10, v11, v12);
  objc_msgSend_numberWithUnsignedInteger_(v4, v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)v15, 0x1E784B5C8);

  v17 = (void *)MEMORY[0x1E0CB37E8];
  AllChanges = objc_msgSend_fetchAllChanges(self, v18, v19);
  objc_msgSend_numberWithBool_(v17, v21, AllChanges);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v22, 0x1E784B5E8);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_operationInfo(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  AssetContents = objc_msgSend_shouldFetchAssetContents(v27, v28, v29);
  objc_msgSend_numberWithBool_(v24, v31, AssetContents);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, 0x1E784B588);

  return v3;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-record-changes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (id)_optionsForZonesWithPendingChangesAfterRequest:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  void *v23;
  const char *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, CFSTR("CKDFetchRecordZoneChangesOperation.m"), 162, &stru_1E7838F48);

  }
  v8 = v5;
  v9 = (void *)objc_opt_new();
  objc_msgSend_zoneErrorsByZoneID(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resultsByRecordZoneID(v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1BE9C1050;
  v25[3] = &unk_1E7836C48;
  v26 = v12;
  v27 = v8;
  v16 = v9;
  v28 = v16;
  v17 = v8;
  v18 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v15, v19, (uint64_t)v25);

  v20 = v28;
  v21 = v16;

  return v21;
}

- (void)_noteOperationFinishedBlockEnd
{
  uint64_t v2;

  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
}

- (void)_noteOperationBeginning
{
  uint64_t v2;

  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
}

- (void)_noteCompletedURLRequest:(id)a3 withSchedulerInfo:(id)a4
{
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
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  _BOOL4 v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
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
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  _BOOL4 v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  id v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  NSObject *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  void *v107;
  const char *v108;
  __int128 v109;
  void *v110;
  id v111;
  id v112;
  id obj;
  void *v114;
  _QWORD block[5];
  id v116;
  id v117;
  id v118;
  id v119;
  _QWORD v120[4];
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  uint8_t buf[4];
  uint64_t v128;
  __int16 v129;
  void *v130;
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v111 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v107, v108, (uint64_t)a2, self, CFSTR("CKDFetchRecordZoneChangesOperation.m"), 67, &stru_1E7838F48);

  }
  v112 = v7;
  objc_msgSend_container(self, v10, v11);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordZoneIDs(v112, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resultsByRecordZoneID(v112, v15, v16);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneErrorsByZoneID(v112, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = v14;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v122, v131, 16);
  if (v22)
  {
    v24 = *(_QWORD *)v123;
    *(_QWORD *)&v23 = 138412290;
    v109 = v23;
    while (2)
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v123 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * v25);
        objc_msgSend_objectForKeyedSubscript_(v19, v21, v26, v109);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_CKIsNotFoundError(v27, v28, v29))
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v32 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
          {
            v35 = v32;
            objc_msgSend_operationID(self, v36, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v128 = v26;
            v129 = 2114;
            v130 = v38;
            _os_log_impl(&dword_1BE990000, v35, OS_LOG_TYPE_INFO, "Warn: Zone %@ wasn't found on the server for fetch changes request %{public}@. Wiping caches for that zone", buf, 0x16u);

          }
          objc_msgSend_options(v114, v33, v34);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_useAnonymousToServerShareParticipants(v39, v40, v41))
          {
            v44 = objc_msgSend_databaseScope(self, v42, v43) == 3;

            if (v44)
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v47 = *MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v109;
                v128 = v26;
                _os_log_debug_impl(&dword_1BE990000, v47, OS_LOG_TYPE_DEBUG, "Possible anonymous share %@ not found. Removing share from anonymous share list", buf, 0xCu);
              }
              objc_initWeak((id *)buf, self);
              objc_msgSend_fetchRecordsGroup(self, v48, v49);
              v50 = objc_claimAutoreleasedReturnValue();
              dispatch_group_enter(v50);

              objc_msgSend_anonymousSharingManager(v114, v51, v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v126 = v26;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v54, (uint64_t)&v126, 1);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v120[0] = MEMORY[0x1E0C809B0];
              v120[1] = 3221225472;
              v120[2] = sub_1BEBD977C;
              v120[3] = &unk_1E78309E8;
              objc_copyWeak(&v121, (id *)buf);
              objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v53, v56, (uint64_t)v55, self, v120);

              objc_destroyWeak(&v121);
              objc_destroyWeak((id *)buf);
            }
          }
          else
          {

          }
          objc_msgSend_container(self, v45, v46);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordCache(v57, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clearAllRecordsForZoneWithID_(v60, v61, v26);

          objc_msgSend_setPCSData_forFetchedZoneID_(self, v62, 0, v26);
          objc_msgSend_pcsCache(v114, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removePCSDataForItemsInZoneWithID_(v65, v66, v26);

        }
        if (objc_msgSend_clientIsUsingLegacyCKFetchRecordChangesOperationAPI(self, v30, v31))
        {
          objc_msgSend_error(self, v67, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v69 == 0;

          if (v70)
          {
            objc_msgSend_setError_(self, v71, (uint64_t)v27);

            goto LABEL_28;
          }
        }

        ++v25;
      }
      while (v22 != v25);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v122, v131, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_28:

  objc_msgSend_error(self, v72, v73);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
    goto LABEL_31;
  if (objc_msgSend_clientIsUsingLegacyCKFetchRecordChangesOperationAPI(self, v74, v75))
  {
    objc_msgSend_firstObject(obj, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v110, v80, (uint64_t)v79);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = objc_alloc(MEMORY[0x1E0C95100]);
    objc_msgSend_resultServerChangeTokenData(v76, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (void *)objc_msgSend_initWithData_(v81, v85, (uint64_t)v84);
    objc_msgSend_setResultServerChangeToken_(self, v87, (uint64_t)v86);

    objc_msgSend_resultClientChangeTokenData(v76, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setResultClientChangeTokenData_(self, v91, (uint64_t)v90);

    v94 = objc_msgSend_status(v76, v92, v93);
    objc_msgSend_setResultStatus_(self, v95, v94);
LABEL_31:

  }
  objc_msgSend_fetchRecordsGroup(self, v77, v78);
  v96 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v96);

  objc_msgSend_perRequestCallbackGroup(v111, v97, v98);
  v99 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_perRequestCallbackQueue(v111, v100, v101);
  v102 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBD988C;
  block[3] = &unk_1E782E490;
  block[4] = self;
  v116 = obj;
  v117 = v110;
  v118 = v19;
  v119 = v111;
  v103 = v111;
  v104 = v19;
  v105 = v110;
  v106 = obj;
  dispatch_group_notify(v99, v102, block);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend_setRecordChangedBlock_(self, v5, 0);
  objc_msgSend_setRecordDeletedBlock_(self, v6, 0);
  objc_msgSend_setZoneAttributesChangedBlock_(self, v7, 0);
  v8.receiver = self;
  v8.super_class = (Class)CKDFetchRecordZoneChangesOperation;
  -[CKDFetchBatchedRecordsOperation _finishOnCallbackQueueWithError:](&v8, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)_createAndConfigureURLRequestForZoneIDs:(id)a3 optionsByZoneID:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  CKDFetchRecordZoneChangesURLRequest *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t ChangesForMergeableValues;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t AssetContents;
  const char *v51;
  CKDPipeliningInfo *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id location;
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  const __CFString *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v68 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v11 = objc_msgSend_count(v6, v9, v10);
    v14 = objc_msgSend_count(v6, v12, v13);
    v15 = CFSTR("s");
    *(_DWORD *)buf = 134218498;
    v82 = v11;
    if (v14 == 1)
      v15 = &stru_1E7838F48;
    v83 = 2114;
    v84 = v15;
    v85 = 2112;
    v86 = v68;
    _os_log_impl(&dword_1BE990000, v8, OS_LOG_TYPE_INFO, "Fetching changes from the server for %lu zone%{public}@ with options:\n%@", buf, 0x20u);

  }
  v16 = [CKDFetchRecordZoneChangesURLRequest alloc];
  v18 = (void *)objc_msgSend_initWithOperation_recordZoneIDs_configurationsByRecordZoneID_(v16, v17, (uint64_t)self, v6, v68);
  v21 = objc_msgSend_changeTypes(self, v19, v20);
  objc_msgSend_setChangeTypes_(v18, v22, v21);
  objc_msgSend_supplementalChangeTokenByZoneID(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSupplementalChangeTokenByZoneID_(v18, v26, (uint64_t)v25);

  objc_msgSend_container(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(v32, v33, v34);
  objc_msgSend_setFetchChangesForMergeableValues_(v18, v36, ChangesForMergeableValues);

  objc_msgSend_desiredAssetKeys(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_count(v39, v40, v41);

  if (v42)
  {
    objc_msgSend_desiredAssetKeys(self, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend_copy(v45, v46, v47);
    objc_msgSend_setDesiredAssetKeys_(v18, v49, (uint64_t)v48);

  }
  else
  {
    AssetContents = objc_msgSend_shouldFetchAssetContents(self, v43, v44);
    objc_msgSend_setShouldFetchAssetContent_(v18, v51, AssetContents);
  }
  objc_initWeak((id *)buf, self);
  v52 = [CKDPipeliningInfo alloc];
  v54 = (void *)objc_msgSend_initWithRequest_operation_(v52, v53, (uint64_t)v18, self);
  objc_initWeak(&location, v54);
  objc_msgSend_recordChangedBlock(self, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = MEMORY[0x1E0C809B0];
  if (v57)
  {
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = sub_1BE9C0AEC;
    v77[3] = &unk_1E78309C0;
    objc_copyWeak(&v78, (id *)buf);
    objc_copyWeak(&v79, &location);
    objc_msgSend_setRecordsChangedBlock_(v18, v59, (uint64_t)v77);
    objc_destroyWeak(&v79);
    objc_destroyWeak(&v78);
  }
  v74[0] = v58;
  v74[1] = 3221225472;
  v74[2] = sub_1BEBD9D74;
  v74[3] = &unk_1E7836C70;
  objc_copyWeak(&v75, (id *)buf);
  objc_copyWeak(&v76, &location);
  objc_msgSend_setRecordDeletedBlock_(v18, v60, (uint64_t)v74);
  v71[0] = v58;
  v71[1] = 3221225472;
  v71[2] = sub_1BE9C0A80;
  v71[3] = &unk_1E7836C98;
  objc_copyWeak(&v72, (id *)buf);
  objc_copyWeak(&v73, &location);
  objc_msgSend_setZoneAttributesChangedBlock_(v18, v61, (uint64_t)v71);
  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v62, (uint64_t)v6);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v63, v64, v65))
  {
    v69[0] = v58;
    v69[1] = 3221225472;
    v69[2] = sub_1BEBD9DF4;
    v69[3] = &unk_1E78305B0;
    v70 = v63;
    objc_msgSend_updateCloudKitMetrics_(self, v66, (uint64_t)v69);

  }
  objc_destroyWeak(&v73);
  objc_destroyWeak(&v72);
  objc_destroyWeak(&v76);
  objc_destroyWeak(&v75);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v54;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, 0);
  objc_storeStrong((id *)&self->_resultClientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_resultServerChangeToken, 0);
  objc_storeStrong(&self->_serverChangeTokenUpdatedBlock, 0);
  objc_storeStrong(&self->_zoneAttributesChangedBlock, 0);
  objc_storeStrong(&self->_recordDeletedBlock, 0);
  objc_storeStrong(&self->_recordChangedBlock, 0);
}

- (void)_noteChangedRecordWithID:(id)a3 record:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_recordChangedBlock(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_recordChangedBlock(self, v13, v14);
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v15)[2](v15, v16, v8, v9);

  }
}

- (void)_noteDeletedRecordWithID:(id)a3 recordType:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend_recordDeletedBlock(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_recordDeletedBlock(self, v10, v11);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v12)[2](v12, v13, v6);

  }
}

- (void)_noteAttributesChangedForZone:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a3;
  objc_msgSend_zoneAttributesChangedBlock(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_zoneAttributesChangedBlock(self, v7, v8);
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v9)[2](v9, v10);

  }
}

- (void)_noteOperationEnding
{
  uint64_t v2;

  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
}

- (id)recordDeletedBlock
{
  return self->_recordDeletedBlock;
}

- (id)zoneAttributesChangedBlock
{
  return self->_zoneAttributesChangedBlock;
}

- (void)setZoneAttributesChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (CKServerChangeToken)resultServerChangeToken
{
  return self->_resultServerChangeToken;
}

- (void)setResultServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_resultServerChangeToken, a3);
}

- (NSData)resultClientChangeTokenData
{
  return self->_resultClientChangeTokenData;
}

- (void)setResultClientChangeTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_resultClientChangeTokenData, a3);
}

- (int64_t)resultStatus
{
  return self->_resultStatus;
}

- (void)setResultStatus:(int64_t)a3
{
  self->_resultStatus = a3;
}

- (void)setChangeTypes:(int64_t)a3
{
  self->_changeTypes = a3;
}

- (void)setClientIsUsingLegacyCKFetchRecordChangesOperationAPI:(BOOL)a3
{
  self->_clientIsUsingLegacyCKFetchRecordChangesOperationAPI = a3;
}

- (void)setSupplementalChangeTokenByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, a3);
}

@end
