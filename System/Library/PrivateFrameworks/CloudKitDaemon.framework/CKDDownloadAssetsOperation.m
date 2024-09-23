@implementation CKDDownloadAssetsOperation

- (CKDDownloadAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  CKDDownloadAssetsOperation *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  dispatch_qos_class_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  CKDCancelTokenGroup *v15;
  CKDCancelTokenGroup *cancelTokens;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *assetsToDownload;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *assetsToDownloadInMemory;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *assetURLInfosToFillOut;
  const char *v29;
  uint64_t v30;
  objc_super v32;

  v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKDDownloadAssetsOperation;
  v7 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v32, sel_initWithOperationInfo_container_, v6, a4);
  if (v7)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_QOSClass(v7, v9, v10);
    dispatch_queue_attr_make_with_qos_class(v8, v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.cloudkit.download", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(CKDCancelTokenGroup);
    cancelTokens = v7->_cancelTokens;
    v7->_cancelTokens = v15;

    objc_msgSend_assetsToDownload(v6, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    assetsToDownload = v7->_assetsToDownload;
    v7->_assetsToDownload = (NSArray *)v19;

    objc_msgSend_assetsToDownloadInMemory(v6, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    assetsToDownloadInMemory = v7->_assetsToDownloadInMemory;
    v7->_assetsToDownloadInMemory = (NSArray *)v23;

    objc_msgSend_assetURLInfosToFillOut(v6, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    assetURLInfosToFillOut = v7->_assetURLInfosToFillOut;
    v7->_assetURLInfosToFillOut = (NSArray *)v27;

    v7->_shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v6, v29, v30);
  }

  return v7;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/download-assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (id)CKStatusReportLogGroups
{
  void *v3;
  os_unfair_lock_s *p_prepareLock;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKDDownloadAssetsOperation;
  -[CKDOperation CKStatusReportLogGroups](&v18, sel_CKStatusReportLogGroups);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_prepareLock = &self->_prepareLock;
  if (os_unfair_lock_trylock(&self->_prepareLock))
  {
    if (!v3)
      v3 = (void *)objc_opt_new();
    objc_msgSend_MMCSItemsToDownload(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v7, v8, (uint64_t)&unk_1E78322D0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("MMCS Items"));

    objc_msgSend_MMCSItemsToDownloadInMemory(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v13, v14, (uint64_t)&unk_1E78322F0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)v15, CFSTR("MMCS In Memory Items"));

    os_unfair_lock_unlock(p_prepareLock);
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
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL result;

  objc_msgSend_cancelTokens(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllCancelTokens(v4, v5, v6);

  switch(objc_msgSend_state(self, v7, v8))
  {
    case 1:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_setState_(self, v11, 2);
      result = MEMORY[0x1E0DE7D20](self, sel__prepareForDownload, v22);
      break;
    case 2:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_hash(self, v12, v13);
      kdebug_trace();
      objc_msgSend_setState_(self, v14, 3);
      result = MEMORY[0x1E0DE7D20](self, sel__download, v20);
      break;
    case 3:
      objc_msgSend_setState_(self, v9, 4);
      result = MEMORY[0x1E0DE7D20](self, sel__postProcess, v21);
      break;
    case 4:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_setState_(self, v15, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v19, (uint64_t)v18);

      goto LABEL_6;
    default:
LABEL_6:
      result = 1;
      break;
  }
  return result;
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 3)
    return off_1E7832638[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDDownloadAssetsOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_removeUntrackedMMCSItems:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v21, v25, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend_fileURL(v11, v6, v7);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend_trackingUUID(v11, v6, v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v6, v7);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_fileURL(v11, v16, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeItemAtURL_error_(v15, v19, (uint64_t)v18, 0);

            objc_msgSend_setFileURL_(v11, v20, 0);
          }
        }
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v21, v25, 16);
    }
    while (v8);
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
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 267, CFSTR("Expected non-nil asset for %@"), self);

  }
  objc_msgSend_callbackQueue(self, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA97DA4;
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
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 275, CFSTR("Expected non-nil asset for %@"), self);

  }
  objc_msgSend_callbackQueue(self, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA97F00;
  block[3] = &unk_1E7830158;
  block[4] = self;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  dispatch_async(v10, block);

}

- (void)_didCommandForAsset:(id)a3 command:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  const char *v32;
  _QWORD block[5];
  id v34;
  id v35;

  v7 = a3;
  v10 = a4;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 283, CFSTR("Expected non-nil asset for %@"), self);

  }
  v11 = v7;
  v14 = (void *)objc_msgSend_mutableCopy(v10, v12, v13);
  objc_msgSend_recordKey(v11, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v14, v18, (uint64_t)v17, CFSTR("RecordKey"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  v22 = objc_msgSend_arrayIndex(v11, v20, v21);
  objc_msgSend_numberWithInteger_(v19, v23, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v14, v25, (uint64_t)v24, CFSTR("ArrayIndex"));

  objc_msgSend_callbackQueue(self, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA98104;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v34 = v11;
  v35 = v14;
  v29 = v14;
  v30 = v11;
  dispatch_async(v28, block);

}

- (void)_didDownloadAsset:(id)a3 error:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  const char *v15;
  _QWORD block[5];
  id v17;
  id v18;

  v7 = a3;
  v10 = a4;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 294, CFSTR("Expected non-nil asset for %@"), self);

  }
  objc_msgSend_callbackQueue(self, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA9827C;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v17 = v7;
  v18 = v10;
  v12 = v10;
  v13 = v7;
  dispatch_async(v11, block);

}

- (id)_tryToFillInTheDerivativeTemplateWithAsset:(id)a3
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
  const char *v17;
  int v18;
  const char *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  os_log_t *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  id v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  os_log_t *v63;
  os_log_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  const char *v70;
  id v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  id v87;
  id v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  id v92;
  const char *v93;
  NSObject *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  const char *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  os_log_t v115;
  os_log_t v116;
  NSObject *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  NSObject *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  id v135;
  id v136;
  uint8_t buf[4];
  void *v138;
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_deviceContext(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountDataSecurityObserver(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v10, v17, (uint64_t)v16, 1);

  if (!v18)
  {
    v22 = (void *)MEMORY[0x1E0C94BB8];
    objc_msgSend_constructedAssetDownloadURLTemplate(v4, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__canonicalizeTemplateURL_(v22, v24, (uint64_t)v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x1E0CB3998], v26, (uint64_t)v25, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_percentEncodedPath(v27, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_percentEncodedQuery(v27, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v28, v35, (uint64_t)CFSTR("%@?%@"), v31, v34);
    v36 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_host(v25, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0C94BB8];
    objc_msgSend_constructedAssetDownloadURLTemplate(v4, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v40) = objc_msgSend__templateURLRequiresAssetKey_(v40, v44, (uint64_t)v43);

    v47 = (os_log_t *)MEMORY[0x1E0C952B0];
    v132 = (void *)v36;
    if ((v40 & 1) != 0)
    {
      if (v39)
      {
        objc_msgSend_keyOrErrorForHostname(self, v45, v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v48, v49, (uint64_t)v39);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v52 = v50;
            v130 = v52;
            if (objc_msgSend_useEncryption(self, v53, v54))
            {
              objc_msgSend_assetKey(v4, v55, v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              if (v57)
              {
                objc_msgSend_assetKey(v4, v58, v59);
                v60 = objc_claimAutoreleasedReturnValue();
                v63 = v47;
                goto LABEL_23;
              }
              v63 = v47;
              objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v58, *MEMORY[0x1E0C94B20], 1000, CFSTR("expected assetKey for asset %@"), v4);
            }
            else
            {
              if (!objc_msgSend_useClearAssetEncryption(self, v55, v56))
                goto LABEL_57;
              v63 = v47;
              objc_msgSend_clearAssetKey(v4, v72, v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();

              if (v74)
              {
                objc_msgSend_clearAssetKey(v4, v75, v76);
                v60 = objc_claimAutoreleasedReturnValue();
LABEL_23:
                v128 = (void *)v60;
                if (v60)
                {
                  v129 = v39;
                  v77 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend_publicKey(v52, v61, v62);
                  v78 = v52;
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_CKBase64URLSafeString(v79, v80, v81);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringWithFormat_(v77, v83, (uint64_t)CFSTR("&pk=%@"), v82);
                  v84 = objc_claimAutoreleasedReturnValue();

                  v133 = (void *)v84;
                  objc_msgSend_stringByAppendingString_(v132, v85, v84);
                  v86 = (void *)objc_claimAutoreleasedReturnValue();

                  v135 = 0;
                  v136 = 0;
                  v132 = v86;
                  LODWORD(v79) = CKEncryptWithPublicKey(v78, v128, v86, &v136, &v135);
                  v87 = v136;
                  v88 = v135;
                  v91 = v88;
                  if ((_DWORD)v79 && v87)
                  {
                    objc_msgSend_CKBase64URLSafeString(v87, v89, v90);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v69 = 0;
                  }
                  else
                  {
                    v92 = v88;
                    if (!v92)
                    {
                      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v93, *MEMORY[0x1E0C94B20], 1, CFSTR("Couldn't wrap asset key: no error"));
                      v92 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    v69 = v92;
                    v67 = 0;
                  }

                  v39 = v129;
                  v68 = v133;
                  goto LABEL_38;
                }
                goto LABEL_57;
              }
              objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v75, *MEMORY[0x1E0C94B20], 1000, CFSTR("expected clearAssetKey for asset %@"), v4);
            }
            v98 = objc_claimAutoreleasedReturnValue();
            if (v98)
            {
              v69 = (void *)v98;
              v68 = 0;
              v67 = 0;
LABEL_38:

LABEL_39:
              if (!v69)
                goto LABEL_40;
LABEL_54:
              v21 = v69;

              goto LABEL_55;
            }
LABEL_57:
            __assert_rtn("-[CKDDownloadAssetsOperation _tryToFillInTheDerivativeTemplateWithAsset:]", "CKDDownloadAssetsOperation.m", 345, "assetKey && \"assetKey expected\");
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v71 = v50;
LABEL_29:
            v69 = v71;
            v68 = 0;
            v67 = 0;
            v63 = v47;
            goto LABEL_39;
          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v70, *MEMORY[0x1E0C94B20], 1000, CFSTR("unknown public cert result for host %@ asset %@"), v39, v4);
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v51, *MEMORY[0x1E0C94B20], 1000, CFSTR("no public cert result for host %@ asset %@"), v39, v4);
        }
        v71 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v45, *MEMORY[0x1E0C94B20], 1000, CFSTR("asset %@ has constructedAssetDownloadURLTemplate but cannot parse out host string"), v4);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0;
      v67 = 0;
      v63 = v47;
      if (v69)
        goto LABEL_54;
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v63 = v47;
      v64 = *v47;
      if (os_log_type_enabled(*v47, OS_LOG_TYPE_DEBUG))
      {
        v94 = v64;
        objc_msgSend_signature(v4, v95, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v138 = v97;
        _os_log_debug_impl(&dword_1BE990000, v94, OS_LOG_TYPE_DEBUG, "Not filling in key for constructed asset URL template for asset %@ because it doesn't require a key", buf, 0xCu);

        v63 = v47;
      }
      v67 = 0;
      v68 = 0;
    }
LABEL_40:
    v134 = (uint64_t)v68;
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v65, v66);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v99, v100, (uint64_t)&stru_1E7838F48, CFSTR("f"));
    if (v67)
      objc_msgSend_setObject_forKeyedSubscript_(v99, v101, (uint64_t)v67, CFSTR("uk"));
    v103 = (void *)MEMORY[0x1E0C94BB8];
    objc_msgSend_constructedAssetDownloadURLTemplate(v4, v101, v102);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__expandTemplateURL_fieldValues_(v103, v105, (uint64_t)v104, v99);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v134)
    {
      objc_msgSend_stringByAppendingString_(v106, v107, v134);
      v108 = objc_claimAutoreleasedReturnValue();

      v106 = (void *)v108;
    }
    objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v107, (uint64_t)v106);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConstructedAssetDownloadURL_(v4, v110, (uint64_t)v109);

    objc_msgSend_constructedAssetDownloadURL(v4, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    if (v113)
    {
      v69 = 0;
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v114, *MEMORY[0x1E0C94B20], 1, CFSTR("Couldn't create asset download URL from template"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v115 = *v63;
      if (!os_log_type_enabled(*v63, OS_LOG_TYPE_ERROR))
        goto LABEL_51;
      v125 = v115;
      objc_msgSend_constructedAssetDownloadURLTemplate(v4, v126, v127);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v138 = v131;
      _os_log_error_impl(&dword_1BE990000, v125, OS_LOG_TYPE_ERROR, "Couldn't create asset download URL from template %{public}@", buf, 0xCu);

    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
LABEL_51:
    v116 = *v63;
    if (os_log_type_enabled(*v63, OS_LOG_TYPE_INFO))
    {
      v117 = v116;
      objc_msgSend_constructedAssetDownloadURLTemplate(v4, v118, v119);
      v120 = v27;
      v121 = v25;
      v122 = v39;
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v138 = v123;
      _os_log_impl(&dword_1BE990000, v117, OS_LOG_TYPE_INFO, "constructedAssetDownloadURL %{public}@", buf, 0xCu);

      v39 = v122;
      v25 = v121;
      v27 = v120;

    }
    v68 = (void *)v134;
    goto LABEL_54;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v19, *MEMORY[0x1E0C94B20], 5013, CFSTR("Cannot fill in derivative template due to walrus enabled for asset %@"), v4);
  v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:

  return v21;
}

- (void)_prepareAssetForDownload:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  char v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  char isEqualToData;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  int shouldDownloadAssetFromTranscoder;
  uint64_t v47;
  int v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  NSObject *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  CKDMMCSItem *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  int v97;
  const char *v98;
  void *v99;
  id v100;
  uint8_t buf[4];
  id v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_signature(v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!objc_msgSend_paddedFileSize(v5, v9, v10)
      || (objc_msgSend_authToken(v5, v11, v12), v8 = objc_claimAutoreleasedReturnValue(), (id)v8, v8))
    {
      objc_msgSend_container(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C95138];
      objc_msgSend_signature(v5, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend_isValidV2Signature_((void *)v8, v17, (uint64_t)v16);

      objc_msgSend_options(v13, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_mmcsEncryptionSupport(v20, v21, v22);

      if ((_DWORD)v8)
      {
        objc_msgSend_options(v13, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend_mmcsEncryptionSupport(v26, v27, v28) & 2 | v23 & 1;

        if (v29)
          goto LABEL_11;
      }
      else if ((v23 & 1) != 0)
      {
        goto LABEL_11;
      }
      if (objc_msgSend_size(v5, v24, v25)
        || (objc_msgSend_signature(v5, v30, v31),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_zeroSizeFileSignature(CKDMMCS, v33, v34),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            isEqualToData = objc_msgSend_isEqualToData_(v32, v36, (uint64_t)v35),
            v35,
            v32,
            (isEqualToData & 1) == 0))
      {
        v39 = *MEMORY[0x1E0C94B20];
        if ((_DWORD)v8)
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v30, v39, 1000, CFSTR("Inconsistent signature type for asset %@, Asset was %@, container does not support"), v5, CFSTR("V2"));
        else
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v30, v39, 1000, CFSTR("Inconsistent signature type for asset %@, Asset was %@, container does not support"), v5, CFSTR("V1"));
        v38 = objc_claimAutoreleasedReturnValue();
LABEL_16:

        if (!v38)
          goto LABEL_17;
LABEL_21:
        objc_msgSend_shouldDownloadAssetFromTranscoder_(self, v40, (uint64_t)v5);
        goto LABEL_22;
      }
LABEL_11:
      v38 = 0;
      goto LABEL_16;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing download token for asset %@"), v5);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing signature for asset %@"), v5);
  }
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
    goto LABEL_21;
