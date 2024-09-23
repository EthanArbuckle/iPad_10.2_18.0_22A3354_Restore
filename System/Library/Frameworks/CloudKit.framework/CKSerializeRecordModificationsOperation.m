@implementation CKSerializeRecordModificationsOperation

- (CKSerializeRecordModificationsOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSerializeRecordModificationsOperation;
  return -[CKOperation init](&v3, sel_init);
}

- (CKSerializeRecordModificationsOperation)initWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKSerializeRecordModificationsOperation *v14;
  uint64_t v15;
  NSArray *recordsToSave;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *recordIDsToDelete;

  v6 = a3;
  v7 = a4;
  v14 = (CKSerializeRecordModificationsOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    v15 = objc_msgSend_copy(v6, v11, v12, v13);
    recordsToSave = v14->_recordsToSave;
    v14->_recordsToSave = (NSArray *)v15;

    v20 = objc_msgSend_copy(v7, v17, v18, v19);
    recordIDsToDelete = v14->_recordIDsToDelete;
    v14->_recordIDsToDelete = (NSArray *)v20;

  }
  return v14;
}

- (void)setSerializeCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id serializeCompletionBlock;
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
    block[2] = sub_18A713200;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    serializeCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_serializeCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    serializeCompletionBlock = self->_serializeCompletionBlock;
    self->_serializeCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)serializeCompletionBlock
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
    v15 = sub_18A7133A8;
    v16 = sub_18A7133D0;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7133D8;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_serializeCompletionBlock);
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
  objc_super v17;

  v4 = a3;
  objc_msgSend_recordsToSave(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordsToSave_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_recordIDsToDelete(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToDelete_(v4, v15, (uint64_t)v14, v16);

  v17.receiver = self;
  v17.super_class = (Class)CKSerializeRecordModificationsOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v17, sel_fillOutOperationInfo_, v4);

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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKSerializeRecordModificationsOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v17, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordsToSave(v4, v5, v6, v7, v17.receiver, v17.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordsToSave_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_recordIDsToDelete(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setRecordIDsToDelete_(self, v15, (uint64_t)v14, v16);
}

- (BOOL)hasCKOperationCallbacksSet
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSerializeRecordModificationsOperation;
  return -[CKOperation hasCKOperationCallbacksSet](&v4, sel_hasCKOperationCallbacksSet)
      || self->_serializeCompletionBlock != 0;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
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
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  int v43;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  objc_class *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  objc_super v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  CKSerializeRecordModificationsOperation *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordsToSave(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend_recordIDsToDelete(self, v7, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v45 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v51 = v45;
        v52 = (objc_class *)objc_opt_class();
        NSStringFromClass(v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ckShortDescription(self, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v70 = v53;
        v71 = 2048;
        v72 = self;
        v73 = 2114;
        v74 = v57;
        _os_log_debug_impl(&dword_18A5C5000, v51, OS_LOG_TYPE_DEBUG, "Not running operation <%{public}@: %p; %{public}@> due to nil inputs",
          buf,
          0x20u);

        if (!a3)
          return 0;
      }
      else if (!a3)
      {
        return 0;
      }
      objc_msgSend_operationID(self, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v50, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("There are no inputs for operation %@."), v49);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend_recordsToSave(self, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v63, (uint64_t)v68, 16);
  if (v16)
  {
    v20 = v16;
    v21 = *(_QWORD *)v64;
LABEL_6:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v64 != v21)
        objc_enumerationMutation(v14);
      objc_msgSend_recordID(*(void **)(*((_QWORD *)&v63 + 1) + 8 * v22), v17, v18, v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v28, (uint64_t)v27, (uint64_t)a3);

      if (!v29)
        break;
      if (v20 == ++v22)
      {
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v63, (uint64_t)v68, 16);
        if (v20)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend_recordIDsToDelete(self, v30, v31, v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v33, (uint64_t)&v59, (uint64_t)v67, 16);
    if (!v34)
    {
LABEL_20:

      v58.receiver = self;
      v58.super_class = (Class)CKSerializeRecordModificationsOperation;
      return -[CKDatabaseOperation CKOperationShouldRun:](&v58, sel_CKOperationShouldRun_, a3);
    }
    v38 = v34;
    v39 = *(_QWORD *)v60;
LABEL_14:
    v40 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v39)
        objc_enumerationMutation(v14);
      objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v59 + 1) + 8 * v40), v35, v36, v37);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v42, (uint64_t)v41, (uint64_t)a3);

      if (!v43)
        break;
      if (v38 == ++v40)
      {
        v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v35, (uint64_t)&v59, (uint64_t)v67, 16);
        if (v38)
          goto LABEL_14;
        goto LABEL_20;
      }
    }
  }

  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performSerializeRecordModificationsOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  objc_super v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordsToSave(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v5, v6, v7, v8);

  if (v9)
  {
    objc_msgSend_database(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend_recordsToSave(self, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v34, (uint64_t)v38, 16);
    if (v23)
    {
      v25 = v23;
      v26 = *(_QWORD *)v35;
      while (2)
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v21);
          v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v27);
          v33 = 0;
          objc_msgSend_prepareMergeablesForUploadInContainer_useAssetsIfNecessary_error_(v28, v24, (uint64_t)v17, 0, &v33);
          v29 = v33;
          if (v29)
          {
            v31 = v29;
            objc_msgSend_finishWithError_(self, v24, (uint64_t)v29, v30);

            return;
          }
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v34, (uint64_t)v38, 16);
        if (v25)
          continue;
        break;
      }
    }

  }
  v32.receiver = self;
  v32.super_class = (Class)CKSerializeRecordModificationsOperation;
  -[CKOperation performCKOperation](&v32, sel_performCKOperation);
}

