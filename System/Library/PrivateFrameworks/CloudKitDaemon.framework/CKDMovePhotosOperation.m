@implementation CKDMovePhotosOperation

- (CKDMovePhotosOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  CKDMovePhotosOperation *v19;
  const char *v20;
  uint64_t v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend_moveChanges(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMap_(v10, v11, (uint64_t)&unk_1E7833268);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setRecordsToSave_(v6, v13, (uint64_t)v12);
  objc_msgSend_moveChanges(v6, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMapToDictionary_(v16, v17, (uint64_t)&unk_1E78332A8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_moveChangesByDestinationRecordID, v18);
  v23.receiver = self;
  v23.super_class = (Class)CKDMovePhotosOperation;
  v19 = -[CKDModifyRecordsOperation initWithOperationInfo:container:](&v23, sel_initWithOperationInfo_container_, v6, v7);

  if (v19)
  {
    objc_storeStrong((id *)&v19->_moveChangesByDestinationRecordID, v18);
    v19->_sourceDatabaseScope = objc_msgSend_sourceDatabaseScope(v6, v20, v21);
  }

  return v19;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/move-photos", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (int)operationType
{
  return 218;
}

- (id)handlerForSaveWithRecord:(id)a3
{
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
  void *v15;
  void *v17;
  const char *v18;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("CKDMovePhotosOperation.m"), 87, CFSTR("Not expected to move shares"));

  }
  objc_msgSend_moveChangesByDestinationRecordID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_moveHandlerWithMoveChange_operation_(CKDMoveRecordHandler, v14, (uint64_t)v13, self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)handlerForDeleteWithRecordID:(id)a3
{
  void *v5;
  const char *v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, CFSTR("CKDMovePhotosOperation.m"), 93, CFSTR("Not expected to delete records in a move"));

  return 0;
}

- (void)callbackWithMetadata:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  const char *v15;
  _QWORD block[5];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKDMovePhotosOperation.m"), 100, CFSTR("How'd a move operation get a non-move handler?"));

  }
  objc_msgSend_callbackQueue(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAEB788;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v17 = v7;
  v18 = v8;
  v12 = v8;
  v13 = v7;
  dispatch_async(v11, block);

}

- (void)moveCallbackWithMetadata:(id)a3 error:(id)a4
{
  id v7;
  id v8;
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
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v30;
  uint64_t v31;
  void (**v32)(_QWORD, _QWORD, double);
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
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
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  id v62;
  const char *v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  void *v74;
  void *v75;
  _QWORD v76[5];
  id v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  __CFString *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend_moveChange(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sourceRecordID(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_saveCompletionBlockCalled(v7, v15, v16))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v72, v73, (uint64_t)a2, self, CFSTR("CKDMovePhotosOperation.m"), 108, CFSTR("moveCallbackWithMetadata:error: called twice on %@"), v14);

  }
  objc_msgSend_serverDestinationRecord(v7, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_streamingAssetRequestOptions(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStreamingAssetRequestOptions_(v19, v23, (uint64_t)v22);

  if (v8)
  {
    objc_msgSend_moveCompletionBlock(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_13;
    objc_msgSend_moveCompletionBlock(self, v27, v28);
    v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD, id))v29)[2](v29, v14, 0, 0, 0, v8);
    goto LABEL_12;
  }
  objc_msgSend_error(v7, v24, v25);
  v32 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  if (v32)
    goto LABEL_9;
  objc_msgSend_saveProgressBlock(self, v30, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend_saveProgressBlock(self, v34, v35);
    v32 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, double))v32)[2](v32, v14, 1.0);
