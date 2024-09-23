@implementation CKDMMCSEncryptedItemReader

- (CKDMMCSEncryptedItemReader)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4
{
  id v7;
  id v8;
  CKDMMCSEncryptedItemReader *v9;
  CKDMMCSEncryptedItemReader *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKDMMCSEncryptedItemReader;
  v9 = -[CKDMMCSEncryptedItemReader init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_MMCSItem, a3);
    objc_storeStrong((id *)&v10->_MMCSRequest, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_closeWithError_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)CKDMMCSEncryptedItemReader;
  -[CKDMMCSEncryptedItemReader dealloc](&v3, sel_dealloc);
}

- (BOOL)openWithError:(id *)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  id v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  void *v48;
  id v49;
  BOOL v50;
  int v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  const char *v107;
  void *v108;
  const char *v109;
  void *v110;
  void *v111;
  int v112;
  int v113[2];
  int v114;
  void *v115;
  id *v116;
  void *v117;
  id v118;
  uint64_t v119;
  uint8_t buf[4];
  uint64_t v121;
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  _BYTE v127[10];
  __int16 v128;
  id v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSRequest(self, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSItem(self, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v106, v107, (uint64_t)a2, self, CFSTR("CKDMMCSEncryptedItemReader.m"), 52, CFSTR("Expected non-nil MMCS item for %@"), self);

  }
  v14 = objc_msgSend_handle(self, v9, v10);
  v119 = v14;
  if (v14)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v108, v109, (uint64_t)a2, self, CFSTR("CKDMMCSEncryptedItemReader.m"), 54, CFSTR("Expected an invalid handle for %@"), self);

  }
  objc_msgSend_fileURL(v11, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_operation(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0;
  objc_msgSend_openWithOperation_error_(v11, v22, (uint64_t)v21, &v118);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v118;
  v27 = v24;
  if (v23)
  {
    v116 = a3;
    objc_msgSend_fileHandle(v23, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptedFileHandle(v23, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v31;
    v117 = v21;
    if (!v28 || !v31 || (objc_msgSend_fileDescriptor(v31, v32, v33) & 0x80000000) != 0)
    {
      *(_QWORD *)v113 = v6;
      v115 = v11;
      v38 = (void *)MEMORY[0x1E0C94FF8];
      v39 = *MEMORY[0x1E0C94B20];
      objc_msgSend_fileHandle(v23, v32, v33);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v23;
      objc_msgSend_encryptedFileHandle(v23, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v39;
      v45 = v18;
      objc_msgSend_errorWithDomain_code_path_format_(v38, v46, v44, 3001, v18, CFSTR("Invalid file handles, fileHandle:%@, encryptedFileHandle:%@"), v40, v43);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v48 = (void *)*MEMORY[0x1E0C952B0];
      v6 = *(void **)v113;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v72 = v48;
        v75 = objc_msgSend_itemID(v115, v73, v74);
        objc_msgSend_operationID(v117, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v121 = v75;
        v18 = v45;
        v122 = 2048;
        v123 = v14;
        v124 = 2114;
        v125 = v78;
        v126 = 2112;
        *(_QWORD *)v127 = v47;
        _os_log_error_impl(&dword_1BE990000, v72, OS_LOG_TYPE_ERROR, "Failed to open itemID:%llu, handle:%p, operationID:%{public}@: %@", buf, 0x2Au);

        v6 = *(void **)v113;
      }
      if (v116)
      {
        v49 = objc_retainAutorelease(v47);
        v50 = 0;
        *v116 = v49;
        v11 = v115;
        v21 = v117;
      }
      else
      {
        v50 = 0;
        v11 = v115;
        v21 = v117;
        v49 = v47;
      }
      v23 = v111;
      goto LABEL_22;
    }
    v110 = v18;
    if ((objc_msgSend_fileDescriptor(v28, v32, v33) & 0x80000000) != 0)
    {
      v112 = -1;
    }
    else
    {
      v37 = objc_msgSend_fileDescriptor(v28, v35, v36);
      v112 = dup(v37);
      if (v112 < 0)
      {
        v114 = -1;
        goto LABEL_28;
      }
    }
    v52 = objc_msgSend_fileDescriptor(v34, v35, v36);
    v114 = dup(v52);
    if ((v114 & 0x80000000) == 0)
    {
      v55 = 0;
      v56 = 1;
      goto LABEL_29;
    }
LABEL_28:
    v56 = 0;
    v55 = *__error();
LABEL_29:
    if ((objc_msgSend_fileDescriptor(v28, v53, v54) & 0x80000000) == 0)
      objc_msgSend_closeFile(v28, v57, v58);
    if ((objc_msgSend_fileDescriptor(v34, v57, v58) & 0x80000000) == 0)
      objc_msgSend_closeFile(v34, v59, v60);

    if ((v56 & 1) != 0)
    {
      v61 = v114;
      v62 = MKBBackupCreateFromFileDescriptors();
      if ((_DWORD)v62)
      {
        v18 = v110;
        objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v63, *MEMORY[0x1E0C94B20], 3001, v110, CFSTR("MKBBackupCreateFromFileDescriptors failed with rc:%d"), v62);
        v49 = (id)objc_claimAutoreleasedReturnValue();

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v64 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          v86 = v64;
          v89 = objc_msgSend_itemID(v11, v87, v88);
          v90 = v11;
          v91 = v6;
          v92 = v119;
          objc_msgSend_operationID(v117, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219266;
          v121 = v89;
          v122 = 2048;
          v123 = v92;
          v6 = v91;
          v11 = v90;
          v61 = v114;
          v124 = 2114;
          v125 = v95;
          v126 = 1024;
          *(_DWORD *)v127 = v112;
          *(_WORD *)&v127[4] = 1024;
          *(_DWORD *)&v127[6] = v114;
          v128 = 2114;
          v129 = v49;
          _os_log_error_impl(&dword_1BE990000, v86, OS_LOG_TYPE_ERROR, "MKBBackupCreateFromFileDescriptors failed for itemID:%llu, handle:%p, operationID:%{public}@, fd:%d, efd:%d: %{public}@", buf, 0x36u);

          v18 = v110;
        }
        close(v61);
        if ((v112 & 0x80000000) == 0)
          close(v112);
        v34 = 0;
        v28 = 0;
        v50 = 0;
      }
      else
      {
        objc_msgSend_setHandle_(self, v63, v119);
        v18 = v110;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v71 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v96 = v71;
          v99 = objc_msgSend_itemID(v11, v97, v98);
          v100 = v11;
          v101 = v6;
          v102 = v119;
          v21 = v117;
          objc_msgSend_operationID(v117, v103, v104);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v121 = v99;
          v122 = 2048;
          v123 = v102;
          v6 = v101;
          v11 = v100;
          v124 = 2114;
          v125 = v105;
          v126 = 1024;
          *(_DWORD *)v127 = v112;
          *(_WORD *)&v127[4] = 1024;
          *(_DWORD *)&v127[6] = v114;
          _os_log_debug_impl(&dword_1BE990000, v96, OS_LOG_TYPE_DEBUG, "open, itemID:%llu, handle:%p, operationID:%{public}@, fd:%d, efd:%d", buf, 0x2Cu);

          v18 = v110;
          v34 = 0;
          v28 = 0;
          v50 = 1;
          v49 = v27;
          goto LABEL_22;
        }
        v34 = 0;
        v28 = 0;
        v50 = 1;
        v49 = v27;
      }
      v21 = v117;
LABEL_22:

      v27 = v49;
      goto LABEL_23;
    }
    v65 = (void *)MEMORY[0x1E0C94FF8];
    v66 = *MEMORY[0x1E0C94B20];
    v67 = strerror(v55);
    v68 = v66;
    v18 = v110;
    objc_msgSend_errorWithDomain_code_path_format_(v65, v69, v68, 3001, v110, CFSTR("dup failed, %d (%s)"), v55, v67);
    v49 = (id)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v70 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v79 = v70;
      v82 = objc_msgSend_itemID(v11, v80, v81);
      objc_msgSend_operationID(v117, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v121 = v82;
      v122 = 2048;
      v123 = v14;
      v124 = 2114;
      v125 = v85;
      v126 = 2112;
      *(_QWORD *)v127 = v49;
      _os_log_error_impl(&dword_1BE990000, v79, OS_LOG_TYPE_ERROR, "Failed to dup file descriptors for itemID:%llu, handle:%p, operationID:%{public}@: %@", buf, 0x2Au);

      v18 = v110;
      if (!v116)
        goto LABEL_47;
    }
    else if (!v116)
    {
LABEL_47:
      v21 = v117;
      if ((v114 & 0x80000000) == 0)
        close(v114);
      if ((v112 & 0x80000000) == 0)
        close(v112);
      v34 = 0;
      v28 = 0;
      v50 = 0;
      goto LABEL_22;
    }
    *v116 = objc_retainAutorelease(v49);
    goto LABEL_47;
  }
  if (a3)
  {
    v27 = objc_retainAutorelease(v24);
    v50 = 0;
    *a3 = v27;
  }
  else
  {
    v50 = 0;
  }
LABEL_23:

  return v50;
}

- (BOOL)closeWithError:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSItem(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_handle(self, v5, v6);
  if (v7)
  {
    v8 = v7;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v12 = v9;
      *(_DWORD *)buf = 134218240;
      v16 = objc_msgSend_itemID(v4, v13, v14);
      v17 = 2048;
      v18 = v8;
      _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "close, itemID:%llu, handle:%p", buf, 0x16u);

    }
    MKBBackupClose();
    objc_msgSend_setHandle_(self, v10, 0);
  }

  return 1;
}

