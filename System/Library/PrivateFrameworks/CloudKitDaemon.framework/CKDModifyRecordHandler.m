@implementation CKDModifyRecordHandler

- (id)_initCommonWithOperation:(id)a3
{
  id v4;
  CKDModifyRecordHandler *v5;
  CKDModifyRecordHandler *v6;
  dispatch_group_t v7;
  OS_dispatch_group *pcsGroup;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKDModifyRecordHandler;
  v5 = -[CKDModifyRecordHandler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_operation, v4);
    v7 = dispatch_group_create();
    pcsGroup = v6->_pcsGroup;
    v6->_pcsGroup = (OS_dispatch_group *)v7;

    v6->_saveCompletionBlockCalled = 0;
  }

  return v6;
}

- (id)_initWithRecord:(id)a3 operation:(id)a4
{
  id v7;
  const char *v8;
  uint64_t inited;
  uint64_t v10;

  v7 = a3;
  inited = objc_msgSend__initCommonWithOperation_(self, v8, (uint64_t)a4);
  v10 = inited;
  if (inited)
  {
    objc_storeStrong((id *)(inited + 32), a3);
    *(_BYTE *)(v10 + 8) = 0;
    *(_QWORD *)(v10 + 88) = 0;
  }

  return (id)v10;
}

- (id)_initForDeleteWithRecordID:(id)a3 operation:(id)a4
{
  id v7;
  const char *v8;
  uint64_t inited;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v7 = a3;
  inited = objc_msgSend__initCommonWithOperation_(self, v8, (uint64_t)a4);
  v10 = inited;
  if (inited)
  {
    objc_storeStrong((id *)(inited + 40), a3);
    *(_BYTE *)(v10 + 8) = 1;
    v13 = objc_msgSend__needsSigningPCS((void *)v10, v11, v12);
    v14 = 5;
    if (v13)
      v14 = 2;
    *(_QWORD *)(v10 + 88) = v14;
  }

  return (id)v10;
}

+ (id)modifyHandlerWithRecord:(id)a3 operation:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  v9 = (void *)objc_msgSend__initWithRecord_operation_(v7, v8, (uint64_t)v6, v5);

  return v9;
}

+ (id)modifyHandlerForDeleteWithRecordID:(id)a3 operation:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  v9 = (void *)objc_msgSend__initForDeleteWithRecordID_operation_(v7, v8, (uint64_t)v6, v5);

  return v9;
}

- (CKRecordID)recordID
{
  uint64_t v2;
  CKRecordID *recordID;
  CKRecordID *v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  recordID = self->_recordID;
  if (recordID)
  {
    v4 = recordID;
  }
  else
  {
    objc_msgSend_record(self, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v5, v6, v7);
    v4 = (CKRecordID *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSString)etag
{
  uint64_t v2;
  NSString *etag;
  NSString *v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  etag = self->_etag;
  if (etag)
  {
    v4 = etag;
  }
  else
  {
    objc_msgSend_record(self, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_etag(v5, v6, v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)isShare
{
  return 0;
}

- (CKDPCSManager)pcsManager
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDPCSManager *)v9;
}

- (CKDPCSCache)pcsCache
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsCache(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDPCSCache *)v9;
}

+ (id)_stringForState:(unint64_t)a3
{
  if (a3 > 0xE)
    return CFSTR("Unknown");
  else
    return off_1E78348E8[a3];
}

- (id)description
{
  uint64_t v2;
  int isShare;
  const char *v5;
  uint64_t v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;

  isShare = objc_msgSend_isShare(self, a2, v2);
  v7 = objc_msgSend_isDelete(self, v5, v6);
  v8 = CFSTR("Share");
  if (v7)
  {
    v8 = CFSTR("ShareID");
    v9 = CFSTR("RecordID");
  }
  else
  {
    v9 = CFSTR("Record");
  }
  if (isShare)
    v10 = v8;
  else
    v10 = v9;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isDelete(self, v17, v18))
    v21 = CFSTR(" (isDelete)");
  else
    v21 = &stru_1E7838F48;
  v22 = objc_msgSend_state(self, v19, v20);
  objc_msgSend__stringForState_(CKDModifyRecordHandler, v23, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v11, v25, (uint64_t)CFSTR("<%@ %p> (%@: %@ %@%@)"), v13, self, v10, v16, v21, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)sideEffectRecordIDs
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v24;
  const char *v25;

  if (objc_msgSend_state(self, a2, v2))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 181, CFSTR("%s called on handler %@ but it isn't in the state %s"), "-[CKDModifyRecordHandler sideEffectRecordIDs]", self, "CKDModifyRecordHandlerStateNeedRecordSideEffects");

  }
  objc_msgSend_record(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend_record(self, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_share(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithObject_(v13, v21, (uint64_t)v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  return v22;
}

- (void)noteSideEffectRecordPendingDelete:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  int isEqual;
  const char *v16;
  uint64_t v17;
  const char *v18;
  id v19;

  v4 = a3;
  objc_msgSend_record(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v13, v14, (uint64_t)v4);

  if (isEqual)
  {
    objc_msgSend_record(self, v16, v17);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShare_(v19, v18, 0);

  }
}

- (BOOL)_needsSigningPCS
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_useAnonymousToServerShareParticipants(v9, v10, v11))
    v14 = objc_msgSend_databaseScope(v3, v12, v13) == 3;
  else
    v14 = 0;

  return v14;
}

- (void)fetchRecordPCSData
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  char hasPropertiesRequiringEncryption;
  const char *v18;
  uint64_t v19;
  char v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  char v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  const char *v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint8_t buf[4];
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, v2) != 2)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v76, v77, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 208, CFSTR("%s called on handler %@ but it isn't in the state %s"), "-[CKDModifyRecordHandler fetchRecordPCSData]", self, "CKDModifyRecordHandlerStateNeedRecordPCSData");

  }
  if (objc_msgSend_isDelete(self, v5, v6))
  {
    MEMORY[0x1E0DE7D20](self, sel__fetchSigningPCSForRecordToDelete, v8);
    return;
  }
  objc_msgSend_record(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v78, v79, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 218, CFSTR("Lost a record: %@"), self);

  }
  if (objc_msgSend_savePolicy(v14, v12, v13) == 2)
    hasPropertiesRequiringEncryption = objc_msgSend_hasPropertiesRequiringEncryption(v9, v15, v16);
  else
    hasPropertiesRequiringEncryption = objc_msgSend_hasModifiedPropertiesRequiringEncryption(v9, v15, v16);
  v20 = hasPropertiesRequiringEncryption;
  objc_msgSend_share(v9, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    goto LABEL_18;
  if ((objc_msgSend_hasUpdatedParent(v9, v22, v23) & 1) != 0)
    goto LABEL_12;
  objc_msgSend_parentsByRecordID(v14, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v26, v30, (uint64_t)v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
    v34 = 1;
  else
    v34 = v20;
  if ((v34 & 1) != 0)
    goto LABEL_19;
  objc_msgSend_protectionData(v9, v32, v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    goto LABEL_18;
  if ((objc_msgSend_wantsChainPCS(v9, v35, v36) & 1) != 0
    || (objc_msgSend_wantsPublicSharingKey(v9, v54, v55) & 1) != 0
    || (objc_msgSend__needsSigningPCS(self, v56, v57) & 1) != 0)
  {
LABEL_12:
    v21 = 0;
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend_container(v14, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_acceptServerSignedRecords(v63, v64, v65) & 1) != 0)
  {
    v68 = objc_msgSend_needsRollAndCounterSign(v9, v66, v67);

    if ((v68 & 1) == 0)
      goto LABEL_38;
LABEL_19:
    objc_msgSend_setRecordPCS_(v9, v32, 0);
    objc_msgSend_stateTransitionGroup(v14, v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v39);

    objc_msgSend_protectionData(v9, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)*MEMORY[0x1E0C952F8];
    if (v42)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v43);
      v44 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        v47 = v44;
        objc_msgSend_recordID(v9, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v81 = v50;
        _os_log_impl(&dword_1BE990000, v47, OS_LOG_TYPE_INFO, "Record %@ already has protection info", buf, 0xCu);

      }
      objc_msgSend__loadPCSData(self, v45, v46);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v43);
      v51 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        v70 = v51;
        objc_msgSend_recordID(v9, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v81 = v73;
        _os_log_debug_impl(&dword_1BE990000, v70, OS_LOG_TYPE_DEBUG, "Fetching protection info for record %@", buf, 0xCu);

      }
      objc_msgSend__fetchPCSData(self, v52, v53);
    }
    goto LABEL_30;
  }

LABEL_38:
  objc_msgSend_pcsGroup(self, v32, v69);
  v74 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v74);

  objc_msgSend_setState_(self, v75, 3);
LABEL_30:

}

- (void)_fetchSigningPCSForRecordToDelete
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  id v41;
  void *v42;
  const char *v43;
  _QWORD v44[4];
  id v45;
  CKDModifyRecordHandler *v46;
  id v47;
  _QWORD *v48;
  _QWORD v49[4];
  NSObject *v50;
  id v51;
  id v52;
  _QWORD *v53;
  id v54[2];
  uint8_t buf[8];
  id location;
  _QWORD v57[4];

  if ((objc_msgSend__needsSigningPCS(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 252, CFSTR("Fetching signing PCS for records to delete when not needed"));

  }
  objc_msgSend_operation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_useZoneWidePCS(v16, v17, v18);

  v57[0] = 0;
  v57[1] = v57;
  if (v19)
    v20 = 24;
  else
    v20 = 16;
  v57[2] = 0x2020000000;
  v57[3] = 0;
  v21 = dispatch_group_create();
  objc_msgSend_stateTransitionGroup(v7, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v24);

  objc_initWeak(&location, self);
  dispatch_group_enter(v21);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v25 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE990000, v25, OS_LOG_TYPE_DEBUG, "Beginning signing PCS fetch. Fetching zone PCS and checking if there is a share PCS on it", buf, 2u);
  }
  objc_msgSend_pcsCache(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v10, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = sub_1BEB494FC;
  v49[3] = &unk_1E78346E8;
  objc_copyWeak(v54, &location);
  v33 = v21;
  v50 = v33;
  v34 = v10;
  v51 = v34;
  v53 = v57;
  v35 = v7;
  v52 = v35;
  v54[1] = (id)v20;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v28, v36, (uint64_t)v31, v35, v20, v49);

  objc_msgSend_modifyRecordsQueue(v35, v37, v38);
  v39 = objc_claimAutoreleasedReturnValue();
  v44[0] = v32;
  v44[1] = 3221225472;
  v44[2] = sub_1BEB498A8;
  v44[3] = &unk_1E7834710;
  v45 = v34;
  v46 = self;
  v47 = v35;
  v48 = v57;
  v40 = v35;
  v41 = v34;
  dispatch_group_notify(v33, v39, v44);

  objc_destroyWeak(v54);
  objc_destroyWeak(&location);

  _Block_object_dispose(v57, 8);
}

