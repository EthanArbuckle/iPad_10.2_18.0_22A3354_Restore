@implementation CKDUploadAssetsOperation

- (CKDUploadAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  CKDUploadAssetsOperation *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  dispatch_qos_class_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSArray *assetsToUpload;
  CKDCancelTokenGroup *v22;
  CKDCancelTokenGroup *cancelTokens;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  int isEqualToString;
  CKDAssetRequestPlanner *v37;
  const char *v38;
  CKDAssetRequestPlanner *v39;
  CKDAssetRequestPlanner *assetRequestPlanner;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSMapTable *uploadTasksByPackages;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSDictionary *assetUUIDToExpectedProperties;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  NSDictionary *packageUUIDToExpectedProperties;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  NSDictionary *cloneContextsBySignature;
  objc_super v62;

  v6 = a3;
  v7 = a4;
  v62.receiver = self;
  v62.super_class = (Class)CKDUploadAssetsOperation;
  v8 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v62, sel_initWithOperationInfo_container_, v6, v7);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_QOSClass(v8, v10, v11);
    dispatch_queue_attr_make_with_qos_class(v9, v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = dispatch_queue_create("com.apple.cloudkit.upload", v13);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

    objc_msgSend_assetsToUpload(v6, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v18, v19, (uint64_t)&unk_1E7832EF0);
    v20 = objc_claimAutoreleasedReturnValue();
    assetsToUpload = v8->_assetsToUpload;
    v8->_assetsToUpload = (NSArray *)v20;

    v22 = objc_alloc_init(CKDCancelTokenGroup);
    cancelTokens = v8->_cancelTokens;
    v8->_cancelTokens = v22;

    objc_msgSend_containerID(v7, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_specialContainerType(v26, v27, v28) == 5)
    {
      objc_msgSend_group(v6, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v34, v35, (uint64_t)CFSTR("Compute State Upload"));

      if (isEqualToString)
      {
        v37 = [CKDAssetRequestPlanner alloc];
        v39 = (CKDAssetRequestPlanner *)objc_msgSend_initWithAssetTokenRequestSizeLimit_(v37, v38, 0xFFFFFFFFLL);
LABEL_7:
        assetRequestPlanner = v8->_assetRequestPlanner;
        v8->_assetRequestPlanner = v39;

        objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v41, v42);
        v43 = objc_claimAutoreleasedReturnValue();
        uploadTasksByPackages = v8->_uploadTasksByPackages;
        v8->_uploadTasksByPackages = (NSMapTable *)v43;

        objc_msgSend_assetUUIDToExpectedProperties(v6, v45, v46);
        v47 = objc_claimAutoreleasedReturnValue();
        assetUUIDToExpectedProperties = v8->_assetUUIDToExpectedProperties;
        v8->_assetUUIDToExpectedProperties = (NSDictionary *)v47;

        objc_msgSend_packageUUIDToExpectedProperties(v6, v49, v50);
        v51 = objc_claimAutoreleasedReturnValue();
        packageUUIDToExpectedProperties = v8->_packageUUIDToExpectedProperties;
        v8->_packageUUIDToExpectedProperties = (NSDictionary *)v51;

        v8->_temporary = objc_msgSend_temporary(v6, v53, v54);
        v8->_shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v6, v55, v56);
        objc_msgSend_cloneContextsBySignature(v6, v57, v58);
        v59 = objc_claimAutoreleasedReturnValue();
        cloneContextsBySignature = v8->_cloneContextsBySignature;
        v8->_cloneContextsBySignature = (NSDictionary *)v59;

        goto LABEL_8;
      }
    }
    else
    {

    }
    v39 = objc_alloc_init(CKDAssetRequestPlanner);
    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (int)operationType
{
  return 0;
}

- (id)CKStatusReportLogGroups
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKDUploadAssetsOperation;
  -[CKDOperation CKStatusReportLogGroups](&v19, sel_CKStatusReportLogGroups);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetRequestPlanner(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetRegisterAndPutBatches(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKFlatMap_(v9, v10, (uint64_t)&unk_1E7832CF0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v11, v12, v13))
  {
    if (!v3)
      v3 = (void *)objc_opt_new();
    v16 = (void *)objc_msgSend_mutableCopy(v11, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, CFSTR("MMCS Items"));

  }
  return v3;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  BOOL result;
  uint64_t v27;
  uint64_t v28;

  objc_msgSend_cancelTokens(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllCancelTokens(v4, v5, v6);

  switch(objc_msgSend_state(self, v7, v8))
  {
    case 1:
      objc_msgSend_setState_(self, v9, 2);
      result = MEMORY[0x1E0DE7D20](self, sel__fetchConfiguration, v25);
      break;
    case 2:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_setState_(self, v11, 3);
      result = objc_msgSend__prepareForUpload(self, v12, v13);
      break;
    case 3:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_hash(self, v14, v15);
      kdebug_trace();
      objc_msgSend_setState_(self, v16, 4);
      result = MEMORY[0x1E0DE7D20](self, sel__fetchUploadTokens, v27);
      break;
    case 4:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_hash(self, v17, v18);
      kdebug_trace();
      objc_msgSend_setState_(self, v19, 5);
      result = MEMORY[0x1E0DE7D20](self, sel__upload, v28);
      break;
    case 5:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_setState_(self, v20, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v24, (uint64_t)v23);

      goto LABEL_7;
    default:
LABEL_7:
      result = 1;
      break;
  }
  return result;
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 4)
    return off_1E7832F10[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDUploadAssetsOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_openPackage:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  int v8;
  id v9;
  CKDUploadAssetsOperation *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  id v20;
  const char *v21;
  const char *v22;
  void *v24;
  const char *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 302, CFSTR("Expected non-nil package"));

  }
  v26 = 0;
  v8 = objc_msgSend_openWithError_(v7, v5, (uint64_t)&v26);
  v9 = v26;
  if (v8)
  {
    v10 = self;
    objc_sync_enter(v10);
    objc_msgSend_openedPackages(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (v14)
    {
      v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v17 = (void *)objc_msgSend_initWithObjects_(v20, v21, (uint64_t)v7, 0);
      objc_msgSend_setOpenedPackages_(v10, v22, (uint64_t)v17);
    }
    else
    {
      objc_msgSend_openedPackages(v10, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v17, v18, (uint64_t)v7);
    }

    objc_sync_exit(v10);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v7;
      v29 = 2112;
      v30 = v9;
      _os_log_error_impl(&dword_1BE990000, v19, OS_LOG_TYPE_ERROR, "Failed to open package %@: %@", buf, 0x16u);
    }
  }

  return v9;
}

- (void)_closePackage:(id)a3
{
  const char *v5;
  uint64_t v6;
  CKDUploadAssetsOperation *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  if (!v21)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 320, CFSTR("Expected non-nil package"));

  }
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend_openedPackages(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v21);

  if (v12)
  {
    objc_msgSend_openedPackages(v7, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v15, v16, (uint64_t)v21);

    objc_sync_exit(v7);
    objc_msgSend_close(v21, v17, v18);
  }
  else
  {
    objc_sync_exit(v7);

  }
}

- (void)_closeAllPackages
{
  CKDUploadAssetsOperation *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_openedPackages(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOpenedPackages_(v2, v6, 0);
  objc_sync_exit(v2);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend_close(*(void **)(*((_QWORD *)&v14 + 1) + 8 * v13++), v9, v10, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v14, v18, 16);
    }
    while (v11);
  }

}

- (void)_didPrepareAsset:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  const char *v11;
  _QWORD block[5];
  id v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 348, CFSTR("Expected non-nil asset for %@"), self);

  }
  objc_msgSend_callbackQueue(self, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAC62F0;
  block[3] = &unk_1E782EE20;
  block[4] = self;
  v13 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)_didMakeProgressForAsset:(id)a3 progress:(double)a4
{
  const char *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  const char *v13;
  _QWORD block[5];
  id v15;
  double v16;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 356, CFSTR("Expected non-nil asset for %@"), self);

  }
  objc_msgSend_callbackQueue(self, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAC644C;
  block[3] = &unk_1E7830158;
  block[4] = self;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  dispatch_async(v10, block);

}

- (void)_didUploadAsset:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  _QWORD block[5];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v11 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 364, CFSTR("Expected non-nil asset for %@"), self);

    if (v11)
      goto LABEL_5;
  }
  if ((objc_msgSend_uploaded(v7, v9, v10) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 365, CFSTR("Expected asset %@ to be marked as uploaded for %@"), v7, self);

  }
LABEL_5:
  objc_msgSend_callbackQueue(self, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAC661C;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v20 = v7;
  v21 = v11;
  v13 = v11;
  v14 = v7;
  dispatch_async(v12, block);

}

