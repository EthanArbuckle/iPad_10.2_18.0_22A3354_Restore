@implementation CKDMMCSEngineContext

+ (id)_appID
{
  void *v2;
  const char *v3;
  void *v4;

  CKBuildVersion();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v3, (uint64_t)CFSTR("%@/%@"), CFSTR("com.apple.CloudKit"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedContextsQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEB84804;
  block[3] = &unk_1E7830348;
  block[4] = a1;
  if (qword_1ED702AC0 != -1)
    dispatch_once(&qword_1ED702AC0, block);
  return (id)qword_1ED702AB8;
}

+ (id)sharedContextsByPath
{
  if (qword_1ED702AD0 != -1)
    dispatch_once(&qword_1ED702AD0, &unk_1E7835AC8);
  return (id)qword_1ED702AC8;
}

- (CKDMMCSEngineContext)initWithApplicationBundleID:(id)a3 path:(id)a4
{
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  CKDMMCSEngineContext *v12;
  CKDMMCSEngineContext *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *mmcsQueue;
  NSMutableIndexSet *v17;
  NSMutableIndexSet *inMemoryItemsIDs;
  NSObject *v19;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  objc_super v25;
  uint8_t buf[4];
  CKDMMCSEngineContext *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11 = a4;
  if (v11)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKDMMCSEngineContext.m"), 76, CFSTR("Expected non-nil path"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, CFSTR("CKDMMCSEngineContext.m"), 77, CFSTR("Expected non-nil applicationBundleID"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)CKDMMCSEngineContext;
  v12 = -[CKDMMCSEngineContext init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    *(_OWORD *)&v12->_refCount = xmmword_1BECBBF80;
    objc_storeStrong((id *)&v12->_applicationBundleID, a3);
    objc_storeStrong((id *)&v13->_path, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("CKDMMCSEngineContext queue", v14);
    mmcsQueue = v13->_mmcsQueue;
    v13->_mmcsQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    inMemoryItemsIDs = v13->_inMemoryItemsIDs;
    v13->_inMemoryItemsIDs = v17;

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, "Initialized MMCS engine context: %@", buf, 0xCu);
    }
  }

  return v13;
}

