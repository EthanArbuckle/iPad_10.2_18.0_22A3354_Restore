@implementation CKAssetDownloadStagingManager

- (CKAssetDownloadStagingManager)initWithDirectory:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CKAssetDownloadStagingManager *v19;
  CKAssetDownloadStagingManager *v20;
  NSMutableDictionary *fileHandlesForInflightLastPathComponent;
  CKException *v23;
  const char *v24;
  void *v25;
  CKException *v26;
  const char *v27;
  CKException *v28;
  const char *v29;
  CKException *v30;
  const char *v31;
  CKException *v32;
  const char *v33;
  objc_super v34;

  v5 = a3;
  if (!v5)
  {
    v23 = [CKException alloc];
    v25 = (void *)objc_msgSend_initWithCode_format_(v23, v24, 12, (uint64_t)CFSTR("Missing root directory"));
    goto LABEL_14;
  }
  v8 = v5;
  objc_msgSend_URLByAppendingPathComponent_(v5, v6, (uint64_t)CFSTR("inflight"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v26 = [CKException alloc];
    v25 = (void *)objc_msgSend_initWithCode_format_(v26, v27, 12, (uint64_t)CFSTR("Unable to create inflight file URL"));
    goto LABEL_14;
  }
  v12 = v9;
  if ((CKCreateDirectoryAtURL(v9, 0, v10, v11) & 1) == 0)
  {
    v28 = [CKException alloc];
    v25 = (void *)objc_msgSend_initWithCode_format_(v28, v29, 12, (uint64_t)CFSTR("Unable to initialize inflight file directory"));
    goto LABEL_14;
  }
  objc_msgSend_URLByAppendingPathComponent_(v8, v13, (uint64_t)CFSTR("finished"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v30 = [CKException alloc];
    v25 = (void *)objc_msgSend_initWithCode_format_(v30, v31, 12, (uint64_t)CFSTR("Unable to create finished file URL"));
    goto LABEL_14;
  }
  v18 = v15;
  if ((CKCreateDirectoryAtURL(v15, 0, v16, v17) & 1) == 0)
  {
    v32 = [CKException alloc];
    v25 = (void *)objc_msgSend_initWithCode_format_(v32, v33, 12, (uint64_t)CFSTR("Unable to initialize finished file directory"));
LABEL_14:
    objc_exception_throw(v25);
  }
  v34.receiver = self;
  v34.super_class = (Class)CKAssetDownloadStagingManager;
  v19 = -[CKAssetDownloadStagingManager init](&v34, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_directory, a3);
    objc_storeStrong((id *)&v20->_inflightDownloadDirectory, v12);
    objc_storeStrong((id *)&v20->_finishedDownloadDirectory, v18);
    fileHandlesForInflightLastPathComponent = v20->_fileHandlesForInflightLastPathComponent;
    v20->_fileHandlesForInflightLastPathComponent = 0;

    objc_storeStrong((id *)&v20->_fileProtectionType, (id)*MEMORY[0x1E0CB2AC0]);
  }

  return v20;
}

