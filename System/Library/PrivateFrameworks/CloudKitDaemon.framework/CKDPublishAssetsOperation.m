@implementation CKDPublishAssetsOperation

- (CKDPublishAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDPublishAssetsOperation *v9;
  uint64_t v10;
  NSArray *recordIDs;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *fileNamesByAssetFieldNames;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *fetchedRecordsByID;
  objc_super v25;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKDPublishAssetsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v25, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordIDs(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    recordIDs = v9->_recordIDs;
    v9->_recordIDs = (NSArray *)v10;

    objc_msgSend_fileNamesByAssetFieldNames(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    fileNamesByAssetFieldNames = v9->_fileNamesByAssetFieldNames;
    v9->_fileNamesByAssetFieldNames = (NSDictionary *)v14;

    v18 = objc_msgSend_requestedTTL(v6, v16, v17);
    v21 = 3600;
    if (v18)
      v21 = v18;
    v9->_requestedTTL = v21;
    v9->_URLOptions = objc_msgSend_URLOptions(v6, v19, v20);
    v22 = objc_opt_new();
    fetchedRecordsByID = v9->_fetchedRecordsByID;
    v9->_fetchedRecordsByID = (NSMutableDictionary *)v22;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/publish-assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__checkEntitlements(self, v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend_finishWithError_(self, v7, (uint64_t)v8);
        objc_msgSend_setState_(self, v9, 0xFFFFFFFFLL);
      }
      goto LABEL_7;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__fetchRecords(self, v10, v11);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__fetchPCSForRecords(self, v12, v13);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v14, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v16, (uint64_t)v8);
LABEL_7:

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
    return off_1E7832F58[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDPublishAssetsOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_checkEntitlements
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  char hasAllowOnDeviceAssetStreamingEntitlement;
  const char *v13;
  void *v14;

  if ((objc_msgSend_URLOptions(self, a2, v2) & 2) != 0
    && (objc_msgSend_container(self, v4, v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_entitlements(v6, v7, v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        hasAllowOnDeviceAssetStreamingEntitlement = objc_msgSend_hasAllowOnDeviceAssetStreamingEntitlement(v9, v10, v11),
        v9,
        v6,
        (hasAllowOnDeviceAssetStreamingEntitlement & 1) == 0))
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0C947D8], 8, &unk_1E78AF848);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)_dispatchAssetURLsForRecord:(id)a3 pcs:(_OpaquePCSShareProtection *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  char hasAlwaysAllowPublishAssetsEntitlement;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  char v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  id v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
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
  uint64_t v82;
  void *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  void *v90;
  uint64_t v91;
  id obj;
  _QWORD block[5];
  id v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t v103[128];
  uint8_t buf[4];
  id v105;
  __int16 v106;
  void *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_recordID(v6, v7, v8);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v90)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v84, v85, (uint64_t)a2, self, CFSTR("CKDPublishAssetsOperation.m"), 120, CFSTR("Expected non nil recordID"));

  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v90;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Getting asset urls for record %@", buf, 0xCu);
  }
  objc_msgSend_container(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  hasAlwaysAllowPublishAssetsEntitlement = objc_msgSend_hasAlwaysAllowPublishAssetsEntitlement(v17, v18, v19);

  if ((hasAlwaysAllowPublishAssetsEntitlement & 1) == 0)
  {
    if (!*MEMORY[0x1E0C95280])
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v33 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
      {
        v68 = v33;
        objc_msgSend_container(self, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_containerID(v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_containerIdentifier(v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_container(self, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_processName(v80, v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v105 = v77;
        v106 = 2112;
        v107 = v83;
        _os_log_fault_impl(&dword_1BE990000, v68, OS_LOG_TYPE_FAULT, "Unidentified use of CKPublishAssetsOperation which will break under Walrus in container %@ by client %@. Please file a radar and reach out to cloudkit-client@group.apple.com for next steps.", buf, 0x16u);

      }
    }
    goto LABEL_19;
  }
  objc_msgSend_container(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_specialContainerType(v26, v27, v28) == 4)
  {
    v31 = objc_msgSend_URLOptions(self, v29, v30);

    if ((v31 & 1) != 0)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v32 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v105 = v90;
        _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Asset URL for iCloud Drive record %@ requested for private streaming. This request will fail if walrus is enabled.", buf, 0xCu);
      }
LABEL_19:
      v88 = 0;
      goto LABEL_22;
    }
  }
  else
  {

  }
  v88 = 1;
LABEL_22:
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  objc_msgSend_allKeys(v6, v21, v22);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v99, v103, 16);
  if (v35)
  {
    v37 = v35;
    v38 = *(_QWORD *)v100;
    v87 = *(_QWORD *)v100;
    do
    {
      v39 = 0;
      v91 = v37;
      do
      {
        if (*(_QWORD *)v100 != v38)
          objc_enumerationMutation(obj);
        v40 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v39);
        objc_msgSend_objectForKey_(v6, v36, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v42 = v41;
          objc_msgSend_fileNamesByAssetFieldNames(self, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v45, v46, v40);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v48 = v6;
            v49 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v105 = v42;
              _os_log_debug_impl(&dword_1BE990000, v49, OS_LOG_TYPE_DEBUG, "Creating asset url for asset %@", buf, 0xCu);
            }
            objc_msgSend_container(self, v50, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_pcsManager(v52, v53, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend_useEncryption(self, v56, v57);
            v61 = objc_msgSend_useClearAssetEncryption(self, v59, v60);
            v98 = 0;
            LOBYTE(v86) = v88;
            objc_msgSend_fillInDownloadURLsForAssetWithFieldName_fileName_recordPCS_pcsManager_useEncryption_useClearAssetEncryption_alwaysAllowKeyExport_outError_(v42, v62, v40, v47, a4, v55, v58, v61, v86, &v98);
            v63 = v98;

            objc_msgSend_callbackQueue(self, v64, v65);
            v66 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = sub_1BEAD2B44;
            block[3] = &unk_1E782E490;
            block[4] = self;
            v94 = v90;
            v95 = v40;
            v96 = v42;
            v97 = v63;
            v67 = v63;
            dispatch_async(v66, block);

            v6 = v48;
            v38 = v87;
          }

          v37 = v91;
        }

        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v99, v103, 16);
    }
    while (v37);
  }

}