- (BOOL)_planSectionsForPackage:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  CKDMMCSPackageSignatureGenerator *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  CKDMMCSPackageSignatureGenerator *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;
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
  void *v34;
  const char *v35;
  uint64_t v36;
  CKDMMCSItemGroupSet *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  int v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  int isEqualToData;
  const char *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  id v92;
  const char *v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  NSObject *v100;
  CKDMMCSPackageSignatureGenerator *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  int v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  NSObject *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  NSObject *v144;
  uint64_t v145;
  BOOL v146;
  uint64_t v147;
  void *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  id v153;
  const char *v154;
  void *v155;
  const char *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  NSObject *v161;
  void *v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  const char *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  NSObject *v172;
  int v174;
  const char *v175;
  uint64_t v176;
  dispatch_semaphore_t v178;
  void *v179;
  uint64_t v180;
  id v181;
  void *v182;
  void *v183;
  id obj;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  CKDUploadAssetsOperation *v192;
  unsigned int MaxChunkCountForSection;
  unsigned int v194;
  id v195;
  unsigned int v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  unsigned int v200;
  void *v201;
  void *v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  _QWORD v207[4];
  NSObject *v208;
  uint64_t *v209;
  _QWORD v210[4];
  id v211;
  CKDUploadAssetsOperation *v212;
  uint64_t v213;
  uint64_t *v214;
  uint64_t v215;
  uint64_t (*v216)(uint64_t, uint64_t);
  void (*v217)(uint64_t);
  id v218;
  uint8_t buf[4];
  uint64_t v220;
  __int16 v221;
  uint64_t v222;
  __int16 v223;
  uint64_t v224;
  _BYTE v225[128];
  uint64_t v226;

  v226 = *MEMORY[0x1E0C80C00];
  v181 = a3;
  v192 = self;
  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCS(v7, v8, v9);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  MaxChunkCountForSection = objc_msgSend_getMaxChunkCountForSection(v179, v10, v11);
  if (!MaxChunkCountForSection)
  {
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v12, *MEMORY[0x1E0C94B20], 1000, CFSTR("Invalid maxSectionChunkCount value: %lu"), 0);
      v146 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v146 = 0;
    }
    goto LABEL_83;
  }
  v13 = [CKDMMCSPackageSignatureGenerator alloc];
  objc_msgSend_boundaryKey(v181, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = (void *)objc_msgSend_initWithBoundaryKey_(v13, v17, (uint64_t)v16);

  v18 = [CKDMMCSPackageSignatureGenerator alloc];
  objc_msgSend_boundaryKey(v181, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = (void *)objc_msgSend_initWithBoundaryKey_(v18, v22, (uint64_t)v21);

  v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v202 = (void *)objc_msgSend_initWithCapacity_(v23, v24, 100);
  objc_msgSend_itemEnumerator(v181, v25, v26);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = 0;
  v214 = &v213;
  v215 = 0x3032000000;
  v216 = sub_1BE9BB018;
  v217 = sub_1BE9BADC0;
  v218 = 0;
  v178 = dispatch_semaphore_create(0);
  v186 = 0;
  v187 = 0;
  v198 = 0;
  v199 = 0;
  v194 = 0;
  v200 = 0;
  v196 = 0;
  v176 = *MEMORY[0x1E0C94B20];
  do
  {
    if ((objc_msgSend_isCancelled(v192, v27, v28) & 1) != 0)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v29, v176, 1, CFSTR("Operation was cancelled"));
      v147 = objc_claimAutoreleasedReturnValue();
      v148 = (void *)v214[5];
      v214[5] = v147;

      if (v214[5])
        goto LABEL_64;
      goto LABEL_66;
    }
    while ((unint64_t)objc_msgSend_count(v202, v29, v30) <= 0x63 && v201)
    {
      objc_msgSend_nextObject(v201, v31, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {

        v201 = 0;
        break;
      }
      objc_msgSend_addObject_(v202, v33, (uint64_t)v34);

    }
    if (!objc_msgSend_count(v202, v31, v32))
      break;
    v210[0] = MEMORY[0x1E0C809B0];
    v210[1] = 3221225472;
    v210[2] = sub_1BEAC7510;
    v210[3] = &unk_1E7832D38;
    v195 = v181;
    v211 = v195;
    v212 = v192;
    objc_msgSend_CKMap_(v202, v35, (uint64_t)v210);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = [CKDMMCSItemGroupSet alloc];
    v185 = (void *)objc_msgSend_initWithItems_(v37, v38, v36);
    v183 = (void *)v36;
    v41 = objc_msgSend_useMMCSEncryptionV2(v195, v39, v40);
    v207[0] = MEMORY[0x1E0C809B0];
    if (v41)
      v42 = 66;
    else
      v42 = 2;
    v207[1] = 3221225472;
    v207[2] = sub_1BEAC764C;
    v207[3] = &unk_1E7832D60;
    v209 = &v213;
    v43 = v178;
    v208 = v43;
    objc_msgSend_registerItemGroupSet_operation_options_completionHandler_(v179, v44, (uint64_t)v185, v192, v42, v207);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelTokens(v192, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addCancelToken_withOperation_(v47, v48, (uint64_t)v190, v192);

    dispatch_semaphore_wait(v43, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend_cancelTokens(v192, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeCancelToken_(v51, v52, (uint64_t)v190);

    v180 = v214[5];
    if (v180)
    {
      v53 = 1;
      goto LABEL_54;
    }
    v205 = 0u;
    v206 = 0u;
    v203 = 0u;
    v204 = 0u;
    obj = v183;
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v203, v225, 16);
    if (!v55)
    {
      v53 = 1;
      goto LABEL_53;
    }
    v191 = 0;
    v189 = *(_QWORD *)v204;
LABEL_17:
    v58 = 0;
    v188 = v55;
    while (1)
    {
      if (*(_QWORD *)v204 != v189)
        objc_enumerationMutation(obj);
      v59 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * v58);
      objc_msgSend_error(v59, v56, v57);
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = (void *)v214[5];
      v214[5] = v60;

      if (v214[5])
        goto LABEL_52;
      objc_msgSend_signature(v59, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zeroSizeFileSignature(CKDMMCS, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToData = objc_msgSend_isEqualToData_(v64, v68, (uint64_t)v67);

      if ((isEqualToData & 1) != 0
        || !objc_msgSend_chunkCount(v59, v70, v71)
        || !objc_msgSend_fileSize(v59, v70, v71))
      {
        v72 = (void *)MEMORY[0x1E0C95138];
        objc_msgSend_signature(v59, v70, v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v72) = objc_msgSend_isValidV2Signature_(v72, v74, (uint64_t)v73);

        if (((v72 | isEqualToData) & 1) != 0)
        {
          if (objc_msgSend_chunkCount(v59, v75, v76))
          {
            v174 = 465;
            v175 = "MMCSItem.chunkCount == 0 && \"Expected MMCSItem.chunkCount == 0\";
          }
          else
          {
            if (!objc_msgSend_fileSize(v59, v77, v78))
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v79 = (id)*MEMORY[0x1E0C952B0];
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                v139 = objc_msgSend_itemID(v59, v80, v81);
                *(_DWORD *)buf = 134217984;
                v220 = v139;
                _os_log_debug_impl(&dword_1BE990000, v79, OS_LOG_TYPE_DEBUG, "Zero-length asset with itemID %llu", buf, 0xCu);
              }

              goto LABEL_32;
            }
            v174 = 466;
            v175 = "MMCSItem.fileSize == 0 && \"Expected MMCSItem.size == 0\";
          }
        }
        else
        {
          v174 = 463;
          v175 = "isZeroFileSignature && \"Expected zeroSizeFileSignature\";
        }
LABEL_88:
        __assert_rtn("-[CKDUploadAssetsOperation _planSectionsForPackage:error:]", "CKDUploadAssetsOperation.m", v174, v175);
      }
LABEL_32:
      if (v191 + v58 >= (unint64_t)objc_msgSend_count(v202, v70, v71))
      {
        v174 = 470;
        v175 = "i < packageItems.count";
        goto LABEL_88;
      }
      objc_msgSend_objectAtIndexedSubscript_(v202, v82, v191 + v58);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (MaxChunkCountForSection < v200)
        break;
      if (MaxChunkCountForSection < objc_msgSend_chunkCount(v59, v83, v84) + v200)
      {
        objc_msgSend_dataByFinishingSignature(v197, v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dataByFinishingVerificationKey(v197, v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_alloc(MEMORY[0x1E0C94FD8]);
        v94 = (void *)objc_msgSend_initWithIndex_signature_size_paddedSize_verificationKey_(v92, v93, v194, v88, v198, v199, v91);
        objc_msgSend_addSection_(v195, v95, (uint64_t)v94);
        objc_msgSend_signature(v94, v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_updateWithData_(v182, v99, (uint64_t)v98);

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v100 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v220 = (uint64_t)v94;
          v221 = 2048;
          v222 = v196;
          v223 = 2048;
          v224 = v200;
          _os_log_debug_impl(&dword_1BE990000, v100, OS_LOG_TYPE_DEBUG, "Added section %@ with %lu items and %lu chunks", buf, 0x20u);
        }
        v101 = [CKDMMCSPackageSignatureGenerator alloc];
        objc_msgSend_boundaryKey(v195, v102, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend_initWithBoundaryKey_(v101, v105, (uint64_t)v104);

        v196 = 0;
        v200 = 0;
        ++v194;
        v187 += v198;
        v186 += v199;
        v197 = (void *)v106;
        v198 = 0;
        v199 = 0;
      }
      v107 = objc_msgSend_fileSize(v59, v86, v87);
      objc_msgSend_assetZoneKey(v59, v108, v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_useMMCSEncryptionV2(v110, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend_BOOLValue(v113, v114, v115);

      if (v116)
        v119 = objc_msgSend_paddedFileSize(v59, v117, v118);
      else
        v119 = 0;
      v120 = objc_msgSend_chunkCount(v59, v117, v118);
      objc_msgSend_signature(v59, v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateWithData_(v197, v124, (uint64_t)v123);

      v127 = objc_msgSend_packageIndex(v85, v125, v126);
      objc_msgSend_signature(v59, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend_fileSize(v59, v131, v132);
      v136 = objc_msgSend_itemID(v59, v134, v135);
      objc_msgSend_updateItemAtIndex_withSignature_size_paddedSize_itemID_sectionIndex_(v195, v137, v127, v130, v133, v119, v136, v194);

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v138 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v220 = (uint64_t)v59;
        v221 = 2048;
        v222 = v194;
        _os_log_debug_impl(&dword_1BE990000, v138, OS_LOG_TYPE_DEBUG, "Added item %@ to section %lu", buf, 0x16u);
      }

      v198 += v107;
      v200 += v120;
      v199 += v119;
      ++v196;
      if (v188 == ++v58)
      {
        v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v203, v225, 16);
        v191 += v58;
        v53 = 1;
        if (!v55)
          goto LABEL_53;
        goto LABEL_17;
      }
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v83, v176, 1000, CFSTR("Invalid sectionChunkCount value: %lu"), v200);
    v140 = objc_claimAutoreleasedReturnValue();
    v141 = (void *)v214[5];
    v214[5] = v140;

LABEL_52:
    v53 = 0;
LABEL_53:

    objc_msgSend_removeAllObjects(v202, v142, v143);
LABEL_54:

  }
  while (!v180 && v53);
  if (!v214[5])
  {
LABEL_66:
    if (v196)
    {
      objc_msgSend_dataByFinishingSignature(v197, v27, v28);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataByFinishingVerificationKey(v197, v150, v151);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = objc_alloc(MEMORY[0x1E0C94FD8]);
      v155 = (void *)objc_msgSend_initWithIndex_signature_size_paddedSize_verificationKey_(v153, v154, v194, v149, v198, v199, v152);
      objc_msgSend_addSection_(v181, v156, (uint64_t)v155);
      objc_msgSend_signature(v155, v157, v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateWithData_(v182, v160, (uint64_t)v159);

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v161 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v220 = (uint64_t)v155;
        v221 = 2048;
        v222 = v196;
        v223 = 2048;
        v224 = v200;
        _os_log_debug_impl(&dword_1BE990000, v161, OS_LOG_TYPE_DEBUG, "Added last section %@ with %lu items and %lu chunks", buf, 0x20u);
      }

      v187 += v198;
      v186 += v199;
    }
    objc_msgSend_dataByFinishingSignature(v182, v27, v28);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSignature_(v181, v163, (uint64_t)v162);

    if (objc_msgSend_useMMCSEncryptionV2(v181, v164, v165))
    {
      objc_msgSend_setPaddedSize_(v181, v166, v186);
      objc_msgSend_setSize_(v181, v167, v187);
      objc_msgSend_dataByFinishingVerificationKey(v182, v168, v169);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVerificationKey_(v181, v171, (uint64_t)v170);

    }
    else
    {
      objc_msgSend_setSize_(v181, v166, v187);
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v172 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v220 = (uint64_t)v181;
      _os_log_debug_impl(&dword_1BE990000, v172, OS_LOG_TYPE_DEBUG, "Created sections for package %@", buf, 0xCu);
    }
    v146 = 1;
    goto LABEL_82;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v144 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v145 = v214[5];
    *(_DWORD *)buf = 138412546;
    v220 = (uint64_t)v181;
    v221 = 2112;
    v222 = v145;
    _os_log_error_impl(&dword_1BE990000, v144, OS_LOG_TYPE_ERROR, "Failed to create sections for package %@: %@", buf, 0x16u);
  }
LABEL_64:
  v146 = 0;
  if (a4)
    *a4 = objc_retainAutorelease((id)v214[5]);
LABEL_82:

  _Block_object_dispose(&v213, 8);
LABEL_83:

  return v146;
}

- (void)_didPrepareAssetBatch:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
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
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  unint64_t v54;
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
  char isEqualToData;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  void *v76;
  char isPackageSectionBatch;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
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
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  int v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  unint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  os_log_t *v126;
  uint64_t v127;
  uint64_t v128;
  CKDUploadAssetsOperation *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  const char *v139;
  os_log_t v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  const char *v155;
  os_log_t v156;
  const char *v157;
  void *v158;
  const char *v159;
  const char *v160;
  os_log_t v161;
  NSObject *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  NSObject *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  NSObject *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  unsigned int v180;
  const char *v181;
  uint64_t v182;
  unsigned int v183;
  os_log_t v184;
  const char *v185;
  NSObject *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  void *v194;
  uint64_t v195;
  id obj;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  uint8_t buf[4];
  void *v202;
  __int16 v203;
  uint64_t v204;
  __int16 v205;
  id v206;
  __int16 v207;
  id v208;
  _BYTE v209[128];
  uint64_t v210;

  v210 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v193 = v7;
  v194 = v6;
  if (v7)
  {
    v12 = v7;
    goto LABEL_29;
  }
  objc_msgSend_firstMMCSItemError(v6, v8, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend_packageUUIDToExpectedProperties(self, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13 && (v16 = (void *)v13, v17 = objc_msgSend_isPackageSectionBatch(v6, v14, v15), v16, v17))
    {
      objc_msgSend_allMMCSAndSectionItems(v6, v14, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_count(v18, v19, v20);

      if (v21)
      {
        objc_msgSend_allMMCSAndSectionItems(v6, v10, v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_package(v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_packageUUIDToExpectedProperties(self, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v28, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v31, v35, (uint64_t)v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend_allMMCSAndSectionItems(v6, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend_count(v39, v40, v41);
          v45 = objc_msgSend_count(v36, v43, v44);

          if (v42 != v45)
          {
            v113 = (void *)MEMORY[0x1E0C94FF8];
            v114 = *MEMORY[0x1E0C94B20];
            v115 = objc_msgSend_count(v36, v46, v47);
            objc_msgSend_allMMCSAndSectionItems(v6, v116, v117);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = objc_msgSend_count(v57, v118, v119);
            objc_msgSend_errorWithDomain_code_format_(v113, v121, v114, 3012, CFSTR("Number of expected file signatures did not match number of assets in package %@ (%lu versus %lu)"), v28, v115, v120);
            v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

            goto LABEL_28;
          }
          objc_msgSend_allMMCSAndSectionItems(v6, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend_count(v48, v49, v50);

          if (v51)
          {
            v54 = 0;
            while (1)
            {
              objc_msgSend_allMMCSAndSectionItems(v6, v52, v53);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v55, v56, v54);
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_objectAtIndexedSubscript_(v36, v58, v54);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_fileSignature(v59, v60, v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();

              if (v62)
              {
                objc_msgSend_signature(v57, v63, v64);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                isEqualToData = objc_msgSend_isEqualToData_(v62, v66, (uint64_t)v65);

                if ((isEqualToData & 1) == 0)
                  break;
              }

              ++v54;
              v6 = v194;
              objc_msgSend_allMMCSAndSectionItems(v194, v69, v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = objc_msgSend_count(v71, v72, v73);

              if (v54 >= v74)
                goto LABEL_14;
            }
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v68, *MEMORY[0x1E0C94B20], 3012, CFSTR("Did not find expected file signature for item %@ in package %@"), v57, v28);
            v12 = (id)objc_claimAutoreleasedReturnValue();

            v6 = v194;
            goto LABEL_27;
          }
        }
LABEL_14:
        v12 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      objc_msgSend_assetUUIDToExpectedProperties(self, v14, v15);
      v75 = objc_claimAutoreleasedReturnValue();
      if (v75)
      {
        v76 = (void *)v75;
        isPackageSectionBatch = objc_msgSend_isPackageSectionBatch(v6, v10, v11);

        if ((isPackageSectionBatch & 1) == 0)
        {
          objc_msgSend_allMMCSItems(v6, v10, v11);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend_count(v78, v79, v80);

          if (v81)
          {
            v82 = 0;
            while (1)
            {
              objc_msgSend_allMMCSItems(v6, v10, v11);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v83, v84, v82);
              v85 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_asset(v85, v86, v87);
              v88 = objc_claimAutoreleasedReturnValue();
              if (v88)
              {
                v91 = (void *)v88;
                objc_msgSend_assetUUIDToExpectedProperties(self, v89, v90);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_UUID(v91, v93, v94);
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKey_(v92, v96, (uint64_t)v95);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_fileSignature(v97, v98, v99);
                v100 = (void *)objc_claimAutoreleasedReturnValue();

                if (v100)
                {
                  objc_msgSend_signature(v85, v101, v102);
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  v105 = objc_msgSend_isEqualToData_(v100, v104, (uint64_t)v103);

                  if (!v105)
                  {
                    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v106, *MEMORY[0x1E0C94B20], 3012, CFSTR("Did not find expected file signature for asset %@"), v91);
                    v12 = (id)objc_claimAutoreleasedReturnValue();

                    v6 = v194;
                    goto LABEL_29;
                  }
                }

                v6 = v194;
              }

              ++v82;
              objc_msgSend_allMMCSItems(v6, v107, v108);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = objc_msgSend_count(v109, v110, v111);

              v12 = 0;
              if (v82 >= v112)
                goto LABEL_29;
            }
          }
        }
      }
    }
    v12 = 0;
  }
LABEL_29:
  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  objc_msgSend_allMMCSItems(v6, v10, v11);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v122, (uint64_t)&v197, v209, 16);
  v126 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (!v123)
    goto LABEL_57;
  v127 = v123;
  v128 = *(_QWORD *)v198;
  v195 = *MEMORY[0x1E0C94B20];
  v129 = self;
  do
  {
    v130 = 0;
    do
    {
      if (*(_QWORD *)v198 != v128)
        objc_enumerationMutation(obj);
      v131 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * v130);
      objc_msgSend_package(v131, v124, v125);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_asset(v131, v133, v134);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if (v132)
        {
          objc_msgSend_uploadTasksByPackages(self, v135, v136);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v138, v139, (uint64_t)v132);

          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v140 = *v126;
          if (os_log_type_enabled(*v126, OS_LOG_TYPE_ERROR))
          {
            v166 = v140;
            objc_msgSend_operationID(v129, v167, v168);
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v202 = v131;
            v203 = 2112;
            v204 = (uint64_t)v132;
            v205 = 2114;
            v206 = v169;
            v207 = 2112;
            v208 = v12;
            _os_log_error_impl(&dword_1BE990000, v166, OS_LOG_TYPE_ERROR, "Failed to register MMCS item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);

            v126 = (os_log_t *)MEMORY[0x1E0C952B0];
          }
LABEL_40:
          self = v129;
          objc_msgSend__didUploadAsset_error_(v129, v141, (uint64_t)v132, v12);
          goto LABEL_50;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v156 = *v126;
        if (os_log_type_enabled(*v126, OS_LOG_TYPE_ERROR))
        {
          v170 = v156;
          objc_msgSend_operationID(v129, v171, v172);
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v202 = v131;
          v203 = 2114;
          v204 = (uint64_t)v173;
          v205 = 2112;
          v206 = v12;
          _os_log_error_impl(&dword_1BE990000, v170, OS_LOG_TYPE_ERROR, "Failed to register MMCS item %@ for operation %{public}@: %@", buf, 0x20u);

          v126 = (os_log_t *)MEMORY[0x1E0C952B0];
        }
        self = v129;
        objc_msgSend__didUploadAsset_error_(v129, v157, (uint64_t)v137, v12);
      }
      else
      {
        if (v132)
        {
          if (!objc_msgSend_fileSize(v131, v135, v136))
          {
            objc_msgSend_uploadTasksByPackages(self, v142, v143);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeObjectForKey_(v158, v159, (uint64_t)v132);

            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v160, v195, 1000, CFSTR("Invalid size for the manifest for package %@"), v132);
            v12 = (id)objc_claimAutoreleasedReturnValue();
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v161 = *v126;
            if (os_log_type_enabled(*v126, OS_LOG_TYPE_ERROR))
            {
              v162 = v161;
              objc_msgSend_operationID(v129, v163, v164);
              v165 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v202 = v131;
              v203 = 2112;
              v204 = (uint64_t)v132;
              v205 = 2114;
              v206 = v165;
              v207 = 2112;
              v208 = v12;
              _os_log_error_impl(&dword_1BE990000, v162, OS_LOG_TYPE_ERROR, "Invalid package manifest size for MMCS item %@, package %@ and operation %{public}@: %@", buf, 0x2Au);

              v126 = (os_log_t *)MEMORY[0x1E0C952B0];
            }
            goto LABEL_40;
          }
          v144 = objc_msgSend_size(v132, v142, v143);
          v147 = objc_msgSend_fileSize(v131, v145, v146) + v144;
          v150 = objc_msgSend_paddedSize(v132, v148, v149);
          v153 = objc_msgSend_paddedFileSize(v131, v151, v152) + v150;
          v126 = (os_log_t *)MEMORY[0x1E0C952B0];
          objc_msgSend_setPaddedSize_(v132, v154, v153);
          objc_msgSend_setSize_(v132, v155, v147);
        }
        v12 = 0;
      }
LABEL_50:

      ++v130;
    }
    while (v127 != v130);
    v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v124, (uint64_t)&v197, v209, 16);
    v127 = v174;
  }
  while (v174);
LABEL_57:

  if (v12)
    objc_msgSend_failBatch_(self->_assetRequestPlanner, v175, (uint64_t)v194);
  objc_msgSend_authPutRequest(v194, v175, v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = objc_msgSend_length(v177, v178, v179);
  v183 = objc_msgSend_assetTokenRequestSizeLimit(self->_assetRequestPlanner, v181, v182);

  if (v183 < v180)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v184 = *v126;
    if (os_log_type_enabled(*v126, OS_LOG_TYPE_ERROR))
    {
      v186 = v184;
      objc_msgSend_authPutRequest(v194, v187, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = objc_msgSend_length(v189, v190, v191);
      *(_DWORD *)buf = 138412546;
      v202 = v194;
      v203 = 2048;
      v204 = v192;
      _os_log_error_impl(&dword_1BE990000, v186, OS_LOG_TYPE_ERROR, "Ignoring preAuthPutResponse for batch %@ : too big at %lu bytes", buf, 0x16u);

    }
    objc_msgSend_setAuthPutRequest_(v194, v185, 0);
  }

}

- (BOOL)_fetchConfiguration
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  _QWORD v10[5];

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEAC80D8;
  v10[3] = &unk_1E7830560;
  v10[4] = self;
  objc_msgSend_fetchConfigurationForOperation_withCompletionHandler_(v7, v8, (uint64_t)self, v10);

  return 1;
}

- (id)_prepareAssetForUpload:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  CKDMMCSItem *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  id v29;
  const char *v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_fileURL(v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileHandle(v4, v8, v9);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v7 | v12 || (objc_msgSend_shouldReadAssetContentUsingClientProxy(v4, v10, v11) & 1) != 0)
  {
    v14 = [CKDMMCSItem alloc];
    v17 = objc_msgSend_temporary(self, v15, v16);
    v19 = (void *)objc_msgSend_initWithAsset_temporary_(v14, v18, (uint64_t)v4, v17);
    objc_msgSend_UUID(v4, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrackingUUID_(v19, v23, (uint64_t)v22);

    v45 = 0;
    objc_msgSend_getFileSizeWithOperation_error_(v19, v24, (uint64_t)self, &v45);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v45;
    if (v25)
    {
      if (objc_msgSend_unsignedLongLongValue(v25, v26, v27))
      {
        v29 = v19;
LABEL_19:

        goto LABEL_20;
      }
      v31 = (void *)*MEMORY[0x1E0C952F8];
      if (v7)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v31);
        v32 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v35 = v32;
          objc_msgSend_path((void *)v7, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = (uint64_t)v38;
          _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Skipped uploading empty asset file at %{public}@", buf, 0xCu);

        }
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v31);
        v39 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v12;
          _os_log_debug_impl(&dword_1BE990000, v39, OS_LOG_TYPE_DEBUG, "Skipped uploading empty asset file with filehandle %@", buf, 0xCu);
        }
      }
      objc_msgSend_zeroSizeFileSignature(CKDMMCS, v33, v34);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSignature_(v4, v41, (uint64_t)v40);

      objc_msgSend_setUploaded_(v4, v42, 1);
      objc_msgSend__didUploadAsset_error_(self, v43, (uint64_t)v4, 0);
    }
    else
    {
      objc_msgSend__didUploadAsset_error_(self, v26, (uint64_t)v4, v28);
    }
    v29 = 0;
    goto LABEL_19;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v13, *MEMORY[0x1E0C94B20], 1017, CFSTR("nil fileURL property"));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__didUploadAsset_error_(self, v30, (uint64_t)v4, v28);
  v29 = 0;
LABEL_20:

  return v29;
}

- (id)_prepareReferenceAssetForUpload:(id)a3
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
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  int isEqualToData;
  NSObject *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  NSDictionary *cloneContextsBySignature;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  const char *v49;
  uint8_t v50[16];

  v4 = a3;
  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCS(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_size(v4, v11, v12)
    || (objc_msgSend_signature(v4, v13, v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_zeroSizeFileSignature(CKDMMCS, v16, v17),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToData = objc_msgSend_isEqualToData_(v15, v19, (uint64_t)v18),
        v18,
        v15,
        !isEqualToData))
  {
    objc_msgSend_registeredMMCSItemForRereferencedAsset_(v10, v13, (uint64_t)v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v24;
    if (v24)
      objc_msgSend_error(v24, v25, v26);
    else
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v25, *MEMORY[0x1E0C94B20], 1017, CFSTR("failed to create MMCS item for re-referenced asset"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend__didUploadAsset_error_(self, v28, (uint64_t)v4, v30);
LABEL_18:

      goto LABEL_19;
    }
    v31 = objc_msgSend_databaseScope(self, v28, v29);
    objc_msgSend_setupForReReferenceWithAsset_destinationDatabaseScope_(v27, v32, (uint64_t)v4, v31);
    objc_msgSend_assetZoneKey(v27, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isCrossOwner(v35, v36, v37))
    {
      cloneContextsBySignature = self->_cloneContextsBySignature;
      objc_msgSend_signature(v27, v38, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(cloneContextsBySignature, v42, (uint64_t)v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v44, *MEMORY[0x1E0C94B20], 1017, CFSTR("no clone context for asset clone"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__didUploadAsset_error_(self, v49, (uint64_t)v4, v30);
        goto LABEL_17;
      }
      objc_msgSend_setCloneContext_(v35, v44, (uint64_t)v43);

    }
    objc_msgSend_UUID(v4, v38, v39);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrackingUUID_(v27, v46, (uint64_t)v45);

    objc_msgSend_addMMCSItem_(self->_assetRequestPlanner, v47, (uint64_t)v27);
    v30 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v21 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v50 = 0;
    _os_log_debug_impl(&dword_1BE990000, v21, OS_LOG_TYPE_DEBUG, "Skiped rereference of empty asset", v50, 2u);
  }
  objc_msgSend_setUploaded_(v4, v22, 1);
  objc_msgSend__didUploadAsset_error_(self, v23, (uint64_t)v4, 0);
LABEL_19:

  return 0;
}

- (id)_preparePackageForUpload:(id)a3
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
  const char *v13;
  id v14;
  char v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  CKDMMCSItem *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
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
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  const char *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  unsigned int v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  id v76;
  NSObject *v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  void *v111;
  void *v112;
  void *v113;
  const char *v114;
  os_log_t *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  char v121;
  id v122;
  void *v123;
  os_log_t v124;
  CKDPackageUploadTask *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  void *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  os_log_t v136;
  const char *v137;
  NSObject *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  NSObject *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  NSObject *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  id v161;
  id v162;
  uint8_t buf[4];
  id v164;
  __int16 v165;
  void *v166;
  __int16 v167;
  id v168;
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__openPackage_(self, v11, (uint64_t)v4);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v162 = 0;
    v15 = objc_msgSend__planSectionsForPackage_error_(self, v13, (uint64_t)v4, &v162);
    v14 = v162;
    if ((v15 & 1) == 0)
    {
      objc_msgSend__didUploadAsset_error_(self, v16, (uint64_t)v4, v14);
      goto LABEL_8;
    }
    objc_msgSend_directoryContext(v7, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_temporaryDirectory(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CKCreateGUID();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v21, v23, (uint64_t)v22, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = [CKDMMCSItem alloc];
    v27 = (void *)objc_msgSend_initWithPackage_temporary_(v25, v26, (uint64_t)v4, 1);
    objc_msgSend_setManifestItem_(v4, v28, (uint64_t)v27);
    objc_msgSend_UUID(v4, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrackingUUID_(v27, v32, (uint64_t)v31);

    objc_msgSend_setFileURL_(v27, v33, (uint64_t)v24);
    objc_msgSend_setShouldReadRawEncryptedData_(v27, v34, 0);
    objc_msgSend_setIsPackageManifest_(v27, v35, 1);
    if (objc_msgSend_useEncryption(self, v36, v37))
    {
      v155 = v24;
      v156 = v10;
      objc_msgSend_packageUUIDToExpectedProperties(self, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUID(v4, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v40, v44, (uint64_t)v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_count(v45, v46, v47);
      if (v48 == objc_msgSend_sectionCount(v4, v49, v50) + 1)
      {
        objc_msgSend_packageUUIDToExpectedProperties(self, v51, v52);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v4, v53, v54);
        v157 = v27;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v151, v56, (uint64_t)v55);
        v153 = v40;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v57, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_assetKey(v60, v61, v62);
        v63 = objc_claimAutoreleasedReturnValue();

        v64 = (void *)v63;
        v40 = v153;

        v27 = v157;
      }
      else
      {
        v64 = 0;
      }

      v72 = objc_msgSend_useMMCSEncryptionV2(v4, v70, v71);
      if (v64)
      {
        objc_msgSend_setAssetKey_(v27, v73, (uint64_t)v64);
        v76 = 0;
        v10 = v156;
      }
      else
      {
        v161 = 0;
        v10 = v156;
        v78 = (void *)objc_msgSend_newAssetKeyWithType_withError_(v156, v73, v72, &v161);
        v76 = v161;
        objc_msgSend_setAssetKey_(v27, v79, (uint64_t)v78);

      }
      v24 = v155;
      objc_msgSend_assetKey(v27, v74, v75);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      if (v80 && !v76)
      {
        objc_msgSend_packageUUIDToExpectedProperties(self, v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v4, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v83;
        objc_msgSend_objectForKeyedSubscript_(v83, v87, (uint64_t)v86);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend_count(v88, v89, v90);
        if (v91 == objc_msgSend_sectionCount(v4, v92, v93) + 1)
        {
          objc_msgSend_packageUUIDToExpectedProperties(self, v94, v95);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUID(v4, v96, v97);
          v158 = v27;
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v150, v99, (uint64_t)v98);
          v152 = v64;
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v100, v101, v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_referenceSignature(v103, v104, v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = v152;
          v27 = v158;

        }
        else
        {
          v106 = 0;
        }

        if (v106)
        {
          objc_msgSend_setReferenceSignature_(v27, v107, (uint64_t)v106);
          v10 = v156;
        }
        else
        {
          objc_msgSend_assetKey(v27, v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v156;
          objc_msgSend_referenceSignatureFromAssetKey_(v156, v110, (uint64_t)v109);
          v111 = v64;
          v112 = v27;
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setReferenceSignature_(v112, v114, (uint64_t)v113);

          v27 = v112;
          v64 = v111;

        }
        v24 = v155;

        goto LABEL_30;
      }
      objc_msgSend__didUploadAsset_error_(self, v81, (uint64_t)v4, v14);

      v65 = 0;
    }
    else
    {
      if (!objc_msgSend_useClearAssetEncryption(self, v38, v39))
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v77 = *MEMORY[0x1E0C952B0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          goto LABEL_31;
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE990000, v77, OS_LOG_TYPE_DEBUG, "skipping asset keys on manifest item because encryption is disabled", buf, 2u);
LABEL_30:
        if (*MEMORY[0x1E0C95300] != -1)
        {
          v159 = v27;
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          goto LABEL_32;
        }
LABEL_31:
        v159 = v27;
LABEL_32:
        v115 = (os_log_t *)MEMORY[0x1E0C952B0];
        v116 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v138 = v116;
          objc_msgSend_operationID(self, v139, v140);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v164 = v4;
          v165 = 2114;
          v166 = v141;
          _os_log_debug_impl(&dword_1BE990000, v138, OS_LOG_TYPE_DEBUG, "Creating manifest for package %@ and operation %{public}@", buf, 0x16u);

        }
        objc_msgSend_path(v24, v117, v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = v14;
        v121 = objc_msgSend_writePackage_toFile_error_(CKDPackageManifest, v120, (uint64_t)v4, v119, &v160);
        v122 = v160;

        v123 = (void *)*MEMORY[0x1E0C952F8];
        if ((v121 & 1) != 0)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v123);
          v124 = *v115;
          if (os_log_type_enabled(*v115, OS_LOG_TYPE_DEBUG))
          {
            v142 = v124;
            objc_msgSend_operationID(self, v143, v144);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v164 = v4;
            v165 = 2114;
            v166 = v145;
            v167 = 2114;
            v168 = v24;
            _os_log_debug_impl(&dword_1BE990000, v142, OS_LOG_TYPE_DEBUG, "Wrote the package manifest for package %@ and operation %{public}@: %{public}@", buf, 0x20u);

          }
          v125 = [CKDPackageUploadTask alloc];
          objc_msgSend_uploadProgressBlock(self, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = (void *)objc_msgSend_initWithPackage_trackProgress_(v125, v129, (uint64_t)v4, v128 != 0);

          v27 = v159;
          objc_msgSend_setMMCSManifestItem_(v130, v131, (uint64_t)v159);
          objc_msgSend_uploadTasksByPackages(self, v132, v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v134, v135, (uint64_t)v130, v4);

          v65 = v159;
          v14 = v122;
        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v123);
          v136 = *v115;
          if (os_log_type_enabled(*v115, OS_LOG_TYPE_ERROR))
          {
            v146 = v136;
            objc_msgSend_operationID(self, v147, v148);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v164 = v4;
            v165 = 2114;
            v166 = v149;
            v167 = 2112;
            v168 = v122;
            _os_log_error_impl(&dword_1BE990000, v146, OS_LOG_TYPE_ERROR, "Failed to create the manifest for package %@ and operation %{public}@: %@", buf, 0x20u);

          }
          objc_msgSend__didUploadAsset_error_(self, v137, (uint64_t)v4, v122);
          v65 = 0;
          v14 = v122;
          v27 = v159;
        }
        goto LABEL_45;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v67, *MEMORY[0x1E0C94B20], 1000, CFSTR("clear asset key not supported for package manifests"));
      v68 = objc_claimAutoreleasedReturnValue();

      objc_msgSend__didUploadAsset_error_(self, v69, (uint64_t)v4, v68);
      v65 = 0;
      v14 = (id)v68;
    }
LABEL_45:

    goto LABEL_9;
  }
  v14 = (id)v12;
  objc_msgSend__didUploadAsset_error_(self, v13, (uint64_t)v4, v12);
LABEL_8:
  v65 = 0;
LABEL_9:

  return v65;
}

- (id)_prepareReferencePackageForUpload:(id)a3
{
  void *v4;
  const char *v5;
  _QWORD v7[5];

  objc_msgSend_assets(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEAC8F9C;
  v7[3] = &unk_1E7832D88;
  v7[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v5, (uint64_t)v7);

  return 0;
}

- (BOOL)_planPackageSectionItemsForMMCSItems:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  os_log_t *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  id v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  void *v118;
  const char *v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  void *v130;
  const char *v131;
  os_log_t v132;
  const char *v133;
  NSObject *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  const char *v140;
  void *v141;
  const char *v142;
  BOOL v143;
  NSObject *v144;
  void *v145;
  NSObject *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  __int128 v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  id obj;
  void *v157;
  void *v158;
  CKDUploadAssetsOperation *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  id v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  uint8_t buf[4];
  void *v173;
  __int16 v174;
  id v175;
  _BYTE v176[128];
  uint64_t v177;

  v177 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_container(self, v5, v6);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v153, v7, v8);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  obj = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v168, v176, 16);
  if (!v10)
  {
    v143 = 1;
    goto LABEL_55;
  }
  v13 = v10;
  v14 = *(_QWORD *)v169;
  v15 = &OBJC_IVAR___CKDPRecordResolveTokenRequest__shortTokenHash;
  v16 = (os_log_t *)MEMORY[0x1E0C952B0];
  v17 = &off_1E782A000;
  *(_QWORD *)&v12 = 138412546;
  v151 = v12;
  v159 = self;
  v152 = *(_QWORD *)v169;
LABEL_3:
  v18 = 0;
  v154 = v13;
  while (1)
  {
    if (*(_QWORD *)v169 != v14)
      objc_enumerationMutation(obj);
    v19 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v18);
    v161 = v15[115];
    objc_msgSend_addMMCSItem_(*(void **)((char *)&self->super.super.super.super.isa + v161), v11, (uint64_t)v19, v151);
    objc_msgSend_package(v19, v20, v21);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v166)
      goto LABEL_41;
    v155 = v18;
    v24 = objc_msgSend_sectionCount(v166, v22, v23);
    v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v27 = objc_msgSend_initWithCapacity_(v25, v26, v24);
    v30 = (void *)v27;
    v165 = v24;
    if (v24)
      break;
LABEL_40:
    objc_msgSend_uploadTasksByPackages(self, v28, v29);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v139, v140, (uint64_t)v166);
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setMMCSSectionItems_(v141, v142, (uint64_t)v30);
    v14 = v152;
    v15 = &OBJC_IVAR___CKDPRecordResolveTokenRequest__shortTokenHash;
    v13 = v154;
    v18 = v155;
LABEL_41:

    if (++v18 == v13)
    {
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v168, v176, 16);
      v143 = 1;
      if (!v13)
        goto LABEL_55;
      goto LABEL_3;
    }
  }
  v31 = 0;
  v164 = v24 + 1;
  v160 = (void *)v27;
  while (1)
  {
    objc_msgSend_sectionAtIndex_(v166, v28, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc((Class)v17[349]);
    v35 = (void *)objc_msgSend_initWithPackage_(v33, v34, (uint64_t)v166);
    objc_msgSend_UUID(v166, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrackingUUID_(v35, v39, (uint64_t)v38);

    objc_msgSend_signature(v32, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSignature_(v35, v43, (uint64_t)v42);

    v48 = objc_msgSend_useMMCSEncryptionV2(v166, v44, v45)
        ? objc_msgSend_paddedSize(v32, v46, v47)
        : objc_msgSend_size(v32, v46, v47);
    objc_msgSend_setPaddedFileSize_(v35, v49, v48);
    v52 = objc_msgSend_size(v32, v50, v51);
    objc_msgSend_setFileSize_(v35, v53, v52);
    objc_msgSend_verificationKey(v32, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVerificationKey_(v35, v57, (uint64_t)v56);

    objc_msgSend_addObject_(v30, v58, (uint64_t)v35);
    if (!objc_msgSend_useEncryption(self, v59, v60))
      break;
    v162 = v32;
    objc_msgSend_packageUUIDToExpectedProperties(self, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUID(v166, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v63, v67, (uint64_t)v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v68, v69, v70) == v164)
    {
      objc_msgSend_packageUUIDToExpectedProperties(self, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUID(v166, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v73, v77, (uint64_t)v76);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v78, v79, v31 + 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_assetKey(v80, v81, v82);
      v83 = objc_claimAutoreleasedReturnValue();

      v84 = (void *)v83;
      self = v159;

      v30 = v160;
    }
    else
    {
      v84 = 0;
    }

    objc_msgSend_assetTransferOptions(v166, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_useMMCSEncryptionV2(v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      objc_msgSend_setAssetKey_(v35, v94, (uint64_t)v84);
      v97 = 0;
    }
    else
    {
      v167 = 0;
      v98 = (void *)objc_msgSend_newAssetKeyWithType_withError_(v157, v94, v93 != 0, &v167);
      v97 = v167;
      objc_msgSend_setAssetKey_(v35, v99, (uint64_t)v98);

    }
    objc_msgSend_assetKey(v35, v95, v96);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v100 || v97)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v145 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v147 = v145;
        objc_msgSend_trackingUUID(v35, v148, v149);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v173 = v150;
        v174 = 2112;
        v175 = v97;
        _os_log_error_impl(&dword_1BE990000, v147, OS_LOG_TYPE_ERROR, "error creating asset key for manifest item %{public}@: %@", buf, 0x16u);

      }
      v32 = v162;
      goto LABEL_54;
    }
    objc_msgSend_packageUUIDToExpectedProperties(self, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUID(v166, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v103, v107, (uint64_t)v106);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v108, v109, v110) == v164)
    {
      objc_msgSend_packageUUIDToExpectedProperties(self, v111, v112);
      v158 = v84;
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUID(v166, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v113, v117, (uint64_t)v116);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v118, v119, v31 + 1);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_referenceSignature(v120, v121, v122);
      v123 = objc_claimAutoreleasedReturnValue();

      v124 = (void *)v123;
      v30 = v160;

      self = v159;
      v84 = v158;
    }
    else
    {
      v124 = 0;
    }
    v32 = v162;

    if (v124)
    {
      objc_msgSend_setReferenceSignature_(v35, v125, (uint64_t)v124);
    }
    else
    {
      objc_msgSend_assetKey(v35, v125, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_referenceSignatureFromAssetKey_(v157, v128, (uint64_t)v127);
      v129 = v84;
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setReferenceSignature_(v35, v131, (uint64_t)v130);

      v84 = v129;
    }
    v16 = (os_log_t *)MEMORY[0x1E0C952B0];
    v17 = &off_1E782A000;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v132 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      v134 = v132;
      objc_msgSend_referenceSignature(v35, v135, v136);
      v163 = v124;
      v137 = v84;
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v151;
      v173 = v138;
      v174 = 2112;
      v175 = v35;
      _os_log_debug_impl(&dword_1BE990000, v134, OS_LOG_TYPE_DEBUG, "created asset key with reference identifier %@ for mmcs section %@", buf, 0x16u);

      v84 = v137;
      v124 = v163;

    }
LABEL_37:
    if (objc_msgSend_paddedFileSize(v35, v86, v87))
      objc_msgSend_addMMCSSectionItem_(*(void **)((char *)&self->super.super.super.super.isa + v161), v133, (uint64_t)v35);

    if (v165 == ++v31)
      goto LABEL_40;
  }
  if (!objc_msgSend_useClearAssetEncryption(self, v61, v62))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v85 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v85, OS_LOG_TYPE_DEBUG, "skipping asset keys on section item because encryption is disabled", buf, 2u);
    }
    goto LABEL_37;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v144 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BE990000, v144, OS_LOG_TYPE_ERROR, "clear asset key not supported for package sections.", buf, 2u);
  }
