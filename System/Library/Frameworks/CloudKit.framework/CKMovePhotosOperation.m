@implementation CKMovePhotosOperation

- (CKMovePhotosOperation)init
{
  CKMovePhotosOperation *v2;
  uint64_t v3;
  NSMutableDictionary *recordErrorsBySourceRecordID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKMovePhotosOperation;
  v2 = -[CKOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordErrorsBySourceRecordID = v2->_recordErrorsBySourceRecordID;
    v2->_recordErrorsBySourceRecordID = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (CKMovePhotosOperation)initWithMoveChanges:(id)a3 sourceDatabase:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CKMovePhotosOperation *v13;

  v7 = a3;
  v8 = a4;
  v12 = objc_msgSend_init(self, v9, v10, v11);
  v13 = (CKMovePhotosOperation *)v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 536), a3);
    objc_storeStrong((id *)&v13->_sourceDatabase, a4);
  }

  return v13;
}

- (void)setPerRecordProgressBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perRecordProgressBlock;
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
    block[2] = sub_18A753470;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perRecordProgressBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordProgressBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perRecordProgressBlock = self->_perRecordProgressBlock;
    self->_perRecordProgressBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perRecordProgressBlock
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
    v15 = sub_18A753618;
    v16 = sub_18A753640;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A753648;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordProgressBlock);
  }
  return v8;
}

- (void)setPerRecordMoveBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perRecordMoveBlock;
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
    block[2] = sub_18A7537A4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perRecordMoveBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perRecordMoveBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perRecordMoveBlock = self->_perRecordMoveBlock;
    self->_perRecordMoveBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perRecordMoveBlock
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
    v15 = sub_18A753618;
    v16 = sub_18A753640;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A75394C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perRecordMoveBlock);
  }
  return v8;
}

