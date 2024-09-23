@implementation CKAssetRepairScheduler

- (double)requestTimeout
{
  double result;

  result = self->_requestTimeout;
  if (result == -1.0)
    return 15.0;
  return result;
}

- (int64_t)repairBatchCountLimit
{
  if (self->_repairBatchCountLimit == -1)
    return 1;
  else
    return self->_repairBatchCountLimit;
}

- (int64_t)cacheCountLimit
{
  if (self->_cacheCountLimit == -1)
    return 5;
  else
    return self->_cacheCountLimit;
}

- (double)defaultSuspensionTime
{
  double result;

  result = self->_defaultSuspensionTime;
  if (result == -1.0)
    return 120.0;
  return result;
}

- (int64_t)repairRetryCount
{
  if (self->_repairRetryCount == -1)
    return 10;
  else
    return self->_repairRetryCount;
}

+ (id)nameForEvent:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E1F645C8[a3];
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_clearAssetCache(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CKAssetRepairScheduler;
  -[CKAssetRepairScheduler dealloc](&v5, sel_dealloc);
}

- (CKAssetRepairScheduler)initWithContainer:(id)a3 repairContainerOverrides:(id)a4
{
  id v6;
  id v7;
  CKAssetRepairScheduler *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKAssetRepairScheduler *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *internalQueue;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  dispatch_queue_t v38;
  OS_dispatch_queue *callbackQueue;
  NSOperationQueue *v40;
  NSOperationQueue *requestOperationQueue;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSOperationQueue *v46;
  NSOperationQueue *uploadOperationQueue;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  CKUploadRequestConfiguration *repairContainerOverrides;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSMutableDictionary *remainingAssetsToRequestCallbacks;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSMutableDictionary *assetCache;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSMutableSet *confirmedMissingAssets;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSMutableSet *assetsBeingRequested;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSMutableSet *assetsBeingUploaded;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSMutableDictionary *retryCountForAssets;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  objc_super v93;

  v6 = a3;
  v7 = a4;
  v93.receiver = self;
  v93.super_class = (Class)CKAssetRepairScheduler;
  v8 = -[CKAssetRepairScheduler init](&v93, sel_init);
  v12 = v8;
  if (v8)
  {
    v8->_requestTimeout = -1.0;
    v8->_repairBatchCountLimit = -1;
    v8->_cacheCountLimit = -1;
    v8->_defaultSuspensionTime = -1.0;
    v8->_repairRetryCount = -1;
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_containerIdentifier(v6, v9, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("%@.%@"), v16, CFSTR("com.apple.cloudkit.datarepair.internal"), v14);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create(v21, v22);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v23;

    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_containerIdentifier(v6, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v25, v30, (uint64_t)CFSTR("%@.%@"), v31, CFSTR("com.apple.cloudkit.datarepair.callback"), v29);
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v36 = (const char *)objc_msgSend_UTF8String(v32, v33, v34, v35);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = dispatch_queue_create(v36, v37);
    callbackQueue = v12->_callbackQueue;
    v12->_callbackQueue = (OS_dispatch_queue *)v38;

    dispatch_queue_set_specific((dispatch_queue_t)v12->_internalQueue, &v12->_internalQueue, (void *)1, 0);
    dispatch_queue_set_specific((dispatch_queue_t)v12->_callbackQueue, &v12->_callbackQueue, (void *)1, 0);
    v40 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    requestOperationQueue = v12->_requestOperationQueue;
    v12->_requestOperationQueue = v40;

    objc_msgSend_setName_(v12->_requestOperationQueue, v42, (uint64_t)CFSTR("com.apple.cloudkit.datarepair.request"), v43);
    objc_msgSend_setQualityOfService_(v12->_requestOperationQueue, v44, 25, v45);
    v46 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    uploadOperationQueue = v12->_uploadOperationQueue;
    v12->_uploadOperationQueue = v46;

    objc_msgSend_setName_(v12->_uploadOperationQueue, v48, (uint64_t)CFSTR("com.apple.cloudkit.datarepair.upload"), v49);
    objc_msgSend_setQualityOfService_(v12->_uploadOperationQueue, v50, 25, v51);
    objc_msgSend_setMaxConcurrentOperationCount_(v12->_uploadOperationQueue, v52, 1, v53);
    objc_storeWeak((id *)&v12->_container, v6);
    v57 = objc_msgSend_copy(v7, v54, v55, v56);
    repairContainerOverrides = v12->_repairContainerOverrides;
    v12->_repairContainerOverrides = (CKUploadRequestConfiguration *)v57;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v59, v60, v61);
    v62 = objc_claimAutoreleasedReturnValue();
    remainingAssetsToRequestCallbacks = v12->_remainingAssetsToRequestCallbacks;
    v12->_remainingAssetsToRequestCallbacks = (NSMutableDictionary *)v62;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v64, v65, v66);
    v67 = objc_claimAutoreleasedReturnValue();
    assetCache = v12->_assetCache;
    v12->_assetCache = (NSMutableDictionary *)v67;

    objc_msgSend_set(MEMORY[0x1E0C99E20], v69, v70, v71);
    v72 = objc_claimAutoreleasedReturnValue();
    confirmedMissingAssets = v12->_confirmedMissingAssets;
    v12->_confirmedMissingAssets = (NSMutableSet *)v72;

    objc_msgSend_set(MEMORY[0x1E0C99E20], v74, v75, v76);
    v77 = objc_claimAutoreleasedReturnValue();
    assetsBeingRequested = v12->_assetsBeingRequested;
    v12->_assetsBeingRequested = (NSMutableSet *)v77;

    objc_msgSend_set(MEMORY[0x1E0C99E20], v79, v80, v81);
    v82 = objc_claimAutoreleasedReturnValue();
    assetsBeingUploaded = v12->_assetsBeingUploaded;
    v12->_assetsBeingUploaded = (NSMutableSet *)v82;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v84, v85, v86);
    v87 = objc_claimAutoreleasedReturnValue();
    retryCountForAssets = v12->_retryCountForAssets;
    v12->_retryCountForAssets = (NSMutableDictionary *)v87;

    objc_msgSend_clearAssetCache(v12, v89, v90, v91);
  }

  return v12;
}

