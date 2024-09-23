@implementation CKDFetchRecordsOperation

- (CKDFetchRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchRecordsOperation *v9;
  uint64_t v10;
  NSArray *recordIDsToFetch;
  uint64_t v12;
  NSMutableDictionary *cachedRecords;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSSet *desiredKeySet;
  uint64_t v24;
  NSDictionary *recordIDsToETags;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSDictionary *recordIDsToVersionETags;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSDictionary *desiredPackageFileIndices;
  dispatch_group_t v34;
  OS_dispatch_group *fetchRecordsGroup;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSMapTable *downloadTasksByRecordID;
  NSMutableDictionary *v40;
  NSMutableDictionary *errorsByRecordID;
  NSMutableDictionary *v42;
  NSMutableDictionary *shareRecordsToUpdateByRecordID;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  NSDictionary *assetTransferOptionsByRecordTypeAndKey;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
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
  uint64_t v63;
  NSSet *assetFieldNamesToPublishURLs;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  NSMutableArray *v69;
  NSMutableArray *recordIDsToRefetch;
  uint64_t v71;
  NSMutableDictionary *keyOrErrorForHostname;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  NSDictionary *webSharingIdentityDataByRecordID;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  objc_super v83;

  v6 = a3;
  v83.receiver = self;
  v83.super_class = (Class)CKDFetchRecordsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v83, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordIDs(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    recordIDsToFetch = v9->_recordIDsToFetch;
    v9->_recordIDsToFetch = (NSArray *)v10;

    v12 = objc_opt_new();
    cachedRecords = v9->_cachedRecords;
    v9->_cachedRecords = (NSMutableDictionary *)v12;

    objc_msgSend_desiredKeys(v6, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v19 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend_desiredKeys(v6, v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v19, v21, (uint64_t)v20);
      v22 = objc_claimAutoreleasedReturnValue();
      desiredKeySet = v9->_desiredKeySet;
      v9->_desiredKeySet = (NSSet *)v22;

    }
    objc_msgSend_recordIDsToETags(v6, v17, v18);
    v24 = objc_claimAutoreleasedReturnValue();
    recordIDsToETags = v9->_recordIDsToETags;
    v9->_recordIDsToETags = (NSDictionary *)v24;

    objc_msgSend_recordIDsToVersionETags(v6, v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    recordIDsToVersionETags = v9->_recordIDsToVersionETags;
    v9->_recordIDsToVersionETags = (NSDictionary *)v28;

    objc_msgSend_desiredPackageFileIndices(v6, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    desiredPackageFileIndices = v9->_desiredPackageFileIndices;
    v9->_desiredPackageFileIndices = (NSDictionary *)v32;

    v34 = dispatch_group_create();
    fetchRecordsGroup = v9->_fetchRecordsGroup;
    v9->_fetchRecordsGroup = (OS_dispatch_group *)v34;

    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    downloadTasksByRecordID = v9->_downloadTasksByRecordID;
    v9->_downloadTasksByRecordID = (NSMapTable *)v38;

    v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    errorsByRecordID = v9->_errorsByRecordID;
    v9->_errorsByRecordID = v40;

    v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    shareRecordsToUpdateByRecordID = v9->_shareRecordsToUpdateByRecordID;
    v9->_shareRecordsToUpdateByRecordID = v42;

    objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v6, v44, v45);
    v46 = objc_claimAutoreleasedReturnValue();
    assetTransferOptionsByRecordTypeAndKey = v9->_assetTransferOptionsByRecordTypeAndKey;
    v9->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v46;

    v9->_shouldFetchAssetContent = objc_msgSend_shouldFetchAssetContent(v6, v48, v49);
    v9->_shouldFetchAssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(v6, v50, v51);
    v9->_shouldRequestEncryptedAssetOwnerIdentifier = objc_msgSend_shouldRequestEncryptedAssetOwnerIdentifier(v6, v52, v53);
    v9->_shouldFetchMergeableValues = objc_msgSend_shouldFetchMergeableValues(v6, v54, v55);
    v9->_shouldUpdateTimestampsForFetchedMergeableValues = 1;
    v9->_shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v6, v56, v57);
    objc_msgSend_assetFieldNamesToPublishURLs(v6, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend_assetFieldNamesToPublishURLs(v6, v61, v62);
      v63 = objc_claimAutoreleasedReturnValue();
      assetFieldNamesToPublishURLs = v9->_assetFieldNamesToPublishURLs;
      v9->_assetFieldNamesToPublishURLs = (NSSet *)v63;

      v9->_requestedTTL = objc_msgSend_requestedTTL(v6, v65, v66);
      v9->_URLOptions = objc_msgSend_URLOptions(v6, v67, v68);
    }
    v9->_useCachedEtags = 1;
    v9->_useRecordCache = 1;
    v69 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recordIDsToRefetch = v9->_recordIDsToRefetch;
    v9->_recordIDsToRefetch = v69;

    v71 = objc_opt_new();
    keyOrErrorForHostname = v9->_keyOrErrorForHostname;
    v9->_keyOrErrorForHostname = (NSMutableDictionary *)v71;

    objc_msgSend_webSharingIdentityDataByRecordID(v6, v73, v74);
    v75 = objc_claimAutoreleasedReturnValue();
    webSharingIdentityDataByRecordID = v9->_webSharingIdentityDataByRecordID;
    v9->_webSharingIdentityDataByRecordID = (NSDictionary *)v75;

    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(v9, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v79, v80, (uint64_t)CFSTR("ShouldRollSharePCSOnFetch"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_shouldRollSharePCSOnFetch = v81 != 0;

    }
  }

  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-records", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__fetchContainerScopedUserID(self, v6, v7);
      return 1;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend_hash(self, v8, v9);
      kdebug_trace();
      objc_msgSend_recordIDsToFetch(self, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fullRecordsToFetch(self, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fetchRecordsWithIDs_andFullRecords_(self, v16, (uint64_t)v12, v15);

      goto LABEL_11;
    case 3:
      objc_msgSend_recordIDsToRefetch(self, v4, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_count(v17, v18, v19);

      if (!v20)
        goto LABEL_6;
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend_setUseCachedEtags_(self, v21, 0);
      objc_msgSend_recordIDsToRefetch(self, v22, v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fetchRecordsWithIDs_andFullRecords_(self, v24, (uint64_t)v12, 0);
      goto LABEL_11;
    case 4:
LABEL_6:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend_hash(self, v25, v26);
      kdebug_trace();
      objc_msgSend_hash(self, v27, v28);
      kdebug_trace();
      objc_msgSend__fetchCloudCerts(self, v29, v30);
      return 1;
    case 5:
      objc_msgSend_setState_(self, v4, 6);
      objc_msgSend__saveUpdatedShareRecords(self, v31, v32);
      return 1;
    case 6:
      objc_msgSend_setState_(self, v4, 7);
      objc_msgSend__downloadMergeableValues(self, v33, v34);
      return 1;
    case 7:
      objc_msgSend_setState_(self, v4, 8);
      objc_msgSend_hash(self, v35, v36);
      kdebug_trace();
      objc_msgSend_hash(self, v37, v38);
      kdebug_trace();
      objc_msgSend__downloadAssets(self, v39, v40);
      return 1;
    case 8:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_msgSend_hash(self, v41, v42);
      kdebug_trace();
      objc_msgSend_error(self, v43, v44);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v45, (uint64_t)v12);
LABEL_11:

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 7)
    return off_1E7837058[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDFetchRecordsOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)desiredIndexedListKeys
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend_desiredKeySet(self, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v31, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12);
        CKProcessIndexedArrayKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        v18 = v15;
        if (v14)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v19 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v36 = v13;
            _os_log_error_impl(&dword_1BE990000, v19, OS_LOG_TYPE_ERROR, "Invalid desired key %{public}@, which should have been caught earlier", buf, 0xCu);
          }
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, CFSTR("CKDFetchRecordsOperation.m"), 371, CFSTR("Invalid desired key %@, which should have been caught earlier"), v13);

        }
        else if (v15)
        {
          v24 = objc_msgSend_count(v5, v16, v17);
          v26 = objc_msgSend_indexOfObject_inSortedRange_options_usingComparator_(v5, v25, v13, 0, v24, 1024, &unk_1E7836D80);
          objc_msgSend_insertObject_atIndex_(v5, v27, v13, v26);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v31, v37, 16);
    }
    while (v10);
  }

  return v5;
}