- (void)setMovePhotosCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id movePhotosCompletionBlock;
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
    block[2] = sub_18A753AA8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    movePhotosCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_movePhotosCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    movePhotosCompletionBlock = self->_movePhotosCompletionBlock;
    self->_movePhotosCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)movePhotosCompletionBlock
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
    v15 = sub_18A753618;
    v16 = sub_18A753640;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A753C50;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_movePhotosCompletionBlock);
  }
  return v8;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/move-photos", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKMovePhotosOperation;
  v4 = a3;
  -[CKDatabaseOperation fillOutOperationInfo:](&v23, sel_fillOutOperationInfo_, v4);
  objc_msgSend_moveChanges(self, v5, v6, v7, v23.receiver, v23.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMoveChanges_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_sourceDatabase(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_scope(v14, v15, v16, v17);
  objc_msgSend_setSourceDatabaseScope_(v4, v19, v18, v20);

  objc_msgSend_setAlwaysFetchPCSFromServer_(v4, v21, 1, v22);
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
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKMovePhotosOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v28, sel_fillFromOperationInfo_, v4);
  objc_msgSend_moveChanges(v4, v5, v6, v7, v28.receiver, v28.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMoveChanges_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_configuration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_sourceDatabaseScope(v4, v19, v20, v21);

  objc_msgSend_databaseWithDatabaseScope_(v18, v23, v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceDatabase_(self, v26, (uint64_t)v25, v27);

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
  v17.super_class = (Class)CKMovePhotosOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v17, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perRecordProgressBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_perRecordMoveBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_movePhotosCompletionBlock(self, v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15 != 0;

    }
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
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  int v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  objc_class *v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  int OnlyManatee;
  objc_class *v109;
  void *v110;
  const char *v111;
  objc_class *v112;
  const char *v113;
  objc_class *v114;
  const char *v115;
  void *v116;
  const char *v117;
  const char *v118;
  id obj;
  void *v121;
  objc_super v122;
  _QWORD v123[5];
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint64_t v128;
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  objc_msgSend_moveChanges(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (!v10)
    return v10;
  objc_msgSend_sourceDatabase(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (a3)
    {
      v93 = (objc_class *)objc_opt_class();
      NSStringFromClass(v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v95, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You must specify a sourceDatabase on %@"), v94);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    LOBYTE(v10) = 0;
    return v10;
  }
  v121 = (void *)objc_opt_new();
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  objc_msgSend_moveChanges(self, v15, v16, v17);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v124, (uint64_t)v129, 16);
  if (!v19)
    goto LABEL_18;
  v23 = v19;
  v24 = *(_QWORD *)v125;
  while (2)
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v125 != v24)
        objc_enumerationMutation(obj);
      objc_msgSend_destinationRecord(*(void **)(*((_QWORD *)&v124 + 1) + 8 * i), v20, v21, v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a3)
          goto LABEL_42;
        v109 = (objc_class *)objc_opt_class();
        NSStringFromClass(v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v111, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected record in property destinationRecords passed to %@: %@"), v110, v26);
LABEL_33:
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_42;
      }
      objc_msgSend_recordID(v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v35, (uint64_t)v34, (uint64_t)a3);

      if (!v36)
        goto LABEL_42;
      if (objc_msgSend_containsIndexedKeys(v26, v37, v38, v39))
      {
        if (!a3)
          goto LABEL_42;
        v112 = (objc_class *)objc_opt_class();
        NSStringFromClass(v112);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v113, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Moved records must not have array-indexed keys %@: %@"), v110, v26);
        goto LABEL_33;
      }
      if (objc_msgSend_containsPackageValues(v26, v40, v41, v42))
      {
        if (!a3)
          goto LABEL_42;
        v114 = (objc_class *)objc_opt_class();
        NSStringFromClass(v114);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v115, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Moved records must not have packages %@: %@"), v110, v26);
        goto LABEL_33;
      }
      objc_msgSend_valueStore(v26, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v47, (uint64_t)&v128, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v123[0] = MEMORY[0x1E0C809B0];
      v123[1] = 3221225472;
      v123[2] = sub_18A7544EC;
      v123[3] = &unk_1E1F63F18;
      v123[4] = self;
      v50 = objc_msgSend_containsValueOfClasses_passingTest_(v46, v49, (uint64_t)v48, (uint64_t)v123);

      if (v50)
      {
        if (a3)
        {
          objc_msgSend_recordID(v26, v51, v52, v53);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v117, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Invalid CKAssetReference on record %@"), v116);
LABEL_39:
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_42:

        goto LABEL_43;
      }
      objc_msgSend_recordType(v26, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v54, v55, (uint64_t)CFSTR("cloudkit.share"), v56))
      {

LABEL_37:
        if (a3)
        {
          objc_msgSend_recordID(v26, v61, v62, v63);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v118, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You may not move shares or shared records %@"), v116);
          goto LABEL_39;
        }
        goto LABEL_42;
      }
      objc_msgSend_share(v26, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
        goto LABEL_37;
      objc_msgSend_recordID(v26, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend_containsObject_(v121, v65, (uint64_t)v64, v66);

      if (v67)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v68, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't move the same record twice: %@"), v26);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_42;
      }
      objc_msgSend_recordID(v26, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v121, v72, (uint64_t)v71, v73);

    }
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v124, (uint64_t)v129, 16);
    if (v23)
      continue;
    break;
  }
LABEL_18:

  objc_msgSend_configuration(self, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v77, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_bypassPCSEncryption(v85, v86, v87, v88))
  {

LABEL_24:
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v92, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("This container has requested no encryption but encryption is required when moving records"));
      LOBYTE(v10) = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_43:
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    objc_msgSend_configuration(self, v89, v90, v91);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v96, v97, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v100, v101, v102, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(v104, v105, v106, v107);

    if (OnlyManatee)
      goto LABEL_24;
    v122.receiver = self;
    v122.super_class = (Class)CKMovePhotosOperation;
    LOBYTE(v10) = -[CKDatabaseOperation CKOperationShouldRun:](&v122, sel_CKOperationShouldRun_, a3);
  }

  return v10;
}

- (void)_trackAssetsToUpload
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  CKMovePhotosOperation *v34;
  id obj;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = self;
  objc_msgSend_moveChanges(self, v4, v5, v6);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v38, (uint64_t)v43, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v39;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(obj);
        objc_msgSend_destinationRecord(*(void **)(*((_QWORD *)&v38 + 1) + 8 * v15), v9, v10, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueStore(v16, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_opt_class();
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)&v42, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v14;
        v36[1] = 3221225472;
        v36[2] = sub_18A754854;
        v36[3] = &unk_1E1F62268;
        v37 = v3;
        objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v20, v23, (uint64_t)v22, (uint64_t)v36);

        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v38, (uint64_t)v43, 16);
    }
    while (v12);
  }

  objc_msgSend_deviceContext(v34, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceScopedStateManager(v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trackAssets_(v31, v32, (uint64_t)v3, v33);

}

+ (SEL)daemonInvocationSelector
{
  return sel_performMovePhotosOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
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
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  objc_msgSend_moveChanges(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMapToDictionary_(v5, v6, (uint64_t)&unk_1E1F58658, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMoveChangesBySourceRecordID_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_moveChanges(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMapToDictionary_(v14, v15, (uint64_t)&unk_1E1F592B8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMoveChangesByDestinationRecordID_(self, v18, (uint64_t)v17, v19);

  objc_msgSend__trackAssetsToUpload(self, v20, v21, v22);
  v23.receiver = self;
  v23.super_class = (Class)CKMovePhotosOperation;
  -[CKOperation performCKOperation](&v23, sel_performCKOperation);
}

- (void)handleMoveForSourceRecordID:(id)a3 destinationMetadata:(id)a4 moveMarkerMetadata:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  id v50;
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
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
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
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  id v235;
  id v236;
  void *v237;
  id v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  void (**v243)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  void *v254;
  NSObject *v255;
  void *v256;
  id v257;
  id v258;
  uint8_t buf[4];
  id v260;
  __int16 v261;
  id v262;
  __int16 v263;
  void *v264;
  __int16 v265;
  void *v266;
  __int16 v267;
  void *v268;
  uint64_t v269;

  v269 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_moveChangesBySourceRecordID(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v10, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_destinationRecord(v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v13, v25, v26, v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend_recordErrorsBySourceRecordID(self, v28, v29, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v32, v33, (uint64_t)v31, (uint64_t)v10);
      v34 = 0;
    }
    else
    {
      objc_msgSend_etag(v11, v28, v29, v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend_etag(v11, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setEtag_(v24, v41, (uint64_t)v40, v42);

      }
      objc_msgSend_creationDate(v11, v37, v38, v39);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_msgSend_creationDate(v11, v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCreationDate_(v24, v48, (uint64_t)v47, v49);

      }
      v50 = v10;
      objc_msgSend_modificationDate(v11, v44, v45, v46);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        objc_msgSend_modificationDate(v11, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setModificationDate_(v24, v56, (uint64_t)v55, v57);

      }
      objc_msgSend_serverRecord(v11, v52, v53, v54);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pluginFields(v58, v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPluginFields_(v24, v63, (uint64_t)v62, v64);

      objc_msgSend_serverRecord(v11, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_creatorUserRecordID(v68, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCreatorUserRecordID_(v24, v73, (uint64_t)v72, v74);

      objc_msgSend_serverRecord(v11, v75, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastModifiedUserRecordID(v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLastModifiedUserRecordID_(v24, v83, (uint64_t)v82, v84);

      objc_msgSend_serverRecord(v11, v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_modifiedByDevice(v88, v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setModifiedByDevice_(v24, v93, (uint64_t)v92, v94);

      objc_msgSend_serverRecord(v11, v95, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_routingKey(v98, v99, v100, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRoutingKey_(v24, v103, (uint64_t)v102, v104);

      objc_msgSend_serverRecord(v11, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mutableEncryptedPSK(v108, v109, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setMutableEncryptedPSK_(v24, v113, (uint64_t)v112, v114);

      objc_msgSend_serverRecord(v11, v115, v116, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_displayedHostname(v118, v119, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDisplayedHostname_(v24, v123, (uint64_t)v122, v124);

      objc_msgSend_serverRecord(v11, v125, v126, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_chainParentPublicKeyID(v128, v129, v130, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setChainParentPublicKeyID_(v24, v133, (uint64_t)v132, v134);

      objc_msgSend_serverRecord(v11, v135, v136, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_chainProtectionInfo(v138, v139, v140, v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setChainProtectionInfo_(v24, v143, (uint64_t)v142, v144);

      objc_msgSend_serverRecord(v11, v145, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_chainPrivateKey(v148, v149, v150, v151);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setChainPrivateKey_(v24, v153, (uint64_t)v152, v154);

      objc_msgSend_setKnownToServer_(v24, v155, 1, v156);
      objc_msgSend_resetChangedKeys(v24, v157, v158, v159);
      objc_msgSend_protectionData(v11, v160, v161, v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setProtectionData_(v24, v164, (uint64_t)v163, v165);

      objc_msgSend_pcsKeyID(v11, v166, v167, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPcsKeyID_(v24, v170, (uint64_t)v169, v171);

      objc_msgSend_allPCSKeyIDs(v11, v172, v173, v174);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAllPCSKeyIDs_(v24, v176, (uint64_t)v175, v177);

      objc_msgSend_zoneishKeyID(v11, v178, v179, v180);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneishKeyID_(v24, v182, (uint64_t)v181, v183);

      objc_msgSend_serverRecord(v12, v184, v185, v186);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_etag(v12, v187, v188, v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();

      if (v190)
      {
        objc_msgSend_etag(v12, v191, v192, v193);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setEtag_(v34, v195, (uint64_t)v194, v196);

      }
      objc_msgSend_creationDate(v12, v191, v192, v193);
      v197 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v50;
      if (v197)
      {
        objc_msgSend_creationDate(v12, v198, v199, v200);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCreationDate_(v34, v202, (uint64_t)v201, v203);

      }
      objc_msgSend_modificationDate(v12, v198, v199, v200);
      v204 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = 0;
      if (v204)
      {
        objc_msgSend_modificationDate(v12, v205, v206, v207);
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setModificationDate_(v34, v209, (uint64_t)v208, v210);

      }
      objc_msgSend_protectionData(v12, v205, v206, v207);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setProtectionData_(v34, v212, (uint64_t)v211, v213);

      objc_msgSend_pcsKeyID(v12, v214, v215, v216);
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPcsKeyID_(v34, v218, (uint64_t)v217, v219);

      objc_msgSend_allPCSKeyIDs(v12, v220, v221, v222);
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAllPCSKeyIDs_(v34, v224, (uint64_t)v223, v225);

      objc_msgSend_zoneishKeyID(v12, v226, v227, v228);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneishKeyID_(v34, v229, (uint64_t)v32, v230);
    }

    objc_msgSend_perRecordMoveBlock(self, v231, v232, v233);
    v234 = (void *)objc_claimAutoreleasedReturnValue();

    if (v234)
    {
      v257 = v12;
      v258 = v13;
      if (v31)
      {
        v235 = 0;
        v236 = 0;
      }
      else
      {
        v235 = v24;
        v236 = v34;
      }
      v237 = v20;
      v238 = v10;
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v239 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v255 = v239;
        objc_msgSend_operationID(self, v244, v245, v246);
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v24, v247, v248, v249);
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v34, v250, v251, v252);
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v260 = v254;
        v261 = 2112;
        v262 = v238;
        v263 = 2112;
        v264 = v256;
        v265 = 2112;
        v266 = v253;
        v267 = 2112;
        v268 = v31;
        _os_log_debug_impl(&dword_18A5C5000, v255, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about moved record with source ID %@ destination ID %@ moveMarker ID %@: %@", buf, 0x34u);

      }
      objc_msgSend_perRecordMoveBlock(self, v240, v241, v242, v253);
      v243 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10 = v238;
      ((void (**)(_QWORD, id, id, id, void *))v243)[2](v243, v238, v235, v236, v31);

      v20 = v237;
      v12 = v257;
      v13 = v258;
    }

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v35 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v260 = v10;
      _os_log_error_impl(&dword_18A5C5000, v35, OS_LOG_TYPE_ERROR, "Received progress callback for unknown move source recordID %@", buf, 0xCu);
    }
  }

}

- (void)handleRecordUploadForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 signature:(id)a6 size:(unint64_t)a7 paddedFileSize:(unint64_t)a8 uploaded:(BOOL)a9 uploadReceipt:(id)a10 uploadReceiptExpiration:(double)a11 wrappedAssetKey:(id)a12 clearAssetKey:(id)a13 referenceSignature:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  id v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id v91;
  id v92;
  uint8_t buf[4];
  int64_t v94;
  __int16 v95;
  id v96;
  __int16 v97;
  id v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a10;
  v22 = a12;
  v91 = a13;
  v92 = a14;
  objc_msgSend_moveChangesByDestinationRecordID(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)v18, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_destinationRecord(v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v33;
  if (v19 && v33)
  {
    objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)v19, v35);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = v37;
      v40 = v20;
      if (v37)
      {
LABEL_5:
        objc_msgSend_setArrayIndex_(v37, v38, a5, v39);
        objc_msgSend_setSignature_(v37, v41, (uint64_t)v40, v42);
        objc_msgSend_setSize_(v37, v43, a7, v44);
        objc_msgSend_setPaddedFileSize_(v37, v45, a8, v46);
        objc_msgSend_setUploaded_(v37, v47, a9, v48);
        v49 = v21;
        objc_msgSend_setUploadReceipt_(v37, v50, (uint64_t)v21, v51);
        objc_msgSend_setUploadReceiptExpiration_(v37, v52, v53, v54, a11);
        v55 = v22;
        objc_msgSend_setWrappedAssetKey_(v37, v56, (uint64_t)v22, v57);
        v58 = v91;
        objc_msgSend_setClearAssetKey_(v37, v59, (uint64_t)v91, v60);
        objc_msgSend_setReferenceSignature_(v37, v61, (uint64_t)v92, v62);
        v63 = v37;
LABEL_22:

        goto LABEL_23;
      }
      goto LABEL_15;
    }
    objc_opt_class();
    v40 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = v37;
      v69 = v65;
      if (a5 < 0 || objc_msgSend_count(v65, v66, v67, v68) <= (unint64_t)a5)
      {
        v37 = v69;
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v49 = v21;
        v72 = (void *)ck_log_facility_ck;
        v73 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR);
        v74 = v37;
        v55 = v22;
        if (v73)
        {
          v76 = v37;
          v77 = v72;
          objc_msgSend_recordID(v36, v78, v79, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v94 = a5;
          v95 = 2112;
          v96 = v81;
          _os_log_error_impl(&dword_18A5C5000, v77, OS_LOG_TYPE_ERROR, "Invalid arrayIndex %ld for record %@", buf, 0x16u);

          v74 = v76;
          v37 = v76;
        }
      }
      else
      {
        objc_msgSend_objectAtIndex_(v69, v70, a5, v71);
        v37 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v37 = v37;

          if (v37)
            goto LABEL_5;
          goto LABEL_15;
        }
        v49 = v21;
        v87 = v69;
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v55 = v22;
        v75 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          v82 = v75;
          objc_msgSend_recordID(v36, v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v94 = a5;
          v95 = 2112;
          v96 = v86;
          _os_log_error_impl(&dword_18A5C5000, v82, OS_LOG_TYPE_ERROR, "Invalid asset at arrayIndex %ld for record %@", buf, 0x16u);

          v55 = v22;
        }
        v74 = v87;
      }

      v63 = 0;
      goto LABEL_21;
    }
LABEL_15:
    v63 = 0;
    v49 = v21;
    v55 = v22;
LABEL_21:
    v58 = v91;
    goto LABEL_22;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v40 = v20;
  v49 = v21;
  v64 = ck_log_facility_ck;
  v55 = v22;
  v58 = v91;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    v94 = (int64_t)v36;
    v95 = 2114;
    v96 = v19;
    v97 = 2112;
    v98 = v18;
    _os_log_error_impl(&dword_18A5C5000, v64, OS_LOG_TYPE_ERROR, "Received upload completion callback with nil record %p or recordKey %{public}@ for recordID %@", buf, 0x20u);
  }
LABEL_23:

}

- (void)handleDeleteForRecordID:(id)a3 error:(id)a4
{
  const char *v6;
  id v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v6, (uint64_t)a2, (uint64_t)self, CFSTR("CKMovePhotosOperation.m"), 320, CFSTR("Move Photos do not expect to hear about deletes"));

}

- (void)handleRecordModificationForRecordID:(id)a3 didProgress:(double)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD, double);
  id v25;

  v6 = a3;
  objc_msgSend_moveChangesByDestinationRecordID(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6, v12);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sourceRecordID(v25, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_perRecordProgressBlock(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_perRecordProgressBlock(self, v21, v22, v23);
    v24 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, double))v24)[2](v24, v16, a4);

  }
}

- (void)handleSaveForRecordID:(id)a3 recordMetadata:(id)a4 error:(id)a5
{
  const char *v7;
  id v8;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v7, (uint64_t)a2, (uint64_t)self, CFSTR("CKMovePhotosOperation.m"), 332, CFSTR("Move Photos do not expect to hear about saves"));

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  objc_super v33;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_recordErrorsBySourceRecordID(self, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_count(v8, v9, v10, v11);

    if (v12)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordErrorsBySourceRecordID(self, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v18, (uint64_t)v17, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v19, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v13, CFSTR("Failed to move some records"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }
  objc_msgSend_movePhotosCompletionBlock(self, v4, v5, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_movePhotosCompletionBlock(self, v21, v22, v23);
    v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v7, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v24)[2](v24, v28);

    objc_msgSend_setMovePhotosCompletionBlock_(self, v29, 0, v30);
  }
  objc_msgSend_setPerRecordProgressBlock_(self, v21, 0, v23);
  objc_msgSend_setPerRecordMoveBlock_(self, v31, 0, v32);
  v33.receiver = self;
  v33.super_class = (Class)CKMovePhotosOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v33, sel__finishOnCallbackQueueWithError_, v7);

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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleMoveForSourceRecordID_destinationMetadata_moveMarkerMetadata_error_, 3, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKMovePhotosOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)moveChanges
{
  return self->_moveChanges;
}

- (void)setMoveChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (CKDatabase)sourceDatabase
{
  return self->_sourceDatabase;
}

- (void)setSourceDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDatabase, a3);
}

- (NSDictionary)moveChangesBySourceRecordID
{
  return self->_moveChangesBySourceRecordID;
}

- (void)setMoveChangesBySourceRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_moveChangesBySourceRecordID, a3);
}

- (NSDictionary)moveChangesByDestinationRecordID
{
  return self->_moveChangesByDestinationRecordID;
}

- (void)setMoveChangesByDestinationRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_moveChangesByDestinationRecordID, a3);
}

- (NSMutableDictionary)recordErrorsBySourceRecordID
{
  return self->_recordErrorsBySourceRecordID;
}

- (void)setRecordErrorsBySourceRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordErrorsBySourceRecordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordErrorsBySourceRecordID, 0);
  objc_storeStrong((id *)&self->_moveChangesByDestinationRecordID, 0);
  objc_storeStrong((id *)&self->_moveChangesBySourceRecordID, 0);
  objc_storeStrong((id *)&self->_sourceDatabase, 0);
  objc_storeStrong((id *)&self->_moveChanges, 0);
  objc_storeStrong(&self->_movePhotosCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordMoveBlock, 0);
  objc_storeStrong(&self->_perRecordProgressBlock, 0);
}

@end