- (void)addUploadRequestsWithMetadata:(id)a3 requestBlocks:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *v21;
  CKException *v22;
  const char *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  CKAssetRepairScheduler *v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/data-repair-add-to-scheduler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v12 = objc_msgSend_count(v6, v9, v10, v11);
  if (v12 != objc_msgSend_count(v7, v13, v14, v15))
  {
    v22 = [CKException alloc];
    v24 = (id)objc_msgSend_initWithName_format_(v22, v23, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Arrays must have the same number of elements"));
    objc_exception_throw(v24);
  }
  if (objc_msgSend_count(v6, v16, v17, v18))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v19 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v6;
      _os_log_debug_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_DEBUG, "Adding upload requests: %@", buf, 0xCu);
      if (self)
        goto LABEL_7;
    }
    else if (self)
    {
LABEL_7:
      internalQueue = self->_internalQueue;
LABEL_8:
      v21 = internalQueue;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_18A76E5EC;
      v25[3] = &unk_1E1F60DD8;
      v26 = v6;
      v27 = v7;
      v28 = self;
      ck_call_or_dispatch_sync_if_not_key(v21, &self->_internalQueue, v25);

      goto LABEL_9;
    }
    internalQueue = 0;
    goto LABEL_8;
  }
LABEL_9:
  os_activity_scope_leave(&state);

}

- (void)removeUploadRequestWithRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/data-repair-remove-from-scheduler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (v4)
  {
    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    v7 = internalQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18A76E900;
    v8[3] = &unk_1E1F61A48;
    v8[4] = self;
    v9 = v4;
    ck_call_or_dispatch_sync_if_not_key(v7, &self->_internalQueue, v8);

  }
  os_activity_scope_leave(&state);

}

- (void)tickle
{
  sub_18A76F100((uint64_t)self, 0, 0);
}