- (void)_fetchContainerScopedUserID
{
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_stateTransitionGroup(self, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEBDC674;
  v7[3] = &unk_1E78309E8;
  objc_copyWeak(&v8, &location);
  objc_msgSend_fetchContainerScopedUserID_(self, v6, (uint64_t)v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_saveUpdatedShareRecords
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[4];
  id v23;
  id location;

  objc_msgSend_shareRecordsToUpdateByRecordID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend_shareRecordsToUpdateByRecordID(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allValues(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordsToSave_(v8, v15, (uint64_t)v14);

    objc_msgSend_setShouldSkipPCSRetryBehavior_(v8, v16, 1);
    objc_msgSend_stateTransitionGroup(self, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v19);

    objc_initWeak(&location, self);
    v20 = objc_opt_class();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1BEBDC828;
    v22[3] = &unk_1E7835D38;
    objc_copyWeak(&v23, &location);
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v21, v20, v8, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
}

- (void)_findSpecialParticipantsOnShare:(id)a3 identityDelegate:(id)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  char isEqualToString;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  int v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  int v52;
  const char *v53;
  id v54;
  void *v55;
  id obj;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v54 = a4;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend_allParticipants(a3, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v58, v62, 16);
  if (v9)
  {
    v12 = v9;
    v57 = *(_QWORD *)v59;
    v55 = (void *)*MEMORY[0x1E0C94A68];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v59 != v57)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend_userIdentity(v14, v10, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userRecordID(v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_container(self, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_containerScopedUserID(v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v27, v28, (uint64_t)v21) & 1) != 0)
        {

LABEL_10:
          objc_msgSend_setIsCurrentUser_(v14, v30, 1);
          goto LABEL_11;
        }
        isEqualToString = objc_msgSend_isEqualToString_(v55, v29, (uint64_t)v21);

        if ((isEqualToString & 1) != 0)
          goto LABEL_10;
        objc_msgSend_userIdentity(v14, v30, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_publicSharingKey(v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend_sharingFingerprintsContainPublicKeyWithData_error_(v54, v37, (uint64_t)v36, 0);

        if (v38)
          goto LABEL_10;
LABEL_11:
        objc_msgSend_container(self, v30, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orgAdminUserID(v40, v41, v42);
        v43 = objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v46 = (void *)v43;
          objc_msgSend_container(self, v44, v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_orgAdminUserID(v47, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend_isEqualToString_(v50, v51, (uint64_t)v21);

          if (v52)
            objc_msgSend_setIsOrgAdminUser_(v14, v53, 1);
        }
        else
        {

        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v58, v62, 16);
    }
    while (v12);
  }

}

- (int)operationType
{
  return 211;
}

- (void)fetchRecordsWithIDs:(id)a3 andFullRecords:(id)a4
{
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  id v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
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
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  CKDFetchRecordsURLRequest *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  uint64_t AssetContent;
  const char *v114;
  NSObject *v115;
  const char *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  NSObject *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  id v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t j;
  void *v137;
  void *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  NSObject *v142;
  const char *v143;
  uint64_t v144;
  NSObject *v145;
  const char *v146;
  uint64_t v147;
  NSObject *v148;
  NSObject *v149;
  const char *v150;
  uint64_t v151;
  NSObject *v152;
  void *v153;
  SEL v154;
  id v155;
  id v156;
  void *v157;
  _QWORD v158[5];
  _QWORD block[5];
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _QWORD v164[5];
  id v165;
  id v166;
  _QWORD v167[5];
  id v168;
  id v169[2];
  id from;
  id location;
  _QWORD v172[4];
  id v173;
  _QWORD v174[3];
  char v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _BYTE v180[128];
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  v155 = a3;
  v156 = a4;
  if (objc_msgSend_count(v155, v7, v8))
  {
    v154 = a2;
    v157 = (void *)objc_opt_new();
    if (objc_msgSend_useRecordCache(self, v11, v12)
      && objc_msgSend_useCachedEtags(self, v13, v14))
    {
      objc_msgSend_container(self, v13, v14);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordCache(v153, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_desiredKeySet(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_databaseScope(self, v21, v22);
      objc_msgSend_recordsWithIDs_container_requiredKeys_scope_(v17, v24, (uint64_t)v155, v153, v20, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v178 = 0u;
      v179 = 0u;
      v176 = 0u;
      v177 = 0u;
      v26 = v25;
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v176, v181, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v177;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v177 != v31)
              objc_enumerationMutation(v26);
            v33 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * i);
            objc_msgSend_etag(v33, v28, v29);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend_length(v34, v35, v36);

            if (v37)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend_container(self, v38, v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_pcsManager(v40, v41, v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend__findSpecialParticipantsOnShare_identityDelegate_(self, v44, (uint64_t)v33, v43);

              }
              objc_msgSend_cachedRecords(self, v38, v39);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v33, v46, v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v45, v49, (uint64_t)v33, v48);

              objc_msgSend_etag(v33, v50, v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v33, v53, v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v157, v56, (uint64_t)v52, v55);

            }
          }
          v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v176, v181, 16);
        }
        while (v30);
      }

    }
    objc_msgSend_recordIDsToETags(self, v13, v14);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend_recordIDsToETags(self, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addEntriesFromDictionary_(v157, v61, (uint64_t)v60);

    }
    objc_msgSend_desiredIndexedListKeys(self, v58, v59);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_desiredKeySet(self, v63, v64);
    v65 = objc_claimAutoreleasedReturnValue();
    v68 = (void *)v65;
    if (v62)
    {
      objc_msgSend_desiredKeySet(self, v66, v67);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (void *)objc_msgSend_mutableCopy(v69, v70, v71);

      objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v73, (uint64_t)v62);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_minusSet_(v72, v75, (uint64_t)v74);

    }
    else
    {
      v72 = (void *)v65;
    }
    v174[0] = 0;
    v174[1] = v174;
    v174[2] = 0x2020000000;
    v175 = 0;
    v76 = [CKDFetchRecordsURLRequest alloc];
    objc_msgSend_recordIDsToVersionETags(self, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void *)objc_msgSend_initWithOperation_recordIDs_recordIDsToEtags_recordIDsToVersionETags_desiredKeys_(v76, v80, (uint64_t)self, v155, v157, v79, v72);

    objc_msgSend_setDesiredIndexedListKeys_(v81, v82, (uint64_t)v62);
    objc_msgSend_assetFieldNamesToPublishURLs(self, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
    {
      objc_msgSend_assetFieldNamesToPublishURLs(self, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssetFieldNamesToPublishURLs_(v81, v89, (uint64_t)v88);

      v92 = objc_msgSend_requestedTTL(self, v90, v91);
      objc_msgSend_setRequestedTTL_(v81, v93, v92);
      v96 = objc_msgSend_URLOptions(self, v94, v95);
      objc_msgSend_setURLOptions_(v81, v97, v96);
    }
    if ((objc_msgSend_fetchingAssetsForRereference(self, v86, v87) & 1) != 0)
    {
      objc_msgSend_setShouldFetchAssetContent_(v81, v98, 0);
    }
    else
    {
      v101 = (void *)objc_opt_new();
      if ((objc_msgSend_shouldFetchAssetContent(self, v102, v103) & 1) == 0)
      {
        objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allValues(v106, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v172[0] = MEMORY[0x1E0C809B0];
        v172[1] = 3221225472;
        v172[2] = sub_1BEBDD5C4;
        v172[3] = &unk_1E7836C20;
        v173 = v101;
        objc_msgSend_enumerateObjectsUsingBlock_(v109, v110, (uint64_t)v172);

      }
      if (objc_msgSend_count(v101, v104, v105))
      {
        objc_msgSend_setDesiredAssetKeys_(v81, v111, (uint64_t)v101);
      }
      else
      {
        AssetContent = objc_msgSend_shouldFetchAssetContent(self, v111, v112);
        objc_msgSend_setShouldFetchAssetContent_(v81, v114, AssetContent);
      }

    }
    objc_msgSend_fetchRecordsGroup(self, v99, v100);
    v115 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v115);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v81);
    v167[0] = MEMORY[0x1E0C809B0];
    v167[1] = 3221225472;
    v167[2] = sub_1BEBDD6C0;
    v167[3] = &unk_1E7836DD0;
    objc_copyWeak(&v168, &location);
    objc_copyWeak(v169, &from);
    v167[4] = v174;
    v169[1] = (id)v154;
    objc_msgSend_setRecordFetchedBlock_(v81, v116, (uint64_t)v167);
    v164[0] = MEMORY[0x1E0C809B0];
    v164[1] = 3221225472;
    v164[2] = sub_1BEBDD7F0;
    v164[3] = &unk_1E78321E8;
    objc_copyWeak(&v165, &location);
    objc_copyWeak(&v166, &from);
    v164[4] = v174;
    objc_msgSend_setCompletionBlock_(v81, v117, (uint64_t)v164);
    objc_msgSend_stateTransitionGroup(self, v118, v119);
    v120 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v120);

    objc_msgSend_setRequest_(self, v121, (uint64_t)v81);
    objc_msgSend_container(self, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v124, v125, (uint64_t)v81);

    objc_destroyWeak(&v166);
    objc_destroyWeak(&v165);
    objc_destroyWeak(v169);
    objc_destroyWeak(&v168);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    _Block_object_dispose(v174, 8);
  }
  if (objc_msgSend_count(v156, v9, v10))
  {
    v128 = (void *)objc_opt_new();
    objc_msgSend_setCode_(v128, v129, 1);
    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v130 = v156;
    v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v131, (uint64_t)&v160, v180, 16);
    if (v134)
    {
      v135 = *(_QWORD *)v161;
      do
      {
        for (j = 0; j != v134; ++j)
        {
          if (*(_QWORD *)v161 != v135)
            objc_enumerationMutation(v130);
          v137 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * j);
          objc_msgSend_recordID(v137, v132, v133);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__handleRecordFetch_recordID_etagMatched_responseCode_(self, v139, (uint64_t)v137, v138, 0, v128);

        }
        v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v132, (uint64_t)&v160, v180, 16);
      }
      while (v134);
    }

    objc_msgSend_stateTransitionGroup(self, v140, v141);
    v142 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v142);

    objc_msgSend_fetchRecordsGroup(self, v143, v144);
    v145 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_callbackQueue(self, v146, v147);
    v148 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEBDDCD4;
    block[3] = &unk_1E782EA40;
    block[4] = self;
    dispatch_group_notify(v145, v148, block);

  }
  objc_msgSend_fetchRecordsGroup(self, v126, v127);
  v149 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v150, v151);
  v152 = objc_claimAutoreleasedReturnValue();
  v158[0] = MEMORY[0x1E0C809B0];
  v158[1] = 3221225472;
  v158[2] = sub_1BEBDDD84;
  v158[3] = &unk_1E782EA40;
  v158[4] = self;
  dispatch_group_notify(v149, v152, v158);

}

- (id)errorForRecordID:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_errorsByRecordID(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    objc_msgSend_errorsByRecordID(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v7);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setError:(id)a3 forRecordID:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend_errorsByRecordID(self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v9);
    objc_msgSend_errorsByRecordID(self, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend_setObject_forKeyedSubscript_(v13, v12, (uint64_t)v14, v8);
    else
      objc_msgSend_removeObjectForKey_(v13, v12, (uint64_t)v8);

    objc_sync_exit(v9);
  }

}