- (void)_setSigningPCSIdentity:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  os_log_t *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  os_log_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const void *v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  os_log_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  os_log_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  os_log_t v61;
  const char *v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  const char *v83;
  int v84;
  uint64_t v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend__needsSigningPCS(self, v6, v7) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v82, v83, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 309, CFSTR("Unexpectedly setting signing PCS"));

  }
  objc_msgSend_record(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_signingPCSIdentity(v10, v11, v12))
    goto LABEL_4;
  objc_msgSend_share(v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (_QWORD *)MEMORY[0x1E0C95300];
  v17 = (os_log_t *)MEMORY[0x1E0C952D8];
  if (v15)
  {

LABEL_8:
    objc_msgSend_share(v10, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend_share(v10, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_recordID(v10, v20, v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (*v16 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
    {
      v64 = v27;
      objc_msgSend_recordID(v10, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138412546;
      v85 = (uint64_t)v67;
      v86 = 2112;
      v87 = v26;
      _os_log_debug_impl(&dword_1BE990000, v64, OS_LOG_TYPE_DEBUG, "Setting signing PCS for record %@ to be the current user's per participant PCS in share: %@", (uint8_t *)&v84, 0x16u);

    }
    v30 = v5;
LABEL_16:
    objc_msgSend_sharePCSData(v30, v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_myParticipantPCS(v31, v32, v33);

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_msgSend_zonePCSData(v5, v18, v19);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharePCSData(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    if (*v16 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v52 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
    {
      v68 = v52;
      objc_msgSend_recordID(v10, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138412290;
      v85 = (uint64_t)v71;
      _os_log_debug_impl(&dword_1BE990000, v68, OS_LOG_TYPE_DEBUG, "Setting signing PCS for record %@ to be current user's per participant PCS of zone share", (uint8_t *)&v84, 0xCu);

    }
    objc_msgSend_zonePCSData(v5, v53, v54);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v30;
    goto LABEL_16;
  }
  objc_msgSend_parent(v10, v50, v51);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v55)
    goto LABEL_36;
  if (*v16 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v56 = *v17;
  if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
  {
    v72 = v56;
    objc_msgSend_recordID(v10, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parent(v10, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 138412546;
    v85 = (uint64_t)v75;
    v86 = 2112;
    v87 = v81;
    _os_log_debug_impl(&dword_1BE990000, v72, OS_LOG_TYPE_DEBUG, "Setting signing PCS for record %@ to be that of parent: %@", (uint8_t *)&v84, 0x16u);

  }
  objc_msgSend_parentPCSData(v5, v57, v58);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_signingPCS(v26, v59, v60);
LABEL_17:

  if (!v34)
  {
LABEL_36:
    if (*v16 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v61 = *v17;
    if (!os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    v39 = v61;
    objc_msgSend_recordID(self, v62, v63);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 138412290;
    v85 = (uint64_t)v42;
    v43 = "Couldn't fetch signing PCS to create a signature for record %@";
    v44 = v39;
    v45 = 12;
LABEL_40:
    _os_log_error_impl(&dword_1BE990000, v44, OS_LOG_TYPE_ERROR, v43, (uint8_t *)&v84, v45);

    goto LABEL_4;
  }
  v35 = PCSFPCopyCurrentPrivateKey();
  if (v35)
  {
    v37 = (const void *)v35;
    objc_msgSend_setSigningPCSIdentity_(v10, v36, v35);
    CFRelease(v37);
    goto LABEL_4;
  }
  if (*v16 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v38 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v39 = v38;
    objc_msgSend_recordID(self, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 138412546;
    v85 = v34;
    v86 = 2112;
    v87 = v42;
    v43 = "Couldn't get a private identity from the signing PCS %@ for record %@";
    v44 = v39;
    v45 = 22;
    goto LABEL_40;
  }
LABEL_4:

}

- (BOOL)_canSetPreviousProtectionEtag
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char canSetPreviousProtectionEtag;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  canSetPreviousProtectionEtag = objc_msgSend_canSetPreviousProtectionEtag(v3, v4, v5);

  return canSetPreviousProtectionEtag;
}

- (BOOL)_createPublicSharingKeyWithError:(id *)a3
{
  void *v5;
  _QWORD *v6;
  os_log_t *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const void *RandomSharingIdentityWithError;
  id v18;
  os_log_t v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *PublicKey;
  objc_class *v27;
  id v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  id v37;
  const char *v38;
  void *v39;
  const char *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  id v58;
  id *v59;
  id v60[2];
  id v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend_record(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)MEMORY[0x1E0C95300];
  v59 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = (os_log_t *)MEMORY[0x1E0C952D8];
  v8 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v11 = v8;
    objc_msgSend_recordID(v5, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v63 = v14;
    _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "Creating a new random sharing identity for record %@", buf, 0xCu);

  }
  objc_msgSend_pcsManager(self, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  RandomSharingIdentityWithError = (const void *)objc_msgSend_createRandomSharingIdentityWithError_(v15, v16, (uint64_t)&v61);
  v18 = v61;

  if (v18)
  {
    if (*v6 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v54 = v19;
      objc_msgSend_recordID(v5, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v63 = v57;
      v64 = 2112;
      v65 = v18;
      _os_log_error_impl(&dword_1BE990000, v54, OS_LOG_TYPE_ERROR, "Couldn't create a new sharing identity for record %@: %@", buf, 0x16u);

    }
  }
  v60[1] = 0;
  v20 = (void *)PCSIdentityCopyExternalForm();
  if (v20)
  {
    if (*v6 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      objc_msgSend_recordID(v5, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PublicKey = (void *)PCSIdentityGetPublicKey();
      v27 = (objc_class *)MEMORY[0x1E0CB3940];
      v58 = PublicKey;
      v28 = [v27 alloc];
      v30 = (void *)objc_msgSend_initWithData_encoding_(v28, v29, (uint64_t)v20, 4);
      *(_DWORD *)buf = 138412802;
      v63 = v25;
      v64 = 2112;
      v65 = PublicKey;
      v66 = 2112;
      v67 = v30;
      _os_log_impl(&dword_1BE990000, v22, OS_LOG_TYPE_INFO, "Using identity for public PCS on record %@: %@: %@", buf, 0x20u);

    }
  }
  v31 = objc_alloc(MEMORY[0x1E0C94D18]);
  objc_msgSend_pcsManager(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = 0;
  objc_msgSend_dataFromSharingIdentity_error_(v34, v35, (uint64_t)RandomSharingIdentityWithError, v60);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v60[0];
  v39 = (void *)objc_msgSend_initWithData_(v31, v38, (uint64_t)v36);
  objc_msgSend_setMutableEncryptedPSK_(v5, v40, (uint64_t)v39);

  if (v37)
  {
    if (*v6 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v41 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v37;
      _os_log_error_impl(&dword_1BE990000, v41, OS_LOG_TYPE_ERROR, "Couldn't create data from our public sharing identity: %@", buf, 0xCu);
    }
    if (v59)
    {
      v44 = (void *)MEMORY[0x1E0C94FF8];
      v45 = *MEMORY[0x1E0C94B20];
      objc_msgSend_recordID(self, v42, v43);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v44, v47, v45, 5005, CFSTR("Couldn't create public sharing identity for record %@"), v46);
      *v59 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (*v6 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v48 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v49 = v48;
      objc_msgSend_recordID(self, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v63 = v52;
      v64 = 2112;
      v65 = v37;
      _os_log_impl(&dword_1BE990000, v49, OS_LOG_TYPE_INFO, "Couldn't create a public sharing identity for record %@: %@", buf, 0x16u);

    }
  }
  if (RandomSharingIdentityWithError)
    CFRelease(RandomSharingIdentityWithError);

  return v37 == 0;
}

- (void)_loadPCSData
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend_pcsManager(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v10, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(self, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v59, v66, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 388, CFSTR("Need a PCS Manager (%@, %@, %@)"), self, v62, v65);

  }
  if ((objc_msgSend__useZoneishPCS(self, v8, v9) & 1) != 0 || objc_msgSend_databaseScope(v10, v11, v12) == 2)
  {
    objc_msgSend__unwrapRecordPCSForZone(self, v11, v12);
    goto LABEL_6;
  }
  if (objc_msgSend_databaseScope(v10, v11, v12) == 3)
  {
    objc_msgSend_record(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_share(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_record(self, v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_share(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__unwrapRecordPCSWithShareID_(self, v26, (uint64_t)v25);

LABEL_15:
      goto LABEL_6;
    }
  }
  if (objc_msgSend_databaseScope(v10, v13, v14) == 3)
  {
    objc_msgSend_record(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parent(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend__unwrapRecordPCSForParent(self, v27, v28);
      goto LABEL_6;
    }
  }
  objc_msgSend_record(self, v27, v28);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_record(self, v35, v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v19, v37, v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__unwrapRecordPCSWithShareID_(self, v39, (uint64_t)v22);
    goto LABEL_15;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v40 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v43 = v40;
    objc_msgSend_record(self, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v68 = v49;
    _os_log_impl(&dword_1BE990000, v43, OS_LOG_TYPE_INFO, "Warn: Record %@ isn't in the private database, doesn't have a share or parent set and isn't a share", buf, 0xCu);

  }
  v50 = (void *)MEMORY[0x1E0C94FF8];
  v51 = *MEMORY[0x1E0C94B20];
  objc_msgSend_record(self, v41, v42);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_format_(v50, v56, v51, 5001, CFSTR("Record %@ isn't in the private database, doesn't have a share or parent set and isn't a share"), v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addShareToPCSData_withError_(self, v58, 0, v57);

LABEL_6:
}

- (void)_reallyFetchPCSDataWithOptions:(unint64_t)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51[2];
  id location;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend_record(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend_isZoneWideShare(v5, v6, v7)
    && objc_msgSend__useZoneishPCS(self, v6, v7)
    && (objc_msgSend_sharePCSData(self, v6, v7), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (objc_msgSend_sharedZonePCSData(self, v6, v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = v9 == 0,
        v9,
        v8,
        !v10))
  {
    objc_msgSend_sharedZonePCSData(self, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPublicKeyID(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setZoneishKeyID_(v5, v15, (uint64_t)v14);

    objc_msgSend_dataWithRecord_(CKDRecordPCSData, v16, (uint64_t)v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedZonePCSData(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_zoneishPCS(v20, v21, v22);
    objc_msgSend_setPcs_(v17, v24, v23);

    objc_msgSend_sharedZonePCSData(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setZonePCSData_(v17, v28, (uint64_t)v27);

    objc_msgSend_sharePCSData(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSharePCSData_(v17, v32, (uint64_t)v31);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v33 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_recordID(v5, v34, v35);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v54 = v48;
      _os_log_debug_impl(&dword_1BE990000, v33, OS_LOG_TYPE_DEBUG, "Using prepared share pcs and shared zone pcs data for share %@", buf, 0xCu);

    }
    objc_msgSend__addShareToPCSData_withError_(self, v36, (uint64_t)v17, 0);

  }
  else
  {
    if (objc_msgSend__needsSigningPCS(self, v6, v7))
      v39 = (void *)(a3 | 0x10);
    else
      v39 = (void *)a3;
    objc_msgSend_pcsCache(self, v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v5, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operation(self, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = sub_1BEB4AC90;
    v49[3] = &unk_1E7834738;
    objc_copyWeak(v51, &location);
    v51[1] = v39;
    v50 = v5;
    objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v40, v47, (uint64_t)v43, v46, v39, v49);

    objc_destroyWeak(v51);
  }
  objc_destroyWeak(&location);

}

- (void)_fetchPCSData
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char isKnownToServer;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  _BOOL4 v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v34 = v3;
    objc_msgSend_record(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138412290;
    v42 = v40;
    _os_log_debug_impl(&dword_1BE990000, v34, OS_LOG_TYPE_DEBUG, "Getting ready to fetch PCS Data for record %@", (uint8_t *)&v41, 0xCu);

  }
  objc_msgSend_operation(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_etag(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v9, v10, v11))
    goto LABEL_6;
  objc_msgSend_record(self, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isKnownToServer = objc_msgSend_isKnownToServer(v16, v17, v18);

  if ((isKnownToServer & 1) != 0 || (objc_msgSend_alwaysFetchPCSFromServer(v6, v14, v15) & 1) != 0)
    goto LABEL_9;
  objc_msgSend_record(self, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_wantsPublicSharingKey(v9, v29, v30))
  {
LABEL_6:

LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  v33 = objc_msgSend_saveAttempts(self, v31, v32) == 0;

  v20 = 2 * v33;
LABEL_10:
  objc_msgSend_container(v6, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_useZoneWidePCS(v24, v25, v26);

  if (v27)
    objc_msgSend__reallyFetchPCSDataWithOptions_(self, v28, v20 | 8);
  else
    objc_msgSend__reallyFetchPCSDataWithOptions_(self, v28, v20);

}

- (void)_fetchParentPCSForID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  id *v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  _QWORD v30[4];
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  CKDModifyRecordHandler *v35;
  id v36;

  v6 = a3;
  v7 = a4;
  objc_msgSend_operation(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parentsByRecordID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend_pcsGroup(v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_modifyRecordsQueue(v10, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEB4B3E8;
    block[3] = &unk_1E78303B0;
    v22 = &v33;
    v33 = v15;
    v34 = v6;
    v35 = self;
    v36 = v7;
    v23 = v7;
    dispatch_group_notify(v18, v21, block);

    v24 = v34;
  }
  else
  {
    if (objc_msgSend__needsSigningPCS(self, v16, v17))
      v27 = 20;
    else
      v27 = 4;
    objc_msgSend_pcsCache(self, v25, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1BEB4B624;
    v30[3] = &unk_1E7833D40;
    v22 = &v31;
    v31 = v7;
    v28 = v7;
    objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v24, v29, (uint64_t)v6, v10, v27, v30);
  }

}

- (void)_fetchSharePCSForID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  void *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  CKDModifyRecordHandler *v37;
  void (**v38)(id, _QWORD, void *);
  _QWORD block[4];
  id v40;
  id v41;
  CKDModifyRecordHandler *v42;
  void (**v43)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend_operation(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handlersByRecordID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharePCSData(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v31 = (void *)MEMORY[0x1E0C94FF8];
        v32 = *MEMORY[0x1E0C94B20];
        objc_msgSend_recordID(self, v22, v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v31, v33, v32, 1017, CFSTR("Record %@ refers to share %@ but that item is a record, not a share"), v21, v6);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v34);

        goto LABEL_3;
      }
      objc_msgSend_pcsGroup(v15, v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_modifyRecordsQueue(v10, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEB4B898;
      block[3] = &unk_1E78303B0;
      v40 = v15;
      v41 = v6;
      v42 = self;
      v43 = v7;
      dispatch_group_notify(v24, v27, block);

      v28 = v40;
    }
    else
    {
      objc_msgSend_pcsCache(self, v19, v20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = sub_1BEB4B970;
      v35[3] = &unk_1E78319D0;
      v36 = v6;
      v37 = self;
      v38 = v7;
      objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v29, v30, (uint64_t)v36, v10, 0, v35);

      v28 = v36;
    }

    goto LABEL_9;
  }
  objc_msgSend_sharePCSData(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v7)[2](v7, v21, 0);
LABEL_3:

LABEL_9:
}

- (void)_addShareToPCSData:(id)a3 withError:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__keyRollIfNeededForRecordPCSData_withError_, a3);
}

- (void)_keyRollIfNeededForRecordPCSData:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
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
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_operation(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_record(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7;
  v17 = v16;
  if (v16)
    goto LABEL_2;
  if (!objc_msgSend_pcs(v6, v14, v15))
    goto LABEL_25;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend_isZoneWideShare(v13, v24, v25)
    && objc_msgSend_didAttemptZoneWideShareKeyRoll(self, v26, v27)
    && (objc_msgSend__useZoneishPCS(self, v28, v29) & 1) == 0
    && objc_msgSend_databaseScope(v10, v30, v31) == 2)
  {
    objc_msgSend_sharePCSData(self, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34
      && (v37 = (void *)v34,
          objc_msgSend_sharedZonePCSData(self, v35, v36),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v38,
          v37,
          v38))
    {
      objc_msgSend_pcsManager(self, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedZonePCSData(self, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharePCSData(self, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_keyRollForZoneWideShareRecordPCS_sharedZonePCS_sharePCS_forOperation_(v41, v48, (uint64_t)v6, v44, v47, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v75 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v82 = v75;
        objc_msgSend_recordID(v13, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sharedZonePCSData(self, v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sharePCSData(self, v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v93 = v85;
        v94 = 2112;
        v95 = v88;
        v96 = 2112;
        v97 = v91;
        _os_log_error_impl(&dword_1BE990000, v82, OS_LOG_TYPE_ERROR, "Failed to get share or zone PCS data to roll record PCS for zone-wide share record %@, shared zone PCS: %@, share PCS: %@", buf, 0x20u);

      }
      v78 = (void *)MEMORY[0x1E0C94FF8];
      v79 = *MEMORY[0x1E0C94B20];
      objc_msgSend_recordID(self, v76, v77);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v78, v81, v79, 5001, CFSTR("Didn't get dependent PCS data to roll record PCS for %@"), v80);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (objc_msgSend__useZoneishPCS(self, v49, v50) & 1) == 0
    && objc_msgSend_databaseScope(v10, v51, v52) == 2)
  {
    buf[0] = 0;
    objc_msgSend_container(v10, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    if (objc_msgSend_acceptServerSignedRecords(v58, v59, v60))
      v63 = objc_msgSend_needsRollAndCounterSign(v13, v61, v62);

    objc_msgSend_pcsManager(self, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keyRollIfNeededForPerRecordPCS_needsRollAndCounterSign_forOperation_didRoll_(v66, v67, (uint64_t)v6, v63, v10, buf);
    v68 = objc_claimAutoreleasedReturnValue();

    if (buf[0])
      objc_msgSend_setRequiresRecordSaveForMergeableDeltas_(v13, v69, 1);
    v17 = (void *)v68;
  }
  if (v17)
  {
LABEL_2:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v18 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v20 = v18;
      objc_msgSend_recordID(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v93 = v23;
      v94 = 2112;
      v95 = v17;
      _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "Error key-rolling for record %@: %@", buf, 0x16u);

    }
  }
  else
  {
LABEL_25:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v70 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v71 = v70;
      objc_msgSend_recordID(self, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v93 = v74;
      _os_log_debug_impl(&dword_1BE990000, v71, OS_LOG_TYPE_DEBUG, "Successfully checked key-rolling requirements for record %@. May have rolled keys as well.", buf, 0xCu);

    }
    v17 = 0;
  }
  objc_msgSend__reallyAddShareToPCSData_withError_(self, v19, (uint64_t)v6, v17);

}

- (void)_reallyAddShareToPCSData:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  _QWORD *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  NSObject *v52;
  _QWORD *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  CKDModifyRecordHandler *v58;
  NSObject *v59;
  _QWORD *v60;
  id v61;
  id location;
  _QWORD v63[5];
  id v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_record(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = sub_1BE9BB098;
  v63[4] = sub_1BE9BAE00;
  v11 = v7;
  v64 = v11;
  v14 = dispatch_group_create();
  v15 = MEMORY[0x1E0C809B0];
  if (!v11 && objc_msgSend_pcs(v6, v12, v13))
  {
    if (objc_msgSend_hasUpdatedShare(v10, v12, v13))
    {
      objc_msgSend_share(v10, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v18, v19, v20);
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_previousShare(v10, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v24, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
      v21 = 0;
    }
    if (v21 | v27)
    {
      objc_initWeak(&location, self);
      v28 = (_QWORD *)MEMORY[0x1E0C95300];
      if (v21)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v29 = (id)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_recordID(v10, v30, v31);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v66 = v21;
          v67 = 2112;
          v68 = v43;
          _os_log_debug_impl(&dword_1BE990000, v29, OS_LOG_TYPE_DEBUG, "Adding share with ID %@ to record %@", buf, 0x16u);

        }
        dispatch_group_enter(v14);
        v55[0] = v15;
        v55[1] = 3221225472;
        v55[2] = sub_1BEB4C5D8;
        v55[3] = &unk_1E7834760;
        objc_copyWeak(&v61, &location);
        v56 = v6;
        v60 = v63;
        v57 = (id)v21;
        v58 = self;
        v59 = v14;
        objc_msgSend__fetchSharePCSForID_withCompletionHandler_(self, v32, (uint64_t)v57, v55);

        objc_destroyWeak(&v61);
        v28 = (_QWORD *)MEMORY[0x1E0C95300];
      }
      if (v27)
      {
        if (*v28 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v33 = (id)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_recordID(v10, v34, v35);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v66 = v27;
          v67 = 2112;
          v68 = v44;
          _os_log_debug_impl(&dword_1BE990000, v33, OS_LOG_TYPE_DEBUG, "Removing share with ID %@ from record %@", buf, 0x16u);

        }
        dispatch_group_enter(v14);
        v48[0] = v15;
        v48[1] = 3221225472;
        v48[2] = sub_1BEB4C8E8;
        v48[3] = &unk_1E7834760;
        objc_copyWeak(&v54, &location);
        v49 = v6;
        v53 = v63;
        v50 = v10;
        v51 = (id)v27;
        v52 = v14;
        objc_msgSend__fetchSharePCSForID_withCompletionHandler_(self, v36, (uint64_t)v51, v48);

        objc_destroyWeak(&v54);
        v28 = (_QWORD *)MEMORY[0x1E0C95300];
      }
      if (*v28 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v37 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE990000, v37, OS_LOG_TYPE_DEBUG, "Waiting on share fetches so we can update the record PCS", buf, 2u);
      }
      objc_destroyWeak(&location);
    }

  }
  objc_msgSend_operation(self, v12, v13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifyRecordsQueue(v38, v39, v40);
  v41 = objc_claimAutoreleasedReturnValue();
  v45[0] = v15;
  v45[1] = 3221225472;
  v45[2] = sub_1BEB4CC8C;
  v45[3] = &unk_1E7831BB8;
  v46 = v6;
  v47 = v63;
  v45[4] = self;
  v42 = v6;
  dispatch_group_notify(v14, v41, v45);

  _Block_object_dispose(v63, 8);
}

- (void)_fetchParentPCSForData:(id)a3 withError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int hasUpdatedParent;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  int isEqual;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  int v59;
  const char *v60;
  uint64_t v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  NSObject *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  int v106;
  const char *v107;
  uint64_t v108;
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
  NSObject *v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  char groupa;
  NSObject *group;
  void *v142;
  void *v143;
  _QWORD block[5];
  id v145;
  uint64_t *v146;
  _QWORD v147[5];
  id v148;
  NSObject *v149;
  _BYTE *v150;
  uint64_t *v151;
  _QWORD v152[5];
  NSObject *v153;
  _BYTE *v154;
  uint64_t *v155;
  _QWORD v156[4];
  id v157;
  CKDModifyRecordHandler *v158;
  NSObject *v159;
  _BYTE *v160;
  uint64_t *v161;
  uint64_t v162;
  uint64_t *v163;
  uint64_t v164;
  uint64_t (*v165)(uint64_t, uint64_t);
  void (*v166)(uint64_t);
  id v167;
  uint8_t v168[4];
  void *v169;
  __int16 v170;
  void *v171;
  _BYTE buf[24];
  uint64_t (*v173)(uint64_t, uint64_t);
  void (*v174)(uint64_t);
  id v175;
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v162 = 0;
  v163 = &v162;
  v164 = 0x3032000000;
  v165 = sub_1BE9BB098;
  v166 = sub_1BE9BAE00;
  v8 = a4;
  v167 = v8;
  v9 = dispatch_group_create();
  objc_msgSend_operation(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (objc_msgSend_pcs(v7, v12, v13))
    {
      objc_msgSend_record(self, v12, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      hasUpdatedParent = objc_msgSend_hasUpdatedParent(v17, v18, v19);

      if (hasUpdatedParent)
      {
        objc_msgSend_record(self, v12, v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_previousParent(v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v24, v25, v26);
        v142 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v142)
        {
          objc_msgSend_parentID(v7, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v29)
            goto LABEL_8;
          objc_msgSend_parentID(v7, v27, v28);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_record(self, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_parent(v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          groupa = objc_msgSend_isEqual_(v143, v39, (uint64_t)v38);

          if ((groupa & 1) == 0)
          {
            objc_msgSend_parentID(v7, v27, v28);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_8:
            v142 = 0;
          }
        }
        objc_msgSend_record(self, v27, v28);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_parent(v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v46, v47, (uint64_t)v142);

        if (isEqual)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v49, v50);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(self, v133, v134);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v132, v136, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 682, CFSTR("Got the same parent and previous parent on record %@"), v135);

        }
        if (v142)
        {
          objc_msgSend_record(self, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_chainParentPublicKeyID(v51, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v54)
          {
            objc_msgSend_parentID(v7, v55, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend_isEqual_(v57, v58, (uint64_t)v142);

            if (v59)
            {
              objc_msgSend_chainParentPublicKeyID(v7, v60, v61);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v54 = 0;
            }
          }
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v62 = (id)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_recordID(self, v63, v64);
            v122 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v142;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v54;
            *(_WORD *)&buf[22] = 2112;
            v173 = v122;
            _os_log_debug_impl(&dword_1BE990000, v62, OS_LOG_TYPE_DEBUG, "Removing previous parent %@ with public key ID %{public}@ from record PCS for %@", buf, 0x20u);

          }
          objc_msgSend_pcsManager(self, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend_pcs(v7, v68, v69);
          objc_msgSend_removePublicKeyID_fromPCS_(v67, v71, (uint64_t)v54, v70);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (v72 && !v163[5])
          {
            objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v73, *MEMORY[0x1E0C94B20], 5001, v72, CFSTR("Couldn't remove previous parent PCS data for previous parent %@"), v142);
            v74 = objc_claimAutoreleasedReturnValue();
            v75 = (void *)v163[5];
            v163[5] = v74;

          }
        }
        objc_msgSend_record(self, v49, v50);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_parent(v76, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (v79)
        {
          group = dispatch_group_create();
          dispatch_group_enter(v9);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v173 = sub_1BE9BB098;
          v174 = sub_1BE9BAE00;
          v175 = 0;
          objc_msgSend_parentsByRecordID(v14, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_record(self, v83, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_parent(v85, v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v88, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v82, v92, (uint64_t)v91);
          v139 = (void *)objc_claimAutoreleasedReturnValue();

          if (v139)
          {
            dispatch_group_enter(group);
            objc_msgSend_pcsGroup(v139, v93, v94);
            v95 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_modifyRecordsQueue(v14, v96, v97);
            v98 = objc_claimAutoreleasedReturnValue();
            v156[0] = MEMORY[0x1E0C809B0];
            v156[1] = 3221225472;
            v156[2] = sub_1BEB4D71C;
            v156[3] = &unk_1E78347B0;
            v160 = buf;
            v157 = v139;
            v158 = self;
            v161 = &v162;
            v159 = group;
            dispatch_group_notify(v95, v98, v156);

          }
          else
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v101 = (id)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend_record(self, v102, v103);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_parent(v138, v123, v124);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v125, v126, v127);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(self, v129, v130);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v168 = 138412546;
              v169 = v128;
              v170 = 2112;
              v171 = v131;
              _os_log_debug_impl(&dword_1BE990000, v101, OS_LOG_TYPE_DEBUG, "Fetching parent PCS data with record ID %@ for record %@", v168, 0x16u);

            }
            dispatch_group_enter(group);
            v106 = objc_msgSend__needsSigningPCS(self, v104, v105);
            v109 = 4;
            if (v106)
              v109 = 20;
            v137 = v109;
            objc_msgSend_pcsCache(self, v107, v108);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_record(self, v111, v112);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_parent(v113, v114, v115);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v116, v117, v118);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            v152[0] = MEMORY[0x1E0C809B0];
            v152[1] = 3221225472;
            v152[2] = sub_1BEB4D968;
            v152[3] = &unk_1E7834788;
            v152[4] = self;
            v154 = buf;
            v155 = &v162;
            v153 = group;
            objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v110, v120, (uint64_t)v119, v14, v137, v152);

          }
          objc_msgSend_modifyRecordsQueue(v14, v99, v100);
          v121 = objc_claimAutoreleasedReturnValue();
          v147[0] = MEMORY[0x1E0C809B0];
          v147[1] = 3221225472;
          v147[2] = sub_1BEB4DBE8;
          v147[3] = &unk_1E78347B0;
          v150 = buf;
          v151 = &v162;
          v147[4] = self;
          v148 = v7;
          v149 = v9;
          dispatch_group_notify(group, v121, v147);

          _Block_object_dispose(buf, 8);
        }

      }
    }
  }
  objc_msgSend_modifyRecordsQueue(v14, v12, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEB4DD54;
  block[3] = &unk_1E7831BB8;
  v145 = v7;
  v146 = &v162;
  block[4] = self;
  v16 = v7;
  dispatch_group_notify(v9, v15, block);

  _Block_object_dispose(&v162, 8);
}

- (id)_addParentPCS:(id)a3 toRecordPCS:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  os_log_t *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  os_log_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  char v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  os_log_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  id v102;
  uint8_t buf[4];
  id v104;
  __int16 v105;
  id v106;
  __int16 v107;
  id v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v9 = (os_log_t *)MEMORY[0x1E0C952B0];
  v10 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v75 = v10;
    objc_msgSend_recordID(self, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v104 = v6;
    v105 = 2112;
    v106 = v78;
    _os_log_debug_impl(&dword_1BE990000, v75, OS_LOG_TYPE_DEBUG, "Adding parent PCS data %@ to PCS for record %@", buf, 0x16u);

  }
  objc_msgSend_pcsManager(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decryptChainPCSForRecordPCS_(v13, v14, (uint64_t)v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15
    || (objc_msgSend_chainPCSData(v6, v16, v17),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v34 = objc_msgSend_pcs(v31, v32, v33),
        v31,
        !v34))
  {
    if (*v8 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v18 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v79 = v18;
      objc_msgSend_record(self, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parent(v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v104 = v88;
      v105 = 2112;
      v106 = v15;
      _os_log_debug_impl(&dword_1BE990000, v79, OS_LOG_TYPE_DEBUG, "Couldn't decrypt the chain PCS blob on parent record %@: %@", buf, 0x16u);

      if (v15)
        goto LABEL_24;
    }
    else if (v15)
    {
      goto LABEL_24;
    }
    v21 = (void *)MEMORY[0x1E0C94FF8];
    v22 = *MEMORY[0x1E0C94B20];
    objc_msgSend_record(self, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parent(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v21, v30, v22, 5004, CFSTR("Couldn't decrypt the chain PCS blob on parent record %@"), v29);
    v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
    goto LABEL_24;
  }
  objc_msgSend_pcsManager(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_chainPCSData(v6, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_pcs(v40, v41, v42);
  v46 = objc_msgSend_pcs(v7, v44, v45);
  v102 = 0;
  v48 = objc_msgSend_addSharePCS_toRecordPCS_error_(v37, v47, v43, v46, &v102);
  v15 = v102;

  if ((v48 & 1) != 0)
  {
    objc_msgSend_chainPCSData(v6, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend_pcs(v51, v52, v53);
    objc_msgSend_publicKeyIDFromIdentity_(CKDPCSManager, v55, v54);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (*v8 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v56 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v89 = v56;
      objc_msgSend_record(self, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parent(v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v95, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(self, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v104 = v98;
      v105 = 2112;
      v106 = v101;
      v107 = 2114;
      v108 = v23;
      _os_log_debug_impl(&dword_1BE990000, v89, OS_LOG_TYPE_DEBUG, "Successfully added parent PCS data from record %@ to record %@. Public key ID is %{public}@", buf, 0x20u);

    }
    objc_msgSend_record(self, v57, v58);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setChainParentPublicKeyID_(v26, v59, (uint64_t)v23);
    goto LABEL_23;
  }
  if (*v8 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v60 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v104 = v6;
    v105 = 2112;
    v106 = v7;
    v107 = 2112;
    v108 = v15;
    _os_log_debug_impl(&dword_1BE990000, v60, OS_LOG_TYPE_DEBUG, "Error adding parent PCS %@ to record PCS %@: %@", buf, 0x20u);
    if (v15)
      goto LABEL_24;
    goto LABEL_22;
  }
  if (!v15)
  {
LABEL_22:
    v63 = (void *)MEMORY[0x1E0C94FF8];
    v64 = *MEMORY[0x1E0C94B20];
    objc_msgSend_record(self, v61, v62);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parent(v23, v65, v66);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v26, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v63, v73, v64, 5005, CFSTR("Couldn't add parent PCS data from record %@ to record %@"), v69, v72);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
LABEL_24:

  return v15;
}

- (void)_createAndSavePCS
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  __CFString *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
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
  id v48;
  id v49;
  NSObject *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  char isKindOfClass;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  NSObject *v60;
  id v61;
  const __CFString *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  const char *v68;
  _QWORD block[4];
  id v70;
  CKDModifyRecordHandler *v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  BOOL v75;
  _QWORD v76[4];
  __CFString *v77;
  NSObject *v78;
  _QWORD *v79;
  _QWORD *v80;
  _QWORD v81[4];
  id v82;
  id v83;
  NSObject *v84;
  _QWORD *v85;
  _QWORD *v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[5];
  id v90;
  _QWORD v91[5];
  id v92;
  uint8_t buf[4];
  const __CFString *v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_operation(self, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unitTestOverrides(v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("DisallowRecordPCSToBeCreated"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v67, v68, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 786, CFSTR("Record PCS creation not allowed by unit test"));

    }
  }
  objc_msgSend_record(self, a2, v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_group_create();
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x3032000000;
  v91[3] = sub_1BE9BB098;
  v91[4] = sub_1BE9BAE00;
  v92 = 0;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = sub_1BE9BB098;
  v89[4] = sub_1BE9BAE00;
  v90 = 0;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = sub_1BE9BB098;
  v87[4] = sub_1BE9BAE00;
  v88 = 0;
  objc_msgSend_share(v11, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v18, v19, v20);
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  dispatch_group_enter(v15);
  objc_msgSend_container(v14, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_useZoneWidePCS(v27, v28, v29);

  v33 = objc_msgSend__needsSigningPCS(self, v31, v32);
  v34 = 8;
  if (!v30)
    v34 = 0;
  if (v33)
    v35 = v34 | 0x10;
  else
    v35 = v34;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v36 = (id)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    if (v30)
      v62 = CFSTR("zoneish ");
    else
      v62 = &stru_1E7838F48;
    objc_msgSend_recordID(v11, v37, v38);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v94 = v62;
    v95 = 2112;
    v96 = v66;
    _os_log_debug_impl(&dword_1BE990000, v36, OS_LOG_TYPE_DEBUG, "Fetching %{public}@PCS data for zone %@", buf, 0x16u);

  }
  objc_msgSend_pcsCache(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v11, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = sub_1BEB4EA28;
  v81[3] = &unk_1E78347D8;
  v48 = v14;
  v82 = v48;
  v85 = v91;
  v49 = v11;
  v83 = v49;
  v86 = v87;
  v50 = v15;
  v84 = v50;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v41, v51, (uint64_t)v47, v48, v35, v81);

  if (v21
    || (objc_msgSend_record(self, v52, v53),
        v54 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v54,
        (isKindOfClass & 1) != 0))
  {
    dispatch_group_enter(v50);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v58 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v21;
      _os_log_debug_impl(&dword_1BE990000, v58, OS_LOG_TYPE_DEBUG, "Fetching PCS data for share %@", buf, 0xCu);
    }
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = sub_1BEB4EBE0;
    v76[3] = &unk_1E7834800;
    v79 = v89;
    v77 = v21;
    v80 = v87;
    v78 = v50;
    objc_msgSend__fetchSharePCSForID_withCompletionHandler_(self, v59, (uint64_t)v77, v76);

  }
  objc_msgSend_modifyRecordsQueue(v48, v56, v57);
  v60 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEB4ED2C;
  block[3] = &unk_1E7834828;
  v70 = v49;
  v71 = self;
  v72 = v87;
  v73 = v91;
  v74 = v89;
  v75 = v21 != 0;
  v61 = v49;
  dispatch_group_notify(v50, v60, block);

  _Block_object_dispose(v87, 8);
  _Block_object_dispose(v89, 8);

  _Block_object_dispose(v91, 8);
}

- (BOOL)_useZoneishPCS
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  BOOL v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  objc_msgSend_record(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_databaseScope(v7, v8, v9) != 2 && objc_msgSend_databaseScope(v7, v10, v11) != 3;
  objc_msgSend_container(v7, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  if (objc_msgSend_useZoneWidePCS(v16, v17, v18) && !v12)
  {
    objc_msgSend_share(v4, v19, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend_parent(v4, v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v25 == 0;

    }
  }

  return v21;
}

- (void)_continueCreateAndSavePCSWithZonePCS:(id)a3 sharePCS:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  int v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t hasLightweightPCSEntitlement;
  void *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  id v83;
  CKDModifyRecordHandler *v84;
  void *v85;
  void *v86;
  void *v87;
  const char *v88;
  id v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  int v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  void *v119;
  uint64_t v120;
  const char *v121;
  void *v122;
  const char *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  const char *v134;
  void *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const __CFString *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const __CFString *v146;
  uint64_t v147;
  const char *v148;
  const __CFString *v149;
  _BOOL4 v150;
  _BOOL4 v151;
  NSObject *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  const char *v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  void *v180;
  const char *v181;
  const char *v182;
  const char *v183;
  const char *v184;
  NSObject *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  void *v189;
  const char *v190;
  void *v191;
  const char *v192;
  const char *v193;
  void *v194;
  CKDModifyRecordHandler *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  id v200;
  id v201;
  id v202;
  uint8_t buf[4];
  void *v204;
  __int16 v205;
  id v206;
  uint64_t v207;

  v207 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_record(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v15 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v18 = v15;
    objc_msgSend_recordID(v10, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v204 = v21;
    _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "Creating new PCS object for record %@", buf, 0xCu);

  }
  v199 = v7;
  if (objc_msgSend__useZoneishPCS(self, v16, v17))
  {
    if (*v14 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v24 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v152 = v24;
      objc_msgSend_zoneishPublicKeyID(v6, v153, v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKLowercaseHexStringWithoutSpaces(v155, v156, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v10, v159, v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v204 = v158;
      v205 = 2112;
      v206 = v161;
      _os_log_debug_impl(&dword_1BE990000, v152, OS_LOG_TYPE_DEBUG, "Using zoneish PCS with key %{public}@ for record %@", buf, 0x16u);

    }
    if (objc_msgSend_zoneishPCS(v6, v25, v26))
    {
      v29 = (const void *)objc_msgSend_zoneishPCS(v6, v27, v28);
      objc_msgSend_zoneishPublicKeyID(v6, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneishKeyID_(v10, v33, (uint64_t)v32);

      if (*MEMORY[0x1E0C95280])
      {
        objc_msgSend_unitTestOverrides(v13, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v36, v37, (uint64_t)CFSTR("TwoByteZoneishKeyIDs"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend_zoneishKeyID(v10, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_subdataWithRange_(v41, v42, 0, 2);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setZoneishKeyID_(v10, v44, (uint64_t)v43);

        }
        else
        {
          objc_msgSend_unitTestOverrides(v13, v39, v40);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v122, v123, (uint64_t)CFSTR("ZoneishKeyIDWithOnlyTwoValidBytes"));
          v124 = (void *)objc_claimAutoreleasedReturnValue();

          if (v124)
          {
            objc_msgSend_zoneishKeyID(v10, v125, v126);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_subdataWithRange_(v127, v128, 0, 2);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = (void *)objc_msgSend_mutableCopy(v129, v130, v131);

            *(_WORD *)buf = -21846;
            objc_msgSend_appendBytes_length_(v132, v133, (uint64_t)buf, 2);
            objc_msgSend_setZoneishKeyID_(v10, v134, (uint64_t)v132);

            goto LABEL_30;
          }
          objc_msgSend_unitTestOverrides(v13, v125, v126);
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v189, v190, (uint64_t)CFSTR("RandomZoneishKeyID"));
          v191 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v191)
            goto LABEL_30;
          *(_DWORD *)buf = -1515870811;
          objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v192, (uint64_t)buf, 4);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setZoneishKeyID_(v10, v193, (uint64_t)v41);
        }

      }
LABEL_30:
      if (v29)
      {
        CFRetain(v29);
        v89 = 0;
        goto LABEL_49;
      }
      v89 = 0;
LABEL_44:
      v150 = 0;
      v29 = 0;
      v151 = v89 == 0;
      goto LABEL_53;
    }
    v72 = (void *)MEMORY[0x1E0C94FF8];
    v73 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(v10, v27, v28);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v10, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v80, v81, v82);
    v83 = v6;
    v84 = self;
    v85 = v13;
    v86 = v10;
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v72, v88, v73, 5001, CFSTR("Couldn't fetch a zoneish PCS from zone %@ for record %@"), v77, v87);
    v89 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v86;
    v13 = v85;
    self = v84;
    v6 = v83;

LABEL_43:
    goto LABEL_44;
  }
  if (objc_msgSend_pcs(v6, v22, v23))
  {
    v197 = v10;
    objc_msgSend_container(v13, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_pcs(v6, v51, v52);
    v56 = objc_msgSend_pcs(v7, v54, v55);
    v195 = self;
    objc_msgSend_record(self, v57, v58);
    v59 = v13;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_useLightweightPCS(v60, v61, v62);
    v66 = v59;
    if (v65)
    {
      objc_msgSend_container(v59, v63, v64);
      v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_entitlements(v14, v67, v68);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      hasLightweightPCSEntitlement = objc_msgSend_hasLightweightPCSEntitlement(v59, v69, v70);
    }
    else
    {
      hasLightweightPCSEntitlement = 0;
    }
    v202 = 0;
    v29 = (const void *)objc_msgSend_createRecordPCSWithZonePCS_sharePCS_createLite_error_(v50, v63, v53, v56, hasLightweightPCSEntitlement, &v202);
    v89 = v202;
    if (v65)
    {

    }
    v10 = v197;
    v13 = v66;
    self = v195;
  }
  else
  {
    if (objc_msgSend_databaseScope(v13, v45, v46) != 3)
    {
      v119 = (void *)MEMORY[0x1E0C94FF8];
      v120 = *MEMORY[0x1E0C94B20];
      objc_msgSend_recordID(v10, v90, v91);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v119, v121, v120, 5001, CFSTR("We couldn't decrypt the zone PCS and this isn't a share, so we can't create a new record PCS for %@"), v74);
      v89 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    v198 = v10;
    objc_msgSend_pcsData(v6, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    v194 = v13;
    if (!v92)
    {
      v135 = (void *)MEMORY[0x1E0C94FF8];
      v136 = *MEMORY[0x1E0C94B20];
      objc_msgSend_recordID(v198, v93, v94);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsData(v6, v137, v138);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      if (v141)
        v142 = &stru_1E7838F48;
      else
        v142 = CFSTR("zone PCS data ");
      objc_msgSend_pcsData(v6, v139, v140);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = &stru_1E7838F48;
      if (!v145)
      {
        if (objc_msgSend_pcs(v7, v143, v144))
          v146 = &stru_1E7838F48;
        else
          v146 = CFSTR(" and no ");
      }
      v147 = objc_msgSend_pcs(v7, v143, v144);
      v149 = CFSTR("share PCS");
      if (v147)
        v149 = &stru_1E7838F48;
      objc_msgSend_errorWithDomain_code_format_(v135, v148, v136, 5001, CFSTR("Can't create a record PCS for %@ because there is no %@%@%@"), v74, v142, v146, v149);
      v89 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v198;
      v13 = v194;
      goto LABEL_43;
    }
    objc_msgSend_container(v13, v93, v94);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v196, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsData(v6, v98, v99);
    v100 = v13;
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend_pcs(v7, v102, v103);
    objc_msgSend_record(self, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend_useLightweightPCS(v107, v108, v109);
    if (v112)
    {
      objc_msgSend_container(v100, v110, v111);
      v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_entitlements(v14, v113, v114);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend_hasLightweightPCSEntitlement(v100, v115, v116);
    }
    else
    {
      v117 = 0;
    }
    v201 = 0;
    v29 = (const void *)objc_msgSend_createRecordPCSWithEncryptedZonePCS_sharePCS_createLite_error_(v97, v110, (uint64_t)v101, v104, v117, &v201);
    v89 = v201;
    if (v112)
    {

    }
    v10 = v198;
    v13 = v194;
  }
LABEL_49:
  v151 = v89 == 0;
  v150 = v29 != 0;
  if (!v89 && v29)
  {
    objc_msgSend_dataWithRecord_(CKDRecordPCSData, v118, (uint64_t)v10);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend__useZoneishPCS(self, v163, v164) & 1) != 0)
    {
      v89 = 0;
    }
    else
    {
      objc_msgSend_container(v13, v165, v166);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v175, v176, v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v200 = 0;
      objc_msgSend_dataFromRecordPCS_error_(v178, v179, (uint64_t)v29, &v200);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v200;

      objc_msgSend_setPcsData_(v162, v181, (uint64_t)v180);
    }
    objc_msgSend_setPcs_(v162, v165, (uint64_t)v29);
    objc_msgSend_setZonePCSData_(v162, v182, (uint64_t)v6);
    objc_msgSend_setSharePCSData_(v162, v183, (uint64_t)v199);
    objc_msgSend__addShareToPCSData_withError_(self, v184, (uint64_t)v162, v89);

    goto LABEL_63;
  }
LABEL_53:
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v167 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
  {
    v185 = v167;
    objc_msgSend_recordID(v10, v186, v187);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v204 = v188;
    v205 = 2112;
    v206 = v89;
    _os_log_error_impl(&dword_1BE990000, v185, OS_LOG_TYPE_ERROR, "Couldn't create a new record PCS for %@: %@", buf, 0x16u);

    if (v151)
    {
LABEL_57:
      v170 = (void *)MEMORY[0x1E0C94FF8];
      v171 = *MEMORY[0x1E0C94B20];
      objc_msgSend_recordID(v10, v168, v169);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v170, v173, v171, 5001, CFSTR("Couldn't create a new record PCS for %@"), v172);
      v89 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend__addShareToPCSData_withError_(self, v174, 0, v89);
      if (!v150)
        goto LABEL_64;
      goto LABEL_63;
    }
  }
  else if (v151)
  {
    goto LABEL_57;
  }
  objc_msgSend__addShareToPCSData_withError_(self, v168, 0, v89);
  if (v150)
LABEL_63:
    CFRelease(v29);
LABEL_64:

}

- (void)_unwrapRecordPCSForZone
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  objc_msgSend_record(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend_pcsCache(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEB4FB58;
  v19[3] = &unk_1E7834850;
  objc_copyWeak(&v21, &location);
  v17 = v4;
  v20 = v17;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v7, v18, (uint64_t)v13, v16, 0, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_unwrapRecordPCSWithShareID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend_record(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BEB50150;
  v11[3] = &unk_1E7834878;
  objc_copyWeak(&v14, &location);
  v8 = v7;
  v12 = v8;
  v9 = v4;
  v13 = v9;
  objc_msgSend__fetchSharePCSForID_withCompletionHandler_(self, v10, (uint64_t)v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_unwrapRecordPCSForParent
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  objc_msgSend_record(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend_parent(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEB5070C;
  v14[3] = &unk_1E78348A0;
  objc_copyWeak(&v17, &location);
  v11 = v4;
  v15 = v11;
  v12 = v10;
  v16 = v12;
  objc_msgSend__fetchParentPCSForID_withCompletionHandler_(self, v13, (uint64_t)v12, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_fetchExistingPCSForProvidedPCSData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id location;

  v4 = a3;
  objc_msgSend_record(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend_pcsCache(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1BEB50D24;
  v20[3] = &unk_1E78348A0;
  objc_copyWeak(&v23, &location);
  v17 = v4;
  v21 = v17;
  v18 = v7;
  v22 = v18;
  objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v10, v19, (uint64_t)v13, v16, 0, v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)_handlePCSData:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id *v16;
  _QWORD *v17;
  id *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const void *ChainPCSWithError;
  const char *v60;
  uint64_t v61;
  id v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  id v75;
  id *v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const char *v82;
  void *v83;
  id v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  id v89;
  id *v90;
  NSObject *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  id v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  void *v100;
  id v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  id v108;
  id *v109;
  NSObject *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  CKDChainPCSData *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  void *v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  id v138;
  NSObject *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  id v155;
  id *v156;
  NSObject *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  char v180;
  uint64_t v181;
  uint64_t i;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  void *v189;
  const char *v190;
  const char *v191;
  const char *v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  int v199;
  id v200;
  id *v201;
  NSObject *v202;
  const char *v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  const char *v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  id v247;
  NSObject *v248;
  const char *v249;
  uint64_t v250;
  id v251;
  const char *v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  void *v259;
  const char *v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  uint64_t PublicSharingKeyWithError;
  id v270;
  id v271;
  NSObject *v272;
  const char *v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  void *v277;
  uint64_t v278;
  void *v279;
  void *v280;
  const char *v281;
  id v282;
  const char *v283;
  const char *v284;
  uint64_t v285;
  void *v286;
  const char *v287;
  uint64_t v288;
  void *v289;
  const char *v290;
  int v291;
  const char *v292;
  uint64_t v293;
  id v294;
  NSObject *v295;
  const char *v296;
  uint64_t v297;
  const char *v298;
  void *v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  const char *v318;
  const char *v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  const char *v328;
  void *v329;
  id v330;
  const char *v331;
  const char *v332;
  void *v333;
  const char *v334;
  const char *v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  void *v339;
  void *v340;
  const char *v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  void *v345;
  const char *v346;
  const char *v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  void *v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  const char *v355;
  uint64_t v356;
  void *v357;
  void *v358;
  const char *v359;
  uint64_t v360;
  id v361;
  NSObject *v362;
  const char *v363;
  uint64_t v364;
  void *v365;
  const char *v366;
  uint64_t v367;
  void *v368;
  const char *v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  void *v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  void *v379;
  void *v380;
  const char *v381;
  uint64_t v382;
  void *v383;
  const char *v384;
  uint64_t v385;
  void *v386;
  const char *v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  void *v391;
  const char *v392;
  uint64_t v393;
  int v394;
  const char *v395;
  id v396;
  NSObject *v397;
  const char *v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  void *v403;
  const char *v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  void *v409;
  const char *v410;
  uint64_t v411;
  void *v412;
  const char *v413;
  void *v414;
  const char *v415;
  uint64_t v416;
  void *v417;
  const char *v418;
  void *v419;
  const char *v420;
  id v421;
  NSObject *v422;
  const char *v423;
  uint64_t v424;
  void *v425;
  void *v426;
  void *v427;
  const char *v428;
  void *v429;
  const char *v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  void *v434;
  const char *v435;
  uint64_t v436;
  const char *v437;
  const char *v438;
  id v439;
  const char *v440;
  uint64_t v441;
  void *v442;
  void *v443;
  const char *v444;
  void *v445;
  const char *v446;
  id v447;
  void *v448;
  const char *v449;
  void *v450;
  void *v451;
  void *v452;
  const char *v453;
  uint64_t v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  CKDModifyRecordHandler *v460;
  int v461;
  id v462;
  _QWORD v463[5];
  id v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  id v469;
  id v470;
  id v471;
  uint8_t buf[4];
  uint64_t v473;
  __int16 v474;
  id v475;
  __int16 v476;
  void *v477;
  _BYTE v478[128];
  uint64_t v479;

  v479 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_record(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id *)MEMORY[0x1E0C952F8];
  v17 = (_QWORD *)MEMORY[0x1E0C95300];
  v18 = (id *)MEMORY[0x1E0C952B0];
  if (v7)
    goto LABEL_2;
  if (!objc_msgSend_pcs(v6, v13, v14))
    goto LABEL_167;
  v34 = *v16;
  v35 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v34);

  v36 = *v18;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_recordID(v10, v37, v38);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_etag(v6, v135, v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v473 = (uint64_t)v134;
    v474 = 2114;
    v475 = v137;
    _os_log_debug_impl(&dword_1BE990000, v36, OS_LOG_TYPE_DEBUG, "Got PCS data for record=%{public}@, protectionInfoTag=%{public}@", buf, 0x16u);

    v35 = (_QWORD *)MEMORY[0x1E0C95300];
  }

  v460 = self;
  if (!objc_msgSend_wantsChainPCS(v10, v39, v40))
  {
    v7 = 0;
    goto LABEL_52;
  }
  objc_msgSend_chainPCSData(v6, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend_pcsManager(self, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decryptChainPCSForRecordPCS_(v46, v47, (uint64_t)v6);
    v48 = (id)objc_claimAutoreleasedReturnValue();

    if (!v48)
    {
      objc_msgSend_chainPCSData(v6, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (id)objc_msgSend_pcs(v51, v52, v53);

      if (v48)
      {
        objc_msgSend_chainPCSData(v6, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        ChainPCSWithError = (const void *)objc_msgSend_pcs(v56, v57, v58);

        if (ChainPCSWithError)
        {
          CFRetain(ChainPCSWithError);
          v48 = 0;
LABEL_25:
          objc_msgSend_pcsManager(self, v60, v61);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addIdentityBackToPCS_(v70, v71, (uint64_t)ChainPCSWithError);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (v72)
          {
            v75 = (id)*MEMORY[0x1E0C952F8];
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], v75);
            v76 = (id *)MEMORY[0x1E0C952B0];

            v77 = *v76;
            if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_recordID(self, v78, v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v473 = (uint64_t)v80;
              v474 = 2112;
              v475 = v72;
              _os_log_impl(&dword_1BE990000, v77, OS_LOG_TYPE_INFO, "Warn: Couldn't create protection data from chain PCS for record %@: %@", buf, 0x16u);

            }
          }
          objc_msgSend_pcsManager(self, v73, v74);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v470 = 0;
          objc_msgSend_dataFromZonePCS_error_(v81, v82, (uint64_t)ChainPCSWithError, &v470);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v470;
          objc_msgSend_record(self, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setChainProtectionInfo_(v87, v88, (uint64_t)v83);

          if (v84)
          {
            v89 = (id)*MEMORY[0x1E0C952F8];
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], v89);
            v90 = (id *)MEMORY[0x1E0C952B0];

            v91 = *v90;
            if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_recordID(self, v92, v93);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v473 = (uint64_t)v94;
              v474 = 2112;
              v475 = v84;
              _os_log_impl(&dword_1BE990000, v91, OS_LOG_TYPE_INFO, "Warn: Couldn't create protection data from chain PCS for record %@: %@", buf, 0x16u);

            }
          }
          v95 = objc_alloc(MEMORY[0x1E0C94D18]);
          objc_msgSend_pcsManager(self, v96, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v469 = 0;
          objc_msgSend_sharingIdentityDataFromPCS_error_(v98, v99, (uint64_t)ChainPCSWithError, &v469);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v469;
          v103 = (void *)objc_msgSend_initWithData_(v95, v102, (uint64_t)v100);
          objc_msgSend_record(self, v104, v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setChainPrivateKey_(v106, v107, (uint64_t)v103);

          if (v101)
          {
            v108 = (id)*MEMORY[0x1E0C952F8];
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], v108);
            v109 = (id *)MEMORY[0x1E0C952B0];

            v110 = *v109;
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_recordID(v460, v111, v112);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v473 = (uint64_t)v113;
              v474 = 2112;
              v475 = v101;
              _os_log_impl(&dword_1BE990000, v110, OS_LOG_TYPE_INFO, "Warn: Couldn't create private chaining key from chain PCS for record %@: %@", buf, 0x16u);

            }
          }
          v114 = [CKDChainPCSData alloc];
          objc_msgSend_record(v460, v115, v116);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_chainProtectionInfo(v117, v118, v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_record(v460, v121, v122);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_chainPrivateKey(v123, v124, v125);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = (void *)objc_msgSend_initWithPCSData_encryptedPrivateKey_(v114, v127, (uint64_t)v120, v126);
          objc_msgSend_setChainPCSData_(v6, v129, (uint64_t)v128);

          self = v460;
          objc_msgSend_chainPCSData(v6, v130, v131);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setPcs_(v132, v133, (uint64_t)ChainPCSWithError);

          CFRelease(ChainPCSWithError);
          v7 = 0;
          goto LABEL_52;
        }
        v48 = 0;
      }
    }
  }
  else
  {
    v62 = (id)*MEMORY[0x1E0C952F8];
    if (*v35 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v62);

    v63 = *v18;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_recordID(self, v64, v65);
      v442 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v473 = (uint64_t)v442;
      _os_log_debug_impl(&dword_1BE990000, v63, OS_LOG_TYPE_DEBUG, "Record %@ is a parent in this save group but it has no chain PCS data yet. Creating chain PCS data", buf, 0xCu);

    }
    objc_msgSend_pcsManager(self, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v471 = 0;
    ChainPCSWithError = (const void *)objc_msgSend_createChainPCSWithError_(v68, v69, (uint64_t)&v471);
    v48 = v471;

    v35 = (_QWORD *)MEMORY[0x1E0C95300];
    if (ChainPCSWithError)
      goto LABEL_25;
  }
  v138 = (id)*MEMORY[0x1E0C952F8];
  if (*v35 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v138);

  v139 = *v18;
  if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_recordID(self, v140, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v473 = (uint64_t)v142;
    v474 = 2112;
    v475 = v48;
    _os_log_impl(&dword_1BE990000, v139, OS_LOG_TYPE_INFO, "Couldn't create a chaining PCS for %@: %@", buf, 0x16u);

  }
  if (!v48)
  {
    v145 = (void *)MEMORY[0x1E0C94FF8];
    v146 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(self, v143, v144);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v145, v148, v146, 5005, CFSTR("Couldn't create a parent PCS for record %@"), v147);
    v48 = (id)objc_claimAutoreleasedReturnValue();

  }
  v7 = v48;
LABEL_52:
  objc_msgSend_tombstonedPublicKeyIDs(v10, v41, v42);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = objc_msgSend_count(v149, v150, v151);

  v459 = v7;
  if (v152)
  {
    v155 = (id)*MEMORY[0x1E0C952F8];
    v156 = (id *)MEMORY[0x1E0C952B0];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v155);

    v157 = *v156;
    if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_tombstonedPublicKeyIDs(v10, v158, v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = objc_msgSend_count(v160, v161, v162);
      objc_msgSend_recordID(self, v164, v165);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v473 = v163;
      v474 = 2112;
      v475 = v166;
      _os_log_impl(&dword_1BE990000, v157, OS_LOG_TYPE_INFO, "Found %lu tombstoned key(s) on record %@", buf, 0x16u);

    }
    v457 = v10;
    v458 = v15;
    v167 = v6;

    v168 = (void *)objc_opt_new();
    v465 = 0u;
    v466 = 0u;
    v467 = 0u;
    v468 = 0u;
    objc_msgSend_record(self, v169, v170);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tombstonedPublicKeyIDs(v171, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();

    v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v175, (uint64_t)&v465, v478, 16);
    if (v176)
    {
      v179 = v176;
      v180 = 0;
      v181 = *(_QWORD *)v466;
      do
      {
        for (i = 0; i != v179; ++i)
        {
          if (*(_QWORD *)v466 != v181)
            objc_enumerationMutation(v174);
          v183 = *(_QWORD *)(*((_QWORD *)&v465 + 1) + 8 * i);
          objc_msgSend_pcsManager(self, v177, v178);
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          v187 = objc_msgSend_pcs(v167, v185, v186);
          objc_msgSend_removePublicKeyID_fromPCS_(v184, v188, v183, v187);
          v189 = (void *)objc_claimAutoreleasedReturnValue();

          if (v189)
            objc_msgSend_addObject_(v168, v190, v183);
          else
            v180 = 1;

          self = v460;
        }
        v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v177, (uint64_t)&v465, v478, 16);
      }
      while (v179);
    }
    else
    {
      v180 = 0;
    }

    v10 = v457;
    objc_msgSend_setTombstonedPublicKeyIDs_(v457, v191, (uint64_t)v168);
    v7 = v459;
    v6 = v167;
    if ((objc_msgSend_didRollRecordPCSMasterKey(self, v192, v193) & 1) == 0)
    {
      v7 = v459;
      if ((v180 & 1) != 0)
      {
        objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v194, v195);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        v199 = objc_msgSend_rollRecordMasterKeysOnUnshare(v196, v197, v198);

        v7 = v459;
        if (v199)
        {
          v200 = (id)*MEMORY[0x1E0C952F8];
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v200);
          v201 = (id *)MEMORY[0x1E0C952B0];

          v202 = *v201;
          if (os_log_type_enabled(v202, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_recordID(self, v203, v204);
            v450 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v473 = (uint64_t)v450;
            _os_log_debug_impl(&dword_1BE990000, v202, OS_LOG_TYPE_DEBUG, "Rolling record PCS master key since we cleaned up tombstoned key(s) on record %@", buf, 0xCu);

          }
          objc_msgSend_pcsManager(self, v205, v206);
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          v210 = objc_msgSend_pcs(v6, v208, v209);
          objc_msgSend_rollMasterKeyForRecordPCS_forOperation_(v207, v211, v210, v458);
          v7 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setDidRollRecordPCSMasterKey_(self, v212, 1);
        }
      }
    }

    v15 = v458;
  }
  objc_msgSend_record(self, v153, v154);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v213, v214, v215);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v216, v217, v218);
  v219 = (void *)objc_claimAutoreleasedReturnValue();

  if (v219)
  {
    objc_msgSend_handlersByRecordID(v15, v220, v221);
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(self, v223, v224);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_share(v225, v226, v227);
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v228, v229, v230);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v222, v232, (uint64_t)v231);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(v233, v234, v235);
    v236 = objc_claimAutoreleasedReturnValue();

    v237 = (void *)v236;
    if (v236)
      objc_msgSend_setWantsPublicSharingKey_(v10, v220, 1);
    self = v460;
  }
  else
  {
    v237 = 0;
  }
  objc_msgSend_mutableEncryptedPSK(v10, v220, v221);
  v238 = objc_claimAutoreleasedReturnValue();
  if (v238)
  {
    v241 = (void *)v238;
  }
  else
  {
    if (!objc_msgSend_wantsPublicSharingKey(v10, v239, v240))
      goto LABEL_106;
    objc_msgSend_mutableEncryptedPSK(v237, v242, v243);
    v244 = (void *)objc_claimAutoreleasedReturnValue();

    if (v244)
    {
      v247 = (id)*MEMORY[0x1E0C952F8];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v247);

      v248 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v248, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_recordID(v237, v249, v250);
        v452 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(self, v453, v454);
        v455 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v473 = (uint64_t)v452;
        v474 = 2112;
        v475 = v455;
        _os_log_debug_impl(&dword_1BE990000, v248, OS_LOG_TYPE_DEBUG, "Using publicSharingIdentity from share %@ for record %@", buf, 0x16u);

      }
      v251 = objc_alloc(MEMORY[0x1E0C94D18]);
      objc_msgSend_mutableEncryptedPSK(v237, v252, v253);
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v254, v255, v256);
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = (void *)objc_msgSend_initWithData_(v251, v258, (uint64_t)v257);
      objc_msgSend_setMutableEncryptedPSK_(v10, v260, (uint64_t)v259);

    }
    objc_msgSend_mutableEncryptedPSK(v10, v245, v246);
    v261 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v261)
    {
      objc_msgSend_encryptedPublicSharingKey(v6, v262, v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setMutableEncryptedPSK_(v10, v265, (uint64_t)v264);

    }
    objc_msgSend_mutableEncryptedPSK(v10, v262, v263);
    v266 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v266)
    {
      v464 = v459;
      PublicSharingKeyWithError = objc_msgSend__createPublicSharingKeyWithError_(self, v267, (uint64_t)&v464);
      v270 = v464;

      if ((PublicSharingKeyWithError & 1) != 0)
      {
        v459 = v270;
      }
      else
      {
        v271 = (id)*MEMORY[0x1E0C952F8];
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v271);

        v272 = (id)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled(v272, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_recordID(v10, v273, v274);
          v456 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v473 = (uint64_t)v456;
          v474 = 2112;
          v475 = v270;
          _os_log_error_impl(&dword_1BE990000, v272, OS_LOG_TYPE_ERROR, "Failed to prepare public sharing key for record %@: %@", buf, 0x16u);

        }
        if (!v270)
        {
          v277 = (void *)MEMORY[0x1E0C94FF8];
          v278 = *MEMORY[0x1E0C94B20];
          objc_msgSend_recordID(self, v275, v276);
          v279 = v237;
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v277, v281, v278, 5005, CFSTR("Couldn't create a public sharing key for record %@"), v280);
          v270 = (id)objc_claimAutoreleasedReturnValue();

          v237 = v279;
        }
        v282 = v270;

        v459 = v282;
        v7 = v282;
      }
    }
    objc_msgSend_mutableEncryptedPSK(v10, v267, v268);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEncryptedPublicSharingKey_(v6, v283, (uint64_t)v241);
  }

LABEL_106:
  objc_msgSend_baseToken(v10, v242, v243);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  if (v286)
  {
LABEL_107:

    goto LABEL_111;
  }
  if (objc_msgSend_wantsPublicSharingKey(v10, v284, v285))
  {
    objc_msgSend_baseToken(v237, v287, v288);
    v289 = (void *)objc_claimAutoreleasedReturnValue();

    if (v289)
    {
      objc_msgSend_baseToken(v237, v287, v288);
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBaseToken_(v10, v290, (uint64_t)v286);
      goto LABEL_107;
    }
  }
LABEL_111:
  v291 = objc_msgSend__needsSigningPCS(self, v287, v288);
  v16 = (id *)MEMORY[0x1E0C952F8];
  if (v291)
  {
    v294 = (id)*MEMORY[0x1E0C952F8];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v294);

    v295 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v295, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_recordID(v10, v296, v297);
      v426 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v473 = (uint64_t)v426;
      _os_log_debug_impl(&dword_1BE990000, v295, OS_LOG_TYPE_DEBUG, "Should set signing PCS for record %@", buf, 0xCu);

      v16 = (id *)MEMORY[0x1E0C952F8];
    }

    objc_msgSend__setSigningPCSIdentity_(self, v298, (uint64_t)v6);
  }
  if (v7)
  {

    v18 = (id *)MEMORY[0x1E0C952B0];
    v17 = (_QWORD *)MEMORY[0x1E0C95300];
    goto LABEL_2;
  }
  v299 = v237;
  objc_msgSend_container(v15, v292, v293);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v300, v301, v302);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsKeysToRemove(v6, v304, v305);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v309 = objc_msgSend_pcs(v6, v307, v308);
  objc_msgSend_protectionEtag(v10, v310, v311);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v314 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v303, v313, (uint64_t)v306, v309, v312, v15);

  if (v314)
  {
    v463[0] = MEMORY[0x1E0C809B0];
    v463[1] = 3221225472;
    v463[2] = sub_1BEB52E60;
    v463[3] = &unk_1E7831868;
    v463[4] = v314;
    objc_msgSend_updateCloudKitMetrics_(v15, v315, (uint64_t)v463);
  }
  v317 = objc_msgSend_pcs(v6, v315, v316);
  objc_msgSend_setRecordPCS_(v10, v318, v317);
  objc_msgSend_container(v15, v319, v320);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v321, v322, v323);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  v327 = objc_msgSend_pcs(v6, v325, v326);
  v462 = v459;
  objc_msgSend_dataFromRecordPCS_error_(v324, v328, v327, &v462);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  v330 = v462;

  if (!v329)
  {
    v361 = (id)*MEMORY[0x1E0C952F8];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v361);

    v362 = (id)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled(v362, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_recordID(v10, v363, v364);
      v451 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v473 = (uint64_t)v451;
      v474 = 2112;
      v475 = v330;
      _os_log_error_impl(&dword_1BE990000, v362, OS_LOG_TYPE_ERROR, "Couldn't create PCS data for record %@: %@", buf, 0x16u);

    }
    goto LABEL_166;
  }
  objc_msgSend_setProtectionData_(v10, v331, (uint64_t)v329);
  objc_msgSend_etagFromPCSData_(CKDPCSManager, v332, (uint64_t)v329);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtectionEtag_(v10, v334, (uint64_t)v333);

  if (!objc_msgSend__canSetPreviousProtectionEtag(self, v335, v336)
    || (objc_msgSend_previousProtectionEtag(v10, v337, v338),
        v339 = (void *)objc_claimAutoreleasedReturnValue(),
        v339,
        !v339))
  {
    objc_msgSend_etag(v6, v337, v338);
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPreviousProtectionEtag_(v10, v341, (uint64_t)v340);

  }
  objc_msgSend_previousProtectionEtagFromUnitTest(v10, v337, v338);
  v342 = (void *)objc_claimAutoreleasedReturnValue();

  if (v342)
  {
    objc_msgSend_previousProtectionEtagFromUnitTest(v10, v343, v344);
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPreviousProtectionEtag_(v10, v346, (uint64_t)v345);

    objc_msgSend_setPreviousProtectionEtagFromUnitTest_(v10, v347, 0);
  }
  objc_msgSend_container(v15, v343, v344);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContext(v348, v349, v350);
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(v351, v352, v353);
  v354 = objc_claimAutoreleasedReturnValue();
  if (v354)
  {
    v357 = (void *)v354;
    objc_msgSend_zoneProtectionEtag(v10, v355, v356);
    v358 = (void *)objc_claimAutoreleasedReturnValue();

    if (v358)
      goto LABEL_137;
  }
  else
  {

  }
  objc_msgSend_zonePCSData(v6, v359, v360);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_etag(v365, v366, v367);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneProtectionEtag_(v10, v369, (uint64_t)v368);

LABEL_137:
  objc_msgSend_container(v15, v359, v360);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContext(v370, v371, v372);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(v373, v374, v375);
  v376 = objc_claimAutoreleasedReturnValue();
  if (!v376)
  {

    self = v460;
LABEL_141:
    objc_msgSend_sharePCSData(v6, v381, v382);
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareEtag(v383, v384, v385);
    v386 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShareEtag_(v10, v387, (uint64_t)v386);

    goto LABEL_142;
  }
  v379 = (void *)v376;
  objc_msgSend_shareEtag(v10, v377, v378);
  v380 = (void *)objc_claimAutoreleasedReturnValue();

  self = v460;
  if (!v380)
    goto LABEL_141;
LABEL_142:
  objc_msgSend_container(v15, v381, v382);
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v388, v389, v390);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  v394 = objc_msgSend_useZoneWidePCS(v391, v392, v393);

  if (!v394)
    goto LABEL_165;
  v396 = (id)*MEMORY[0x1E0C952F8];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v396);

  v397 = (id)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled(v397, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_recordID(v10, v398, v399);
    v400 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishKeyID(v10, v401, v402);
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPublicKeyID(v6, v404, v405);
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v473 = (uint64_t)v400;
    v474 = 2112;
    v475 = v403;
    v476 = 2112;
    v477 = v406;
    _os_log_impl(&dword_1BE990000, v397, OS_LOG_TYPE_INFO, "Setting zoneishKeyID on record %@ from %@ to %@", buf, 0x20u);

    self = v460;
  }

  objc_msgSend_zoneishPublicKeyID(v6, v407, v408);
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneishKeyID_(v10, v410, (uint64_t)v409);

  if (!*MEMORY[0x1E0C95280])
    goto LABEL_165;
  objc_msgSend_unitTestOverrides(v15, v395, v411);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v412, v413, (uint64_t)CFSTR("TwoByteZoneishKeyIDs"));
  v414 = (void *)objc_claimAutoreleasedReturnValue();

  if (v414)
  {
    objc_msgSend_zoneishKeyID(v10, v415, v416);
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subdataWithRange_(v417, v418, 0, 2);
    v419 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setZoneishKeyID_(v10, v420, (uint64_t)v419);
    v421 = (id)*MEMORY[0x1E0C952F8];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v421);

    v422 = (id)*MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled(v422, OS_LOG_TYPE_INFO))
      goto LABEL_164;
    objc_msgSend_recordID(v10, v423, v424);
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v473 = (uint64_t)v425;
    v474 = 2112;
    v475 = v419;
LABEL_163:
    _os_log_impl(&dword_1BE990000, v422, OS_LOG_TYPE_INFO, "Setting zoneishKeyID on record %@ to %@", buf, 0x16u);

LABEL_164:
    goto LABEL_165;
  }
  objc_msgSend_unitTestOverrides(v15, v415, v416);
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v427, v428, (uint64_t)CFSTR("ZoneishKeyIDWithOnlyTwoValidBytes"));
  v429 = (void *)objc_claimAutoreleasedReturnValue();

  if (v429)
  {
    objc_msgSend_zoneishKeyID(v10, v430, v431);
    v432 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subdataWithRange_(v432, v433, 0, 2);
    v434 = (void *)objc_claimAutoreleasedReturnValue();
    v419 = (void *)objc_msgSend_mutableCopy(v434, v435, v436);

    LOWORD(v461) = -21846;
    objc_msgSend_appendBytes_length_(v419, v437, (uint64_t)&v461, 2);
    objc_msgSend_setZoneishKeyID_(v10, v438, (uint64_t)v419);
    v439 = (id)*MEMORY[0x1E0C952F8];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v439);

    v422 = (id)*MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled(v422, OS_LOG_TYPE_INFO))
      goto LABEL_164;
    goto LABEL_162;
  }
  objc_msgSend_unitTestOverrides(v15, v430, v431);
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v443, v444, (uint64_t)CFSTR("RandomZoneishKeyID"));
  v445 = (void *)objc_claimAutoreleasedReturnValue();

  if (v445)
  {
    v461 = -1515870811;
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v395, (uint64_t)&v461, 4);
    v419 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setZoneishKeyID_(v10, v446, (uint64_t)v419);
    v447 = (id)*MEMORY[0x1E0C952F8];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v447);

    v422 = (id)*MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled(v422, OS_LOG_TYPE_INFO))
      goto LABEL_164;
LABEL_162:
    objc_msgSend_recordID(v10, v440, v441);
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v473 = (uint64_t)v425;
    v474 = 2112;
    v475 = v419;
    goto LABEL_163;
  }
LABEL_165:
  objc_msgSend_setRecordPCSData_(self, v395, (uint64_t)v6);
LABEL_166:

  v18 = (id *)MEMORY[0x1E0C952B0];
LABEL_167:
  objc_msgSend_protectionData(v10, v32, v33);
  v448 = (void *)objc_claimAutoreleasedReturnValue();

  if (v448)
  {
    objc_msgSend_setState_(self, v449, 3);
    goto LABEL_7;
  }
  v7 = 0;
  v17 = (_QWORD *)MEMORY[0x1E0C95300];
  v16 = (id *)MEMORY[0x1E0C952F8];
LABEL_2:
  v19 = *v16;
  if (*v17 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v19);

  v20 = *v18;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_recordID(v10, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v473 = (uint64_t)v23;
    v474 = 2112;
    v475 = v7;
    _os_log_impl(&dword_1BE990000, v20, OS_LOG_TYPE_INFO, "Warn: Couldn't get PCS data for record %@: %@", buf, 0x16u);

  }
  objc_msgSend_setState_(self, v24, 12);
  objc_msgSend_setError_(self, v25, (uint64_t)v7);

LABEL_7:
  objc_msgSend_pcsGroup(self, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v28);

  objc_msgSend_stateTransitionGroup(v15, v29, v30);
  v31 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v31);

}

- (void)fetchSharePCSData
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  if (objc_msgSend_state(self, a2, v2) != 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 1331, CFSTR("%s called on handler %@ but it isn't in the state %s"), "-[CKDModifyRecordHandler fetchSharePCSData]", self, "CKDModifyRecordHandlerStateNeedSharePCSData");

  }
  objc_msgSend_setState_(self, v5, 3);
}

- (id)assetsWhichNeedRecordFetch
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  char isKindOfClass;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  objc_msgSend_record(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_record(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      return 0;
    v6 = (void *)objc_opt_new();
    objc_msgSend_record(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operation(self, v14, v15);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_savePolicy(v60, v16, v17) == 2)
      objc_msgSend_allKeys(v13, v18, v19);
    else
      objc_msgSend_changedKeys(v13, v18, v19);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v72, v77, 16);
    if (v64)
    {
      v24 = *(_QWORD *)v73;
      v62 = v13;
      v63 = *(_QWORD *)v73;
      v61 = v21;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v73 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v25);
          objc_msgSend_objectForKey_(v13, v23, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v65 = v27;
            v66 = v25;
            v28 = v27;
            if (objc_msgSend_isReference(v28, v29, v30))
            {
              objc_msgSend_assetRereferenceInfo(v28, v31, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setDestinationFieldName_(v33, v34, v26);

              v24 = v63;
              goto LABEL_17;
            }
            goto LABEL_18;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v65 = v27;
            v66 = v25;
            v28 = v27;
            if (objc_msgSend_isReference(v28, v36, v37))
LABEL_17:
              objc_msgSend_addObject_(v6, v35, (uint64_t)v28);
LABEL_18:
            v27 = v65;

            v25 = v66;
            goto LABEL_19;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v65 = v27;
            v66 = v25;
            v38 = v27;
            objc_msgSend_firstObject(v38, v39, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v24 = v63;
            if ((isKindOfClass & 1) != 0)
            {
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              v43 = v38;
              v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v68, v76, 16);
              if (v45)
              {
                v46 = v45;
                v47 = *(_QWORD *)v69;
                do
                {
                  for (i = 0; i != v46; ++i)
                  {
                    if (*(_QWORD *)v69 != v47)
                      objc_enumerationMutation(v43);
                    v49 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v50, v51);
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v52, v53, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 1365, CFSTR("first element of asset array is not a CKAsset"));

                    }
                    if (objc_msgSend_isReference(v49, v50, v51))
                    {
                      objc_msgSend_assetRereferenceInfo(v49, v54, v55);
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setDestinationFieldName_(v56, v57, v26);

                      objc_msgSend_addObject_(v6, v58, (uint64_t)v49);
                    }
                  }
                  v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v54, (uint64_t)&v68, v76, 16);
                }
                while (v46);
              }

              v21 = v61;
              v13 = v62;
              v24 = v63;
            }
            goto LABEL_18;
          }
LABEL_19:

          ++v25;
        }
        while (v25 != v64);
        v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v72, v77, 16);
        v64 = v59;
      }
      while (v59);
    }

  }
  return v6;
}

- (id)prepareAssetsForUploadWithError:(id *)a3
{
  id *v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t (**v22)(void *, id, uint64_t, _QWORD);
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  const char *v45;
  const char *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  char v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  char v86;
  id v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  char isKindOfClass;
  const char *v92;
  uint64_t v93;
  id v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t k;
  void *v100;
  const char *v101;
  const char *v102;
  void *v103;
  char v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t m;
  void *v112;
  char v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  char v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t ii;
  void *v140;
  void *v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  char v154;
  const char *v155;
  void *v156;
  const char *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  _BOOL8 v168;
  const char *v169;
  uint64_t v170;
  id v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  CKDProgressTracker *v179;
  const char *v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  const char *v184;
  void *v185;
  _BOOL4 v186;
  void *v187;
  id v188;
  id *v189;
  void *v190;
  const char *v191;
  void *v192;
  const char *v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t n;
  uint64_t v199;
  id v200;
  id *v201;
  void *v202;
  id v203;
  id obj;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  CKDModifyRecordHandler *v209;
  id v210;
  id v211;
  id v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  _QWORD aBlock[5];
  id v263;
  id v264;
  id v265;
  uint64_t *v266;
  uint64_t *v267;
  uint64_t v268;
  uint64_t *v269;
  uint64_t v270;
  char v271;
  uint64_t v272;
  uint64_t *v273;
  uint64_t v274;
  char v275;
  _BYTE v276[128];
  _BYTE v277[128];
  _BYTE v278[128];
  _BYTE v279[128];
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  _BYTE v284[128];
  _BYTE v285[128];
  _BYTE v286[128];
  uint64_t v287;

  v3 = a3;
  v287 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, (uint64_t)a3) != 4)
  {
    v189 = v3;
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v190, v191, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 1382, CFSTR("%s called on handler %@ but it isn't in the state %s"), "-[CKDModifyRecordHandler prepareAssetsForUploadWithError:]", self, "CKDModifyRecordHandlerStateNeedAssetUpload");

    v3 = v189;
  }
  if (objc_msgSend_isDelete(self, v6, v7))
  {
    objc_msgSend_setState_(self, v8, 5);
    return 0;
  }
  v201 = v3;
  v10 = (void *)objc_opt_new();
  v209 = self;
  objc_msgSend_record(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_record(v209, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v192, v193, (uint64_t)a2, v209);

  }
  objc_msgSend_recordID(v13, v17, v18);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v202)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v194, v195, (uint64_t)a2, v209, CFSTR("CKDModifyRecordHandler.m"), 1392, CFSTR("Expected non-nil recordID for %@"), v13);

  }
  objc_msgSend_operation(v209, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v272 = 0;
  v273 = &v272;
  v274 = 0x2020000000;
  v275 = 0;
  v268 = 0;
  v269 = &v268;
  v270 = 0x2020000000;
  v271 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB542E0;
  aBlock[3] = &unk_1E78348C8;
  aBlock[4] = v209;
  v210 = v13;
  v263 = v210;
  v203 = v21;
  v264 = v203;
  v266 = &v268;
  v200 = v10;
  v265 = v200;
  v267 = &v272;
  v22 = (uint64_t (**)(void *, id, uint64_t, _QWORD))_Block_copy(aBlock);
  if (objc_msgSend_savePolicy(v203, v23, v24) == 2)
    objc_msgSend_allKeys(v210, v25, v26);
  else
    objc_msgSend_changedKeys(v210, v25, v26);
  v260 = 0u;
  v261 = 0u;
  v258 = 0u;
  v259 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v205 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v258, v286, 16);
  if (v205)
  {
    v206 = *(_QWORD *)v259;
    v199 = *MEMORY[0x1E0C94B20];
    do
    {
      v207 = 0;
      do
      {
        if (*(_QWORD *)v259 != v206)
          objc_enumerationMutation(obj);
        v217 = *(_QWORD *)(*((_QWORD *)&v258 + 1) + 8 * v207);
        objc_msgSend_objectForKey_(v210, v28, v217);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v29;
        if (v29)
        {
          v208 = v29;
        }
        else
        {
          objc_msgSend_encryptedValues(v210, v30, v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v33, v34, v217);
          v208 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((v22[2](v22, v208, v217, 0) & 1) == 0)
            goto LABEL_130;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = v208;
            if ((objc_msgSend_isReference(v35, v36, v37) & 1) != 0)
            {
              v256 = 0u;
              v257 = 0u;
              v254 = 0u;
              v255 = 0u;
              objc_msgSend_assets(v35, v38, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v254, v285, 16);
              v212 = v40;
              if (v42)
              {
                v43 = *(_QWORD *)v255;
                while (2)
                {
                  for (i = 0; i != v42; ++i)
                  {
                    if (*(_QWORD *)v255 != v43)
                      objc_enumerationMutation(v212);
                    if ((v22[2](v22, *(id *)(*((_QWORD *)&v254 + 1) + 8 * i), v217, 0) & 1) == 0)
                    {

                      goto LABEL_129;
                    }
                  }
                  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v45, (uint64_t)&v254, v285, 16);
                  if (v42)
                    continue;
                  break;
                }
              }
              goto LABEL_64;
            }
            if ((v22[2](v22, v35, v217, 0) & 1) == 0)
              goto LABEL_129;
            goto LABEL_65;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_prepareStreamingAsset_forUploadWithRecord_(v209, v46, (uint64_t)v208, v210);
            goto LABEL_66;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = v208;
            v250 = 0u;
            v251 = 0u;
            v252 = 0u;
            v253 = 0u;
            objc_msgSend_deltasToSave(v47, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v250, v284, 16);
            if (v54)
            {
              v55 = *(_QWORD *)v251;
LABEL_41:
              v56 = 0;
              while (1)
              {
                if (*(_QWORD *)v251 != v55)
                  objc_enumerationMutation(v50);
                v57 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * v56);
                objc_msgSend_asset(v57, v52, v53);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                if (v58)
                {
                  objc_msgSend_asset(v57, v52, v53);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_deltaID(v57, v60, v61);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = ((uint64_t (**)(void *, id, uint64_t, void *))v22)[2](v22, v59, v217, v62);

                  if ((v63 & 1) == 0)
                    break;
                }
                if (v54 == ++v56)
                {
                  v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v52, (uint64_t)&v250, v284, 16);
                  if (v54)
                    goto LABEL_41;
                  break;
                }
              }
            }

            v248 = 0u;
            v249 = 0u;
            v246 = 0u;
            v247 = 0u;
            objc_msgSend_pendingReplacementRequests(v47, v64, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v246, v283, 16);
            v212 = v66;
            if (v68)
            {
              v213 = *(_QWORD *)v247;
              do
              {
                v215 = v68;
                for (j = 0; j != v215; ++j)
                {
                  if (*(_QWORD *)v247 != v213)
                    objc_enumerationMutation(v212);
                  v72 = *(void **)(*((_QWORD *)&v246 + 1) + 8 * j);
                  v242 = 0u;
                  v243 = 0u;
                  v244 = 0u;
                  v245 = 0u;
                  objc_msgSend_replacementDeltas(v72, v69, v70);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v242, v282, 16);
                  if (v77)
                  {
                    v78 = *(_QWORD *)v243;
LABEL_55:
                    v79 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v243 != v78)
                        objc_enumerationMutation(v73);
                      v80 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * v79);
                      objc_msgSend_asset(v80, v75, v76);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v81)
                      {
                        objc_msgSend_asset(v80, v75, v76);
                        v82 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_deltaID(v80, v83, v84);
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        v86 = ((uint64_t (**)(void *, id, uint64_t, void *))v22)[2](v22, v82, v217, v85);

                        if ((v86 & 1) == 0)
                          break;
                      }
                      if (v77 == ++v79)
                      {
                        v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v75, (uint64_t)&v242, v282, 16);
                        if (v77)
                          goto LABEL_55;
                        break;
                      }
                    }
                  }

                }
                v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v69, (uint64_t)&v246, v283, 16);
              }
              while (v68);
            }
            goto LABEL_64;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v87 = v208;
            objc_msgSend_firstObject(v87, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v240 = 0u;
              v241 = 0u;
              v238 = 0u;
              v239 = 0u;
              v94 = v87;
              v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v238, v281, 16);
              if (v96)
              {
                v97 = 0;
                v98 = *(_QWORD *)v239;
                while (2)
                {
                  for (k = 0; k != v96; ++k)
                  {
                    if (*(_QWORD *)v239 != v98)
                      objc_enumerationMutation(v94);
                    v100 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * k);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_msgSend_setState_(v209, v101, 12);
                      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v155, v199, 1007, CFSTR("Invalid list of heterogenous values for field name %@ in recordID %@"), v217, v202);
                      v156 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setError_(v209, v157, (uint64_t)v156);

                      *((_BYTE *)v273 + 24) = 1;
                      goto LABEL_124;
                    }
                    objc_msgSend_setArrayIndex_(v100, v101, v97 + k);
                    if (!v22[2](v22, v100, v217, 0))
                      goto LABEL_124;
                  }
                  v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v102, (uint64_t)&v238, v281, 16);
                  v97 += k;
                  if (v96)
                    continue;
                  break;
                }
              }