- (BOOL)keepInflightFilesOpen
{
  CKAssetDownloadStagingManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_fileHandlesForInflightLastPathComponent(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  objc_sync_exit(v2);
  return v7;
}

- (void)setKeepInflightFilesOpen:(BOOL)a3
{
  _BOOL4 v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  CKAssetDownloadStagingManager *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (v3)
  {
    objc_msgSend_fileHandlesForInflightLastPathComponent(obj, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend_setFileHandlesForInflightLastPathComponent_(obj, v9, (uint64_t)v8, v10);

    }
  }
  else
  {
    objc_msgSend_setFileHandlesForInflightLastPathComponent_(obj, v4, 0, v6);
  }
  objc_sync_exit(obj);

}

- (BOOL)openWithAssetDownloadStagingInfo:(id)a3 fileDescriptor:(int *)a4 closeOnDealloc:(BOOL *)a5 error:(id *)a6
{
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CKAssetDownloadStagingManager *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  NSObject *v29;
  const char *v30;
  BOOL v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  int v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  int *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  int v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  char v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  int v79;
  const char *v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  char v87;
  id v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  id v100;
  BOOL v101;
  unsigned int v102;
  id v105;
  id v106;
  uint8_t buf[4];
  id v108;
  uint64_t v109;
  _QWORD v110[2];

  v110[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_inflightLastPathComponentWithInfo_(self, v9, (uint64_t)v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_inflightURLWithLastPathComponent_(self, v11, (uint64_t)v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = self;
      objc_sync_enter(v15);
      objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19
        && (objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v20, v21, v22),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v13, v25),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v23,
            v26))
      {
        v27 = objc_msgSend_fileDescriptor(v26, v20, v21, v22);

        v101 = 0;
        v102 = v27;
        if ((v27 & 0x80000000) == 0)
        {
          v28 = 2;
          goto LABEL_19;
        }
      }
      else
      {
        v101 = 1;
      }
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v20, v21, v22);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v14, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_fileExistsAtPath_(v32, v37, (uint64_t)v36, v38);

      if (v39)
        v28 = 2;
      else
        v28 = 514;
      v40 = objc_retainAutorelease(v14);
      v44 = (const char *)objc_msgSend_fileSystemRepresentation(v40, v41, v42, v43);
      v102 = open(v44, v28, 384);
      v45 = __error();
      if ((v102 & 0x80000000) == 0)
      {
        objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          v50 = objc_alloc(MEMORY[0x1E0CB3608]);
          v52 = (void *)objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v50, v51, v102, 1);
          objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v53, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v56, v57, (uint64_t)v52, (uint64_t)v13);

          v101 = 0;
        }
LABEL_19:
        objc_msgSend_fileProtectionType(v15, v20, v21, v22);
        v58 = objc_claimAutoreleasedReturnValue();
        v62 = (void *)v58;
        v63 = 0;
        if (v28 < 0x200 || !v58)
          goto LABEL_51;
        objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v59, v60, v61);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = *MEMORY[0x1E0CB2AD8];
        v110[0] = v62;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v65, (uint64_t)v110, (uint64_t)&v109, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_path(v14, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = 0;
        v72 = objc_msgSend_setAttributes_ofItemAtPath_error_(v64, v71, (uint64_t)v66, (uint64_t)v70, &v106);
        v100 = v106;
        if (v100)
          v72 = 0;

        if ((v72 & 1) != 0)
        {
          v63 = 0;
LABEL_51:

LABEL_52:
          objc_sync_exit(v15);

          if (!v63)
          {
            if (a4)
              *a4 = v102;
            if (a5)
              *a5 = v101;
            v31 = 1;
            goto LABEL_59;
          }
          goto LABEL_53;
        }
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v81 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v108 = v100;
          _os_log_error_impl(&dword_18A5C5000, v81, OS_LOG_TYPE_ERROR, "Failed to set fileProtectionType for inflightFile with error %@", buf, 0xCu);
          if (!a6)
            goto LABEL_41;
        }
        else if (!a6)
        {
LABEL_41:
          objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v82, v83, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = 0;
          v87 = objc_msgSend_removeItemAtURL_error_(v85, v86, (uint64_t)v14, (uint64_t)&v105);
          v88 = v105;
          if (v88)
            v87 = 0;

          if ((v87 & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v92 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v108 = v88;
              _os_log_error_impl(&dword_18A5C5000, v92, OS_LOG_TYPE_ERROR, "Failed to remove inflightFile with error %@", buf, 0xCu);
            }
          }
          objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v89, v90, v91);
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          if (v93)
          {
            objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v94, v95, v96);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v97, v98, 0, (uint64_t)v13);

          }
          v63 = 1;
          goto LABEL_51;
        }
        objc_msgSend_errorWithDomain_code_error_format_(CKPrettyError, v82, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, v100, CFSTR("Failed to set fileProtectionType for inflightFile"));
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      v75 = *v45;
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v76 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v108) = v75;
        _os_log_error_impl(&dword_18A5C5000, v76, OS_LOG_TYPE_ERROR, "open failed with errno:%d", buf, 8u);
        if (!a6)
          goto LABEL_35;
      }
      else if (!a6)
      {
LABEL_35:
        v63 = 1;
        goto LABEL_52;
      }
      v79 = objc_msgSend_errorCodeFromPOSIXCode_(CKAsset, v77, v75, v78);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v80, (uint64_t)CFSTR("CKInternalErrorDomain"), v79, CFSTR("open failed with errno:%d"), v75);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v73 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A5C5000, v73, OS_LOG_TYPE_ERROR, "Failed to create inflightFileURL.", buf, 2u);
      if (a6)
        goto LABEL_29;
    }
    else if (a6)
    {
LABEL_29:
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v74, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Failed to create inflightFileURL."));
      v31 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:

      goto LABEL_60;
    }
