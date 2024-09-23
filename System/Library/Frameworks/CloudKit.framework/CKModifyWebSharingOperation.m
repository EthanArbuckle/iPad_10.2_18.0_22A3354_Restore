@implementation CKModifyWebSharingOperation

- (CKModifyWebSharingOperation)initWithRecordIDsToWebShare:(id)a3 recordIDsToUnshare:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKModifyWebSharingOperation *v11;
  uint64_t v12;
  NSArray *recordIDsToShare;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *recordIDsToUnshare;
  uint64_t v19;
  NSMutableArray *sharedRecordIDs;
  uint64_t v21;
  NSMutableArray *unsharedRecordIDs;
  uint64_t v23;
  NSMutableDictionary *recordErrors;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CKModifyWebSharingOperation;
  v11 = -[CKOperation init](&v26, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    recordIDsToShare = v11->_recordIDsToShare;
    v11->_recordIDsToShare = (NSArray *)v12;

    v17 = objc_msgSend_copy(v7, v14, v15, v16);
    recordIDsToUnshare = v11->_recordIDsToUnshare;
    v11->_recordIDsToUnshare = (NSArray *)v17;

    v19 = objc_opt_new();
    sharedRecordIDs = v11->_sharedRecordIDs;
    v11->_sharedRecordIDs = (NSMutableArray *)v19;

    v21 = objc_opt_new();
    unsharedRecordIDs = v11->_unsharedRecordIDs;
    v11->_unsharedRecordIDs = (NSMutableArray *)v21;

    v23 = objc_opt_new();
    recordErrors = v11->_recordErrors;
    v11->_recordErrors = (NSMutableDictionary *)v23;

  }
  return v11;
}

- (void)setRecordSharedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id recordSharedBlock;
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
    block[2] = sub_18A710BB8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    recordSharedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordSharedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    recordSharedBlock = self->_recordSharedBlock;
    self->_recordSharedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)recordSharedBlock
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
    v15 = sub_18A710D60;
    v16 = sub_18A710D88;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A710D90;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordSharedBlock);
  }
  return v8;
}

- (void)setRecordUnsharedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id recordUnsharedBlock;
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
    block[2] = sub_18A710EEC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    recordUnsharedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordUnsharedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    recordUnsharedBlock = self->_recordUnsharedBlock;
    self->_recordUnsharedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)recordUnsharedBlock
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
    v15 = sub_18A710D60;
    v16 = sub_18A710D88;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A711094;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordUnsharedBlock);
  }
  return v8;
}