LABEL_17:
  objc_msgSend_constructedAssetDownloadURLTemplate(v5, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend__tryToFillInTheDerivativeTemplateWithAsset_(self, v43, (uint64_t)v5);
    v38 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  shouldDownloadAssetFromTranscoder = objc_msgSend_shouldDownloadAssetFromTranscoder_(self, v43, (uint64_t)v5);
  v48 = shouldDownloadAssetFromTranscoder;
  if (v38 || (shouldDownloadAssetFromTranscoder & 1) != 0)
    goto LABEL_39;
  if (!objc_msgSend_paddedFileSize(v5, v44, v47))
  {
    objc_msgSend_constructedAssetDownloadURLTemplate(v5, v44, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v49)
    {
      objc_msgSend_data(MEMORY[0x1E0C99D50], v44, v47);
      v50 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(self, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_MMCS(v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_assetCache(v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signature(v5, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = (void *)v50;
      v100 = 0;
      objc_msgSend_trackDownloadedData_signature_error_(v59, v63, v50, v62, &v100);
      v45 = objc_claimAutoreleasedReturnValue();
      v38 = (uint64_t)v100;

      if (!(v45 | v38))
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v64, v65);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v82, v83, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 438, CFSTR("Expected non-nil error for asset %@"), v5);

        if (v48)
          goto LABEL_41;
        goto LABEL_43;
      }
      if (v45)
      {
        objc_msgSend_fileURL((void *)v45, v64, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFileURL_(v5, v67, (uint64_t)v66);

        objc_msgSend_trackingUUID((void *)v45, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setUUID_(v5, v71, (uint64_t)v70);

        objc_msgSend_setWasCached_(v5, v72, 1);
        if (!v38)
        {
          objc_msgSend_fileURL(v5, v44, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setDownloaded_(v5, v75, v74 != 0);

          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v76 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v102 = v5;
            _os_log_debug_impl(&dword_1BE990000, v76, OS_LOG_TYPE_DEBUG, "Returning asset from cache: %@", buf, 0xCu);
          }
          objc_msgSend__didPrepareAsset_(self, v77, (uint64_t)v5);
          objc_msgSend__didMakeProgressForAsset_progress_(self, v78, (uint64_t)v5, 1.0);
          objc_msgSend__didDownloadAsset_error_(self, v79, (uint64_t)v5, 0);
          goto LABEL_24;
        }
LABEL_23:
        objc_msgSend__didDownloadAsset_error_(self, v44, (uint64_t)v5, v38);

        goto LABEL_24;
      }

LABEL_39:
      if (!v38)
        goto LABEL_40;
LABEL_22:
      v45 = 0;
      goto LABEL_23;
    }
  }
LABEL_40:
  if (v48)
  {
LABEL_41:
    objc_msgSend_assetsToDownloadFromTranscoder(self, v44, v47);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v80, v81, (uint64_t)v5);

    v45 = 0;
    goto LABEL_24;
  }
LABEL_43:
  v84 = [CKDMMCSItem alloc];
  v45 = objc_msgSend_initWithAsset_(v84, v85, (uint64_t)v5);
  v88 = objc_msgSend_paddedFileSize(v5, v86, v87);
  objc_msgSend_setPaddedFileSize_((void *)v45, v89, v88);
  if ((v8 & 1) == 0)
  {
    v92 = objc_msgSend_size(v5, v90, v91);
    objc_msgSend_setFileSize_((void *)v45, v93, v92);
  }
  objc_msgSend_operationInfo(self, v90, v91);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend_usesAssetDownloadStagingManager(v94, v95, v96);

  if (v97)
    objc_msgSend_setUsesAssetDownloadStagingManager_((void *)v45, v98, 1);
  objc_msgSend_addObject_(self->_prepareMMCSItemsToDownload, v98, v45);
LABEL_24:

}

- (void)_preparePackageForDataDownload:(id)a3
{
  id v4;
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
  char *v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  CKDMMCSItem *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  CKPackageDownloadTask *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  CKDDownloadAssetsOperation *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend_assets(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v8, v9, v10);
  v13 = (void *)objc_msgSend_initWithCapacity_(v5, v12, v11);

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend_assets(v4, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (char *)objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v61, v65, 16);
  v19 = 0x1E0C94000uLL;
  v20 = (uint64_t *)MEMORY[0x1E0C94B20];
  if (v18)
  {
    v59 = self;
    v60 = v4;
    v21 = 0;
    v22 = 0;
    v23 = *(_QWORD *)v62;
    while (2)
    {
      v24 = 0;
      v25 = &v22[(_QWORD)v18];
      do
      {
        if (*(_QWORD *)v62 != v23)
          objc_enumerationMutation(v16);
        v26 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = 0x1E0C94000uLL;
          v20 = (uint64_t *)MEMORY[0x1E0C94B20];
          v4 = v60;
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v27, *MEMORY[0x1E0C94B20], 1000, CFSTR("Invalid package manifest for package %@"), v60);
          v18 = (char *)objc_claimAutoreleasedReturnValue();
          v25 = &v24[(_QWORD)v22];
          self = v59;
          goto LABEL_14;
        }
        if (&v24[(_QWORD)v22])
          objc_msgSend_addObject_(v13, v27, (uint64_t)v26);
        v21 += objc_msgSend_size(v26, v27, v28);
        ++v24;
      }
      while (v18 != v24);
      v18 = (char *)objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v29, (uint64_t)&v61, v65, 16);
      v22 = v25;
      if (v18)
        continue;
      break;
    }
    self = v59;
    v4 = v60;
    v19 = 0x1E0C94000;
    v20 = (uint64_t *)MEMORY[0x1E0C94B20];
  }
  else
  {
    v21 = 0;
    v25 = 0;
  }