- (void)dealloc
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  objc_super v14;
  uint8_t buf[4];
  CKDMMCSEngineContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_debug_impl(&dword_1BE990000, v4, OS_LOG_TYPE_DEBUG, "Deallocating MMCS engine context: %@", buf, 0xCu);
  }
  if (objc_msgSend_refCount(self, v5, v6))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_refCount(self, v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v13, (uint64_t)a2, self, CFSTR("CKDMMCSEngineContext.m"), 95, CFSTR("Expected refCount=0 (%ld)"), v12);

  }
  v14.receiver = self;
  v14.super_class = (Class)CKDMMCSEngineContext;
  -[CKDMMCSEngineContext dealloc](&v14, sel_dealloc);
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_msgSend_state(self, v5, v6);
  v10 = objc_msgSend_refCount(self, v8, v9);
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("state=%ld, refCount=%ld"), v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  objc_msgSend_applicationBundleID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_applicationBundleID(self, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v19, v21, (uint64_t)CFSTR("applicationBundleID=%@"), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v23, (uint64_t)v22);

  }
  objc_msgSend_path(self, v17, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_path(self, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v27, v32, (uint64_t)CFSTR("path=\"%@\"), v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v34, (uint64_t)v33);

  }
  objc_msgSend_componentsJoinedByString_(v3, v25, (uint64_t)CFSTR(", "));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDMMCSEngineContext *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (int64_t)incRefCount
{
  CKDMMCSEngineContext *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_refCount + 1;
  v2->_refCount = v3;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)decRefCount
{
  CKDMMCSEngineContext *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_refCount - 1;
  v2->_refCount = v3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_setupMMCSEngineWithError:(id *)a3
{
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  os_log_t *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  char v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  os_log_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  os_log_t v60;
  const char *v61;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  id v91;
  _QWORD v92[3];
  _QWORD v93[5];

  v93[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, a2, (uint64_t)a3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (objc_msgSend_state(self, v7, v8) != 3)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v84, v85, (uint64_t)a2, self, CFSTR("CKDMMCSEngineContext.m"), 266, CFSTR("Expected state %ld for MMCS engine context"), 3, self);

  }
  if (objc_msgSend_MMCSEngine(self, v9, v10))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v86, v87, (uint64_t)a2, self, CFSTR("CKDMMCSEngineContext.m"), 267, CFSTR("Expected nil MMCS engine for MMCS engine context %@"), self);

  }
  v13 = *MEMORY[0x1E0D46740];
  v92[0] = *MEMORY[0x1E0D46738];
  v92[1] = v13;
  v93[0] = MEMORY[0x1E0C9AAB0];
  v93[1] = MEMORY[0x1E0C9AAB0];
  v92[2] = *MEMORY[0x1E0D46730];
  v93[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v93, v92, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v16 = (os_log_t *)MEMORY[0x1E0C952B0];
  v17 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v63 = v17;
    objc_msgSend_path(self, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v89 = v69;
    _os_log_debug_impl(&dword_1BE990000, v63, OS_LOG_TYPE_DEBUG, "Creating MMCS engine at %{public}@", buf, 0xCu);

  }
  objc_msgSend_path(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CKCreateDirectoryAtPath();
  v22 = 0;

  if ((v21 & 1) != 0)
  {
    v25 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend_path(self, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_isDirectory_(v25, v27, (uint64_t)v26, 1);
    objc_msgSend__appID(CKDMMCSEngineContext, v28, v29);
    v30 = MMCSEngineCreateWithTargetDispatchQueue();
    objc_msgSend_setMMCSEngine_(self, v31, v30);

    if (objc_msgSend_MMCSEngine(self, v32, v33))
    {
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 1;
      objc_msgSend_enableMMCSMetricsWithDefaultValue_(v36, v38, 1);

      objc_msgSend_MMCSEngine(self, v39, v40);
      MMCSEngineSetMetricsEnabled();
      objc_msgSend_MMCSEngine(self, v41, v42);
      v43 = MMCSGetMaxChunkCountForSection();
      objc_msgSend_setMaxChunkCountForSection_(self, v44, v43);
      objc_msgSend_setState_(self, v45, 1);
      goto LABEL_25;
    }
    if (*v15 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v60 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      v77 = v60;
      objc_msgSend_path(self, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKSanitizedPath(v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v89 = v83;
      _os_log_error_impl(&dword_1BE990000, v77, OS_LOG_TYPE_ERROR, "Failed creating MMCS engine at %{public}@", buf, 0xCu);

    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v61, *MEMORY[0x1E0C94B20], 3001, CFSTR("MMCSEngineCreate failed"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*v15 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v46 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      v70 = v46;
      objc_msgSend_path(self, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKSanitizedPath(v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v89 = v76;
      v90 = 2112;
      v91 = v22;
      _os_log_error_impl(&dword_1BE990000, v70, OS_LOG_TYPE_ERROR, "Error creating MMCS directory at %{public}@: %@", buf, 0x16u);

    }
    v49 = (void *)MEMORY[0x1E0C94FF8];
    v50 = *MEMORY[0x1E0C94B20];
    objc_msgSend_path(self, v47, v48);
    v51 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(self, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_error_path_format_(v49, v58, v50, 1000, v22, v51, CFSTR("Error creating MMCS directory at %@"), v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (id)v51;
  }

  if (a3)
  {
    v22 = objc_retainAutorelease(v59);
    v37 = 0;
    *a3 = v22;
  }
  else
  {
    v37 = 0;
    v22 = v59;
  }
LABEL_25:

  return v37;
}

- (BOOL)_setupMMCSEngineWithRetryCount:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  const char *v8;
  char v9;
  const char *v10;
  uint64_t v11;
  id v12;
  BOOL v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  char v21;
  id v23;

  objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, a2, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (a3)
  {
    v23 = 0;
    v9 = objc_msgSend__setupMMCSEngineWithError_(self, v8, (uint64_t)&v23);
    v12 = v23;
    if ((v9 & 1) != 0)
    {
      v13 = 1;
      goto LABEL_14;
    }
    v14 = 0;
    while (1)
    {
      if (!v14)
      {
        objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v10, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_path(self, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeItemAtPath_error_(v15, v19, (uint64_t)v18, 0);

      }
      if (a3 - 1 == v14)
        break;

      v23 = 0;
      v21 = objc_msgSend__setupMMCSEngineWithError_(self, v20, (uint64_t)&v23);
      v12 = v23;
      ++v14;
      if ((v21 & 1) != 0)
      {
        v13 = v14 < a3;
        goto LABEL_14;
      }
    }
  }
  else
  {
    v12 = 0;
  }
  if (a4)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a4 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_14:

  return v13;
}

- (void)_tearDownMMCSEngine
{
  uint64_t v2;
  NSObject *v4;
  _QWORD *v5;
  os_log_t *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  CKDMMCSEngineContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = (os_log_t *)MEMORY[0x1E0C952B0];
  v7 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_debug_impl(&dword_1BE990000, v7, OS_LOG_TYPE_DEBUG, "Tearing down MMCS engine: %@", buf, 0xCu);
  }
  if (objc_msgSend_MMCSEngine(self, v8, v9))
  {
    if (*v5 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_debug_impl(&dword_1BE990000, v10, OS_LOG_TYPE_DEBUG, "Destroying MMCS engine %@", buf, 0xCu);
    }
    objc_msgSend_setState_(self, v11, 2);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1BEB85CE4;
    v14[3] = &unk_1E782EA40;
    v14[4] = self;
    objc_msgSend_MMCSSerializeSyncRecursive_(self, v12, (uint64_t)v14);
    objc_msgSend_setState_(self, v13, 3);
  }
}

+ (BOOL)hasCachedCKDMMCSEngineContextForPath:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = a3;
  objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11 != 0;
}

+ (id)setupMMCSEngineWithApplicationBundleID:(id)a3 path:(id)a4 wasCached:(BOOL *)a5 error:(id *)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  CKDMMCSEngineContext *v25;
  const char *v26;
  const char *v27;
  int v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  if (a5)
    *a5 = 0;
  if (v12)
  {
    if (v11)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, a1, CFSTR("CKDMMCSEngineContext.m"), 391, CFSTR("Expected non-nil path"));

    if (v11)
      goto LABEL_5;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, a1, CFSTR("CKDMMCSEngineContext.m"), 392, CFSTR("Expected non-nil applicationBundleID"));

LABEL_5:
  objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v18, v19, (uint64_t)v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_incRefCount(v20, v21, v22);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v20;
      _os_log_debug_impl(&dword_1BE990000, v23, OS_LOG_TYPE_DEBUG, "Found a cached engine context %@", buf, 0xCu);
    }
    v24 = 0;
    if (a5)
      *a5 = 1;
  }
  else
  {
    v25 = [CKDMMCSEngineContext alloc];
    v20 = (void *)objc_msgSend_initWithApplicationBundleID_path_(v25, v26, (uint64_t)v11, v12);
    v43 = 0;
    v28 = objc_msgSend__setupMMCSEngineWithRetryCount_error_(v20, v27, 2, &v43);
    v24 = v43;
    if (v28)
    {
      objc_msgSend_incRefCount(v20, v29, v30);
      objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v20, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v33, v37, (uint64_t)v20, v36);

    }
    else
    {

      if (a6)
      {
        v24 = objc_retainAutorelease(v24);
        v20 = 0;
        *a6 = v24;
      }
      else
      {
        v20 = 0;
      }
    }
  }

  return v20;
}

+ (BOOL)tearDownMMCSEngineWithContext:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  int v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v3 && !objc_msgSend_decRefCount(v3, v7, v8))
  {
    objc_msgSend__tearDownMMCSEngine(v3, v9, v10);
    objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v3, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v14, v18, (uint64_t)v17);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v20 = (void *)*MEMORY[0x1E0C952F8];
    v21 = *MEMORY[0x1E0C95300];
    if (v19 == v3)
    {
      if (v21 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v20);
      v30 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v37 = v30;
        objc_msgSend_path(v3, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138412546;
        v42 = v3;
        v43 = 2114;
        v44 = v40;
        _os_log_debug_impl(&dword_1BE990000, v37, OS_LOG_TYPE_DEBUG, "Removing context %@ for path %{public}@ from sharedContextsByPath", (uint8_t *)&v41, 0x16u);

      }
      objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v31, v32);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v3, v33, v34);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectForKey_(v23, v35, (uint64_t)v26);
    }
    else
    {
      if (v21 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v20);
      v22 = (void *)*MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v23 = v22;
      objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v3, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138412802;
      v42 = v3;
      v43 = 2112;
      v44 = v26;
      v45 = 2114;
      v46 = v29;
      _os_log_error_impl(&dword_1BE990000, v23, OS_LOG_TYPE_ERROR, "context %@ not in sharedContextsByPath %@ for key %{public}@", (uint8_t *)&v41, 0x20u);

    }