- (void)setWebShareRecordsCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id webShareRecordsCompletionBlock;
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
    block[2] = sub_18A7111F0;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    webShareRecordsCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_webShareRecordsCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    webShareRecordsCompletionBlock = self->_webShareRecordsCompletionBlock;
    self->_webShareRecordsCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)webShareRecordsCompletionBlock
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
    v15 = sub_18A710D60;
    v16 = sub_18A710D88;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A711398;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_webShareRecordsCompletionBlock);
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
  void *v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  objc_msgSend_recordIDsToShare(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToShare_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_recordIDsToUnshare(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToUnshare_(v4, v15, (uint64_t)v14, v16);

  objc_msgSend_recordIDsToShareReadWrite(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToShareReadWrite_(v4, v21, (uint64_t)v20, v22);

  v23.receiver = self;
  v23.super_class = (Class)CKModifyWebSharingOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v23, sel_fillOutOperationInfo_, v4);

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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKModifyWebSharingOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v23, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordIDsToShare(v4, v5, v6, v7, v23.receiver, v23.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToShare_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_recordIDsToUnshare(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToUnshare_(self, v15, (uint64_t)v14, v16);

  objc_msgSend_recordIDsToShareReadWrite(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setRecordIDsToShareReadWrite_(self, v21, (uint64_t)v20, v22);
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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKModifyWebSharingOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v17, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_recordSharedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_recordUnsharedBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_webShareRecordsCompletionBlock(self, v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15 != 0;

    }
  }

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  id *v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id *v30;
  uint64_t i;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  int v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  int v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  BOOL v70;
  objc_class *v71;
  void *v72;
  const char *v73;
  objc_class *v74;
  void *v75;
  const char *v76;
  id obj;
  id obja;
  objc_super v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v4 = a3;
  v91 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordIDsToShare(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v7, v8, v9))
  {

  }
  else
  {
    objc_msgSend_recordIDsToUnshare(self, v10, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_count(v16, v17, v18, v19);

    if (!v20)
      return 0;
  }
  objc_msgSend_set(MEMORY[0x1E0C99E20], v13, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend_recordIDsToShare(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v85, (uint64_t)v90, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v86;
    obj = v25;
    do
    {
      v30 = v4;
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v86 != v29)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v30)
          {
            v71 = (objc_class *)objc_opt_class();
            NSStringFromClass(v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v73, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected recordID to share passed to %@: %@"), v72, v32);
            *v30 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_30;
        }
        objc_msgSend_zoneID(v32, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v37, (uint64_t)v36, (uint64_t)v30);

        if (!v38)
          goto LABEL_30;
        if (objc_msgSend_containsObject_(v21, v39, (uint64_t)v32, v40))
        {
          if (v30)
          {
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v41, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't share the same record ID twice in a single operation: %@"), v32);
            v70 = 0;
            *v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
            v47 = obj;
            goto LABEL_41;
          }
LABEL_30:
          v70 = 0;
          goto LABEL_31;
        }
        objc_msgSend_addObject_(v21, v41, (uint64_t)v32, v42);
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v85, (uint64_t)v90, 16);
      v4 = v30;
      v25 = obj;
    }
    while (v28);
  }

  objc_msgSend_set(MEMORY[0x1E0C99E20], v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend_recordIDsToUnshare(self, v48, v49, v50);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v51, (uint64_t)&v81, (uint64_t)v89, 16);
  if (!v52)
    goto LABEL_25;
  v53 = v52;
  v54 = *(_QWORD *)v82;
  while (2)
  {
    for (j = 0; j != v53; ++j)
    {
      if (*(_QWORD *)v82 != v54)
        objc_enumerationMutation(obja);
      v56 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v4)
        {
          v74 = (objc_class *)objc_opt_class();
          NSStringFromClass(v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v76, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected recordID to unshare passed to %@: %@"), v75, v56);
          *v4 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_40;
      }
      objc_msgSend_zoneID(v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v61, (uint64_t)v60, (uint64_t)v4);

      if (!v62)
        goto LABEL_40;
      if (objc_msgSend_containsObject_(v21, v63, (uint64_t)v56, v64))
      {
        if (v4)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v65, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't share and unshare the same record ID in a single operation: %@"), v56);
          goto LABEL_39;
        }
LABEL_40:

        v70 = 0;
        goto LABEL_41;
      }
      if (objc_msgSend_containsObject_(v47, v65, (uint64_t)v56, v66))
      {
        if (v4)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v67, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't unshare the same record ID twice in a single operation: %@"), v56);
LABEL_39:
          *v4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_40;
      }
      objc_msgSend_addObject_(v47, v67, (uint64_t)v56, v68);
    }
    v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v69, (uint64_t)&v81, (uint64_t)v89, 16);
    if (v53)
      continue;
    break;
  }
LABEL_25:

  v80.receiver = self;
  v80.super_class = (Class)CKModifyWebSharingOperation;
  v70 = -[CKDatabaseOperation CKOperationShouldRun:](&v80, sel_CKOperationShouldRun_, v4);
LABEL_41:

  return v70;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performModifyWebSharingOperation_withBlock_;
}