LABEL_54:

  v143 = 0;
LABEL_55:

  return v143;
}

- (void)_registerMMCSItems
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  CKDMMCSItemGroupSet *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  id obj;
  void *v53;
  _QWORD v54[4];
  id v55;
  void *v56;
  CKDUploadAssetsOperation *v57;
  uint8_t buf[16];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCS(v4, v5, v6);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend_assetRegisterAndPutBatches(self->_assetRequestPlanner, v7, v8);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v59, v63, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v60;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v15);
        objc_msgSend_allMMCSItems(v16, v11, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v17, v18, v19))
        {
          objc_msgSend_stateTransitionGroup(self, v20, v21);
          v22 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v22);

          v23 = [CKDMMCSItemGroupSet alloc];
          v25 = (void *)objc_msgSend_initWithItems_(v23, v24, (uint64_t)v17);
          objc_msgSend_allItemGroups(v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v28, v29, v30) != 1)
            __assert_rtn("-[CKDUploadAssetsOperation _registerMMCSItems]", "CKDUploadAssetsOperation.m", 860, "itemGroupSet.allItemGroups.count == 1");

          if ((objc_msgSend_isRereferenceAssetBatch(v16, v31, v32) & 1) != 0)
          {
            objc_msgSend_assetZone(v16, v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetZoneKey(v35, v36, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_cloneContext(v38, v39, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setCloneContext_(v25, v42, (uint64_t)v41);

            v43 = 16;
          }
          else if (objc_msgSend_useMMCSEncryptionV2(v16, v33, v34))
          {
            v43 = 82;
          }
          else
          {
            v43 = 18;
          }
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = sub_1BEAC9B20;
          v54[3] = &unk_1E7832DB0;
          v55 = v25;
          v56 = v16;
          v57 = self;
          v45 = v25;
          objc_msgSend_registerItemGroupSet_operation_options_completionHandler_(v53, v46, (uint64_t)v45, self, v43, v54);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cancelTokens(self, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addCancelToken_withOperation_(v50, v51, (uint64_t)v47, self);

        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v44 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1BE990000, v44, OS_LOG_TYPE_ERROR, "Skipping empty upload batch", buf, 2u);
          }
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v59, v63, 16);
    }
    while (v13);
  }

}

