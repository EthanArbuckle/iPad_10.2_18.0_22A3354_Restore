@implementation CKDMarkAssetBrokenOperation

- (CKDMarkAssetBrokenOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDMarkAssetBrokenOperation *v9;
  uint64_t v10;
  CKRecordID *recordID;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *field;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  CKUploadRequestConfiguration *uploadRequestConfiguration;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKDMarkAssetBrokenOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v31, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordID(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    recordID = v9->_recordID;
    v9->_recordID = (CKRecordID *)v10;

    objc_msgSend_field(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    field = v9->_field;
    v9->_field = (NSString *)v14;

    v9->_listIndex = objc_msgSend_listIndex(v6, v16, v17);
    v9->_touchRepairZone = objc_msgSend_touchRepairZone(v6, v18, v19);
    v9->_bypassPCSEncryptionForTouchRepairZone = objc_msgSend_bypassPCSEncryptionForTouchRepairZone(v6, v20, v21);
    v9->_simulateCorruptAsset = objc_msgSend_simulateCorruptAsset(v6, v22, v23);
    v9->_writeRepairRecord = objc_msgSend_writeRepairRecord(v6, v24, v25);
    objc_msgSend_uploadRequestConfiguration(v6, v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    uploadRequestConfiguration = v9->_uploadRequestConfiguration;
    v9->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v28;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/break-assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  int v51;
  void *v52;
  __int16 v53;
  CKDMarkAssetBrokenOperation *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_recordID(self, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        if (!objc_msgSend_touchRepairZone(self, v7, v8))
          goto LABEL_24;
        goto LABEL_21;
      }
      objc_msgSend_setState_(self, v7, 2);
      objc_msgSend__fetchRecord(self, v9, v10);
      return 1;
    case 2:
      if (!objc_msgSend_touchRepairZone(self, v4, v5))
        goto LABEL_9;
LABEL_21:
      objc_msgSend_setState_(self, v11, 3);
      objc_msgSend__touchFetchRepairZone(self, v42, v43);
      return 1;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend_repairZone(self, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        objc_msgSend_makeStateTransition(self, v16, v17);
      else
        objc_msgSend__touchCreateRepairZone(self, v16, v17);
      return 1;
    case 4:
      objc_msgSend_recordID(self, v4, v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_24;
LABEL_9:
      if (!objc_msgSend_simulateCorruptAsset(self, v11, v12))
        goto LABEL_11;
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend__breakAsset(self, v19, v20);
      return 1;
    case 5:
LABEL_11:
      objc_msgSend_setState_(self, v4, 6);
      goto LABEL_12;
    case 6:
      objc_msgSend_markAssetBrokenError(self, v4, v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_24;
      if ((unint64_t)objc_msgSend_numMarkAssetBrokenFailures(self, v11, v24) > 2)
      {
        objc_msgSend_markAssetBrokenError(self, v25, v26);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(self, v45, (uint64_t)v44);

LABEL_24:
        objc_msgSend_setState_(self, v11, 0xFFFFFFFFLL);
        objc_msgSend_error(self, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_finishWithError_(self, v49, (uint64_t)v48);

      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v27 = (void *)*MEMORY[0x1E0C952B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_INFO))
        {
          v30 = v27;
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ckShortDescription(self, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_markAssetBrokenError(self, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 138544130;
          v52 = v32;
          v53 = 2048;
          v54 = self;
          v55 = 2114;
          v56 = v35;
          v57 = 2112;
          v58 = v38;
          _os_log_impl(&dword_1BE990000, v30, OS_LOG_TYPE_INFO, "Retrying markAssetsBroken on <%{public}@: %p; %{public}@> after error %@",
            (uint8_t *)&v51,
            0x2Au);

        }
        v39 = objc_msgSend_numMarkAssetBrokenFailures(self, v28, v29);
        objc_msgSend_setNumMarkAssetBrokenFailures_(self, v40, v39 + 1);
        objc_msgSend_setMarkAssetBrokenError_(self, v41, 0);
        sleep(0xAu);
LABEL_12:
        objc_msgSend__markAssetBroken(self, v21, v22);
      }
      return 1;
    default:
      return 1;
  }
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 5)
    return off_1E7836A58[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDMarkAssetBrokenOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_fetchRecord
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  _QWORD v19[5];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend_recordID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDs_(v3, v9, (uint64_t)v8);

  v12 = objc_msgSend_simulateCorruptAsset(self, v10, v11);
  objc_msgSend_setShouldFetchAssetContent_(v3, v13, v12);
  objc_msgSend_stateTransitionGroup(self, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v16);

  v17 = objc_opt_class();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEBCEE4C;
  v19[3] = &unk_1E782E508;
  v19[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v18, v17, v3, v19);

}

- (void)_touchFetchRepairZone
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  _QWORD v31[5];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_uploadRequestConfiguration(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairZoneID(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, CFSTR("CKDMarkAssetBrokenOperation.m"), 261, CFSTR("Upload request configuration passed to cloudd should have resolved fields"));

  }
  v11 = (void *)objc_opt_new();
  objc_msgSend_uploadRequestConfiguration(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairZoneID(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(v11, v20, (uint64_t)v19);

  objc_msgSend_stateTransitionGroup(self, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v23);

  v24 = objc_opt_class();
  objc_msgSend_repairContainer(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1BEBCF5BC;
  v31[3] = &unk_1E782E508;
  v31[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v28, v24, v11, 0, v27, v31);

}

- (void)_touchCreateRepairZone
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  _QWORD v34[5];
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_uploadRequestConfiguration(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairZoneID(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, self, CFSTR("CKDMarkAssetBrokenOperation.m"), 314, CFSTR("Upload request configuration passed to cloudd should have resolved fields"));

  }
  v11 = objc_alloc(MEMORY[0x1E0C95088]);
  objc_msgSend_uploadRequestConfiguration(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairZoneID(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithZoneID_(v11, v18, (uint64_t)v17);

  v20 = (void *)objc_opt_new();
  v35[0] = v19;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v35, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZonesToSave_(v20, v23, (uint64_t)v22);

  objc_msgSend_stateTransitionGroup(self, v24, v25);
  v26 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v26);

  v27 = objc_opt_class();
  objc_msgSend_repairContainer(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1BEBCFD74;
  v34[3] = &unk_1E782E508;
  v34[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v31, v27, v20, 0, v30, v34);

}

- (void)_breakAsset
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  const char *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  NSObject *v85;
  uint64_t v86;
  const char *v87;
  id v88;
  void *v89;
  void *v90;
  _QWORD v91[5];
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  _QWORD v97[2];

  v97[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_checkPreconditions(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_setError_(self, v4, (uint64_t)v6);
  }
  else
  {
    objc_msgSend_assetOrPackageForFetchedRecord(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = objc_alloc(MEMORY[0x1E0C95048]);
    v10 = objc_alloc(MEMORY[0x1E0C95070]);
    v12 = (void *)objc_msgSend_initWithRecordName_(v10, v11, (uint64_t)CFSTR("FakeName"));
    v14 = (void *)objc_msgSend_initWithRecordType_recordID_(v9, v13, (uint64_t)CFSTR("FakeRecordType"), v12);

    v15 = (void *)objc_opt_new();
    objc_msgSend_setShouldOnlySaveAssetContent_(v15, v16, 1);
    v97[0] = v14;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)v97, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordsToSave_(v15, v19, (uint64_t)v18);

    objc_msgSend_setOriginatingFromDaemon_(v15, v20, 1);
    v90 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = (void *)MEMORY[0x1E0CB3A28];
      v23 = v7;
      objc_msgSend_UUID(v22, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v29, v30, (uint64_t)CFSTR("-"), &stru_1E7838F48);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v21, v32, (uint64_t)CFSTR("A%@"), v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setUUID_(v23, v34, (uint64_t)v33);
      objc_msgSend_setRecordID_(v23, v35, 0);
      v36 = objc_alloc(MEMORY[0x1E0C94BE8]);
      objc_msgSend_signature(v23, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_referenceSignature(v23, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend_initWithFileSignature_referenceSignature_assetKey_(v36, v43, (uint64_t)v39, v42, 0);

      v95 = v33;
      v96 = v44;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v45, (uint64_t)&v96, &v95, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssetUUIDToExpectedProperties_(v15, v47, (uint64_t)v46);

      objc_msgSend_setObject_forKeyedSubscript_(v14, v48, (uint64_t)v23, v33);
    }
    else
    {
      v49 = v7;
      objc_msgSend_container(self, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_directoryContext(v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_packageStagingDirectory(v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v58, v59, v60);
      v89 = v14;
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = 0;
      objc_msgSend_clonedPackageInDaemonWithBasePath_filesDuplicatedIntoDirectory_error_(v49, v62, (uint64_t)v61, 0, &v92);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v92;

      v63 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v69, v70, (uint64_t)CFSTR("-"), &stru_1E7838F48);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v63, v72, (uint64_t)CFSTR("A%@"), v71);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setUUID_(v33, v73, (uint64_t)v23);
      objc_msgSend_assets(v49, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_CKMap_(v76, v77, (uint64_t)&unk_1E78369E8);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      v93 = v23;
      v94 = v78;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v79, (uint64_t)&v94, &v93, 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPackageUUIDToExpectedProperties_(v15, v81, (uint64_t)v80);

      v44 = v88;
      objc_msgSend_setObject_forKeyedSubscript_(v89, v82, (uint64_t)v33, v23);

      v14 = v89;
    }

    objc_msgSend_stateTransitionGroup(self, v83, v84);
    v85 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v85);

    v86 = objc_opt_class();
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = sub_1BEBD0828;
    v91[3] = &unk_1E782E508;
    v91[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v87, v86, v15, v91);

  }
}

- (int)operationType
{
  return 901;
}

- (void)_markAssetBroken
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
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  objc_class *v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
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
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  void *v56;
  objc_class *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  id v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  void *v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
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
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  NSObject *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  id v135;
  const char *v136;
  void *v137;
  NSObject *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  id v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  _QWORD v164[4];
  id v165;
  CKDMarkAssetBrokenOperation *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  uint8_t buf[4];
  void *v172;
  __int16 v173;
  uint64_t v174;
  __int16 v175;
  void *v176;
  _BYTE v177[128];
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  objc_msgSend_checkPreconditions(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_setError_(self, v4, (uint64_t)v6);
    goto LABEL_28;
  }
  objc_msgSend_record(self, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_field(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_listIndex(self, v13, v14) < 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = (objc_class *)MEMORY[0x1E0C94BF8];
      v58 = v12;
      v153 = [v57 alloc];
      objc_msgSend_record(self, v59, v60);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v159, v61, v62);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_record(self, v63, v64);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v156, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_record(self, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordType(v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_field(self, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signature(v58, v77, v78);
      v162 = v12;
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_referenceSignature(v58, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = objc_msgSend_listIndex(self, v83, v84);
      v56 = (void *)objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_listIndex_(v153, v86, (uint64_t)v150, 2, v67, v73, v76, v79, v82, v85);

      v12 = v162;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v163 = v12;
      v87 = v12;
      v88 = (void *)objc_opt_new();
      v89 = (void *)objc_opt_new();
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      v170 = 0u;
      v160 = v87;
      objc_msgSend_assets(v87, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v167, v177, 16);
      if (v94)
      {
        v97 = v94;
        v98 = *(_QWORD *)v168;
        do
        {
          for (i = 0; i != v97; ++i)
          {
            if (*(_QWORD *)v168 != v98)
              objc_enumerationMutation(v92);
            v100 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * i);
            objc_msgSend_signature(v100, v95, v96);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v88, v102, (uint64_t)v101);

            objc_msgSend_referenceSignature(v100, v103, v104);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v89, v106, (uint64_t)v105);

          }
          v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v95, (uint64_t)&v167, v177, 16);
        }
        while (v97);
      }

      v154 = objc_alloc(MEMORY[0x1E0C94FE0]);
      objc_msgSend_record(self, v107, v108);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v157, v109, v110);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_record(self, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v113, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_record(self, v117, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordType(v119, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_field(self, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignatures_referenceSignatures_(v154, v126, (uint64_t)v151, 2, v116, v122, v125, v88, v89);

      v12 = v163;
LABEL_22:

      if (v56)
      {
        objc_msgSend_stateTransitionGroup(self, v127, v128);
        v129 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v129);

        v130 = objc_opt_class();
        v131 = (void *)objc_opt_new();
        objc_msgSend_repairContainer(self, v132, v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v164[0] = MEMORY[0x1E0C809B0];
        v164[1] = 3221225472;
        v164[2] = sub_1BEBD14F0;
        v164[3] = &unk_1E782E558;
        v165 = v56;
        v166 = self;
        v135 = v56;
        objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v136, v130, v131, 0, v134, v164);

        goto LABEL_28;
      }
      goto LABEL_24;
    }
  }
  else
  {
    v17 = objc_msgSend_count(v12, v15, v16);
    if (objc_msgSend_listIndex(self, v18, v19) < v17)
    {
      v22 = objc_msgSend_listIndex(self, v20, v21);
      objc_msgSend_objectAtIndex_(v12, v23, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v161 = v12;
        v25 = (objc_class *)MEMORY[0x1E0C94BF8];
        v26 = v24;
        v27 = [v25 alloc];
        objc_msgSend_record(self, v28, v29);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v158, v30, v31);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_record(self, v32, v33);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v155, v34, v35);
        v36 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_record(self, v37, v38);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordType(v152, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_field(self, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_signature(v26, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_referenceSignature(v26, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v148 = objc_msgSend_listIndex(self, v51, v52);
        v53 = v27;
        v54 = (void *)v36;
        v56 = (void *)objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_listIndex_(v53, v55, (uint64_t)v149, 2, v36, v41, v44, v47, v50, v148);

        v12 = v161;
      }
      else
      {
        v56 = 0;
      }

      goto LABEL_22;
    }
  }

LABEL_24:
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v137 = (void *)*MEMORY[0x1E0C952B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_ERROR))
  {
    v138 = v137;
    objc_msgSend_field(self, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend_listIndex(self, v142, v143);
    objc_msgSend_record(self, v145, v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v172 = v141;
    v173 = 2048;
    v174 = v144;
    v175 = 2112;
    v176 = v147;
    _os_log_error_impl(&dword_1BE990000, v138, OS_LOG_TYPE_ERROR, "Could not find asset or package in field %{public}@ and index %ld of record %@", buf, 0x20u);

  }
LABEL_28:

}

- (id)repairContainer
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  CKDApplicationID *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  CKDAppContainerTuple *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
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
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;

  objc_msgSend_uploadRequestConfiguration(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_3;
  }
  v11 = (void *)v8;
  objc_msgSend_uploadRequestConfiguration(self, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverride(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_3:
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("CKDMarkAssetBrokenOperation.m"), 603, CFSTR("Upload request configuration passed to cloudd should have resolved fields"));

  }
  objc_msgSend_uploadRequestConfiguration(self, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v20, v21, v22);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_container(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc(MEMORY[0x1E0C94C40]);
  objc_msgSend_containerID(v25, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_environment(v29, v30, v31);
  v80 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v26, v33, (uint64_t)v81, v32);

  objc_msgSend_uploadRequestConfiguration(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverride(v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = [CKDApplicationID alloc];
  objc_msgSend_applicationBundleID(v25, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)objc_msgSend_initWithApplicationBundleIdentifier_applicationBundleIdentifierOverrideForContainerAccess_applicationBundleIdentifierOverrideForNetworkAttribution_applicationBundleIdentifierOverrideForPushTopicGeneration_applicationBundleIdentifierOverrideForTCC_(v40, v44, (uint64_t)v43, v39, v39, v39, v39);

  v45 = [CKDAppContainerTuple alloc];
  v78 = v25;
  objc_msgSend_personaID(v25, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend_initWithApplicationID_containerID_personaID_(v45, v49, (uint64_t)v79, v80, v48);

  objc_msgSend_processScopedClientProxy(v25, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logicalDeviceScopedClientProxy(v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInternalUseContainers(CKDContainer, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v74, (uint64_t)v76, v52, v58, v64, v70, v73);
  v77 = (id)objc_claimAutoreleasedReturnValue();

  return v77;
}

- (id)assetOrPackageForFetchedRecord
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  char isKindOfClass;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  id v23;

  objc_msgSend_record(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_field(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = v9;
      goto LABEL_10;
    }
LABEL_9:
    v23 = 0;
    goto LABEL_10;
  }
  v10 = v9;
  if (objc_msgSend_listIndex(self, v11, v12) == -1
    || (v15 = objc_msgSend_listIndex(self, v13, v14),
        objc_msgSend_objectAtIndexedSubscript_(v10, v16, v15),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v17,
        (isKindOfClass & 1) == 0))
  {

    goto LABEL_9;
  }
  v21 = objc_msgSend_listIndex(self, v19, v20);
  objc_msgSend_objectAtIndexedSubscript_(v10, v22, v21);
  v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v23;
}

- (id)checkPreconditions
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;

  objc_msgSend_record(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_assetOrPackageForFetchedRecord(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v7, *MEMORY[0x1E0C94B20], 3011, CFSTR("Could not find referenced asset"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v5, *MEMORY[0x1E0C94B20], 1000, CFSTR("Attempting to break asset with missing base record"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (void)main
{
  objc_msgSend_makeStateTransition_(self, a2, 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  objc_super v12;

  v4 = a3;
  objc_msgSend_setAssetOrPackageMarkedBrokenBlock_(self, v5, 0);
  objc_msgSend_record(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removePackages(v8, v9, v10);

  objc_msgSend_setRecord_(self, v11, 0);
  v12.receiver = self;
  v12.super_class = (Class)CKDMarkAssetBrokenOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v12, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)assetOrPackageMarkedBrokenBlock
{
  return self->_assetOrPackageMarkedBrokenBlock;
}

- (void)setAssetOrPackageMarkedBrokenBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, a3);
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

- (CKDFetchRecordsOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchOperation, a3);
}

- (CKDFetchRecordZonesOperation)zoneFetchOperation
{
  return self->_zoneFetchOperation;
}

- (void)setZoneFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_zoneFetchOperation, a3);
}

- (CKDModifyRecordZonesOperation)zoneCreateOperation
{
  return self->_zoneCreateOperation;
}

- (void)setZoneCreateOperation:(id)a3
{
  objc_storeStrong((id *)&self->_zoneCreateOperation, a3);
}

- (CKDModifyRecordsOperation)corruptOperation
{
  return self->_corruptOperation;
}

- (void)setCorruptOperation:(id)a3
{
  objc_storeStrong((id *)&self->_corruptOperation, a3);
}

- (CKDMarkAssetBrokenURLRequestWrapperOperation)wrapperOperation
{
  return self->_wrapperOperation;
}

- (void)setWrapperOperation:(id)a3
{
  objc_storeStrong((id *)&self->_wrapperOperation, a3);
}

- (CKRecordZone)repairZone
{
  return self->_repairZone;
}

- (void)setRepairZone:(id)a3
{
  objc_storeStrong((id *)&self->_repairZone, a3);
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (unint64_t)numMarkAssetBrokenFailures
{
  return self->_numMarkAssetBrokenFailures;
}

- (void)setNumMarkAssetBrokenFailures:(unint64_t)a3
{
  self->_numMarkAssetBrokenFailures = a3;
}

- (NSError)markAssetBrokenError
{
  return self->_markAssetBrokenError;
}

- (void)setMarkAssetBrokenError:(id)a3
{
  objc_storeStrong((id *)&self->_markAssetBrokenError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markAssetBrokenError, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_repairZone, 0);
  objc_storeStrong((id *)&self->_wrapperOperation, 0);
  objc_storeStrong((id *)&self->_corruptOperation, 0);
  objc_storeStrong((id *)&self->_zoneCreateOperation, 0);
  objc_storeStrong((id *)&self->_zoneFetchOperation, 0);
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
  objc_storeStrong(&self->_assetOrPackageMarkedBrokenBlock, 0);
}

@end