LABEL_15:
    v11 = 1;
    goto LABEL_16;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (void)cancelRequestWithContext:(void *)a3
{
  const char *v6;
  uint64_t v7;
  const void *v8;
  _QWORD *v9;
  os_log_t *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  _QWORD v16[7];
  uint8_t buf[4];
  CKDMMCSEngineContext *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (const void *)objc_msgSend_MMCSEngine(self, a2, (uint64_t)a3);
  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKDMMCSEngineContext.m"), 448, CFSTR("Expected non-nil MMCS engine"));

  }
  v9 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v10 = (os_log_t *)MEMORY[0x1E0C952B0];
  v11 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = a3;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Cancelling requests for MMCS engine wrapper %@ and context %@", buf, 0x16u);
  }
  CFRetain(v8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEB864D8;
  v16[3] = &unk_1E78328A8;
  v16[5] = v8;
  v16[6] = a3;
  v16[4] = self;
  objc_msgSend_MMCSSerializeSyncRecursive_(self, v12, (uint64_t)v16);
  if (*v9 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v13 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = a3;
    _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "Waiting for MMCS engine wrapper %@ to cancel the requests for %@", buf, 0x16u);
  }
  CFRelease(v8);
}

- (void)MMCSSerializeSyncRecursive:(id)a3
{
  _opaque_pthread_t *serializedThread;
  NSObject *mmcsQueue;
  void (**v6)(void);
  _QWORD block[5];
  void (**v8)(void);

  v6 = (void (**)(void))a3;
  serializedThread = (_opaque_pthread_t *)self->_serializedThread;
  if (serializedThread == pthread_self())
  {
    v6[2]();
  }
  else
  {
    mmcsQueue = self->_mmcsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEB86670;
    block[3] = &unk_1E782F4D0;
    block[4] = self;
    v8 = v6;
    dispatch_sync(mmcsQueue, block);

  }
}

