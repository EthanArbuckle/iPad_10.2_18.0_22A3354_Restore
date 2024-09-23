@implementation CKModifyRecordZonesOperation

- (CKModifyRecordZonesOperation)init
{
  CKModifyRecordZonesOperation *v2;
  uint64_t v3;
  NSMutableDictionary *recordZonesByZoneIDs;
  uint64_t v5;
  NSMutableDictionary *recordZoneErrors;
  uint64_t v7;
  NSMutableArray *savedRecordZones;
  uint64_t v9;
  NSMutableArray *deletedRecordZoneIDs;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKModifyRecordZonesOperation;
  v2 = -[CKOperation init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordZonesByZoneIDs = v2->_recordZonesByZoneIDs;
    v2->_recordZonesByZoneIDs = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    recordZoneErrors = v2->_recordZoneErrors;
    v2->_recordZoneErrors = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    savedRecordZones = v2->_savedRecordZones;
    v2->_savedRecordZones = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    deletedRecordZoneIDs = v2->_deletedRecordZoneIDs;
    v2->_deletedRecordZoneIDs = (NSMutableArray *)v9;

  }
  return v2;
}

- (CKModifyRecordZonesOperation)initWithRecordZonesToSave:(NSArray *)recordZonesToSave recordZoneIDsToDelete:(NSArray *)recordZoneIDsToDelete
{
  NSArray *v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKModifyRecordZonesOperation *v14;
  uint64_t v15;
  NSArray *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;

  v6 = recordZonesToSave;
  v7 = recordZoneIDsToDelete;
  v14 = (CKModifyRecordZonesOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    v15 = objc_msgSend_copy(v6, v11, v12, v13);
    v16 = v14->_recordZonesToSave;
    v14->_recordZonesToSave = (NSArray *)v15;

    v20 = objc_msgSend_copy(v7, v17, v18, v19);
    v21 = v14->_recordZoneIDsToDelete;
    v14->_recordZoneIDsToDelete = (NSArray *)v20;

  }
  return v14;
}

- (void)setPerRecordZoneSaveBlock:(void *)perRecordZoneSaveBlock
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = perRecordZoneSaveBlock;
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
    block[2] = sub_18A6CF8F8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordZoneSaveBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perRecordZoneSaveBlock;
    self->_perRecordZoneSaveBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perRecordZoneSaveBlock
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
    v15 = sub_18A6CFAA0;
    v16 = sub_18A6CFAC8;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A6CFAD0;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordZoneSaveBlock);
  }
  return v8;
}

- (void)setPerRecordZoneDeleteBlock:(void *)perRecordZoneDeleteBlock
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = perRecordZoneDeleteBlock;
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
    block[2] = sub_18A6CFC2C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordZoneDeleteBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perRecordZoneDeleteBlock;
    self->_perRecordZoneDeleteBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perRecordZoneDeleteBlock
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
    v15 = sub_18A6CFAA0;
    v16 = sub_18A6CFAC8;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A6CFDD4;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordZoneDeleteBlock);
  }
  return v8;
}

- (void)setModifyRecordZonesCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id modifyRecordZonesCompletionBlock;
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
    block[2] = sub_18A6CFF30;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    modifyRecordZonesCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_modifyRecordZonesCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    modifyRecordZonesCompletionBlock = self->_modifyRecordZonesCompletionBlock;
    self->_modifyRecordZonesCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)modifyRecordZonesCompletionBlock
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
    v15 = sub_18A6CFAA0;
    v16 = sub_18A6CFAC8;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A6D00D8;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_modifyRecordZonesCompletionBlock);
  }
  return v8;
}

- (void)setModifyRecordZonesCompletionBlock:(void *)modifyRecordZonesCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = modifyRecordZonesCompletionBlock == 0;
  v9 = modifyRecordZonesCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setModifyRecordZonesCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

}