LABEL_53:
    v31 = 0;
    goto LABEL_59;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v29 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Failed to create inflightLastPathComponent.", buf, 2u);
    if (a6)
      goto LABEL_11;
LABEL_62:
    v31 = 0;
    goto LABEL_60;
  }
  if (!a6)
    goto LABEL_62;
LABEL_11:
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v30, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Failed to create inflightLastPathComponent."));
  v31 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_60:

  return v31;
}

- (BOOL)finishWithAssetDownloadStagingInfo:(id)a3 fileURL:(id *)a4 fileHandle:(id *)a5 error:(id *)a6
{
  id v10;
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
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  char v25;
  CKAssetDownloadStagingManager *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  const char *v48;
  NSObject *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  id v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend_inflightLastPathComponentWithInfo_(self, v11, (uint64_t)v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend_inflightURLWithLastPathComponent_(self, v13, (uint64_t)v15, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend_finishedURLWithInfo_(self, v16, (uint64_t)v10, v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v19, v20, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        v25 = objc_msgSend_moveItemAtURL_toURL_error_(v23, v24, (uint64_t)v18, (uint64_t)v22, &v55);
        v54 = v55;
        if (v54)
          v25 = 0;

        if ((v25 & 1) != 0)
        {
          v26 = self;
          objc_sync_enter(v26);
          objc_msgSend_fileHandlesForInflightLastPathComponent(v26, v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend_fileHandlesForInflightLastPathComponent(v26, v31, v32, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)v15, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_fileHandlesForInflightLastPathComponent(v26, v38, v39, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v41, v42, 0, (uint64_t)v15);

            objc_msgSend_seekToFileOffset_(v37, v43, 0, v44);
          }
          else
          {
            v37 = 0;
          }
          objc_sync_exit(v26);

          if (a4)
            *a4 = objc_retainAutorelease(v22);
          if (a5)
            *a5 = objc_retainAutorelease(v37);

          goto LABEL_35;
        }
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v51 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v57 = v18;
          v58 = 2112;
          v59 = v22;
          v60 = 2112;
          v61 = v54;
          _os_log_error_impl(&dword_18A5C5000, v51, OS_LOG_TYPE_ERROR, "Failed to move existing item at path %@ to path %@ with error %@", buf, 0x20u);
          if (!a6)
            goto LABEL_35;
        }
        else if (!a6)
        {
LABEL_35:

          goto LABEL_36;
        }
        objc_msgSend_errorWithDomain_code_error_format_(CKPrettyError, v52, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, v54, CFSTR("Failed to move existing item at path %@ to path %@"), v18, v22);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v49 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18A5C5000, v49, OS_LOG_TYPE_ERROR, "Failed to create finishedFileURL.", buf, 2u);
        if (a6)
          goto LABEL_23;
      }
      else if (a6)
      {
LABEL_23:
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v50, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Failed to create finishedFileURL."));
        v25 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

        goto LABEL_37;
      }
      v25 = 0;
      goto LABEL_36;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v47 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A5C5000, v47, OS_LOG_TYPE_ERROR, "Failed to create inflightFileURL.", buf, 2u);
      if (a6)
        goto LABEL_18;
    }
    else if (a6)
    {
LABEL_18:
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v48, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Failed to create inflightFileURL."));
      v25 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

      goto LABEL_38;
    }
    v25 = 0;
    goto LABEL_37;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v45 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18A5C5000, v45, OS_LOG_TYPE_ERROR, "Failed to create inflightLastPathComponent.", buf, 2u);
    if (a6)
      goto LABEL_13;
LABEL_40:
    v25 = 0;
    goto LABEL_38;
  }
  if (!a6)
    goto LABEL_40;