LABEL_124:

              objc_msgSend_error(v209, v158, v159);
              v160 = (void *)objc_claimAutoreleasedReturnValue();

              if (v160)
              {
LABEL_129:

LABEL_130:
                goto LABEL_131;
              }
            }
            else
            {
              objc_msgSend_firstObject(v87, v92, v93);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v104 = objc_opt_isKindOfClass();

              if ((v104 & 1) != 0)
              {
                v236 = 0u;
                v237 = 0u;
                v234 = 0u;
                v235 = 0u;
                v212 = v87;
                v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v107, (uint64_t)&v234, v280, 16);
                if (v109)
                {
                  v110 = *(_QWORD *)v235;
                  do
                  {
                    for (m = 0; m != v109; ++m)
                    {
                      if (*(_QWORD *)v235 != v110)
                        objc_enumerationMutation(v212);
                      objc_msgSend_prepareStreamingAsset_forUploadWithRecord_(v209, v108, *(_QWORD *)(*((_QWORD *)&v234 + 1) + 8 * m), v210);
                    }
                    v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v108, (uint64_t)&v234, v280, 16);
                  }
                  while (v109);
                }
                goto LABEL_64;
              }
              objc_msgSend_firstObject(v87, v105, v106);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v113 = objc_opt_isKindOfClass();

              if ((v113 & 1) != 0)
              {
                v232 = 0u;
                v233 = 0u;
                v230 = 0u;
                v231 = 0u;
                v212 = v87;
                v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v114, (uint64_t)&v230, v279, 16);
                if (v196)
                {
                  v197 = *(_QWORD *)v231;
                  do
                  {
                    for (n = 0; n != v196; ++n)
                    {
                      if (*(_QWORD *)v231 != v197)
                        objc_enumerationMutation(v212);
                      v117 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * n);
                      v226 = 0u;
                      v227 = 0u;
                      v228 = 0u;
                      v229 = 0u;
                      objc_msgSend_deltasToSave(v117, v115, v116);
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v119, (uint64_t)&v226, v278, 16);
                      if (v122)
                      {
                        v123 = *(_QWORD *)v227;
LABEL_97:
                        v124 = 0;
                        while (1)
                        {
                          if (*(_QWORD *)v227 != v123)
                            objc_enumerationMutation(v118);
                          v125 = *(void **)(*((_QWORD *)&v226 + 1) + 8 * v124);
                          objc_msgSend_asset(v125, v120, v121);
                          v126 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v126)
                          {
                            objc_msgSend_asset(v125, v120, v121);
                            v127 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_deltaID(v125, v128, v129);
                            v130 = (void *)objc_claimAutoreleasedReturnValue();
                            v131 = ((uint64_t (**)(void *, id, uint64_t, void *))v22)[2](v22, v127, v217, v130);

                            if ((v131 & 1) == 0)
                              break;
                          }
                          if (v122 == ++v124)
                          {
                            v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v120, (uint64_t)&v226, v278, 16);
                            if (v122)
                              goto LABEL_97;
                            break;
                          }
                        }
                      }

                      v224 = 0u;
                      v225 = 0u;
                      v222 = 0u;
                      v223 = 0u;
                      objc_msgSend_pendingReplacementRequests(v117, v132, v133);
                      v134 = (void *)objc_claimAutoreleasedReturnValue();
                      v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v222, v277, 16);
                      if (v136)
                      {
                        v214 = *(_QWORD *)v223;
                        v211 = v134;
                        do
                        {
                          v216 = v136;
                          for (ii = 0; ii != v216; ++ii)
                          {
                            if (*(_QWORD *)v223 != v214)
                              objc_enumerationMutation(v211);
                            v140 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * ii);
                            v218 = 0u;
                            v219 = 0u;
                            v220 = 0u;
                            v221 = 0u;
                            objc_msgSend_replacementDeltas(v140, v137, v138);
                            v141 = (void *)objc_claimAutoreleasedReturnValue();
                            v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v141, v142, (uint64_t)&v218, v276, 16);
                            if (v145)
                            {
                              v146 = *(_QWORD *)v219;
LABEL_111:
                              v147 = 0;
                              while (1)
                              {
                                if (*(_QWORD *)v219 != v146)
                                  objc_enumerationMutation(v141);
                                v148 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * v147);
                                objc_msgSend_asset(v148, v143, v144);
                                v149 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v149)
                                {
                                  objc_msgSend_asset(v148, v143, v144);
                                  v150 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend_deltaID(v148, v151, v152);
                                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                                  v154 = ((uint64_t (**)(void *, id, uint64_t, void *))v22)[2](v22, v150, v217, v153);

                                  if ((v154 & 1) == 0)
                                    break;
                                }
                                if (v145 == ++v147)
                                {
                                  v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v141, v143, (uint64_t)&v218, v276, 16);
                                  if (v145)
                                    goto LABEL_111;
                                  break;
                                }
                              }
                            }

                          }
                          v134 = v211;
                          v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v211, v137, (uint64_t)&v222, v277, 16);
                        }
                        while (v136);
                      }

                    }
                    v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v115, (uint64_t)&v230, v279, 16);
                  }
                  while (v196);
                }