LABEL_9:

  }
  objc_msgSend_moveCompletionBlock(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
    goto LABEL_13;
  objc_msgSend_moveCompletionBlock(self, v27, v28);
  v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend_moveChange(v7, v37, v38);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sourceRecordID(v74, v39, v40);
  v75 = v14;
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_moveChange(v7, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_destinationRecord(v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverDestinationRecord(v7, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverMoveMarkerRecord(v7, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v7, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, void *, void *, void *))v29)[2](v29, v41, v47, v50, v53, v56);

  v14 = v75;
LABEL_12:

LABEL_13:
  if (objc_msgSend_didAttemptZoneWideShareKeyRoll(v7, v27, v28))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v59 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v64 = v59;
      objc_msgSend_operationID(self, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v67;
      v80 = 2114;
      v81 = CFSTR("com.apple.cloudkit.dugongKeyRollOperationFinished");
      _os_log_debug_impl(&dword_1BE990000, v64, OS_LOG_TYPE_DEBUG, "Operation %{public}@ sending CoreAnalytics event %{public}@", buf, 0x16u);

      if (v8)
        goto LABEL_18;
    }
    else if (v8)
    {
LABEL_18:
      v62 = v8;
LABEL_21:
      v68 = v62;
      objc_msgSend_dugongKeyRollAnalyticsPayloadWithError_(self, v63, (uint64_t)v62);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      goto LABEL_22;
    }
    objc_msgSend_error(v7, v60, v61);
    v62 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_22:
  if (!v8)
  {
    objc_msgSend_error(v7, v57, v58);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v70)
    {
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = sub_1BEAEBBBC;
      v76[3] = &unk_1E78332D0;
      v76[4] = self;
      v77 = v7;
      objc_msgSend_updateCloudKitMetrics_(self, v71, (uint64_t)v76);

    }
  }
  objc_msgSend_setSaveCompletionBlockCalled_(v7, v57, 1);

}

- (id)_createModifyRequestWithRecordsToSave:(id)a3 recordsToDelete:(id)a4 recordsToDeleteToEtags:(id)a5 recordIDsToDeleteToSigningPCSIdentity:(id)a6 handlersByRecordID:(id)a7 sendMergeableDeltas:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  CKDMovePhotosURLRequest *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[5];
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = sub_1BEAEBF14;
  v49[3] = &unk_1E78332F8;
  v49[4] = self;
  objc_msgSend_CKMap_(v14, v20, (uint64_t)v49);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v15, v22, v23))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v24, v25);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, self, CFSTR("CKDMovePhotosOperation.m"), 162, CFSTR("How did a move operation decide to delete records?"));

  }
  if (objc_msgSend_count(v17, v24, v25))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, self, CFSTR("CKDMovePhotosOperation.m"), 163, CFSTR("How did a move operation decide to delete records?"));

  }
  if (objc_msgSend_count(v16, v26, v27))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v28, v29);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, self, CFSTR("CKDMovePhotosOperation.m"), 164, CFSTR("How did a move operation decide to delete records?"));

  }
  v30 = [CKDMovePhotosURLRequest alloc];
  v33 = objc_msgSend_sourceDatabaseScope(self, v31, v32);
  v36 = objc_msgSend_atomic(self, v34, v35);
  v38 = (void *)objc_msgSend_initWithOperation_moveChanges_sourceDatabaseScope_atomic_(v30, v37, (uint64_t)self, v21, v33, v36);
  v47[0] = v19;
  v47[1] = 3221225472;
  v47[2] = sub_1BEAEBF84;
  v47[3] = &unk_1E7833320;
  objc_copyWeak(&v48, &location);
  objc_msgSend_setRecordPostedBlock_(v38, v39, (uint64_t)v47);
  objc_destroyWeak(&v48);

  objc_destroyWeak(&location);
  return v38;
}

