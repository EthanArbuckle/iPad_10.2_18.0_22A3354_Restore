@implementation CKDMMCSItemReaderWriter

- (CKDMMCSItemReaderWriter)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4 downloadChunkContext:(id)a5
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  CKDMMCSItemReaderWriter *v15;
  CKDMMCSItemReaderWriter *v16;
  NSObject *v17;
  void *v19;
  const char *v20;
  objc_super v21;
  uint8_t buf[4];
  CKDMMCSItemReaderWriter *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v14 = a5;
  if (!v10)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, CFSTR("CKDMMCSItemReaderWriter.m"), 32, CFSTR("Expected non-nil MMCS item"));

  }
  v21.receiver = self;
  v21.super_class = (Class)CKDMMCSItemReaderWriter;
  v15 = -[CKDMMCSItemReaderWriter init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_MMCSItem, a3);
    objc_storeStrong((id *)&v16->_MMCSRequest, a4);
    objc_storeStrong((id *)&v16->_downloadChunkContext, a5);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v23 = v16;
      _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "init, reader:%p", buf, 0xCu);
    }
  }

  return v16;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  CKDMMCSItemReaderWriter *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "dealloc, reader:%p", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDMMCSItemReaderWriter;
  -[CKDMMCSItemReaderWriter dealloc](&v4, sel_dealloc);
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
  void *v14;
  const char *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  BOOL v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  id v29;
  id v30;
  id v31;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSRequest(self, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSItem(self, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, CFSTR("CKDMMCSItemReaderWriter.m"), 51, CFSTR("Expected non-nil MMCS item for %@"), self);

  }
  objc_msgSend_fileHandle(self, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, self, CFSTR("CKDMMCSItemReaderWriter.m"), 53, CFSTR("Expected an invalid file handle for %@"), self);

  }
  objc_msgSend_operation(v6, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v49 = 0;
    v17 = objc_msgSend_willOpenItemReaderWriter_error_(v6, v15, (uint64_t)self, &v49);
    v18 = v49;
    v19 = v18;
    if ((v17 & 1) == 0)
    {
      if (a3)
      {
        v19 = objc_retainAutorelease(v18);
        v20 = 0;
        *a3 = v19;
      }
      else
      {
        v20 = 0;
      }
      goto LABEL_22;
    }
  }
  else
  {
    v19 = 0;
  }
  v21 = v19;
  v48 = v19;
  objc_msgSend_openWithOperation_error_(v11, v15, (uint64_t)v16, &v48);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v48;

  v20 = v22 != 0;
  if (v22)
  {
    objc_msgSend_fileHandle(v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_setFileHandle_(self, v26, v25);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v33 = v27;
      objc_msgSend_MMCSItem(self, v34, v35);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trackingUUID(v46, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend_itemID(v11, v39, v40);
      *(_DWORD *)buf = 138412802;
      v51 = v38;
      v52 = 2048;
      v53 = v41;
      v54 = 2048;
      v55 = v25;
      _os_log_debug_impl(&dword_1BE990000, v33, OS_LOG_TYPE_DEBUG, "open, trackingUUID:%@ itemID:%llu, handle:%p", buf, 0x20u);

    }
    v47 = 0;
    v29 = (id)objc_msgSend_getFileMetadataWithError_(self, v28, (uint64_t)&v47);
    v30 = v47;
    if (a3)
      v31 = *a3;
    else
      v31 = 0;
    v14 = (void *)v25;
    v20 = 1;
  }
  else if (a3)
  {
    v31 = objc_retainAutorelease(v19);
    v30 = 0;
    *a3 = v31;
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }
  objc_msgSend_didOpenItemReaderWriter_result_error_(v6, v23, (uint64_t)self, v22 != 0, v31);

LABEL_22:
  return v20;
}

- (BOOL)closeWithError:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSItem(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileHandle(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v11 = v8;
      v14 = 134218240;
      v15 = objc_msgSend_itemID(v4, v12, v13);
      v16 = 2048;
      v17 = v7;
      _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "close, itemID:%llu, handle:%p", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend_setFileHandle_(self, v9, 0);
  }

  return 1;
}