- (BOOL)_prepareForUpload
{
  uint64_t v2;
  BOOL v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  char isReference;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isCancelled(self, a2, v2) & 1) == 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend_assetsToUpload(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_count(v8, v9, v10);
    v13 = (void *)objc_msgSend_initWithCapacity_(v5, v12, v11);

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend_assetsToUpload(self, v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v50, v58, 16);
    if (v18)
    {
      v20 = v18;
      v21 = 0;
      v22 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v51 != v22)
            objc_enumerationMutation(v16);
          v24 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend__prepareForUploadWithOperation_(v24, v19, (uint64_t)self);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          isReference = objc_msgSend_isReference(v24, v26, v27);
          if (v25)
            objc_msgSend_addObject_(v13, v28, (uint64_t)v25);
          v21 |= isReference;

        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v50, v58, 16);
      }
      while (v20);
    }
    else
    {
      v21 = 0;
    }

    if (objc_msgSend_count(v13, v30, v31) || (v21 & 1) != 0)
    {
      if (objc_msgSend__planPackageSectionItemsForMMCSItems_(self, v32, (uint64_t)v13))
      {
        objc_msgSend_resetAssetTokenRequests(self->_assetRequestPlanner, v38, v39);
        objc_msgSend_planRegisterBatches(self->_assetRequestPlanner, v40, v41);
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v42 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v46 = v42;
          objc_msgSend_operationID(self, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v55 = v13;
          v56 = 2114;
          v57 = v49;
          _os_log_debug_impl(&dword_1BE990000, v46, OS_LOG_TYPE_DEBUG, "Registering MMCS items %@ for operation %{public}@", buf, 0x16u);

        }
        objc_msgSend__registerMMCSItems(self, v43, v44);
        v4 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v33 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v34 = v33;
        objc_msgSend_operationID(self, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v37;
        _os_log_debug_impl(&dword_1BE990000, v34, OS_LOG_TYPE_DEBUG, "No assets to upload for operation %{public}@", buf, 0xCu);

      }
    }
    v4 = 0;
LABEL_27:

    return v4;
  }
  return 0;
}

- (void)_failAllItemsInAssetBatch:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
    __assert_rtn("-[CKDUploadAssetsOperation _failAllItemsInAssetBatch:error:]", "CKDUploadAssetsOperation.m", 934, "error");
  v10 = v7;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = v6;
  objc_msgSend_allRegularAndSectionAndRereferenceItems(v6, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v43, v55, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v44;
    v42 = v11;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v18);
        objc_msgSend_package(v19, v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_asset(v19, v21, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend_uploadTasksByPackages(self, v23, v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v26, v27, (uint64_t)v20);

          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v28 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            v32 = v28;
            objc_msgSend_operationID(self, v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v48 = v19;
            v49 = 2112;
            v50 = v20;
            v51 = 2114;
            v52 = v35;
            v53 = 2112;
            v54 = v10;
            _os_log_error_impl(&dword_1BE990000, v32, OS_LOG_TYPE_ERROR, "Failed MMCS item %@, package %@ and operation %{public}@: %@", buf, 0x2Au);

            v11 = v42;
          }
          objc_msgSend__didUploadAsset_error_(self, v29, (uint64_t)v20, v10);
        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v30 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            v36 = v30;
            objc_msgSend_operationID(self, v37, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v48 = v19;
            v49 = 2114;
            v50 = v39;
            v51 = 2112;
            v52 = v10;
            _os_log_error_impl(&dword_1BE990000, v36, OS_LOG_TYPE_ERROR, "Failed MMCS item %@ and operation %{public}@: %@", buf, 0x20u);

            v11 = v42;
          }
          objc_msgSend__didUploadAsset_error_(self, v31, (uint64_t)v25, v10);
        }

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v43, v55, 16);
    }
    while (v16);
  }

  objc_msgSend_failBatch_(self->_assetRequestPlanner, v40, (uint64_t)v41);
}

- (BOOL)_didFetchUploadTokensForAssetTokenRequest:(id)a3 error:(id)a4 newError:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t i;
  void *v20;
  id v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *j;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  void *v41;
  CKDUploadAssetsOperation *v42;
  uint64_t v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend_assetBatches(a3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v49, v54, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v50;
    v42 = self;
    v43 = *MEMORY[0x1E0C94B20];
    v18 = 1;
    v40 = *(_QWORD *)v50;
    v41 = v11;
    while (1)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(v11);
        v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (v8)
        {
          v21 = v8;
          objc_msgSend__failAllItemsInAssetBatch_error_(self, v22, (uint64_t)v20, v21);
          goto LABEL_29;
        }
        objc_msgSend_firstMMCSItemError(*(void **)(*((_QWORD *)&v49 + 1) + 8 * i), v14, v15);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v44 = v18;
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend_allRegularAndSectionAndRereferenceItems(v20, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v45, v53, 16);
          if (v21)
          {
            v29 = *(_QWORD *)v46;
            while (2)
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(_QWORD *)v46 != v29)
                  objc_enumerationMutation(v25);
                objc_msgSend_authToken(*(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j), v27, v28);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v31)
                {
                  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v27, v43, 1000, CFSTR("No authToken received for asset"));
                  v21 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_19;
                }
              }
              v21 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v45, v53, 16);
              if (v21)
                continue;
              break;
            }