- (void)_continueHandleFetchedRecord:(id)a3 recordID:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  const char *v59;
  const char *v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  _BOOL4 v67;
  const char *v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  objc_class *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  void *v99;
  void *v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  char v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  unsigned int v139;
  char isEqual;
  id v141;
  void *v142;
  id obj;
  CKDFetchRecordsOperation *val;
  uint64_t v146;
  uint64_t v147;
  _QWORD block[5];
  id v149;
  id v150;
  char v151;
  _QWORD v152[4];
  id v153;
  id v154;
  id v155;
  char v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint8_t v168[128];
  uint8_t buf[4];
  id v170;
  __int16 v171;
  void *v172;
  __int16 v173;
  void *v174;
  _BYTE v175[128];
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v141 = a4;
  val = self;
  objc_msgSend_recordIDsToETags(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v13, (uint64_t)v12);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_etag(v6, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v14, v18, (uint64_t)v17);

  if (!v6
    || (objc_msgSend_recordID(v6, v19, v20), (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend_errorForRecordID_(val, v19, (uint64_t)v141),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        v21,
        v22))
  {
    objc_msgSend_callbackQueue(val, v19, v20);
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEBDEBA8;
    block[3] = &unk_1E7830970;
    block[4] = val;
    v151 = isEqual;
    v149 = v6;
    v150 = v141;
    dispatch_async(v23, block);

    goto LABEL_5;
  }
  v139 = objc_msgSend_trackChanges(v6, v19, v20);
  objc_msgSend_setTrackChanges_(v6, v27, 0);
  objc_msgSend_desiredIndexedListKeys(val, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v31, v32);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  obj = v30;
  v147 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v164, v175, 16);
  if (v147)
  {
    v146 = *(_QWORD *)v165;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v165 != v146)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * v34);
        v162 = 0;
        v163 = 0;
        v161 = 0;
        CKProcessIndexedArrayKey();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        if (v36)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v40 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v170 = v35;
            _os_log_error_impl(&dword_1BE990000, v40, OS_LOG_TYPE_ERROR, "Invalid desired key %{public}@, which should have been caught earlier", buf, 0xCu);
          }
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, val, CFSTR("CKDFetchRecordsOperation.m"), 613, CFSTR("Invalid desired key %@, which should have been caught earlier"), v35);

          goto LABEL_39;
        }
        objc_msgSend_valueStore(v6, v37, v38);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v45, v46, (uint64_t)v39);
        v14 = objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend_valueStore(v6, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend_encryptedValueStore(v6, v47, v48);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v51, v52, (uint64_t)v39);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v53)
            goto LABEL_25;
          objc_msgSend_encryptedValueStore(v6, v54, v55);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v56 = v49;
        objc_msgSend_objectForKeyedSubscript_(v49, v50, (uint64_t)v39);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v58 = v57;
            objc_msgSend_objectForKeyedSubscript_(v142, v59, (uint64_t)v39);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            if (v61)
            {
              objc_msgSend_objectForKeyedSubscript_(v142, v60, (uint64_t)v39);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = objc_msgSend_unsignedIntegerValue(v62, v63, v64);

            }
            else
            {
              v65 = 0;
            }
            v67 = v14 == 0;

            objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v68, v162 + v65);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v142, v70, (uint64_t)v69, v39);

            if (v67)
            {
              objc_msgSend_encryptedValueStore(v6, v71, v72);
              v14 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_subarrayWithRange_(v58, v76, v65, v162);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setCompatibilityModeObjectNoValidate_forKey_(v14, v77, (uint64_t)v74, v35);
            }
            else
            {
              objc_msgSend_valueStore(v6, v71, v72);
              v14 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_subarrayWithRange_(v58, v73, v65, v162);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObjectNoValidate_forKey_(v14, v75, (uint64_t)v74, v35);
            }

          }
          else
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v14 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              v14 = v14;
              v79 = (objc_class *)objc_opt_class();
              NSStringFromClass(v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v170 = v39;
              v171 = 2114;
              v172 = v80;
              v173 = 2114;
              v174 = v35;
              _os_log_error_impl(&dword_1BE990000, v14, OS_LOG_TYPE_ERROR, "Original list key %{public}@ has incorrect value type %{public}@ for desired indexed list key %{public}@", buf, 0x20u);

            }
          }
          goto LABEL_39;
        }
LABEL_25:
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v66 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v170 = v39;
          v171 = 2114;
          v172 = v35;
          _os_log_error_impl(&dword_1BE990000, v66, OS_LOG_TYPE_ERROR, "Could not find original list key %{public}@ for desired indexed list key %{public}@", buf, 0x16u);
        }
LABEL_39:

        ++v34;
      }
      while (v147 != v34);
      v147 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v78, (uint64_t)&v164, v175, 16);
    }
    while (v147);
  }

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  objc_msgSend_allKeys(v142, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v157, v168, 16);
  if (!v87)
    goto LABEL_53;
  v88 = *(_QWORD *)v158;
  do
  {
    for (i = 0; i != v87; ++i)
    {
      if (*(_QWORD *)v158 != v88)
        objc_enumerationMutation(v83);
      v14 = *(NSObject **)(*((_QWORD *)&v157 + 1) + 8 * i);
      objc_msgSend_valueStore(v6, v85, v86);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v90, v91, (uint64_t)v14);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (v92)
      {
        objc_msgSend_valueStore(v6, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_encryptedValueStore(v6, v93, v94);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v97, v98, (uint64_t)v14);
        v99 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v99)
          continue;
        objc_msgSend_encryptedValueStore(v6, v85, v86);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v100 = v95;
      objc_msgSend_setObject_forKeyedSubscript_(v95, v96, 0, v14);

    }
    v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v85, (uint64_t)&v157, v168, 16);
  }
  while (v87);
LABEL_53:

  objc_msgSend_setTrackChanges_(v6, v101, v139);
  if (*MEMORY[0x1E0C95280])
  {
    v104 = objc_msgSend_shouldRollSharePCSOnFetch(val, v102, v103);
    objc_msgSend_setShouldRollSharePCSOnFetch_(val, v105, 0);
  }
  else
  {
    v104 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend_isZoneWideShare(v6, v106, v107))
    goto LABEL_68;
  objc_msgSend_currentUserParticipant(v6, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_role(v110, v111, v112) != 1)
    goto LABEL_67;
  if ((v104 & 1) == 0)
  {
    objc_msgSend_invitedKeysToRemove(v6, v113, v114);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_count(v14, v115, v116))
      goto LABEL_66;
  }
  objc_msgSend_container(val, v113, v114);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v117, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_canRollShareKeys(v120, v121, v122))
  {

    if ((v104 & 1) == 0)
LABEL_66:

LABEL_67:
    goto LABEL_68;
  }
  objc_msgSend_shareRecordsToUpdateByRecordID(val, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v6, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v125, v129, (uint64_t)v128);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v104 & 1) != 0)
  {

    if (!v130)
    {
LABEL_70:
      objc_msgSend_shareRecordsToUpdateByRecordID(val, v131, v132);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v6, v135, v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v134, v138, (uint64_t)v6, v137);

      goto LABEL_5;
    }
  }
  else
  {

    if (!v130)
      goto LABEL_70;
  }
LABEL_68:
  objc_initWeak((id *)buf, val);
  v152[0] = MEMORY[0x1E0C809B0];
  v152[1] = 3221225472;
  v152[2] = sub_1BEBDE9C8;
  v152[3] = &unk_1E7836DF8;
  objc_copyWeak(&v155, (id *)buf);
  v153 = v6;
  v154 = v141;
  v156 = isEqual;
  objc_msgSend__addDownloadTasksForRecord_completionBlock_(val, v133, (uint64_t)v153, v152);

  objc_destroyWeak(&v155);
  objc_destroyWeak((id *)buf);
LABEL_5:
  objc_msgSend_fetchRecordsGroup(val, v24, v25);
  v26 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v26);

}

- (CKDDecryptRecordsOperation)recordDecryptOperation
{
  CKDFetchRecordsOperation *v2;
  const char *v3;
  uint64_t v4;
  CKDDecryptRecordsOperation *decryptOperation;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  _QWORD v14[5];

  v2 = self;
  objc_sync_enter(v2);
  decryptOperation = v2->_decryptOperation;
  if (!decryptOperation || objc_msgSend_isFinished(decryptOperation, v3, v4))
  {
    v8 = (void *)objc_opt_new();
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_webSharingIdentityDataByRecordID(v2, v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWebSharingIdentityDataByRecordID_(v8, v10, (uint64_t)v9);

    }
    v11 = objc_opt_class();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1BEBDED64;
    v14[3] = &unk_1E782E508;
    v14[4] = v2;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v2, v12, v11, v8, v14);

  }
  objc_sync_exit(v2);

  return v2->_decryptOperation;
}

- (void)finishDecryption
{
  const char *v2;
  uint64_t v3;
  CKDDecryptRecordsOperation *decryptOperation;
  const char *v5;
  uint64_t v6;
  CKDFetchRecordsOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  decryptOperation = obj->_decryptOperation;
  if (decryptOperation && (objc_msgSend_isFinished(decryptOperation, v2, v3) & 1) == 0)
    objc_msgSend_finishDecryption(obj->_decryptOperation, v5, v6);
  objc_sync_exit(obj);

}

- (void)_decryptPropertiesOnRecord:(id)a3 recordID:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if (objc_msgSend_isMergeableValueDeltaRecord(v10, v7, v8))
    objc_msgSend__fetchPCSForMergeableValueDeltaRecord_recordID_(self, v9, (uint64_t)v10, v6);
  else
    objc_msgSend__reallyDecryptPropertiesOnRecord_recordID_(self, v9, (uint64_t)v10, v6);

}