- (void)clearAssetCache
{
  OS_dispatch_queue *internalQueue;
  _QWORD v3[5];

  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_18A771CC4;
  v3[3] = &unk_1E1F5FAA8;
  v3[4] = self;
  ck_call_or_dispatch_sync_if_not_key(internalQueue, &self->_internalQueue, v3);
}

- (void)cancelAllOperations
{
  NSObject *v3;
  os_activity_scope_state_s v4;

  v3 = _os_activity_create(&dword_18A5C5000, "client/data-repair-cancel-scheduler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  sub_18A76F100((uint64_t)self, 3, 0);
  os_activity_scope_leave(&v4);

}

- (id)clonedAsset:(id)a3 withError:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
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
  uint64_t canCopyFromFileURL_toDirectoryURL;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  id v46;
  id v47;
  id v48;
  const char *v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  CKAsset *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  id v101;
  CKPackageItem *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t i;
  void *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  id *v127;
  id v128;
  uint64_t v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  id v135;
  id v136;
  id v137;
  id v138;
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (a4)
    *a4 = 0;
  objc_msgSend_temporaryAssetDirectory(self, v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v9;
      objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_temporaryAssetDirectory(self, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v23, v24, (uint64_t)v19, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)objc_opt_class();
      objc_msgSend_fileURL(v11, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_temporaryAssetDirectory(self, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      canCopyFromFileURL_toDirectoryURL = objc_msgSend_canCopyFromFileURL_toDirectoryURL_(v26, v35, (uint64_t)v30, (uint64_t)v34);

      if (canCopyFromFileURL_toDirectoryURL)
      {
        objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileURL(v11, v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = 0;
        objc_msgSend_copyItemAtURL_toURL_error_(v40, v45, (uint64_t)v44, (uint64_t)v25, &v138);
        v46 = v138;

        if (v46)
          goto LABEL_7;
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v37, (uint64_t)CFSTR("CKErrorDomain"), 10001, CFSTR("Not enough space left on device to attempt asset clone"));
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
LABEL_7:
          v47 = 0;
          if (a4)
            *a4 = objc_retainAutorelease(v46);
          goto LABEL_16;
        }
      }
      v54 = [CKAsset alloc];
      v47 = (id)objc_msgSend_initWithFileURL_(v54, v55, (uint64_t)v25, v56);
LABEL_16:

LABEL_17:
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = v9;
      v137 = 0;
      objc_msgSend_packageWithError_(CKPackage, v49, (uint64_t)&v137, v50);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v137;
      if (v51)
      {
        v46 = v51;
        if (a4)
        {
          v46 = objc_retainAutorelease(v51);
          v47 = 0;
          *a4 = v46;
        }
        else
        {
          v47 = 0;
        }
        goto LABEL_17;
      }
      v127 = a4;
      v128 = v9;
      v130 = v19;
      v136 = 0;
      v58 = objc_msgSend_itemCountWithError_(v48, v52, (uint64_t)&v136, v53);
      v59 = v136;
      v63 = v59;
      v129 = v58;
      if (v58)
      {
        v64 = 0;
        while (1)
        {
          v65 = v48;
          objc_msgSend_itemAtIndex_(v48, v60, v64, v62);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUIDString(v70, v71, v72, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_temporaryAssetDirectory(self, v75, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_URLByAppendingPathComponent_isDirectory_(v78, v79, (uint64_t)v74, 0);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          v81 = (void *)objc_opt_class();
          objc_msgSend_fileURL(v66, v82, v83, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_temporaryAssetDirectory(self, v86, v87, v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend_canCopyFromFileURL_toDirectoryURL_(v81, v90, (uint64_t)v85, (uint64_t)v89);

          if (v91)
          {
            objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v92, v93, v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_fileURL(v66, v96, v97, v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v135 = v63;
            objc_msgSend_copyItemAtURL_toURL_error_(v95, v100, (uint64_t)v99, (uint64_t)v80, &v135);
            v101 = v135;

            v63 = v95;
          }
          else
          {
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v92, (uint64_t)CFSTR("CKErrorDomain"), 10001, CFSTR("Not enough space left on device to attempt asset clone"));
            v101 = (id)objc_claimAutoreleasedReturnValue();
          }

          if (v101)
            break;
          v102 = [CKPackageItem alloc];
          v105 = (void *)objc_msgSend_initWithFileURL_(v102, v103, (uint64_t)v80, v104);
          objc_msgSend_addItem_(v130, v106, (uint64_t)v105, v107);

          v63 = 0;
          ++v64;
          v48 = v65;
          if (v129 == v64)
            goto LABEL_29;
        }

        v63 = v101;
      }
      else if (!v59)
      {
LABEL_29:
        v19 = v130;
        v47 = v130;
        v63 = 0;
        v9 = v128;
LABEL_41:

        v46 = 0;
        goto LABEL_17;
      }
      v133 = 0u;
      v134 = 0u;
      v131 = 0u;
      v132 = 0u;
      v19 = v130;
      objc_msgSend_itemEnumerator(v130, v60, v61, v62);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v109, (uint64_t)&v131, (uint64_t)v139, 16);
      if (v110)
      {
        v114 = v110;
        v115 = *(_QWORD *)v132;
        do
        {
          for (i = 0; i != v114; ++i)
          {
            if (*(_QWORD *)v132 != v115)
              objc_enumerationMutation(v108);
            v117 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
            objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v111, v112, v113);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_fileURL(v117, v119, v120, v121);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeItemAtURL_error_(v118, v123, (uint64_t)v122, 0);

          }
          v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v111, (uint64_t)&v131, (uint64_t)v139, 16);
        }
        while (v114);
      }

      objc_msgSend_removeDB(v130, v124, v125, v126);
      v9 = v128;
      if (v127)
      {
        v63 = objc_retainAutorelease(v63);
        v47 = 0;
        *v127 = v63;
      }
      else
      {
        v47 = 0;
      }
      goto LABEL_41;
    }
  }
  v47 = 0;
LABEL_18:

  return v47;
}

- (BOOL)hasPendingWork
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_allRemainingRequestableAssets(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v5, v6, v7, v8);
  objc_msgSend_allRemainingUploadableAssets(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = v9 + objc_msgSend_count(v13, v14, v15, v16) != 0;

  return v9;
}

- (id)allRemainingRequestableAssets
{
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A770FF4;
  v12 = sub_18A771004;
  v13 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v4 = internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A773000;
  v7[3] = &unk_1E1F64580;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_internalQueue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)allRemainingUploadableAssets
{
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A770FF4;
  v12 = sub_18A771004;
  v13 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v4 = internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A7731A0;
  v7[3] = &unk_1E1F64580;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_internalQueue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (NSURL)temporaryAssetDirectory
{
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A770FF4;
  v12 = sub_18A771004;
  v13 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v4 = internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A7734C0;
  v7[3] = &unk_1E1F64580;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_internalQueue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSURL *)v5;
}

+ (int64_t)estimatedSizeForAssetOrPackage:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
    if (!objc_msgSend_hasSize(v3, v11, v12, v13))
    {
      objc_opt_self();
      objc_opt_self();
      v10 = 2048000;
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if (objc_msgSend_hasSize(v3, v4, v5, v6))
  {
LABEL_6:
    v10 = objc_msgSend_size(v3, v7, v8, v9);
    goto LABEL_9;
  }
  v10 = 102400;
  objc_opt_self();
LABEL_9:

  return v10;
}

+ (int64_t)canCopyFromFileURL:(id)a3 toDirectoryURL:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  unint64_t v26;
  id v27;
  const char *v28;
  void *v29;
  int64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v48 = 0;
  v8 = *MEMORY[0x1E0C99BC8];
  v47 = 0;
  objc_msgSend_getResourceValue_forKey_error_(v6, v9, (uint64_t)&v48, v8, &v47);
  v10 = v48;
  v45 = 0;
  v46 = 0;
  v11 = v47;
  objc_msgSend_getResourceValue_forKey_error_(v7, v12, (uint64_t)&v46, v8, &v45);
  v13 = v46;
  v14 = v45;

  v17 = 0;
  if (v10 && v13)
  {
    if (objc_msgSend_isEqual_(v10, v15, (uint64_t)v13, v16))
    {
      v44 = 0;
      v19 = *MEMORY[0x1E0C99C90];
      v43 = 0;
      objc_msgSend_getResourceValue_forKey_error_(v6, v18, (uint64_t)&v44, v19, &v43);
      v20 = v44;
      v21 = v43;

      if (v20)
        v17 = objc_msgSend_BOOLValue(v20, v22, v23, v24);
      else
        v17 = 0;

      v14 = v21;
    }
    else
    {
      v17 = 0;
    }
  }

  v42 = 0;
  v26 = objc_msgSend_remainingCapacityAtURL_error_(a1, v25, (uint64_t)v7, (uint64_t)&v42);
  v27 = v42;
  if (v27)
  {
    v29 = v27;
    v30 = -1;
  }
  else
  {
    if (v17)
    {
      objc_opt_self();
      v29 = 0;
      v30 = v26 >> 22 > 0x7C;
      goto LABEL_21;
    }
    v41 = 0;
    v32 = *MEMORY[0x1E0C99998];
    v40 = 0;
    objc_msgSend_getResourceValue_forKey_error_(v6, v28, (uint64_t)&v41, v32, &v40);
    v33 = v41;
    v34 = v40;
    v29 = v34;
    if (v33)
    {
      v38 = objc_msgSend_unsignedIntegerValue(v33, v35, v36, v37);
      objc_opt_self();
      v30 = v26 >= v38 + 524288000;
      if (!v29)
        goto LABEL_21;
    }
    else
    {
      v30 = -1;
      if (!v34)
        goto LABEL_21;
    }
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v31 = ck_log_facility_data_repair;
  if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v29;
    _os_log_error_impl(&dword_18A5C5000, v31, OS_LOG_TYPE_ERROR, "Error determining clonability of repair asset: %@", buf, 0xCu);
  }
LABEL_21:

  return v30;
}

