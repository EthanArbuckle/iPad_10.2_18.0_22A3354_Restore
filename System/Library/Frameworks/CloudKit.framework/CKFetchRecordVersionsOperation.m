@implementation CKFetchRecordVersionsOperation

- (CKFetchRecordVersionsOperation)init
{
  CKFetchRecordVersionsOperation *v2;
  uint64_t v3;
  NSMutableDictionary *recordErrors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKFetchRecordVersionsOperation;
  v2 = -[CKOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordErrors = v2->_recordErrors;
    v2->_recordErrors = (NSMutableDictionary *)v3;

    v2->_shouldFetchAssetContent = 1;
  }
  return v2;
}

- (CKFetchRecordVersionsOperation)initWithRecordIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKFetchRecordVersionsOperation *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *recordIDs;
  CKException *v23;
  const char *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = (CKFetchRecordVersionsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v8)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v4;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v23 = [CKException alloc];
            v25 = (id)objc_msgSend_initWithCode_format_(v23, v24, 12, (uint64_t)CFSTR("%@ is not a valid record ID"), v15);
            objc_exception_throw(v25);
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v16, (uint64_t)&v26, (uint64_t)v30, 16);
      }
      while (v12);
    }

    v20 = objc_msgSend_copy(v9, v17, v18, v19);
    recordIDs = v8->_recordIDs;
    v8->_recordIDs = (NSArray *)v20;

  }
  return v8;
}

- (void)setFetchRecordVersionsProgressBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id fetchRecordVersionsProgressBlock;
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
    block[2] = sub_18A77FE38;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    fetchRecordVersionsProgressBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchRecordVersionsProgressBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    fetchRecordVersionsProgressBlock = self->_fetchRecordVersionsProgressBlock;
    self->_fetchRecordVersionsProgressBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)fetchRecordVersionsProgressBlock
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
    v15 = sub_18A77FFE0;
    v16 = sub_18A780008;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A780010;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordVersionsProgressBlock);
  }
  return v8;
}