- (id)getFileMetadataWithError:(id *)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  void *v33;
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
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSObject *log;
  void *v71;
  id v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSRequest(self, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSItem(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v65, v66, (uint64_t)a2, self, CFSTR("CKDMMCSItemReaderWriter.m"), 101, CFSTR("Expected non-nil MMCS item for %@"), self);

  }
  objc_msgSend_fileHandle(self, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend_container(v9, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    objc_msgSend_getFileMetadataWithContainer_fileHandle_error_(v14, v19, (uint64_t)v18, v17, &v72);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v72;

    v22 = (void *)*MEMORY[0x1E0C952F8];
    if (v20)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v22);
      v23 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        log = v23;
        v68 = objc_msgSend_itemID(v14, v35, v36);
        objc_msgSend_fileSize(v20, v37, v38);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend_unsignedLongLongValue(v71, v39, v40);
        objc_msgSend_fileID(v20, v41, v42);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend_unsignedLongLongValue(v69, v43, v44);
        objc_msgSend_generationID(v20, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend_unsignedLongValue(v48, v49, v50);
        objc_msgSend_modTimeInSeconds(v20, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend_unsignedLongLongValue(v54, v55, v56);
        *(_DWORD *)buf = 134219264;
        v74 = v68;
        v75 = 2048;
        v76 = v17;
        v77 = 2048;
        v78 = v67;
        v79 = 2048;
        v80 = v45;
        v81 = 2048;
        v82 = v51;
        v83 = 2048;
        v84 = v57;
        _os_log_debug_impl(&dword_1BE990000, log, OS_LOG_TYPE_DEBUG, "stat, itemID:%llu, handle:%p, fileSize:%llu, fileID:%llu, generationID:%lu, modTime:%llu", buf, 0x3Eu);

      }
      v24 = v20;
      goto LABEL_20;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v22);
    v33 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v58 = v33;
      v61 = objc_msgSend_itemID(v14, v59, v60);
      objc_msgSend_operationID(v9, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v74 = v61;
      v75 = 2048;
      v76 = v17;
      v77 = 2114;
      v78 = (uint64_t)v64;
      v79 = 2112;
      v80 = (uint64_t)v21;
      _os_log_error_impl(&dword_1BE990000, v58, OS_LOG_TYPE_ERROR, "Failed to stat itemID:%llu, handle:%p, operationID:%{public}@: %@", buf, 0x2Au);

      if (!a3)
        goto LABEL_20;
    }
    else if (!a3)
    {
LABEL_20:

      goto LABEL_21;
    }
    *a3 = objc_retainAutorelease(v21);
    goto LABEL_20;
  }
  v25 = (void *)MEMORY[0x1E0C94FF8];
  v26 = *MEMORY[0x1E0C947D8];
  v27 = objc_msgSend_itemID(v14, v15, v16);
  objc_msgSend_operationID(v9, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_format_(v25, v31, v26, 1000, CFSTR("No file handle for itemID:%llu, operationID:%@"), v27, v30);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v32 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v74 = (uint64_t)v21;
    _os_log_error_impl(&dword_1BE990000, v32, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    if (a3)
      goto LABEL_14;
LABEL_23:
    v20 = 0;
    goto LABEL_21;
  }
  if (!a3)
    goto LABEL_23;
LABEL_14:
  v21 = objc_retainAutorelease(v21);
  v20 = 0;
  *a3 = v21;
LABEL_21:

  return v20;
}

- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  ssize_t v28;
  ssize_t v29;
  int *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  char *v34;
  const char *v35;
  void *v36;
  void *v37;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  const char *v47;
  NSObject *loga;
  os_log_t log;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSRequest(self, a2, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSItem(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(v13, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, self, CFSTR("CKDMMCSItemReaderWriter.m"), 133, CFSTR("Expected non-nil MMCS item for %@"), self);

  }
  objc_msgSend_fileHandle(self, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v22, v23);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(log, v47, (uint64_t)a2, self, CFSTR("CKDMMCSItemReaderWriter.m"), 135, CFSTR("Expected a valid file handle for %@"), self);

  }
  objc_msgSend_setIsReaderReadFrom_(v16, v22, 1);
  v27 = objc_msgSend_fileDescriptor(v24, v25, v26);
  v28 = pread(v27, a4, a5, a3);
  v29 = v28;
  if (v28 < 0)
  {
    v30 = __error();
    v31 = *v30;
    v32 = (void *)MEMORY[0x1E0C94FF8];
    v33 = *MEMORY[0x1E0C94B20];
    v34 = strerror(*v30);
    objc_msgSend_errorWithDomain_code_format_(v32, v35, v33, 1000, CFSTR("pread error: %d (%s)"), v31, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v37 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      loga = v37;
      v41 = objc_msgSend_itemID(v16, v39, v40);
      objc_msgSend_operationID(v21, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v52 = v41;
      v53 = 2048;
      v54 = v24;
      v55 = 2114;
      v56 = v44;
      v57 = 2048;
      v58 = a3;
      v59 = 2048;
      v60 = a5;
      v61 = 2112;
      v62 = v36;
      _os_log_error_impl(&dword_1BE990000, loga, OS_LOG_TYPE_ERROR, "Failed to pread for itemID:%llu, handle:%p, operationID:%{public}@, offset:0x%llx, length:%llu: %@", buf, 0x3Eu);

    }
    if (a7)
      *a7 = objc_retainAutorelease(v36);

  }
  else if (a6)
  {
    *a6 = v28;
  }

  return v29 >= 0;
}

- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7
{
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  ssize_t v27;
  ssize_t v28;
  int *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  const char *v34;
  void *v35;
  id *v36;
  void *v37;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  const char *v47;
  NSObject *log;
  id *v49;
  void *v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSRequest(self, a2, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSItem(self, v15, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, self, CFSTR("CKDMMCSItemReaderWriter.m"), 161, CFSTR("Expected non-nil MMCS item for %@"), self);

  }
  objc_msgSend_fileHandle(self, v17, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v47, (uint64_t)a2, self, CFSTR("CKDMMCSItemReaderWriter.m"), 163, CFSTR("Expected a valid file handle for %@"), self);

  }
  objc_msgSend_operation(v14, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_fileDescriptor(v22, v24, v25);
  v27 = pwrite(v26, a4, a5, a3);
  v28 = v27;
  if (v27 < 0)
  {
    v49 = a7;
    v29 = __error();
    v30 = *v29;
    v31 = (void *)MEMORY[0x1E0C94FF8];
    v32 = *MEMORY[0x1E0C94B20];
    v33 = strerror(*v29);
    objc_msgSend_errorWithDomain_code_format_(v31, v34, v32, 1000, CFSTR("pwrite error: %d (%s)"), v30, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v36 = v49;
    v37 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      log = v37;
      v41 = objc_msgSend_itemID(v19, v39, v40);
      objc_msgSend_operationID(v23, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v52 = v41;
      v53 = 2048;
      v54 = v22;
      v55 = 2114;
      v56 = v44;
      v57 = 2048;
      v58 = a3;
      v59 = 2048;
      v60 = a5;
      v61 = 2112;
      v62 = v35;
      _os_log_error_impl(&dword_1BE990000, log, OS_LOG_TYPE_ERROR, "Failed to pwrite for itemID:%llu, handle:%p, operationID:%{public}@, offset:0x%llx, length:%llu: %@", buf, 0x3Eu);

      v36 = v49;
      if (!v49)
        goto LABEL_13;
    }
    else if (!v49)
    {
LABEL_13:

      goto LABEL_14;
    }
    *v36 = objc_retainAutorelease(v35);
    goto LABEL_13;
  }
  if (a6)
    *a6 = v27;
LABEL_14:

  return v28 >= 0;
}

- (C3DownloadChunkContext)downloadChunkContext
{
  return self->_downloadChunkContext;
}

- (void)setDownloadChunkContext:(id)a3
{
  objc_storeStrong((id *)&self->_downloadChunkContext, a3);
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

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_MMCSItem, 0);
  objc_storeStrong((id *)&self->_MMCSRequest, 0);
  objc_storeStrong((id *)&self->_downloadChunkContext, 0);
}

@end