- (id)relevantZoneIDs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;
  NSArray *recordZonesToSave;

  v5 = objc_msgSend_count(self->_recordZonesToSave, a2, v2, v3);
  v9 = (NSArray *)objc_msgSend_count(self->_recordZoneIDsToDelete, v6, v7, v8);
  if (v5)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (v5)
    {
      recordZonesToSave = self->_recordZonesToSave;
    }
    else
    {
      if (!v9)
        return v9;
      recordZonesToSave = self->_recordZoneIDsToDelete;
    }
    v9 = recordZonesToSave;
    return v9;
  }
  objc_msgSend_arrayByAddingObjectsFromArray_(self->_recordZonesToSave, v10, (uint64_t)self->_recordZoneIDsToDelete, v11);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  return v9;
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
  objc_super v23;

  v4 = a3;
  objc_msgSend_recordZonesToSave(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZonesToSave_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_recordZoneIDsToDelete(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDsToDelete_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_markZonesAsUserPurged(self, v17, v18, v19);
  objc_msgSend_setMarkZonesAsUserPurged_(v4, v21, v20, v22);
  v23.receiver = self;
  v23.super_class = (Class)CKModifyRecordZonesOperation;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKModifyRecordZonesOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v23, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordZonesToSave(v4, v5, v6, v7, v23.receiver, v23.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZonesToSave_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_recordZoneIDsToDelete(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDsToDelete_(self, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_markZonesAsUserPurged(v4, v17, v18, v19);
  objc_msgSend_setMarkZonesAsUserPurged_(self, v21, v20, v22);
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
  v17.super_class = (Class)CKModifyRecordZonesOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v17, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perRecordZoneSaveBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_perRecordZoneDeleteBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_modifyRecordZonesCompletionBlock(self, v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15 != 0;

    }
  }

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
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
  objc_class *v54;
  const char *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  const char *v59;
  BOOL v60;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  objc_super v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  objc_msgSend_recordZonesToSave(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v73, (uint64_t)v78, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v74;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v74 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a3)
          goto LABEL_41;
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v55, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected record zone object passed to %@: %@"), v20, v14);
        goto LABEL_38;
      }
      objc_msgSend_zoneID(v14, v15, v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v19, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Record zone object missing unique client id %@"), v14);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          goto LABEL_39;
        }
        v20 = 0;
        goto LABEL_40;
      }
      v20 = (void *)v18;
      if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v19, v18, (uint64_t)a3))
        goto LABEL_40;
      objc_msgSend_setObject_forKeyedSubscript_(self->_recordZonesByZoneIDs, v21, (uint64_t)v14, (uint64_t)v20);
      if (objc_msgSend_containsObject_(v4, v22, (uint64_t)v20, v23))
        break;
      objc_msgSend_addObject_(v4, v24, (uint64_t)v20, v25);

      if (v11 == ++v13)
      {
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v26, (uint64_t)&v73, (uint64_t)v78, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    if (!a3)
      goto LABEL_40;
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v24, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't save the same record zone twice %@"), v14);
    goto LABEL_38;
  }
LABEL_12:

  v8 = (void *)objc_opt_new();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend_recordZoneIDsToDelete(self, v27, v28, v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v30, (uint64_t)&v69, (uint64_t)v77, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v70;
LABEL_14:
    v34 = 0;
    while (1)
    {
      if (*(_QWORD *)v70 != v33)
        objc_enumerationMutation(v20);
      v35 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v34);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v59, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected recordZoneID in property recordZoneIDsToDelete passed to %@: %@"), v58, v35);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_40;
      }
      if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v36, v35, (uint64_t)a3))
        goto LABEL_40;
      if (objc_msgSend_containsObject_(v4, v37, v35, v38))
      {
        if (!a3)
          goto LABEL_40;
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't save and delete the same zone (%@) in the same operation"), v35);
        goto LABEL_38;
      }
      if (objc_msgSend_containsObject_(v8, v39, v35, v40))
        break;
      objc_msgSend_addObject_(v8, v41, v35, v42);
      if (v32 == ++v34)
      {
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v43, (uint64_t)&v69, (uint64_t)v77, 16);
        if (v32)
          goto LABEL_14;
        goto LABEL_23;
      }
    }
    if (!a3)
      goto LABEL_40;
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v41, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't delete the same zone (%@) twice in the same operation"), v35);
LABEL_38:
    v56 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
    *a3 = v56;