LABEL_13:
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v46, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Failed to create inflightLastPathComponent."));
  v25 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v25;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  id v18;

  v18 = a3;
  objc_msgSend_directory(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v18, v8, (uint64_t)CFSTR("directory"), (uint64_t)v7, 1);

  objc_msgSend_fileProtectionType(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v18, v13, (uint64_t)CFSTR("fileProtectionType"), (uint64_t)v12, 0);

  if (objc_msgSend_keepInflightFilesOpen(self, v14, v15, v16))
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v18, v17, (uint64_t)CFSTR("keepInflightFilesOpen"), (uint64_t)CFSTR("true"), 0);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKAssetDownloadStagingManager *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKAssetDownloadStagingManager *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (id)inflightLastPathComponentWithInfo:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint8_t v37[16];
  uint8_t v38[16];
  uint8_t v39[16];
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend_itemID(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v7)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_msgSend_longLongValue(v7, v8, v9, v10);
    objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("%llu"), v15, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend_signature(v3, v16, v17, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend_signature(v3, v20, v21, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        CKStringWithData(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        v29 = (void *)objc_msgSend_initWithFormat_(v26, v27, (uint64_t)CFSTR("%@.%@"), v28, v19, v25);
        v30 = v29;
        if (v29)
        {
          v31 = v29;
        }
        else
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v35 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v37 = 0;
            _os_log_error_impl(&dword_18A5C5000, v35, OS_LOG_TYPE_ERROR, "Failed to create inflightLastPathComponent.", v37, 2u);
          }
        }

      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v34 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v38 = 0;
          _os_log_error_impl(&dword_18A5C5000, v34, OS_LOG_TYPE_ERROR, "Missing signature.", v38, 2u);
        }
        v30 = 0;
      }

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v33 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v39 = 0;
        _os_log_error_impl(&dword_18A5C5000, v33, OS_LOG_TYPE_ERROR, "Failed to create inflightLastPathComponent.", v39, 2u);
      }
      v30 = 0;
    }

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v32 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A5C5000, v32, OS_LOG_TYPE_ERROR, "Missing itemID.", buf, 2u);
    }
    v30 = 0;
  }

  return v30;
}

- (id)inflightURLWithLastPathComponent:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v13;
  const char *v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, CFSTR("CKAssetDownloadStagingManager.m"), 227, CFSTR("Missing inflightLastPathComponent."));

  }
  objc_msgSend_inflightDownloadDirectory(self, v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v9, v10, (uint64_t)v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)finishedURLWithInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint8_t v32[16];
  uint8_t v33[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend_trackingUUID(v4, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend_signature(v4, v8, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend_signature(v4, v12, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CKStringWithData(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v24 = (void *)objc_msgSend_initWithFormat_(v18, v19, (uint64_t)CFSTR("%@.%@"), v20, v11, v17);
      if (v24)
      {
        objc_msgSend_finishedDownloadDirectory(self, v21, v22, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_URLByAppendingPathComponent_isDirectory_(v25, v26, (uint64_t)v24, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v30 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v32 = 0;
          _os_log_error_impl(&dword_18A5C5000, v30, OS_LOG_TYPE_ERROR, "Failed to create finishedLastPathComponent.", v32, 2u);
        }
        v27 = 0;
      }

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v29 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v33 = 0;
        _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Missing signature.", v33, 2u);
      }
      v27 = 0;
    }

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v28 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_ERROR, "Missing trackingUUID.", buf, 2u);
    }
    v27 = 0;
  }

  return v27;
}

- (NSURL)directory
{
  return self->_directory;
}

- (NSString)fileProtectionType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileProtectionType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)fileHandlesForInflightLastPathComponent
{
  return self->_fileHandlesForInflightLastPathComponent;
}

- (void)setFileHandlesForInflightLastPathComponent:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandlesForInflightLastPathComponent, a3);
}

- (NSURL)inflightDownloadDirectory
{
  return self->_inflightDownloadDirectory;
}

- (NSURL)finishedDownloadDirectory
{
  return self->_finishedDownloadDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedDownloadDirectory, 0);
  objc_storeStrong((id *)&self->_inflightDownloadDirectory, 0);
  objc_storeStrong((id *)&self->_fileHandlesForInflightLastPathComponent, 0);
  objc_storeStrong((id *)&self->_fileProtectionType, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

@end
