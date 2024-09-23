@implementation CKDMMCSTestEncryptedItemReader

- (CKDMMCSTestEncryptedItemReader)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CKDMMCSTestEncryptedItemReader *v13;
  CKDMMCSTestEncryptedItemReader *v14;
  NSObject *v15;
  CKDMMCSItemReaderWriter *v16;
  const char *v17;
  uint64_t v18;
  CKDMMCSItemReaderWriterProtocol *underlyingItemReader;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  objc_super v25;
  uint8_t buf[4];
  CKDMMCSTestEncryptedItemReader *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
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
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKDMMCSTestEncryptedItemReader.m"), 25, CFSTR("Expected non-nil MMCS item"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, CFSTR("CKDMMCSTestEncryptedItemReader.m"), 26, CFSTR("Expected non-nil MMCS request for %@"), v8);

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)CKDMMCSTestEncryptedItemReader;
  v13 = -[CKDMMCSTestEncryptedItemReader init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_MMCSItem, a3);
    objc_storeStrong((id *)&v14->_MMCSRequest, a4);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v14;
      _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "init, reader:%p", buf, 0xCu);
    }
    v16 = [CKDMMCSItemReaderWriter alloc];
    v18 = objc_msgSend_initWithMMCSItem_MMCSRequest_downloadChunkContext_(v16, v17, (uint64_t)v8, v12, 0);
    underlyingItemReader = v14->_underlyingItemReader;
    v14->_underlyingItemReader = (CKDMMCSItemReaderWriterProtocol *)v18;

  }
  return v14;
}

- (BOOL)openWithError:(id *)a3
{
  return objc_msgSend_openWithError_(self->_underlyingItemReader, a2, (uint64_t)a3);
}

- (BOOL)closeWithError:(id *)a3
{
  return objc_msgSend_closeWithError_(self->_underlyingItemReader, a2, (uint64_t)a3);
}

- (id)getFileMetadataWithError:(id *)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  objc_msgSend_getFileMetadataWithError_(self->_underlyingItemReader, a2, (uint64_t)a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_alloc(MEMORY[0x1E0C94E90]);
    objc_msgSend_fileSize(v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend_initWithFileSize_(v5, v9, (uint64_t)v8);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  return objc_msgSend_readBytesAtOffset_bytes_length_bytesRead_error_(self->_underlyingItemReader, a2, a3, a4, a5, a6, a7);
}

- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7
{
  return objc_msgSend_writeBytesAtOffset_bytes_length_bytesWritten_error_(self->_underlyingItemReader, a2, a3, a4, a5, a6, a7);
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

- (CKDMMCSItemReaderWriterProtocol)underlyingItemReader
{
  return self->_underlyingItemReader;
}

- (void)setUnderlyingItemReader:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingItemReader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingItemReader, 0);
  objc_storeStrong((id *)&self->_MMCSItem, 0);
  objc_storeStrong((id *)&self->_MMCSRequest, 0);
}

@end