- (void)_handleRecordMoved:(id)a3 handler:(id)a4 responseCode:(id)a5 recordForOplockFailure:(id)a6 destinationServerRecord:(id)a7 moveMarkerServerRecord:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  NSObject *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  _QWORD block[4];
  id v54;
  CKDMovePhotosOperation *v55;
  id v56;
  id v57;
  id v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  _QWORD v63[4];
  id v64;
  NSObject *v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD v68[4];
  id v69;
  NSObject *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[5];
  id v78;
  _QWORD v79[5];
  id v80;
  uint8_t buf[4];
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = sub_1BE9BB038;
  v79[4] = sub_1BE9BADD0;
  v20 = v18;
  v80 = v20;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x3032000000;
  v77[3] = sub_1BE9BB038;
  v77[4] = sub_1BE9BADD0;
  v21 = v19;
  v78 = v21;
  objc_msgSend_stateTransitionGroup(self, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v24);

  v25 = dispatch_group_create();
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = sub_1BE9BB038;
  v75[4] = sub_1BE9BADD0;
  v76 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = sub_1BE9BB038;
  v73[4] = sub_1BE9BADD0;
  v74 = 0;
  if ((objc_msgSend_hasPropertiesRequiringEncryption(v20, v26, v27) & 1) != 0
    || objc_msgSend_hasPropertiesRequiringEncryption(v21, v28, v29))
  {
    if (objc_msgSend_hasPropertiesRequiringEncryption(v20, v28, v29))
    {
      dispatch_group_enter(v25);
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v32 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_recordID(v20, v33, v34);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v82 = v51;
        _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Decrypting destination record %@ returned from move", buf, 0xCu);

      }
      objc_msgSend_recordDecryptOperation(self, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = sub_1BEAEC5CC;
      v68[3] = &unk_1E7833348;
      v69 = v20;
      v71 = v75;
      v72 = v79;
      v70 = v25;
      objc_msgSend_decryptRecord_withCompletion_(v37, v38, (uint64_t)v69, v68);

    }
    if (objc_msgSend_hasPropertiesRequiringEncryption(v21, v30, v31))
    {
      dispatch_group_enter(v25);
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v39 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_recordID(v21, v40, v41);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v82 = v52;
        _os_log_debug_impl(&dword_1BE990000, v39, OS_LOG_TYPE_DEBUG, "Decrypting move marker record %@ returned from move", buf, 0xCu);

      }
      objc_msgSend_recordDecryptOperation(self, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = sub_1BEAEC778;
      v63[3] = &unk_1E7833348;
      v64 = v21;
      v66 = v73;
      v67 = v77;
      v65 = v25;
      objc_msgSend_decryptRecord_withCompletion_(v44, v45, (uint64_t)v64, v63);

    }
  }
  objc_msgSend_callbackQueue(self, v28, v29);
  v46 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAEC924;
  block[3] = &unk_1E7833370;
  v54 = v15;
  v55 = self;
  v56 = v14;
  v57 = v16;
  v58 = v17;
  v59 = v75;
  v60 = v73;
  v61 = v79;
  v62 = v77;
  v47 = v17;
  v48 = v16;
  v49 = v14;
  v50 = v15;
  dispatch_group_notify(v25, v46, block);

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(v79, 8);

}