LABEL_64:

              }
            }
LABEL_65:

          }
        }
LABEL_66:

        ++v207;
      }
      while (v207 != v205);
      v161 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v258, v286, 16);
      v205 = v161;
    }
    while (v161);
  }
LABEL_131:

  if (!*((_BYTE *)v269 + 24))
  {
    objc_msgSend_error(v209, v162, v163);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = v185 == 0;

    if (v186)
      objc_msgSend_setState_(v209, v169, 5);
    goto LABEL_138;
  }
  objc_msgSend_progressTracker(v209, v162, v163);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  if (v166)
    goto LABEL_135;
  objc_msgSend_saveProgressBlock(v203, v164, v165);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v167 == 0;

  if (!v168)
  {
    v171 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_recordID(v209, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v174, v175, v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = (void *)objc_msgSend_initWithFormat_(v171, v178, (uint64_t)CFSTR("up|%@"), v177);

    v179 = [CKDProgressTracker alloc];
    v181 = (void *)objc_msgSend_initWithTrackingID_(v179, v180, (uint64_t)v166);
    objc_msgSend_setLastItemPercentage_(v181, v182, v183, 0.01);
    objc_msgSend_setProgressTracker_(v209, v184, (uint64_t)v181);

LABEL_135:
  }
LABEL_138:
  if (*((_BYTE *)v273 + 24))
  {
    if (v201)
    {
      objc_msgSend_error(v209, v169, v170);
      *v201 = (id)objc_claimAutoreleasedReturnValue();
    }

    v187 = 0;
  }
  else
  {
    v187 = v200;
  }
  v188 = v187;

  _Block_object_dispose(&v268, 8);
  _Block_object_dispose(&v272, 8);

  return v188;
}

