@implementation CKModifyRecordAccessOperation

- (CKModifyRecordAccessOperation)initWithRecordIDsToGrantAccess:(id)a3 recordIDsToRevokeAccess:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKModifyRecordAccessOperation *v11;
  uint64_t v12;
  NSArray *recordIDsToGrant;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *recordIDsToRevoke;
  uint64_t v19;
  NSMutableArray *grantedRecordIDs;
  uint64_t v21;
  NSMutableArray *revokedRecordIDs;
  uint64_t v23;
  NSMutableDictionary *recordErrors;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CKModifyRecordAccessOperation;
  v11 = -[CKOperation init](&v26, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    recordIDsToGrant = v11->_recordIDsToGrant;
    v11->_recordIDsToGrant = (NSArray *)v12;

    v17 = objc_msgSend_copy(v7, v14, v15, v16);
    recordIDsToRevoke = v11->_recordIDsToRevoke;
    v11->_recordIDsToRevoke = (NSArray *)v17;

    v19 = objc_opt_new();
    grantedRecordIDs = v11->_grantedRecordIDs;
    v11->_grantedRecordIDs = (NSMutableArray *)v19;

    v21 = objc_opt_new();
    revokedRecordIDs = v11->_revokedRecordIDs;
    v11->_revokedRecordIDs = (NSMutableArray *)v21;

    v23 = objc_opt_new();
    recordErrors = v11->_recordErrors;
    v11->_recordErrors = (NSMutableDictionary *)v23;

  }
  return v11;
}

- (void)setRecordAccessGrantedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id recordAccessGrantedBlock;
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
    block[2] = sub_18A7E34A8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    recordAccessGrantedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordAccessGrantedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    recordAccessGrantedBlock = self->_recordAccessGrantedBlock;
    self->_recordAccessGrantedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)recordAccessGrantedBlock
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
    v15 = sub_18A7E3650;
    v16 = sub_18A7E3678;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7E3680;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordAccessGrantedBlock);
  }
  return v8;
}

- (void)setRecordAccessRevokedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id recordAccessRevokedBlock;
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
    block[2] = sub_18A7E37DC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    recordAccessRevokedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordAccessRevokedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    recordAccessRevokedBlock = self->_recordAccessRevokedBlock;
    self->_recordAccessRevokedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)recordAccessRevokedBlock
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
    v15 = sub_18A7E3650;
    v16 = sub_18A7E3678;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7E3984;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordAccessRevokedBlock);
  }
  return v8;
}

- (void)setRecordAccessCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id recordAccessCompletionBlock;
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
    block[2] = sub_18A7E3AE0;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    recordAccessCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordAccessCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    recordAccessCompletionBlock = self->_recordAccessCompletionBlock;
    self->_recordAccessCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)recordAccessCompletionBlock
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
    v15 = sub_18A7E3650;
    v16 = sub_18A7E3678;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7E3C88;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordAccessCompletionBlock);
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
  objc_msgSend_recordIDsToGrant(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToGrant_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_recordIDsToRevoke(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToRevoke_(v4, v15, (uint64_t)v14, v16);

  v17.receiver = self;
  v17.super_class = (Class)CKModifyRecordAccessOperation;
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
  v17.super_class = (Class)CKModifyRecordAccessOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v17, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordIDsToGrant(v4, v5, v6, v7, v17.receiver, v17.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDsToGrant_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_recordIDsToRevoke(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setRecordIDsToRevoke_(self, v15, (uint64_t)v14, v16);
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
  v17.super_class = (Class)CKModifyRecordAccessOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v17, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_recordAccessGrantedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_recordAccessRevokedBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_recordAccessCompletionBlock(self, v11, v12, v13);
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
  objc_msgSend_recordIDsToGrant(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v7, v8, v9))
  {

  }
  else
  {
    objc_msgSend_recordIDsToRevoke(self, v10, v11, v12);
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
  objc_msgSend_recordIDsToGrant(self, v22, v23, v24);
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
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v73, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected recordID to grant access passed to %@: %@"), v72, v32);
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
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v41, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't grant access to the same record ID twice in a single operation: %@"), v32);
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
  objc_msgSend_recordIDsToRevoke(self, v48, v49, v50);
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
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v76, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected recordID to revoke access passed to %@: %@"), v75, v56);
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
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v65, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't grant and revoke access to the same record ID in a single operation: %@"), v56);
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
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v67, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't revoke access to the same record ID twice in a single operation: %@"), v56);
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
  v80.super_class = (Class)CKModifyRecordAccessOperation;
  v70 = -[CKDatabaseOperation CKOperationShouldRun:](&v80, sel_CKOperationShouldRun_, v4);
LABEL_41:

  return v70;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performModifyRecordAccessOperation_withBlock_;
}

- (void)handleRecordAccessInitiationForRecordID:(id)a3 accessToken:(id)a4 referenceIdentifier:(id)a5 error:(id)a6
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
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v27, OS_SIGNPOST_EVENT, v33, "CKModifyRecordAccessOperation", "Record %@ access granted with error: %@", (uint8_t *)&v58, 0x16u);
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
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v41, OS_SIGNPOST_EVENT, v47, "CKModifyRecordAccessOperation", "Record %@ access granted", (uint8_t *)&v58, 0xCu);
      }

    }
    objc_msgSend_grantedRecordIDs(self, v19, v20, v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v34, v48, (uint64_t)v10, v49);
  }

  objc_msgSend_recordAccessGrantedBlock(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend_recordAccessGrantedBlock(self, v54, v55, v56);
    v57 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, void *))v57)[2](v57, v10, v11, v12, v16);

  }
}