- (void)_reallyHandleRecordMoved:(id)a3 handler:(id)a4 responseCode:(id)a5 recordForOplockFailure:(id)a6 destinationServerRecord:(id)a7 moveMarkerServerRecord:(id)a8
{
  __CFString *v14;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  int v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
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
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  int hasType;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  int v75;
  const char *v76;
  uint64_t v77;
  NSObject *v78;
  const char *v79;
  id v80;
  NSObject *v81;
  const char *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  int v99;
  const char *v100;
  uint64_t v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  CKDMovePhotosOperation *v107;
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
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  int v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  NSObject *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  __CFString *v162;
  uint64_t v163;
  const char *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  void *v169;
  const char *v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  int v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  void *v184;
  const char *v185;
  char hasPrefix;
  const char *v187;
  uint64_t v188;
  int v189;
  const __CFString *v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  int v194;
  const char *v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  const char *v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  char v227;
  const char *v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  int v236;
  CKDMovePhotosOperation *v237;
  NSObject *v238;
  void *v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  NSObject *v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  int hasTypeCode;
  const char *v270;
  uint64_t v271;
  void *v272;
  uint64_t v273;
  void *v274;
  void *v275;
  const char *v276;
  void *v277;
  const char *v278;
  const char *v279;
  void *v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  int hasMovedRecordDestinationIdentifier;
  const char *v297;
  uint64_t v298;
  void *v299;
  const char *v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  void *v305;
  const char *v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  uint64_t v310;
  void *v311;
  const char *v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  int hasOplockFailure;
  id v326;
  id v327;
  const char *v328;
  uint64_t v329;
  const char *v330;
  uint64_t v331;
  void *v332;
  const char *v333;
  uint64_t v334;
  void *v335;
  NSObject *v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  void *v340;
  void *v341;
  id v342;
  const char *v343;
  void *v344;
  uint64_t v345;
  uint64_t v346;
  const char *v347;
  uint64_t v348;
  __CFString *v349;
  void *v350;
  const char *v351;
  uint64_t v352;
  id v353;
  void *v354;
  const char *v355;
  NSObject *v356;
  const char *v357;
  uint64_t v358;
  __CFString *v359;
  id v360;
  __CFString *v361;
  void *v362;
  void *v363;
  void *v364;
  id v365;
  id v366;
  id v367;
  void *v368;
  id v369;
  void *v370;
  CKDMovePhotosOperation *v371;
  void *v372;
  _QWORD v373[4];
  id v374;
  id v375;
  __CFString *v376;
  __CFString *v377;
  CKDMovePhotosOperation *v378;
  id v379;
  _QWORD aBlock[4];
  id v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  uint8_t v386[128];
  uint8_t buf[4];
  const __CFString *v388;
  __int16 v389;
  __CFString *v390;
  uint64_t v391;

  v391 = *MEMORY[0x1E0C80C00];
  v14 = (__CFString *)a3;
  v15 = a4;
  v16 = (__CFString *)a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend_container(self, v20, v21);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_handlersByRecordID(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(v26, v27, v28);
    v372 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v372 = 0;
  }
  objc_msgSend_setServerDestinationRecord_(v15, v22, (uint64_t)v18);
  objc_msgSend_setServerMoveMarkerRecord_(v15, v29, (uint64_t)v19);
  v32 = objc_msgSend_code(v16, v30, v31);
  if (!v14 || v32 != 1)
  {
    v368 = v17;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v369 = v19;
    v57 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v388 = v14;
      v389 = 2112;
      v390 = v16;
      _os_log_impl(&dword_1BE990000, v57, OS_LOG_TYPE_INFO, "Error when moving record %@: %@", buf, 0x16u);
    }
    objc_msgSend_error(v16, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    hasType = objc_msgSend_hasType(v63, v64, v65);

    if (hasType)
    {
      objc_msgSend_error(v16, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clientError(v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend_type(v72, v73, v74);

      if (v75 == 52)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v19 = v369;
        v78 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v388 = v14;
          v79 = "Record PCS etag failed for record %@";
LABEL_38:
          _os_log_impl(&dword_1BE990000, v78, OS_LOG_TYPE_INFO, v79, buf, 0xCu);
          v363 = 0;
          goto LABEL_39;
        }
        goto LABEL_41;
      }
      objc_msgSend_error(v16, v76, v77);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clientError(v93, v94, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend_type(v96, v97, v98);

      if (v99 == 53)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v19 = v369;
        v78 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v388 = v14;
          v79 = "Zone PCS etag failed for record %@";
          goto LABEL_38;
        }
LABEL_41:
        v363 = 0;
        goto LABEL_42;
      }
      objc_msgSend_error(v16, v100, v101);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clientError(v171, v172, v173);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = objc_msgSend_type(v174, v175, v176);

      objc_msgSend_error(v16, v178, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = v180;
      if (v177 == 15)
      {
        objc_msgSend_errorDescription(v180, v181, v182);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        hasPrefix = objc_msgSend_hasPrefix_(v184, v185, (uint64_t)CFSTR("Record PCS oplock failed"));

        if ((hasPrefix & 1) != 0)
        {
          v189 = 1;
          v190 = CFSTR("Record");
        }
        else
        {
          objc_msgSend_error(v16, v187, v188);
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorDescription(v222, v223, v224);
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          v227 = objc_msgSend_hasPrefix_(v225, v226, (uint64_t)CFSTR("Zone PCS oplock failed"));

          if ((v227 & 1) != 0)
          {
            v189 = 1;
            v190 = CFSTR("Zone");
          }
          else
          {
            objc_msgSend_error(v16, v228, v229);
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorDescription(v252, v253, v254);
            v255 = (void *)objc_claimAutoreleasedReturnValue();
            v189 = objc_msgSend_hasPrefix_(v255, v256, (uint64_t)CFSTR("Share Etag Oplock failure"));

            if (v189)
              v190 = CFSTR("Share");
            else
              v190 = CFSTR("Unknown");
          }
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v257 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v388 = v190;
          v389 = 2112;
          v390 = v14;
          _os_log_impl(&dword_1BE990000, v257, OS_LOG_TYPE_INFO, "%{public}@ oplock failed for record %@", buf, 0x16u);
        }
        if (v189)
        {
          v363 = 0;
          v19 = v369;
LABEL_39:
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
LABEL_42:
          v102 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v388 = v14;
            _os_log_impl(&dword_1BE990000, v102, OS_LOG_TYPE_INFO, "Handling error for record %@ as an oplock failure", buf, 0xCu);
          }
          if (objc_msgSend_retryPCSFailures(self, v103, v104))
          {
            v107 = self;
            objc_msgSend_clearProtectionDataForRecord(v15, v105, v106);
            objc_msgSend_recordID(v372, v108, v109);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_zoneID(v110, v111, v112);
            v113 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v113)
            {
              v37 = v372;
              objc_msgSend_setState_(v15, v114, 13);
              goto LABEL_62;
            }
            v365 = v18;
            v360 = v15;
            v361 = v14;
            v384 = 0u;
            v385 = 0u;
            v383 = 0u;
            v382 = 0u;
            objc_msgSend_modifyHandlersByZoneID(self, v114, v115);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v372, v117, v118);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_zoneID(v119, v120, v121);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v116, v123, (uint64_t)v122);
            v124 = (void *)objc_claimAutoreleasedReturnValue();

            v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v382, v386, 16);
            if (v126)
            {
              v127 = v126;
              v128 = *(_QWORD *)v383;
              do
              {
                v129 = 0;
                do
                {
                  if (*(_QWORD *)v383 != v128)
                    objc_enumerationMutation(v124);
                  v130 = *(void **)(*((_QWORD *)&v382 + 1) + 8 * v129);
                  if (*MEMORY[0x1E0C95300] != -1)
                    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                  v131 = (void *)*MEMORY[0x1E0C952B0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
                  {
                    v156 = v131;
                    objc_msgSend_record(v130, v157, v158);
                    v159 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_recordID(v159, v160, v161);
                    v162 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v388 = v162;
                    _os_log_debug_impl(&dword_1BE990000, v156, OS_LOG_TYPE_DEBUG, "Clearing zone PCS tag for record %@", buf, 0xCu);

                  }
                  objc_msgSend_record(v130, v132, v133);
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setZoneProtectionEtag_(v134, v135, 0);

                  objc_msgSend_record(v130, v136, v137);
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setShareEtag_(v138, v139, 0);

                  objc_msgSend_error(v16, v140, v141);
                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_clientError(v142, v143, v144);
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  v148 = objc_msgSend_type(v145, v146, v147);

                  if (v148 != 52)
                  {
                    objc_msgSend_record(v130, v149, v150);
                    v151 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_recordID(v151, v152, v153);
                    v154 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setPCSData_forFetchedRecordID_(v107, v155, 0, v154);

                  }
                  ++v129;
                }
                while (v127 != v129);
                v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v149, (uint64_t)&v382, v386, 16);
              }
              while (v127);
            }

            v163 = 13;
            v15 = v360;
            v14 = v361;
            v18 = v365;
            v19 = v369;
          }
          else
          {
            v163 = 12;
          }
          v37 = v372;
          objc_msgSend_setState_(v15, v105, v163);