LABEL_14:

  if (!v18 && !v25)
  {
    objc_msgSend_errorWithDomain_code_format_(*(void **)(v19 + 4088), v30, *v20, 1000, CFSTR("No package manifest found for package %@"), v4);
    v18 = (char *)objc_claimAutoreleasedReturnValue();
  }
  if (v18)
  {
    objc_msgSend__didDownloadAsset_error_(self, v30, (uint64_t)v4, v18);
  }
  else
  {
    objc_msgSend_setSize_(v4, v30, v21);
    objc_msgSend_assets(v4, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = [CKDMMCSItem alloc];
    v39 = (void *)objc_msgSend_initWithAsset_(v37, v38, (uint64_t)v36);
    v42 = objc_msgSend_size(v36, v40, v41);
    objc_msgSend_setFileSize_(v39, v43, v42);
    objc_msgSend_setPackage_(v39, v44, (uint64_t)v4);
    objc_msgSend_setIsPackageManifest_(v39, v45, 1);
    objc_msgSend_addObject_(self->_prepareMMCSItemsToDownload, v46, (uint64_t)v39);
    v47 = [CKPackageDownloadTask alloc];
    objc_msgSend_downloadProgressBlock(self, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend_initWithPackage_trackProgress_(v47, v51, (uint64_t)v4, v50 != 0);

    objc_msgSend_setManifestAsset_(v52, v53, (uint64_t)v36);
    objc_msgSend_setSectionAssets_(v52, v54, (uint64_t)v13);
    objc_msgSend_downloadTasksByPackages(self, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v57, v58, (uint64_t)v52, v4);

  }
}

- (void)_preparePackageForMetadataDownload:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend_assets(a3, a2, (uint64_t)a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v11, v15, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend__prepareAssetForDownload_(self, v7, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_preparePackageForDownload:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v7 = a3;
  if (sub_1BEA99524(self, v4, v5))
    objc_msgSend__preparePackageForMetadataDownload_(self, v6, (uint64_t)v7);
  else
    objc_msgSend__preparePackageForDataDownload_(self, v6, (uint64_t)v7);

}

- (BOOL)_prepareForDownload
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSMutableArray *v18;
  NSMutableArray *prepareMMCSItemsToDownload;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  NSMutableArray *v28;
  NSMutableArray *prepareMMCSItemsToDownloadInMemory;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  id v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  BOOL v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  const char *v79;
  int isValidV2Signature;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  char v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  unint64_t v92;
  const char *v93;
  uint64_t v94;
  CKDMMCSItem *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  _BOOL4 v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  char isEqualToData;
  void *v107;
  void *v108;
  BOOL v109;
  int shouldDownloadAssetFromTranscoder;
  const char *v111;
  uint64_t v112;
  int v113;
  char v114;
  uint64_t v115;
  void *v116;
  _BOOL4 v117;
  CKDMMCSItem *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  const char *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  const char *v129;
  const char *v130;
  NSObject *v131;
  const char *v132;
  void *v133;
  const char *v134;
  void *v135;
  const char *v136;
  const char *v137;
  const char *v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  NSObject *v157;
  const char *v158;
  BOOL v159;
  NSMutableArray *v160;
  NSMutableArray *v161;
  NSObject *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  _BOOL4 v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  void *v181;
  void *v182;
  uint64_t v183;
  void *v184;
  id obj;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  _QWORD v194[2];
  _QWORD v195[2];
  _BYTE v196[128];
  uint8_t v197[128];
  uint8_t buf[4];
  id v199;
  __int16 v200;
  void *v201;
  __int16 v202;
  void *v203;
  __int16 v204;
  void *v205;
  uint64_t v206;

  v206 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v163 = v3;
    objc_msgSend_assetsToDownload(self, v164, v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetsToDownloadInMemory(self, v167, v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetURLInfosToFillOut(self, v170, v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v173, v174);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v199 = v166;
    v200 = 2112;
    v201 = v169;
    v202 = 2112;
    v203 = v172;
    v204 = 2114;
    v205 = v175;
    _os_log_debug_impl(&dword_1BE990000, v163, OS_LOG_TYPE_DEBUG, "Downloading assets %@, in-memory assets %@, and publish assets %@ for operation %{public}@", buf, 0x2Au);

  }
  os_unfair_lock_lock(&self->_prepareLock);
  objc_msgSend_container(self, v4, v5);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDownloadTasksByPackages_(self, v9, (uint64_t)v8);

  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend_assetsToDownload(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_count(v13, v14, v15);
  v18 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v10, v17, v16);
  prepareMMCSItemsToDownload = self->_prepareMMCSItemsToDownload;
  self->_prepareMMCSItemsToDownload = v18;

  v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend_assetsToDownloadInMemory(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_count(v23, v24, v25);
  v28 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v20, v27, v26);
  prepareMMCSItemsToDownloadInMemory = self->_prepareMMCSItemsToDownloadInMemory;
  self->_prepareMMCSItemsToDownloadInMemory = v28;

  v30 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend_assetsToDownload(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_count(v33, v34, v35);
  v181 = (void *)objc_msgSend_initWithCapacity_(v30, v37, v36);

  v38 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend_assetsToDownloadInMemory(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend_count(v41, v42, v43);
  v182 = (void *)objc_msgSend_initWithCapacity_(v38, v45, v44);

  v192 = 0u;
  v193 = 0u;
  v190 = 0u;
  v191 = 0u;
  objc_msgSend_assetsToDownload(self, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v190, v197, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v191;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v191 != v52)
          objc_enumerationMutation(v48);
        v54 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * i);
        v55 = (id)objc_msgSend__prepareForDownloadWithOperation_(v54, v50, (uint64_t)self);
        objc_msgSend__didPrepareAsset_(self, v56, (uint64_t)v54);
      }
      v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v50, (uint64_t)&v190, v197, 16);
    }
    while (v51);
  }

  v188 = 0u;
  v189 = 0u;
  v186 = 0u;
  v187 = 0u;
  objc_msgSend_assetsToDownloadInMemory(self, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v186, v196, 16);
  if (v61)
  {
    v62 = *(_QWORD *)v187;
    v183 = *MEMORY[0x1E0C94B20];
    obj = v59;
    do
    {
      v63 = 0;
      do
      {
        if (*(_QWORD *)v187 != v62)
          objc_enumerationMutation(obj);
        v64 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * v63);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v95 = 0;
          goto LABEL_50;
        }
        v66 = v64;
        objc_msgSend_signature(v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v69 == 0;

        if (v70)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v71, v183, 1000, CFSTR("Missing signature for asset %@"), v66);
          goto LABEL_33;
        }
        if (objc_msgSend_paddedFileSize(v66, v71, v72))
        {
          objc_msgSend_authToken(v66, v73, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v75 == 0;

          if (v76)
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v73, v183, 1000, CFSTR("Missing download token for asset %@"), v66);
            goto LABEL_33;
          }
        }
        v77 = (void *)MEMORY[0x1E0C95138];
        objc_msgSend_signature(v66, v73, v74);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        isValidV2Signature = objc_msgSend_isValidV2Signature_(v77, v79, (uint64_t)v78);

        if (isValidV2Signature)
        {
          objc_msgSend_options(v184, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend_mmcsEncryptionSupport(v83, v84, v85);

          objc_msgSend_options(v184, v87, v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend_mmcsEncryptionSupport(v89, v90, v91);

          if ((v92 >> 1) & 1 | v86 & 1)
            goto LABEL_34;
        }
        else
        {
          objc_msgSend_options(v184, v81, v82);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = (objc_msgSend_mmcsEncryptionSupport(v96, v97, v98) & 1) == 0;

          if (!v99)
            goto LABEL_34;
        }
        if (objc_msgSend_size(v66, v93, v94)
          || (objc_msgSend_signature(v66, v93, v100),
              v101 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend_zeroSizeFileSignature(CKDMMCS, v102, v103),
              v104 = (void *)objc_claimAutoreleasedReturnValue(),
              isEqualToData = objc_msgSend_isEqualToData_(v101, v105, (uint64_t)v104),
              v104,
              v101,
              (isEqualToData & 1) == 0))
        {
          if (isValidV2Signature)
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v93, v183, 1000, CFSTR("Inconsistent signature type for asset %@, Asset was %@, container does not support"), v66, CFSTR("V2"));
          else
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v93, v183, 1000, CFSTR("Inconsistent signature type for asset %@, Asset was %@, container does not support"), v66, CFSTR("V1"));
LABEL_33:
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          if (v107)
            goto LABEL_37;
        }
LABEL_34:
        objc_msgSend_constructedAssetDownloadURLTemplate(v66, v93, v94);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v108 == 0;

        if (v109)
        {
          v107 = 0;
        }
        else
        {
          objc_msgSend__tryToFillInTheDerivativeTemplateWithAsset_(self, v93, (uint64_t)v66);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
        }
LABEL_37:
        shouldDownloadAssetFromTranscoder = objc_msgSend_shouldDownloadAssetFromTranscoder_(self, v93, (uint64_t)v66);
        v113 = shouldDownloadAssetFromTranscoder;
        if (v107)
          v114 = 1;
        else
          v114 = shouldDownloadAssetFromTranscoder;
        if ((v114 & 1) != 0)
        {
          if (v107)
          {
            objc_msgSend__didDownloadAsset_error_(self, v111, (uint64_t)v66, v107);
            v95 = 0;
LABEL_43:

            goto LABEL_51;
          }
        }
        else if (!objc_msgSend_paddedFileSize(v66, v111, v112))
        {
          objc_msgSend_constructedAssetDownloadURLTemplate(v66, v111, v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = v116 == 0;

          if (v117)
          {
            v95 = objc_alloc_init(CKDMMCSItem);
            if (!v95)
            {
              objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v126, v127);
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v139, v140, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 585, CFSTR("Expected non-nil asset"));

            }
            objc_msgSend_setPaddedFileSize_(v95, v126, 0);
            objc_msgSend_setFileSize_(v95, v128, 0);
            objc_msgSend_setWasCached_(v66, v129, 1);
            objc_msgSend_setDownloaded_(v66, v130, 1);
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v131 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v199 = v66;
              _os_log_debug_impl(&dword_1BE990000, v131, OS_LOG_TYPE_DEBUG, "Returning asset from cache: %@", buf, 0xCu);
            }
            objc_msgSend__didPrepareAsset_(self, v132, (uint64_t)v66);
            v194[0] = CFSTR("Data");
            v133 = (void *)objc_opt_new();
            v194[1] = CFSTR("Offset");
            v195[0] = v133;
            v195[1] = &unk_1E78B0118;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v134, (uint64_t)v195, v194, 2);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend__didCommandForAsset_command_(self, v136, (uint64_t)v66, v135);

            objc_msgSend__didMakeProgressForAsset_progress_(self, v137, (uint64_t)v66, 1.0);
            objc_msgSend__didDownloadAsset_error_(self, v138, (uint64_t)v66, 0);
            goto LABEL_43;
          }
        }
        if (v113)
        {
          objc_msgSend_addObject_(v182, v111, (uint64_t)v66);
          v95 = 0;
        }
        else
        {
          v118 = [CKDMMCSItem alloc];
          v95 = (CKDMMCSItem *)objc_msgSend_initWithAsset_(v118, v119, (uint64_t)v66);
          v122 = objc_msgSend_size(v66, v120, v121);
          objc_msgSend_setFileSize_(v95, v123, v122);
          objc_msgSend_addObject_(self->_prepareMMCSItemsToDownloadInMemory, v124, (uint64_t)v95);
        }