LABEL_19:
            v11 = v41;
            self = v42;
            v17 = v40;
          }

          if (objc_msgSend_isRereferenceAssetBatch(v20, v32, v33))
          {
            objc_msgSend_authPutResponse(v20, v23, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v44;
            if (v35)
              goto LABEL_24;
            if ((objc_msgSend_useMMCSEncryptionV2(v20, v36, v37) & 1) == 0)
            {
              objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v23, v43, 1000, CFSTR("No authPutResponse received for re-referenced asset"));
              v38 = objc_claimAutoreleasedReturnValue();
              v35 = v21;
              v21 = (id)v38;
LABEL_24:

            }
            if (!v21)
              goto LABEL_32;
            goto LABEL_28;
          }
          v18 = v44;
          if (!v21)
            goto LABEL_32;
        }
LABEL_28:
        objc_msgSend__failAllItemsInAssetBatch_error_(self, v23, (uint64_t)v20, v21);
LABEL_29:
        if (a5)
        {
          v21 = objc_retainAutorelease(v21);
          v18 = 0;
          *a5 = v21;
        }
        else
        {
          v18 = 0;
        }
LABEL_32:

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v49, v54, 16);
      if (!v16)
        goto LABEL_36;
    }
  }
  LOBYTE(v18) = 1;
LABEL_36:

  return v18 & 1;
}

- (BOOL)_fetchUploadTokens
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  const char *v37;
  uint64_t v38;
  char hasSuccessfulAssetTokenRequests;
  const char *v40;
  uint64_t v41;
  BOOL v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  void *v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t m;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  void *v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t n;
  void *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  void *v114;
  NSObject *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  BOOL v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id obj;
  id obja;
  uint64_t v130;
  uint64_t v131;
  _QWORD v132[6];
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[5];
  uint8_t v165[128];
  uint8_t buf[4];
  void *v167;
  _BYTE v168[128];
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_atomic(self, a2, v2) & 1) != 0)
  {
    v159 = 0u;
    v160 = 0u;
    v157 = 0u;
    v158 = 0u;
    objc_msgSend_assetRegisterAndPutBatches(self->_assetRequestPlanner, v4, v5);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v157, v169, 16);
    if (v7)
    {
      v10 = v7;
      v11 = 0;
      v12 = *(_QWORD *)v158;
      v13 = *MEMORY[0x1E0C94B20];
      v123 = *(_QWORD *)v158;
      do
      {
        v14 = 0;
        v125 = v10;
        do
        {
          if (*(_QWORD *)v158 != v12)
            objc_enumerationMutation(obj);
          v130 = v14;
          v15 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * v14);
          if (objc_msgSend_isFailed(v15, v8, v9))
          {
            objc_msgSend_assetBatchesByZoneID(self->_assetRequestPlanner, v8, v9);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetZone(v15, v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetZoneKey(v19, v20, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_destinationZoneID(v22, v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v16, v26, (uint64_t)v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v155 = 0u;
            v156 = 0u;
            v153 = 0u;
            v154 = 0u;
            v28 = v27;
            v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v153, v168, 16);
            if (v30)
            {
              v33 = v30;
              v34 = *(_QWORD *)v154;
              do
              {
                for (i = 0; i != v33; ++i)
                {
                  if (*(_QWORD *)v154 != v34)
                    objc_enumerationMutation(v28);
                  v36 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
                  if ((objc_msgSend_isFailed(v36, v31, v32) & 1) == 0)
                  {
                    if (!v11)
                    {
                      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v31, v13, 1000, CFSTR("Atomic zone yo; something in the batch failed."));
                      v11 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    objc_msgSend__failAllItemsInAssetBatch_error_(self, v31, (uint64_t)v36, v11);
                  }
                }
                v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v153, v168, 16);
              }
              while (v33);
            }

            v12 = v123;
            v10 = v125;
          }
          v14 = v130 + 1;
        }
        while (v130 + 1 != v10);
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v157, v169, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

  }
  objc_msgSend_planAssetRequests(self->_assetRequestPlanner, v4, v5);
  hasSuccessfulAssetTokenRequests = objc_msgSend_hasSuccessfulAssetTokenRequests(self->_assetRequestPlanner, v37, v38);
  v42 = hasSuccessfulAssetTokenRequests;
  if ((hasSuccessfulAssetTokenRequests & 1) != 0)
  {
    v120 = hasSuccessfulAssetTokenRequests;
    objc_msgSend_uploadPreparationBlock(self, v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      objc_msgSend_assetTokenRequests(self->_assetRequestPlanner, v44, v45);
      v121 = (id)objc_claimAutoreleasedReturnValue();
      v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v46, (uint64_t)&v149, v165, 16);
      if (v124)
      {
        v122 = *(_QWORD *)v150;
        do
        {
          v49 = 0;
          do
          {
            if (*(_QWORD *)v150 != v122)
              objc_enumerationMutation(v121);
            v126 = v49;
            v50 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * v49);
            v145 = 0u;
            v146 = 0u;
            v147 = 0u;
            v148 = 0u;
            objc_msgSend_successfulBatches(v50, v47, v48);
            obja = (id)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v51, (uint64_t)&v145, v164, 16);
            if (v52)
            {
              v55 = v52;
              v131 = *(_QWORD *)v146;
              do
              {
                for (j = 0; j != v55; ++j)
                {
                  if (*(_QWORD *)v146 != v131)
                    objc_enumerationMutation(obja);
                  v57 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * j);
                  v141 = 0u;
                  v142 = 0u;
                  v143 = 0u;
                  v144 = 0u;
                  objc_msgSend_allMMCSItems(v57, v53, v54);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v141, v163, 16);
                  if (v60)
                  {
                    v63 = v60;
                    v64 = *(_QWORD *)v142;
                    do
                    {
                      for (k = 0; k != v63; ++k)
                      {
                        if (*(_QWORD *)v142 != v64)
                          objc_enumerationMutation(v58);
                        v66 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * k);
                        objc_msgSend_error(v66, v61, v62);
                        v67 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v67)
                        {
                          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v68, v69);
                          v76 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v76, v77, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 1017, CFSTR("Expected nil error for %@"), v66);

                        }
                        objc_msgSend_package(v66, v68, v69);
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_asset(v66, v71, v72);
                        v73 = objc_claimAutoreleasedReturnValue();
                        v75 = (void *)v73;
                        if (v70)
                          objc_msgSend__didPrepareAsset_(self, v74, (uint64_t)v70);
                        else
                          objc_msgSend__didPrepareAsset_(self, v74, v73);

                      }
                      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v141, v163, 16);
                    }
                    while (v63);
                  }

                  v139 = 0u;
                  v140 = 0u;
                  v137 = 0u;
                  v138 = 0u;
                  objc_msgSend_allRereferenceMMCSPackageItems(v57, v78, v79);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v137, v162, 16);
                  if (v82)
                  {
                    v85 = v82;
                    v86 = *(_QWORD *)v138;
                    do
                    {
                      for (m = 0; m != v85; ++m)
                      {
                        if (*(_QWORD *)v138 != v86)
                          objc_enumerationMutation(v80);
                        v88 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * m);
                        objc_msgSend_error(v88, v83, v84);
                        v89 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v89)
                        {
                          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v90, v91);
                          v98 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v98, v99, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 1023, CFSTR("Expected nil error for %@"), v88);

                        }
                        objc_msgSend_package(v88, v90, v91);
                        v92 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_asset(v88, v93, v94);
                        v95 = objc_claimAutoreleasedReturnValue();
                        v97 = (void *)v95;
                        if (v92)
                          objc_msgSend__didPrepareAsset_(self, v96, (uint64_t)v92);
                        else
                          objc_msgSend__didPrepareAsset_(self, v96, v95);

                      }
                      v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v83, (uint64_t)&v137, v162, 16);
                    }
                    while (v85);
                  }

                }
                v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v53, (uint64_t)&v145, v164, 16);
              }
              while (v55);
            }

            v49 = v126 + 1;
          }
          while (v126 + 1 != v124);
          v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v47, (uint64_t)&v149, v165, 16);
        }
        while (v124);
      }

    }
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    objc_msgSend_assetTokenRequests(self->_assetRequestPlanner, v44, v45);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v101, (uint64_t)&v133, v161, 16);
    if (v102)
    {
      v105 = v102;
      v106 = *(_QWORD *)v134;
      v107 = MEMORY[0x1E0C809B0];
      do
      {
        for (n = 0; n != v105; ++n)
        {
          if (*(_QWORD *)v134 != v106)
            objc_enumerationMutation(v100);
          v109 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * n);
          if (objc_msgSend_hasSuccessfulBatches(v109, v103, v104))
          {
            v110 = (void *)objc_opt_new();
            objc_msgSend_setAssetTokenRequest_(v110, v111, (uint64_t)v109);
            v112 = objc_opt_class();
            v132[0] = v107;
            v132[1] = 3221225472;
            v132[2] = sub_1BEACAD60;
            v132[3] = &unk_1E782E558;
            v132[4] = self;
            v132[5] = v109;
            objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v113, v112, v110, v132);

          }
        }
        v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v103, (uint64_t)&v133, v161, 16);
      }
      while (v105);
    }

    return v120;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v114 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v116 = v114;
      objc_msgSend_operationID(self, v117, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v167 = v119;
      _os_log_debug_impl(&dword_1BE990000, v116, OS_LOG_TYPE_DEBUG, "No assets to upload for operation %{public}@", buf, 0xCu);

    }
  }
  return v42;
}

- (void)_didUploadMMCSSectionItem:(id)a3 task:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  double v35;
  double v36;
  const char *v37;
  void *v38;
  const char *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_package(v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v8, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v10;
  v19 = v18;

  if (v19)
  {
LABEL_15:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v38 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v40 = v38;
      objc_msgSend_operationID(self, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v49 = v8;
      v50 = 2112;
      v51 = v13;
      v52 = 2114;
      v53 = v43;
      v54 = 2112;
      v55 = v19;
      _os_log_debug_impl(&dword_1BE990000, v40, OS_LOG_TYPE_DEBUG, "Failed to upload MMCS section item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);

    }
    objc_msgSend_setError_(v9, v39, (uint64_t)v19);

  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend_sectionItems(v8, v20, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v44, v56, 16);
    if (v24)
    {
      v27 = v24;
      v28 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v45 != v28)
            objc_enumerationMutation(v22);
          objc_msgSend_error(*(void **)(*((_QWORD *)&v44 + 1) + 8 * i), v25, v26);
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v19 = (id)v30;

            goto LABEL_15;
          }
        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v44, v56, 16);
        if (v27)
          continue;
        break;
      }
    }

    objc_msgSend_progressTracker(v9, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateProgressWithItem_progress_(v33, v34, (uint64_t)v8, 1.0);
    v36 = v35;

    objc_msgSend__didMakeProgressForAsset_progress_(self, v37, (uint64_t)v13, v36);
  }

}

- (void)_didUploadMMCSSectionItems:(id)a3 task:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v28, v38, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v8);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend_finished(v18, v13, v14) & 1) == 0)
        {
          objc_msgSend_setFinished_(v18, v13, 1);
          objc_msgSend__didUploadMMCSSectionItem_task_error_(self, v19, (uint64_t)v18, v9, v10);
        }
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v13, (uint64_t)&v28, v38, 16);
    }
    while (v15);
  }
  if (v10)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v20 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v21 = v20;
      v24 = objc_msgSend_count(v8, v22, v23);
      objc_msgSend_operationID(self, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v33 = v24;
      v34 = 2114;
      v35 = v27;
      v36 = 2112;
      v37 = v10;
      _os_log_debug_impl(&dword_1BE990000, v21, OS_LOG_TYPE_DEBUG, "Failed to upload %lu MMCS section items for operation %{public}@: %@", buf, 0x20u);

    }
  }

}