- (void)handleRecordAccessRevocationForRecordID:(id)a3 error:(id)a4
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
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v21, OS_SIGNPOST_EVENT, v27, "CKModifyRecordAccessOperation", "Record %@ access revoked with error: %@", (uint8_t *)&v52, 0x16u);
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
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v35, OS_SIGNPOST_EVENT, v41, "CKModifyRecordAccessOperation", "Record %@ access revoked", (uint8_t *)&v52, 0xCu);
      }

    }
    objc_msgSend_revokedRecordIDs(self, v13, v14, v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v28, v42, (uint64_t)v6, v43);
  }

  objc_msgSend_recordAccessRevokedBlock(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_recordAccessRevokedBlock(self, v48, v49, v50);
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
  void (**v38)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  objc_super v55;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKModifyRecordAccessOperation", "Finishing", buf, 2u);
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

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to grant/revoke access to some records"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_recordAccessCompletionBlock(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend_recordAccessCompletionBlock(self, v35, v36, v37);
    v38 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_grantedRecordIDs(self, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_revokedRecordIDs(self, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v38)[2](v38, v42, v46, v50);

    objc_msgSend_setRecordAccessCompletionBlock_(self, v51, 0, v52);
  }
  objc_msgSend_setRecordAccessGrantedBlock_(self, v35, 0, v37);
  objc_msgSend_setRecordAccessRevokedBlock_(self, v53, 0, v54);
  v55.receiver = self;
  v55.super_class = (Class)CKModifyRecordAccessOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v55, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKModifyRecordAccessOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKModifyRecordAccessOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/modify-record-access", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleRecordAccessInitiationForRecordID_accessToken_referenceIdentifier_error_, 3, 0);

  CKErrorUserInfoClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleRecordAccessRevocationForRecordID_error_, 1, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKModifyRecordAccessOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);

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

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
  objc_storeStrong((id *)&self->_recordErrors, a3);
}

- (NSMutableArray)grantedRecordIDs
{
  return self->_grantedRecordIDs;
}

- (void)setGrantedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_grantedRecordIDs, a3);
}

- (NSMutableArray)revokedRecordIDs
{
  return self->_revokedRecordIDs;
}

- (void)setRevokedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_revokedRecordIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revokedRecordIDs, 0);
  objc_storeStrong((id *)&self->_grantedRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_recordIDsToRevoke, 0);
  objc_storeStrong((id *)&self->_recordIDsToGrant, 0);
  objc_storeStrong(&self->_recordAccessCompletionBlock, 0);
  objc_storeStrong(&self->_recordAccessRevokedBlock, 0);
  objc_storeStrong(&self->_recordAccessGrantedBlock, 0);
}

@end