LABEL_50:
        objc_msgSend__didPrepareAsset_(self, v65, (uint64_t)v64);
LABEL_51:

        ++v63;
      }
      while (v61 != v63);
      v59 = obj;
      v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v125, (uint64_t)&v186, v196, 16);
      v61 = v141;
    }
    while (v141);
  }

  if (objc_msgSend_count(self->_prepareMMCSItemsToDownload, v142, v143)
    || objc_msgSend_count(self->_prepareMMCSItemsToDownloadInMemory, v144, v145))
  {
    goto LABEL_66;
  }
  objc_msgSend_assetURLInfosToFillOut(self, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v146, v147, v148) || objc_msgSend_count(v181, v149, v150))
  {

LABEL_66:
    v153 = (void *)objc_msgSend_copy(self->_prepareMMCSItemsToDownload, v144, v145);
    objc_msgSend_setMMCSItemsToDownload_(self, v154, (uint64_t)v153);

    v157 = objc_msgSend_copy(self->_prepareMMCSItemsToDownloadInMemory, v155, v156);
    objc_msgSend_setMMCSItemsToDownloadInMemory_(self, v158, (uint64_t)v157);
    v159 = 1;
    goto LABEL_67;
  }
  v176 = objc_msgSend_count(v182, v151, v152) == 0;

  if (!v176)
    goto LABEL_66;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v157 = (id)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_operationID(self, v177, v178);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v199 = v179;
    _os_log_debug_impl(&dword_1BE990000, v157, OS_LOG_TYPE_DEBUG, "No assets to download for %{public}@", buf, 0xCu);

  }
  v159 = 0;
LABEL_67:

  v160 = self->_prepareMMCSItemsToDownload;
  self->_prepareMMCSItemsToDownload = 0;

  v161 = self->_prepareMMCSItemsToDownloadInMemory;
  self->_prepareMMCSItemsToDownloadInMemory = 0;

  os_unfair_lock_unlock(&self->_prepareLock);
  return v159;
}

- (void)_didDownloadMMCSItem:(id)a3 inMemory:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
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
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  double v74;
  double v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  const char *v81;
  const char *v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  uint8_t buf[4];
  id v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  id v100;
  __int16 v101;
  id v102;
  _QWORD v103[2];

  v103[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend_package(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asset(v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v8, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v9;
  v21 = v20;

  if (v21)
  {
    v103[0] = v8;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v103, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__removeUntrackedMMCSItems_(self, v25, (uint64_t)v24);

    if (v12)
    {
      objc_msgSend_downloadTasksByPackages(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v28, v29, (uint64_t)v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setError_(v30, v31, (uint64_t)v21);
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v32 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v83 = v32;
        objc_msgSend_operationID(self, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v96 = v8;
        v97 = 2112;
        v98 = v12;
        v99 = 2114;
        v100 = v86;
        v101 = 2112;
        v102 = v21;
        _os_log_debug_impl(&dword_1BE990000, v83, OS_LOG_TYPE_DEBUG, "Failed to download MMCS item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);

      }
      objc_msgSend__didDownloadAsset_error_(self, v33, (uint64_t)v12, v21);
      objc_msgSend_group(v30, v34, v35);
      v36 = objc_claimAutoreleasedReturnValue();
      dispatch_group_leave(v36);

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v80 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v87 = v80;
        objc_msgSend_operationID(self, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v96 = v8;
        v97 = 2114;
        v98 = v90;
        v99 = 2112;
        v100 = v21;
        _os_log_debug_impl(&dword_1BE990000, v87, OS_LOG_TYPE_DEBUG, "Failed to download MMCS item %@ for operation %{public}@: %@", buf, 0x20u);

      }
      objc_msgSend__didDownloadAsset_error_(self, v81, (uint64_t)v15, v21);
    }
  }
  else
  {
    if (!v15)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v22, v23);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v91, v92, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 642, CFSTR("Expected non-nil asset for item %@"), v8);

    }
    v37 = objc_msgSend_fileSize(v8, v22, v23);
    objc_msgSend_setSize_(v15, v38, v37);
    v41 = objc_msgSend_paddedFileSize(v8, v39, v40);
    objc_msgSend_setPaddedFileSize_(v15, v42, v41);
    objc_msgSend_verificationKey(v8, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVerificationKey_(v15, v46, (uint64_t)v45);

    if (sub_1BEA99524(self, v47, v48))
    {
      v51 = objc_msgSend_itemID(v8, v49, v50);
      objc_msgSend_setReReferenceItemID_(v15, v52, v51);
    }
    if (!v8)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v49, v50);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v93, v94, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 667, CFSTR("Expected non-nil MMCS item"));

    }
    objc_msgSend_trackingUUID(v8, v49, v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUUID_(v15, v54, (uint64_t)v53);

    if (objc_msgSend_downloadLooksOkay(v8, v55, v56))
    {
      objc_msgSend_setDownloaded_(v15, v57, 1);
      objc_msgSend_fileURL(v8, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFileURL_(v15, v62, (uint64_t)v61);

      objc_msgSend_fileHandle(v8, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFileHandle_(v15, v66, (uint64_t)v65);

    }
    if (v12)
    {
      objc_msgSend_downloadTasksByPackages(self, v57, v58);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v67, v68, (uint64_t)v12);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_progressTracker(v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateProgressWithItem_progress_(v72, v73, (uint64_t)v15, 1.0);
      v75 = v74;

      objc_msgSend__didMakeProgressForAsset_progress_(self, v76, (uint64_t)v12, v75);
      objc_msgSend_group(v69, v77, v78);
      v79 = objc_claimAutoreleasedReturnValue();
      dispatch_group_leave(v79);

    }
    else
    {
      objc_msgSend__didMakeProgressForAsset_progress_(self, v57, (uint64_t)v15, 1.0);
      objc_msgSend__didDownloadAsset_error_(self, v82, (uint64_t)v15, 0);
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
    v8[2] = sub_1BEA9A5D8;
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
  objc_msgSend_CKCompactMap_(v4, v5, (uint64_t)&unk_1E7832330);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__collectMetricsFromMMCSOperationMetrics_(self, v6, (uint64_t)v7);
}

- (void)_didDownloadMMCSItems:(id)a3 inMemory:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v6 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v27, v37, 16);
  if (v11)
  {
    v14 = v11;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend_finished(v17, v12, v13) & 1) == 0)
        {
          objc_msgSend_setFinished_(v17, v12, 1);
          objc_msgSend__didDownloadMMCSItem_inMemory_error_(self, v18, (uint64_t)v17, v6, v9);
        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v27, v37, 16);
    }
    while (v14);
  }
  if (v9)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v20 = v19;
      v23 = objc_msgSend_count(v8, v21, v22);
      objc_msgSend_operationID(self, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v32 = v23;
      v33 = 2114;
      v34 = v26;
      v35 = 2112;
      v36 = v9;
      _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "Failed to download %lu MMCS items for operation %{public}@: %@", buf, 0x20u);

    }
  }

}