- (void)_didMakeProgressForMMCSSectionItem:(id)a3 task:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  double v25;
  double v26;
  const char *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  v9 = objc_msgSend_finished(v28, v7, v8);
  objc_msgSend_error(v28, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v12;
  if (v9)
  {
    objc_msgSend__didUploadMMCSSectionItem_task_error_(self, v13, (uint64_t)v28, v6, v12);
LABEL_6:

    goto LABEL_7;
  }
  if (v12)
    goto LABEL_6;
  objc_msgSend_progress(v28, v13, v14);
  if (v18 >= 0.0)
  {
    objc_msgSend_package(v6, v16, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_progressTracker(v6, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_progress(v28, v22, v23);
    objc_msgSend_updateProgressWithItem_progress_(v21, v24, (uint64_t)v28);
    v26 = v25;

    objc_msgSend__didMakeProgressForAsset_progress_(self, v27, (uint64_t)v15, v26);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_uploadPackageSection:(id)a3 task:(id)a4 completionBlock:(id)a5
{
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  CKDMMCSItem *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  char isEqualToData;
  void *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  _BOOL4 v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  id v111;
  NSObject *v112;
  const char *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  NSObject *v121;
  id v122;
  void *v123;
  uint64_t v124;
  const char *v125;
  void *v126;
  const char *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  const char *v131;
  void *v132;
  const char *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  NSObject *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  NSObject *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  NSObject *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  const char *v151;
  unint64_t v153;
  void *v154;
  void *v155;
  void (**v156)(void);
  id v157;
  id v158;
  id v159;
  id v160;
  _QWORD block[4];
  id v162;
  id v163;
  void (**v164)(void);
  _QWORD v165[4];
  id v166;
  id v167;
  CKDUploadAssetsOperation *v168;
  id v169;
  NSObject *v170;
  _QWORD v171[4];
  id v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _BYTE location[12];
  __int16 v179;
  unint64_t v180;
  __int16 v181;
  id v182;
  __int16 v183;
  void *v184;
  _BYTE v185[128];
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v157 = a3;
  v158 = a4;
  v156 = (void (**)(void))a5;
  objc_msgSend_container(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCS(v10, v11, v12);
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_package(v158, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSSectionItems(v158, v16, v17);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_index(v157, v18, v19);
  if (!objc_msgSend_isCancelled(self, v21, v22))
  {
    v160 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v159 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    v153 = v20;
    objc_msgSend_itemEnumeratorForSectionAtIndex_(v15, v26, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v174, v185, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v175;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v175 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * i);
          v33 = [CKDMMCSItem alloc];
          v36 = objc_msgSend_temporary(self, v34, v35);
          v38 = (void *)objc_msgSend_initWithPackage_temporary_(v33, v37, (uint64_t)v15, v36);
          objc_msgSend_UUID(v15, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setTrackingUUID_(v38, v42, (uint64_t)v41);

          v45 = objc_msgSend_itemID(v32, v43, v44);
          objc_msgSend_setItemID_(v38, v46, v45);
          objc_msgSend_fileURL(v32, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setFileURL_(v38, v50, (uint64_t)v49);

          objc_msgSend_deviceID(v32, v51, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setDeviceID_(v38, v54, (uint64_t)v53);

          objc_msgSend_fileID(v32, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setFileID_(v38, v58, (uint64_t)v57);

          objc_msgSend_generationID(v32, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setGenerationID_(v38, v62, (uint64_t)v61);

          objc_msgSend_itemTypeHint(v32, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setItemTypeHint_(v38, v66, (uint64_t)v65);

          v69 = objc_msgSend_packageIndex(v32, v67, v68);
          objc_msgSend_setPackageIndex_(v38, v70, v69);
          if (objc_msgSend_size(v32, v71, v72))
            objc_msgSend_addObject_(v160, v73, (uint64_t)v38);
          else
            objc_msgSend_addObject_(v159, v73, (uint64_t)v38);

        }
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v74, (uint64_t)&v174, v185, 16);
      }
      while (v29);
    }

    if (objc_msgSend_count(v155, v75, v76) <= v153)
    {
      v123 = (void *)MEMORY[0x1E0C94FF8];
      v124 = objc_msgSend_count(v155, v77, v153);
      objc_msgSend_errorWithDomain_code_format_(v123, v125, *MEMORY[0x1E0C94B20], 1000, CFSTR("Invalid section %@ at index %lu/%lu"), v157, v153, v124);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v158, v127, (uint64_t)v126);

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v128 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v138 = v128;
        v141 = objc_msgSend_count(v155, v139, v140);
        *(_DWORD *)location = 134218498;
        *(_QWORD *)&location[4] = v153;
        v179 = 2048;
        v180 = v141;
        v181 = 2112;
        v182 = v157;
        _os_log_error_impl(&dword_1BE990000, v138, OS_LOG_TYPE_ERROR, "Invalid section index %lu/%lu for section %@", location, 0x20u);

      }
      if (v156)
        v156[2]();
      goto LABEL_41;
    }
    objc_msgSend_objectAtIndex_(v155, v77, v153);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend_size(v157, v79, v80);
    if (v81 == objc_msgSend_fileSize(v78, v82, v83)
      && (objc_msgSend_signature(v157, v84, v85),
          v86 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_signature(v78, v87, v88),
          v89 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqualToData = objc_msgSend_isEqualToData_(v86, v90, (uint64_t)v89),
          v89,
          v86,
          (isEqualToData & 1) != 0))
    {
      CKCreateGUID();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPutPackageSectionIdentifier_(v78, v93, (uint64_t)v92);

      objc_msgSend_setSectionItems_(v78, v94, (uint64_t)v160);
      if ((objc_msgSend_useEncryption(self, v95, v96) & 1) != 0
        || objc_msgSend_useClearAssetEncryption(self, v97, v98))
      {
        if (objc_msgSend_fileSize(v78, v97, v98))
        {
          objc_msgSend_referenceSignature(v78, v97, v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = v99 == 0;

          if (v100)
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v97, v98);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v101, v102, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 1169, CFSTR("Expected non-nil reference signature for %@"), v78);

          }
        }
      }
      if (objc_msgSend_fileSize(v78, v97, v98))
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v105 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v146 = v105;
          objc_msgSend_operationID(self, v147, v148);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138413058;
          *(_QWORD *)&location[4] = v78;
          v179 = 2048;
          v180 = v153;
          v181 = 2112;
          v182 = v15;
          v183 = 2114;
          v184 = v149;
          _os_log_debug_impl(&dword_1BE990000, v146, OS_LOG_TYPE_DEBUG, "Uploading MMCS section item %@ at index %lu for package %@ and operation %{public}@", location, 0x2Au);

        }
        v106 = dispatch_group_create();
        dispatch_group_enter(v106);
        objc_initWeak((id *)location, self);
        objc_msgSend_MMCSRequestOptions(v158, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = MEMORY[0x1E0C809B0];
        v171[0] = MEMORY[0x1E0C809B0];
        v171[1] = 3221225472;
        v171[2] = sub_1BEACBFAC;
        v171[3] = &unk_1E7832E00;
        objc_copyWeak(&v173, (id *)location);
        v172 = v158;
        v165[0] = v110;
        v165[1] = 3221225472;
        v165[2] = sub_1BEACC004;
        v165[3] = &unk_1E7832E28;
        v166 = v78;
        v167 = v159;
        v168 = self;
        v111 = v172;
        v169 = v111;
        v112 = v106;
        v170 = v112;
        objc_msgSend_putSectionItem_operation_options_progress_completionHandler_(v154, v113, (uint64_t)v166, self, v109, v171, v165);
        v114 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_cancelTokens(v111, v115, v116);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addCancelToken_withOperation_(v117, v118, (uint64_t)v114, self);

        objc_msgSend_qualityOfService(self, v119, v120);
        CKGetGlobalQueue();
        v121 = objc_claimAutoreleasedReturnValue();
        block[0] = v110;
        block[1] = 3221225472;
        block[2] = sub_1BEACC0E8;
        block[3] = &unk_1E782F678;
        v162 = v111;
        v163 = v114;
        v164 = v156;
        v122 = v114;
        dispatch_group_notify(v112, v121, block);

        objc_destroyWeak(&v173);
        objc_destroyWeak((id *)location);

        goto LABEL_40;
      }
      if (objc_msgSend_count(v160, v103, v104))
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v135, v136);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v150, v151, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 1172, CFSTR("Expected 0 non-empty items in the empty section %@"), v78);

      }
      objc_msgSend_setSectionItems_(v78, v135, (uint64_t)v159);
      objc_msgSend__didUploadMMCSSectionItem_task_error_(self, v137, (uint64_t)v78, v158, 0);
      if (!v156)
        goto LABEL_40;
    }
    else
    {
      v129 = (void *)MEMORY[0x1E0C94FF8];
      v130 = objc_msgSend_count(v155, v84, v85);
      objc_msgSend_errorWithDomain_code_format_(v129, v131, *MEMORY[0x1E0C94B20], 1000, CFSTR("Invalid section %@ at index %lu/%lu"), v157, v153, v130);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v158, v133, (uint64_t)v132);

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v134 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v142 = v134;
        v145 = objc_msgSend_count(v155, v143, v144);
        *(_DWORD *)location = 134218754;
        *(_QWORD *)&location[4] = v153;
        v179 = 2048;
        v180 = v145;
        v181 = 2112;
        v182 = v157;
        v183 = 2112;
        v184 = v78;
        _os_log_error_impl(&dword_1BE990000, v142, OS_LOG_TYPE_ERROR, "Invalid section at index %lu/%lu for section %@: %@", location, 0x2Au);

      }
      if (!v156)
        goto LABEL_40;
    }
    v156[2]();
LABEL_40:

LABEL_41:
    goto LABEL_42;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v23, *MEMORY[0x1E0C94B20], 1, CFSTR("Operation was cancelled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setError_(v158, v25, (uint64_t)v24);

  if (v156)
    v156[2]();
LABEL_42:

}

- (void)_uploadPackageSectionsWithEnumerator:(id)a3 task:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void (**v22)(_QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend_error(v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 || (objc_msgSend_nextObject(v8, v14, v15), (v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v10)
      v10[2](v10);
  }
  else
  {
    v17 = (void *)v16;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1BEACC254;
    v19[3] = &unk_1E78303B0;
    v19[4] = self;
    v20 = v8;
    v21 = v9;
    v22 = v10;
    objc_msgSend__uploadPackageSection_task_completionBlock_(self, v18, (uint64_t)v17, v21, v19);

  }
}

- (void)_uploadPackageSectionsWithTask:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  id v25;
  const char *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  CKDMMCSRequestOptions *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
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
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  _QWORD v73[5];
  id v74;
  void (**v75)(_QWORD);
  void *v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend_package(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSSectionItems(v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_sectionCount(v10, v14, v15);
  if (objc_msgSend_isCancelled(self, v17, v18))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v19, *MEMORY[0x1E0C94B20], 1, CFSTR("Operation was cancelled"));
    goto LABEL_16;
  }
  if (v16 == objc_msgSend_count(v13, v19, v20))
  {
    v23 = (_QWORD *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v24 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v63 = v24;
      objc_msgSend_operationID(self, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v78 = (uint64_t)v13;
      v79 = 2112;
      v80 = v10;
      v81 = 2114;
      v82 = v66;
      _os_log_debug_impl(&dword_1BE990000, v63, OS_LOG_TYPE_DEBUG, "Uploading MMCS section items %@ for package %@ and operation %{public}@", buf, 0x20u);

    }
    v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v28 = (void *)objc_msgSend_initWithCapacity_(v25, v26, v16);
    if (!v16)
    {
LABEL_12:
      v72 = v13;
      v33 = [CKDMMCSRequestOptions alloc];
      v35 = (void *)objc_msgSend_initWithOperation_(v33, v34, (uint64_t)self);
      objc_msgSend_record(v10, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneName(v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        v76 = v47;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v48, (uint64_t)&v76, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setZoneNames_(v35, v50, (uint64_t)v49);

      }
      objc_msgSend_setMMCSRequestOptions_(v6, v48, (uint64_t)v35);
      objc_msgSend_objectEnumerator(v28, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = sub_1BEACC708;
      v73[3] = &unk_1E782F678;
      v73[4] = self;
      v74 = v10;
      v75 = v7;
      objc_msgSend__uploadPackageSectionsWithEnumerator_task_completionBlock_(self, v54, (uint64_t)v53, v6, v73);

      v13 = v72;
      goto LABEL_23;
    }
    v29 = 0;
    while (1)
    {
      objc_msgSend_sectionAtIndex_(v10, v27, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
        break;
      v32 = (void *)v30;
      objc_msgSend_addObject_(v28, v31, v30);

      if (v16 == ++v29)
        goto LABEL_12;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v31, *MEMORY[0x1E0C94B20], 1000, CFSTR("Can't find section at index %lu"), v29);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(v6, v61, (uint64_t)v60);

    if (*v23 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v62 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v67 = v62;
      objc_msgSend_operationID(self, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v78 = v29;
      v79 = 2112;
      v80 = v10;
      v81 = 2114;
      v82 = v70;
      _os_log_error_impl(&dword_1BE990000, v67, OS_LOG_TYPE_ERROR, "Can't find section at index %lu for package %@ and operation %{public}@", buf, 0x20u);

      if (!v7)
        goto LABEL_23;
    }
    else if (!v7)
    {
LABEL_23:

      goto LABEL_24;
    }
    v7[2](v7);
    goto LABEL_23;
  }
  v55 = (void *)MEMORY[0x1E0C94FF8];
  v56 = *MEMORY[0x1E0C94B20];
  v71 = objc_msgSend_count(v13, v21, v22);
  objc_msgSend_errorWithDomain_code_format_(v55, v57, v56, 1000, CFSTR("Invalid section count %lu/%lu"), v16, v71);
LABEL_16:
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setError_(v6, v59, (uint64_t)v58);

  if (v7)
    v7[2](v7);
LABEL_24:

}

- (void)_uploadPackageSectionsWithPendingTasks:(id)a3 uploadingTasks:(id)a4 completedTasks:(id)a5
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  _QWORD block[4];
  id v32;
  id v33;
  CKDUploadAssetsOperation *v34;
  id v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend_maxPackageUploadsPerBatch(self, v12, v13))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 1259, CFSTR("Expected non-0 maxPackageUploadsPerBatch"));

  }
  v16 = objc_msgSend_count(v10, v14, v15);
  if (v16 > objc_msgSend_maxPackageUploadsPerBatch(self, v17, v18))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 1260, CFSTR("Expected max uploading tasks: %@"), v10);

    if (!v11)
      goto LABEL_7;
  }
  else if (!v11)
  {
    goto LABEL_7;
  }
  if (!objc_msgSend_count(v11, v19, v20))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 1261, CFSTR("Expected completed tasks: %@"), v11);

  }
LABEL_7:
  objc_msgSend_queue(self, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEACC928;
  block[3] = &unk_1E782F4A8;
  v32 = v10;
  v33 = v11;
  v34 = self;
  v35 = v9;
  v22 = v9;
  v23 = v11;
  v24 = v10;
  dispatch_async(v21, block);

}

- (void)_didUploadMMCSItem:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  double v41;
  double v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  const char *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  const char *v68;
  uint8_t buf[4];
  id v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend_error(v7, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v8;
  v14 = v13;

  objc_msgSend_package(v7, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asset(v7, v18, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v23 = (void *)*MEMORY[0x1E0C952F8];
    if (v17)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v23);
      v24 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v59 = v24;
        objc_msgSend_operationID(self, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v70 = v7;
        v71 = 2112;
        v72 = v17;
        v73 = 2114;
        v74 = v62;
        v75 = 2112;
        v76 = v14;
        _os_log_debug_impl(&dword_1BE990000, v59, OS_LOG_TYPE_DEBUG, "Failed to upload MMCS item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);

      }
      objc_msgSend_uploadTasksByPackages(self, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v27, v28, (uint64_t)v17);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setError_(v29, v30, (uint64_t)v14);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v23);
      v44 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v63 = v44;
        objc_msgSend_operationID(self, v64, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v70 = v7;
        v71 = 2114;
        v72 = v66;
        v73 = 2112;
        v74 = v14;
        _os_log_debug_impl(&dword_1BE990000, v63, OS_LOG_TYPE_DEBUG, "Failed to upload MMCS item %@ for operation %{public}@: %@", buf, 0x20u);

      }
      objc_msgSend__didUploadAsset_error_(self, v45, (uint64_t)v22, v14);
    }
  }
  else
  {
    v31 = objc_msgSend_fileSize(v7, v20, v21);
    if (v17)
    {
      if (!v31)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v32, v33);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v67, v68, (uint64_t)a2, self, CFSTR("CKDUploadAssetsOperation.m"), 1312, CFSTR("Expected non-0 size for the manifest for package %@"), v17);

      }
      objc_msgSend_uploadTasksByPackages(self, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v34, v35, (uint64_t)v17);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_progressTracker(v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateProgressWithItem_progress_(v39, v40, (uint64_t)v7, 1.0);
      v42 = v41;

      objc_msgSend__didMakeProgressForAsset_progress_(self, v43, (uint64_t)v17, v42);
    }
    else
    {
      if (v31)
      {
        objc_msgSend_uploadReceipt(v7, v32, v33);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setUploadReceipt_(v22, v47, (uint64_t)v46);
        objc_msgSend_setUploaded_(v22, v48, v46 != 0);

      }
      else
      {
        objc_msgSend_setUploadReceipt_(v22, v32, 0);
      }
      objc_msgSend_uploadReceiptExpiration(v7, v49, v50);
      objc_msgSend_setUploadReceiptExpiration_(v22, v51, v52);
      v55 = objc_msgSend_paddedFileSize(v7, v53, v54);
      objc_msgSend_setPaddedFileSize_(v22, v56, v55);
      objc_msgSend__didMakeProgressForAsset_progress_(self, v57, (uint64_t)v22, 1.0);
      objc_msgSend__didUploadAsset_error_(self, v58, (uint64_t)v22, 0);
    }
  }

}

- (void)_collectMetricsFromMMCSOperationMetrics:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  if (objc_msgSend_count(v7, v4, v5))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1BEACD144;
    v8[3] = &unk_1E78305B0;
    v9 = v7;
    objc_msgSend_updateMMCSMetrics_(self, v6, (uint64_t)v8);

  }
}