- (id)getFileMetadataWithError:(id *)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSItem(self, a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, CFSTR("CKDMMCSEncryptedItemReader.m"), 135, CFSTR("Expected non-nil MMCS item for %@"), self);

  }
  v10 = objc_msgSend_handle(self, v5, v6);
  if (!v10)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, CFSTR("CKDMMCSEncryptedItemReader.m"), 137, CFSTR("Expected a valid handle for %@"), self);

  }
  v11 = MKBBackupSize();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v12 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v19 = v12;
    *(_DWORD *)buf = 134218496;
    v27 = objc_msgSend_itemID(v7, v20, v21);
    v28 = 2048;
    v29 = v10;
    v30 = 2048;
    v31 = v11;
    _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, "stat, itemID:%llu, handle:%p, fileSize:%lld", buf, 0x20u);

  }
  v13 = objc_alloc(MEMORY[0x1E0C94E90]);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initWithFileSize_(v13, v16, (uint64_t)v15);

  return v17;
}

- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  unint64_t v24;
  const char *v25;
  int64_t v26;
  id v27;
  void *v28;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  const char *v38;
  NSObject *loga;
  os_log_t log;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSRequest(self, a2, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSItem(self, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, self, CFSTR("CKDMMCSEncryptedItemReader.m"), 149, CFSTR("Expected non-nil MMCS item for %@"), self);

  }
  v21 = objc_msgSend_handle(self, v16, v17);
  if (!v21)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(log, v38, (uint64_t)a2, self, CFSTR("CKDMMCSEncryptedItemReader.m"), 151, CFSTR("Expected a valid handle for %@"), self);

  }
  objc_msgSend_operation(v13, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIsReaderReadFrom_(v18, v23, 1);
  v24 = MKBBackupPread();
  v26 = v24;
  if ((v24 & 0x8000000000000000) != 0)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v25, *MEMORY[0x1E0C94B20], 1000, CFSTR("MKBBackupPread failed"));
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v28 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      loga = v28;
      v32 = objc_msgSend_itemID(v18, v30, v31);
      objc_msgSend_operationID(v22, v33, v34);
      *(_DWORD *)buf = 134219266;
      v42 = v32;
      v43 = 2048;
      v44 = v21;
      v45 = 2114;
      v46 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v46;
      v47 = 2048;
      v48 = a3;
      v49 = 2048;
      v50 = a5;
      v51 = 2114;
      v52 = v27;
      _os_log_error_impl(&dword_1BE990000, loga, OS_LOG_TYPE_ERROR, "MKBBackupPread failed for itemID:%llu, handle:%p, operationID:%{public}@, offset:0x%llx, length:%llu: %{public}@", buf, 0x3Eu);

      if (!a7)
        goto LABEL_13;
    }
    else if (!a7)
    {
      goto LABEL_13;
    }
    v27 = objc_retainAutorelease(v27);
    *a7 = v27;
    goto LABEL_13;
  }
  v27 = 0;
  if (a6)
    *a6 = v24;
LABEL_13:

  return v26 >= 0;
}

- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7
{
  void *v10;
  const char *v11;
  const char *v12;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("CKDMMCSEncryptedItemReader.m"), 176, CFSTR("writing not supported"));

  if (a7)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v12, *MEMORY[0x1E0C94B20], 3001, CFSTR("write not supported"));
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (CKDMMCSItemGroupContext)MMCSRequest
{
  return self->_MMCSRequest;
}

- (void)setMMCSRequest:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSRequest, a3);
}

- (CKDMMCSItem)MMCSItem
{
  return self->_MMCSItem;
}

- (void)setMMCSItem:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSItem, a3);
}

- (_mkbbackupref)handle
{
  return self->_handle;
}

- (void)setHandle:(_mkbbackupref *)a3
{
  self->_handle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSItem, 0);
  objc_storeStrong((id *)&self->_MMCSRequest, 0);
}

@end