- (void)_didMakeProgressForMMCSItem:(id)a3 inMemory:(BOOL)a4
{
  _BOOL8 v4;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  double v32;
  double v33;
  const char *v34;
  const char *v35;
  id v36;

  v4 = a4;
  v36 = a3;
  v8 = objc_msgSend_finished(v36, v6, v7);
  objc_msgSend_error(v36, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v11;
  if (v8)
  {
    objc_msgSend__didDownloadMMCSItem_inMemory_error_(self, v12, (uint64_t)v36, v4, v11);
LABEL_9:

    goto LABEL_10;
  }
  if (v11)
    goto LABEL_9;
  objc_msgSend_progress(v36, v12, v13);
  if (v17 >= 0.0)
  {
    objc_msgSend_package(v36, v15, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_asset(v36, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend_downloadTasksByPackages(self, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v23, v24, (uint64_t)v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_progressTracker(v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_progress(v36, v29, v30);
      objc_msgSend_updateProgressWithItem_progress_(v28, v31, (uint64_t)v22);
      v33 = v32;

      objc_msgSend__didMakeProgressForAsset_progress_(self, v34, (uint64_t)v14, v33);
    }
    else
    {
      objc_msgSend_progress(v36, v20, v21);
      objc_msgSend__didMakeProgressForAsset_progress_(self, v35, (uint64_t)v22);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)_didCommandForMMCSItem:(id)a3 command:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v6 = a4;
  objc_msgSend_asset(a3, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__didCommandForAsset_command_(self, v9, (uint64_t)v10, v6);

}

- (void)_didDownloadMMCSSectionItem:(id)a3 task:(id)a4 error:(id)a5
{
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
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  id v35;
  const char *v36;
  void *v37;
  id v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  dispatch_once_t *v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  unint64_t v70;
  BOOL v71;
  uint64_t v72;
  const char *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  double v104;
  double v105;
  const char *v106;
  NSObject *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  NSObject *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  void *v120;
  id v121;
  id v122;
  id v123;
  SEL v124;
  CKDDownloadAssetsOperation *v125;
  void *v126;
  void *v127;
  void *v128;
  unint64_t v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t buf[4];
  uint64_t v136;
  __int16 v137;
  void *v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  id v142;
  _BYTE v143[128];
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend_mmcs(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_assetCache(v14, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(self, v116, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v115, v119, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 746, CFSTR("Expected non-nil assetCache for %@"), v118);

    }
  }
  objc_msgSend_package(v10, v18, v19);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v9, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (void *)v23;
  else
    v25 = v11;
  v26 = v25;

  if (v26)
  {
LABEL_8:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v29 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v107 = v29;
      objc_msgSend_operationID(self, v108, v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v136 = (uint64_t)v9;
      v137 = 2112;
      v138 = v128;
      v139 = 2114;
      v140 = v110;
      v141 = 2112;
      v142 = v26;
      _os_log_debug_impl(&dword_1BE990000, v107, OS_LOG_TYPE_DEBUG, "Failed to download MMCS section item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);

    }
    objc_msgSend_setError_(v10, v30, (uint64_t)v26);
    objc_msgSend_sectionItems(v9, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__removeUntrackedMMCSItems_(self, v34, (uint64_t)v33);

    goto LABEL_49;
  }
  if ((sub_1BEA99524(self, v27, v28) & 1) != 0)
    goto LABEL_44;
  v124 = a2;
  v125 = self;
  v120 = v14;
  v121 = v11;
  v122 = v10;
  v35 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v37 = (void *)objc_msgSend_initWithCapacity_(v35, v36, 100);
  v38 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v40 = (void *)objc_msgSend_initWithCapacity_(v38, v39, 100);
  v123 = v9;
  objc_msgSend_sectionItems(v9, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectEnumerator(v43, v44, v45);
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0;
  v49 = (dispatch_once_t *)MEMORY[0x1E0C95300];
  v126 = v37;
  while (1)
  {
    while (1)
    {
      v50 = v48;
      objc_msgSend_nextObject(v127, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v48)
      {
LABEL_26:
        v26 = 0;
        goto LABEL_27;
      }
      objc_msgSend_error(v48, v46, v47);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
        break;
      objc_msgSend_fileURL(v48, v52, v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v55)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v56 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v136 = (uint64_t)v48;
          _os_log_debug_impl(&dword_1BE990000, v56, OS_LOG_TYPE_DEBUG, "Expected non-nil fileURL for %@", buf, 0xCu);
        }
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v59, v60, (uint64_t)v124, v125, CFSTR("CKDDownloadAssetsOperation.m"), 770, CFSTR("Expected non-nil fileURL for %@"), v48);

      }
      objc_msgSend_addObject_(v40, v54, (uint64_t)v55);
      v61 = (void *)MEMORY[0x1E0CB37E8];
      v64 = objc_msgSend_packageIndex(v48, v62, v63);
      objc_msgSend_numberWithInteger_(v61, v65, v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v37, v67, (uint64_t)v66);

      v70 = objc_msgSend_count(v37, v68, v69);
      v71 = v70 >= 0x64;
      v49 = (dispatch_once_t *)MEMORY[0x1E0C95300];
      if (v71)
        goto LABEL_26;
    }
    objc_msgSend_error(v48, v52, v53);
    v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
    v72 = objc_msgSend_count(v37, v46, v47);
    if (v26 || !v72)
      break;
    v129 = v72;
    v130 = v48;
    objc_msgSend_updateItemsAtIndexes_fileURLs_(v128, v73, (uint64_t)v37, v40);
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    v74 = v37;
    v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v131, v143, 16);
    if (v76)
    {
      v78 = v76;
      v79 = 0;
      v80 = *(_QWORD *)v132;
      do
      {
        v81 = 0;
        do
        {
          if (*(_QWORD *)v132 != v80)
            objc_enumerationMutation(v74);
          v82 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v81);
          objc_msgSend_objectAtIndex_(v40, v77, v79 + v81);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if (*v49 != -1)
            dispatch_once(v49, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v84 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v85 = v84;
            v88 = objc_msgSend_unsignedIntegerValue(v82, v86, v87);
            objc_msgSend_path(v83, v89, v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v136 = v88;
            v137 = 2114;
            v138 = v91;
            _os_log_debug_impl(&dword_1BE990000, v85, OS_LOG_TYPE_DEBUG, "Updated package item with index:%lu and path:%{public}@", buf, 0x16u);

            v49 = (dispatch_once_t *)MEMORY[0x1E0C95300];
          }

          ++v81;
        }
        while (v78 != v81);
        v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v77, (uint64_t)&v131, v143, 16);
        v79 += v81;
      }
      while (v78);
    }

    objc_msgSend_removeAllObjects(v40, v92, v93);
    objc_msgSend_removeAllObjects(v74, v94, v95);

    v48 = 0;
    v26 = 0;
    v37 = v126;
    if (v129 <= 0x63)
      goto LABEL_43;
  }

LABEL_43:
  v10 = v122;
  v9 = v123;
  v14 = v120;
  v11 = v121;
  self = v125;
  if (v26)
    goto LABEL_8;
LABEL_44:
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v96 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v111 = v96;
    objc_msgSend_operationID(self, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v136 = (uint64_t)v9;
    v137 = 2112;
    v138 = v128;
    v139 = 2114;
    v140 = v114;
    v141 = 2112;
    v142 = 0;
    _os_log_debug_impl(&dword_1BE990000, v111, OS_LOG_TYPE_DEBUG, "Downloaded MMCS section item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);

  }
  objc_msgSend_asset(v9, v97, v98);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDownloaded_(v26, v99, 1);
  objc_msgSend_progressTracker(v10, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateProgressWithItem_progress_(v102, v103, (uint64_t)v26, 1.0);
  v105 = v104;

  objc_msgSend__didMakeProgressForAsset_progress_(self, v106, (uint64_t)v128, v105);
LABEL_49:

}

- (void)_didDownloadMMCSSectionItems:(id)a3 task:(id)a4 error:(id)a5
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, v33, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v8);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend_finished(v18, v13, v14) & 1) == 0)
        {
          objc_msgSend_setFinished_(v18, v13, 1);
          objc_msgSend__didDownloadMMCSSectionItem_task_error_(self, v19, (uint64_t)v18, v9, v10);
        }
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v13, (uint64_t)&v25, v33, 16);
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
      *(_DWORD *)buf = 134218242;
      v30 = v24;
      v31 = 2112;
      v32 = v10;
      _os_log_debug_impl(&dword_1BE990000, v21, OS_LOG_TYPE_DEBUG, "Failed to download %lu MMCS section items: %@", buf, 0x16u);

    }
  }

}

