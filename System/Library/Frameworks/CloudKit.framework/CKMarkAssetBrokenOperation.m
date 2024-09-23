@implementation CKMarkAssetBrokenOperation

- (CKMarkAssetBrokenOperation)initWithNoRecord
{
  CKMarkAssetBrokenOperation *v2;
  const char *v3;
  uint64_t v4;

  v2 = (CKMarkAssetBrokenOperation *)(id)objc_msgSend_initWithRecordID_field_(self, a2, 0, 0);
  objc_msgSend_setTouchRepairZone_(v2, v3, 1, v4);

  return v2;
}

- (CKMarkAssetBrokenOperation)initWithRecordID:(id)a3 field:(id)a4
{
  return (CKMarkAssetBrokenOperation *)MEMORY[0x1E0DE7D20](self, sel_initWithRecordID_field_listIndex_, a3, a4);
}

- (CKMarkAssetBrokenOperation)initWithRecordID:(id)a3 field:(id)a4 listIndex:(int64_t)a5
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CKMarkAssetBrokenOperation *v15;
  int64_t v16;
  void *v18;
  const char *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKMarkAssetBrokenOperation;
  v15 = -[CKOperation init](&v20, sel_init);
  if (v15)
  {
    if ((v10 == 0) != (v11 == 0))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)v15, CFSTR("CKMarkAssetBrokenOperation.m"), 51, CFSTR("Expected both or none of recordID and field to be nil"));

    }
    objc_storeStrong((id *)&v15->_recordID, a3);
    objc_storeStrong((id *)&v15->_field, a4);
    if (a5 < 0)
      v16 = -1;
    else
      v16 = a5;
    v15->_listIndex = v16;
    v15->_touchRepairZone = 1;
    v15->_bypassPCSEncryptionForTouchRepairZone = 0;
    v15->_simulateCorruptAsset = 1;
    v15->_writeRepairRecord = 1;
  }

  return v15;
}

- (CKUploadRequestConfiguration)resolvedUploadRequestConfiguration
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;

  objc_msgSend_database(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uploadRequestConfiguration(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedConfigurationWithBaseContainer_overrides_(CKUploadRequestConfiguration, v14, (uint64_t)v9, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKUploadRequestConfiguration *)v15;
}

- (void)setMarkAssetBrokenCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id markAssetBrokenCompletionBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A6BF13C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    markAssetBrokenCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_markAssetBrokenCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    markAssetBrokenCompletionBlock = self->_markAssetBrokenCompletionBlock;
    self->_markAssetBrokenCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)markAssetBrokenCompletionBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A6BF2E4;
    v16 = sub_18A6BF30C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A6BF314;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_markAssetBrokenCompletionBlock);
  }
  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  objc_super v53;

  v4 = a3;
  objc_msgSend_recordID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordID_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_field(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setField_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_listIndex(self, v17, v18, v19);
  objc_msgSend_setListIndex_(v4, v21, v20, v22);
  v26 = objc_msgSend_touchRepairZone(self, v23, v24, v25);
  objc_msgSend_setTouchRepairZone_(v4, v27, v26, v28);
  v32 = objc_msgSend_simulateCorruptAsset(self, v29, v30, v31);
  objc_msgSend_setSimulateCorruptAsset_(v4, v33, v32, v34);
  v38 = objc_msgSend_bypassPCSEncryptionForTouchRepairZone(self, v35, v36, v37);
  objc_msgSend_setBypassPCSEncryptionForTouchRepairZone_(v4, v39, v38, v40);
  v44 = objc_msgSend_writeRepairRecord(self, v41, v42, v43);
  objc_msgSend_setWriteRepairRecord_(v4, v45, v44, v46);
  objc_msgSend_resolvedUploadRequestConfiguration(self, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUploadRequestConfiguration_(v4, v51, (uint64_t)v50, v52);

  v53.receiver = self;
  v53.super_class = (Class)CKMarkAssetBrokenOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v53, sel_fillOutOperationInfo_, v4);

}