- (BOOL)_prepareAsset:(id)a3 recordKey:(id)a4 mergeableDeltaID:(id)a5 record:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  id v18;
  void *v19;
  char isKindOfClass;
  id v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  id v31;
  BOOL v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  CKDWrappingContext *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t i;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  NSObject *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  void *v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  CKDWrappingContext *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  const char *v159;
  void *v160;
  const char *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  NSObject *v165;
  const char *v166;
  void *v167;
  const char *v168;
  const char *v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  NSObject *v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  void *v190;
  const char *v191;
  const char *v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  void *v197;
  const char *v198;
  void *v199;
  const char *v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  NSObject *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  int v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  id *v228;
  id *v229;
  id *v230;
  id v231;
  id v232;
  id v233;
  void *v234;
  void *v235;
  id v236;
  id v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  uint8_t buf[4];
  id v243;
  __int16 v244;
  id v245;
  _BYTE v246[128];
  uint64_t v247;

  v247 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v18 = a6;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v197, v198, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 1531, CFSTR("Expected non-nil recordKey for %@"), 0);

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v199, v200, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 1532, CFSTR("Expected non-nil recordKey for %@"), v13);

LABEL_3:
  objc_msgSend_operation(self, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v21 = v13;
  objc_msgSend_setRecord_(v21, v22, (uint64_t)v18);
  objc_msgSend_setRecordKey_(v21, v23, (uint64_t)v14);
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend_setMergeableDeltaID_(v21, v24, (uint64_t)v15);
    if ((objc_msgSend_useEncryption(v19, v33, v34) & 1) != 0
      || objc_msgSend_useClearAssetEncryption(v19, v35, v36))
    {
      if (objc_msgSend_useEncryption(v19, v35, v36)
        && (objc_msgSend_wrappedAssetKey(v21, v37, v38),
            v39 = (void *)objc_claimAutoreleasedReturnValue(),
            v39,
            v39))
      {
        v228 = a7;
        v226 = objc_msgSend_recordPCS(v18, v37, v38);
        v40 = [CKDWrappingContext alloc];
        objc_msgSend_recordID(v18, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_signature(v21, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_referenceSignature(v21, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v231 = v15;
        v51 = (void *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v40, v50, (uint64_t)v43, v14, v15, v46, v49);

        objc_msgSend_pcsManager(self, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_wrappedAssetKey(v21, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v236 = 0;
        objc_msgSend_unwrapAssetKey_withRecordPCS_inContext_withError_(v54, v58, (uint64_t)v57, v226, v51, &v236);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v236;
        objc_msgSend_setAssetKey_(v21, v60, (uint64_t)v59);

        objc_msgSend_assetKey(v21, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v63)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v64 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v243 = v21;
            v244 = 2112;
            v245 = v31;
            _os_log_debug_impl(&dword_1BE990000, v64, OS_LOG_TYPE_DEBUG, "Couldn't unwrap asset key for asset %@: %@. Wrapping a new asset key and re-saving the asset.", buf, 0x16u);
          }
          objc_msgSend_setWrappedAssetKey_(v21, v65, 0);
          objc_msgSend_setAssetKey_(v21, v66, 0);
          objc_msgSend_setUploaded_(v21, v67, 0);
          objc_msgSend_setUploadReceipt_(v21, v68, 0);
          objc_msgSend_setUploadReceiptExpiration_(v21, v69, v70, 0.0);
        }

        a7 = v228;
        v15 = v231;
      }
      else
      {
        if (objc_msgSend_useClearAssetEncryption(v19, v37, v38))
        {
          objc_msgSend_clearAssetKey(v21, v71, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73)
          {
            objc_msgSend_clearAssetKey(v21, v71, v72);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setAssetKey_(v21, v75, (uint64_t)v74);

          }
        }
        v31 = 0;
      }
      objc_msgSend_assetKey(v21, v71, v72);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if (v76)
        goto LABEL_80;
      v229 = a7;

      objc_msgSend_assetUUIDToExpectedProperties(self, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUID(v21, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v81, v85, (uint64_t)v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_assetKey(v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      v232 = v15;
      if (v89)
      {
        objc_msgSend_setAssetKey_(v21, v90, (uint64_t)v89);
        v31 = 0;
      }
      else
      {
        objc_msgSend_container(v19, v90, v91);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_options(v124, v125, v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = objc_msgSend_mmcsEncryptionSupport(v127, v128, v129);

        if (v130 == 1)
          goto LABEL_64;
        if (v130 == 2)
          goto LABEL_48;
        if (v130 != 3)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            goto LABEL_93;
          while (1)
          {
            v201 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              v204 = v201;
              objc_msgSend_container(v19, v205, v206);
              v207 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_options(v207, v208, v209);
              v210 = (void *)objc_claimAutoreleasedReturnValue();
              v213 = objc_msgSend_mmcsEncryptionSupport(v210, v211, v212);
              *(_DWORD *)buf = 67109120;
              LODWORD(v243) = v213;
              _os_log_error_impl(&dword_1BE990000, v204, OS_LOG_TYPE_ERROR, "Unexpected MMCSEncryptionSupportValue of 0x%x", buf, 8u);

            }
            v214 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend_container(v19, v202, v203);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_options(v19, v215, v216);
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            v220 = objc_msgSend_mmcsEncryptionSupport(v217, v218, v219);
            objc_msgSend_stringWithFormat_(v214, v221, (uint64_t)CFSTR("Unexpected MMCSEncryptionSupportValue of 0x%x"), v220);
            v222 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_UTF8String(v222, v223, v224);
            _os_crash();
            __break(1u);
LABEL_93:
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          }
        }
        if ((objc_msgSend_useMMCSEncryptionV2(v21, v131, v132) & 1) != 0)
        {
LABEL_48:
          objc_msgSend_pcsManager(self, v131, v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          v235 = 0;
          v135 = (void *)objc_msgSend_newAssetKeyWithType_withError_(v133, v134, 1, &v235);
          v136 = v235;
        }
        else
        {
LABEL_64:
          objc_msgSend_pcsManager(self, v131, v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          v234 = 0;
          v135 = (void *)objc_msgSend_newAssetKeyWithType_withError_(v133, v168, 0, &v234);
          v136 = v234;
        }
        v31 = v136;
        objc_msgSend_setAssetKey_(v21, v169, (uint64_t)v135);

      }
      objc_msgSend_assetKey(v21, v92, v93);
      v170 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v170 || v31)
      {
        if (v229)
          *v229 = objc_retainAutorelease(v31);
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v184 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v243 = v31;
          _os_log_error_impl(&dword_1BE990000, v184, OS_LOG_TYPE_ERROR, "Couldn't create an asset key: %@", buf, 0xCu);
        }
        v32 = 0;
LABEL_83:

        goto LABEL_86;
      }
      objc_msgSend_assetUUIDToExpectedProperties(self, v171, v172);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUID(v21, v174, v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v173, v177, (uint64_t)v176);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_referenceSignature(v178, v179, v180);
      v181 = (void *)objc_claimAutoreleasedReturnValue();

      if (v181)
      {
        objc_msgSend_setReferenceSignature_(v21, v182, (uint64_t)v181);
      }
      else
      {
        objc_msgSend_pcsManager(self, v182, v183);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_assetKey(v21, v186, v187);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_referenceSignatureFromAssetKey_(v185, v189, (uint64_t)v188);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setReferenceSignature_(v21, v191, (uint64_t)v190);

      }
      v15 = v232;

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v121 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v243 = v21;
        _os_log_impl(&dword_1BE990000, v121, OS_LOG_TYPE_INFO, "Skipping unwrapping of asset key for %@ because encryption is disabled", buf, 0xCu);
      }
    }
    v31 = 0;
LABEL_80:
    if (!objc_msgSend_uploaded(v21, v77, v78))
    {
      v32 = 1;
      goto LABEL_86;
    }
    if (!objc_msgSend_paddedFileSize(v21, v192, v193))
    {
      v32 = 0;
      goto LABEL_86;
    }
    objc_msgSend_uploadReceipt(v21, v194, v195);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v89 == 0;
    goto LABEL_83;
  }
  if (!objc_msgSend_isReference(v21, v24, v25))
  {
    if (objc_msgSend_useEncryption(v19, v26, v27))
    {
      v233 = v15;
      v227 = objc_msgSend_recordPCS(v18, v94, v95);
      objc_msgSend_assets(v21, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v98, v99, v100))
      {
        objc_msgSend_assets(v21, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v103, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v106 = 0;
      }

      objc_msgSend_wrappedAssetKey(v106, v137, v138);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v225 = v19;
        v140 = [CKDWrappingContext alloc];
        objc_msgSend_recordID(v18, v141, v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_signature(v106, v144, v145);
        v230 = a7;
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_referenceSignature(v106, v147, v148);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = (void *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v140, v150, (uint64_t)v143, v14, 0, v146, v149);

        objc_msgSend_pcsManager(self, v152, v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_wrappedAssetKey(v106, v155, v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v237 = 0;
        v158 = v227;
        objc_msgSend_unwrapAssetKey_withRecordPCS_inContext_withError_(v154, v159, (uint64_t)v157, v227, v151, &v237);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v237;
        objc_msgSend_setAssetKey_(v106, v161, (uint64_t)v160);

        a7 = v230;
        objc_msgSend_assetKey(v106, v162, v163);
        v164 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v164)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v165 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v243 = v106;
            v244 = 2112;
            v245 = v31;
            _os_log_debug_impl(&dword_1BE990000, v165, OS_LOG_TYPE_DEBUG, "Couldn't unwrap asset key for the package manifest asset %@: %@", buf, 0x16u);
          }
          objc_msgSend_setAssets_(v21, v166, 0);
        }

        v19 = v225;
      }
      else
      {
        v158 = v227;
      }
      objc_msgSend_setRecordPCS_(v21, v139, v158);

      v15 = v233;
    }
    else
    {
      if (!objc_msgSend_useClearAssetEncryption(v19, v94, v95))
      {
        v31 = 0;
LABEL_63:
        objc_msgSend_assets(v21, v122, v123);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v167 == 0;

        goto LABEL_86;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v122, *MEMORY[0x1E0C94B20], 1017, CFSTR("Packages not supported with clear asset encryption."));
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a7 && v31)
    {
      v31 = objc_retainAutorelease(v31);
      *a7 = v31;
    }
    goto LABEL_63;
  }
  objc_msgSend_error(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7 && v28)
  {
    objc_msgSend_error(self, v29, v30);
    v31 = 0;
    v32 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v240 = 0u;
    v241 = 0u;
    v238 = 0u;
    v239 = 0u;
    objc_msgSend_assets(v21, v29, v30);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v108, (uint64_t)&v238, v246, 16);
    if (v109)
    {
      v111 = v109;
      v112 = *(_QWORD *)v239;
      do
      {
        for (i = 0; i != v111; ++i)
        {
          if (*(_QWORD *)v239 != v112)
            objc_enumerationMutation(v107);
          v114 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * i);
          objc_msgSend_setRecord_(v114, v110, (uint64_t)v18);
          objc_msgSend_setRecordKey_(v114, v115, (uint64_t)v14);
        }
        v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v110, (uint64_t)&v238, v246, 16);
      }
      while (v111);
    }

    objc_msgSend_assets(v21, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_count(v118, v119, v120) != 0;

    v31 = 0;
  }
LABEL_86:

  return v32;
}