- (void)_reallyDecryptPropertiesOnRecord:(id)a3 recordID:(id)a4
{
  id v6;
  id v7;
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

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend_recordDecryptOperation(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEBDF04C;
  v14[3] = &unk_1E7836E60;
  objc_copyWeak(&v17, &location);
  v11 = v6;
  v15 = v11;
  v12 = v7;
  v16 = v12;
  objc_msgSend_decryptRecord_withCompletion_(v10, v13, (uint64_t)v11, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_fetchPCSForMergeableValueDeltaRecord:(id)a3 recordID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CKDFetchRecordsOperation *v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend_container(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsCache(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEBDF4B0;
  v17[3] = &unk_1E7836E88;
  objc_copyWeak(&v21, &location);
  v14 = v7;
  v18 = v14;
  v15 = v6;
  v19 = v15;
  v20 = self;
  objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v13, v16, (uint64_t)v14, self, 0, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_handleRecordFetch:(id)a3 recordID:(id)a4 etagMatched:(BOOL)a5 responseCode:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  _BOOL4 v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  int v58;
  _BOOL4 v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  NSObject *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  void *v107;
  _BOOL4 v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t hasProtectionDataEntitlement;
  const char *v121;
  const char *v122;
  void *v123;
  BOOL v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  __CFString *v128;
  const char *v129;
  char v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  void *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  NSObject *v149;
  const char *v150;
  uint64_t v151;
  NSObject *v152;
  __CFString *v153;
  const char *v154;
  uint64_t v155;
  NSObject *v156;
  const __CFString *v157;
  NSObject *v158;
  const char *v159;
  uint64_t v160;
  NSObject *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  _BOOL4 v165;
  _BOOL4 v166;
  void *v167;
  _QWORD block[5];
  id v169;
  id v170;
  __CFString *v171;
  BOOL v172;
  _QWORD v173[4];
  id v174;
  void *v175;
  _BYTE location[12];
  __int16 v177;
  const __CFString *v178;
  __int16 v179;
  int v180;
  uint64_t v181;

  v166 = a5;
  v181 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v12 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    if (v166)
      v157 = CFSTR("true");
    else
      v157 = CFSTR("false");
    v158 = v12;
    *(_DWORD *)location = 138543874;
    *(_QWORD *)&location[4] = v10;
    v177 = 2114;
    v178 = v157;
    v179 = 1024;
    v180 = objc_msgSend_code(v11, v159, v160);
    _os_log_debug_impl(&dword_1BE990000, v158, OS_LOG_TYPE_DEBUG, "Fetched record %{public}@, etag-matched:%{public}@, responseCode:%d", location, 0x1Cu);

  }
  objc_msgSend_container(self, v13, v14);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchRecordsGroup(self, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v17);

  v20 = objc_msgSend_code(v11, v18, v19);
  v165 = v20 == 1;
  if (v20 != 1)
  {
    v23 = (void *)MEMORY[0x1E0C94FF8];
    v24 = sub_1BEB10D5C(v11);
    objc_msgSend_request(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v27, v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v11, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v23, v35, *MEMORY[0x1E0C94B20], v24, v28, CFSTR("Error fetching record %@ from server: %@"), v10, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend_setError_forRecordID_(self, v37, (uint64_t)v36, v10);
    if (objc_msgSend_databaseScope(self, v37, v38) != 1 && objc_msgSend_CKIsNotFoundError(v36, v39, v40))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v41 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v10;
        _os_log_debug_impl(&dword_1BE990000, v41, OS_LOG_TYPE_DEBUG, "Record not found in private DB for recordID %@. Setting PCS data nil on caches", location, 0xCu);
      }
      objc_msgSend_setPCSData_forFetchedRecordID_(self, v42, 0, v10);
      objc_msgSend_setPCSData_forFetchedShareID_(self, v43, 0, v10);
    }

  }
  objc_msgSend_error(v11, v21, v22);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_type(v47, v48, v49) == 48;

  if (v50)
  {
    objc_msgSend_options(v167, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_useAnonymousToServerShareParticipants(v53, v54, v55) ^ 1;
    if (!v10)
      LOBYTE(v58) = 1;
    if ((v58 & 1) != 0)
    {

    }
    else
    {
      v59 = objc_msgSend_databaseScope(self, v56, v57) == 3;

      if (v59)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v62 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v161 = v62;
          objc_msgSend_zoneID(v10, v162, v163);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138412290;
          *(_QWORD *)&location[4] = v164;
          _os_log_debug_impl(&dword_1BE990000, v161, OS_LOG_TYPE_DEBUG, "Possible anonymous share %@ not found. Removing share from anonymous share list", location, 0xCu);

        }
        objc_initWeak((id *)location, self);
        objc_msgSend_fetchRecordsGroup(self, v63, v64);
        v65 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v65);

        objc_msgSend_anonymousSharingManager(v167, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v10, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = v71;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v72, (uint64_t)&v175, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v173[0] = MEMORY[0x1E0C809B0];
        v173[1] = 3221225472;
        v173[2] = sub_1BEBE02D4;
        v173[3] = &unk_1E78309E8;
        objc_copyWeak(&v174, (id *)location);
        objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v68, v74, (uint64_t)v73, self, v173);

        objc_destroyWeak(&v174);
        objc_destroyWeak((id *)location);
      }
    }
    objc_msgSend_recordCache(v167, v60, v61);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v10, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearAllRecordsForZoneWithID_(v75, v79, (uint64_t)v78);

    if (objc_msgSend_databaseScope(self, v80, v81) != 1)
    {
      objc_msgSend_zoneID(v10, v51, v52);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPCSData_forFetchedZoneID_(self, v83, 0, v82);

      objc_msgSend_pcsCache(v167, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v10, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removePCSDataForItemsInZoneWithID_(v86, v90, (uint64_t)v89);

    }
  }
  if (v10 && !v9 && v166)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v91 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v10;
      _os_log_debug_impl(&dword_1BE990000, v91, OS_LOG_TYPE_DEBUG, "Remote record matches local record etag. Returning record %{public}@ from cache.", location, 0xCu);
    }
    objc_msgSend_cachedRecords(self, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v94, v95, (uint64_t)v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v9;
      objc_msgSend_container(self, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__findSpecialParticipantsOnShare_identityDelegate_(self, v102, (uint64_t)v9, v101);

      objc_msgSend_cachedRecords(self, v103, v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v105, v106, (uint64_t)v9, v10);

    }
    v165 = 0;
  }
  if (v9)
  {
    objc_msgSend_etag(v9, v51, v52);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v107 != 0;

    if (v165 && v108)
    {
      if (objc_msgSend_useRecordCache(self, v51, v52))
      {
        objc_msgSend_recordCache(v167, v51, v52);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_desiredKeySet(self, v110, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = objc_msgSend_databaseScope(self, v113, v114);
        objc_msgSend_addRecord_container_knownUserKeys_scope_(v109, v116, (uint64_t)v9, v167, v112, v115);

      }
    }
  }
  objc_msgSend_entitlements(v167, v51, v52);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement(v117, v118, v119);
  objc_msgSend_setSerializeProtectionData_(v9, v121, hasProtectionDataEntitlement);

  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v122, (uint64_t)CFSTR("TESTING_NO_RECORD_ERROR_OR_RECORDS_RETURNED"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v123 == 0;

    if (!v124)
    {

      if (v10)
      {
        objc_msgSend_setError_forRecordID_(self, v122, 0, v10);

      }
      v10 = 0;
      v9 = 0;
    }
  }
  objc_msgSend_errorForRecordID_(self, v122, (uint64_t)v10);
  v125 = objc_claimAutoreleasedReturnValue();
  v128 = (__CFString *)v125;
  if (!v9 || v125)
  {
    v130 = 0;
    if (v10 && v166)
    {
      objc_msgSend_recordIDsToETags(self, v126, v127);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allKeys(v131, v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = objc_msgSend_containsObject_(v134, v135, (uint64_t)v10);

    }
    if (!v128 && (v130 & 1) == 0)
    {
      v136 = (void *)MEMORY[0x1E0C94FF8];
      v137 = sub_1BEB10D5C(v11);
      objc_msgSend_request(self, v138, v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(v140, v11);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v11, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v144, v145, v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_format_(v136, v148, *MEMORY[0x1E0C94B20], v137, v141, CFSTR("Error fetching record %@ from server: %@"), v10, v147);
      v128 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v149 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v10;
      v177 = 2112;
      v178 = v128;
      _os_log_impl(&dword_1BE990000, v149, OS_LOG_TYPE_INFO, "Calling completion block for nil or failed record with ID %@: %@", location, 0x16u);
    }
    objc_msgSend_callbackQueue(self, v150, v151);
    v152 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEBE03E4;
    block[3] = &unk_1E7834AE8;
    block[4] = self;
    v172 = v166;
    v169 = v9;
    v170 = v10;
    v171 = v128;
    v153 = v128;
    dispatch_async(v152, block);

    objc_msgSend_fetchRecordsGroup(self, v154, v155);
    v156 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v156);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend__handleSharePCSPrepForShare_recordID_(self, v129, (uint64_t)v9, v10);
    else
      objc_msgSend__decryptPropertiesIfNeededForRecord_record_(self, v129, (uint64_t)v9, v10);
  }

}

- (void)_handleSharePCSPrepForShare:(id)a3 recordID:(id)a4
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
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t hasParticipantPIIEntitlement;
  const char *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  const char *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id location;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_container(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasOutOfProcessUIEntitlement(v13, v14, v15))
  {
    objc_msgSend_setSerializePersonalInfo_(v6, v16, 1);
  }
  else
  {
    objc_msgSend_entitlements(v10, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    hasParticipantPIIEntitlement = objc_msgSend_hasParticipantPIIEntitlement(v18, v19, v20);
    objc_msgSend_setSerializePersonalInfo_(v6, v22, hasParticipantPIIEntitlement);

  }
  objc_initWeak(&location, self);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v23 = (id)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_recordID(v6, v24, v25);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v47 = v39;
    v48 = 2112;
    v49 = v10;
    _os_log_debug_impl(&dword_1BE990000, v23, OS_LOG_TYPE_DEBUG, "Prepping PCS data for share %@ with container %@", buf, 0x16u);

  }
  v28 = objc_msgSend_databaseScope(self, v26, v27);
  objc_msgSend_topmostParentOperation(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = sub_1BEBE0708;
  v40[3] = &unk_1E7836EB0;
  v35 = v6;
  v41 = v35;
  v36 = v10;
  v42 = v36;
  objc_copyWeak(&v44, &location);
  v37 = v7;
  v43 = v37;
  objc_msgSend__prepPCSDataWithContainer_databaseScope_removeServerSpecifiedKeys_requestorOperationID_completionHandler_(v35, v38, (uint64_t)v36, v28, 1, v34, v40);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

- (void)_decryptPropertiesIfNeededForRecord:(id)a3 record:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend_errorForRecordID_(self, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_hasPropertiesRequiringEncryption(v13, v9, v10) & 1) == 0
    && !objc_msgSend_forcePCSDecrypt(self, v11, v12)
    || (objc_msgSend_skipDecryption(self, v11, v12) & 1) != 0
    || v8)
  {
    objc_msgSend__continueHandleFetchedRecord_recordID_(self, v11, (uint64_t)v13, v6);
  }
  else
  {
    objc_msgSend__decryptPropertiesOnRecord_recordID_(self, v11, (uint64_t)v13, v6);
  }

}

- (BOOL)fetchingAssetsForRereference
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_fetchingAssetsForRereference(v3, v4, v5);

  return v6;
}

