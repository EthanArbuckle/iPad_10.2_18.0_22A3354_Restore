@implementation CKDFetchArchivedRecordsOperation

- (CKDFetchArchivedRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
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
  CKDFetchArchivedRecordsOperation *v30;
  objc_super v32;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend_takeValuesFrom_(v8, v9, (uint64_t)v7);
  objc_msgSend_recordZoneIDs(v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(v8, v13, (uint64_t)v12);

  objc_msgSend_configurationsByRecordZoneID(v7, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConfigurationsByRecordZoneID_(v8, v17, (uint64_t)v16);

  AssetContents = objc_msgSend_shouldFetchAssetContents(v7, v18, v19);
  objc_msgSend_setShouldFetchAssetContents_(v8, v21, AssetContents);
  AllChanges = objc_msgSend_fetchAllChanges(v7, v22, v23);
  objc_msgSend_setFetchAllChanges_(v8, v25, AllChanges);
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v7, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v8, v29, (uint64_t)v28);
  v32.receiver = self;
  v32.super_class = (Class)CKDFetchArchivedRecordsOperation;
  v30 = -[CKDFetchBatchedRecordsOperation initWithOperationInfo:container:](&v32, sel_initWithOperationInfo_container_, v8, v6);

  return v30;
}

- (NSString)pipeliningDescription
{
  return (NSString *)CFSTR("fetchArchivedRecords");
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-archived-records", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_noteCompletedURLRequest:(id)a3 withSchedulerInfo:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  const char *v64;
  void *v65;
  id v66;
  void *v67;
  _QWORD block[5];
  id v69;
  id v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v66 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v63, v64, (uint64_t)a2, self, CFSTR("CKDFetchArchivedRecordsOperation.m"), 49, &stru_1E7838F48);

  }
  v10 = v7;
  objc_msgSend_recordZoneIDs(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resultsByRecordZoneID(v10, v14, v15);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v10;
  objc_msgSend_zoneErrorsByZoneID(v10, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v19 = v13;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v73, v81, 16);
  if (v21)
  {
    v23 = v21;
    v24 = *(_QWORD *)v74;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v74 != v24)
          objc_enumerationMutation(v19);
        v26 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v25);
        objc_msgSend_objectForKeyedSubscript_(v18, v22, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_CKIsNotFoundError(v27, v28, v29))
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v30 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
          {
            v33 = v30;
            objc_msgSend_operationID(self, v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v78 = v26;
            v79 = 2114;
            v80 = v36;
            _os_log_impl(&dword_1BE990000, v33, OS_LOG_TYPE_INFO, "Warn: Zone %@ wasn't found on the server for fetch changes request %{public}@. Wiping caches for that zone", buf, 0x16u);

          }
          objc_msgSend_container(self, v31, v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordCache(v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clearAllRecordsForZoneWithID_(v40, v41, v26);

          objc_msgSend_setPCSData_forFetchedZoneID_(self, v42, 0, v26);
          objc_msgSend_container(self, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsCache(v45, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removePCSDataForItemsInZoneWithID_(v48, v49, v26);

        }
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v73, v81, 16);
    }
    while (v23);
  }

  objc_msgSend_fetchRecordsGroup(self, v50, v51);
  v52 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v52);

  objc_msgSend_perRequestCallbackGroup(v66, v53, v54);
  v55 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_perRequestCallbackQueue(v66, v56, v57);
  v58 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC72C98;
  block[3] = &unk_1E782E490;
  block[4] = self;
  v69 = v19;
  v70 = v65;
  v71 = v18;
  v72 = v66;
  v59 = v66;
  v60 = v18;
  v61 = v65;
  v62 = v19;
  dispatch_group_notify(v55, v58, block);

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
  objc_msgSend_recordFetchedBlock(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_recordFetchedBlock(self, v13, v14);
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v15)[2](v15, v16, v8, v9);

  }
}

- (void)_noteDeletedRecordWithID:(id)a3 recordType:(id)a4
{
  const char *v6;
  id v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v6, (uint64_t)a2, self, CFSTR("CKDFetchArchivedRecordsOperation.m"), 101, CFSTR("Not expected to get here"));

}

- (void)_noteAttributesChangedForZone:(id)a3
{
  const char *v5;
  id v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, CFSTR("CKDFetchArchivedRecordsOperation.m"), 105, CFSTR("Not expected to get here"));

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
  const char *v18;
  void *v19;
  id v20;
  void *v22;
  const char *v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, CFSTR("CKDFetchArchivedRecordsOperation.m"), 109, &stru_1E7838F48);

  }
  v8 = v5;
  v9 = (void *)objc_opt_new();
  objc_msgSend_zoneErrorsByZoneID(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resultsByRecordZoneID(v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1BEC73360;
  v24[3] = &unk_1E7838928;
  v25 = v12;
  v16 = v9;
  v26 = v16;
  v17 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v15, v18, (uint64_t)v24);

  v19 = v26;
  v20 = v16;

  return v20;
}

- (int)operationType
{
  return 217;
}

- (id)_createAndConfigureURLRequestForZoneIDs:(id)a3 optionsByZoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  CKDFetchArchivedRecordsURLRequest *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t AssetContents;
  const char *v29;
  CKDPipeliningInfo *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  _QWORD v38[4];
  id v39;
  id v40;
  id location;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    *(_DWORD *)buf = 134218242;
    v43 = objc_msgSend_count(v6, v10, v11);
    v44 = 2112;
    v45 = v7;
    _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Fetching archived records from the server for %lu zones with options:\n%@", buf, 0x16u);

  }
  v12 = [CKDFetchArchivedRecordsURLRequest alloc];
  v14 = (void *)objc_msgSend_initWithOperation_recordZoneIDs_configurationsByRecordZoneID_(v12, v13, (uint64_t)self, v6, v7);
  objc_msgSend_desiredAssetKeys(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_count(v17, v18, v19);

  if (v20)
  {
    objc_msgSend_desiredAssetKeys(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend_copy(v23, v24, v25);
    objc_msgSend_setDesiredAssetKeys_(v14, v27, (uint64_t)v26);

  }
  else
  {
    AssetContents = objc_msgSend_shouldFetchAssetContents(self, v21, v22);
    objc_msgSend_setShouldFetchAssetContent_(v14, v29, AssetContents);
  }
  objc_initWeak((id *)buf, self);
  v30 = [CKDPipeliningInfo alloc];
  v32 = (void *)objc_msgSend_initWithRequest_operation_(v30, v31, (uint64_t)v14, self);
  objc_initWeak(&location, v32);
  objc_msgSend_recordFetchedBlock(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = sub_1BEC736EC;
    v38[3] = &unk_1E7838950;
    objc_copyWeak(&v39, (id *)buf);
    objc_copyWeak(&v40, &location);
    objc_msgSend_setRecordFetchedBlock_(v14, v36, (uint64_t)v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v39);
  }
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v32;
}

- (void)_noteOperationBeginning
{
  uint64_t v2;

  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
}

- (void)_noteOperationEnding
{
  uint64_t v2;

  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
}

- (void)_noteOperationFinishedBlockEnd
{
  uint64_t v2;

  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setRecordFetchedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchArchivedRecordsOperation;
  -[CKDFetchBatchedRecordsOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)recordFetchedBlock
{
  return self->_recordFetchedBlock;
}

- (void)setRecordFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (id)serverChangeTokenUpdatedBlock
{
  return self->_serverChangeTokenUpdatedBlock;
}

- (void)setServerChangeTokenUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverChangeTokenUpdatedBlock, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
}

@end