- (void)_didMakeProgressForMMCSSectionItem:(id)a3 task:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  double v27;
  double v28;
  const char *v29;
  id v30;

  v30 = a3;
  v6 = a4;
  if (objc_msgSend_finished(v30, v7, v8))
  {
    objc_msgSend_error(v30, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__didDownloadMMCSSectionItem_task_error_(self, v12, (uint64_t)v30, v6, v11);
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend_progress(v30, v9, v10);
  v14 = v13;
  objc_msgSend_error(v30, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 && v14 >= 0.0)
  {
    objc_msgSend_package(v30, v18, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_progressTracker(v6, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_asset(v30, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateProgressWithItem_progress_(v22, v26, (uint64_t)v25, v14);
    v28 = v27;

    objc_msgSend__didMakeProgressForAsset_progress_(self, v29, (uint64_t)v11, v28);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_downloadPackageSectionAtIndex:(int64_t)a3 task:(id)a4 completionBlock:(id)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  id v23;
  id v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  BOOL v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  CKDMMCSItem *v45;
  const char *v46;
  id v47;
  const char *v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  const char *v62;
  CKDMMCSItem *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  id v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  CKDProgressTracker *v94;
  const char *v95;
  void *v96;
  const char *v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  id v102;
  NSObject *v103;
  const char *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  NSObject *v112;
  id v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  id v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  const char *v124;
  void *v125;
  const char *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  _QWORD block[4];
  id v134;
  id v135;
  void (**v136)(_QWORD);
  _QWORD v137[5];
  id v138;
  id v139;
  id v140;
  NSObject *v141;
  uint64_t *v142;
  _QWORD v143[4];
  id v144;
  id v145;
  id v146;
  id v147;
  _QWORD v148[4];
  id v149;
  id v150;
  uint64_t *v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  void (*v157)(uint64_t);
  id v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  uint64_t (*v162)(uint64_t, uint64_t);
  void (*v163)(uint64_t);
  id v164;
  _BYTE location[12];
  __int16 v166;
  int64_t v167;
  __int16 v168;
  uint64_t v169;
  __int16 v170;
  id v171;
  __int16 v172;
  void *v173;
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v12 = (void (**)(_QWORD))a5;
  if (a3 < 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v123, v124, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 839, CFSTR("Expected a valid sectionIndex: %ld"), a3);

  }
  if (!objc_msgSend_isCancelled(self, v10, v11))
  {
    objc_msgSend_mmcs(self, v13, v14);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_package(v9, v17, v18);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_downloadItemIndices(v132, v19, v20);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sectionAtIndex_(v132, v21, a3);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v131)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 1000, CFSTR("Couldn't find section at index %ld for package %@"), a3, v132);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v9, v51, (uint64_t)v50);

      if (v12)
        v12[2](v12);
      goto LABEL_29;
    }
    v159 = 0;
    v160 = &v159;
    v161 = 0x3032000000;
    v162 = sub_1BE9BAFD8;
    v163 = sub_1BE9BADA0;
    v164 = (id)objc_opt_new();
    v153 = 0;
    v154 = &v153;
    v155 = 0x3032000000;
    v156 = sub_1BE9BAFD8;
    v157 = sub_1BE9BADA0;
    v158 = (id)objc_opt_new();
    v148[0] = MEMORY[0x1E0C809B0];
    v148[1] = 3221225472;
    v148[2] = sub_1BEA9BEA0;
    v148[3] = &unk_1E7832358;
    v23 = v132;
    v149 = v23;
    v24 = v131;
    v150 = v24;
    v151 = &v159;
    v152 = &v153;
    objc_msgSend_enumerateIndexesUsingBlock_(v130, v25, (uint64_t)v148);
    if (objc_msgSend_size(v24, v26, v27))
    {
      if (objc_msgSend_index(v24, v28, v29) < 0
        || (objc_msgSend_assets(v23, v30, v31),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            v35 = objc_msgSend_count(v32, v33, v34),
            v38 = v35 > objc_msgSend_index(v24, v36, v37) + 1,
            v32,
            !v38))
      {
        v52 = (void *)MEMORY[0x1E0C94FF8];
        v53 = objc_msgSend_index(v24, v30, v31);
        objc_msgSend_assets(v23, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend_count(v56, v57, v58);
        objc_msgSend_errorWithDomain_code_format_(v52, v60, *MEMORY[0x1E0C94B20], 1000, CFSTR("Invalid section index %ld(%lu) for package %@"), v53, v59, v23);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(v9, v62, (uint64_t)v61);

        if (v12)
          v12[2](v12);
        v47 = 0;
        goto LABEL_28;
      }
      objc_msgSend_assets(v23, v30, v31);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_index(v24, v40, v41);
      objc_msgSend_objectAtIndex_(v39, v43, v42 + 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = [CKDMMCSItem alloc];
      v47 = (id)objc_msgSend_initWithAsset_(v45, v46, (uint64_t)v44);
      objc_msgSend_setPackage_(v47, v48, (uint64_t)v23);

    }
    else
    {
      v63 = [CKDMMCSItem alloc];
      v47 = (id)objc_msgSend_initWithPackage_(v63, v64, (uint64_t)v23);
    }
    objc_msgSend_setSectionItems_(v47, v49, v160[5]);
    v67 = objc_msgSend_size(v24, v65, v66);
    objc_msgSend_setFileSize_(v47, v68, v67);
    v71 = objc_msgSend_paddedSize(v24, v69, v70);
    objc_msgSend_setPaddedFileSize_(v47, v72, v71);
    if (objc_msgSend_fileSize(v47, v73, v74) && objc_msgSend_count((void *)v160[5], v75, v76))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v77 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        v121 = v160[5];
        objc_msgSend_operationID(self, v78, v79);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138413314;
        *(_QWORD *)&location[4] = v47;
        v166 = 2048;
        v167 = a3;
        v168 = 2112;
        v169 = v121;
        v170 = 2112;
        v171 = v23;
        v172 = 2114;
        v173 = v122;
        _os_log_debug_impl(&dword_1BE990000, v77, OS_LOG_TYPE_DEBUG, "Downloading MMCS section item %@ at index %lu with MMCS items %@ for package %@ and operation %{public}@", location, 0x34u);

      }
      v80 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend_recordKey(v23, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_record(v23, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = (void *)objc_msgSend_initWithFormat_(v80, v93, (uint64_t)CFSTR("down|%@|%@|section:%lu"), v83, v92, a3);

      v94 = [CKDProgressTracker alloc];
      v96 = (void *)objc_msgSend_initWithTrackingID_(v94, v95, (uint64_t)v128);
      objc_msgSend_startTrackingItems_(v96, v97, v160[5]);
      v98 = dispatch_group_create();
      dispatch_group_enter(v98);
      objc_initWeak((id *)location, self);
      objc_msgSend_MMCSRequestOptions(v9, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v143[0] = MEMORY[0x1E0C809B0];
      v143[1] = 3221225472;
      v143[2] = sub_1BEA9C0E4;
      v143[3] = &unk_1E7832380;
      v127 = v96;
      v144 = v127;
      v145 = v47;
      objc_copyWeak(&v147, (id *)location);
      v146 = v9;
      v137[0] = MEMORY[0x1E0C809B0];
      v137[1] = 3221225472;
      v137[2] = sub_1BEA9C17C;
      v137[3] = &unk_1E78323D0;
      v137[4] = self;
      v142 = &v153;
      v138 = v129;
      v47 = v145;
      v139 = v47;
      v102 = v146;
      v140 = v102;
      v103 = v98;
      v141 = v103;
      objc_msgSend_getSectionItem_operation_options_progress_completionHandler_(v138, v104, (uint64_t)v47, self, v101, v143, v137);
      v105 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cancelTokens(v102, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addCancelToken_withOperation_(v108, v109, (uint64_t)v105, self);

      objc_msgSend_qualityOfService(self, v110, v111);
      CKGetGlobalQueue();
      v112 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEA9C398;
      block[3] = &unk_1E782F678;
      v134 = v102;
      v135 = v105;
      v136 = v12;
      v113 = v105;
      dispatch_group_notify(v103, v112, block);

      objc_destroyWeak(&v147);
      objc_destroyWeak((id *)location);

    }
    else
    {
      if (objc_msgSend_count((void *)v160[5], v75, v76))
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v114, v115);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v125, v126, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 906, CFSTR("Expected 0 non-empty items in the empty section %@"), v47);

      }
      objc_msgSend_assetCache(v129, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = (id)objc_msgSend_trackCachedButNotRegisteredMMCSItems_error_(v116, v117, v154[5], 0);

      objc_msgSend_setSectionItems_(v47, v119, v154[5]);
      objc_msgSend__didDownloadMMCSSectionItem_task_error_(self, v120, (uint64_t)v47, v9, 0);
      if (v12)
        v12[2](v12);
    }
LABEL_28:

    _Block_object_dispose(&v153, 8);
    _Block_object_dispose(&v159, 8);

LABEL_29:
    goto LABEL_30;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v13, *MEMORY[0x1E0C94B20], 1, CFSTR("Operation was cancelled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setError_(v9, v16, (uint64_t)v15);

  if (v12)
    v12[2](v12);
LABEL_30:

}

- (void)_downloadPackageSectionsWithSectionEnumerator:(id)a3 task:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  void (**v25)(_QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend_error(v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 || (objc_msgSend_nextObject(v8, v14, v15), (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v10)
      v10[2](v10);
  }
  else
  {
    v19 = v16;
    v20 = objc_msgSend_integerValue(v16, v17, v18);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1BEA9C514;
    v22[3] = &unk_1E78303B0;
    v22[4] = self;
    v23 = v8;
    v24 = v9;
    v25 = v10;
    objc_msgSend__downloadPackageSectionAtIndex_task_completionBlock_(self, v21, v20, v24, v22);

  }
}

- (void)_downloadPackageSectionsWithTask:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id *v28;
  char v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  _QWORD *v35;
  id *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  CKDMMCSRequestOptions *v60;
  const char *v61;
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
  const char *v73;
  void *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  CKDDownloadAssetsOperation *v99;
  void (**v100)(_QWORD);
  uint64_t v101;
  _QWORD v102[4];
  id v103;
  id v104;
  uint64_t *v105;
  id obj;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  void *v113;
  uint8_t buf[4];
  uint64_t v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  void *v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend_isCancelled(self, v8, v9))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 1, CFSTR("Operation was cancelled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(v6, v13, (uint64_t)v12);

    if (!v7)
      goto LABEL_37;
    goto LABEL_6;
  }
  objc_msgSend_error(v6, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v7)
LABEL_6:
      v7[2](v7);
  }
  else
  {
    v107 = 0;
    v108 = &v107;
    v109 = 0x3032000000;
    v110 = sub_1BE9BAFD8;
    v111 = sub_1BE9BADA0;
    v112 = 0;
    objc_msgSend_package(v6, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_manifestAsset(v6, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURL(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v28 = (id *)(v108 + 5);
      obj = (id)v108[5];
      v29 = objc_msgSend_readContentsOfFile_intoPackage_error_(CKDPackageManifest, v27, (uint64_t)v26, v17, &obj);
      objc_storeStrong(v28, obj);
      if ((v29 & 1) != 0)
      {
        v32 = objc_msgSend_itemCount(v17, v30, v31);
        v93 = objc_msgSend_sectionCount(v17, v33, v34);
        v35 = (_QWORD *)MEMORY[0x1E0C95300];
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v36 = (id *)MEMORY[0x1E0C952B0];
        v37 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218754;
          v115 = v32;
          v116 = 2048;
          v117 = v93;
          v118 = 2112;
          v119 = v17;
          v120 = 2114;
          v121 = v26;
          _os_log_debug_impl(&dword_1BE990000, v37, OS_LOG_TYPE_DEBUG, "Read the package manifest with %lu items and %lu sections for package %@ at %{public}@", buf, 0x2Au);
        }
        objc_msgSend_downloadItemIndices(v17, v38, v39);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        if (*v35 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v40 = *v36;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          v85 = objc_msgSend_count(v94, v41, v42);
          objc_msgSend_operationID(self, v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v115 = v85;
          v116 = 2048;
          v117 = v32;
          v118 = 2112;
          v119 = v17;
          v120 = 2114;
          v121 = v88;
          v122 = 2114;
          v123 = v94;
          _os_log_debug_impl(&dword_1BE990000, v40, OS_LOG_TYPE_DEBUG, "Downloading %lu/%lu package items for package %@ and operation %{public}@: %{public}@", buf, 0x34u);

        }
        v43 = (void *)v108[5];
        v108[5] = 0;

        v44 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        v102[0] = MEMORY[0x1E0C809B0];
        v102[1] = 3221225472;
        v102[2] = sub_1BEA9CD24;
        v102[3] = &unk_1E78323F8;
        v45 = v17;
        v103 = v45;
        v105 = &v107;
        v46 = v44;
        v104 = v46;
        objc_msgSend_enumerateIndexesUsingBlock_(v94, v47, (uint64_t)v102);
        v49 = v108[5];
        if (v49)
        {
          objc_msgSend_setError_(v6, v48, v49);
          if (v7)
            v7[2](v7);
        }
        else
        {
          objc_msgSend_CKMap_(v46, v48, (uint64_t)&unk_1E7832438);
          v89 = objc_claimAutoreleasedReturnValue();
          v60 = [CKDMMCSRequestOptions alloc];
          v92 = (void *)objc_msgSend_initWithOperation_(v60, v61, (uint64_t)self);
          objc_msgSend_record(v45, v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v64, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneID(v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneName(v70, v71, v72);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          if (v91)
          {
            v113 = v91;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v73, (uint64_t)&v113, 1);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setZoneNames_(v92, v75, (uint64_t)v74);

          }
          objc_msgSend_setMMCSRequestOptions_(v6, v73, (uint64_t)v92, v89);
          objc_msgSend_setSectionIndices_(v6, v76, (uint64_t)v46);
          objc_msgSend_objectEnumerator(v90, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = sub_1BEA9CDE4;
          v95[3] = &unk_1E7832460;
          v96 = v6;
          v101 = v93;
          v97 = v45;
          v98 = v46;
          v99 = self;
          v100 = v7;
          objc_msgSend__downloadPackageSectionsWithSectionEnumerator_task_completionBlock_(self, v80, (uint64_t)v79, v96, v95);

        }
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v56 = (id)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_operationID(self, v57, v58);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = (void *)v108[5];
          *(_DWORD *)buf = 138413058;
          v115 = (uint64_t)v26;
          v116 = 2112;
          v117 = (uint64_t)v17;
          v118 = 2114;
          v119 = v83;
          v120 = 2112;
          v121 = v84;
          _os_log_error_impl(&dword_1BE990000, v56, OS_LOG_TYPE_ERROR, "Failed to read the manifest file at %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);

        }
        objc_msgSend_setError_(v6, v59, v108[5]);
        if (v7)
          v7[2](v7);
      }
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v27, *MEMORY[0x1E0C94B20], 1017, CFSTR("Missing path for the package manifest"));
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v108[5];
      v108[5] = v50;

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v52 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_operationID(self, v53, v54);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)v108[5];
        *(_DWORD *)buf = 138412802;
        v115 = (uint64_t)v17;
        v116 = 2114;
        v117 = (uint64_t)v81;
        v118 = 2112;
        v119 = v82;
        _os_log_error_impl(&dword_1BE990000, v52, OS_LOG_TYPE_ERROR, "Missing path for package manifest for package %@ and operation %{public}@: %@", buf, 0x20u);

      }
      objc_msgSend_setError_(v6, v55, v108[5]);
      if (v7)
        v7[2](v7);
    }

    _Block_object_dispose(&v107, 8);
  }
LABEL_37:

}

- (void)_downloadPackageSectionsWithPendingTasks:(id)a3 downloadingTasks:(id)a4 completedTasks:(id)a5
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
  CKDDownloadAssetsOperation *v34;
  id v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend_maxPackageDownloadsPerBatch(self, v12, v13))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 1064, CFSTR("Expected non-0 maxPackageDownloadsPerBatch"));

  }
  v16 = objc_msgSend_count(v10, v14, v15);
  if (v16 > objc_msgSend_maxPackageDownloadsPerBatch(self, v17, v18))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 1065, CFSTR("Expected max downloading tasks: %@"), v10);

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
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, CFSTR("CKDDownloadAssetsOperation.m"), 1066, CFSTR("Expected completed tasks: %@"), v11);

  }