- (int)_prepareAsset:(id)a3 record:(id)a4 recordKey:(id)a5 assetTransferOptions:(id)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  id v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  const char *v70;
  const char *v71;
  void *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  CKDFetchRecordsOperation *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t v101[128];
  uint8_t buf[4];
  id v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  id v107;
  __int16 v108;
  void *v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v16 = a6;
  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v91, v95, (uint64_t)a2, self, CFSTR("CKDFetchRecordsOperation.m"), 986, CFSTR("Expected non-nil record for operation %@"), v94);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v11;
    objc_msgSend_downloadBaseURL(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20
      || (objc_msgSend_constructedAssetDownloadURLTemplate(v17, v21, v22),
          (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_7:
      objc_msgSend_setRecord_(v17, v25, (uint64_t)v12);
      objc_msgSend_setRecordKey_(v17, v26, (uint64_t)v13);
      objc_msgSend_setAssetTransferOptions_(v17, v27, (uint64_t)v16);
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v28 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v31 = v28;
        objc_msgSend_signature(v17, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v12, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationID(self, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v103 = v34;
        v104 = 2112;
        v105 = v37;
        v106 = 2114;
        v107 = v13;
        v108 = 2114;
        v109 = v40;
        _os_log_impl(&dword_1BE990000, v31, OS_LOG_TYPE_INFO, "Prepared asset %@ for record %@, recordKey %{public}@ and operation %{public}@", buf, 0x2Au);

      }
      objc_msgSend_downloadBaseURL(v17, v29, v30);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
        v42 = 2;
      else
        v42 = 1;
      goto LABEL_39;
    }
    if (!objc_msgSend_downloaded(v17, v23, v24))
      goto LABEL_7;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v80 = (void *)*MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
LABEL_38:
      v42 = 0;
LABEL_39:

      goto LABEL_40;
    }
    v48 = v80;
    objc_msgSend_signature(v17, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v12, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v103 = v83;
    v104 = 2112;
    v105 = v86;
    v106 = 2114;
    v107 = v13;
    v108 = 2114;
    v109 = v89;
    _os_log_impl(&dword_1BE990000, v48, OS_LOG_TYPE_INFO, "Using cached asset for signature %@, record %@, recordKey %{public}@ and operation %{public}@", buf, 0x2Au);

LABEL_37:
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = v11;
    if (!objc_msgSend_downloaded(v43, v44, v45))
    {
      v96 = self;
      objc_msgSend_setRecord_(v43, v46, (uint64_t)v12);
      objc_msgSend_setRecordKey_(v43, v55, (uint64_t)v13);
      v58 = objc_msgSend_recordPCS(v12, v56, v57);
      objc_msgSend_setRecordPCS_(v43, v59, v58);
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      objc_msgSend_assets(v43, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v97, v101, 16);
      if (v64)
      {
        v66 = v64;
        v67 = *(_QWORD *)v98;
        do
        {
          for (i = 0; i != v66; ++i)
          {
            if (*(_QWORD *)v98 != v67)
              objc_enumerationMutation(v62);
            v69 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
            objc_msgSend_setRecord_(v69, v65, (uint64_t)v12);
            objc_msgSend_setRecordKey_(v69, v70, (uint64_t)v13);
            objc_msgSend_setAssetTransferOptions_(v69, v71, (uint64_t)v16);
          }
          v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v97, v101, 16);
        }
        while (v66);
      }

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v72 = (void *)*MEMORY[0x1E0C952B0];
      v42 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v73 = v72;
        objc_msgSend_recordID(v12, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationID(v96, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v103 = v43;
        v104 = 2112;
        v105 = v76;
        v106 = 2114;
        v107 = v13;
        v108 = 2114;
        v109 = v79;
        _os_log_impl(&dword_1BE990000, v73, OS_LOG_TYPE_INFO, "Prepared package %@ for record %@, recordKey %{public}@ and operation %{public}@", buf, 0x2Au);

      }
      goto LABEL_39;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v47 = (void *)*MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      goto LABEL_38;
    v48 = v47;
    objc_msgSend_recordID(v12, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v103 = v43;
    v104 = 2112;
    v105 = v51;
    v106 = 2114;
    v107 = v13;
    v108 = 2114;
    v109 = v54;
    _os_log_impl(&dword_1BE990000, v48, OS_LOG_TYPE_INFO, "Using cached package %@ for record %@, recordKey %{public}@ and operation %{public}@", buf, 0x2Au);

    goto LABEL_37;
  }
  v42 = 0;
LABEL_40:

  return v42;
}

- (void)_addDownloadTasksForRecord:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BEBE134C;
  v11[3] = &unk_1E78335D0;
  objc_copyWeak(&v14, &location);
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  objc_msgSend__addMergeableValueDownloadTasksForRecord_completionBlock_(self, v10, (uint64_t)v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_addAssetDownloadTaskForRecord:(id)a3 completionBlock:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  _BOOL4 v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  char AssetContent;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  int v69;
  void *v70;
  int v71;
  void *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  id v77;
  void (**v78)(void *, uint64_t, id);
  const char *v79;
  uint64_t v80;
  id v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  char isKindOfClass;
  const char *v86;
  uint64_t v87;
  const char *v88;
  unint64_t v89;
  void *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  id v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t j;
  void *v115;
  void *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  char v124;
  const char *v125;
  uint64_t v126;
  id v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t i;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  const char *v140;
  void *v141;
  const char *v142;
  void *v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  _BOOL8 v150;
  CKDRecordDownloadTask *v151;
  const char *v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  NSObject *v156;
  const char *v157;
  uint64_t v158;
  NSObject *v159;
  id v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  NSObject *v171;
  NSObject *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  const __CFString *v183;
  const char *v184;
  uint64_t v185;
  const __CFString *v186;
  const __CFString *v187;
  NSObject *v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  id v194;
  void *v195;
  id obj;
  id v198;
  id v199;
  id v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  void *v205;
  id v206;
  void *v208;
  _QWORD block[4];
  id v210;
  id v211;
  _QWORD v212[4];
  id v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  _QWORD aBlock[5];
  id v223;
  id v224;
  id v225;
  id v226;
  SEL v227;
  char v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  _QWORD v233[4];
  id v234;
  _BYTE v235[128];
  _BYTE v236[128];
  uint8_t v237[128];
  uint8_t buf[4];
  uint64_t v239;
  __int16 v240;
  void *v241;
  __int16 v242;
  const __CFString *v243;
  __int16 v244;
  const __CFString *v245;
  __int16 v246;
  const __CFString *v247;
  uint64_t v248;

  v248 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v194 = a4;
  v205 = v5;
  if (!v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v190, v191);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v189, v193, (uint64_t)a2, self, CFSTR("CKDFetchRecordsOperation.m"), 1043, CFSTR("Expected non-nil record for operation %@"), v192, v194);

  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v172 = v8;
    objc_msgSend_recordID(v205, v173, v174);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v176, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_shouldFetchAssetContent(self, v179, v180))
      v183 = CFSTR("true");
    else
      v183 = CFSTR("false");
    if (objc_msgSend_fetchingAssetsForRereference(self, v181, v182))
      v186 = CFSTR("true");
    else
      v186 = CFSTR("false");
    *(_DWORD *)buf = 138413314;
    if (objc_msgSend_shouldFetchAssetContentInMemory(self, v184, v185))
      v187 = CFSTR("true");
    else
      v187 = CFSTR("false");
    v239 = (uint64_t)v175;
    v240 = 2114;
    v241 = v178;
    v242 = 2114;
    v243 = v183;
    v244 = 2114;
    v245 = v186;
    v246 = 2114;
    v247 = v187;
    _os_log_debug_impl(&dword_1BE990000, v172, OS_LOG_TYPE_DEBUG, "Preparing assets for download for record %@ and operation %{public}@ (shouldFetchAssetContent:%{public}@ fetchingAssetsForRereference:%{public}@ inMemory:%{public}@)", buf, 0x34u);

  }
  if ((objc_msgSend_shouldFetchAssetContent(self, v9, v10) & 1) == 0)
  {
    objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordType(v205, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v13, v17, (uint64_t)v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (v19)
    {
      if (!objc_msgSend_containsAssetBackedMergeableDeltas(v205, v11, v12))
      {
        objc_msgSend_callbackQueue(self, v20, v21);
        v171 = objc_claimAutoreleasedReturnValue();
        v233[0] = MEMORY[0x1E0C809B0];
        v233[1] = 3221225472;
        v233[2] = sub_1BEBE23D4;
        v233[3] = &unk_1E782EFD8;
        v234 = v194;
        dispatch_async(v171, v233);

        goto LABEL_102;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v22 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE990000, v22, OS_LOG_TYPE_DEBUG, "Forcing asset fetch due to presence of asset-backed mergeable deltas", buf, 2u);
      }
    }
  }
  objc_msgSend_desiredPackageFileIndices(self, v11, v12);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v199 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v198 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v231 = 0u;
  v232 = 0u;
  v229 = 0u;
  v230 = 0u;
  objc_msgSend_allKeys(v205, v23, v24);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v229, v237, 16);
  if (v202)
  {
    v201 = *(_QWORD *)v230;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v230 != v201)
        {
          v28 = v27;
          objc_enumerationMutation(obj);
          v27 = v28;
        }
        v203 = v27;
        v29 = *(_QWORD *)(*((_QWORD *)&v229 + 1) + 8 * v27);
        objc_msgSend_objectForKeyedSubscript_(v205, v26, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v30;
        if (v30)
        {
          v206 = v30;
        }
        else
        {
          objc_msgSend_encryptedValues(v205, v31, v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v34, v35, v29);
          v206 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordType(v205, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v38, v42, (uint64_t)v41);
        v204 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = v204;
        if (v204)
        {
          objc_msgSend_objectForKeyedSubscript_(v204, v43, v29);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v208 = v45;
        objc_msgSend_shouldFetchAssetContent(v45, v43, v44);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          objc_msgSend_shouldFetchAssetContent(v208, v46, v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          AssetContent = objc_msgSend_BOOLValue(v49, v50, v51);

        }
        else
        {
          AssetContent = objc_msgSend_shouldFetchAssetContent(self, v46, v47);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_hasAssetBackedDeltas(v206, v53, v54))
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v55 = v208;
          v56 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v57 = v56;
            objc_msgSend_recordID(v205, v58, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v239 = v29;
            v240 = 2112;
            v241 = v60;
            _os_log_debug_impl(&dword_1BE990000, v57, OS_LOG_TYPE_DEBUG, "Forcing asset download for asset-backed mergeable field %{public}@ on record %@", buf, 0x16u);

            objc_msgSend_shouldFetchAssetContentInMemory(v208, v61, v62);
          }
          else
          {
LABEL_33:
            objc_msgSend_shouldFetchAssetContentInMemory(v55, v53, v54);
          }
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (v65)
          {
            objc_msgSend_shouldFetchAssetContentInMemory(v208, v63, v64);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend_BOOLValue(v66, v67, v68);

            if (v69)
              goto LABEL_36;
LABEL_46:
            v71 = 0;
          }
          else
          {
            if ((objc_msgSend_shouldFetchAssetContentInMemory(self, v63, v64) & 1) == 0)
              goto LABEL_46;
LABEL_36:
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v70 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              v135 = v70;
              objc_msgSend_recordID(v205, v136, v137);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v239 = v29;
              v240 = 2112;
              v241 = v138;
              _os_log_debug_impl(&dword_1BE990000, v135, OS_LOG_TYPE_DEBUG, "Will fetch asset content in memory for key %{public}@ on record %@", buf, 0x16u);

            }
            v71 = 1;
          }
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = sub_1BEBE23EC;
          aBlock[3] = &unk_1E7836F00;
          aBlock[4] = self;
          v228 = v71;
          v223 = v199;
          v224 = v200;
          v77 = v205;
          v225 = v77;
          v226 = v198;
          v227 = a2;
          v78 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v80 = objc_msgSend__prepareAsset_record_recordKey_assetTransferOptions_(self, v79, (uint64_t)v206, v77, v29, v208);
            v78[2](v78, v80, v206);
            goto LABEL_93;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v81 = v206;
            objc_msgSend_firstObject(v81, v82, v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              if (objc_msgSend_count(v81, v86, v87))
              {
                v89 = 0;
                do
                {
                  objc_msgSend_objectAtIndexedSubscript_(v81, v88, v89);
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v93 = objc_msgSend__prepareAsset_record_recordKey_assetTransferOptions_(self, v91, (uint64_t)v90, v77, v29, v208);
                    if ((_DWORD)v93)
                      objc_msgSend_setArrayIndex_(v90, v92, v89);
                    v78[2](v78, v93, v90);
                  }

                  ++v89;
                }
                while (v89 < objc_msgSend_count(v81, v94, v95));
              }
            }
            else
            {
              objc_msgSend_firstObject(v81, v86, v87);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v124 = objc_opt_isKindOfClass();

              if ((v124 & 1) != 0)
              {
                if (v71)
                {
                  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v125, v126);
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v143, v144, (uint64_t)a2, self, CFSTR("CKDFetchRecordsOperation.m"), 1140, CFSTR("shouldFetchAssetContentInMemory not for packages"));

                }
                v220 = 0u;
                v221 = 0u;
                v218 = 0u;
                v219 = 0u;
                v127 = v81;
                v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v127, v128, (uint64_t)&v218, v236, 16);
                if (v129)
                {
                  v130 = *(_QWORD *)v219;
                  do
                  {
                    for (i = 0; i != v129; ++i)
                    {
                      if (*(_QWORD *)v219 != v130)
                        objc_enumerationMutation(v127);
                      v132 = *(_QWORD *)(*((_QWORD *)&v218 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v134 = objc_msgSend__prepareAsset_record_recordKey_assetTransferOptions_(self, v133, v132, v77, v29, v208);
                        v78[2](v78, v134, (id)v132);
                      }
                    }
                    v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v127, v133, (uint64_t)&v218, v236, 16);
                  }
                  while (v129);
                }

              }
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v71)
              {
                objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v96, v97);
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v141, v142, (uint64_t)a2, self, CFSTR("CKDFetchRecordsOperation.m"), 1150, CFSTR("shouldFetchAssetContentInMemory not for packages"));

              }
              v98 = v206;
              v102 = objc_msgSend__prepareAsset_record_recordKey_assetTransferOptions_(self, v99, (uint64_t)v98, v77, v29, v208);
              if ((_DWORD)v102 == 1)
              {
                objc_msgSend_recordID(v77, v100, v101);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v195, v104, (uint64_t)v103);
                v105 = (void *)objc_claimAutoreleasedReturnValue();

                if (v105)
                  objc_msgSend_objectForKeyedSubscript_(v105, v106, v29);
                else
                  objc_msgSend_objectForKeyedSubscript_(v195, v106, v29);
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setDownloadItemIndices_(v98, v140, (uint64_t)v139);

              }
              v78[2](v78, v102, v98);

              goto LABEL_93;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