- (void)MMCSSerializeAsyncRecursive:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *mmcsQueue;
  id v11;
  void *v12;
  const char *v13;
  _QWORD v14[5];
  id v15;

  v5 = a3;
  if (!objc_msgSend_MMCSEngine(self, v6, v7))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, CFSTR("CKDMMCSEngineContext.m"), 481, CFSTR("Expected non-nil MMCS engine"));

  }
  mmcsQueue = self->_mmcsQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEB86790;
  v14[3] = &unk_1E782F4D0;
  v14[4] = self;
  v15 = v5;
  v11 = v5;
  dispatch_async(mmcsQueue, v14);

}

- (void)MMCSRunSerialized:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1C3B83E24]();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_mmcsQueue);
  sub_1BEB8667C((pthread_t *)&self->_serializedThread, v5);
  objc_autoreleasePoolPop(v4);

}

- (void)assertMMCSSerialized
{
  _opaque_pthread_t *serializedThread;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  serializedThread = (_opaque_pthread_t *)self->_serializedThread;
  if (serializedThread != pthread_self())
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v7, (uint64_t)a2, self, CFSTR("CKDMMCSEngineContext.m"), 496, CFSTR("Expected to be serialized"));

  }
}

- (unint64_t)nextAvailableItemID
{
  NSMutableIndexSet *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = self->_inMemoryItemsIDs;
  objc_sync_enter(v3);
  CKNSIndexSet_enumerateInverseRangesInRange_options_usingBlock();
  v5 = v9[3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    __assert_rtn("-[CKDMMCSEngineContext nextAvailableItemID]", "CKDMMCSEngineContext.m", 512, "0 && \"itemID overflow\");
  objc_msgSend_addIndex_(self->_inMemoryItemsIDs, v4, v5);
  objc_sync_exit(v3);

  v6 = v9[3] - 0x331272800;
  _Block_object_dispose(&v8, 8);
  return v6;
}

- (void)stopTrackingItemID:(unint64_t)a3
{
  NSMutableIndexSet *v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = self->_inMemoryItemsIDs;
  objc_sync_enter(v5);
  if (objc_msgSend_containsIndex_(self->_inMemoryItemsIDs, v6, a3 + 0x331272800))
  {
    objc_msgSend_removeIndex_(self->_inMemoryItemsIDs, v7, a3 + 0x331272800);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_error_impl(&dword_1BE990000, v8, OS_LOG_TYPE_ERROR, "Attempted to stop tracking untracked itemID %llu", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_sync_exit(v5);

}

- (int64_t)refCount
{
  return self->_refCount;
}

- (void)setRefCount:(int64_t)a3
{
  self->_refCount = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CKDMMCS)MMCS
{
  return (CKDMMCS *)objc_loadWeakRetained((id *)&self->_MMCS);
}

- (void)setMMCS:(id)a3
{
  objc_storeWeak((id *)&self->_MMCS, a3);
}

- (_mmcs_engine)MMCSEngine
{
  return self->_MMCSEngine;
}

- (void)setMMCSEngine:(_mmcs_engine *)a3
{
  self->_MMCSEngine = a3;
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (void)setApplicationBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleID, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (unsigned)maxChunkCountForSection
{
  return self->_maxChunkCountForSection;
}

- (void)setMaxChunkCountForSection:(unsigned int)a3
{
  self->_maxChunkCountForSection = a3;
}

- (NSMutableIndexSet)inMemoryItemsIDs
{
  return self->_inMemoryItemsIDs;
}

- (void)setInMemoryItemsIDs:(id)a3
{
  objc_storeStrong((id *)&self->_inMemoryItemsIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inMemoryItemsIDs, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_destroyWeak((id *)&self->_MMCS);
  objc_storeStrong((id *)&self->_mmcsQueue, 0);
}

@end