LABEL_62:
          v17 = v368;
          if (v363)
          {
            objc_msgSend_setError_(v15, v164, (uint64_t)v363);

            goto LABEL_115;
          }
          v165 = (void *)MEMORY[0x1E0C94FF8];
          v166 = *MEMORY[0x1E0C94B20];
          objc_msgSend_recordID(v37, v164, 0);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_format_(v165, v168, v166, 2037, 0, CFSTR("Error moving record %@ on server: Protection data didn't match"), v167);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setError_(v15, v170, (uint64_t)v169);

LABEL_114:
          v37 = v372;
          goto LABEL_115;
        }
      }
      else
      {
        objc_msgSend_clientError(v180, v181, v182);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        v194 = objc_msgSend_type(v191, v192, v193);

        if (v194 == 48)
        {
          objc_msgSend_container(self, v195, v196);
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordCache(v197, v198, v199);
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneID(v14, v201, v202);
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clearAllRecordsForZoneWithID_(v200, v204, (uint64_t)v203);

          if (objc_msgSend_databaseScope(self, v205, v206) != 1)
          {
            objc_msgSend_recordID(v372, v67, v68);
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_zoneID(v207, v208, v209);
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPCSData_forFetchedZoneID_(self, v211, 0, v210);

            objc_msgSend_pcsCache(v370, v212, v213);
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v372, v215, v216);
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_zoneID(v217, v218, v219);
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removePCSDataForItemsInZoneWithID_(v214, v221, (uint64_t)v220);

          }
        }
        else
        {
          objc_msgSend_error(v16, v195, v196);
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clientError(v230, v231, v232);
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          v236 = objc_msgSend_type(v233, v234, v235);

          if (v236 == 64)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v237 = self;
            v366 = v18;
            v238 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BE990000, v238, OS_LOG_TYPE_INFO, "Record PCS chain was invalid", buf, 2u);
            }
            v239 = (void *)MEMORY[0x1E0C94FF8];
            v240 = *MEMORY[0x1E0C94B20];
            v241 = sub_1BEB10D5C(v16);
            objc_msgSend_recordID(v372, v242, v243);
            v244 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_error(v16, v245, v246);
            v247 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorDescription(v247, v248, v249);
            v250 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_format_(v239, v251, v240, v241, 0, CFSTR("Error moving record %@ on server: \"%@\"), v244, v250);
            v363 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = v366;
            v19 = v369;
            self = v237;
            goto LABEL_39;
          }
        }
      }
    }
    objc_msgSend_error(v16, v67, v68);
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_hasExtensionError(v258, v259, v260) & 1) != 0)
    {
      objc_msgSend_error(v16, v261, v262);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extensionError(v263, v264, v265);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      hasTypeCode = objc_msgSend_hasTypeCode(v266, v267, v268);

      if (hasTypeCode)
      {
        v272 = (void *)MEMORY[0x1E0C94FF8];
        v273 = *MEMORY[0x1E0C94B20];
        objc_msgSend_request(self, v270, v271);
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BEB10290(v274, v16);
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_format_(v272, v276, v273, 6000, v275, CFSTR("Plugin-Specific Error"));
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(v15, v278, (uint64_t)v277);

        objc_msgSend_setState_(v15, v279, 12);
LABEL_113:
        v19 = v369;
        goto LABEL_114;
      }
    }
    else
    {

    }
    v367 = v18;
    v371 = self;
    objc_msgSend_request(self, v270, v271);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v280, v16);
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    v284 = (void *)objc_msgSend_mutableCopy(v281, v282, v283);

    objc_msgSend_error(v16, v285, v286);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v287, v288, v289);
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_moveOplockFailure(v290, v291, v292);
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    hasMovedRecordDestinationIdentifier = objc_msgSend_hasMovedRecordDestinationIdentifier(v293, v294, v295);

    if (hasMovedRecordDestinationIdentifier)
    {
      objc_msgSend_translator(self, v297, v298);
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v16, v300, v301);
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clientError(v302, v303, v304);
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_moveOplockFailure(v305, v306, v307);
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_movedRecordDestinationIdentifier(v308, v309, v310);
      v311 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIDFromPRecordIdentifier_error_(v299, v312, (uint64_t)v311, 0);
      v313 = (void *)objc_claimAutoreleasedReturnValue();

      if (v313)
        objc_msgSend_setObject_forKeyedSubscript_(v284, v314, (uint64_t)v313, *MEMORY[0x1E0C949E8]);

    }
    v315 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1BEAEDCA8;
    aBlock[3] = &unk_1E782EDA8;
    v381 = v15;
    v316 = _Block_copy(aBlock);
    objc_msgSend_error(v16, v317, v318);
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v319, v320, v321);
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    hasOplockFailure = objc_msgSend_hasOplockFailure(v322, v323, v324);

    if (hasOplockFailure)
    {
      v364 = v316;
      v326 = v368;
      v327 = v372;
      v332 = (void *)objc_msgSend_copyWithOriginalValues(v327, v328, v329);
      if (v332)
        objc_msgSend_setObject_forKeyedSubscript_(v284, v330, (uint64_t)v332, *MEMORY[0x1E0C949A8]);
      if (v326)
        objc_msgSend_setObject_forKeyedSubscript_(v284, v330, (uint64_t)v326, *MEMORY[0x1E0C949B8]);
      if (v327)
        objc_msgSend_setObject_forKeyedSubscript_(v284, v330, (uint64_t)v327, *MEMORY[0x1E0C949B0]);
      if (objc_msgSend_hasPropertiesRequiringEncryption(v326, v330, v331))
      {
        v335 = v284;
        objc_msgSend_stateTransitionGroup(v371, v333, v334);
        v336 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v336);

        v362 = v332;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v17 = v368;
        v337 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v356 = v337;
          objc_msgSend_recordID(v326, v357, v358);
          v359 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v388 = v359;
          _os_log_debug_impl(&dword_1BE990000, v356, OS_LOG_TYPE_DEBUG, "Decrypting server record returned by oplock failure %@", buf, 0xCu);

        }
        objc_msgSend_recordDecryptOperation(v371, v338, v339);
        v340 = (void *)objc_claimAutoreleasedReturnValue();
        v373[0] = v315;
        v373[1] = 3221225472;
        v373[2] = sub_1BEAEDD04;
        v373[3] = &unk_1E7833398;
        v374 = v326;
        v375 = v335;
        v376 = v16;
        v377 = v14;
        v341 = v364;
        v378 = v371;
        v379 = v364;
        v342 = v326;
        objc_msgSend_decryptRecord_withCompletion_(v340, v343, (uint64_t)v342, v373);

        goto LABEL_112;
      }

      v316 = v364;
    }
    v344 = (void *)MEMORY[0x1E0C94FF8];
    v345 = *MEMORY[0x1E0C94B20];
    v346 = sub_1BEB10D5C(v16);
    objc_msgSend_error(v16, v347, v348);
    v349 = v14;
    v350 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v350, v351, v352);
    v335 = v284;
    v353 = v15;
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v344, v355, v345, v346, v335, CFSTR("Error moving record %@ on server: %@"), v349, v354);
    v327 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v353;
    v14 = v349;
    (*((void (**)(void *, id))v316 + 2))(v316, v327);
    v17 = v368;
    v341 = v316;