- (void)_finishPublishAssetsForRecord:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id obj;
  id v26;
  _QWORD block[5];
  id v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = a3;
  objc_msgSend_allKeys(v26, v4, v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v31, v35, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12);
        objc_msgSend_fileNamesByAssetFieldNames(self, v8, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v14, v15, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend_objectForKey_(v26, v17, v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = v18;
            objc_msgSend_setExposeAssetKey_(v19, v20, 1);
            objc_msgSend_callbackQueue(self, v21, v22);
            v23 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = sub_1BEAD2DB4;
            block[3] = &unk_1E782F4A8;
            block[4] = self;
            v28 = v26;
            v29 = v13;
            v30 = v19;
            v24 = v19;
            dispatch_async(v23, block);

          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v31, v35, 16);
    }
    while (v10);
  }

}

- (void)_fetchPCSForRecords
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
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  const char *v29;
  _QWORD v30[6];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend_fetchedRecordsByID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v32, v36, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v7);
        v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend_fetchedRecordsByID(self, v10, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v16, v17, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_stateTransitionGroup(self, v19, v20);
        v21 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v21);

        objc_msgSend_container(self, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsCache(v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = sub_1BEAD301C;
        v30[3] = &unk_1E7832F38;
        v30[4] = v15;
        v30[5] = self;
        v31 = v18;
        v28 = v18;
        objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v27, v29, v15, self, 0, v30);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v32, v36, 16);
    }
    while (v12);
  }

}

- (void)_fetchRecords
{
  uint64_t v2;
  void *v4;
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
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  _QWORD v50[5];

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_fileNamesByAssetFieldNames(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  objc_msgSend_operationInfo(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedConfiguration(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResolvedConfiguration_(v11, v18, (uint64_t)v17);

  objc_msgSend_operationInfo(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_group(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroup_(v11, v25, (uint64_t)v24);

  objc_msgSend_recordIDs(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDs_(v11, v29, (uint64_t)v28);

  objc_msgSend_setShouldFetchAssetContent_(v11, v30, 0);
  objc_msgSend_setShouldRequestEncryptedAssetOwnerIdentifier_(v11, v31, 1);
  objc_msgSend_fileNamesByAssetFieldNames(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(v11, v38, (uint64_t)v37);

  objc_msgSend_setAssetFieldNamesToPublishURLs_(v11, v39, (uint64_t)v10);
  v42 = objc_msgSend_requestedTTL(self, v40, v41);
  objc_msgSend_setRequestedTTL_(v11, v43, v42);
  v46 = objc_msgSend_URLOptions(self, v44, v45);
  objc_msgSend_setURLOptions_(v11, v47, v46);
  v48 = objc_opt_class();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = sub_1BEAD3448;
  v50[3] = &unk_1E782E508;
  v50[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v49, v48, v11, v50);

}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  _BOOL8 v12;
  const char *v13;

  objc_msgSend_recordIDs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {
    objc_msgSend_fileNamesByAssetFieldNames(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_count(v9, v10, v11) == 0;

  }
  else
  {
    v12 = 1;
  }

  objc_msgSend_makeStateTransition_(self, v13, v12);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setAssetPublishedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDPublishAssetsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)cancel
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDPublishAssetsOperation;
  -[CKDOperation cancel](&v8, sel_cancel);
  objc_msgSend_fetchRecordsOperation(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v5, v6, v7);

}

- (id)assetPublishedBlock
{
  return self->_assetPublishedBlock;
}

- (void)setAssetPublishedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDs, a3);
}

- (NSDictionary)fileNamesByAssetFieldNames
{
  return self->_fileNamesByAssetFieldNames;
}

- (void)setFileNamesByAssetFieldNames:(id)a3
{
  objc_storeStrong((id *)&self->_fileNamesByAssetFieldNames, a3);
}

- (unint64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void)setRequestedTTL:(unint64_t)a3
{
  self->_requestedTTL = a3;
}

- (unint64_t)URLOptions
{
  return self->_URLOptions;
}

- (void)setURLOptions:(unint64_t)a3
{
  self->_URLOptions = a3;
}

- (NSOperation)fetchRecordsOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 496, 1);
}

- (void)setFetchRecordsOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (NSMutableDictionary)fetchedRecordsByID
{
  return self->_fetchedRecordsByID;
}

- (void)setFetchedRecordsByID:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedRecordsByID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedRecordsByID, 0);
  objc_storeStrong((id *)&self->_fetchRecordsOperation, 0);
  objc_storeStrong((id *)&self->_fileNamesByAssetFieldNames, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_assetPublishedBlock, 0);
}

@end