LABEL_7:
  objc_msgSend_queue(self, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA9D150;
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

- (BOOL)_download
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
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  BOOL v44;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSItemsToDownload(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSItemsToDownloadInMemory(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v8, v9) || objc_msgSend_count(v7, v10, v11))
    goto LABEL_7;
  objc_msgSend_assetsToDownloadFromTranscoder(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v12, v13, v14))
    goto LABEL_6;
  objc_msgSend_assetsToDownloadFromTranscoderInMemory(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v17, v18, v19))
  {

LABEL_6:
LABEL_7:
    if (objc_msgSend_count(v4, v10, v11))
    {
      objc_msgSend_downloadTasksByPackages(self, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__downloadMMCSItems_downloadTasksByPackages_shouldFetchAssetContentInMemory_(self, v25, (uint64_t)v4, v24, 0);

    }
    if (objc_msgSend_count(v7, v22, v23))
      objc_msgSend__downloadMMCSItems_downloadTasksByPackages_shouldFetchAssetContentInMemory_(self, v26, (uint64_t)v7, 0, 1);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend_assetsToDownloadFromTranscoder(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v59, v64, 16);
    if (v30)
    {
      v32 = v30;
      v33 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v60 != v33)
            objc_enumerationMutation(v28);
          objc_msgSend__downloadTranscodedAsset_inMemory_(self, v31, *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i), 0);
        }
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v59, v64, 16);
      }
      while (v32);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend_assetsToDownloadFromTranscoderInMemory(self, v35, v36, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v55, v63, 16);
    if (v39)
    {
      v41 = v39;
      v42 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v56 != v42)
            objc_enumerationMutation(v37);
          objc_msgSend__downloadTranscodedAsset_inMemory_(self, v40, *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j), 1);
        }
        v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v55, v63, 16);
      }
      while (v41);
    }

    v44 = 1;
    goto LABEL_26;
  }
  objc_msgSend_assetURLInfosToFillOut(self, v20, v21);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_count(v46, v47, v48);

  if (v49)
    goto LABEL_7;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v50 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v51 = v50;
    objc_msgSend_operationID(self, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v66 = v54;
    _os_log_debug_impl(&dword_1BE990000, v51, OS_LOG_TYPE_DEBUG, "No files or packages to download for %{public}@", buf, 0xCu);

  }
  v44 = 0;
LABEL_26:

  return v44;
}

- (void)_downloadMMCSItems:(id)a3 downloadTasksByPackages:(id)a4 shouldFetchAssetContentInMemory:(BOOL)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  unint64_t v38;
  const char *v39;
  unint64_t v40;
  void *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  NSObject *v72;
  id v73;
  const char *v74;
  uint64_t v75;
  CKDMMCSItemGroupSet *v76;
  const char *v77;
  CKDMMCSRequestOptions *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t shouldCloneFileInAssetCache;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  void *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t k;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
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
  void *v114;
  const char *v115;
  void *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  NSObject *v127;
  id v128;
  NSObject *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  void *v134;
  _BOOL4 v135;
  void *v136;
  void *v137;
  NSObject *group;
  id v139;
  uint64_t v140;
  id obj;
  CKDDownloadAssetsOperation *val;
  _QWORD v143[5];
  id v144;
  _QWORD v145[5];
  id v146;
  NSObject *v147;
  BOOL v148;
  _QWORD v149[4];
  id v150;
  _QWORD v151[4];
  id v152;
  BOOL v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _QWORD block[4];
  id v163;
  CKDDownloadAssetsOperation *v164;
  NSObject *v165;
  id v166;
  id v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE location[12];
  __int16 v175;
  unint64_t v176;
  _BYTE v177[128];
  uint64_t v178;

  v135 = a5;
  v178 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v133 = a4;
  val = self;
  objc_msgSend_mmcs(self, v8, v9);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  objc_msgSend_stateTransitionGroup(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v12);

  dispatch_group_enter(group);
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  obj = v7;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v168, v177, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v169;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v169 != v17)
          objc_enumerationMutation(obj);
        objc_msgSend_package(*(void **)(*((_QWORD *)&v168 + 1) + 8 * i), v14, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend_downloadTasksByPackages(val, v19, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v22, v23, (uint64_t)v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_group(v24, v25, v26);
          v27 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v27);

        }
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v168, v177, 16);
    }
    while (v16);
  }

  objc_msgSend_downloadTasksByPackages(val, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_count(v30, v31, v32);

  if (v33)
  {
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_maxPackageDownloadsPerBatchWithDefaultValue_(v36, v37, 6);

    if (v38 <= 1)
      v40 = 1;
    else
      v40 = v38;
    if (v40 >= 0x64)
      objc_msgSend_setMaxPackageDownloadsPerBatch_(val, v39, 100);
    else
      objc_msgSend_setMaxPackageDownloadsPerBatch_(val, v39, v40);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v41 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v129 = v41;
      v132 = objc_msgSend_maxPackageDownloadsPerBatch(val, v130, v131);
      *(_DWORD *)location = 134218240;
      *(_QWORD *)&location[4] = v132;
      v175 = 2048;
      v176 = v38;
      _os_log_debug_impl(&dword_1BE990000, v129, OS_LOG_TYPE_DEBUG, "maxPackageDownloadsPerBatch:%lu (%lu)", location, 0x16u);

    }
    v42 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend_downloadTasksByPackages(val, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_count(v45, v46, v47);
    v50 = (void *)objc_msgSend_initWithCapacity_(v42, v49, v48);

    v51 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v54 = objc_msgSend_maxPackageDownloadsPerBatch(val, v52, v53);
    v56 = (void *)objc_msgSend_initWithCapacity_(v51, v55, v54);
    objc_msgSend_downloadTasksByPackages(val, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectEnumerator(v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_nextObject(v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      v66 = MEMORY[0x1E0C809B0];
      do
      {
        dispatch_group_enter(group);
        objc_msgSend_group(v65, v67, v68);
        v69 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_queue(val, v70, v71);
        v72 = objc_claimAutoreleasedReturnValue();
        block[0] = v66;
        block[1] = 3221225472;
        block[2] = sub_1BEA9E0E0;
        block[3] = &unk_1E782E490;
        v163 = v65;
        v164 = val;
        v165 = group;
        v166 = v50;
        v167 = v56;
        v73 = v65;
        dispatch_group_notify(v69, v72, block);

        objc_msgSend_nextObject(v62, v74, v75);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (v65);
    }

  }
  v76 = [CKDMMCSItemGroupSet alloc];
  v136 = (void *)objc_msgSend_initWithItems_(v76, v77, (uint64_t)obj);
  v78 = [CKDMMCSRequestOptions alloc];
  v137 = (void *)objc_msgSend_initWithOperation_(v78, v79, (uint64_t)val);
  shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(val, v80, v81);
  objc_msgSend_setShouldCloneFileInAssetCache_(v137, v83, shouldCloneFileInAssetCache);
  v84 = (void *)objc_opt_new();
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  objc_msgSend_allItemGroups(v136, v85, v86);
  v139 = (id)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v87, (uint64_t)&v158, v173, 16);
  if (v90)
  {
    v140 = *(_QWORD *)v159;
    do
    {
      for (j = 0; j != v90; ++j)
      {
        if (*(_QWORD *)v159 != v140)
          objc_enumerationMutation(v139);
        v92 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * j);
        v154 = 0u;
        v155 = 0u;
        v156 = 0u;
        v157 = 0u;
        objc_msgSend_items(v92, v88, v89);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v94, (uint64_t)&v154, v172, 16);
        if (v97)
        {
          v98 = *(_QWORD *)v155;
          do
          {
            for (k = 0; k != v97; ++k)
            {
              if (*(_QWORD *)v155 != v98)
                objc_enumerationMutation(v93);
              objc_msgSend_recordID(*(void **)(*((_QWORD *)&v154 + 1) + 8 * k), v95, v96);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_zoneID(v100, v101, v102);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_zoneName(v103, v104, v105);
              v106 = (void *)objc_claimAutoreleasedReturnValue();

              if (v106)
                objc_msgSend_addObject_(v84, v107, (uint64_t)v106);

            }
            v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v95, (uint64_t)&v154, v172, 16);
          }
          while (v97);
        }

      }
      v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v88, (uint64_t)&v158, v173, 16);
    }
    while (v90);
  }

  objc_msgSend_allObjects(v84, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneNames_(v137, v111, (uint64_t)v110);

  if (*MEMORY[0x1E0C95280]
    && (objc_msgSend_unitTestOverrides(val, v112, v113),
        v114 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v114, v115, (uint64_t)CFSTR("DownloadAssetsFakeMMCSError")),
        v116 = (void *)objc_claimAutoreleasedReturnValue(),
        v114,
        v116))
  {
    objc_msgSend__didDownloadMMCSItems_inMemory_error_(val, v117, (uint64_t)obj, v135, v116);
    dispatch_group_leave(group);

    v120 = 0;
  }
  else
  {
    objc_initWeak((id *)location, val);
    v121 = MEMORY[0x1E0C809B0];
    v151[0] = MEMORY[0x1E0C809B0];
    v151[1] = 3221225472;
    v151[2] = sub_1BEA9E3A8;
    v151[3] = &unk_1E7832488;
    objc_copyWeak(&v152, (id *)location);
    v153 = v135;
    v149[0] = v121;
    v149[1] = 3221225472;
    v149[2] = sub_1BEA9E400;
    v149[3] = &unk_1E78324B0;
    objc_copyWeak(&v150, (id *)location);
    v145[0] = v121;
    v145[1] = 3221225472;
    v145[2] = sub_1BEA9E47C;
    v145[3] = &unk_1E78324D8;
    v145[4] = val;
    v146 = obj;
    v148 = v135;
    v147 = group;
    objc_msgSend_getItemGroupSet_operation_shouldFetchAssetContentInMemory_options_progress_command_completionHandler_(v134, v122, (uint64_t)v136, val, v135, v137, v151, v149, v145);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelTokens(val, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addCancelToken_withOperation_(v125, v126, (uint64_t)v120, val);

    objc_destroyWeak(&v150);
    objc_destroyWeak(&v152);
    objc_destroyWeak((id *)location);
  }
  objc_msgSend_qualityOfService(val, v118, v119);
  CKGetGlobalQueue();
  v127 = objc_claimAutoreleasedReturnValue();
  v143[0] = MEMORY[0x1E0C809B0];
  v143[1] = 3221225472;
  v143[2] = sub_1BEA9E6C0;
  v143[3] = &unk_1E782EE20;
  v143[4] = val;
  v144 = v120;
  v128 = v120;
  dispatch_group_notify(group, v127, v143);

}