- (void)prepareStreamingAsset:(id)a3 forUploadWithRecord:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  int isEqualToString;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  int v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_operation(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x1E0C94730]);

  if (isEqualToString)
  {
    objc_msgSend_container(v10, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerScopedUserID(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOwner_(v6, v28, (uint64_t)v27);
  }
  else
  {
    objc_msgSend_recordID(v7, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v24, v29, v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ownerName(v27, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOwner_(v6, v34, (uint64_t)v33);

  }
  objc_msgSend_referenceSignature(v6, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v40 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v51 = 138412290;
      v52 = v6;
      _os_log_debug_impl(&dword_1BE990000, v40, OS_LOG_TYPE_DEBUG, "Generating new reference signature for streaming asset %@", (uint8_t *)&v51, 0xCu);
    }
    objc_msgSend_signatureForStreamingAsset(MEMORY[0x1E0C95138], v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReferenceSignature_(v6, v44, (uint64_t)v43);

  }
  objc_msgSend_fileSignature(v6, v38, v39);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v46 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v51 = 138412290;
      v52 = v6;
      _os_log_debug_impl(&dword_1BE990000, v46, OS_LOG_TYPE_DEBUG, "Generating new file signature for streaming asset %@", (uint8_t *)&v51, 0xCu);
    }
    objc_msgSend_signatureForStreamingAsset(MEMORY[0x1E0C95138], v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFileSignature_(v6, v50, (uint64_t)v49);

  }
}

- (void)prepareForSaveWithCompletionHandler:(id)a3
{
  void (**v5)(_QWORD);
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int hasNonLegacyShareURLEntitlement;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint8_t buf[4];
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a3;
  if (objc_msgSend_state(self, v6, v7) != 5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v60, v61, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 1665, CFSTR("%s called on handler %@ but it isn't in the state %s"), "-[CKDModifyRecordHandler prepareForSaveWithCompletionHandler:]", self, "CKDModifyRecordHandlerStateNeedRecordPrepareForUpload");

  }
  if ((objc_msgSend_isDelete(self, v8, v9) & 1) != 0)
    goto LABEL_21;
  objc_msgSend_record(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v62, v63, (uint64_t)a2, self, CFSTR("CKDModifyRecordHandler.m"), 1670, CFSTR("Lost a record: %@"), self);

  }
  objc_msgSend_operation(self, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_savePolicy(v15, v16, v17) == 2)
  {
    if ((objc_msgSend_hasEncryptedData(v14, v18, v19) & 1) == 0)
    {
LABEL_8:
      v22 = 1;
      goto LABEL_15;
    }
  }
  else if (!objc_msgSend_hasModifiedEncryptedData(v14, v18, v19))
  {
    goto LABEL_8;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v23 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v25 = v23;
    objc_msgSend_recordID(v14, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v65 = v28;
    _os_log_impl(&dword_1BE990000, v25, OS_LOG_TYPE_INFO, "Record %@ has encrypted data. Wrapping that data now...", buf, 0xCu);

  }
  v22 = objc_msgSend__wrapEncryptedDataOnRecord_(self, v24, (uint64_t)v14);
LABEL_15:
  if (objc_msgSend_databaseScope(v15, v20, v21) == 2)
  {
    objc_msgSend_container(v15, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entitlements(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    hasNonLegacyShareURLEntitlement = objc_msgSend_hasNonLegacyShareURLEntitlement(v34, v35, v36);

    objc_msgSend_container(v15, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v43;
    if (hasNonLegacyShareURLEntitlement)
      objc_msgSend_sharingURLHostname(v43, v44, v45);
    else
      objc_msgSend_displayedHostname(v43, v44, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayedHostname_(v14, v48, (uint64_t)v47);

  }
  if (!v22)
  {
    objc_msgSend_setState_(self, v10, 12);
    v49 = (void *)MEMORY[0x1E0C94FF8];
    v50 = *MEMORY[0x1E0C94B20];
    objc_msgSend_record(self, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v49, v57, v50, 5001, CFSTR("Couldn't encrypt data on record %@"), v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v59, (uint64_t)v58);

    goto LABEL_23;
  }
LABEL_21:
  objc_msgSend_setState_(self, v10, 6);
LABEL_23:
  v5[2](v5);

}

- (BOOL)_wrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 forField:(id)a5 recordID:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  int isEqualToString;
  NSObject *v28;
  const char *v29;
  void *v30;
  const char *v31;
  BOOL v32;
  void *v33;
  CKDWrappingContext *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  int v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v14 = a6;
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_operation(self, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceContext(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDeviceReference(v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v26 = (void *)v24;
      isEqualToString = objc_msgSend_isEqualToString_(v11, v25, (uint64_t)CFSTR("EEEEEEEEEENCRYPTION_BREAKER"));

      if (isEqualToString)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v28 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v45 = 138543362;
          v46 = v11;
          _os_log_debug_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEBUG, "Creating bad encrypted data for the field %{public}@. Let's hope you know what you're doing!", (uint8_t *)&v45, 0xCu);
        }
        objc_msgSend_dataUsingEncoding_(CFSTR("🐔🐔🐔"), v29, 4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setEncryptedData_(v10, v31, (uint64_t)v30);

        v32 = 1;
        goto LABEL_22;
      }
    }
    else
    {

    }
  }
  objc_msgSend_data(v10, v12, v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = [CKDWrappingContext alloc];
    v36 = (void *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v34, v35, (uint64_t)v14, v11, 0, 0, 0);
    objc_msgSend_pcsManager(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_wrapEncryptedData_withPCS_inContext_(v39, v40, (uint64_t)v10, a4, v36);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v41 == 0;
    if (v41)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v42 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v45 = 138543618;
        v46 = v11;
        v47 = 2112;
        v48 = v41;
        _os_log_impl(&dword_1BE990000, v42, OS_LOG_TYPE_INFO, "Warn: Couldn't wrap encrypte data for field %{public}@: %@", (uint8_t *)&v45, 0x16u);
      }
    }

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v43 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v45 = 138543362;
      v46 = v11;
      _os_log_impl(&dword_1BE990000, v43, OS_LOG_TYPE_INFO, "Warn: Can't wrap a nil encrypted data for field %{public}@", (uint8_t *)&v45, 0xCu);
    }
    v32 = 0;
  }
LABEL_22:

  return v32;
}

- (void)_pretendToWrapEncryptedDataForRecordValueStore:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  char isKindOfClass;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend_allKeys(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v40, v45, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v41;
    v34 = v6;
    v35 = v3;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend_rawValueForKey_(v3, v9, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), v34, v35);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_data(v13, v14, v15);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setEncryptedData_(v13, v17, (uint64_t)v16);
LABEL_8:

          goto LABEL_20;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend_count(v13, v18, v19))
          {
            objc_msgSend_firstObject(v13, v20, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v38 = 0u;
              v39 = 0u;
              v36 = 0u;
              v37 = 0u;
              v16 = v13;
              v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v24, (uint64_t)&v36, v44, 16);
              if (v25)
              {
                v28 = v25;
                v29 = *(_QWORD *)v37;
                do
                {
                  for (j = 0; j != v28; ++j)
                  {
                    if (*(_QWORD *)v37 != v29)
                      objc_enumerationMutation(v16);
                    v31 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                    objc_msgSend_data(v31, v26, v27);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setEncryptedData_(v31, v33, (uint64_t)v32);

                  }
                  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v26, (uint64_t)&v36, v44, 16);
                }
                while (v28);
                v6 = v34;
                v3 = v35;
              }
              goto LABEL_8;
            }
          }
        }
