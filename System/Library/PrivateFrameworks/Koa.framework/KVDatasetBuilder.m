@implementation KVDatasetBuilder

- (KVDatasetBuilder)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KVDatasetBuilder)initWithDatasetInfo:(id)a3 writer:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  KVDatasetBuilder *v11;
  KVDatasetBuilder *v12;
  KVDatasetBuilder *v13;
  KVDatasetInfo **p_datasetInfo;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char isKindOfClass;
  KVDatasetInfo *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  id *p_writer;
  const char *v26;
  KVDatasetBuilder *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  objc_super v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)KVDatasetBuilder;
  v11 = -[KVDatasetBuilder init](&v36, sel_init);
  v12 = v11;
  v13 = v11;
  if (!v11)
    goto LABEL_7;
  p_datasetInfo = &v11->_datasetInfo;
  objc_storeStrong((id *)&v11->_datasetInfo, a3);
  if (!*p_datasetInfo)
  {
    v19 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v19 = *p_datasetInfo;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_10;
  objc_msgSend_buffer(v19, v15, v17, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_length(v20, v21, v22, v23) == 0;

  if (v24)
  {
    v19 = *p_datasetInfo;
LABEL_10:
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("Invalid DatasetInfo: %@"), v16, v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v29;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)v38, (uint64_t)&v37, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v32, (uint64_t)CFSTR("com.apple.koa.profile"), 6, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (a5 && v33)
      *a5 = objc_retainAutorelease(v33);

    goto LABEL_14;
  }
  p_writer = (id *)&v12->_writer;
  objc_storeStrong(p_writer, a4);
  if (!objc_msgSend_startDataset_error_(*p_writer, v26, (uint64_t)v9, (uint64_t)a5))
  {
LABEL_14:
    v27 = 0;
    goto LABEL_15;
  }
  v13->_itemCount = 0;
LABEL_7:
  v27 = v13;
LABEL_15:

  return v27;
}

- (id)addItem:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  KVDatasetBuilder *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  unsigned __int16 v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int16 v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB2D50];
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v19, v22, (uint64_t)CFSTR("Invalid item: %@ expected %@"), v23, v6, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v24;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v55, (uint64_t)&v54, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v18, v27, (uint64_t)CFSTR("com.apple.koa.profile"), 7, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a4 && v28)
      *a4 = objc_retainAutorelease(v28);

    goto LABEL_10;
  }
  v10 = objc_msgSend_itemType(v6, v7, v8, v9);
  if (v10 != objc_msgSend_itemType(self->_datasetInfo, v11, v12, v13))
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v52 = *MEMORY[0x1E0CB2D50];
    v32 = (void *)MEMORY[0x1E0CB3940];
    v33 = objc_msgSend_itemType(v6, v14, v15, v16);
    if (v33 - 1 >= 0x19)
      v35 = 0;
    else
      v35 = v33;
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v34, (uint64_t)off_1E6B7ADF0[v35], 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_itemType(self->_datasetInfo, v37, v38, v39);
    if (v40 - 1 >= 0x19)
      v42 = 0;
    else
      v42 = v40;
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v41, (uint64_t)off_1E6B7ADF0[v42], 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v32, v44, (uint64_t)CFSTR("Item has type %@ inconsistent with dataset itemType %@"), v45, v36, v43);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v46;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v47, (uint64_t)&v53, (uint64_t)&v52, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v31, v49, (uint64_t)CFSTR("com.apple.koa.profile"), 7, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (a4 && v50)
      *a4 = objc_retainAutorelease(v50);

    goto LABEL_10;
  }
  if (!objc_msgSend_addItem_error_(self->_writer, v14, (uint64_t)v6, (uint64_t)a4))
  {
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  ++self->_itemCount;
  v17 = self;
LABEL_11:

  return v17;
}

- (BOOL)_finishWithError:(id *)a3
{
  uint64_t v3;
  unsigned int itemCount;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  KVProfileWriter *writer;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  itemCount = self->_itemCount;
  if (itemCount == objc_msgSend_itemCount(self->_datasetInfo, a2, (uint64_t)a3, v3))
  {
    v10 = objc_msgSend_finishDataset_(self->_writer, v7, (uint64_t)a3, v9);
    writer = self->_writer;
    self->_writer = 0;

    return v10;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = objc_msgSend_itemCount(self->_datasetInfo, v7, v8, v9);
    objc_msgSend_stringWithFormat_(v14, v16, (uint64_t)CFSTR("Expected %u dataset items but %u were added."), v17, v15, self->_itemCount);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v25, (uint64_t)&v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v21, (uint64_t)CFSTR("com.apple.koa.profile"), 8, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a3)
    {
      if (v22)
        *a3 = objc_retainAutorelease(v22);
    }

    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_datasetInfo, 0);
}

@end
