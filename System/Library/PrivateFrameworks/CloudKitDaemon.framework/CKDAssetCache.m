@implementation CKDAssetCache

+ (id)_sharedCachesQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEB6FEE8;
  block[3] = &unk_1E7830348;
  block[4] = a1;
  if (qword_1ED700A40 != -1)
    dispatch_once(&qword_1ED700A40, block);
  return (id)qword_1ED700A38;
}

+ (id)_sharedCachesByDirectory
{
  if (qword_1ED700A50 != -1)
    dispatch_once(&qword_1ED700A50, &unk_1E78351F0);
  return (id)qword_1ED700A48;
}

+ (CKDAssetCache)assetCacheWithApplicationBundleID:(id)a3 directoryContext:(id)a4 database:(id)a5 didInit:(BOOL *)a6 error:(id *)a7
{
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v25;
  const char *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v13 = a3;
  v14 = a4;
  v17 = a5;
  if (!v13)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, a1, CFSTR("CKDAssetCache.m"), 383, CFSTR("Expected non-nil application bundle ID"));

  }
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_1BE9BB0C8;
  v48 = sub_1BE9BAE18;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1BE9BB0C8;
  v42 = sub_1BE9BAE18;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  objc_msgSend__sharedCachesQueue(CKDAssetCache, v15, v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BEB70218;
  v27[3] = &unk_1E7835218;
  v19 = v14;
  v28 = v19;
  v31 = &v44;
  v20 = v13;
  v29 = v20;
  v21 = v17;
  v30 = v21;
  v32 = &v38;
  v33 = &v34;
  dispatch_sync(v18, v27);

  if (a6)
    *a6 = *((_BYTE *)v35 + 24);
  v22 = (void *)v45[5];
  if (a7 && !v22)
  {
    *a7 = objc_retainAutorelease((id)v39[5]);
    v22 = (void *)v45[5];
  }
  v23 = v22;

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return (CKDAssetCache *)v23;
}