- (void)handleWebSharingInitiationForRecordID:(id)a3 sharingKey:(id)a4 baseSharingToken:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CKSignpost *signpost;
  CKSignpost *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CKSignpost *v22;
  CKSignpost *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  CKSignpost *v28;
  CKSignpost *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  os_signpost_id_t v33;
  void *v34;
  const char *v35;
  CKSignpost *v36;
  CKSignpost *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  CKSignpost *v42;
  CKSignpost *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  os_signpost_id_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void (**v57)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend_CKClientSuitableError(a6, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v18 = signpost;

  if (v16)
  {
    if (v18)
    {
      if (self)
        v22 = self->super.super._signpost;
      else
        v22 = 0;
      v23 = v22;
      objc_msgSend_log(v23, v24, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();

      if (self)
        v28 = self->super.super._signpost;
      else
        v28 = 0;
      v29 = v28;
      v33 = objc_msgSend_identifier(v29, v30, v31, v32);

      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        v58 = 138412546;
        v59 = v10;
        v60 = 2112;
        v61 = v16;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v27, OS_SIGNPOST_EVENT, v33, "CKModifyWebSharingOperation", "Record %@ shared with error: %@", (uint8_t *)&v58, 0x16u);
      }

    }
    objc_msgSend_recordErrors(self, v19, v20, v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v16, (uint64_t)v10);
  }
  else
  {
    if (v18)
    {
      if (self)
        v36 = self->super.super._signpost;
      else
        v36 = 0;
      v37 = v36;
      objc_msgSend_log(v37, v38, v39, v40);
      v41 = objc_claimAutoreleasedReturnValue();

      if (self)
        v42 = self->super.super._signpost;
      else
        v42 = 0;
      v43 = v42;
      v47 = objc_msgSend_identifier(v43, v44, v45, v46);

      if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
      {
        v58 = 138412290;
        v59 = v10;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v41, OS_SIGNPOST_EVENT, v47, "CKModifyWebSharingOperation", "Record %@ shared", (uint8_t *)&v58, 0xCu);
      }

    }
    objc_msgSend_sharedRecordIDs(self, v19, v20, v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v34, v48, (uint64_t)v10, v49);
  }

  objc_msgSend_recordSharedBlock(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend_recordSharedBlock(self, v54, v55, v56);
    v57 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, void *))v57)[2](v57, v10, v11, v12, v16);

  }
}