LABEL_93:

              goto LABEL_94;
            }
            v217 = 0u;
            v215 = 0u;
            v216 = 0u;
            v214 = 0u;
            objc_msgSend_unmergedDeltas(v206, v107, v108);
            v81 = (id)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v109, (uint64_t)&v214, v235, 16);
            if (v112)
            {
              v113 = *(_QWORD *)v215;
              do
              {
                for (j = 0; j != v112; ++j)
                {
                  if (*(_QWORD *)v215 != v113)
                    objc_enumerationMutation(v81);
                  v115 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * j);
                  objc_msgSend_asset(v115, v110, v111);
                  v116 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v116)
                  {
                    objc_msgSend_asset(v115, v110, v111);
                    v117 = (void *)objc_claimAutoreleasedReturnValue();
                    v119 = objc_msgSend__prepareAsset_record_recordKey_assetTransferOptions_(self, v118, (uint64_t)v117, v77, v29, v208);

                    objc_msgSend_asset(v115, v120, v121);
                    v122 = (void *)objc_claimAutoreleasedReturnValue();
                    v78[2](v78, v119, v122);

                  }
                }
                v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v110, (uint64_t)&v214, v235, 16);
              }
              while (v112);
            }
          }

          goto LABEL_93;
        }
        v55 = v208;
        if ((AssetContent & 1) != 0)
          goto LABEL_33;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v72 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v73 = v72;
          objc_msgSend_recordID(v205, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v239 = v29;
          v240 = 2112;
          v241 = v76;
          _os_log_debug_impl(&dword_1BE990000, v73, OS_LOG_TYPE_DEBUG, "Skipping asset download for key %{public}@ on record %@", buf, 0x16u);

LABEL_94:
          v55 = v208;
        }

        v27 = v203 + 1;
      }
      while (v203 + 1 != v202);
      v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v229, v237, 16);
    }
    while (v202);
  }

  if (objc_msgSend_count(v200, v145, v146)
    || objc_msgSend_count(v199, v147, v148)
    || objc_msgSend_count(v198, v147, v148))
  {
    objc_msgSend_recordFetchProgressBlock(self, v147, v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = v149 != 0;

    v151 = [CKDRecordDownloadTask alloc];
    v153 = (void *)objc_msgSend_initWithRecord_trackProgress_assetsToDownload_assetsToDownloadInMemory_assetURLInfosToFillOut_(v151, v152, (uint64_t)v205, v150, v200, v199, v198);
    objc_msgSend_group(v153, v154, v155);
    v156 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_callbackQueue(self, v157, v158);
    v159 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEBE2600;
    block[3] = &unk_1E782EC68;
    v211 = v194;
    v160 = v153;
    v210 = v160;
    dispatch_group_notify(v156, v159, block);

    objc_msgSend_downloadTasksByRecordID(self, v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v163);
    objc_msgSend_downloadTasksByRecordID(self, v164, v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v205, v167, v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v166, v170, (uint64_t)v160, v169);

    objc_sync_exit(v163);
  }
  else
  {
    objc_msgSend_callbackQueue(self, v147, v148);
    v188 = objc_claimAutoreleasedReturnValue();
    v212[0] = MEMORY[0x1E0C809B0];
    v212[1] = 3221225472;
    v212[2] = sub_1BEBE25E8;
    v212[3] = &unk_1E782EFD8;
    v213 = v194;
    dispatch_async(v188, v212);

    v160 = v213;
  }

LABEL_102:
}