LABEL_40:

    goto LABEL_41;
  }
LABEL_23:

  objc_msgSend_recordZonesToSave(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v47, v48, v49, v50))
  {

LABEL_44:
    v68.receiver = self;
    v68.super_class = (Class)CKModifyRecordZonesOperation;
    v60 = -[CKDatabaseOperation CKOperationShouldRun:](&v68, sel_CKOperationShouldRun_, a3);
    goto LABEL_42;
  }
  objc_msgSend_recordZoneIDsToDelete(self, v51, v52, v53);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_count(v62, v63, v64, v65);

  if (v66)
    goto LABEL_44;
LABEL_41:
  v60 = 0;
LABEL_42:

  return v60;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performModifyRecordZonesOperation_withBlock_;
}

- (void)performCKOperation
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    objc_msgSend_operationID(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordZonesToSave(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordZoneIDsToDelete(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v22 = v8;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v16;
    v27 = 1024;
    v28 = objc_msgSend_markZonesAsUserPurged(self, v17, v18, v19);
    _os_log_debug_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_DEBUG, "Modifying record zones with operation %{public}@ zonesToSave=%@ zonesToDelete=%@ markZonesAsUserPurged=%d", buf, 0x26u);

  }
  v20.receiver = self;
  v20.super_class = (Class)CKModifyRecordZonesOperation;
  -[CKOperation performCKOperation](&v20, sel_performCKOperation);
}

- (void)handleSaveForRecordZoneID:(id)a3 recordZone:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CKSignpost *signpost;
  CKSignpost *v15;
  const char *v16;
  uint64_t v17;
  CKSignpost *v18;
  CKSignpost *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  CKSignpost *v24;
  CKSignpost *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  uint32_t v33;
  CKSignpost *v34;
  CKSignpost *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  CKSignpost *v39;
  CKSignpost *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  const char *v62;
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
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t isExpired;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void (**v113)(void *, id, void *, void *);
  void *v114;
  id v115;
  void *v116;
  void *v117;
  NSObject *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  _BYTE v123[24];
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v15 = signpost;

  if (v13)
  {
    if (!v15)
      goto LABEL_22;
    if (self)
      v18 = self->super.super._signpost;
    else
      v18 = 0;
    v19 = v18;
    objc_msgSend_log(v19, v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    if (self)
      v24 = self->super.super._signpost;
    else
      v24 = 0;
    v25 = v24;
    v29 = objc_msgSend_identifier(v25, v26, v27, v28);

    if ((unint64_t)(v29 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v23))
      goto LABEL_21;
    *(_DWORD *)v123 = 138412546;
    *(_QWORD *)&v123[4] = v8;
    *(_WORD *)&v123[12] = 2112;
    *(_QWORD *)&v123[14] = v13;
    v30 = "Record zone %@ saved with error: %@";
    v31 = v23;
    v32 = v29;
    v33 = 22;
    goto LABEL_20;
  }
  if (!v15)
    goto LABEL_22;
  if (self)
    v34 = self->super.super._signpost;
  else
    v34 = 0;
  v35 = v34;
  objc_msgSend_log(v35, v36, v37, v38);
  v23 = objc_claimAutoreleasedReturnValue();

  if (self)
    v39 = self->super.super._signpost;
  else
    v39 = 0;
  v40 = v39;
  v44 = objc_msgSend_identifier(v40, v41, v42, v43);

  if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_DWORD *)v123 = 138412290;
    *(_QWORD *)&v123[4] = v8;
    v30 = "Record zone %@ saved";
    v31 = v23;
    v32 = v44;
    v33 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v31, OS_SIGNPOST_EVENT, v32, "CKModifyRecordZonesOperation", v30, v123, v33);
  }