- (void)_collectMetricsFromCompletedItemGroup:(id)a3
{
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_metrics(a3, a2, (uint64_t)a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4;
  if (v4)
  {
    v9[0] = v4;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__collectMetricsFromMMCSOperationMetrics_(self, v8, (uint64_t)v7);

  }
}

- (void)_collectMetricsFromCompletedItemGroupSet:(id)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  id v7;

  objc_msgSend_allItemGroups(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v4, v5, (uint64_t)&unk_1E7832E48);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__collectMetricsFromMMCSOperationMetrics_(self, v6, (uint64_t)v7);
}

- (void)_didUploadMMCSItems:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v25, v35, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend_finished(v15, v10, v11) & 1) == 0)
        {
          objc_msgSend_setFinished_(v15, v10, 1);
          objc_msgSend__didUploadMMCSItem_error_(self, v16, (uint64_t)v15, v7);
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v25, v35, 16);
    }
    while (v12);
  }
  if (v7)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v18 = v17;
      v21 = objc_msgSend_count(v6, v19, v20);
      objc_msgSend_operationID(self, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v30 = v21;
      v31 = 2114;
      v32 = v24;
      v33 = 2112;
      v34 = v7;
      _os_log_debug_impl(&dword_1BE990000, v18, OS_LOG_TYPE_DEBUG, "Failed to upload %lu MMCS items for operation %{public}@: %@", buf, 0x20u);

    }
  }

}

- (void)_didMakeProgressForMMCSItem:(id)a3
{
  const char *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  double v27;
  double v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  double v33;
  id v34;

  v34 = a3;
  v6 = objc_msgSend_finished(v34, v4, v5);
  objc_msgSend_error(v34, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v9;
  if (v6)
  {
    objc_msgSend__didUploadMMCSItem_error_(self, v10, (uint64_t)v34, v9);
LABEL_9:

    goto LABEL_10;
  }
  if (v9)
    goto LABEL_9;
  objc_msgSend_progress(v34, v10, v11);
  if (v15 >= 0.0)
  {
    objc_msgSend_package(v34, v13, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend_uploadTasksByPackages(self, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v18, v19, (uint64_t)v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_progressTracker(v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_progress(v34, v24, v25);
      objc_msgSend_updateProgressWithItem_progress_(v23, v26, (uint64_t)v34);
      v28 = v27;

      objc_msgSend__didMakeProgressForAsset_progress_(self, v29, (uint64_t)v12, v28);
    }
    else
    {
      objc_msgSend_asset(v34, v16, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_progress(v34, v30, v31);
      objc_msgSend__didMakeProgressForAsset_progress_(self, v32, (uint64_t)v20, v33);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)_didUploadPackageWithTask:(id)a3
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
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
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
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  void *inited;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  int v72;
  const char *v73;
  uint64_t v74;
  void **v75;
  _QWORD *v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  void *v83;
  const char *v84;
  const char *v85;
  int v86;
  void *v87;
  NSObject *v88;
  NSObject *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  int v142;
  void *v143;
  NSObject *v144;
  NSObject *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  const char *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  id obj;
  void *v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint8_t buf[16];
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_package(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_setUploaded_(v7, v11, 0);
    objc_msgSend_setAssets_(v7, v13, 0);
    objc_msgSend_error(v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__didUploadAsset_error_(self, v17, (uint64_t)v7, v16);

    goto LABEL_46;
  }
  objc_msgSend_container(self, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_MMCSSectionItems(v4, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSManifestItem(v4, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_record(v7, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_count(v24, v31, v32) + 1;
  v34 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v163 = (void *)objc_msgSend_initWithCapacity_(v34, v35, v33);
  v36 = objc_alloc(MEMORY[0x1E0C94BB8]);
  inited = (void *)objc_msgSend_initInternal(v36, v37, v38);
  objc_msgSend_setRecord_(inited, v40, (uint64_t)v30);
  v41 = v7;
  objc_msgSend_recordKey(v7, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordKey_(inited, v45, (uint64_t)v44);

  objc_msgSend_signature(v27, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSignature_(inited, v49, (uint64_t)v48);

  v52 = objc_msgSend_fileSize(v27, v50, v51);
  objc_msgSend_setSize_(inited, v53, v52);
  v56 = objc_msgSend_paddedFileSize(v27, v54, v55);
  objc_msgSend_setPaddedFileSize_(inited, v57, v56);
  objc_msgSend_uploadReceipt(v27, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUploadReceipt_(inited, v61, (uint64_t)v60);

  objc_msgSend_uploadReceiptExpiration(v27, v62, v63);
  objc_msgSend_setUploadReceiptExpiration_(inited, v64, v65);
  objc_msgSend_uploadReceipt(v27, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUploaded_(inited, v69, v68 != 0);

  v72 = objc_msgSend_useEncryption(self, v70, v71);
  v75 = (void **)MEMORY[0x1E0C952F8];
  v76 = (_QWORD *)MEMORY[0x1E0C95300];
  v161 = v4;
  if (v72)
  {
    objc_msgSend_assetKey(v27, v73, v74);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssetKey_(inited, v78, (uint64_t)v77);

    objc_msgSend_assetKey(inited, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_referenceSignatureFromAssetKey_(v21, v82, (uint64_t)v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReferenceSignature_(inited, v84, (uint64_t)v83);

  }
  else
  {
    v86 = objc_msgSend_useClearAssetEncryption(self, v73, v74);
    v87 = *v75;
    if (v86)
    {
      if (*v76 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v87);
      v88 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE990000, v88, OS_LOG_TYPE_ERROR, "Clear Asset Key Not Supported For Package Manifests.", buf, 2u);
      }
    }
    else
    {
      if (*v76 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v87);
      v89 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE990000, v89, OS_LOG_TYPE_DEBUG, "Skipping asset keys on manifest item because encryption is disabled", buf, 2u);
      }
    }
  }
  v159 = v27;
  v160 = v21;
  objc_msgSend_addObject_(v163, v85, (uint64_t)inited);
  v158 = inited;
  v92 = objc_msgSend_uploaded(inited, v90, v91);
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  obj = v24;
  v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v93, (uint64_t)&v164, v169, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v165;
    do
    {
      v97 = 0;
      do
      {
        if (*(_QWORD *)v165 != v96)
          objc_enumerationMutation(obj);
        v98 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * v97);
        v99 = objc_alloc(MEMORY[0x1E0C94BB8]);
        v102 = (void *)objc_msgSend_initInternal(v99, v100, v101);
        objc_msgSend_setRecord_(v102, v103, (uint64_t)v30);
        objc_msgSend_recordKey(v41, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRecordKey_(v102, v107, (uint64_t)v106);

        objc_msgSend_signature(v98, v108, v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSignature_(v102, v111, (uint64_t)v110);

        v114 = objc_msgSend_fileSize(v98, v112, v113);
        objc_msgSend_setSize_(v102, v115, v114);
        v118 = objc_msgSend_paddedFileSize(v98, v116, v117);
        objc_msgSend_setPaddedFileSize_(v102, v119, v118);
        if (objc_msgSend_fileSize(v98, v120, v121))
        {
          objc_msgSend_uploadReceipt(v98, v122, v123);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setUploadReceipt_(v102, v125, (uint64_t)v124);

        }
        else
        {
          objc_msgSend_setUploadReceipt_(v102, v122, 0);
        }
        objc_msgSend_uploadReceiptExpiration(v98, v126, v127);
        objc_msgSend_setUploadReceiptExpiration_(v102, v128, v129);
        if (objc_msgSend_useEncryption(self, v130, v131))
        {
          objc_msgSend_assetKey(v98, v132, v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAssetKey_(v102, v135, (uint64_t)v134);

          objc_msgSend_referenceSignature(v98, v136, v137);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setReferenceSignature_(v102, v139, (uint64_t)v138);

        }
        else
        {
          v142 = objc_msgSend_useClearAssetEncryption(self, v132, v133);
          v143 = (void *)*MEMORY[0x1E0C952F8];
          if (v142)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], v143);
            v144 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1BE990000, v144, OS_LOG_TYPE_ERROR, "Clear Asset Key Not Supported For Package Section.", buf, 2u);
            }
          }
          else
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], v143);
            v145 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1BE990000, v145, OS_LOG_TYPE_DEBUG, "Skipping asset keys on section item because encryption is disabled", buf, 2u);
            }
          }
        }
        if (objc_msgSend_fileSize(v98, v140, v141))
        {
          objc_msgSend_uploadReceipt(v98, v146, v147);
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setUploaded_(v102, v149, v148 != 0);

          if ((v92 & 1) != 0)
            goto LABEL_35;
        }
        else
        {
          objc_msgSend_setUploaded_(v102, v146, 1);
          if ((v92 & 1) != 0)
          {
LABEL_35:
            v92 = objc_msgSend_uploaded(v102, v150, v151);
            goto LABEL_38;
          }
        }
        v92 = 0;
LABEL_38:
        if (objc_msgSend_fileSize(v98, v150, v151))
          objc_msgSend_addObject_(v163, v152, (uint64_t)v102);

        ++v97;
      }
      while (v95 != v97);
      v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v153, (uint64_t)&v164, v169, 16);
    }
    while (v95);
  }

  if ((_DWORD)v92)
    v155 = (uint64_t)v163;
  else
    v155 = 0;
  v7 = v41;
  objc_msgSend_setAssets_(v41, v154, v155);
  objc_msgSend_setUploaded_(v41, v156, v92);
  objc_msgSend__didUploadAsset_error_(self, v157, (uint64_t)v41, 0);

  v4 = v161;
LABEL_46:

}

- (BOOL)_upload
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  unint64_t v49;
  const char *v50;
  unint64_t v51;
  void *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  char isReference;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  NSObject *v92;
  NSObject *v93;
  const char *v94;
  uint64_t v95;
  NSObject *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  char isFailed;
  CKDMMCSItemGroupSet *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  id v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  id v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t n;
  const char *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  const char *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  NSObject *v136;
  void *v137;
  const char *v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  CKDMMCSItemGroupSet *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  void *ii;
  void *v164;
  void *v165;
  const char *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t jj;
  void *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  CKDMMCSRequestOptions *v180;
  const char *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  int v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  char v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  void *v206;
  const char *v207;
  const char *v208;
  uint64_t v209;
  uint64_t shouldCloneFileInAssetCache;
  const char *v211;
  const char *v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  void *v218;
  NSObject *v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  NSObject *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  id v229;
  uint64_t v230;
  char hasSuccessfulBatches;
  uint64_t v232;
  uint64_t m;
  void *v234;
  void *v235;
  void *v236;
  id v237;
  id obj;
  id obja;
  id objb;
  id v241;
  id v242;
  id v243;
  NSObject *group;
  _QWORD v245[6];
  NSObject *v246;
  _QWORD v247[4];
  id v248;
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
  __int128 v262;
  __int128 v263;
  __int128 v264;
  _QWORD v265[6];
  NSObject *v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  _QWORD block[5];
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  _BYTE v284[128];
  _BYTE location[12];
  __int16 v286;
  unint64_t v287;
  _BYTE v288[128];
  _BYTE v289[128];
  uint64_t v290;

  v290 = *MEMORY[0x1E0C80C00];
  hasSuccessfulBatches = objc_msgSend_hasSuccessfulBatches(self->_assetRequestPlanner, a2, v2);
  if ((hasSuccessfulBatches & 1) != 0)
  {
    objc_msgSend_container(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_MMCS(v6, v7, v8);
    v228 = (void *)objc_claimAutoreleasedReturnValue();

    group = dispatch_group_create();
    dispatch_group_enter(group);
    objc_msgSend_stateTransitionGroup(self, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v11);

    objc_msgSend_qualityOfService(self, v12, v13);
    CKGetGlobalQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEACEA50;
    block[3] = &unk_1E782EA40;
    block[4] = self;
    dispatch_group_notify(group, v14, block);

    v277 = 0u;
    v278 = 0u;
    v275 = 0u;
    v276 = 0u;
    objc_msgSend_assetRegisterAndPutBatches(self->_assetRequestPlanner, v15, v16);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v275, v289, 16);
    if (v20)
    {
      v241 = *(id *)v276;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(id *)v276 != v241)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * i);
          if ((objc_msgSend_isFailed(v22, v18, v19) & 1) == 0)
          {
            v273 = 0u;
            v274 = 0u;
            v271 = 0u;
            v272 = 0u;
            objc_msgSend_allMMCSAndSectionItems(v22, v18, v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v271, v288, 16);
            if (v27)
            {
              v28 = *(_QWORD *)v272;
              do
              {
                for (j = 0; j != v27; ++j)
                {
                  if (*(_QWORD *)v272 != v28)
                    objc_enumerationMutation(v23);
                  objc_msgSend_package(*(void **)(*((_QWORD *)&v271 + 1) + 8 * j), v25, v26);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v32)
                  {
                    objc_msgSend_uploadTasksByPackages(self, v30, v31);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKey_(v33, v34, (uint64_t)v32);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend_group(v35, v36, v37);
                    v38 = objc_claimAutoreleasedReturnValue();
                    dispatch_group_enter(v38);

                  }
                }
                v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v271, v288, 16);
              }
              while (v27);
            }

          }
        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v275, v289, 16);
      }
      while (v20);
    }

    objc_msgSend_uploadTasksByPackages(self, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_count(v41, v42, v43);

    if (v44)
    {
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_maxPackageUploadsPerBatchWithDefaultValue_(v47, v48, 6);

      if (v49 <= 1)
        v51 = 1;
      else
        v51 = v49;
      if (v51 >= 0x64)
        objc_msgSend_setMaxPackageUploadsPerBatch_(self, v50, 100);
      else
        objc_msgSend_setMaxPackageUploadsPerBatch_(self, v50, v51);
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v52 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v224 = v52;
        v227 = objc_msgSend_maxPackageUploadsPerBatch(self, v225, v226);
        *(_DWORD *)location = 134218240;
        *(_QWORD *)&location[4] = v227;
        v286 = 2048;
        v287 = v49;
        _os_log_debug_impl(&dword_1BE990000, v224, OS_LOG_TYPE_DEBUG, "maxPackageUploadsPerBatch:%lu (%lu)", location, 0x16u);

      }
      v53 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend_uploadTasksByPackages(self, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend_count(v56, v57, v58);
      obja = (id)objc_msgSend_initWithCapacity_(v53, v60, v59);

      v61 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v64 = objc_msgSend_maxPackageUploadsPerBatch(self, v62, v63);
      v235 = (void *)objc_msgSend_initWithCapacity_(v61, v65, v64);
      objc_msgSend_uploadTasksByPackages(self, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectEnumerator(v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sortedArrayUsingComparator_(v74, v75, (uint64_t)&unk_1E7832EF0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v269 = 0u;
      v270 = 0u;
      v267 = 0u;
      v268 = 0u;
      v242 = v76;
      v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v242, v77, (uint64_t)&v267, v284, 16);
      if (v78)
      {
        v79 = *(_QWORD *)v268;
        do
        {
          for (k = 0; k != v78; ++k)
          {
            if (*(_QWORD *)v268 != v79)
              objc_enumerationMutation(v242);
            v81 = *(void **)(*((_QWORD *)&v267 + 1) + 8 * k);
            dispatch_group_enter(group);
            objc_msgSend_package(v81, v82, v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            isReference = objc_msgSend_isReference(v84, v85, v86);

            if ((isReference & 1) == 0)
            {
              objc_msgSend_addObject_(obja, v88, (uint64_t)v81);
              objc_msgSend_group(v81, v90, v91);
              v92 = objc_claimAutoreleasedReturnValue();
              dispatch_group_enter(v92);

            }
            objc_msgSend_group(v81, v88, v89);
            v93 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_queue(self, v94, v95);
            v96 = objc_claimAutoreleasedReturnValue();
            v265[0] = MEMORY[0x1E0C809B0];
            v265[1] = 3221225472;
            v265[2] = sub_1BEACEAA4;
            v265[3] = &unk_1E782E418;
            v265[4] = self;
            v265[5] = v81;
            v266 = group;
            dispatch_group_notify(v93, v96, v265);

          }
          v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v242, v97, (uint64_t)&v267, v284, 16);
        }
        while (v78);
      }

      objc_msgSend__uploadPackageSectionsWithPendingTasks_uploadingTasks_completedTasks_(self, v98, (uint64_t)obja, v235, 0);
    }
    v263 = 0u;
    v264 = 0u;
    v261 = 0u;
    v262 = 0u;
    objc_msgSend_assetRegisterAndPutBatches(self->_assetRequestPlanner, v45, v46);
    v229 = (id)objc_claimAutoreleasedReturnValue();
    v232 = objc_msgSend_countByEnumeratingWithState_objects_count_(v229, v99, (uint64_t)&v261, v283, 16);
    if (v232)
    {
      v230 = *(_QWORD *)v262;
      do
      {
        for (m = 0; m != v232; ++m)
        {
          if (*(_QWORD *)v262 != v230)
            objc_enumerationMutation(v229);
          v234 = *(void **)(*((_QWORD *)&v261 + 1) + 8 * m);
          objc_msgSend_allMMCSItems(v234, v100, v101);
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend_count(v236, v102, v103))
            goto LABEL_88;
          isFailed = objc_msgSend_isFailed(v234, v104, v105);

          if ((isFailed & 1) != 0)
            continue;
          dispatch_group_enter(group);
          v107 = [CKDMMCSItemGroupSet alloc];
          objc_msgSend_allMMCSItems(v234, v108, v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v236 = (void *)objc_msgSend_initWithItems_(v107, v111, (uint64_t)v110);

          if (_os_feature_enabled_impl())
          {
            objc_msgSend_allMMCSItems(v234, v112, v113);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_CKFilter_(v114, v115, (uint64_t)&unk_1E7832E88);
            v116 = (id)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend_count(v116, v117, v118))
            {
              objc_msgSend__didUploadMMCSItems_error_(self, v119, (uint64_t)v116, 0);
              v259 = 0u;
              v260 = 0u;
              v257 = 0u;
              v258 = 0u;
              v121 = v116;
              v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v122, (uint64_t)&v257, v282, 16);
              if (v125)
              {
                v126 = *(_QWORD *)v258;
                do
                {
                  for (n = 0; n != v125; ++n)
                  {
                    if (*(_QWORD *)v258 != v126)
                      objc_enumerationMutation(v121);
                    objc_msgSend_package(*(void **)(*((_QWORD *)&v257 + 1) + 8 * n), v123, v124);
                    v130 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v130)
                    {
                      objc_msgSend_uploadTasksByPackages(self, v128, v129);
                      v131 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectForKey_(v131, v132, (uint64_t)v130);
                      v133 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend_group(v133, v134, v135);
                      v136 = objc_claimAutoreleasedReturnValue();
                      dispatch_group_leave(v136);

                    }
                  }
                  v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v123, (uint64_t)&v257, v282, 16);
                }
                while (v125);
              }

            }
            objc_msgSend_allMMCSItems(v234, v119, v120);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_CKFilter_(v137, v138, (uint64_t)&unk_1E7832EA8);
            v139 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend_count(v139, v140, v141))
              goto LABEL_87;
            v142 = [CKDMMCSItemGroupSet alloc];
            v144 = objc_msgSend_initWithItems_(v142, v143, (uint64_t)v139);

            v236 = (void *)v144;
          }
          objc_msgSend_assetZone(v234, v112, v113);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_assetZoneKey(v145, v146, v147);
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cloneContext(v148, v149, v150);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setCloneContext_(v236, v152, (uint64_t)v151);

          objc_msgSend_allItemGroups(v236, v153, v154);
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v155, v156, v157) != 1)
            __assert_rtn("-[CKDUploadAssetsOperation _upload]", "CKDUploadAssetsOperation.m", 1541, "putItemGroupSet.allItemGroups.count == 1");

          v116 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v255 = 0u;
          v256 = 0u;
          v253 = 0u;
          v254 = 0u;
          objc_msgSend_allItemGroups(v236, v158, v159);
          v237 = (id)objc_claimAutoreleasedReturnValue();
          v243 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v237, v160, (uint64_t)&v253, v281, 16);
          if (v243)
          {
            objb = *(id *)v254;
            do
            {
              for (ii = 0; ii != v243; ii = (char *)ii + 1)
              {
                if (*(id *)v254 != objb)
                  objc_enumerationMutation(v237);
                v164 = *(void **)(*((_QWORD *)&v253 + 1) + 8 * (_QWORD)ii);
                v249 = 0u;
                v250 = 0u;
                v251 = 0u;
                v252 = 0u;
                objc_msgSend_items(v164, v161, v162);
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(v165, v166, (uint64_t)&v249, v280, 16);
                if (v169)
                {
                  v170 = *(_QWORD *)v250;
                  do
                  {
                    for (jj = 0; jj != v169; ++jj)
                    {
                      if (*(_QWORD *)v250 != v170)
                        objc_enumerationMutation(v165);
                      objc_msgSend_recordID(*(void **)(*((_QWORD *)&v249 + 1) + 8 * jj), v167, v168);
                      v172 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_zoneID(v172, v173, v174);
                      v175 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_zoneName(v175, v176, v177);
                      v178 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v178)
                        objc_msgSend_addObject_(v116, v179, (uint64_t)v178);

                    }
                    v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(v165, v167, (uint64_t)&v249, v280, 16);
                  }
                  while (v169);
                }

              }
              v243 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v237, v161, (uint64_t)&v253, v281, 16);
            }
            while (v243);
          }

          v180 = [CKDMMCSRequestOptions alloc];
          v139 = (void *)objc_msgSend_initWithOperation_(v180, v181, (uint64_t)self);
          objc_msgSend_allObjects(v116, v182, v183);
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setZoneNames_(v139, v185, (uint64_t)v184);

          objc_msgSend_assetZone(v234, v186, v187);
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_assetZoneKey(v188, v189, v190);
          v191 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_useMMCSEncryptionV2(v191, v192, v193);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          v197 = objc_msgSend_BOOLValue(v194, v195, v196);

          objc_msgSend_cloneContext(v191, v198, v199);
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          if (v200)
            v201 = v197;
          else
            v201 = 0;

          if ((v201 & 1) == 0)
          {
            objc_msgSend_authPutResponse(v234, v202, v203);
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setAuthPutResponse_(v139, v205, (uint64_t)v204);

          }
          if (v197)
            objc_msgSend_setUseFORD_(v139, v202, 1);
          objc_msgSend_authPutResponseHeaders(v234, v202, v203);
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAuthPutResponseHeaders_(v139, v207, (uint64_t)v206);

          shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v208, v209);
          objc_msgSend_setShouldCloneFileInAssetCache_(v139, v211, shouldCloneFileInAssetCache);
          objc_initWeak((id *)location, self);
          v247[0] = MEMORY[0x1E0C809B0];
          v247[1] = 3221225472;
          v247[2] = sub_1BEACEB38;
          v247[3] = &unk_1E7832ED0;
          objc_copyWeak(&v248, (id *)location);
          v245[0] = MEMORY[0x1E0C809B0];
          v245[1] = 3221225472;
          v245[2] = sub_1BEACEB80;
          v245[3] = &unk_1E7832DB0;
          v245[4] = self;
          v245[5] = v234;
          v246 = group;
          objc_msgSend_putItemGroupSet_operation_options_progress_completionHandler_(v228, v212, (uint64_t)v236, self, v139, v247, v245);
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cancelTokens(self, v214, v215);
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addCancelToken_withOperation_(v216, v217, (uint64_t)v213, self);

          objc_destroyWeak(&v248);
          objc_destroyWeak((id *)location);

