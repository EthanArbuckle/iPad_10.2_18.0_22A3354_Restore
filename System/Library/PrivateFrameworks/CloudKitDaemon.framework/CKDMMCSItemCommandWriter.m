@implementation CKDMMCSItemCommandWriter

- (CKDMMCSItemCommandWriter)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CKDMMCSItemCommandWriter *v13;
  CKDMMCSItemCommandWriter *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableIndexSet *byteRanges;
  NSObject *v19;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  objc_super v25;
  uint8_t buf[4];
  CKDMMCSItemCommandWriter *v27;
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
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKDMMCSItemCommandWriter.m"), 27, CFSTR("Expected non-nil MMCS item"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, CFSTR("CKDMMCSItemCommandWriter.m"), 28, CFSTR("Expected non-nil MMCS request for %@"), v8);

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)CKDMMCSItemCommandWriter;
  v13 = -[CKDMMCSItemCommandWriter init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_MMCSItem, a3);
    objc_storeStrong((id *)&v14->_MMCSRequest, a4);
    objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    byteRanges = v14->_byteRanges;
    v14->_byteRanges = (NSMutableIndexSet *)v17;

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v14;
      _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, "init, reader:%p", buf, 0xCu);
    }
  }

  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  CKDMMCSItemCommandWriter *v6;
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
  v4.super_class = (Class)CKDMMCSItemCommandWriter;
  -[CKDMMCSItemCommandWriter dealloc](&v4, sel_dealloc);
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
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], a2, *MEMORY[0x1E0C94B20], 1, CFSTR("getFileMetadataWithError not implemented"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  if (a7)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], a2, *MEMORY[0x1E0C94B20], 1, CFSTR("readBytesAtOffset not implemented"), a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)isContiguous
{
  BOOL v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  CKNSIndexSet_enumerateInverseRangesInRange_options_usingBlock();
  v2 = *((_BYTE *)v5 + 24) == 0;
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7
{
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  NSObject *v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;
  NSRange v36;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_containsIndexesInRange_(self->_byteRanges, a2, a3, a5))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v29 = v14;
      v36.location = a3;
      v36.length = a5;
      NSStringFromRange(v36);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v30;
      _os_log_error_impl(&dword_1BE990000, v29, OS_LOG_TYPE_ERROR, "range %{public}@ overlaps with previous range", buf, 0xCu);

    }
  }
  objc_msgSend_addIndexesInRange_(self->_byteRanges, v13, a3, a5);
  if (self->_maximumLength < a5 + a3)
    self->_maximumLength = a5 + a3;
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v15, (uint64_t)a4, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v17, a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = CFSTR("Data");
  v31[1] = CFSTR("Offset");
  v32[0] = v16;
  v32[1] = v18;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v32, v31, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSRequest(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSItem(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleCommand_forItem_(v23, v27, (uint64_t)v20, v26);

  if (a6)
    *a6 = a5;
  if (a7)
    *a7 = 0;

  return 1;
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

- (NSMutableIndexSet)byteRanges
{
  return self->_byteRanges;
}

- (void)setByteRanges:(id)a3
{
  objc_storeStrong((id *)&self->_byteRanges, a3);
}

- (unint64_t)maximumLength
{
  return self->_maximumLength;
}

- (void)setMaximumLength:(unint64_t)a3
{
  self->_maximumLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byteRanges, 0);
  objc_storeStrong((id *)&self->_MMCSItem, 0);
  objc_storeStrong((id *)&self->_MMCSRequest, 0);
}

@end