- (id)_initWithApplicationBundleID:(id)a3 directoryContext:(id)a4 database:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  CKDAssetCache *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  char v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  objc_class *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  int isNew;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  id v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85[2];
  objc_super v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  id v93;
  uint64_t v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v86.receiver = self;
  v86.super_class = (Class)CKDAssetCache;
  v14 = -[CKDAssetCache init](&v86, sel_init);
  if (!v14)
  {
    v25 = 0;
    v28 = 0;
    if (!a6)
      goto LABEL_21;
    goto LABEL_19;
  }
  v15 = (uint64_t)v14;
  v84 = v11;
  objc_storeStrong((id *)&v14->_directoryContext, a4);
  objc_msgSend_fileDownloadDirectory(v12, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = *MEMORY[0x1E0C947A0];
  v95[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v95, &v94, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = 0;
  v24 = CKCreateDirectoryAtPathWithAttributes();
  v25 = 0;

  if ((v24 & 1) != 0)
  {
    objc_storeStrong((id *)(v15 + 56), a3);
    if (v25)
    {
      objc_msgSend_setDidDrop_((void *)v15, v26, 1);
      v28 = 0;
      v11 = v84;
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_containerIdentifier(v12, v26, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataSeparationHash(v12, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v30, v35, (uint64_t)CFSTR("%@.%@"), v31, v34);
      v36 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)MEMORY[0x1E0C950F0];
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(v37, v40, 2, v36, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_containerID(v12, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend_specialContainerType(v44, v45, v46);
      v49 = objc_msgSend_tableGroupOptionsForContainerType_(CKDAssetCacheTableGroup, v48, v47);

      v85[0] = 0;
      objc_msgSend_tableGroupInDatabase_withName_options_error_(CKDAssetCacheTableGroup, v50, (uint64_t)v13, v41, v49, v85);
      v51 = objc_claimAutoreleasedReturnValue();
      v25 = v85[0];
      v52 = *(void **)(v15 + 32);
      *(_QWORD *)(v15 + 32) = v51;

      v55 = *(void **)(v15 + 32);
      if (v55)
      {
        isNew = objc_msgSend_isNew(v55, v53, v54);
        *(_BYTE *)(v15 + 16) = isNew;
        if (isNew)
        {
          v82 = *(void **)(v15 + 32);
          v88 = *MEMORY[0x1E0C94A60];
          objc_msgSend_mmcsWorkingDirectory(v12, v57, v58);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_path(v83, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v61;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v62, (uint64_t)&v87, 1);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v63;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v64, (uint64_t)&v89, &v88, 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (id)objc_msgSend_updateGroupData_(v82, v66, (uint64_t)v65);

        }
        objc_msgSend_assetHandleTable(*(void **)(v15 + 32), v57, v58);
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v68;

        objc_msgSend_assetVolumeTable(*(void **)(v15 + 32), v70, v71);
        v72 = objc_claimAutoreleasedReturnValue();
        v73 = *(void **)(v15 + 48);
        *(_QWORD *)(v15 + 48) = v72;
      }
      else
      {
        v73 = (void *)v15;
        v15 = 0;
      }
      v11 = v84;
      v28 = (void *)v15;

      v15 = v36;
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = v84;
    v29 = (void *)*MEMORY[0x1E0C952A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_ERROR))
    {
      v75 = v29;
      objc_msgSend_fileDownloadDirectory(v12, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKSanitizedPath(v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v91 = v81;
      v92 = 2112;
      v93 = v25;
      _os_log_error_impl(&dword_1BE990000, v75, OS_LOG_TYPE_ERROR, "Failed to create dir at %{public}@: %@", buf, 0x16u);

    }
    v28 = 0;
  }

  if (a6)
  {
LABEL_19:
    if (!v28)
      *a6 = objc_retainAutorelease(v25);
  }
LABEL_21:

  return v28;
}

- (id)mmcsEngineContext
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v12;
  const char *v13;

  objc_msgSend_MMCS(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSEngineContext(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, CFSTR("CKDAssetCache.m"), 454, CFSTR("Expected non nil CKDMMCSEngineContext"));

  }
  return v8;
}

- (NSString)fileDownloadPath
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_directoryContext(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileDownloadDirectory(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)drop
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  CKDAssetCache *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Dropping: %@", buf, 0xCu);
  }
  objc_msgSend_mmcsEngineContext(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEB709D8;
  v8[3] = &unk_1E782EA40;
  v8[4] = self;
  objc_msgSend_MMCSSerializeSyncRecursive_(v6, v7, (uint64_t)v8);

}

- (void)dealloc
{
  _QWORD *v3;
  os_log_t *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  CKDAssetCache *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = (os_log_t *)MEMORY[0x1E0C952A8];
  v5 = *MEMORY[0x1E0C952A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_debug_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEBUG, "Deallocating: %@", buf, 0xCu);
  }
  if ((objc_msgSend_didDrop(self, v6, v7) & 1) == 0)
  {
    if (*v3 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_fault_impl(&dword_1BE990000, v8, OS_LOG_TYPE_FAULT, "Failed to drop: %@", buf, 0xCu);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CKDAssetCache;
  -[CKDAssetCache dealloc](&v9, sel_dealloc);
}

- (void)_deleteAssetHandlesAndUnregisterItemsForUnmountedAssetVolumes
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  CKDAssetVolumeTable *assetVolumeTable;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  CKDAssetCache *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend_mmcsEngineContext(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assertMMCSSerialized(v5, v6, v7);

  if (objc_msgSend_didDrop(self, v8, v9))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = self;
      v19 = 2114;
      v20 = v15;
      _os_log_error_impl(&dword_1BE990000, v14, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDAssetCache _deleteAssetHandlesAndUnregisterItemsForUnmountedAssetVolumes]", "CKDAssetCache.m", 513, "0 && \"already dropped\");
  }
  assetVolumeTable = self->_assetVolumeTable;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEB71010;
  v16[3] = &unk_1E78352B0;
  v16[4] = self;
  v12 = (id)objc_msgSend_performTransaction_(assetVolumeTable, v10, (uint64_t)v16);
}

- (id)deviceIDForVolumeIndex:(id)a3
{
  void *v3;
  const char *v4;
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend_volumeUUIDWithVolumeIndex_(self->_assetVolumeTable, a2, (uint64_t)a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    if (v3)
    {
      objc_msgSend_deviceIDForVolumeUUID_(CKDVolumeManager, v4, (uint64_t)v3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v3;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)volumeIndexForDeviceID:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  CKDAssetCache *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  if (v6)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_1BE9BB0C8;
    v19 = sub_1BE9BAE18;
    v20 = 0;
    objc_msgSend_mmcsEngineContext(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1BEB71534;
    v11[3] = &unk_1E78352D8;
    v13 = self;
    v14 = &v15;
    v12 = v6;
    objc_msgSend_MMCSSerializeSyncRecursive_(v7, v8, (uint64_t)v11);

    v9 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)clearForced:(BOOL)a3
{
  void *v6;
  const char *v7;
  id v8;
  _QWORD v10[7];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1BE9BB0C8;
  v16 = sub_1BE9BAE18;
  v17 = 0;
  objc_msgSend_mmcsEngineContext(self, a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEB71694;
  v10[3] = &unk_1E7835300;
  v10[5] = &v12;
  v10[6] = a2;
  v10[4] = self;
  v11 = a3;
  objc_msgSend_MMCSSerializeSyncRecursive_(v6, v7, (uint64_t)v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)clearAssetCache
{
  uint64_t v2;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1BE9BB0C8;
  v22 = sub_1BE9BAE18;
  v23 = 0;
  objc_msgSend_mmcsEngineContext(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEB719DC;
  v17[3] = &unk_1E78315B8;
  v17[5] = &v18;
  v17[6] = a2;
  v17[4] = self;
  objc_msgSend_MMCSSerializeSyncRecursive_(v5, v6, (uint64_t)v17);

  v9 = objc_msgSend_countAssetCacheItems(self, v7, v8);
  if (v9)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = (id)*MEMORY[0x1E0C952A8];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend_purgedBytesCount((void *)v19[5], v11, v12);
      objc_msgSend_name(self->_assetCacheTableGroup, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v25 = v13;
      v26 = 2048;
      v27 = v9;
      v28 = 2114;
      v29 = v16;
      _os_log_error_impl(&dword_1BE990000, v10, OS_LOG_TYPE_ERROR, "After clearing asset cache of %lld bytes, still had %ld items remaining in %{public}@", buf, 0x20u);

    }
  }
  _Block_object_dispose(&v18, 8);

}

- (void)checkAssetHandlesForRegisteredMMCSItems:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  os_log_t *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  os_log_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  SEL v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_MMCS(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v10 = (os_log_t *)MEMORY[0x1E0C952A8];
  v11 = (void *)*MEMORY[0x1E0C952A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    objc_msgSend_path(v8, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v15;
    _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "----\nChunk Registry Report for %{public}@", buf, 0xCu);

    if (*v9 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  }
  v16 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v16, OS_LOG_TYPE_INFO, "itemID, file signature, status", buf, 2u);
  }
  objc_msgSend_MMCSEngineContext(v8, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BEB71FA0;
  v27[3] = &unk_1E7830158;
  v27[4] = self;
  v29 = a2;
  v20 = v5;
  v28 = v20;
  objc_msgSend_MMCSSerializeSyncRecursive_(v19, v21, (uint64_t)v27);

  if (*v9 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v22 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    v23 = v22;
    objc_msgSend_path(v8, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v26;
    _os_log_impl(&dword_1BE990000, v23, OS_LOG_TYPE_INFO, "End Chunk Registry Report for %{public}@\n----", buf, 0xCu);

  }
}

- (unint64_t)countAssetCacheItems
{
  return MEMORY[0x1E0DE7D20](self->_assetHandleTable, sel_count_, 0);
}

- (void)showAssetCacheInContainer:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v5 = a3;
  objc_msgSend_mmcsEngineContext(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BEB724E0;
  v11[3] = &unk_1E7830158;
  v12 = v5;
  v13 = a2;
  v11[4] = self;
  v9 = v5;
  objc_msgSend_MMCSSerializeSyncRecursive_(v8, v10, (uint64_t)v11);

}

- (void)unregisterItemsAndDeleteUnregisteredAssetHandlesWithIDs:(id)a3 deleteUnregisteredAssetHandlesWithIDs:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  CKDAssetHandleTable *assetHandleTable;
  id v24;
  const char *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  CKDAssetCache *v31;
  id v32;
  id v33;

  v27 = a3;
  v6 = a4;
  objc_msgSend_mmcsEngineContext(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assertMMCSSerialized(v9, v10, v11);

  objc_msgSend_MMCS(self, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    __assert_rtn("-[CKDAssetCache unregisterItemsAndDeleteUnregisteredAssetHandlesWithIDs:deleteUnregisteredAssetHandlesWithIDs:]", "CKDAssetCache.m", 770, "MMCS && \"nil MMCS object\");
  v17 = (void *)v14;
  if (objc_msgSend_count(v27, v15, v16))
  {
    objc_msgSend_array(v27, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unregisterItemIDs_(v17, v21, (uint64_t)v20);

LABEL_5:
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetHandleTable = self->_assetHandleTable;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1BEB73540;
    v28[3] = &unk_1E78353D0;
    v29 = &unk_1E78AF360;
    v30 = v22;
    v31 = self;
    v32 = v27;
    v33 = v6;
    v24 = v22;
    v26 = (id)objc_msgSend_performTransaction_(assetHandleTable, v25, (uint64_t)v28);

    goto LABEL_6;
  }
  if (objc_msgSend_count(v6, v18, v19))
    goto LABEL_5;
LABEL_6:

}

- (void)unregisterItemIDsAndDeleteAssetHandlesWithEvictionInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v4 = a3;
  objc_msgSend_itemIDsToUnregister(v4, v5, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetHandleItemIDsToDelete(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_unregisterItemsAndDeleteUnregisteredAssetHandlesWithIDs_deleteUnregisteredAssetHandlesWithIDs_(self, v10, (uint64_t)v11, v9);
}

- (id)_saveData:(id)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  id v9;
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
  void *v21;
  const char *v22;
  char v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, self, CFSTR("CKDAssetCache.m"), 822, CFSTR("Expected non-nil data"));

  }
  objc_msgSend_MMCS(self, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_temporaryDirectory(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v13, v20, (uint64_t)v19, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 1000, CFSTR("Invalid path"));
      v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    v26 = 0;
    goto LABEL_16;
  }
  v38 = 0;
  v23 = objc_msgSend_writeToURL_options_error_(v9, v22, (uint64_t)v21, 0, &v38);
  v24 = v38;
  v25 = v24;
  if ((v23 & 1) == 0)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v24);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = (void *)*MEMORY[0x1E0C952A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_ERROR))
    {
      v29 = v27;
      v32 = objc_msgSend_length(v9, v30, v31);
      objc_msgSend_CKSanitizedPath(v21, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v40 = v32;
      v41 = 2114;
      v42 = v35;
      v43 = 2112;
      v44 = v25;
      _os_log_error_impl(&dword_1BE990000, v29, OS_LOG_TYPE_ERROR, "Can't create temp file for data(length:%lu) at %{public}@: %@", buf, 0x20u);

    }
    goto LABEL_15;
  }
  v26 = v21;

LABEL_16:
  return v26;
}

- (id)_getAssetHandlesForCachedButNotRegisteredMMCSItems:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  char v47;
  void *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  void *v59;
  void *v60;
  const char *v61;
  void *v62;
  id v63;
  const char *v64;
  CKDAssetHandle *v65;
  const char *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  int isEqualToData;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  NSObject *v127;
  void *v128;
  uint64_t v129;
  const char *v130;
  void *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  void *v139;
  const char *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  const char *v148;
  void *v149;
  const char *v150;
  void *v151;
  const char *v152;
  id *v154;
  id obj;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  id v160;
  id v161;
  id v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  uint8_t buf[4];
  void *v168;
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v149, v150, (uint64_t)a2, self, CFSTR("CKDAssetCache.m"), 840, CFSTR("Expected non-nil MMCS items array"));

  }
  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v11 = objc_msgSend_count(v7, v9, v10);
  v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  v14 = v7;
  v158 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v163, v169, 16);
  if (!v158)
  {
    v49 = 0;
    v144 = v14;
    goto LABEL_48;
  }
  v154 = a4;
  v18 = 0;
  v157 = *(_QWORD *)v164;
  obj = v14;
  v156 = (void *)v13;
LABEL_5:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v164 != v157)
      objc_enumerationMutation(obj);
    v20 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * v19);
    objc_msgSend_error(v20, v16, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend_error(v20, v22, v23);
      v49 = objc_claimAutoreleasedReturnValue();

      goto LABEL_45;
    }
    objc_msgSend_signature(v20, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v25, v26);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v139, v140, (uint64_t)a2, self, CFSTR("CKDAssetCache.m"), 853, CFSTR("Expected non-nil signature for %@"), v20);

    }
    objc_msgSend_fileURL(v20, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_fileSize(v20, v28, v29))
      break;
    objc_msgSend_fileURL(v20, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v32;
LABEL_17:
    v49 = (uint64_t)v18;
LABEL_18:
    objc_msgSend_fileURL(v20, v33, v34);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v51, v52);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v141, v142, (uint64_t)a2, self, CFSTR("CKDAssetCache.m"), 876, CFSTR("Expected non-nil fileURL for %@"), v20);

    }
    if (objc_msgSend_itemID(v20, v51, v52))
    {
      v55 = (void *)MEMORY[0x1E0CB37E8];
      v56 = objc_msgSend_itemID(v20, v53, v54);
      objc_msgSend_numberWithUnsignedLongLong_(v55, v57, v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = 0;
    }
    v59 = (void *)MEMORY[0x1E0C94BB8];
    objc_msgSend_path(v27, v53, v54);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = (id)v49;
    objc_msgSend_getFileMetadataAtPath_error_(v59, v61, (uint64_t)v60, &v161);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v161;

    if (!v62)
    {
      objc_msgSend_setError_(v20, v64, (uint64_t)v63);

      v49 = (uint64_t)v63;
      goto LABEL_45;
    }
    v160 = v63;
    v65 = [CKDAssetHandle alloc];
    v67 = (void *)objc_msgSend_initWithItemID_UUID_path_(v65, v66, (uint64_t)v58, 0, 0);
    objc_msgSend_deviceID(v62, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_volumeIndexForDeviceID_(self, v71, (uint64_t)v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVolumeIndex_(v67, v73, (uint64_t)v72);

    objc_msgSend_fileID(v62, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFileID_(v67, v77, (uint64_t)v76);

    objc_msgSend_generationID(v62, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGenerationID_(v67, v81, (uint64_t)v80);

    objc_msgSend_signature(v20, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFileSignature_(v67, v85, (uint64_t)v84);

    objc_msgSend_modTimeInSeconds(v62, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v88;
    if (v88)
    {
      v92 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend_doubleValue(v88, v89, v90);
      objc_msgSend_dateWithTimeIntervalSince1970_(v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setModTime_(v67, v96, (uint64_t)v95);

    }
    objc_msgSend_fileSize(v62, v89, v90);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFileSize_(v67, v98, (uint64_t)v97);

    objc_msgSend_boundaryKey(v20, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBoundaryKeyHashUsingBoundaryKey_(v67, v102, (uint64_t)v101);

    objc_msgSend_signature(v20, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zeroSizeFileSignature(CKDMMCS, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v105, v109, (uint64_t)v108);

    if ((isEqualToData & 1) != 0
      || !objc_msgSend_chunkCount(v20, v111, v112)
      || (objc_msgSend_fileSize(v62, v111, v112),
          v113 = (void *)objc_claimAutoreleasedReturnValue(),
          v116 = objc_msgSend_unsignedLongLongValue(v113, v114, v115),
          v113,
          !v116))
    {
      v117 = (void *)MEMORY[0x1E0C95138];
      objc_msgSend_signature(v20, v111, v112);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v117) = objc_msgSend_isValidV2Signature_(v117, v119, (uint64_t)v118);

      if (((v117 | isEqualToData) & 1) == 0)
        __assert_rtn("-[CKDAssetCache _getAssetHandlesForCachedButNotRegisteredMMCSItems:error:]", "CKDAssetCache.m", 903, "isZeroFileSignature && \"Expected zeroSizeFileSignature\");
      if (objc_msgSend_chunkCount(v20, v120, v121))
        __assert_rtn("-[CKDAssetCache _getAssetHandlesForCachedButNotRegisteredMMCSItems:error:]", "CKDAssetCache.m", 905, "MMCSItem.chunkCount == 0 && \"Expected MMCSItem.chunkCount == 0\");
      objc_msgSend_fileSize(v62, v122, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_unsignedLongLongValue(v124, v125, v126))
        __assert_rtn("-[CKDAssetCache _getAssetHandlesForCachedButNotRegisteredMMCSItems:error:]", "CKDAssetCache.m", 906, "fileMetadata.fileSize.unsignedLongLongValue == 0 && \"Expected fileMetadata.fileSize.unsignedLongLongValue == 0\");

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v127 = *MEMORY[0x1E0C952A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v168 = v58;
        _os_log_debug_impl(&dword_1BE990000, v127, OS_LOG_TYPE_DEBUG, "Zero-length asset with itemID %{public}@", buf, 0xCu);
      }
    }
    v128 = (void *)MEMORY[0x1E0CB37E8];
    v129 = objc_msgSend_chunkCount(v20, v111, v112);
    objc_msgSend_numberWithUnsignedInt_(v128, v130, v129);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setChunkCount_(v67, v132, (uint64_t)v131);

    objc_msgSend_setStatus_(v67, v133, (uint64_t)&unk_1E78B0268);
    v13 = (uint64_t)v156;
    objc_msgSend_addObject_(v156, v134, (uint64_t)v67);

    ++v19;
    v18 = v160;
    if (v158 == v19)
    {
      v14 = obj;
      v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v163, v169, 16);
      v158 = v143;
      if (!v143)
      {
        v144 = obj;
        v49 = (uint64_t)v160;
        goto LABEL_48;
      }
      goto LABEL_5;
    }
  }
  v35 = (void *)MEMORY[0x1E0C95138];
  objc_msgSend_signature(v20, v30, v31);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isValidV2Signature_(v35, v37, (uint64_t)v36))
  {

  }
  else
  {
    objc_msgSend_signature(v20, v38, v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zeroSizeFileSignature(CKDMMCS, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_isEqualToData_(v42, v46, (uint64_t)v45);

    if ((v47 & 1) == 0)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v40, *MEMORY[0x1E0C94B20], 1000, CFSTR("Invalid signature for zero size file"));
      v49 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_setError_(v20, v148, v49);
      goto LABEL_45;
    }
  }
  objc_msgSend_fileURL(v20, v40, v41);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
    goto LABEL_17;
  objc_msgSend_data(MEMORY[0x1E0C99D50], v33, v34);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v18;
  objc_msgSend__saveData_error_(self, v136, (uint64_t)v135, &v162);
  v137 = objc_claimAutoreleasedReturnValue();
  v49 = (uint64_t)v162;

  if (v137)
  {
    objc_msgSend_setFileURL_(v20, v138, v137);
    v27 = (void *)v137;
    goto LABEL_18;
  }
  objc_msgSend_setError_(v20, v138, v49);
LABEL_45:
  v14 = obj;

  if (v154)
  {
    v49 = (uint64_t)objc_retainAutorelease((id)v49);
    *v154 = (id)v49;
  }
  v144 = (void *)v13;
  v13 = 0;
LABEL_48:

  if (!(v13 | v49))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v145, v146);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v151, v152, (uint64_t)a2, self, CFSTR("CKDAssetCache.m"), 919, CFSTR("Expected non-nil error"));

  }
  return (id)v13;
}

- (id)updateAssetHandlesForRegisteredMMCSItems:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  SEL v21;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend_mmcsEngineContext(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEB74604;
  v17[3] = &unk_1E78353F8;
  v20 = v8;
  v21 = a2;
  v17[4] = self;
  v18 = v6;
  v19 = v7;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  objc_msgSend_MMCSSerializeSyncRecursive_(v11, v15, (uint64_t)v17);

  return 0;
}

- (id)updateAssetHandlesForChunkedMMCSItems:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v13[5];
  id v14;
  SEL v15;

  v6 = a3;
  objc_msgSend_mmcsEngineContext(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEB75098;
  v13[3] = &unk_1E7830158;
  v14 = v6;
  v15 = a2;
  v13[4] = self;
  v10 = v6;
  objc_msgSend_MMCSSerializeSyncRecursive_(v9, v11, (uint64_t)v13);

  return 0;
}

- (id)clonedFileCache
{
  uint64_t v2;
  CKDClonedFileCache *clonedFileCache;
  void *v5;
  const char *v6;
  void *v7;
  CKDClonedFileCache *v8;
  const char *v9;
  CKDClonedFileCache *v10;
  CKDClonedFileCache *v11;

  clonedFileCache = self->_clonedFileCache;
  if (!clonedFileCache)
  {
    objc_msgSend_mmcsWorkingDirectory(self->_directoryContext, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v5, v6, (uint64_t)CFSTR("ClonedFiles"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [CKDClonedFileCache alloc];
    v10 = (CKDClonedFileCache *)objc_msgSend_initWithCacheDirectory_limit_(v8, v9, (uint64_t)v7, 10000);
    v11 = self->_clonedFileCache;
    self->_clonedFileCache = v10;

    clonedFileCache = self->_clonedFileCache;
  }
  return clonedFileCache;
}

- (BOOL)updateAssetHandlesForGetMMCSItems:(id)a3 cloneItems:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, uint64_t);
  void *v24;
  CKDAssetCache *v25;
  id v26;
  id v27;
  id v28;
  SEL v29;
  BOOL v30;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_msgSend_mmcsEngineContext(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = sub_1BEB754A4;
  v24 = &unk_1E7835458;
  v28 = v10;
  v29 = a2;
  v25 = self;
  v26 = v8;
  v30 = a4;
  v27 = v9;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  objc_msgSend_MMCSSerializeSyncRecursive_(v13, v17, (uint64_t)&v21);

  objc_msgSend__scheduleEvictionForDownloadedFiles(self, v18, v19, v21, v22, v23, v24, v25);
  return 1;
}

- (BOOL)updateAssetHandlesForPutMMCSItems:(id)a3 cloneItems:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, uint64_t);
  void *v24;
  CKDAssetCache *v25;
  id v26;
  id v27;
  id v28;
  SEL v29;
  BOOL v30;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_msgSend_mmcsEngineContext(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = sub_1BEB7610C;
  v24 = &unk_1E7835458;
  v28 = v10;
  v29 = a2;
  v25 = self;
  v26 = v8;
  v30 = a4;
  v27 = v9;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  objc_msgSend_MMCSSerializeSyncRecursive_(v13, v17, (uint64_t)&v21);

  objc_msgSend__scheduleEvictionForDownloadedFiles(self, v18, v19, v21, v22, v23, v24, v25);
  return 1;
}

- (id)trackCachedButNotRegisteredMMCSItems:(id)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  SEL v46;
  id obj;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, (uint64_t)a2, self, CFSTR("CKDAssetCache.m"), 1197, CFSTR("Expected non-nil cached but not registered MMCS items"));

  }
  objc_msgSend_fileDownloadPath(self, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, self, CFSTR("CKDAssetCache.m"), 1198, CFSTR("Expected non-nil file download path"));

  }
  if (objc_msgSend_count(v9, v11, v12))
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = sub_1BE9BB0C8;
    v52 = sub_1BE9BAE18;
    v53 = 0;
    obj = 0;
    objc_msgSend__getAssetHandlesForCachedButNotRegisteredMMCSItems_error_(self, v13, (uint64_t)v9, &obj);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v53, obj);
    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0C99E08]);
      v18 = objc_msgSend_count(v9, v16, v17);
      v20 = (void *)objc_msgSend_initWithCapacity_(v15, v19, v18);
      objc_msgSend_mmcsEngineContext(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = sub_1BEB76A28;
      v41[3] = &unk_1E78354A8;
      v41[4] = self;
      v45 = &v48;
      v46 = a2;
      v42 = v14;
      v24 = v9;
      v43 = v24;
      v25 = v20;
      v44 = v25;
      objc_msgSend_MMCSSerializeSyncRecursive_(v23, v26, (uint64_t)v41);

      v28 = (void *)v49[5];
      if (v28)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v28);

        v24 = 0;
      }
      else
      {
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v25, v27, (uint64_t)&unk_1E78354E8);
      }
      objc_msgSend__scheduleEvictionForDownloadedFiles(self, v29, v30);
      if (!v24 && !v49[5])
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v32, v33);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, self, CFSTR("CKDAssetCache.m"), 1291, CFSTR("Expected non-nil error"));

      }
      v9 = v24;

      v31 = v9;
    }
    else
    {
      v31 = 0;
      if (a4)
        *a4 = objc_retainAutorelease((id)v49[5]);
    }

    _Block_object_dispose(&v48, 8);
  }
  else
  {
    v9 = v9;
    v31 = v9;
  }

  return v31;
}