LABEL_87:
LABEL_88:

        }
        v232 = objc_msgSend_countByEnumeratingWithState_objects_count_(v229, v100, (uint64_t)&v261, v283, 16);
      }
      while (v232);
    }

    dispatch_group_leave(group);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v218 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v220 = v218;
      objc_msgSend_operationID(self, v221, v222);
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v223;
      _os_log_debug_impl(&dword_1BE990000, v220, OS_LOG_TYPE_DEBUG, "No files or packages to upload for operation %{public}@", location, 0xCu);

    }
  }
  return hasSuccessfulBatches;
}

- (void)_removePackageManifests
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  char v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, v2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend_assetsToUpload(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v47, v55, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v48;
    *(_QWORD *)&v9 = 138543618;
    v42 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v48 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v13;
          objc_msgSend_manifestItem(v15, v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v18;
          if (v18)
          {
            v22 = (void *)MEMORY[0x1E0CB37E8];
            v23 = objc_msgSend_itemID(v18, v19, v20);
            objc_msgSend_numberWithUnsignedLongLong_(v22, v24, v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v45, v26, (uint64_t)v25);

            objc_msgSend_fileURL(v21, v27, v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v46 = 0;
              v31 = objc_msgSend_removeItemAtURL_error_(v44, v29, (uint64_t)v30, &v46);
              v32 = v46;
              v33 = (void *)*MEMORY[0x1E0C952F8];
              if ((v31 & 1) != 0)
              {
                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], v33);
                v34 = (void *)*MEMORY[0x1E0C952B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
                {
                  v35 = v34;
                  objc_msgSend_path(v30, v36, v37);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v52 = v43;
                  _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Removed package manifest at %{public}@", buf, 0xCu);
                  goto LABEL_23;
                }
              }
              else
              {
                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], v33);
                v38 = (void *)*MEMORY[0x1E0C952B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
                {
                  v35 = v38;
                  objc_msgSend_path(v30, v39, v40);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v42;
                  v52 = v43;
                  v53 = 2112;
                  v54 = v32;
                  _os_log_error_impl(&dword_1BE990000, v35, OS_LOG_TYPE_ERROR, "Failed to remove package manifest at %{public}@: %@", buf, 0x16u);
LABEL_23:

                }
              }
            }
            else
            {
              v32 = 0;
            }
            objc_msgSend_setManifestItem_(v15, v29, 0, v42);

          }
        }
        ++v12;
      }
      while (v10 != v12);
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v47, v55, 16);
      v10 = v41;
    }
    while (v41);
  }

}

+ (int64_t)isPredominatelyDownload
{
  return 0;
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
  v8.super_class = (Class)CKDUploadAssetsOperation;
  -[CKDOperation cancel](&v8, sel_cancel);
  objc_msgSend_cancelTokens(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v5, v6, v7);

}

- (void)finishWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  objc_msgSend__closeAllPackages(self, v5, v6);
  objc_msgSend__removePackageManifests(self, v7, v8);
  objc_msgSend_cancelTokens(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllCancelTokens(v11, v12, v13);

  v14.receiver = self;
  v14.super_class = (Class)CKDUploadAssetsOperation;
  -[CKDOperation finishWithError:](&v14, sel_finishWithError_, v4);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  objc_super v18;

  v4 = a3;
  objc_msgSend_hash(self, v5, v6);
  kdebug_trace();
  objc_msgSend_setUploadPreparationBlock_(self, v7, 0);
  objc_msgSend_setUploadProgressBlock_(self, v8, 0);
  objc_msgSend_setUploadCompletionBlock_(self, v9, 0);
  objc_msgSend_container(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCS(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performOperationCleanup(v15, v16, v17);

  v18.receiver = self;
  v18.super_class = (Class)CKDUploadAssetsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v18, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)main
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  char v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  _BOOL8 v15;
  const char *v16;
  id v17;

  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
  objc_msgSend_container(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = objc_msgSend_setupAssetTransfers_(v6, v7, (uint64_t)&v17);
  v9 = v17;

  if ((v8 & 1) != 0)
  {
    objc_msgSend_assetsToUpload(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_count(v12, v13, v14) == 0;

    objc_msgSend_makeStateTransition_(self, v16, v15);
  }
  else
  {
    objc_msgSend_finishWithError_(self, v10, (uint64_t)v9);
  }

}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (id)uploadPreparationBlock
{
  return self->_uploadPreparationBlock;
}

- (void)setUploadPreparationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (id)uploadProgressBlock
{
  return self->_uploadProgressBlock;
}

- (void)setUploadProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (id)uploadCompletionBlock
{
  return self->_uploadCompletionBlock;
}

- (void)setUploadCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSArray)assetsToUpload
{
  return self->_assetsToUpload;
}

- (void)setAssetsToUpload:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToUpload, a3);
}

- (NSMapTable)uploadTasksByPackages
{
  return self->_uploadTasksByPackages;
}

- (void)setUploadTasksByPackages:(id)a3
{
  objc_storeStrong((id *)&self->_uploadTasksByPackages, a3);
}

- (NSMutableArray)openedPackages
{
  return self->_openedPackages;
}

- (void)setOpenedPackages:(id)a3
{
  objc_storeStrong((id *)&self->_openedPackages, a3);
}

- (CKDCancelTokenGroup)cancelTokens
{
  return self->_cancelTokens;
}

- (void)setCancelTokens:(id)a3
{
  objc_storeStrong((id *)&self->_cancelTokens, a3);
}

- (unint64_t)maxPackageUploadsPerBatch
{
  return self->_maxPackageUploadsPerBatch;
}

- (void)setMaxPackageUploadsPerBatch:(unint64_t)a3
{
  self->_maxPackageUploadsPerBatch = a3;
}

- (CKDAssetRequestPlanner)assetRequestPlanner
{
  return self->_assetRequestPlanner;
}

- (NSDictionary)assetUUIDToExpectedProperties
{
  return self->_assetUUIDToExpectedProperties;
}

- (void)setAssetUUIDToExpectedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, a3);
}

- (NSDictionary)packageUUIDToExpectedProperties
{
  return self->_packageUUIDToExpectedProperties;
}

- (void)setPackageUUIDToExpectedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_packageUUIDToExpectedProperties, a3);
}

- (BOOL)temporary
{
  return self->_temporary;
}

- (void)setTemporary:(BOOL)a3
{
  self->_temporary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_assetRequestPlanner, 0);
  objc_storeStrong((id *)&self->_cancelTokens, 0);
  objc_storeStrong((id *)&self->_openedPackages, 0);
  objc_storeStrong((id *)&self->_uploadTasksByPackages, 0);
  objc_storeStrong((id *)&self->_assetsToUpload, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_uploadCompletionBlock, 0);
  objc_storeStrong(&self->_uploadProgressBlock, 0);
  objc_storeStrong(&self->_uploadPreparationBlock, 0);
  objc_storeStrong((id *)&self->_cloneContextsBySignature, 0);
}

@end
