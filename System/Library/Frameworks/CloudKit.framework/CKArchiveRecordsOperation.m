@implementation CKArchiveRecordsOperation

- (CKArchiveRecordsOperation)init
{
  CKArchiveRecordsOperation *v2;
  uint64_t v3;
  NSMutableDictionary *perItemErrors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKArchiveRecordsOperation;
  v2 = -[CKOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    perItemErrors = v2->_perItemErrors;
    v2->_perItemErrors = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (CKArchiveRecordsOperation)initWithRecordIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKArchiveRecordsOperation *v11;
  uint64_t v12;
  NSArray *recordIDs;

  v4 = a3;
  v11 = (CKArchiveRecordsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    recordIDs = v11->_recordIDs;
    v11->_recordIDs = (NSArray *)v12;

  }
  return v11;
}

- (void)setRecordArchivedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id recordArchivedBlock;
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
    block[2] = sub_18A6E3A14;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    recordArchivedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordArchivedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    recordArchivedBlock = self->_recordArchivedBlock;
    self->_recordArchivedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)recordArchivedBlock
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
    v15 = sub_18A6E3BBC;
    v16 = sub_18A6E3BE4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A6E3BEC;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordArchivedBlock);
  }
  return v8;
}

- (void)setArchiveRecordsCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id archiveRecordsCompletionBlock;
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
    block[2] = sub_18A6E3D48;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    archiveRecordsCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_archiveRecordsCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    archiveRecordsCompletionBlock = self->_archiveRecordsCompletionBlock;
    self->_archiveRecordsCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)archiveRecordsCompletionBlock
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
    v15 = sub_18A6E3BBC;
    v16 = sub_18A6E3BE4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A6E3EF0;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_archiveRecordsCompletionBlock);
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
  objc_super v11;

  v4 = a3;
  objc_msgSend_recordIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDs_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKArchiveRecordsOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v11, sel_fillOutOperationInfo_, v4);

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKArchiveRecordsOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v11, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordIDs(v4, v5, v6, v7, v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setRecordIDs_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKArchiveRecordsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_recordArchivedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_archiveRecordsCompletionBlock(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11 != 0;

  }
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int v25;
  objc_class *v27;
  void *v28;
  const char *v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordIDs(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (v10)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend_recordIDs(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v16)
    {
      v20 = v16;
      v21 = *(_QWORD *)v32;
      while (2)
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v14);
          objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v31 + 1) + 8 * v22), v17, v18, v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v24, (uint64_t)v23, (uint64_t)a3);

          if (!v25)
          {

            return 0;
          }
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v31, (uint64_t)v35, 16);
        if (v20)
          continue;
        break;
      }
    }

    v30.receiver = self;
    v30.super_class = (Class)CKArchiveRecordsOperation;
    return -[CKDatabaseOperation CKOperationShouldRun:](&v30, sel_CKOperationShouldRun_, a3);
  }
  else
  {
    if (a3)
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v29, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You must pass at least one record ID to %@"), v28);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

+ (SEL)daemonInvocationSelector
{
  return sel_performArchiveRecordsOperation_withBlock_;
}

- (void)handleRecordArchivalForRecordID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CKSignpost *signpost;
  CKSignpost *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKSignpost *v17;
  CKSignpost *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  CKSignpost *v23;
  CKSignpost *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  os_signpost_id_t v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  NSObject *v37;
  CKSignpost *v38;
  CKSignpost *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  CKSignpost *v43;
  CKSignpost *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  os_signpost_id_t v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_CKClientSuitableError(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v13 = signpost;

  if (v11)
  {
    if (v13)
    {
      if (self)
        v17 = self->super.super._signpost;
      else
        v17 = 0;
      v18 = v17;
      objc_msgSend_log(v18, v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      if (self)
        v23 = self->super.super._signpost;
      else
        v23 = 0;
      v24 = v23;
      v28 = objc_msgSend_identifier(v24, v25, v26, v27);

      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        v54 = 138412546;
        v55 = v6;
        v56 = 2112;
        v57 = v11;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v22, OS_SIGNPOST_EVENT, v28, "CKArchiveRecordsOperation", "Record %@ archived with error: %@", (uint8_t *)&v54, 0x16u);
      }

    }
    objc_msgSend_perItemErrors(self, v14, v15, v16);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v29, v30, (uint64_t)v11, (uint64_t)v6);
LABEL_14:

    goto LABEL_15;
  }
  if (v13)
  {
    if (self)
      v38 = self->super.super._signpost;
    else
      v38 = 0;
    v39 = v38;
    objc_msgSend_log(v39, v40, v41, v42);
    v29 = objc_claimAutoreleasedReturnValue();

    if (self)
      v43 = self->super.super._signpost;
    else
      v43 = 0;
    v44 = v43;
    v48 = objc_msgSend_identifier(v44, v45, v46, v47);

    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      v54 = 138412290;
      v55 = v6;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v29, OS_SIGNPOST_EVENT, v48, "CKArchiveRecordsOperation", "Record %@ archived", (uint8_t *)&v54, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend_recordArchivedBlock(self, v14, v15, v16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v32 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v49 = v32;
      objc_msgSend_operationID(self, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 138543618;
      v55 = v53;
      v56 = 2112;
      v57 = v6;
      _os_log_debug_impl(&dword_18A5C5000, v49, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about an archived record with id %@", (uint8_t *)&v54, 0x16u);

    }
    objc_msgSend_recordArchivedBlock(self, v33, v34, v35);
    v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v36)[2](v36, v6, v7);

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v37 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v54 = 138412290;
    v55 = v6;
    _os_log_debug_impl(&dword_18A5C5000, v37, OS_LOG_TYPE_DEBUG, "Progress callback for record id %@ is done", (uint8_t *)&v54, 0xCu);
  }

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
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void (**v73)(_QWORD, _QWORD);
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  __CFString *v90;
  const __CFString *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  __CFString *v96;
  const __CFString *v97;
  objc_super v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  const __CFString *v106;
  __int16 v107;
  __CFString *v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKArchiveRecordsOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_perItemErrors(self, v7, v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_perItemErrors(self, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v30, v35, (uint64_t)v34, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v36, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v30, CFSTR("Couldn't archive some records"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  objc_msgSend_recordIDs(self, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v99, (uint64_t)v109, 16);
  if (v43)
  {
    v47 = v43;
    v48 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v100 != v48)
          objc_enumerationMutation(v41);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v99 + 1) + 8 * i), v44, v45, v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v37, v51, (uint64_t)v50, v52);

      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v99, (uint64_t)v109, 16);
    }
    while (v47);
  }

  if (objc_msgSend_count(v37, v53, v54, v55))
  {
    objc_msgSend_zoneIDsToZoneNamesString_(self, v56, (uint64_t)v37, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v63, v64, (uint64_t)v59, (uint64_t)CFSTR("zoneNames"));

  }
  objc_msgSend_archiveRecordsCompletionBlock(self, v56, v57, v58);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v66 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v67, v68, v69);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = &stru_1E1F66ED0;
      if (v4)
        v91 = CFSTR(" Error was: ");
      else
        v91 = &stru_1E1F66ED0;
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v86, v87, v88);
        v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v104 = v89;
      v105 = 2112;
      v106 = v91;
      v107 = 2112;
      v108 = v90;
      _os_log_debug_impl(&dword_18A5C5000, v66, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed. %@%@", buf, 0x20u);
      if (v4)

    }
    objc_msgSend_archiveRecordsCompletionBlock(self, v70, v71, v72);
    v73 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v73)[2](v73, v77);

    objc_msgSend_setArchiveRecordsCompletionBlock_(self, v78, 0, v79);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v82 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v83, v84, v85);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = &stru_1E1F66ED0;
      if (v4)
        v97 = CFSTR(" Error was: ");
      else
        v97 = &stru_1E1F66ED0;
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v92, v93, v94);
        v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v104 = v95;
      v105 = 2112;
      v106 = v97;
      v107 = 2112;
      v108 = v96;
      _os_log_debug_impl(&dword_18A5C5000, v82, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no archiveRecordsCompletionBlock was set.%@%@", buf, 0x20u);
      if (v4)

    }
  }
  objc_msgSend_setRecordArchivedBlock_(self, v80, 0, v81);
  v98.receiver = self;
  v98.super_class = (Class)CKArchiveRecordsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v98, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKArchiveRecordsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKArchiveRecordsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/archive-records", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleRecordArchivalForRecordID_error_, 1, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKArchiveRecordsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSMutableDictionary)perItemErrors
{
  return self->_perItemErrors;
}

- (void)setPerItemErrors:(id)a3
{
  objc_storeStrong((id *)&self->_perItemErrors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perItemErrors, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_archiveRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_recordArchivedBlock, 0);
}

@end