- (id)trackDownloadedData:(id)a3 signature:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  void *v11;
  CKDMMCSItem *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend__saveData_error_(self, v10, (uint64_t)v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc_init(CKDMMCSItem);
    objc_msgSend_setFileURL_(v12, v13, (uint64_t)v11);
    objc_msgSend_setSignature_(v12, v14, (uint64_t)v9);
    v17 = objc_msgSend_length(v8, v15, v16);
    objc_msgSend_setFileSize_(v12, v18, v17);
    v35[0] = v12;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v35, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trackCachedButNotRegisteredMMCSItems_error_(self, v21, (uint64_t)v20, a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22
      || (objc_msgSend_fileURL(v12, v23, v24), (v27 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v28 = (void *)v27,
          objc_msgSend_trackingUUID(v12, v23, v24),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          v29,
          v28,
          v29))
    {
      objc_msgSend_firstObject(v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v23, v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileURL(v12, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeItemAtURL_error_(v30, v34, (uint64_t)v33, 0);

      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)enumerateAssetHandlesSegregatedByVolume:(id)a3 block:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  id v29;
  id v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  const char *v45;
  unint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  const char *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  void (**v65)(id, void *, id);
  uint8_t buf[16];

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  objc_msgSend_objectAtIndex_(v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_volumeIndex(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_count(v7, v14, v15);
  if (v16 == 1)
  {
    v8[2](v8, v13, v7);
  }
  else
  {
    v19 = v16;
    if (v16)
    {
      v20 = 0;
      v21 = 1;
      while (1)
      {
        v22 = v20;
        objc_msgSend_objectAtIndex_(v7, v17, v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_volumeIndex(v20, v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v13 != 0) == (v26 == 0) || v13 && !objc_msgSend_isEqualToNumber_(v13, v25, (uint64_t)v26))
          break;

        if (v19 == ++v21)
          goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, CFSTR("CKDAssetCache.m"), 1319, CFSTR("no asset handles"));
      v20 = 0;
      v21 = 1;
    }

    if (v21 == v19)
    {
LABEL_12:
      v8[2](v8, v13, v7);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v28 = *MEMORY[0x1E0C952A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEBUG, "Asset handles span multiple volumnes", buf, 2u);
      }
      v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend_replaceObjectsInRange_withObjectsFromArray_range_(v30, v31, 0, 0, v7, 0, v21);
      v62 = v30;
      v63 = v10;
      if (v13)
      {
        objc_msgSend_setObject_forKey_(v29, v32, (uint64_t)v30, v13);
      }
      else
      {
        objc_msgSend_null(MEMORY[0x1E0C99E38], v32, v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v29, v36, (uint64_t)v30, v35);

      }
      objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v34, (uint64_t)v20);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_volumeIndex(v20, v38, v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_msgSend_setObject_forKey_(v29, v40, (uint64_t)v37, v42);
      }
      else
      {
        objc_msgSend_null(MEMORY[0x1E0C99E38], v40, v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v29, v44, (uint64_t)v37, v43);

      }
      v46 = v21 + 1;
      if (v46 < v19)
      {
        do
        {
          objc_msgSend_objectAtIndex_(v7, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_volumeIndex(v47, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v50;
          if (v50)
          {
            v54 = v50;
          }
          else
          {
            objc_msgSend_null(MEMORY[0x1E0C99E38], v51, v52);
            v54 = (id)objc_claimAutoreleasedReturnValue();
          }
          v55 = v54;

          objc_msgSend_objectForKey_(v29, v56, (uint64_t)v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v57)
          {
            v59 = v57;
            objc_msgSend_addObject_(v57, v58, (uint64_t)v47);
          }
          else
          {
            objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v58, (uint64_t)v47);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v29, v60, (uint64_t)v59, v55);
          }

          ++v46;
        }
        while (v19 != v46);
      }
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = sub_1BEB7787C;
      v64[3] = &unk_1E7835510;
      v65 = v8;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v29, v61, (uint64_t)v64);

      v10 = v63;
    }

  }
}

- (id)existingEntriesForRegisterOrPutHandles:(id)a3 volumeIndex:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  CKDAssetHandleTable *assetHandleTable;
  id v34;
  const char *v35;
  void *v36;
  id v37;
  id v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  CKDAssetCache *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _QWORD v68[2];
  _QWORD v69[2];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v37 = 0;
    goto LABEL_26;
  }
  v54 = self;
  v8 = objc_alloc(MEMORY[0x1E0C99E20]);
  v11 = objc_msgSend_count(v6, v9, v10);
  v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v56 = v6;
  v14 = v6;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v63, v70, 16);
  if (!v16)
    goto LABEL_14;
  v19 = v16;
  v20 = *(_QWORD *)v64;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v64 != v20)
        objc_enumerationMutation(v14);
      v22 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
      objc_msgSend_volumeIndex(v22, v17, v18);
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        objc_msgSend_fileID(v22, v17, v18);
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v28 = (void *)v25;
          objc_msgSend_generationID(v22, v26, v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v29)
            continue;
          objc_msgSend_fileID(v22, v17, v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v13, v30, (uint64_t)v24);
        }

      }
    }
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v63, v70, 16);
  }
  while (v19);