- (void)fillFromOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)CKMarkAssetBrokenOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v53, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordID(v4, v5, v6, v7, v53.receiver, v53.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordID_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_field(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setField_(self, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_listIndex(v4, v17, v18, v19);
  objc_msgSend_setListIndex_(self, v21, v20, v22);
  v26 = objc_msgSend_touchRepairZone(v4, v23, v24, v25);
  objc_msgSend_setTouchRepairZone_(self, v27, v26, v28);
  v32 = objc_msgSend_simulateCorruptAsset(v4, v29, v30, v31);
  objc_msgSend_setSimulateCorruptAsset_(self, v33, v32, v34);
  v38 = objc_msgSend_bypassPCSEncryptionForTouchRepairZone(v4, v35, v36, v37);
  objc_msgSend_setBypassPCSEncryptionForTouchRepairZone_(self, v39, v38, v40);
  v44 = objc_msgSend_writeRepairRecord(v4, v41, v42, v43);
  objc_msgSend_setWriteRepairRecord_(self, v45, v44, v46);
  objc_msgSend_uploadRequestConfiguration(v4, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUploadRequestConfiguration_(self, v51, (uint64_t)v50, v52);
}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKMarkAssetBrokenOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v9, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_markAssetBrokenCompletionBlock(self, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7 != 0;

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  int v20;
  BOOL result;
  id v22;
  objc_super v23;

  objc_msgSend_database(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_scope(v6, v7, v8, v9);

  if (v10 == 2)
  {
    objc_msgSend_recordID(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v19, (uint64_t)v18, (uint64_t)a3);

    if (v20)
    {
      v23.receiver = self;
      v23.super_class = (Class)CKMarkAssetBrokenOperation;
      return -[CKDatabaseOperation CKOperationShouldRun:](&v23, sel_CKOperationShouldRun_, a3);
    }
  }
  else if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v11, (uint64_t)CFSTR("CKInternalErrorDomain"), 1019, CFSTR("This operation should only be called on the private database"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v22;
    return result;
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performMarkAssetBrokenOperation_withBlock_;
}

- (void)handleMarkAssetBrokenCompletionWithRepairRecordID:(id)a3 error:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_setRepairRecordID_, a3, a4);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKSignpost *v10;
  CKSignpost *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  CKSignpost *v16;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  os_signpost_id_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  NSObject *v70;
  objc_class *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  objc_super v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  CKMarkAssetBrokenOperation *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v10 = self->super.super._signpost;
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend_log(v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    if (self)
      v16 = self->super.super._signpost;
    else
      v16 = 0;
    v17 = v16;
    v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKMarkAssetBrokenOperation", "Finishing", buf, 2u);
    }

  }
  objc_msgSend_CKClientSuitableError(v4, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_markAssetBrokenCompletionBlock(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v30 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v70 = v30;
      v71 = (objc_class *)objc_opt_class();
      NSStringFromClass(v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v79 = v72;
      v80 = 2048;
      v81 = self;
      v82 = 2114;
      v83 = v76;
      v84 = 2112;
      v85 = v22;
      _os_log_debug_impl(&dword_18A5C5000, v70, OS_LOG_TYPE_DEBUG, "Calling markAssetBrokenCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);

    }
    objc_msgSend_markAssetBrokenCompletionBlock(self, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_repairRecordID(self, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v34)[2](v34, v38, v22);

    objc_msgSend_setMarkAssetBrokenCompletionBlock_(self, v39, 0, v40);
  }
  objc_msgSend_recordID(self, v27, v28, v29);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v49 = (void *)MEMORY[0x1E0C99E20];
    v50 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend_recordID(self, v46, v47, v48);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(v50, v56, (uint64_t)v55, v57, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v49, v59, (uint64_t)v58, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_zoneIDsToZoneNamesString_(self, v62, (uint64_t)v61, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v68, v69, (uint64_t)v64, (uint64_t)CFSTR("zoneNames"));

  }
  v77.receiver = self;
  v77.super_class = (Class)CKMarkAssetBrokenOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v77, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)ckSignpostBegin
{
  CKSignpost *signpost;
  CKSignpost *v4;
  CKSignpost *v5;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  CKSignpost *v11;
  CKSignpost *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  os_signpost_id_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v4 = signpost;

  if (v4)
  {
    if (self)
      v5 = self->super.super._signpost;
    else
      v5 = 0;
    v6 = v5;
    objc_msgSend_log(v6, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (self)
      v11 = self->super.super._signpost;
    else
      v11 = 0;
    v12 = v11;
    v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      objc_msgSend_operationID(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_group(self, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupID(v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupName(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationInfo(self, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      CKStringForDiscretionaryNetworkBehavior(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      CKStringForQOS(v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 138413570;
      v55 = v20;
      v56 = 2112;
      v57 = v24;
      v58 = 2112;
      v59 = v32;
      v60 = 2114;
      v61 = v36;
      v62 = 2114;
      v63 = v45;
      v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKMarkAssetBrokenOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

    }
  }
}

- (void)ckSignpostEndWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  CKSignpost *v7;
  CKSignpost *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  CKSignpost *v13;
  CKSignpost *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  os_signpost_id_t v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v7 = self->super.super._signpost;
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend_log(v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (self)
      v13 = self->super.super._signpost;
    else
      v13 = 0;
    v14 = v13;
    v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v19 = 138412290;
      v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKMarkAssetBrokenOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/break-assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v4 = a3;
  CKErrorUserInfoClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleMarkAssetBrokenCompletionWithRepairRecordID_error_, 1, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKMarkAssetBrokenOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (BOOL)touchRepairZone
{
  return self->_touchRepairZone;
}

- (void)setTouchRepairZone:(BOOL)a3
{
  self->_touchRepairZone = a3;
}

- (BOOL)bypassPCSEncryptionForTouchRepairZone
{
  return self->_bypassPCSEncryptionForTouchRepairZone;
}

- (void)setBypassPCSEncryptionForTouchRepairZone:(BOOL)a3
{
  self->_bypassPCSEncryptionForTouchRepairZone = a3;
}

- (BOOL)simulateCorruptAsset
{
  return self->_simulateCorruptAsset;
}

- (void)setSimulateCorruptAsset:(BOOL)a3
{
  self->_simulateCorruptAsset = a3;
}

- (BOOL)writeRepairRecord
{
  return self->_writeRepairRecord;
}

- (void)setWriteRepairRecord:(BOOL)a3
{
  self->_writeRepairRecord = a3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSString)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
  objc_storeStrong((id *)&self->_field, a3);
}

- (int64_t)listIndex
{
  return self->_listIndex;
}

- (void)setListIndex:(int64_t)a3
{
  self->_listIndex = a3;
}

- (CKRecordID)repairRecordID
{
  return self->_repairRecordID;
}

- (void)setRepairRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_repairRecordID, a3);
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_repairRecordID, 0);
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong(&self->_markAssetBrokenCompletionBlock, 0);
}

@end