LABEL_20:

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v40, v45, 16);
    }
    while (v10);
  }

}

- (BOOL)_wrapEncryptedDataForRecordValueStore:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  int v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  char isKindOfClass;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend_allKeys(v5, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v50, v55, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v51;
    v13 = 1;
    v40 = *(_QWORD *)v51;
    do
    {
      v14 = 0;
      v41 = v11;
      do
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v14);
        objc_msgSend_rawValueForKey_(v5, v10, v15, v40);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_recordID(v5, v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend__wrapEncryptedData_withPCS_forField_recordID_(self, v20, (uint64_t)v16, a4, v15, v19);

          v13 &= v21;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v16, v22, v23))
          {
            v43 = v14;
            objc_msgSend_firstObject(v16, v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v48 = 0u;
              v49 = 0u;
              v46 = 0u;
              v47 = 0u;
              v42 = v16;
              v28 = v16;
              v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v46, v54, 16);
              if (v30)
              {
                v33 = v30;
                v34 = *(_QWORD *)v47;
                do
                {
                  for (i = 0; i != v33; ++i)
                  {
                    if (*(_QWORD *)v47 != v34)
                      objc_enumerationMutation(v28);
                    v36 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
                    objc_msgSend_recordID(v5, v31, v32);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v36) = objc_msgSend__wrapEncryptedData_withPCS_forField_recordID_(self, v38, v36, a4, v15, v37);

                    v13 &= v36;
                  }
                  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v46, v54, 16);
                }
                while (v33);
              }

              v12 = v40;
              v11 = v41;
              v16 = v42;
              v14 = v43;
            }
            else
            {
              v14 = v43;
            }
          }
        }

        ++v14;
      }
      while (v14 != v11);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v50, v55, 16);
    }
    while (v11);
  }
  else
  {
    LOBYTE(v13) = 1;
  }

  return v13 & 1;
}

- (BOOL)_encryptMergeableDeltasInRecordValueStore:(id)a3 shareProtection:(_OpaquePCSShareProtection *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  CKDKeyEnvelopeContext *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  char v44;
  id v45;
  void *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  CKDKeyEnvelopeContext *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  char v74;
  id v75;
  void *v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v83;
  id v84;
  uint64_t v85;
  id obj;
  void *v87;
  uint64_t v88;
  id v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  uint8_t v114[128];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  id v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_operation(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptMergeableValueMetadata(v15, v16, v17);

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  objc_msgSend_allKeys(v6, v18, v19);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v109, v120, 16);
  if (v21)
  {
    v23 = v21;
    v24 = *(_QWORD *)v110;
    v94 = 1;
    v83 = *(_QWORD *)v110;
    v84 = v6;
    do
    {
      v25 = 0;
      v85 = v23;
      do
      {
        if (*(_QWORD *)v110 != v24)
          objc_enumerationMutation(obj);
        objc_msgSend_rawValueForKey_(v6, v22, *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * v25));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v87 = v26;
          v88 = v25;
          v27 = v26;
          v105 = 0u;
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          v89 = v27;
          objc_msgSend_deltasToSave(v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v105, v119, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v106;
            do
            {
              v35 = 0;
              do
              {
                if (*(_QWORD *)v106 != v34)
                  objc_enumerationMutation(v30);
                v36 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v35);
                v37 = objc_alloc_init(CKDKeyEnvelopeContext);
                objc_msgSend_setShareProtection_(v37, v38, (uint64_t)a4);
                objc_msgSend_encryptMetadataTernary(v36, v39, v40);
                v41 = CKBoolFromCKTernaryWithDefault();
                objc_msgSend_setEncryptMergeableValueMetadata_(v37, v42, v41);
                v104 = 0;
                v44 = objc_msgSend_encryptWithContext_error_(v36, v43, (uint64_t)v37, &v104);
                v45 = v104;
                if ((v44 & 1) == 0)
                {
                  if (*MEMORY[0x1E0C95300] != -1)
                    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                  v46 = (void *)*MEMORY[0x1E0C952B0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
                  {
                    v47 = v46;
                    objc_msgSend_valueID(v36, v48, v49);
                    v50 = v34;
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v116 = v51;
                    v117 = 2112;
                    v118 = v45;
                    _os_log_impl(&dword_1BE990000, v47, OS_LOG_TYPE_INFO, "Failed to encrypt mergeable delta %@, with error: %@", buf, 0x16u);

                    v34 = v50;
                  }
                  v94 = 0;
                }

                ++v35;
              }
              while (v33 != v35);
              v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v52, (uint64_t)&v105, v119, 16);
            }
            while (v33);
          }

          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          objc_msgSend_pendingReplacementRequests(v89, v53, v54);
          v90 = (id)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v55, (uint64_t)&v100, v114, 16);
          if (v92)
          {
            v91 = *(_QWORD *)v101;
            do
            {
              v58 = 0;
              do
              {
                if (*(_QWORD *)v101 != v91)
                  objc_enumerationMutation(v90);
                v93 = v58;
                v59 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v58);
                v96 = 0u;
                v97 = 0u;
                v98 = 0u;
                v99 = 0u;
                objc_msgSend_replacementDeltas(v59, v56, v57);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v96, v113, 16);
                if (v62)
                {
                  v63 = v62;
                  v64 = *(_QWORD *)v97;
                  do
                  {
                    v65 = 0;
                    do
                    {
                      if (*(_QWORD *)v97 != v64)
                        objc_enumerationMutation(v60);
                      v66 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v65);
                      v67 = objc_alloc_init(CKDKeyEnvelopeContext);
                      objc_msgSend_setShareProtection_(v67, v68, (uint64_t)a4);
                      objc_msgSend_encryptMetadataTernary(v66, v69, v70);
                      v71 = CKBoolFromCKTernaryWithDefault();
                      objc_msgSend_setEncryptMergeableValueMetadata_(v67, v72, v71);
                      v95 = 0;
                      v74 = objc_msgSend_encryptWithContext_error_(v66, v73, (uint64_t)v67, &v95);
                      v75 = v95;
                      if ((v74 & 1) == 0)
                      {
                        if (*MEMORY[0x1E0C95300] != -1)
                          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                        v76 = (void *)*MEMORY[0x1E0C952B0];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
                        {
                          v77 = v76;
                          objc_msgSend_valueID(v66, v78, v79);
                          v80 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412546;
                          v116 = v80;
                          v117 = 2112;
                          v118 = v75;
                          _os_log_impl(&dword_1BE990000, v77, OS_LOG_TYPE_INFO, "Failed to encrypt mergeable delta %@, with error: %@", buf, 0x16u);

                        }
                        v94 = 0;
                      }

                      ++v65;
                    }
                    while (v63 != v65);
                    v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v81, (uint64_t)&v96, v113, 16);
                  }
                  while (v63);
                }

                v58 = v93 + 1;
              }
              while (v93 + 1 != v92);
              v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v56, (uint64_t)&v100, v114, 16);
            }
            while (v92);
          }

          v24 = v83;
          v6 = v84;
          v23 = v85;
          v26 = v87;
          v25 = v88;
        }

        ++v25;
      }
      while (v25 != v23);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v109, v120, 16);
    }
    while (v23);
  }
  else
  {
    v94 = 1;
  }

  return v94 & 1;
}

- (BOOL)_wrapEncryptedDataOnRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  int v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  int v29;
  int v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  BOOL v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  int isEqualToString;
  const char *v90;
  uint64_t v91;
  CKDModifyRecordHandler *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t i;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  char v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  void *v119;
  int v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint8_t buf[4];
  void *v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_operation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_useEncryption(v7, v8, v9);

  if ((v10 & 1) != 0)
  {
    v13 = objc_msgSend_recordPCS(v4, v11, v12);
    if (v13)
    {
      v16 = v13;
      objc_msgSend_valueStore(v4, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend__wrapEncryptedDataForRecordValueStore_withPCS_(self, v18, (uint64_t)v17, v16);

      objc_msgSend_encryptedValueStore(v4, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend__wrapEncryptedDataForRecordValueStore_withPCS_(self, v23, (uint64_t)v22, v16);

      objc_msgSend_encryptedValueStore(v4, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend__encryptMergeableDeltasInRecordValueStore_shareProtection_(self, v28, (uint64_t)v27, v16);

      v30 = v29 & v24 & v19;
      objc_msgSend_record(self, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_chainPrivateKey(v33, v34, v35);
      v36 = objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v39 = (void *)v36;
        objc_msgSend_record(self, v37, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_chainPrivateKey(v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *MEMORY[0x1E0C95330];
        objc_msgSend_recordID(v4, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v44) = objc_msgSend__wrapEncryptedData_withPCS_forField_recordID_(self, v48, (uint64_t)v43, v16, v44, v47);

        if (!(_DWORD)v44)
          v30 = 0;
      }
      else
      {

      }
      objc_msgSend_record(self, v49, v50);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mutableEncryptedPSK(v66, v67, v68);
      v69 = objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        v72 = (void *)v69;
        objc_msgSend_record(self, v70, v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mutableEncryptedPSK(v73, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = *MEMORY[0x1E0C95380];
        objc_msgSend_recordID(v4, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v77) = objc_msgSend__wrapEncryptedData_withPCS_forField_recordID_(self, v81, (uint64_t)v76, v16, v77, v80);

        if (!(_DWORD)v77)
          v30 = 0;
      }
      else
      {

      }
      objc_msgSend_recordID(v4, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v84, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v87, v88, *MEMORY[0x1E0C949F0]);

      v60 = v30 != 0;
      if (isEqualToString)
      {
        v121 = v30;
        v124 = v16;
        v125 = v4;
        v92 = self;
        objc_msgSend_record(self, v90, v91);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_oneTimeURLMetadatasByParticipantID(v123, v93, v94);
        v126 = 0u;
        v127 = 0u;
        v128 = 0u;
        v129 = 0u;
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allValues(v122, v95, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v98, (uint64_t)&v126, v132, 16);
        if (v99)
        {
          v102 = v99;
          v103 = *(_QWORD *)v127;
          v104 = *MEMORY[0x1E0C95378];
          while (2)
          {
            for (i = 0; i != v102; ++i)
            {
              if (*(_QWORD *)v127 != v103)
                objc_enumerationMutation(v97);
              v106 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
              objc_msgSend_encryptedOneTimeFullToken(v106, v100, v101);
              v107 = objc_claimAutoreleasedReturnValue();
              if (v107)
              {
                v108 = (void *)v107;
                objc_msgSend_encryptedOneTimeFullToken(v106, v100, v101);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_recordID(v125, v110, v111);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                v114 = objc_msgSend__wrapEncryptedData_withPCS_forField_recordID_(v92, v113, (uint64_t)v109, v124, v104, v112);

                if ((v114 & 1) == 0)
                {

                  goto LABEL_36;
                }
              }
            }
            v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v100, (uint64_t)&v126, v132, 16);
            if (v102)
              continue;
            break;
          }
        }

        if (v121)
        {
          v117 = v122;
          v119 = v123;
          if (objc_msgSend_count(v122, v115, v116))
            objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v123, v118, (uint64_t)v122);
          v60 = 1;
          v4 = v125;
        }
        else
        {
LABEL_36:
          v60 = 0;
          v4 = v125;
          v117 = v122;
          v119 = v123;
        }

      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v61 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v62 = v61;
        objc_msgSend_recordID(v4, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v131 = v65;
        _os_log_impl(&dword_1BE990000, v62, OS_LOG_TYPE_INFO, "Warn: Couldn't get a record PCS for record %@, but it has encrypted data set on it", buf, 0xCu);

      }
      v60 = 0;
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v51 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v51, OS_LOG_TYPE_INFO, "Skipping wrapping of encrypted data because encryption is disabled", buf, 2u);
    }
    objc_msgSend_valueStore(v4, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__pretendToWrapEncryptedDataForRecordValueStore_(self, v55, (uint64_t)v54);

    objc_msgSend_encryptedValueStore(v4, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__pretendToWrapEncryptedDataForRecordValueStore_(self, v59, (uint64_t)v58);

    v60 = 1;
  }

  return v60;
}

- (void)savePCSDataToCache
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  id v31;

  objc_msgSend_record(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionData(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordPCSData(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPcsData_(v10, v11, (uint64_t)v7);

  objc_msgSend_record(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionEtag(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordPCSData(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEtag_(v20, v21, (uint64_t)v17);

  objc_msgSend_operation(self, v22, v23);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordPCSData(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedRecordID_(v31, v30, (uint64_t)v26, v29);

}

- (void)setServerRecord:(id)a3
{
  CKRecord *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  id v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  id v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  CKRecord *serverRecord;

  v4 = (CKRecord *)a3;
  objc_msgSend_baseToken(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_baseToken(v4, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBaseToken_(v13, v14, (uint64_t)v10);
  }
  else
  {
    objc_msgSend_record(self, v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_baseToken(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_6;
    objc_msgSend_record(self, v19, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_baseToken(v10, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBaseToken_(v4, v23, (uint64_t)v13);
  }

LABEL_6:
  objc_msgSend_routingKey(v4, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_routingKey(v4, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRoutingKey_(v30, v31, (uint64_t)v27);
  }
  else
  {
    objc_msgSend_record(self, v25, v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_routingKey(v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
      goto LABEL_11;
    objc_msgSend_record(self, v36, v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_routingKey(v27, v38, v39);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRoutingKey_(v4, v40, (uint64_t)v30);
  }

LABEL_11:
  objc_msgSend_displayedHostname(v4, v36, v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend_displayedHostname(v4, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(self, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayedHostname_(v47, v48, (uint64_t)v44);
  }
  else
  {
    objc_msgSend_record(self, v42, v43);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_displayedHostname(v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v52)
      goto LABEL_16;
    objc_msgSend_record(self, v53, v54);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_displayedHostname(v44, v55, v56);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayedHostname_(v4, v57, (uint64_t)v47);
  }

LABEL_16:
  objc_msgSend_record(self, v53, v54);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mutableEncryptedPSK(v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend_record(self, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mutableEncryptedPSK(v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      v71 = objc_alloc(MEMORY[0x1E0C94D18]);
      objc_msgSend_record(self, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mutableEncryptedPSK(v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend_initWithData_(v71, v81, (uint64_t)v80);
      objc_msgSend_setMutableEncryptedPSK_(v4, v83, (uint64_t)v82);
LABEL_21:

    }
  }
  else
  {
    objc_msgSend_mutableEncryptedPSK(v4, v62, v63);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (v87)
    {
      v88 = objc_alloc(MEMORY[0x1E0C94D18]);
      objc_msgSend_mutableEncryptedPSK(v4, v89, v90);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v74, v91, v92);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (void *)objc_msgSend_initWithData_(v88, v93, (uint64_t)v77);
      objc_msgSend_record(self, v94, v95);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setMutableEncryptedPSK_(v82, v96, (uint64_t)v80);
      goto LABEL_21;
    }
  }
  serverRecord = self->_serverRecord;
  self->_serverRecord = v4;

}

- (void)_clearRecordProtectionDataForRecord
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  id v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  char isKindOfClass;
  const char *v83;
  uint64_t v84;
  id v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  const char *v100;
  const char *v101;
  void *v102;
  char v103;
  id v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t k;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  id v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t m;
  uint64_t v129;
  void *v130;
  const char *v131;
  void *v132;
  const char *v133;
  id v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  char v138;
  id v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t n;
  NSObject *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  void *v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  uint8_t v178[128];
  uint8_t buf[4];
  void *v180;
  uint64_t v181;

  v181 = *MEMORY[0x1E0C80C00];
  objc_msgSend_record(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(self, v5, v6);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v146 = v7;
    objc_msgSend_recordID(v4, v147, v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v180 = v149;
    _os_log_debug_impl(&dword_1BE990000, v146, OS_LOG_TYPE_DEBUG, "Clearing protection data for record %@", buf, 0xCu);

  }
  objc_msgSend_recordID(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedRecordID_(v151, v11, 0, v10);

  objc_msgSend_recordID(v4, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedZoneID_(v151, v18, 0, v17);

  objc_msgSend_share(v4, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedShareID_(v151, v25, 0, v24);

  v26 = objc_alloc(MEMORY[0x1E0C95070]);
  v27 = *MEMORY[0x1E0C949F0];
  objc_msgSend_recordID(v4, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_initWithRecordName_zoneID_(v26, v34, v27, v33);

  v150 = (void *)v35;
  objc_msgSend_setPCSData_forFetchedShareID_(v151, v36, 0, v35);
  objc_msgSend_setProtectionData_(v4, v37, 0);
  objc_msgSend_setProtectionEtag_(v4, v38, 0);
  objc_msgSend_setPreviousProtectionEtag_(v4, v39, 0);
  objc_msgSend_setZoneProtectionEtag_(v4, v40, 0);
  objc_msgSend_setShareEtag_(v4, v41, 0);
  objc_msgSend_setRecordPCSData_(self, v42, 0);
  objc_msgSend_setRecordPCS_(v4, v43, 0);
  objc_msgSend_setChainParentPublicKeyID_(v4, v44, 0);
  objc_msgSend_setChainPrivateKey_(v4, v45, 0);
  objc_msgSend_setChainProtectionInfo_(v4, v46, 0);
  v49 = objc_msgSend_savePolicy(v151, v47, v48);
  objc_msgSend_valueStore(v4, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v52;
  if (v49 == 2)
    objc_msgSend_allKeys(v52, v53, v54);
  else
    objc_msgSend_changedKeys(v52, v53, v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v57 = v56;
  v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v170, v178, 16);
  v153 = v4;
  if (v59)
  {
    v62 = v59;
    v63 = *(_QWORD *)v171;
    v152 = v57;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v171 != v63)
          objc_enumerationMutation(v57);
        v65 = *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * i);
        objc_msgSend_valueStore(v4, v60, v61);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rawValueForKey_(v66, v67, v65);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v69 = v68;
          objc_msgSend_setAssetKey_(v69, v70, 0);
          objc_msgSend_setWrappedAssetKey_(v69, v71, 0);
          objc_msgSend_setClearAssetKey_(v69, v72, 0);
          objc_msgSend_setReferenceSignature_(v69, v73, 0);
          objc_msgSend_setUploadReceipt_(v69, v74, 0);
          objc_msgSend_setUploadReceiptExpiration_(v69, v75, v76, 0.0);
          objc_msgSend_setUploaded_(v69, v77, 0);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_setEncryptedData_(v68, v78, 0);
            goto LABEL_39;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v69 = v68;
            objc_msgSend_firstObject(v69, v79, v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v168 = 0u;
              v169 = 0u;
              v166 = 0u;
              v167 = 0u;
              v85 = v69;
              v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v166, v177, 16);
              if (v87)
              {
                v89 = v87;
                v90 = *(_QWORD *)v167;
                do
                {
                  for (j = 0; j != v89; ++j)
                  {
                    if (*(_QWORD *)v167 != v90)
                      objc_enumerationMutation(v85);
                    v92 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * j);
                    objc_msgSend_setAssetKey_(v92, v88, 0);
                    objc_msgSend_setWrappedAssetKey_(v92, v93, 0);
                    objc_msgSend_setClearAssetKey_(v92, v94, 0);
                    objc_msgSend_setReferenceSignature_(v92, v95, 0);
                    objc_msgSend_setUploadReceipt_(v92, v96, 0);
                    objc_msgSend_setUploadReceiptExpiration_(v92, v97, v98, 0.0);
                    objc_msgSend_setUploaded_(v92, v99, 0);
                  }
                  v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v88, (uint64_t)&v166, v177, 16);
                }
                while (v89);
              }
LABEL_37:

              v57 = v152;
              v4 = v153;
              goto LABEL_38;
            }
            objc_msgSend_firstObject(v69, v83, v84);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v103 = objc_opt_isKindOfClass();

            if ((v103 & 1) != 0)
            {
              v164 = 0u;
              v165 = 0u;
              v162 = 0u;
              v163 = 0u;
              v104 = v69;
              v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v162, v176, 16);
              if (v106)
              {
                v108 = v106;
                v109 = *(_QWORD *)v163;
                do
                {
                  for (k = 0; k != v108; ++k)
                  {
                    if (*(_QWORD *)v163 != v109)
                      objc_enumerationMutation(v104);
                    objc_msgSend_setEncryptedData_(*(void **)(*((_QWORD *)&v162 + 1) + 8 * k), v107, 0);
                  }
                  v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v107, (uint64_t)&v162, v176, 16);
                }
                while (v108);
              }
              goto LABEL_37;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_39;
            v69 = v68;
            objc_msgSend_setRecordPCS_(v69, v100, 0);
            objc_msgSend_setAssets_(v69, v101, 0);
          }
        }
LABEL_38:

LABEL_39:
      }
      v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v170, v178, 16);
    }
    while (v62);
  }

  v113 = objc_msgSend_savePolicy(v151, v111, v112);
  objc_msgSend_encryptedValueStore(v4, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v116;
  if (v113 == 2)
    objc_msgSend_allKeys(v116, v117, v118);
  else
    objc_msgSend_changedKeys(v116, v117, v118);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v121 = v120;
  v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v122, (uint64_t)&v158, v175, 16);
  if (v123)
  {
    v126 = v123;
    v127 = *(_QWORD *)v159;
    do
    {
      for (m = 0; m != v126; ++m)
      {
        if (*(_QWORD *)v159 != v127)
          objc_enumerationMutation(v121);
        v129 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * m);
        objc_msgSend_encryptedValueStore(v4, v124, v125);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rawValueForKey_(v130, v131, v129);
        v132 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_setEncryptedData_(v132, v133, 0);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v134 = v132;
            objc_msgSend_firstObject(v134, v135, v136);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v138 = objc_opt_isKindOfClass();

            if ((v138 & 1) != 0)
            {
              v156 = 0u;
              v157 = 0u;
              v154 = 0u;
              v155 = 0u;
              v139 = v134;
              v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v140, (uint64_t)&v154, v174, 16);
              if (v141)
              {
                v143 = v141;
                v144 = *(_QWORD *)v155;
                do
                {
                  for (n = 0; n != v143; ++n)
                  {
                    if (*(_QWORD *)v155 != v144)
                      objc_enumerationMutation(v139);
                    objc_msgSend_setEncryptedData_(*(void **)(*((_QWORD *)&v154 + 1) + 8 * n), v142, 0);
                  }
                  v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v142, (uint64_t)&v154, v174, 16);
                }
                while (v143);
              }

              v4 = v153;
            }

          }
        }

      }
      v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v124, (uint64_t)&v158, v175, 16);
    }
    while (v126);
  }

}

- (CKDModifyRecordsOperation)operation
{
  return (CKDModifyRecordsOperation *)objc_loadWeakRetained((id *)&self->_operation);
}

- (void)setOperation:(id)a3
{
  objc_storeWeak((id *)&self->_operation, a3);
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (OS_dispatch_group)pcsGroup
{
  return self->_pcsGroup;
}

- (void)setPcsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_pcsGroup, a3);
}

- (CKDRecordPCSData)recordPCSData
{
  return self->_recordPCSData;
}

- (void)setRecordPCSData:(id)a3
{
  objc_storeStrong((id *)&self->_recordPCSData, a3);
}

- (CKDSharePCSData)sharePCSData
{
  return self->_sharePCSData;
}

- (void)setSharePCSData:(id)a3
{
  objc_storeStrong((id *)&self->_sharePCSData, a3);
}

- (CKRecord)serverRecord
{
  return self->_serverRecord;
}

- (BOOL)isDelete
{
  return self->_isDelete;
}

- (void)setIsDelete:(BOOL)a3
{
  self->_isDelete = a3;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableDictionary)rereferencedAssetArrayByFieldname
{
  return self->_rereferencedAssetArrayByFieldname;
}

- (void)setRereferencedAssetArrayByFieldname:(id)a3
{
  objc_storeStrong((id *)&self->_rereferencedAssetArrayByFieldname, a3);
}

- (CKDProgressTracker)progressTracker
{
  return self->_progressTracker;
}

- (void)setProgressTracker:(id)a3
{
  objc_storeStrong((id *)&self->_progressTracker, a3);
}

- (int64_t)batchRank
{
  return self->_batchRank;
}

- (void)setBatchRank:(int64_t)a3
{
  self->_batchRank = a3;
}

- (int)saveAttempts
{
  return self->_saveAttempts;
}

- (void)setSaveAttempts:(int)a3
{
  self->_saveAttempts = a3;
}

- (BOOL)saveCompletionBlockCalled
{
  return self->_saveCompletionBlockCalled;
}

- (void)setSaveCompletionBlockCalled:(BOOL)a3
{
  self->_saveCompletionBlockCalled = a3;
}

- (BOOL)needsRefetch
{
  return self->_needsRefetch;
}

- (void)setNeedsRefetch:(BOOL)a3
{
  self->_needsRefetch = a3;
}

- (CKDZonePCSData)sharedZonePCSData
{
  return self->_sharedZonePCSData;
}

- (void)setSharedZonePCSData:(id)a3
{
  objc_storeStrong((id *)&self->_sharedZonePCSData, a3);
}

- (BOOL)didAttemptZoneWideShareKeyRoll
{
  return self->_didAttemptZoneWideShareKeyRoll;
}

- (void)setDidAttemptZoneWideShareKeyRoll:(BOOL)a3
{
  self->_didAttemptZoneWideShareKeyRoll = a3;
}

- (NSDictionary)assetUUIDToExpectedProperties
{
  return self->_assetUUIDToExpectedProperties;
}

- (void)setAssetUUIDToExpectedProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)didRollRecordPCSMasterKey
{
  return self->_didRollRecordPCSMasterKey;
}

- (void)setDidRollRecordPCSMasterKey:(BOOL)a3
{
  self->_didRollRecordPCSMasterKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_sharedZonePCSData, 0);
  objc_storeStrong((id *)&self->_progressTracker, 0);
  objc_storeStrong((id *)&self->_rereferencedAssetArrayByFieldname, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_serverRecord, 0);
  objc_storeStrong((id *)&self->_sharePCSData, 0);
  objc_storeStrong((id *)&self->_recordPCSData, 0);
  objc_storeStrong((id *)&self->_pcsGroup, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_destroyWeak((id *)&self->_operation);
}

@end