LABEL_14:

  v68[0] = CFSTR("VOL");
  v68[1] = CFSTR("STATUS");
  v69[0] = v7;
  v69[1] = &unk_1E78B0298;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)v69, v68, 2);
  v32 = objc_claimAutoreleasedReturnValue();
  assetHandleTable = v54->_assetHandleTable;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = sub_1BEB77BFC;
  v61[3] = &unk_1E782E6A8;
  v34 = v13;
  v62 = v34;
  v55 = (void *)v32;
  objc_msgSend_entriesWithValues_label_error_setupBlock_(assetHandleTable, v35, v32, 0, 0, v61);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v38 = v36;
  v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v57, v67, 16);
  if (v40)
  {
    v43 = v40;
    v44 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v58 != v44)
          objc_enumerationMutation(v38);
        v46 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        objc_msgSend_fileID(v46, v41, v42);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v37, v48, (uint64_t)v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          v51 = v49;
          objc_msgSend_addObject_(v49, v50, (uint64_t)v46);
        }
        else
        {
          objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v50, (uint64_t)v46);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v37, v52, (uint64_t)v51, v47);
        }

      }
      v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v57, v67, 16);
    }
    while (v43);
  }

  v6 = v56;
LABEL_26:

  return v37;
}

- (BOOL)startTrackingRegisterOrPutAssetHandles:(id)a3 operationType:(int64_t)a4 error:(id *)a5
{
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  BOOL v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  SEL v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1BE9BB0C8;
  v37 = sub_1BE9BAE18;
  v38 = 0;
  v10 = a4 == 6;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  objc_msgSend_mmcsEngineContext(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1BEB77F6C;
  v26[3] = &unk_1E7835588;
  v26[4] = self;
  v31 = a2;
  v16 = v9;
  v27 = v16;
  v30 = &v33;
  v32 = v10;
  v17 = v11;
  v28 = v17;
  v18 = v12;
  v29 = v18;
  objc_msgSend_MMCSSerializeSyncRecursive_(v15, v19, (uint64_t)v26);

  v20 = (void *)v34[5];
  if (v20)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v20);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = *MEMORY[0x1E0C952A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_ERROR))
    {
      v22 = v34[5];
      *(_DWORD *)buf = 138412546;
      v40 = v16;
      v41 = 2112;
      v42 = v22;
      _os_log_error_impl(&dword_1BE990000, v21, OS_LOG_TYPE_ERROR, "Failed to start tracking asset handles %@: %@", buf, 0x16u);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = *MEMORY[0x1E0C952A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v16;
      _os_log_debug_impl(&dword_1BE990000, v23, OS_LOG_TYPE_DEBUG, "Started tracking register/put asset handles %@", buf, 0xCu);
    }
  }
  v24 = v34[5] == 0;

  _Block_object_dispose(&v33, 8);
  return v24;
}

