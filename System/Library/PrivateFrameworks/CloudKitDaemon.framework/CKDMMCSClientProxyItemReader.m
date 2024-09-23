@implementation CKDMMCSClientProxyItemReader

- (CKDMMCSClientProxyItemReader)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CKDMMCSClientProxyItemReader *v13;
  CKDMMCSClientProxyItemReader *v14;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v12 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, CFSTR("CKDMMCSClientProxyItemReader.m"), 28, CFSTR("Expected non-nil MMCS item"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("CKDMMCSClientProxyItemReader.m"), 29, CFSTR("Expected non-nil MMCS request for %@"), v8);

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)CKDMMCSClientProxyItemReader;
  v13 = -[CKDMMCSClientProxyItemReader init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_MMCSItem, a3);
    objc_storeStrong((id *)&v14->_MMCSRequest, a4);
  }

  return v14;
}

- (BOOL)openWithError:(id *)a3
{
  return 1;
}

- (BOOL)closeWithError:(id *)a3
{
  return 1;
}

- (id)getFileMetadataWithError:(id *)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v21;
  const char *v22;

  objc_msgSend_MMCSItem(self, a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKDMMCSClientProxyItemReader.m"), 47, CFSTR("Expected non-nil MMCS item for %@"), self);

  }
  v8 = objc_alloc(MEMORY[0x1E0C94E90]);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_asset(v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_size(v12, v13, v14);
  objc_msgSend_numberWithUnsignedLongLong_(v9, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithFileSize_(v8, v18, (uint64_t)v17);

  return v19;
}

- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  void *v14;
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
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  const char *v32;
  unint64_t v33;
  void *v34;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCSRequest(self, a2, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operation(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSItem(self, v18, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v43, (uint64_t)a2, self, CFSTR("CKDMMCSClientProxyItemReader.m"), 58, CFSTR("Expected non-nil MMCS item for %@"), self);

  }
  objc_msgSend_setIsReaderReadFrom_(v22, v20, 1);
  objc_msgSend_container(v17, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend_readBytesOfInMemoryAssetContentWithContainer_offset_length_error_(v22, v26, (uint64_t)v25, a3, a5, &v45);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v45;

  if (!v27)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v34 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v36 = v34;
      v39 = objc_msgSend_itemID(v22, v37, v38);
      objc_msgSend_operationID(v17, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v47 = v39;
      v48 = 2114;
      v49 = v42;
      v50 = 2112;
      v51 = v28;
      _os_log_error_impl(&dword_1BE990000, v36, OS_LOG_TYPE_ERROR, "Failed to read bytes itemID:%llu, operationID:%{public}@: %@", buf, 0x20u);

      if (!a7)
        goto LABEL_14;
    }
    else if (!a7)
    {
      goto LABEL_14;
    }
    *a7 = objc_retainAutorelease(v28);
    goto LABEL_14;
  }
  v31 = objc_msgSend_length(v27, v29, v30);
  if (v31 >= a5)
  {
    v33 = a5;
    objc_msgSend_getBytes_length_(v27, v32, (uint64_t)a4, a5);
  }
  else
  {
    v33 = v31;
    objc_msgSend_getBytes_length_(v27, v32, (uint64_t)a4, v31);
  }
  if (a6)
    *a6 = v33;
LABEL_14:

  return v27 != 0;
}

- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7
{
  void *v10;
  const char *v11;
  const char *v12;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("CKDMMCSClientProxyItemReader.m"), 80, CFSTR("Writing not supported"));

  if (a7)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v12, *MEMORY[0x1E0C94B20], 3001, CFSTR("Writing not supported"));
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSItem, 0);
  objc_storeStrong((id *)&self->_MMCSRequest, 0);
}

@end