+ (unint64_t)remainingCapacityAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  id v27;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a3;
  objc_msgSend_defaultManager(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v6, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  objc_msgSend_attributesOfFileSystemForPath_error_(v10, v15, (uint64_t)v14, (uint64_t)&v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v27;

  objc_msgSend_objectForKey_(v16, v18, *MEMORY[0x1E0CB2B00], v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v20;
  if (a4 && v17)
  {
    v25 = 0;
    *a4 = objc_retainAutorelease(v17);
  }
  else if (v17)
  {
    v25 = 0;
  }
  else
  {
    v25 = objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23);
  }

  return v25;
}

- (CKAssetRepairSchedulerDelegate)delegate
{
  return (CKAssetRepairSchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setRequestTimeout:(double)a3
{
  self->_requestTimeout = a3;
}

- (void)setRepairBatchCountLimit:(int64_t)a3
{
  self->_repairBatchCountLimit = a3;
}

- (void)setCacheCountLimit:(int64_t)a3
{
  self->_cacheCountLimit = a3;
}

- (void)setDefaultSuspensionTime:(double)a3
{
  self->_defaultSuspensionTime = a3;
}

- (void)setRepairRetryCount:(int64_t)a3
{
  self->_repairRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCountForAssets, 0);
  objc_storeStrong((id *)&self->_uploadSuspensionTimer, 0);
  objc_storeStrong((id *)&self->_uploadPendingRequestTimer, 0);
  objc_storeStrong((id *)&self->_uploadOperationQueue, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_repairContainerOverrides, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_temporaryAssetDirectory, 0);
  objc_storeStrong((id *)&self->_assetsBeingUploaded, 0);
  objc_storeStrong((id *)&self->_assetsBeingRequested, 0);
  objc_storeStrong((id *)&self->_confirmedMissingAssets, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_storeStrong((id *)&self->_remainingAssetsToRequestCallbacks, 0);
}

@end