- (BOOL)startTrackingGetAssetHandles:(id)a3 operationType:(int64_t)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  BOOL v18;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  SEL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1BE9BB0C8;
  v28 = sub_1BE9BAE18;
  v29 = 0;
  objc_msgSend_mmcsEngineContext(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1BEB78998;
  v20[3] = &unk_1E7835610;
  v22 = &v24;
  v23 = a2;
  v20[4] = self;
  v12 = v8;
  v21 = v12;
  objc_msgSend_MMCSSerializeSyncRecursive_(v11, v13, (uint64_t)v20);

  v14 = (void *)v25[5];
  if (v14)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v14);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = *MEMORY[0x1E0C952A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_ERROR))
    {
      v16 = v25[5];
      *(_DWORD *)buf = 138412546;
      v31 = v12;
      v32 = 2112;
      v33 = v16;
      _os_log_error_impl(&dword_1BE990000, v15, OS_LOG_TYPE_ERROR, "Failed to start tracking asset handles %@: %@", buf, 0x16u);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = *MEMORY[0x1E0C952A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v12;
      _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Started tracking get asset handles %@", buf, 0xCu);
    }
  }
  v18 = v25[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v18;
}

- (void)updateLastAccessTimeForUUID:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v7 = a3;
  if (v7)
  {
    objc_msgSend_mmcsEngineContext(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1BEB78F30;
    v10[3] = &unk_1E7830158;
    v10[4] = self;
    v12 = a2;
    v11 = v7;
    objc_msgSend_MMCSSerializeSyncRecursive_(v8, v9, (uint64_t)v10);

  }
}

- (void)stopTrackingAssetHandlesByItemIDs:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t i;
  const char *v25;
  CKDAssetCache *v26;
  const char *v27;
  _QWORD v28[5];
  id v29;
  _QWORD *v30;
  SEL v31;
  _QWORD v32[5];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend_count(v5, v6, v7))
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = sub_1BE9BB0C8;
    v32[4] = sub_1BE9BAE18;
    v33 = 0;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = (id)*MEMORY[0x1E0C952A8];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v13 = v5;
      objc_msgSend_string(MEMORY[0x1E0CB37A0], v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v16, v17, (uint64_t)CFSTR("("));
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v18 = v13;
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v34, v40, 16);
      v26 = self;
      v27 = a2;
      if (v21)
      {
        v22 = *(_QWORD *)v35;
        v23 = 1;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v18);
            if ((v23 & 1) != 0)
              objc_msgSend_appendFormat_(v16, v20, (uint64_t)CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
            else
              objc_msgSend_appendFormat_(v16, v20, (uint64_t)CFSTR(", %@"), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
            v23 = 0;
          }
          v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v34, v40, 16);
          v23 = 0;
        }
        while (v21);
      }

      self = v26;
      a2 = v27;
      objc_msgSend_appendString_(v16, v25, (uint64_t)CFSTR(")"));

      *(_DWORD *)buf = 138543362;
      v39 = v16;
      _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "Stopping tracking asset handles for itemIDs %{public}@", buf, 0xCu);

    }
    objc_msgSend_mmcsEngineContext(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1BEB793FC;
    v28[3] = &unk_1E7835610;
    v28[4] = self;
    v31 = a2;
    v29 = v5;
    v30 = v32;
    objc_msgSend_MMCSSerializeSyncRecursive_(v11, v12, (uint64_t)v28);

    _Block_object_dispose(v32, 8);
  }

}