- (void)_addMergeableValueDownloadTasksForRecord:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  const char *v8;
  uint64_t v9;
  dispatch_once_t *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  const char *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  dispatch_once_t *v36;
  CKDFetchRecordsOperation *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  CKMergeableValueDownloadTask *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  void (**v67)(_QWORD);
  id v68;
  uint64_t v69;
  NSObject *group;
  uint64_t v71;
  id obj;
  _QWORD block[4];
  void (**v74)(_QWORD);
  _QWORD v75[4];
  NSObject *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if ((objc_msgSend_shouldFetchMergeableValues(self, v8, v9) & 1) != 0)
  {
    v10 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    v67 = v7;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v60 = v11;
      objc_msgSend_recordID(v6, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(self, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v82 = v63;
      v83 = 2114;
      v84 = (uint64_t)v66;
      _os_log_debug_impl(&dword_1BE990000, v60, OS_LOG_TYPE_DEBUG, "Adding mergeable value download tasks for record %@ in operation %{public}@", buf, 0x16u);

    }
    group = dispatch_group_create();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend_allKeys(v6, v12, v13);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v77, v89, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v78;
      v68 = v6;
      v69 = *(_QWORD *)v78;
      do
      {
        v19 = 0;
        v71 = v17;
        do
        {
          if (*(_QWORD *)v78 != v18)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v19);
          objc_msgSend_objectForKeyedSubscript_(v6, v16, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v21;
          if (v21)
          {
            v25 = v21;
          }
          else
          {
            objc_msgSend_encryptedValues(v6, v22, v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v26, v27, v20);
            v25 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = v25;
            objc_msgSend_valueID(v28, v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (*v10 != -1)
              dispatch_once(v10, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v32 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
            {
              v33 = v32;
              objc_msgSend_recordID(v6, v34, v35);
              v36 = v10;
              v37 = self;
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_operationID(v37, v39, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v82 = v31;
              v83 = 2112;
              v84 = v20;
              v85 = 2112;
              v86 = v38;
              v87 = 2114;
              v88 = v41;
              _os_log_impl(&dword_1BE990000, v33, OS_LOG_TYPE_INFO, "Will download mergeable value for mergeable %@ for key '%@' on record %@ in operation %{public}@", buf, 0x2Au);

              self = v37;
              v10 = v36;
              v6 = v68;

            }
            v42 = objc_alloc_init(CKMergeableValueDownloadTask);
            objc_msgSend_setRecord_(v42, v43, (uint64_t)v6);
            objc_msgSend_setKey_(v42, v44, v20);
            objc_msgSend_setMergeableValueID_(v42, v45, (uint64_t)v31);
            objc_msgSend_setRecordValue_(v42, v46, (uint64_t)v28);
            dispatch_group_enter(group);
            v75[0] = MEMORY[0x1E0C809B0];
            v75[1] = 3221225472;
            v75[2] = sub_1BEBE2B54;
            v75[3] = &unk_1E782EA40;
            v76 = group;
            objc_msgSend_setCompletionBlock_(v42, v47, (uint64_t)v75);
            objc_msgSend_mergeableValueDownloadTasks(self, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v50)
            {
              objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v51, v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setMergeableValueDownloadTasks_(self, v54, (uint64_t)v53);

            }
            objc_msgSend_mergeableValueDownloadTasks(self, v51, v52);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v55, v56, (uint64_t)v42, v31);

            v18 = v69;
            v17 = v71;
          }

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v77, v89, 16);
      }
      while (v17);
    }

    objc_msgSend_callbackQueue(self, v57, v58);
    v59 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEBE2B5C;
    block[3] = &unk_1E782EFD8;
    v7 = v67;
    v74 = v67;
    dispatch_group_notify(group, v59, block);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (void)_finishAllDownloadTasksWithError:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  objc_msgSend_downloadTasksByRecordID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectEnumerator(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_nextObject(v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v15 = (void *)v12;
    do
    {
      objc_msgSend_didCompleteTaskWithError_(v15, v13, (uint64_t)v22);
      objc_msgSend_nextObject(v9, v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
    while (v18);
  }
  objc_msgSend_downloadTasksByRecordID(self, v13, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v19, v20, v21);

}

- (void)_didDownloadAssetsWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0C952F8];
  if (v4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v5);
    v6 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v8 = v6;
      objc_msgSend_operationID(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v18 = 138543618;
      *(_QWORD *)&v18[4] = v11;
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v4;
      v12 = "Failed to download assets for operation %{public}@: %@";
      v13 = v8;
      v14 = 22;
LABEL_11:
      _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, v12, v18, v14);

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v5);
    v15 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v8 = v15;
      objc_msgSend_operationID(self, v16, v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v18 = 138543362;
      *(_QWORD *)&v18[4] = v11;
      v12 = "Downloaded assets for operation %{public}@";
      v13 = v8;
      v14 = 12;
      goto LABEL_11;
    }
  }
  objc_msgSend__finishAllDownloadTasksWithError_(self, v7, (uint64_t)v4, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);

}

- (void)_fetchCloudCerts
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  id obj;
  _QWORD v32[5];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  id location[4];

  location[2] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend_keyOrErrorForHostname(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    objc_initWeak(location, self);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend_keyOrErrorForHostname(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v10, v11, v12);
    obj = (id)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v34, v38, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend_stateTransitionGroup(self, v14, v15);
          v20 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v20);

          v21 = (void *)objc_opt_new();
          objc_msgSend_setTranscodeServerHostname_(v21, v22, v19);
          objc_msgSend_setType_(v21, v23, 0);
          v24 = objc_opt_class();
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = sub_1BEBE30C0;
          v32[3] = &unk_1E7835DC8;
          objc_copyWeak(&v33, location);
          v32[4] = v19;
          objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v25, v24, v21, v32);
          objc_destroyWeak(&v33);

        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v34, v38, 16);
      }
      while (v16);
    }

    objc_destroyWeak(location);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v27 = v26;
      objc_msgSend_operationID(self, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v30;
      _os_log_debug_impl(&dword_1BE990000, v27, OS_LOG_TYPE_DEBUG, "No cloud certs to download for operation %{public}@", (uint8_t *)location, 0xCu);

    }
  }
}

- (void)_downloadAssets
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t shouldCloneFileInAssetCache;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  _QWORD v68[6];
  uint8_t buf[4];
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  objc_msgSend_downloadTasksByRecordID(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v5, v6, v7);

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend_downloadTasksByRecordID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectEnumerator(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_nextObject(v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v23 = (void *)v20;
      do
      {
        objc_msgSend_assetsToDownload(v23, v21, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v9, v25, (uint64_t)v24);

        objc_msgSend_assetsToDownloadInMemory(v23, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v10, v29, (uint64_t)v28);

        objc_msgSend_assetURLInfosToFillOut(v23, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v11, v33, (uint64_t)v32);

        objc_msgSend_nextObject(v17, v34, v35);
        v36 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v36;
      }
      while (v36);
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v37 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v60 = v37;
      objc_msgSend_operationID(self, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v70 = v9;
      v71 = 2112;
      v72 = v10;
      v73 = 2112;
      v74 = v11;
      v75 = 2114;
      v76 = v63;
      _os_log_debug_impl(&dword_1BE990000, v60, OS_LOG_TYPE_DEBUG, "Downloading assets: %@, in-memory assets: %@, and publish assets %@ for operation %{public}@", buf, 0x2Au);

    }
    v38 = (void *)objc_opt_new();
    objc_msgSend_setAssetsToDownload_(v38, v39, (uint64_t)v9);
    objc_msgSend_setAssetsToDownloadInMemory_(v38, v40, (uint64_t)v10);
    objc_msgSend_setAssetURLInfosToFillOut_(v38, v41, (uint64_t)v11);
    shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v42, v43);
    objc_msgSend_setShouldCloneFileInAssetCache_(v38, v45, shouldCloneFileInAssetCache);
    v48 = objc_msgSend_fetchingAssetsForRereference(self, v46, v47);
    objc_msgSend_setFetchingAssetsForRereference_(v38, v49, v48);
    objc_msgSend_operationInfo(self, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cloneContextReturnBlock(v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCloneContextReturnBlock_(v38, v56, (uint64_t)v55);

    v57 = objc_opt_class();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = sub_1BEBE369C;
    v68[3] = &unk_1E7836FF0;
    v68[4] = self;
    v68[5] = a2;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v58, v57, v38, v68);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v59 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v64 = v59;
      objc_msgSend_operationID(self, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v67;
      _os_log_debug_impl(&dword_1BE990000, v64, OS_LOG_TYPE_DEBUG, "No assets to download for operation %{public}@", buf, 0xCu);

    }
  }
}

- (void)_downloadMergeableValues
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend_mergeableValueDownloadTasks(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  v8 = (void *)*MEMORY[0x1E0C952F8];
  if (v7)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v8);
    v9 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v24 = v9;
      objc_msgSend_operationID(self, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v27;
      _os_log_debug_impl(&dword_1BE990000, v24, OS_LOG_TYPE_DEBUG, "Will download mergeable values for operation %{public}@", (uint8_t *)location, 0xCu);

    }
    objc_msgSend_stateTransitionGroup(self, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v12);

    objc_initWeak(location, self);
    v13 = (void *)objc_opt_new();
    objc_msgSend_mergeableValueDownloadTasks(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMergeableValueIDs_(v13, v20, (uint64_t)v19);

    v21 = objc_opt_class();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1BEBE4814;
    v32[3] = &unk_1E7835D38;
    objc_copyWeak(&v33, location);
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v22, v21, v13, v32);
    objc_destroyWeak(&v33);

    objc_destroyWeak(location);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v8);
    v23 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v28 = v23;
      objc_msgSend_operationID(self, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v31;
      _os_log_debug_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEBUG, "No mergeable values to download for operation %{public}@", (uint8_t *)location, 0xCu);

    }
  }
}