LABEL_112:

    v18 = v367;
    goto LABEL_113;
  }
  v33 = (void *)*MEMORY[0x1E0C952F8];
  v34 = *MEMORY[0x1E0C95300];
  if (!v372)
  {
    if (v34 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v33);
    v369 = v19;
    v80 = v18;
    v81 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v388 = v14;
      _os_log_error_impl(&dword_1BE990000, v81, OS_LOG_TYPE_ERROR, "Got a response for record with ID %@, but we didn't try to move that record.", buf, 0xCu);
    }
    objc_msgSend_setState_(v15, v82, 12);
    v83 = (void *)MEMORY[0x1E0C94FF8];
    v84 = *MEMORY[0x1E0C94B20];
    v85 = sub_1BEB10D5C(v16);
    objc_msgSend_request(self, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v88, v16);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v83, v90, v84, v85, v89, CFSTR("Got a response for record with ID %@, but we didn't try to move that record."), v14);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(v15, v92, (uint64_t)v91);

    v18 = v80;
    goto LABEL_113;
  }
  if (v34 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v33);
  v35 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v388 = v14;
    _os_log_impl(&dword_1BE990000, v35, OS_LOG_TYPE_INFO, "Record %@ was successfully moved on the server", buf, 0xCu);
  }
  objc_msgSend_setState_(v15, v36, 8);
  v37 = v372;
  objc_msgSend_setKnownToServer_(v372, v38, 1);
  objc_msgSend_setKnownToServer_(v19, v39, 1);
  objc_msgSend_etag(v18, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend_etag(v18, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEtag_(v372, v46, (uint64_t)v45);

  }
  objc_msgSend_creationDate(v18, v43, v44);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_creationDate(v18, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreationDate_(v372, v51, (uint64_t)v50);

  }
  objc_msgSend_modificationDate(v18, v48, v49);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend_modificationDate(v18, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setModificationDate_(v372, v56, (uint64_t)v55);

  }
  objc_msgSend_savePCSDataToCache(v15, v53, v54);
LABEL_115:

}