LABEL_21:

LABEL_22:
  if (self)
    objc_msgSend_objectForKeyedSubscript_(self->_recordZonesByZoneIDs, v16, (uint64_t)v8, v17, *(_OWORD *)v123, *(_QWORD *)&v123[16]);
  else
    objc_msgSend_objectForKeyedSubscript_(0, v16, (uint64_t)v8, v17, *(_OWORD *)v123, *(_QWORD *)&v123[16]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_resolvedConfiguration(self, v45, v46, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend_returnPCSMetadata(v57, v58, v59, v60);

    if (v61)
    {
      objc_msgSend_pcsKeyID(v9, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPcsKeyID_(v48, v66, (uint64_t)v65, v67);

      objc_msgSend_zoneishKeyID(v9, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneishKeyID_(v48, v72, (uint64_t)v71, v73);

    }
    v74 = objc_msgSend_capabilities(v9, v62, v63, v64);
    objc_msgSend_setCapabilities_(v48, v75, v74, v76);
    objc_msgSend_expirationDate(v9, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExpirationDate_(v48, v81, (uint64_t)v80, v82);

    isExpired = objc_msgSend_isExpired(v9, v83, v84, v85);
    objc_msgSend_setExpired_(v48, v87, isExpired, v88);
    objc_msgSend_setHasUpdatedExpirationTimeInterval_(v48, v89, 0, v90);
    objc_msgSend_setUpdatedExpirationTimeInterval_(v48, v91, 0, v92);
    objc_msgSend_requiredFeatures(v9, v93, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequiredFeatures_(v48, v97, (uint64_t)v96, v98);

    objc_msgSend_originalRequiredFeatures(v9, v99, v100, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOriginalRequiredFeatures_(v48, v103, (uint64_t)v102, v104);

  }
  if ((objc_msgSend_canDropItemResultsEarly(self, v45, v46, v47) & 1) == 0)
  {
    if (v13)
    {
      if (self)
        objc_msgSend_setObject_forKeyedSubscript_(self->_recordZoneErrors, v105, (uint64_t)v13, (uint64_t)v8);
      else
        objc_msgSend_setObject_forKeyedSubscript_(0, v105, (uint64_t)v13, (uint64_t)v8);
    }
    else if (self)
    {
      objc_msgSend_addObject_(self->_savedRecordZones, v105, (uint64_t)v48, v107);
    }
    else
    {
      objc_msgSend_addObject_(0, v105, (uint64_t)v48, v107);
    }
  }
  objc_msgSend_perRecordZoneSaveBlock_wrapper(self, v105, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v108;
  if (v108)
  {
    v113 = (void (**)(void *, id, void *, void *))_Block_copy(v108);
  }
  else
  {
    objc_msgSend_perRecordZoneSaveBlock(self, v109, v110, v111);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = (void (**)(void *, id, void *, void *))_Block_copy(v114);

  }
  if (v113)
  {
    v115 = v48;
    v116 = v115;
    if (v13)
    {

      v116 = 0;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v117 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v118 = v117;
      objc_msgSend_operationID(self, v119, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v123 = 138543874;
      *(_QWORD *)&v123[4] = v122;
      *(_WORD *)&v123[12] = 2112;
      *(_QWORD *)&v123[14] = v8;
      *(_WORD *)&v123[22] = 2112;
      v124 = v13;
      _os_log_debug_impl(&dword_18A5C5000, v118, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about saved zone with ID %@: %@", v123, 0x20u);

    }
    v113[2](v113, v8, v116, v13);

  }
}

- (void)handleDeleteForRecordZoneID:(id)a3 error:(id)a4
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
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  uint32_t v31;
  CKSignpost *v32;
  CKSignpost *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  CKSignpost *v37;
  CKSignpost *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void (**v54)(void *, id, void *);
  void *v55;
  void *v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _BYTE v62[24];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v12 = signpost;

  if (!v10)
  {
    if (!v12)
    {
      if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0)
        goto LABEL_28;
      goto LABEL_30;
    }
    if (self)
      v32 = self->super.super._signpost;
    else
      v32 = 0;
    v33 = v32;
    objc_msgSend_log(v33, v34, v35, v36);
    v21 = objc_claimAutoreleasedReturnValue();

    if (self)
      v37 = self->super.super._signpost;
    else
      v37 = 0;
    v38 = v37;
    v42 = objc_msgSend_identifier(v38, v39, v40, v41);

    if ((unint64_t)(v42 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21))
      goto LABEL_21;
    *(_DWORD *)v62 = 138412290;
    *(_QWORD *)&v62[4] = v6;
    v28 = "Record zone %@ deleted";
    v29 = v21;
    v30 = v42;
    v31 = 12;
    goto LABEL_20;
  }
  if (!v12)
  {
    if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0)
      goto LABEL_25;
    goto LABEL_30;
  }
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

  if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)v62 = 138412546;
    *(_QWORD *)&v62[4] = v6;
    *(_WORD *)&v62[12] = 2112;
    *(_QWORD *)&v62[14] = v10;
    v28 = "Record zone %@ deleted with error: %@";
    v29 = v21;
    v30 = v27;
    v31 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v29, OS_SIGNPOST_EVENT, v30, "CKModifyRecordZonesOperation", v28, v62, v31);
  }
LABEL_21:

  if ((objc_msgSend_canDropItemResultsEarly(self, v43, v44, v45) & 1) == 0)
  {
    if (!v10)
    {
LABEL_28:
      if (self)
        objc_msgSend_addObject_(self->_deletedRecordZoneIDs, v46, (uint64_t)v6, v48, *(_QWORD *)v62, *(_OWORD *)&v62[8]);
      else
        objc_msgSend_addObject_(0, v46, (uint64_t)v6, v48, *(_QWORD *)v62, *(_OWORD *)&v62[8]);
      goto LABEL_30;
    }
LABEL_25:
    if (self)
      objc_msgSend_setObject_forKeyedSubscript_(self->_recordZoneErrors, v46, (uint64_t)v10, (uint64_t)v6, *(_OWORD *)v62, *(_QWORD *)&v62[16]);
    else
      objc_msgSend_setObject_forKeyedSubscript_(0, v46, (uint64_t)v10, (uint64_t)v6, *(_OWORD *)v62, *(_QWORD *)&v62[16]);
  }
LABEL_30:
  objc_msgSend_perRecordZoneDeleteBlock_wrapper(self, v46, v47, v48, *(_QWORD *)v62, *(_QWORD *)&v62[8]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v49;
  if (v49)
  {
    v54 = (void (**)(void *, id, void *))_Block_copy(v49);
  }
  else
  {
    objc_msgSend_perRecordZoneDeleteBlock(self, v50, v51, v52);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void (**)(void *, id, void *))_Block_copy(v55);

  }
  if (v54)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v56 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v57 = v56;
      objc_msgSend_operationID(self, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v62 = 138543874;
      *(_QWORD *)&v62[4] = v61;
      *(_WORD *)&v62[12] = 2112;
      *(_QWORD *)&v62[14] = v6;
      *(_WORD *)&v62[22] = 2112;
      v63 = v10;
      _os_log_debug_impl(&dword_18A5C5000, v57, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about deleted zone with ID %@: %@", v62, 0x20u);

    }
    v54[2](v54, v6, v10);
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
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void (**v53)(void *, NSMutableArray *, id, void *);
  void *v54;
  const char *v55;
  uint64_t v56;
  NSMutableArray *v57;
  NSMutableArray *deletedRecordZoneIDs;
  NSMutableArray *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  objc_super v68;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKModifyRecordZonesOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    if (self)
      v22 = objc_msgSend_count(self->_recordZoneErrors, v7, v8, v9);
    else
      v22 = objc_msgSend_count(0, v7, v8, v9);
    if (v22)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23;
      if (self)
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)self->_recordZoneErrors, (uint64_t)CFSTR("CKPartialErrors"));
      else
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, 0, (uint64_t)CFSTR("CKPartialErrors"));
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v25, CFSTR("Failed to modify some record zones"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  if (self)
    objc_msgSend_allKeys(self->_recordZonesByZoneIDs, v7, v8, v9);
  else
    objc_msgSend_allKeys(0, v7, v8, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_count(v27, v28, v29, v30);

  if (v31)
  {
    v35 = (void *)MEMORY[0x1E0C99E20];
    if (self)
      objc_msgSend_allKeys(self->_recordZonesByZoneIDs, v32, v33, v34);
    else
      objc_msgSend_allKeys(0, v32, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v35, v37, (uint64_t)v36, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_zoneIDsToZoneNamesString_(self, v40, (uint64_t)v39, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v46, v47, (uint64_t)v42, (uint64_t)CFSTR("zoneNames"));

  }
  objc_msgSend_modifyRecordZonesCompletionBlock_wrapper(self, v32, v33, v34);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v48;
  if (v48)
  {
    v53 = (void (**)(void *, NSMutableArray *, id, void *))_Block_copy(v48);
  }
  else
  {
    objc_msgSend_modifyRecordZonesCompletionBlock(self, v49, v50, v51);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void (**)(void *, NSMutableArray *, id, void *))_Block_copy(v54);

  }
  if (v53)
  {
    if (self)
    {
      v57 = self->_savedRecordZones;
      deletedRecordZoneIDs = self->_deletedRecordZoneIDs;
    }
    else
    {
      v57 = 0;
      deletedRecordZoneIDs = 0;
    }
    v59 = deletedRecordZoneIDs;
    objc_msgSend_CKClientSuitableError(v4, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2](v53, v57, v59, v63);

    objc_msgSend_setModifyRecordZonesCompletionBlock_(self, v64, 0, v65);
  }
  objc_msgSend_setPerRecordZoneSaveBlock_(self, v55, 0, v56);
  objc_msgSend_setPerRecordZoneDeleteBlock_(self, v66, 0, v67);
  v68.receiver = self;
  v68.super_class = (Class)CKModifyRecordZonesOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v68, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKModifyRecordZonesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKModifyRecordZonesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/modify-record-zones", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleDeleteForRecordZoneID_error_, 1, 0);

  CKErrorUserInfoClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleSaveForRecordZoneID_recordZone_error_, 2, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKModifyRecordZonesOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(NSArray *)recordZonesToSave
{
  objc_setProperty_nonatomic_copy(self, a2, recordZonesToSave, 544);
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(NSArray *)recordZoneIDsToDelete
{
  objc_setProperty_nonatomic_copy(self, a2, recordZoneIDsToDelete, 552);
}

- (id)perRecordZoneSaveBlock_wrapper
{
  return self->_perRecordZoneSaveBlock_wrapper;
}

- (void)setPerRecordZoneSaveBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (id)perRecordZoneDeleteBlock_wrapper
{
  return self->_perRecordZoneDeleteBlock_wrapper;
}

- (void)setPerRecordZoneDeleteBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (id)modifyRecordZonesCompletionBlock_wrapper
{
  return self->_modifyRecordZonesCompletionBlock_wrapper;
}

- (void)setModifyRecordZonesCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (BOOL)markZonesAsUserPurged
{
  return self->_markZonesAsUserPurged;
}

- (void)setMarkZonesAsUserPurged:(BOOL)a3
{
  self->_markZonesAsUserPurged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modifyRecordZonesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordZoneDeleteBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordZoneSaveBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_recordZoneErrors, 0);
  objc_storeStrong((id *)&self->_recordZonesByZoneIDs, 0);
  objc_storeStrong((id *)&self->_deletedRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_savedRecordZones, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
  objc_storeStrong(&self->_modifyRecordZonesCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordZoneDeleteBlock, 0);
  objc_storeStrong(&self->_perRecordZoneSaveBlock, 0);
}

@end