- (id)findAssetHandleForItemID:(unint64_t)a3 error:(id *)a4
{
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[9];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1BE9BB0C8;
  v29 = sub_1BE9BAE18;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1BE9BB0C8;
  v23 = sub_1BE9BAE18;
  v24 = 0;
  objc_msgSend_mmcsEngineContext(self, a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEB7991C;
  v18[3] = &unk_1E7835650;
  v18[4] = self;
  v18[5] = &v25;
  v18[7] = a2;
  v18[8] = a3;
  v18[6] = &v19;
  objc_msgSend_MMCSSerializeSyncRecursive_(v8, v9, (uint64_t)v18);

  v12 = (void *)v26[5];
  if (!v12
    || (objc_msgSend_UUID(v12, v10, v11), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    if (v20[5])
    {
      if (a4)
      {
LABEL_6:
        v14 = 0;
        *a4 = objc_retainAutorelease((id)v20[5]);
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 3002, CFSTR("couldn't find item ID %llu"), a3);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v20[5];
      v20[5] = v15;

      if (a4)
        goto LABEL_6;
    }
    v14 = 0;
    goto LABEL_9;
  }
  v14 = (id)v26[5];
LABEL_9:
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

- (BOOL)parseCachedPath:(id)a3 assetHandleUUIDString:(id *)a4 assetSignatureString:(id *)a5
{
  id v8;
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
  char isEqualToString;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  int v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  id v37;
  BOOL v38;
  void *v39;
  void *v40;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_lastPathComponent(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingLastPathComponent(v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileDownloadPath(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v17, v18, (uint64_t)v14);

  if ((isEqualToString & 1) == 0)
  {
    objc_msgSend_fileDownloadPath(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByStandardizingPath(v14, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_isEqualToString_(v22, v26, (uint64_t)v25);

    if (!v27)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v40 = (void *)*MEMORY[0x1E0C952A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_ERROR))
      {
        v46 = v40;
        objc_msgSend_CKSanitizedPath(v8, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileDownloadPath(self, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKSanitizedPath(v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 138543618;
        v57 = v49;
        v58 = 2114;
        v59 = v55;
        _os_log_error_impl(&dword_1BE990000, v46, OS_LOG_TYPE_ERROR, "Attempt to find asset by path that is not in the asset cache fileDownloadPath %{public}@ vs. %{public}@", (uint8_t *)&v56, 0x16u);

      }
      goto LABEL_20;
    }
  }
  objc_msgSend_zeroSizeFileSignature(CKDMMCS, v20, v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 2 * objc_msgSend_length(v28, v29, v30) + 37;
  if (v31 != objc_msgSend_length(v11, v32, v33))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v39 = (void *)*MEMORY[0x1E0C952A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_ERROR))
    {
      v42 = v39;
      objc_msgSend_CKSanitizedPath(v8, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 138543362;
      v57 = v45;
      _os_log_error_impl(&dword_1BE990000, v42, OS_LOG_TYPE_ERROR, "Attempt to find asset by path that is not parsable %{public}@", (uint8_t *)&v56, 0xCu);

    }
LABEL_20:
    v38 = 0;
    v35 = 0;
    v37 = 0;
    goto LABEL_21;
  }
  objc_msgSend_substringToIndex_(v11, v34, 36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringFromIndex_(v11, v36, 37);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  if (v35 && v37)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v35);
    if (a5)
    {
      v37 = objc_retainAutorelease(v37);
      *a5 = v37;
    }
    v38 = 1;
  }
LABEL_21:

  return v38;
}

- (BOOL)parseCachedPath:(id)a3 assetHandleUUID:(id *)a4 assetSignature:(id *)a5
{
  int v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  id v18;
  id v20;
  id v21;

  v20 = 0;
  v21 = 0;
  v7 = objc_msgSend_parseCachedPath_assetHandleUUIDString_assetSignatureString_(self, a2, (uint64_t)a3, &v21, &v20);
  v8 = v21;
  v9 = v20;
  v10 = v9;
  v11 = 0;
  if (v7)
  {
    if (v8 && v9 != 0)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v15 = (id)objc_msgSend_initWithUUIDString_(v13, v14, (uint64_t)v8);
      objc_msgSend_CKDataWithHexString_stringIsUppercase_(MEMORY[0x1E0C99D50], v16, (uint64_t)v10, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (id)v17;
      v11 = 0;
      if (a5 && a4 && v15 && v17)
      {
        v15 = objc_retainAutorelease(v15);
        *a4 = v15;
        v18 = objc_retainAutorelease(v18);
        *a5 = v18;
        v11 = 1;
      }

    }
  }

  return v11;
}

- (id)assetHandleWithCachedPath:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  SEL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1BE9BB0C8;
  v21 = sub_1BE9BAE18;
  v22 = 0;
  objc_msgSend_mmcsEngineContext(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEB7A130;
  v13[3] = &unk_1E7835610;
  v13[4] = self;
  v16 = a2;
  v9 = v5;
  v14 = v9;
  v15 = &v17;
  objc_msgSend_MMCSSerializeSyncRecursive_(v8, v10, (uint64_t)v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)registeredMMCSItemForRereferencedAsset:(id)a3 copyBlock:(id)a4
{
  id v6;
  id v7;
  CKDMMCSItem *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKDAssetHandleTable *assetHandleTable;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  CKDAssetHandleTable *v35;
  id v36;
  id v37;
  const char *v38;
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
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  _QWORD v91[5];
  id v92;
  id v93;
  id v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  id v102;

  v6 = a3;
  v7 = a4;
  v8 = [CKDMMCSItem alloc];
  v10 = (void *)objc_msgSend_initWithAsset_temporary_(v8, v9, (uint64_t)v6, 1);
  if (objc_msgSend_isReference(v6, v11, v12))
  {
    v15 = objc_msgSend_reReferenceItemID(v6, v13, v14);
    assetHandleTable = self->_assetHandleTable;
    v102 = 0;
    objc_msgSend_assetHandleWithItemID_error_(assetHandleTable, v17, v15, &v102);
    v18 = objc_claimAutoreleasedReturnValue();
    v21 = (uint64_t)v102;
    if (!(v18 | v21))
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v19, *MEMORY[0x1E0C94B20], 1017, CFSTR("no such itemID %ld"), v15);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    if (v21)
    {

LABEL_12:
      objc_msgSend_setError_(v10, v22, v21);

      goto LABEL_13;
    }
    objc_msgSend_status((void *)v18, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_integerValue(v23, v24, v25);

    if (v26 == 3)
    {
      objc_msgSend_itemID((void *)v18, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setItemID_((void *)v18, v30, 0);
      objc_msgSend_boundaryKey(v6, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBoundaryKeyHashUsingBoundaryKey_((void *)v18, v34, (uint64_t)v33);

      v96 = 0;
      v97 = &v96;
      v98 = 0x3032000000;
      v99 = sub_1BE9BB0C8;
      v100 = sub_1BE9BAE18;
      v101 = 0;
      v35 = self->_assetHandleTable;
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3221225472;
      v91[2] = sub_1BEB7A7B4;
      v91[3] = &unk_1E7835678;
      v91[4] = self;
      v36 = (id)v18;
      v92 = v36;
      v95 = &v96;
      v94 = v7;
      v37 = v29;
      v93 = v37;
      objc_msgSend_performTransaction_(v35, v38, (uint64_t)v91);
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend_volumeIndex(v36, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deviceIDForVolumeIndex_(self, v42, (uint64_t)v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDeviceID_(v10, v44, (uint64_t)v43);

        objc_msgSend_fileID(v36, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFileID_(v10, v48, (uint64_t)v47);

        objc_msgSend_generationID(v36, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setGenerationID_(v10, v52, (uint64_t)v51);

        v53 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_modTime(v36, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSince1970(v56, v57, v58);
        objc_msgSend_numberWithDouble_(v53, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setModTimeInSeconds_(v10, v62, (uint64_t)v61);

        objc_msgSend_fileSize(v36, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend_unsignedLongLongValue(v65, v66, v67);
        objc_msgSend_setFileSize_(v10, v69, v68);

        v72 = objc_msgSend_unsignedLongLongValue((void *)v97[5], v70, v71);
        objc_msgSend_setItemID_(v10, v73, v72);
        objc_msgSend_chunkCount(v36, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend_unsignedLongValue(v76, v77, v78);
        objc_msgSend_setChunkCount_(v10, v80, v79);

        objc_msgSend_setIsAlreadyRegistered_(v10, v81, 1);
        objc_msgSend_UUID(v6, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTrackingUUID_(v10, v85, (uint64_t)v84);

        objc_msgSend_boundaryKey(v6, v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setBoundaryKey_(v10, v89, (uint64_t)v88);

      }
      _Block_object_dispose(&v96, 8);

    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v27, *MEMORY[0x1E0C94B20], 3015, CFSTR("Asset handle not registered for itemID %ld"), v15);
      v21 = objc_claimAutoreleasedReturnValue();
    }

    if (v21)
      goto LABEL_12;
  }
LABEL_13:

  return v10;
}

- (void)_scheduleEvictionForDownloadedFiles
{
  uint64_t v2;
  void *v5;
  const char *v6;
  _QWORD v7[6];

  objc_msgSend_mmcsEngineContext(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEB7A8B8;
  v7[3] = &unk_1E7830130;
  v7[4] = self;
  v7[5] = a2;
  objc_msgSend_MMCSSerializeSyncRecursive_(v5, v6, (uint64_t)v7);

}

- (id)_evictWithEvictionInfo:(id)a3
{
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  BOOL v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  int ResourceValue_forKey_error;
  id v39;
  const char *v40;
  id v41;
  int v42;
  const char *v43;
  int v44;
  id v45;
  id v46;
  const char *v47;
  uint64_t v48;
  int v49;
  const char *v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  CKDAssetCacheEvictionResult *v55;
  const char *v56;
  void *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  int v67;
  void *v68;
  __int128 v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v75;
  int v76;
  id v77;
  const char *v78;
  id v79;
  int v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  int v85;
  id v86;
  const char *v87;
  uint64_t v88;
  int v89;
  NSObject *v90;
  id v91;
  const char *v92;
  int v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  const char *v99;
  NSObject *v100;
  _BOOL4 v101;
  const char *v102;
  const char *v103;
  id v104;
  const char *v105;
  uint64_t v106;
  CKDAssetHandle *v107;
  const char *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *v112;
  id v113;
  void *v114;
  void *v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  char v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  unint64_t v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  unint64_t v132;
  unint64_t v133;
  NSObject *v134;
  const char *v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  CKDAssetHandleTable *assetHandleTable;
  id v140;
  id v141;
  const char *v142;
  id v143;
  const char *v144;
  uint64_t v145;
  CKDAssetHandleTable *v146;
  const char *v147;
  id v148;
  CKDAssetCacheEvictionResult *v149;
  const char *v150;
  NSObject *v152;
  void *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  id v161;
  const char *v162;
  uint64_t v163;
  int v164;
  const __CFString *v165;
  __int128 v166;
  void *v167;
  id v168;
  id v170;
  unint64_t v171;
  void *v172;
  id v173;
  unint64_t v174;
  void *v175;
  void *v176;
  void *context;
  void *contexta;
  CKDAssetCache *v179;
  _QWORD v180[5];
  id v181;
  _QWORD v182[5];
  id v183;
  id v184;
  id v185;
  uint64_t *v186;
  uint64_t *v187;
  _BYTE *v188;
  uint64_t *v189;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  unint64_t v193;
  char v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;
  unint64_t v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  char v213;
  uint64_t v214;
  uint64_t *v215;
  uint64_t v216;
  uint64_t v217;
  _BYTE buf[24];
  id v219;
  __int16 v220;
  const __CFString *v221;
  __int16 v222;
  unint64_t v223;
  __int16 v224;
  unint64_t v225;
  _QWORD v226[3];
  _QWORD v227[5];

  v227[2] = *MEMORY[0x1E0C80C00];
  v173 = a3;
  v179 = self;
  objc_msgSend_mmcsEngineContext(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assertMMCSSerialized(v6, v7, v8);

  v214 = 0;
  v215 = &v214;
  v216 = 0x2020000000;
  v217 = 0;
  if (objc_msgSend_didDrop(v179, v9, v10))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v152 = (id)*MEMORY[0x1E0C952A8];
    if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v179;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v153;
      _os_log_error_impl(&dword_1BE990000, v152, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDAssetCache _evictWithEvictionInfo:]", "CKDAssetCache.m", 1757, "0 && \"already dropped\");
  }
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v11, v12);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = 0;
  objc_msgSend_fileDownloadPath(v179, v13, v14);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend_fileDownloadPath(v179, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = (void *)v17;
    if ((objc_msgSend_fileExistsAtPath_isDirectory_(v175, v19, (uint64_t)v18, &v213) & 1) == 0)
    {

      v57 = 0;
LABEL_71:

      goto LABEL_72;
    }
    v20 = v213 == 0;

    if (!v20)
    {
      v23 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend_fileDownloadPath(v179, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileURLWithPath_isDirectory_(v23, v25, (uint64_t)v24, 1);
      v172 = (void *)objc_claimAutoreleasedReturnValue();

      context = (void *)MEMORY[0x1C3B83E24]();
      v26 = *MEMORY[0x1E0C99998];
      v27 = *MEMORY[0x1E0C99968];
      v227[0] = *MEMORY[0x1E0C99998];
      v227[1] = v27;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v227, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v175, v30, (uint64_t)v172, v29, 1, &unk_1E78356C0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v174 = 0;
      v171 = 0;
      v176 = (void *)*MEMORY[0x1E0C99978];
      do
      {
        v32 = (void *)MEMORY[0x1C3B83E24]();
        objc_msgSend_nextObject(v31, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v35;
        if (v35)
        {
          v211 = 0;
          v212 = 0;
          ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v35, v36, (uint64_t)&v212, v27, &v211);
          v39 = v212;
          v41 = v211;
          if (v39)
            v42 = ResourceValue_forKey_error;
          else
            v42 = 0;
          if (v42 == 1 && objc_msgSend_isEqualToString_(v176, v40, (uint64_t)v39))
          {
            v209 = 0;
            v210 = 0;
            v44 = objc_msgSend_getResourceValue_forKey_error_(v37, v43, (uint64_t)&v210, v26, &v209);
            v45 = v210;
            v46 = v209;

            if (v45)
              v49 = v44;
            else
              v49 = 0;
            if (v49 == 1)
              v171 += objc_msgSend_unsignedLongLongValue(v45, v47, v48);

            ++v174;
            v41 = v46;
          }

        }
        objc_autoreleasePoolPop(v32);
      }
      while (v37);

      objc_autoreleasePoolPop(context);
      if ((objc_msgSend_forced(v173, v50, v51) & 1) != 0 || v174 > 0x64 || v171 > 0xA00000)
      {
        v167 = (void *)MEMORY[0x1C3B83E24]();
        v226[0] = v26;
        v226[1] = v27;
        v58 = (void *)*MEMORY[0x1E0C998D0];
        v226[2] = *MEMORY[0x1E0C998D0];
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v59, (uint64_t)v226, 3);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v175, v61, (uint64_t)v172, v60, 1, &unk_1E78356E0);
        contexta = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend_useModTimeInAssetCacheEviction(v64, v65, v66);

        v68 = (void *)*MEMORY[0x1E0C998D8];
        if (!v67)
          v68 = v58;
        v168 = v68;
        *(_QWORD *)&v69 = 138543362;
        v166 = v69;
        do
        {
          v70 = (void *)MEMORY[0x1C3B83E24]();
          objc_msgSend_nextObject(contexta, v71, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v73;
          if (v73)
          {
            v207 = 0;
            v208 = 0;
            v76 = objc_msgSend_getResourceValue_forKey_error_(v73, v74, (uint64_t)&v208, v27, &v207);
            v77 = v208;
            v79 = v207;
            if (v77)
              v80 = v76;
            else
              v80 = 0;
            if (v80 == 1 && objc_msgSend_isEqualToString_(v176, v78, (uint64_t)v77))
            {
              objc_msgSend_path(v75, v81, v82);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v205 = 0;
              v206 = 0;
              v85 = objc_msgSend_parseCachedPath_assetHandleUUID_assetSignature_(v179, v84, (uint64_t)v83, &v206, &v205);
              v86 = v206;
              v170 = v205;

              if (v85)
              {
                if (!v86 || !v170)
                {
                  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v87, v88, v166);
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v115, v116, (uint64_t)a2, v179, CFSTR("CKDAssetCache.m"), 1833, CFSTR("should have thrown by now"));

                }
                v203 = 0;
                v204 = 0;
                v89 = objc_msgSend_getResourceValue_forKey_error_(v75, v87, (uint64_t)&v204, v168, &v203, v166);
                v90 = v204;
                v91 = v203;

                if (v90)
                  v93 = v89;
                else
                  v93 = 0;
                if (v93 == 1)
                {
                  objc_msgSend_assetHandleWithUUID_(v179->_assetHandleTable, v92, (uint64_t)v86);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  v97 = v94;
                  if (v94)
                  {
                    objc_msgSend_lastUsedTime(v94, v95, v96);
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_laterDate_(v90, v99, (uint64_t)v98);
                    v100 = objc_claimAutoreleasedReturnValue();
                    v101 = v100 == v90;

                    if (v101)
                    {
                      objc_msgSend_setLastUsedTime_(v97, v102, (uint64_t)v90);
                      v104 = (id)objc_msgSend_saveLastUsedTime_(v179->_assetHandleTable, v103, (uint64_t)v97);
                    }
                  }
                  else
                  {
                    v107 = [CKDAssetHandle alloc];
                    v97 = (void *)objc_msgSend_initWithItemID_UUID_path_(v107, v108, 0, v86, 0);
                    objc_msgSend_setFileSignature_(v97, v109, (uint64_t)v170);
                    objc_msgSend_setStatus_(v97, v110, (uint64_t)&unk_1E78B0268);
                    objc_msgSend_setLastUsedTime_(v97, v111, (uint64_t)v90);
                    v113 = (id)objc_msgSend_insertObject_(v179->_assetHandleTable, v112, (uint64_t)v97);
                  }

                }
              }
              else
              {
                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v90 = (id)*MEMORY[0x1E0C952A8];
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend_path(v75, v105, v106);
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v166;
                  *(_QWORD *)&buf[4] = v114;
                  _os_log_debug_impl(&dword_1BE990000, v90, OS_LOG_TYPE_DEBUG, "Ignoring file in cache %{public}@", buf, 0xCu);

                }
                v91 = v79;
              }

            }
            else
            {
              v91 = v79;
            }

          }
          objc_autoreleasePoolPop(v70);
        }
        while (v75);

        objc_autoreleasePoolPop(v167);
        objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v117, v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend_evictRecentAssets(v119, v120, v121);

        objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend_assetEvictionGracePeriodWithDefaultValue_(v125, v126, 14400);

        objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v128, v129);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = objc_msgSend_assetEvictionGracePeriodOnHighWatermarkWithDefaultValue_(v130, v131, 7200);

        if (v132 >= v127)
          v133 = v127;
        else
          v133 = v132;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v134 = (id)*MEMORY[0x1E0C952A8];
        if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_fileDownloadPath(v179, v135, v136);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKSanitizedPath(v158, v159, v160);
          v161 = (id)objc_claimAutoreleasedReturnValue();
          v164 = objc_msgSend_forced(v173, v162, v163);
          v165 = CFSTR("NO");
          *(_DWORD *)buf = 134219266;
          *(_QWORD *)&buf[4] = v174;
          *(_WORD *)&buf[12] = 2048;
          if (v164)
            v165 = CFSTR("YES");
          *(_QWORD *)&buf[14] = v171;
          *(_WORD *)&buf[22] = 2114;
          v219 = v161;
          v220 = 2114;
          v221 = v165;
          v222 = 2048;
          v223 = v127;
          v224 = 2048;
          v225 = v133;
          _os_log_debug_impl(&dword_1BE990000, v134, OS_LOG_TYPE_DEBUG, "Evicting %llu files (%llu bytes) at %{public}@ (forced:%{public}@, gracePeriod:%lu, gracePeriodOnHighWatermark:%lu)", buf, 0x3Eu);

        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v219 = 0;
        v199 = 0;
        v200 = &v199;
        v201 = 0x2020000000;
        v202 = v174;
        v195 = 0;
        v196 = &v195;
        v197 = 0x2020000000;
        v198 = v171;
        v137 = objc_alloc_init(MEMORY[0x1E0C99D68]);
        v138 = MEMORY[0x1E0C809B0];
        assetHandleTable = v179->_assetHandleTable;
        v182[0] = MEMORY[0x1E0C809B0];
        v182[1] = 3221225472;
        v182[2] = sub_1BEB7BCD4;
        v182[3] = &unk_1E7835740;
        v182[4] = v179;
        v140 = v137;
        v183 = v140;
        v141 = v173;
        v194 = v122;
        v184 = v141;
        v186 = &v199;
        v187 = &v195;
        v190 = v127;
        v191 = v133;
        v185 = v175;
        v188 = buf;
        v189 = &v214;
        v192 = v174;
        v193 = v171;
        v143 = (id)objc_msgSend_performTransaction_(assetHandleTable, v142, (uint64_t)v182);
        if (objc_msgSend_clearRegisteredItems(v141, v144, v145))
        {
          v146 = v179->_assetHandleTable;
          v180[0] = v138;
          v180[1] = 3221225472;
          v180[2] = sub_1BEB7C528;
          v180[3] = &unk_1E7835768;
          v180[4] = v179;
          v181 = v141;
          v148 = (id)objc_msgSend_performTransaction_(v146, v147, (uint64_t)v180);

        }
        v149 = [CKDAssetCacheEvictionResult alloc];
        v57 = (void *)objc_msgSend_initWithBytesCount_purgedBytesCount_purgeableByteCount_filesCount_purgedFilesCount_purgeableFilesCount_(v149, v150, v171, v215[3], v196[3], v174, *(_QWORD *)(*(_QWORD *)&buf[8] + 24), v200[3]);

        _Block_object_dispose(&v195, 8);
        _Block_object_dispose(&v199, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v52 = (id)*MEMORY[0x1E0C952A8];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_fileDownloadPath(v179, v53, v54);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKSanitizedPath(v154, v155, v156);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v174;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v171;
          *(_WORD *)&buf[22] = 2114;
          v219 = v157;
          _os_log_debug_impl(&dword_1BE990000, v52, OS_LOG_TYPE_DEBUG, "Skipped evicting %llu files (%llu bytes) at %{public}@", buf, 0x20u);

        }
        v55 = [CKDAssetCacheEvictionResult alloc];
        v57 = (void *)objc_msgSend_initWithBytesCount_purgedBytesCount_purgeableByteCount_filesCount_purgedFilesCount_purgeableFilesCount_(v55, v56, 0, 0, 0, 0, 0, 0);
      }
      goto LABEL_71;
    }
  }
  v57 = 0;
LABEL_72:

  _Block_object_dispose(&v214, 8);
  return v57;
}

- (id)_evictAllFilesForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  CKDAssetCacheEvictionInfo *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;

  v3 = a3;
  objc_msgSend_mmcsEngineContext(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assertMMCSSerialized(v5, v6, v7);

  v8 = [CKDAssetCacheEvictionInfo alloc];
  v10 = (void *)objc_msgSend_initWithForced_(v8, v9, v3);
  objc_msgSend__evictWithEvictionInfo_(self, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterItemIDsAndDeleteAssetHandlesWithEvictionInfo_(self, v13, (uint64_t)v10);

  return v12;
}

- (id)evictAllFilesForced:(BOOL)a3
{
  void *v5;
  const char *v6;
  id v7;
  _QWORD v9[6];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1BE9BB0C8;
  v15 = sub_1BE9BAE18;
  v16 = 0;
  objc_msgSend_mmcsEngineContext(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEB7C890;
  v9[3] = &unk_1E782F3C0;
  v9[4] = self;
  v9[5] = &v11;
  v10 = a3;
  objc_msgSend_MMCSSerializeSyncRecursive_(v5, v6, (uint64_t)v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (void)_expireAssetHandlesWithExpiryDate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  CKDAssetCacheEvictionInfo *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  CKDAssetHandleTable *assetHandleTable;
  id v18;
  id v19;
  const char *v20;
  id v21;
  id v22;
  const char *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, const char *);
  void *v34;
  id v35;
  CKDAssetCache *v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_mmcsEngineContext(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assertMMCSSerialized(v7, v8, v9);

  v10 = [CKDAssetCacheEvictionInfo alloc];
  v12 = (void *)objc_msgSend_initWithForced_(v10, v11, 0);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v49[0] = CFSTR("EXPIRYDATE");
  v49[1] = CFSTR("NOT_REGISTERED");
  v50[0] = v4;
  v50[1] = &unk_1E78B0268;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v50, v49, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_deleteEntriesMatching_label_error_predicate_(self->_assetHandleTable, v15, (uint64_t)v14, off_1E7835788, 0, &unk_1E78357A0);
  v40[3] = v16;
  assetHandleTable = self->_assetHandleTable;
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = sub_1BEB7CBB4;
  v34 = &unk_1E7835800;
  v18 = v4;
  v35 = v18;
  v36 = self;
  v38 = &v39;
  v19 = v12;
  v37 = v19;
  v21 = (id)objc_msgSend_performTransaction_(assetHandleTable, v20, (uint64_t)&v31);
  v22 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend_setDateFormat_(v22, v23, (uint64_t)CFSTR("yyyy-MM-dd HH:mm:ss"), v31, v32, v33, v34);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v24 = (id)*MEMORY[0x1E0C952A8];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v27 = v40[3];
    objc_msgSend_applicationBundleID(self, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromDate_(v22, v29, (uint64_t)v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v44 = v27;
    v45 = 2114;
    v46 = v28;
    v47 = 2112;
    v48 = v30;
    _os_log_impl(&dword_1BE990000, v24, OS_LOG_TYPE_INFO, "Expired %lu asset handles for %{public}@ with lastUsedTime before \"%@\", buf, 0x20u);

  }
  _Block_object_dispose(&v39, 8);

}

- (void)expireAssetHandlesIfNecessary
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSDate *v11;
  NSDate *oldestLastUsedTime;
  const char *v13;
  NSDate *v14;
  NSDate *v15;
  NSDate *v16;
  const char *v17;
  id v18;

  objc_msgSend_mmcsEngineContext(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assertMMCSSerialized(v4, v5, v6);

  if ((objc_msgSend_didDrop(self, v7, v8) & 1) == 0)
  {
    if (!self->_oldestLastUsedTime)
    {
      objc_msgSend_oldestLastUsedTime(self->_assetHandleTable, v9, v10);
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
      oldestLastUsedTime = self->_oldestLastUsedTime;
      self->_oldestLastUsedTime = v11;

    }
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v9, v10, -28800.0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_earlierDate_(self->_oldestLastUsedTime, v13, (uint64_t)v18);
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v15 = self->_oldestLastUsedTime;

    if (v14 == v15)
    {
      v16 = self->_oldestLastUsedTime;
      self->_oldestLastUsedTime = 0;

      objc_msgSend__expireAssetHandlesWithExpiryDate_(self, v17, (uint64_t)v18);
    }

  }
}

- (void)_resetAssetInflight
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CKDAssetHandleTable *assetHandleTable;
  const char *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  CKDAssetCache *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend_mmcsEngineContext(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assertMMCSSerialized(v5, v6, v7);

  if (objc_msgSend_didDrop(self, v8, v9))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v16 = (void *)*MEMORY[0x1E0C952A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_ERROR))
    {
      v17 = v16;
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 2114;
      v25 = v18;
      _os_log_error_impl(&dword_1BE990000, v17, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDAssetCache _resetAssetInflight]", "CKDAssetCache.m", 2040, "0 && \"already dropped\");
  }
  objc_msgSend_MMCS(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    __assert_rtn("-[CKDAssetCache _resetAssetInflight]", "CKDAssetCache.m", 2042, "MMCS && \"nil MMCS object\");
  assetHandleTable = self->_assetHandleTable;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1BEB7D15C;
  v20[3] = &unk_1E7835768;
  v20[4] = self;
  v21 = v12;
  v19 = v12;
  v15 = (id)objc_msgSend_performTransaction_(assetHandleTable, v14, (uint64_t)v20);

}

- (void)setupPersistentStateAtStartup
{
  uint64_t v2;
  void *v5;
  const char *v6;
  _QWORD v7[6];

  objc_msgSend_mmcsEngineContext(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEB7D58C;
  v7[3] = &unk_1E7830130;
  v7[4] = self;
  v7[5] = a2;
  objc_msgSend_MMCSSerializeSyncRecursive_(v5, v6, (uint64_t)v7);

}

- (CKDMMCS)MMCS
{
  return (CKDMMCS *)objc_loadWeakRetained((id *)&self->_MMCS);
}

- (void)setMMCS:(id)a3
{
  objc_storeWeak((id *)&self->_MMCS, a3);
}

- (BOOL)isNewEmptyCache
{
  return self->_isNewEmptyCache;
}

- (CKDAssetCacheTableGroup)assetCacheTableGroup
{
  return self->_assetCacheTableGroup;
}

- (CKDAssetHandleTable)assetHandleTable
{
  return self->_assetHandleTable;
}

- (CKDAssetVolumeTable)assetVolumeTable
{
  return self->_assetVolumeTable;
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (CKDDirectoryContext)directoryContext
{
  return self->_directoryContext;
}

- (void)setDirectoryContext:(id)a3
{
  objc_storeStrong((id *)&self->_directoryContext, a3);
}

- (BOOL)isEvictionScheduled
{
  return self->_isEvictionScheduled;
}

- (void)setIsEvictionScheduled:(BOOL)a3
{
  self->_isEvictionScheduled = a3;
}

- (BOOL)didDrop
{
  return self->_didDrop;
}

- (void)setDidDrop:(BOOL)a3
{
  self->_didDrop = a3;
}

- (int64_t)checkoutCount
{
  return self->_checkoutCount;
}

- (void)setCheckoutCount:(int64_t)a3
{
  self->_checkoutCount = a3;
}

- (NSDate)oldestLastUsedTime
{
  return self->_oldestLastUsedTime;
}

- (void)setOldestLastUsedTime:(id)a3
{
  objc_storeStrong((id *)&self->_oldestLastUsedTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestLastUsedTime, 0);
  objc_storeStrong((id *)&self->_directoryContext, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_assetVolumeTable, 0);
  objc_storeStrong((id *)&self->_assetHandleTable, 0);
  objc_storeStrong((id *)&self->_assetCacheTableGroup, 0);
  objc_destroyWeak((id *)&self->_MMCS);
  objc_storeStrong((id *)&self->_clonedFileCache, 0);
}

@end