- (void)main
{
  void *v3;
  const char *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  CKDMovePhotosOperation *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v8, 1, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v13, 0, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v7;
    v20 = 2048;
    v21 = self;
    v22 = 2114;
    v23 = v12;
    v24 = 2112;
    v25 = v17;
    _os_log_debug_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEBUG, "Starting Move Photos operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v18,
      0x2Au);

  }
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  objc_super v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend_sourceZoneID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend_sourceZoneID(self, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithObject_(v10, v12, (uint64_t)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v13, v14, v15))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_1BEAEE294;
      v18[3] = &unk_1E78305B0;
      v19 = v13;
      objc_msgSend_updateCloudKitMetrics_(self, v16, (uint64_t)v18);

    }
  }
  objc_msgSend_setMoveCompletionBlock_(self, v8, 0);
  v17.receiver = self;
  v17.super_class = (Class)CKDMovePhotosOperation;
  -[CKDModifyRecordsOperation _finishOnCallbackQueueWithError:](&v17, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)moveCompletionBlock
{
  return self->_moveCompletionBlock;
}

- (void)setMoveCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (NSDictionary)moveChangesByDestinationRecordID
{
  return self->_moveChangesByDestinationRecordID;
}

- (void)setMoveChangesByDestinationRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 712);
}

- (CKRecordZoneID)sourceZoneID
{
  return self->_sourceZoneID;
}

- (void)setSourceZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 720);
}

- (int64_t)sourceDatabaseScope
{
  return self->_sourceDatabaseScope;
}

- (void)setSourceDatabaseScope:(int64_t)a3
{
  self->_sourceDatabaseScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceZoneID, 0);
  objc_storeStrong((id *)&self->_moveChangesByDestinationRecordID, 0);
  objc_storeStrong(&self->_moveCompletionBlock, 0);
}

@end