- (void)handleWebSharingRevocationForRecordID:(id)a3 error:(id)a4
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
  uint64_t v15;
  CKSignpost *v16;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  CKSignpost *v22;
  CKSignpost *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  os_signpost_id_t v27;
  void *v28;
  const char *v29;
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
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void (**v51)(_QWORD, _QWORD, _QWORD);
  int v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
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
        v16 = self->super.super._signpost;
      else
        v16 = 0;
      v17 = v16;
      objc_msgSend_log(v17, v18, v19, v20);
      v21 = objc_claimAutoreleasedReturnValue();

      if (self)
        v22 = self->super.super._signpost;
      else
        v22 = 0;
      v23 = v22;
      v27 = objc_msgSend_identifier(v23, v24, v25, v26);

      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        v52 = 138412546;
        v53 = v6;
        v54 = 2112;
        v55 = v10;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v21, OS_SIGNPOST_EVENT, v27, "CKModifyWebSharingOperation", "Record %@ unshared with error: %@", (uint8_t *)&v52, 0x16u);
      }

    }
    objc_msgSend_recordErrors(self, v13, v14, v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v10, (uint64_t)v6);
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
        v52 = 138412290;
        v53 = v6;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v35, OS_SIGNPOST_EVENT, v41, "CKModifyWebSharingOperation", "Record %@ unshared", (uint8_t *)&v52, 0xCu);
      }

    }
    objc_msgSend_unsharedRecordIDs(self, v13, v14, v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v28, v42, (uint64_t)v6, v43);
  }

  objc_msgSend_recordUnsharedBlock(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_recordUnsharedBlock(self, v48, v49, v50);
    v51 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v51)[2](v51, v6, v10);

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
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void (**v99)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  objc_super v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint8_t buf[8];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKModifyWebSharingOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_recordErrors(self, v7, v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordErrors(self, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v30, v35, (uint64_t)v34, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v36, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v30, CFSTR("Failed to share/unshare some records"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  objc_msgSend_sharedRecordIDs(self, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v125, (uint64_t)v132, 16);
  if (v43)
  {
    v47 = v43;
    v48 = *(_QWORD *)v126;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v126 != v48)
          objc_enumerationMutation(v41);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v125 + 1) + 8 * v49), v44, v45, v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v37, v51, (uint64_t)v50, v52);

        ++v49;
      }
      while (v47 != v49);
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v125, (uint64_t)v132, 16);
    }
    while (v47);
  }

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  objc_msgSend_recordIDsToUnshare(self, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v121, (uint64_t)v131, 16);
  if (v58)
  {
    v62 = v58;
    v63 = *(_QWORD *)v122;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v122 != v63)
          objc_enumerationMutation(v56);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v121 + 1) + 8 * v64), v59, v60, v61);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v37, v66, (uint64_t)v65, v67);

        ++v64;
      }
      while (v62 != v64);
      v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v121, (uint64_t)v131, 16);
    }
    while (v62);
  }

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  objc_msgSend_recordIDsToShareReadWrite(self, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v117, (uint64_t)v130, 16);
  if (v73)
  {
    v77 = v73;
    v78 = *(_QWORD *)v118;
    do
    {
      v79 = 0;
      do
      {
        if (*(_QWORD *)v118 != v78)
          objc_enumerationMutation(v71);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v117 + 1) + 8 * v79), v74, v75, v76);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v37, v81, (uint64_t)v80, v82);

        ++v79;
      }
      while (v77 != v79);
      v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v74, (uint64_t)&v117, (uint64_t)v130, 16);
    }
    while (v77);
  }

  if (objc_msgSend_count(v37, v83, v84, v85))
  {
    objc_msgSend_zoneIDsToZoneNamesString_(self, v86, (uint64_t)v37, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v93, v94, (uint64_t)v89, (uint64_t)CFSTR("zoneNames"));

  }
  objc_msgSend_webShareRecordsCompletionBlock(self, v86, v87, v88);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (v95)
  {
    objc_msgSend_webShareRecordsCompletionBlock(self, v96, v97, v98);
    v99 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedRecordIDs(self, v100, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unsharedRecordIDs(self, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v99)[2](v99, v103, v107, v111);

    objc_msgSend_setWebShareRecordsCompletionBlock_(self, v112, 0, v113);
  }
  objc_msgSend_setRecordSharedBlock_(self, v96, 0, v98);
  objc_msgSend_setRecordUnsharedBlock_(self, v114, 0, v115);
  v116.receiver = self;
  v116.super_class = (Class)CKModifyWebSharingOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v116, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKModifyWebSharingOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKModifyWebSharingOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/modify-web-sharing", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v4 = a3;
  CKErrorUserInfoClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleWebSharingInitiationForRecordID_sharingKey_baseSharingToken_error_, 3, 0);

  CKErrorUserInfoClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleWebSharingRevocationForRecordID_error_, 1, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKModifyWebSharingOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)recordIDsToShareReadWrite
{
  return self->_recordIDsToShareReadWrite;
}

- (void)setRecordIDsToShareReadWrite:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
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

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
  objc_storeStrong((id *)&self->_recordErrors, a3);
}

- (NSMutableArray)sharedRecordIDs
{
  return self->_sharedRecordIDs;
}

- (void)setSharedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_sharedRecordIDs, a3);
}

- (NSMutableArray)unsharedRecordIDs
{
  return self->_unsharedRecordIDs;
}

- (void)setUnsharedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_unsharedRecordIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsharedRecordIDs, 0);
  objc_storeStrong((id *)&self->_sharedRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_recordIDsToUnshare, 0);
  objc_storeStrong((id *)&self->_recordIDsToShare, 0);
  objc_storeStrong((id *)&self->_recordIDsToShareReadWrite, 0);
  objc_storeStrong(&self->_webShareRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_recordUnsharedBlock, 0);
  objc_storeStrong(&self->_recordSharedBlock, 0);
}

@end