- (void)finishWithError:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend__finishAllDownloadTasksWithError_(self, v5, (uint64_t)v4);
  objc_msgSend_hash(self, v6, v7);
  kdebug_trace();
  v8.receiver = self;
  v8.super_class = (Class)CKDFetchRecordsOperation;
  -[CKDOperation finishWithError:](&v8, sel_finishWithError_, v4);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  objc_super v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend_recordIDsToFetch(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v26, v30, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v8);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v15), v11, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v5, v17, (uint64_t)v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v26, v30, 16);
    }
    while (v13);
  }

  if (objc_msgSend_count(v5, v18, v19))
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1BEBE51E4;
    v24[3] = &unk_1E78305B0;
    v25 = v5;
    objc_msgSend_updateCloudKitMetrics_(self, v21, (uint64_t)v24);

  }
  objc_msgSend_setRecordFetchProgressBlock_(self, v20, 0);
  objc_msgSend_setRecordFetchCompletionBlock_(self, v22, 0);
  v23.receiver = self;
  v23.super_class = (Class)CKDFetchRecordsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v23, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)main
{
  uint64_t v2;
  _QWORD *v4;
  os_log_t *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  os_log_t v19;
  const char *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  CKDFetchRecordsOperation *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
  v4 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (os_log_t *)MEMORY[0x1E0C952B0];
  v6 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v21 = v6;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v24, 1, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v29, 0, 1, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138544130;
    v39 = v23;
    v40 = 2048;
    v41 = self;
    v42 = 2114;
    v43 = v28;
    v44 = 2112;
    v45 = v33;
    _os_log_debug_impl(&dword_1BE990000, v21, OS_LOG_TYPE_DEBUG, "Starting fetch records operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v38,
      0x2Au);

  }
  objc_msgSend_recordIDsToFetch(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v9, v10, v11))
  {

LABEL_8:
    objc_msgSend_makeStateTransition_(self, v14, 0);
    return;
  }
  objc_msgSend_fullRecordsToFetch(self, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_count(v15, v16, v17);

  if (v18)
    goto LABEL_8;
  if (*v4 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v19 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
  {
    v34 = v19;
    objc_msgSend_operationID(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543362;
    v39 = v37;
    _os_log_debug_impl(&dword_1BE990000, v34, OS_LOG_TYPE_DEBUG, "Operation %{public}@ is finishing early because there are no records to fetch", (uint8_t *)&v38, 0xCu);

  }
  objc_msgSend_makeStateTransition_(self, v20, 1);
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (id)relevantZoneIDs
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordIDsToFetch(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v3, v4, v5))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v3;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v18, v22, 16);
    if (v9)
    {
      v12 = v9;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v7);
          objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v18 + 1) + 8 * v14), v10, v11, (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v6, v16, (uint64_t)v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v18, v22, 16);
      }
      while (v12);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)useCachedEtags
{
  return self->_useCachedEtags;
}

- (void)setUseCachedEtags:(BOOL)a3
{
  self->_useCachedEtags = a3;
}

- (BOOL)useRecordCache
{
  return self->_useRecordCache;
}

- (void)setUseRecordCache:(BOOL)a3
{
  self->_useRecordCache = a3;
}

- (BOOL)forcePCSDecrypt
{
  return self->_forcePCSDecrypt;
}

- (void)setForcePCSDecrypt:(BOOL)a3
{
  self->_forcePCSDecrypt = a3;
}

- (BOOL)skipDecryption
{
  return self->_skipDecryption;
}

- (void)setSkipDecryption:(BOOL)a3
{
  self->_skipDecryption = a3;
}

- (NSArray)fullRecordsToFetch
{
  return self->_fullRecordsToFetch;
}

- (void)setFullRecordsToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_fullRecordsToFetch, a3);
}

- (BOOL)shouldUpdateTimestampsForFetchedMergeableValues
{
  return self->_shouldUpdateTimestampsForFetchedMergeableValues;
}

- (void)setShouldUpdateTimestampsForFetchedMergeableValues:(BOOL)a3
{
  self->_shouldUpdateTimestampsForFetchedMergeableValues = a3;
}

- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier
{
  return self->_shouldRequestEncryptedAssetOwnerIdentifier;
}

- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3
{
  self->_shouldRequestEncryptedAssetOwnerIdentifier = a3;
}

- (id)recordFetchProgressBlock
{
  return self->_recordFetchProgressBlock;
}

- (void)setRecordFetchProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (id)recordFetchCommandBlock
{
  return self->_recordFetchCommandBlock;
}

- (void)setRecordFetchCommandBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (id)recordFetchCompletionBlock
{
  return self->_recordFetchCompletionBlock;
}

- (void)setRecordFetchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSArray)recordIDsToFetch
{
  return self->_recordIDsToFetch;
}

- (void)setRecordIDsToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToFetch, a3);
}

- (NSMutableDictionary)cachedRecords
{
  return self->_cachedRecords;
}

- (void)setCachedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRecords, a3);
}

- (NSSet)desiredKeySet
{
  return self->_desiredKeySet;
}

- (void)setDesiredKeySet:(id)a3
{
  objc_storeStrong((id *)&self->_desiredKeySet, a3);
}

- (NSDictionary)recordIDsToETags
{
  return self->_recordIDsToETags;
}

- (void)setRecordIDsToETags:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToETags, a3);
}

- (NSDictionary)recordIDsToVersionETags
{
  return self->_recordIDsToVersionETags;
}

- (void)setRecordIDsToVersionETags:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, a3);
}

- (NSDictionary)desiredPackageFileIndices
{
  return self->_desiredPackageFileIndices;
}

- (void)setDesiredPackageFileIndices:(id)a3
{
  objc_storeStrong((id *)&self->_desiredPackageFileIndices, a3);
}

- (OS_dispatch_group)fetchRecordsGroup
{
  return self->_fetchRecordsGroup;
}

- (void)setFetchRecordsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRecordsGroup, a3);
}

- (NSMutableDictionary)errorsByRecordID
{
  return self->_errorsByRecordID;
}

- (void)setErrorsByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_errorsByRecordID, a3);
}

- (NSMapTable)downloadTasksByRecordID
{
  return self->_downloadTasksByRecordID;
}

- (void)setDownloadTasksByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_downloadTasksByRecordID, a3);
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, a3);
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchAssetContentInMemory = a3;
}

- (BOOL)shouldFetchMergeableValues
{
  return self->_shouldFetchMergeableValues;
}

- (void)setShouldFetchMergeableValues:(BOOL)a3
{
  self->_shouldFetchMergeableValues = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (NSSet)assetFieldNamesToPublishURLs
{
  return self->_assetFieldNamesToPublishURLs;
}

- (void)setAssetFieldNamesToPublishURLs:(id)a3
{
  objc_storeStrong((id *)&self->_assetFieldNamesToPublishURLs, a3);
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

- (NSMutableArray)recordIDsToRefetch
{
  return self->_recordIDsToRefetch;
}

- (void)setRecordIDsToRefetch:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToRefetch, a3);
}

- (NSMutableDictionary)keyOrErrorForHostname
{
  return self->_keyOrErrorForHostname;
}

- (void)setKeyOrErrorForHostname:(id)a3
{
  objc_storeStrong((id *)&self->_keyOrErrorForHostname, a3);
}

- (NSMutableDictionary)shareRecordsToUpdateByRecordID
{
  return self->_shareRecordsToUpdateByRecordID;
}

- (void)setShareRecordsToUpdateByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_shareRecordsToUpdateByRecordID, a3);
}

- (NSMutableDictionary)mergeableValueDownloadTasks
{
  return self->_mergeableValueDownloadTasks;
}

- (void)setMergeableValueDownloadTasks:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableValueDownloadTasks, a3);
}

- (NSDictionary)webSharingIdentityDataByRecordID
{
  return self->_webSharingIdentityDataByRecordID;
}

- (void)setWebSharingIdentityDataByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, a3);
}

- (BOOL)shouldRollSharePCSOnFetch
{
  return self->_shouldRollSharePCSOnFetch;
}

- (void)setShouldRollSharePCSOnFetch:(BOOL)a3
{
  self->_shouldRollSharePCSOnFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, 0);
  objc_storeStrong((id *)&self->_mergeableValueDownloadTasks, 0);
  objc_storeStrong((id *)&self->_shareRecordsToUpdateByRecordID, 0);
  objc_storeStrong((id *)&self->_keyOrErrorForHostname, 0);
  objc_storeStrong((id *)&self->_recordIDsToRefetch, 0);
  objc_storeStrong((id *)&self->_assetFieldNamesToPublishURLs, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_downloadTasksByRecordID, 0);
  objc_storeStrong((id *)&self->_errorsByRecordID, 0);
  objc_storeStrong((id *)&self->_fetchRecordsGroup, 0);
  objc_storeStrong((id *)&self->_desiredPackageFileIndices, 0);
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, 0);
  objc_storeStrong((id *)&self->_recordIDsToETags, 0);
  objc_storeStrong((id *)&self->_desiredKeySet, 0);
  objc_storeStrong((id *)&self->_cachedRecords, 0);
  objc_storeStrong((id *)&self->_recordIDsToFetch, 0);
  objc_storeStrong(&self->_recordFetchCompletionBlock, 0);
  objc_storeStrong(&self->_recordFetchCommandBlock, 0);
  objc_storeStrong(&self->_recordFetchProgressBlock, 0);
  objc_storeStrong((id *)&self->_fullRecordsToFetch, 0);
  objc_storeStrong((id *)&self->_decryptOperation, 0);
}

@end
