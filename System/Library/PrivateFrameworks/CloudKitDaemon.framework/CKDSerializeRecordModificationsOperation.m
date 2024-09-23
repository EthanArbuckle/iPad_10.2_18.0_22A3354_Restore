@implementation CKDSerializeRecordModificationsOperation

- (CKDSerializeRecordModificationsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDSerializeRecordModificationsOperation *v9;
  uint64_t v10;
  NSArray *recordsToSave;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *recordIDsToDelete;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDSerializeRecordModificationsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v17, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordsToSave(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    recordsToSave = v9->_recordsToSave;
    v9->_recordsToSave = (NSArray *)v10;

    objc_msgSend_recordIDsToDelete(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    recordIDsToDelete = v9->_recordIDsToDelete;
    v9->_recordIDsToDelete = (NSArray *)v14;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/serialize-record-modifications", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__preflightRecords(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__setupTranslator(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__serialize(self, v9, v10);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 3)
    return off_1E7835C70[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDSerializeRecordModificationsOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)main
{
  objc_msgSend_makeStateTransition_(self, a2, 0);
}

- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  char hasAllowRealTimeOperationsEntitlement;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKDSerializeRecordModificationsOperation;
  if (!-[CKDOperation validateAgainstLiveContainer:error:](&v23, sel_validateAgainstLiveContainer_error_, v6, a4))
    goto LABEL_9;
  objc_msgSend_entitlements(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  hasAllowRealTimeOperationsEntitlement = objc_msgSend_hasAllowRealTimeOperationsEntitlement(v9, v10, v11);

  if ((hasAllowRealTimeOperationsEntitlement & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v20 = v13;
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v22;
      _os_log_error_impl(&dword_1BE990000, v20, OS_LOG_TYPE_ERROR, "Operation %{public}@ is not allowed to run without an entitlement", buf, 0xCu);

      if (!a4)
        goto LABEL_10;
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    v14 = (void *)MEMORY[0x1E0C94FF8];
    v15 = *MEMORY[0x1E0C947D8];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v14, v18, v15, 8, CFSTR("Operation %@ is not allowed to run without an entitlement"), v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    LOBYTE(a4) = 0;
    goto LABEL_10;
  }
  LOBYTE(a4) = 1;
LABEL_10:

  return (char)a4;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  const char *v15;
  objc_super v16;

  v4 = a3;
  objc_msgSend_serializeCompletionBlock(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_serializeCompletionBlock(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
    if (v4)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v4);
    }
    else
    {
      objc_msgSend_serializedModifications(self, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v14, 0);

    }
    objc_msgSend_setSerializeCompletionBlock_(self, v15, 0);
  }
  v16.receiver = self;
  v16.super_class = (Class)CKDSerializeRecordModificationsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v16, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)_preflightRecords
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  char v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  CKDSerializeRecordModificationsOperation *v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordsToSave(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = self;
    objc_msgSend_recordsToSave(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v38, v43, 16);
    if (v12)
    {
      v15 = v12;
      v16 = *(_QWORD *)v39;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v10);
          objc_msgSend_valueStore(*(void **)(*((_QWORD *)&v38 + 1) + 8 * v17), v13, v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = objc_opt_class();
          v42[1] = objc_opt_class();
          v42[2] = objc_opt_class();
          v42[3] = objc_opt_class();
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v42, 4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend_containsValueOfClasses_passingTest_(v18, v21, (uint64_t)v20, &unk_1E7835C00);

          if ((v22 & 1) != 0)
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v13, *MEMORY[0x1E0C947D8], 12, CFSTR("CKDSerializeRecordModificationsOperation does not support records with asset values"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setError_(v36, v35, (uint64_t)v34);

            v26 = v10;
            goto LABEL_12;
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v38, v43, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend_stateTransitionGroup(v36, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v25);

    v26 = (void *)objc_opt_new();
    objc_msgSend_recordsToSave(v36, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordsToSave_(v26, v30, (uint64_t)v29);

    objc_msgSend_setShouldModifyRecordsInDatabase_(v26, v31, 0);
    v32 = objc_opt_class();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = sub_1BEB8F5CC;
    v37[3] = &unk_1E782E508;
    v37[4] = v36;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v36, v33, v32, v26, v37);
LABEL_12:

  }
}

- (void)_setupTranslator
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;

  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_databaseScope(self, v5, v6);
  objc_msgSend_stateTransitionGroup(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEB8F8BC;
  v13[3] = &unk_1E7830248;
  v13[4] = self;
  v14 = v4;
  v15 = v7;
  v11 = v4;
  objc_msgSend_fetchImportantUserIDsForOperation_withCompletionHandler_(v11, v12, (uint64_t)self, v13);

}

- (void)_serialize
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CKDPRealTimeMessageSaveRecord *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  void *v26;
  id v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  CKDPRealTimeMessageDeleteRecordID *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  const char *v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  NSObject *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[6];
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  uint64_t v116;
  uint8_t v117[128];
  uint8_t buf[4];
  uint64_t v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v82 = v3;
    objc_msgSend_recordsToSave(self, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v119 = objc_msgSend_count(v85, v86, v87);
    _os_log_debug_impl(&dword_1BE990000, v82, OS_LOG_TYPE_DEBUG, "Packaging SaveRecord (%lu records)", buf, 0xCu);

  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  objc_msgSend_recordsToSave(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v111, v117, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v112;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v112 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v15);
        v17 = objc_alloc_init(CKDPRealTimeMessageSaveRecord);
        objc_msgSend_translator(self, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pRecordFromRecord_forCache_(v20, v21, (uint64_t)v16, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v74 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            v99 = v74;
            objc_msgSend_recordID(v16, v100, v101);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v119 = (uint64_t)v102;
            _os_log_error_impl(&dword_1BE990000, v99, OS_LOG_TYPE_ERROR, "Internal error transforming record %@", buf, 0xCu);

          }
          v77 = (void *)MEMORY[0x1E0C94FF8];
          v78 = *MEMORY[0x1E0C947D8];
          objc_msgSend_recordID(v16, v75, v76);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v77, v79, v78, 1000, CFSTR("Internal error transforming record %@"), v22);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setError_(self, v81, (uint64_t)v80);

          goto LABEL_50;
        }
        objc_msgSend_setRecord_(v17, v23, (uint64_t)v22);
        objc_msgSend_addObject_(v104, v24, (uint64_t)v17);
        v116 = objc_opt_class();
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)&v116, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v109[0] = MEMORY[0x1E0C809B0];
        v109[1] = 3221225472;
        v109[2] = sub_1BEB90290;
        v109[3] = &unk_1E7835C50;
        v109[4] = self;
        v109[5] = v16;
        v27 = v103;
        v110 = v27;
        objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v16, v28, (uint64_t)v26, v109);

        objc_msgSend_error(self, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {

          goto LABEL_50;
        }
        if (objc_msgSend_count(v27, v32, v33))
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v34 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v36 = v34;
            v39 = objc_msgSend_count(v27, v37, v38);
            *(_DWORD *)buf = 134217984;
            v119 = v39;
            _os_log_debug_impl(&dword_1BE990000, v36, OS_LOG_TYPE_DEBUG, "Found and packaged AssociatedMergeableDeltas (%lu deltas)", buf, 0xCu);

          }
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v35, (uint64_t)&v111, v117, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v40 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v88 = v40;
    objc_msgSend_recordIDsToDelete(self, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_count(v91, v92, v93);
    *(_DWORD *)buf = 134217984;
    v119 = v94;
    _os_log_debug_impl(&dword_1BE990000, v88, OS_LOG_TYPE_DEBUG, "Packaging DeleteRecordID (%lu recordIDs)", buf, 0xCu);

  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v41, v42);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  objc_msgSend_recordIDsToDelete(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v105, v115, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v106 != v49)
          objc_enumerationMutation(v45);
        v51 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i);
        v52 = objc_alloc_init(CKDPRealTimeMessageDeleteRecordID);
        objc_msgSend_translator(self, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pRecordIdentifierFromRecordID_(v55, v56, v51);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setRecordIdentifier_(v52, v58, (uint64_t)v57);
        objc_msgSend_addObject_(v10, v59, (uint64_t)v52);

      }
      v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v60, (uint64_t)&v105, v115, 16);
    }
    while (v48);
  }

  v17 = objc_alloc_init(CKDPRealTimeMessage);
  if (objc_msgSend_count(v104, v61, v62))
    objc_msgSend_setSaveRecords_(v17, v63, (uint64_t)v104);
  else
    objc_msgSend_setSaveRecords_(v17, v63, 0);
  if (objc_msgSend_count(v10, v64, v65))
    objc_msgSend_setDeleteRecordids_(v17, v66, (uint64_t)v10);
  else
    objc_msgSend_setDeleteRecordids_(v17, v66, 0);
  if (objc_msgSend_count(v103, v67, v68))
    objc_msgSend_setAssociatedMergeableDeltas_(v17, v69, (uint64_t)v103);
  else
    objc_msgSend_setAssociatedMergeableDeltas_(v17, v69, 0);
  objc_msgSend_data(v17, v70, v71);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v72 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v95 = v72;
    v98 = objc_msgSend_length(v22, v96, v97);
    *(_DWORD *)buf = 134217984;
    v119 = v98;
    _os_log_debug_impl(&dword_1BE990000, v95, OS_LOG_TYPE_DEBUG, "Total serialization of %lu bytes", buf, 0xCu);

  }
  objc_msgSend_setSerializedModifications_(self, v73, (uint64_t)v22);
LABEL_50:

}

- (id)serializeCompletionBlock
{
  return self->_serializeCompletionBlock;
}

- (void)setSerializeCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
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

- (CKDProtocolTranslator)translator
{
  return (CKDProtocolTranslator *)objc_getProperty(self, a2, 480, 1);
}

- (void)setTranslator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (NSData)serializedModifications
{
  return (NSData *)objc_getProperty(self, a2, 488, 1);
}

- (void)setSerializedModifications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedModifications, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong(&self->_serializeCompletionBlock, 0);
}

@end