- (BOOL)_postProcess
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
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
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  uint64_t v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend_assetURLInfosToFillOut(self, a2, v2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v47, v51, 16);
  if (v5)
  {
    v8 = v5;
    v45 = *(_QWORD *)v48;
    v43 = *MEMORY[0x1E0C94B20];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v45)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend_asset(v10, v6, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend_recordPCS(v10, v12, v13);
        objc_msgSend_recordKey(v11, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_container(self, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsManager(v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend_useEncryption(self, v24, v25);
        v29 = objc_msgSend_useClearAssetEncryption(self, v27, v28);
        v46 = 0;
        LOBYTE(v42) = 0;
        LOBYTE(v26) = objc_msgSend_fillInDownloadURLsForAssetWithFieldName_fileName_recordPCS_pcsManager_useEncryption_useClearAssetEncryption_alwaysAllowKeyExport_outError_(v11, v30, (uint64_t)v17, 0, v14, v23, v26, v29, v42, &v46);
        v31 = v46;

        if ((v26 & 1) == 0 && !v31)
        {
          v34 = (void *)MEMORY[0x1E0C94FF8];
          objc_msgSend_asset(v10, v32, v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v34, v36, v43, 1000, CFSTR("Failed to fill out download URL for asset %@"), v35);
          v31 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend_urlFilledOutBlock(self, v32, v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend_urlFilledOutBlock(self, v38, v39);
          v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, id))v40)[2](v40, v10, v31);

        }
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v47, v51, 16);
    }
    while (v8);
  }

  return 1;
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
  v8.super_class = (Class)CKDDownloadAssetsOperation;
  -[CKDOperation cancel](&v8, sel_cancel);
  objc_msgSend_cancelTokens(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v5, v6, v7);

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
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  objc_super v17;

  v4 = a3;
  objc_msgSend_hash(self, v5, v6);
  kdebug_trace();
  objc_msgSend_setDownloadPreparationBlock_(self, v7, 0);
  objc_msgSend_setDownloadProgressBlock_(self, v8, 0);
  objc_msgSend_setDownloadCommandBlock_(self, v9, 0);
  objc_msgSend_setDownloadCompletionBlock_(self, v10, 0);
  objc_msgSend_setUrlFilledOutBlock_(self, v11, 0);
  objc_msgSend_mmcs(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performOperationCleanup(v14, v15, v16);

  v17.receiver = self;
  v17.super_class = (Class)CKDDownloadAssetsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v17, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)main
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  char v12;
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
  _BOOL8 v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  id v35;

  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
  objc_msgSend_mmcs(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (!v6)
  {
    objc_msgSend_container(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v12 = objc_msgSend_setupAssetTransfers_(v10, v11, (uint64_t)&v35);
    v9 = v35;

    if ((v12 & 1) == 0)
    {
      objc_msgSend_finishWithError_(self, v13, (uint64_t)v9);
      goto LABEL_12;
    }
    objc_msgSend_container(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_MMCS(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMmcs_(self, v19, (uint64_t)v18);

  }
  objc_msgSend_assetsToDownload(self, v7, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v20, v21, v22))
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend_assetsToDownloadInMemory(self, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v26, v27, v28))
    {
      v25 = 0;
    }
    else
    {
      objc_msgSend_assetURLInfosToFillOut(self, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend_count(v31, v32, v33) == 0;

    }
  }

  objc_msgSend_makeStateTransition_(self, v34, v25);
LABEL_12:

}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (BOOL)shouldDownloadAssetFromTranscoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend_constructedAssetDownloadParameters(v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("DownloadAssetsFromTranscodingService"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 |= objc_msgSend_BOOLValue(v11, v12, v13);

  }
  return v8;
}

- (void)_downloadTranscodedAsset:(id)a3 inMemory:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  _BYTE *v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  __CFString *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  __CFString *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  id v75;
  id v76;
  const char *v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  void *v83;
  id location[4];

  v4 = a4;
  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v6;
    _os_log_debug_impl(&dword_1BE990000, v7, OS_LOG_TYPE_DEBUG, "Downloading transcoded asset %@", (uint8_t *)location, 0xCu);
  }
  v8 = (void *)objc_opt_new();
  v9 = objc_alloc(MEMORY[0x1E0C94C20]);
  objc_msgSend_record(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithRecord_(v9, v13, (uint64_t)v12);
  objc_msgSend_setRecord_(v8, v15, (uint64_t)v14);

  objc_msgSend_constructedAssetDownloadParameters(v6, v16, v17);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (_BYTE *)MEMORY[0x1E0C95280];
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)CFSTR("FakeConstructedAssetDownloadParameters"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = v23;

      v78 = v24;
    }

  }
  objc_msgSend_setConstructedAssetDownloadParameters_(v8, v18, (uint64_t)v78);
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcoderServiceName(v27, v28, v29);
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (*v20 && !v30)
  {
    objc_msgSend_unitTestOverrides(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)CFSTR("TranscoderServiceName"));
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (!v30)
    v30 = CFSTR("ProtectedTranscodingService");
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v31, v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcoderFunctionName(v35, v36, v37);
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (*v20 && !v38)
  {
    objc_msgSend_unitTestOverrides(self, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v41, v42, (uint64_t)CFSTR("TranscoderFunctionName"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (!v38)
    v38 = CFSTR("transcode");
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v39, v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcoderPermittedRemoteMeasurement(v43, v44, v45);
  v46 = (id)objc_claimAutoreleasedReturnValue();

  if (*v20 && !v46)
  {
    objc_msgSend_unitTestOverrides(self, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v49, v50, (uint64_t)CFSTR("TranscoderPermittedRemoteMeasurement"));
    v46 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v46)
  {
    if (qword_1ED700910 != -1)
      dispatch_once(&qword_1ED700910, &unk_1E78324F8);
    v46 = (id)qword_1ED700908;
  }
  v51 = (void *)objc_opt_new();
  v54 = objc_msgSend_databaseScope(self, v52, v53);
  objc_msgSend_setDatabaseScope_(v51, v55, v54);
  objc_msgSend_setServiceName_(v51, v56, (uint64_t)v30);
  objc_msgSend_setFunctionName_(v51, v57, (uint64_t)v38);
  objc_msgSend_setPermittedRemoteMeasurement_(v51, v58, (uint64_t)v46);
  objc_msgSend_setDataProtectionType_(v51, v59, 1);
  objc_msgSend_setShouldFetchAssetContentInMemory_(v51, v60, v4);
  objc_msgSend_setShouldSendRecordPCSKeys_(v51, v61, 1);
  objc_msgSend_record(v8, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localSerialization(v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v67;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v68, (uint64_t)&v83, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestLocalSerializations_(v51, v70, (uint64_t)v69);

  objc_initWeak(location, self);
  objc_msgSend_stateTransitionGroup(self, v71, v72);
  v73 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v73);

  v74 = objc_opt_class();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = sub_1BEA9F208;
  v79[3] = &unk_1E7832618;
  objc_copyWeak(&v82, location);
  v75 = v6;
  v80 = v75;
  v76 = v8;
  v81 = v76;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v77, v74, v51, v79);

  objc_destroyWeak(&v82);
  objc_destroyWeak(location);

}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (id)downloadPreparationBlock
{
  return self->_downloadPreparationBlock;
}

- (void)setDownloadPreparationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (id)downloadProgressBlock
{
  return self->_downloadProgressBlock;
}

- (void)setDownloadProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (id)downloadCommandBlock
{
  return self->_downloadCommandBlock;
}

- (void)setDownloadCommandBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (id)downloadCompletionBlock
{
  return self->_downloadCompletionBlock;
}

- (void)setDownloadCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (id)urlFilledOutBlock
{
  return self->_urlFilledOutBlock;
}

- (void)setUrlFilledOutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSMutableDictionary)keyOrErrorForHostname
{
  return self->_keyOrErrorForHostname;
}

- (void)setKeyOrErrorForHostname:(id)a3
{
  objc_storeStrong((id *)&self->_keyOrErrorForHostname, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSArray)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToDownload, a3);
}

- (NSArray)assetsToDownloadInMemory
{
  return self->_assetsToDownloadInMemory;
}

- (void)setAssetsToDownloadInMemory:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToDownloadInMemory, a3);
}

- (NSArray)assetURLInfosToFillOut
{
  return self->_assetURLInfosToFillOut;
}

- (void)setAssetURLInfosToFillOut:(id)a3
{
  objc_storeStrong((id *)&self->_assetURLInfosToFillOut, a3);
}

- (NSArray)MMCSItemsToDownload
{
  return self->_MMCSItemsToDownload;
}

- (void)setMMCSItemsToDownload:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSItemsToDownload, a3);
}

- (NSArray)MMCSItemsToDownloadInMemory
{
  return self->_MMCSItemsToDownloadInMemory;
}

- (void)setMMCSItemsToDownloadInMemory:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSItemsToDownloadInMemory, a3);
}

- (NSMutableArray)assetsToDownloadFromTranscoder
{
  return self->_assetsToDownloadFromTranscoder;
}

- (void)setAssetsToDownloadFromTranscoder:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToDownloadFromTranscoder, a3);
}

- (NSMutableArray)assetsToDownloadFromTranscoderInMemory
{
  return self->_assetsToDownloadFromTranscoderInMemory;
}

- (void)setAssetsToDownloadFromTranscoderInMemory:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToDownloadFromTranscoderInMemory, a3);
}

- (NSMapTable)downloadTasksByPackages
{
  return self->_downloadTasksByPackages;
}

- (void)setDownloadTasksByPackages:(id)a3
{
  objc_storeStrong((id *)&self->_downloadTasksByPackages, a3);
}

- (CKDCancelTokenGroup)cancelTokens
{
  return self->_cancelTokens;
}

- (void)setCancelTokens:(id)a3
{
  objc_storeStrong((id *)&self->_cancelTokens, a3);
}

- (unint64_t)maxPackageDownloadsPerBatch
{
  return self->_maxPackageDownloadsPerBatch;
}

- (void)setMaxPackageDownloadsPerBatch:(unint64_t)a3
{
  self->_maxPackageDownloadsPerBatch = a3;
}

- (CKDMMCS)mmcs
{
  return self->_mmcs;
}

- (void)setMmcs:(id)a3
{
  objc_storeStrong((id *)&self->_mmcs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmcs, 0);
  objc_storeStrong((id *)&self->_cancelTokens, 0);
  objc_storeStrong((id *)&self->_downloadTasksByPackages, 0);
  objc_storeStrong((id *)&self->_assetsToDownloadFromTranscoderInMemory, 0);
  objc_storeStrong((id *)&self->_assetsToDownloadFromTranscoder, 0);
  objc_storeStrong((id *)&self->_MMCSItemsToDownloadInMemory, 0);
  objc_storeStrong((id *)&self->_MMCSItemsToDownload, 0);
  objc_storeStrong((id *)&self->_assetURLInfosToFillOut, 0);
  objc_storeStrong((id *)&self->_assetsToDownloadInMemory, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keyOrErrorForHostname, 0);
  objc_storeStrong(&self->_urlFilledOutBlock, 0);
  objc_storeStrong(&self->_downloadCompletionBlock, 0);
  objc_storeStrong(&self->_downloadCommandBlock, 0);
  objc_storeStrong(&self->_downloadProgressBlock, 0);
  objc_storeStrong(&self->_downloadPreparationBlock, 0);
  objc_storeStrong((id *)&self->_prepareMMCSItemsToDownloadInMemory, 0);
  objc_storeStrong((id *)&self->_prepareMMCSItemsToDownload, 0);
}

@end
