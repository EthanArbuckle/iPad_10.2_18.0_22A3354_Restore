@implementation KVStreamDatasetReader

- (KVStreamDatasetReader)initWithData:(id)a3 error:(id *)a4
{
  id v7;
  KVStreamDatasetReader *v8;
  KVStreamDatasetReader *v9;
  KVDatasetInfo *v10;
  const char *v11;
  uint64_t v12;
  KVDatasetInfo *datasetInfo;
  KVStreamDatasetReader *v14;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)KVStreamDatasetReader;
  v8 = -[KVStreamDatasetReader init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    v10 = [KVDatasetInfo alloc];
    v12 = objc_msgSend_initWithSizePrefixedBuffer_error_(v10, v11, (uint64_t)v7, (uint64_t)a4);
    datasetInfo = v9->_datasetInfo;
    v9->_datasetInfo = (KVDatasetInfo *)v12;

    if (!v9->_datasetInfo)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v9->_offset = 0;
  }
  v14 = v9;
LABEL_6:

  return v14;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  uint64_t offset;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  KVItem *v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  void *v49;
  uint64_t (**v52)(id, void *);
  uint64_t v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v52 = (uint64_t (**)(id, void *))a4;
  objc_msgSend_buffer(self->_datasetInfo, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_offset = objc_msgSend_length(v8, v9, v10, v11) + 4;

  v15 = objc_msgSend_itemCount(self->_datasetInfo, v12, v13, v14);
  v19 = objc_msgSend_bytes(self->_data, v16, v17, v18);
  v23 = objc_msgSend_length(self->_data, v20, v21, v22);
  if (!v15)
  {
    v28 = 1;
    goto LABEL_21;
  }
  v26 = v23;
  v27 = 0;
  v28 = 0;
  while (1)
  {
    offset = self->_offset;
    v30 = *(unsigned int *)(v19 + offset);
    if (v26 - offset < v30)
    {
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v24, (uint64_t)CFSTR("Size prefix indicates item length %u exceeding remaining profile buffer length %llu."), v25, v30, v26);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v37;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v38, (uint64_t)v56, (uint64_t)&v55, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v36, v40, (uint64_t)CFSTR("com.apple.koa.profile"), 10, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (a3 && v41)
        *a3 = objc_retainAutorelease(v41);

      goto LABEL_18;
    }
    if (v30 >= 0xC801)
    {
      v43 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v24, (uint64_t)CFSTR("Size prefix indicates item length %u exceeding max item length %u."), v25, v30, 51200);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v44;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v45, (uint64_t)&v54, (uint64_t)&v53, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v43, v47, (uint64_t)CFSTR("com.apple.koa.profile"), 7, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if (a3 && v48)
        *a3 = objc_retainAutorelease(v48);

LABEL_18:
      self->_offset = 0;
      goto LABEL_21;
    }
    v31 = (offset + 4);
    self->_offset = v31;
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v24, v19 + v31, v30, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    self->_offset += v30;
    v33 = [KVItem alloc];
    v35 = (void *)objc_msgSend_initWithBuffer_verify_copy_error_(v33, v34, (uint64_t)v32, 1, 1, a3);
    if (!v35)
      goto LABEL_20;
    if ((v52[2](v52, v35) & 1) == 0)
      break;

    v28 = ++v27 >= v15;
    if (v15 == v27)
      goto LABEL_21;
  }
  self->_offset = 0;
LABEL_20:

LABEL_21:
  return v28;
}

- (id)datasetInfo
{
  return self->_datasetInfo;
}

- (NSString)description
{
  uint64_t v2;
  void *v3;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("dataset format: %@ info: %@"), v2, CFSTR("Binary Stream"), self->_datasetInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