- (void)handleSerialization:(id)a3 error:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CKSignpost *signpost;
  CKSignpost *v12;
  const char *v13;
  uint64_t v14;
  CKSignpost *v15;
  CKSignpost *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  CKSignpost *v21;
  CKSignpost *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  os_signpost_id_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  CKSignpost *v30;
  CKSignpost *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  CKSignpost *v36;
  CKSignpost *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  os_signpost_id_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v12 = signpost;

  if (v10)
  {
    if (v12)
    {
      if (self)
        v15 = self->super.super._signpost;
      else
        v15 = 0;
      v16 = v15;
      objc_msgSend_log(v16, v17, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      if (self)
        v21 = self->super.super._signpost;
      else
        v21 = 0;
      v22 = v21;
      v26 = objc_msgSend_identifier(v22, v23, v24, v25);

      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        v45 = 134218242;
        v46 = objc_msgSend_length(v6, v27, v28, v29);
        v47 = 2112;
        v48 = v10;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v20, OS_SIGNPOST_EVENT, v26, "CKSerializeRecordModificationsOperation", "Serialized results (%lu bytes) received with error: %@", (uint8_t *)&v45, 0x16u);
      }

    }
    objc_msgSend_finishWithError_(self, v13, (uint64_t)v10, v14);
  }
  else
  {
    if (v12)
    {
      if (self)
        v30 = self->super.super._signpost;
      else
        v30 = 0;
      v31 = v30;
      objc_msgSend_log(v31, v32, v33, v34);
      v35 = objc_claimAutoreleasedReturnValue();

      if (self)
        v36 = self->super.super._signpost;
      else
        v36 = 0;
      v37 = v36;
      v41 = objc_msgSend_identifier(v37, v38, v39, v40);

      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        v45 = 134217984;
        v46 = objc_msgSend_length(v6, v42, v43, v44);
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v35, OS_SIGNPOST_EVENT, v41, "CKSerializeRecordModificationsOperation", "Serialized results (%lu bytes) received", (uint8_t *)&v45, 0xCu);
      }

    }
    objc_msgSend_setSerializedModifications_(self, v13, (uint64_t)v6, v14);
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
  void (**v26)(_QWORD, _QWORD, _QWORD);
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  objc_super v39;
  uint8_t buf[16];

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKSerializeRecordModificationsOperation", "Finishing", buf, 2u);
    }

  }
  objc_msgSend_serializeCompletionBlock(self, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_serializeCompletionBlock(self, v23, v24, v25);
    v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_serializedModifications(self, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v26)[2](v26, v30, v34);

    objc_msgSend_setSerializedModifications_(self, v35, 0, v36);
    objc_msgSend_setSerializeCompletionBlock_(self, v37, 0, v38);
  }
  v39.receiver = self;
  v39.super_class = (Class)CKSerializeRecordModificationsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v39, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKSerializeRecordModificationsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKSerializeRecordModificationsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/serialize-record-modifications", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
  objc_storeStrong((id *)&self->_recordsToSave, a3);
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, a3);
}

- (NSData)serializedModifications
{
  return self->_serializedModifications;
}

- (void)setSerializedModifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedModifications, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong(&self->_serializeCompletionBlock, 0);
}

@end