- (void)setFetchRecordVersionsCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id fetchRecordVersionsCompletionBlock;
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
    block[2] = sub_18A78016C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    fetchRecordVersionsCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchRecordVersionsCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    fetchRecordVersionsCompletionBlock = self->_fetchRecordVersionsCompletionBlock;
    self->_fetchRecordVersionsCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)fetchRecordVersionsCompletionBlock
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
    v15 = sub_18A77FFE0;
    v16 = sub_18A780008;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A780314;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordVersionsCompletionBlock);
  }
  return v8;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-record-versions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t AssetContent;
  const char *v27;
  uint64_t v28;
  objc_super v29;

  v4 = a3;
  objc_msgSend_recordIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDs_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_desiredKeys(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(v4, v15, (uint64_t)v14, v16);

  objc_msgSend_minimumVersionETag(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinimumVersionETag_(v4, v21, (uint64_t)v20, v22);

  AssetContent = objc_msgSend_shouldFetchAssetContent(self, v23, v24, v25);
  objc_msgSend_setShouldFetchAssetContent_(v4, v27, AssetContent, v28);
  v29.receiver = self;
  v29.super_class = (Class)CKFetchRecordVersionsOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v29, sel_fillOutOperationInfo_, v4);

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
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t AssetContent;
  const char *v27;
  uint64_t v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CKFetchRecordVersionsOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v29, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordIDs(v4, v5, v6, v7, v29.receiver, v29.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDs_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_desiredKeys(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(self, v15, (uint64_t)v14, v16);

  objc_msgSend_minimumVersionETag(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinimumVersionETag_(self, v21, (uint64_t)v20, v22);

  AssetContent = objc_msgSend_shouldFetchAssetContent(v4, v23, v24, v25);
  objc_msgSend_setShouldFetchAssetContent_(self, v27, AssetContent, v28);
}

- (void)handleFetchForRecordID:(id)a3 isDeleted:(BOOL)a4 versions:(id)a5 error:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CKSignpost *signpost;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CKSignpost *v21;
  CKSignpost *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  CKSignpost *v27;
  CKSignpost *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  os_signpost_id_t v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void (**v39)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  CKSignpost *v40;
  CKSignpost *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  CKSignpost *v45;
  CKSignpost *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  os_signpost_id_t v50;
  int v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v8 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend_CKClientSuitableError(a6, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v17 = signpost;

  if (v15)
  {
    if (v17)
    {
      if (self)
        v21 = self->super.super._signpost;
      else
        v21 = 0;
      v22 = v21;
      objc_msgSend_log(v22, v23, v24, v25);
      v26 = objc_claimAutoreleasedReturnValue();

      if (self)
        v27 = self->super.super._signpost;
      else
        v27 = 0;
      v28 = v27;
      v32 = objc_msgSend_identifier(v28, v29, v30, v31);

      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        v51 = 138412546;
        v52 = v10;
        v53 = 2112;
        v54 = v15;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v26, OS_SIGNPOST_EVENT, v32, "CKFetchRecordVersionsOperation", "Record %@ fetched with error: %@", (uint8_t *)&v51, 0x16u);
      }

    }
    objc_msgSend_recordErrors(self, v18, v19, v20);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v15, (uint64_t)v10);
LABEL_14:

    goto LABEL_15;
  }
  if (v17)
  {
    if (self)
      v40 = self->super.super._signpost;
    else
      v40 = 0;
    v41 = v40;
    objc_msgSend_log(v41, v42, v43, v44);
    v33 = objc_claimAutoreleasedReturnValue();

    if (self)
      v45 = self->super.super._signpost;
    else
      v45 = 0;
    v46 = v45;
    v50 = objc_msgSend_identifier(v46, v47, v48, v49);

    if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      v51 = 138412290;
      v52 = v10;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v33, OS_SIGNPOST_EVENT, v50, "CKFetchRecordVersionsOperation", "Record %@ fetched", (uint8_t *)&v51, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend_fetchRecordVersionsProgressBlock(self, v18, v19, v20);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend_fetchRecordVersionsProgressBlock(self, v36, v37, v38);
    v39 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _BOOL8, id, void *))v39)[2](v39, v10, v8, v11, v15);

  }
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
  v13.super_class = (Class)CKFetchRecordVersionsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_fetchRecordVersionsProgressBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_fetchRecordVersionsCompletionBlock(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11 != 0;

  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  int v30;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend_fetchRecordVersionsProgressBlock(self, a2, (uint64_t)a3, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = (void *)v6;
    objc_msgSend_recordIDs(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_count(v11, v12, v13, v14);

    if (v15)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend_recordIDs(self, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v33, (uint64_t)v37, 16);
      if (v21)
      {
        v25 = v21;
        v26 = *(_QWORD *)v34;
        while (2)
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v19);
            objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v33 + 1) + 8 * v27), v22, v23, v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v29, (uint64_t)v28, (uint64_t)a3);

            if (!v30)
            {

              goto LABEL_13;
            }
            ++v27;
          }
          while (v25 != v27);
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v33, (uint64_t)v37, 16);
          if (v25)
            continue;
          break;
        }
      }

      v32.receiver = self;
      v32.super_class = (Class)CKFetchRecordVersionsOperation;
      LOBYTE(v6) = -[CKDatabaseOperation CKOperationShouldRun:](&v32, sel_CKOperationShouldRun_, a3);
    }
    else
    {
LABEL_13:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchRecordVersionsOperation_withBlock_;
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
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void (**v38)(_QWORD, _QWORD);
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  objc_super v45;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordVersionsOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_recordErrors(self, v7, v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordErrors(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to fetch some record versions"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_fetchRecordVersionsCompletionBlock(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend_fetchRecordVersionsCompletionBlock(self, v35, v36, v37);
    v38 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v38)[2](v38, v42);

    objc_msgSend_setFetchRecordVersionsCompletionBlock_(self, v43, 0, v44);
  }
  objc_msgSend_setFetchRecordVersionsProgressBlock_(self, v35, 0, v37);
  v45.receiver = self;
  v45.super_class = (Class)CKFetchRecordVersionsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v45, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchRecordVersionsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchRecordVersionsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  objc_super v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v11, (uint64_t)v10, (uint64_t)sel_handleFetchForRecordID_isDeleted_versions_error_, 2, 0);

  CKErrorUserInfoClasses();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v13, (uint64_t)v12, (uint64_t)sel_handleFetchForRecordID_isDeleted_versions_error_, 3, 0);

  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___CKFetchRecordVersionsOperation;
  objc_msgSendSuper2(&v14, sel_applyDaemonCallbackInterfaceTweaks_, v5);

}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (NSString)minimumVersionETag
{
  return self->_minimumVersionETag;
}

- (void)setMinimumVersionETag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
  objc_storeStrong((id *)&self->_recordErrors, a3);
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_minimumVersionETag, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_fetchRecordVersionsCompletionBlock, 0);
  objc_storeStrong(&self->_fetchRecordVersionsProgressBlock, 0);
}

@end
