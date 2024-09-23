@implementation KVEmbeddedDatasetReader

- (KVEmbeddedDatasetReader)initWithData:(id)a3 dataset:(const Dataset *)a4 error:(id *)a5
{
  id v9;
  KVEmbeddedDatasetReader *v10;
  KVEmbeddedDatasetReader *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const Dataset *v16;
  void *v17;
  KVDatasetInfo *v18;
  const char *v19;
  uint64_t v20;
  KVDatasetInfo *datasetInfo;
  KVEmbeddedDatasetReader *v22;
  objc_super v24;

  v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)KVEmbeddedDatasetReader;
  v10 = -[KVEmbeddedDatasetReader init](&v24, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_6;
  objc_storeStrong((id *)&v10->_data, a3);
  v11->_dataset = a4;
  v13 = *(int *)a4->var0;
  v14 = *(unsigned __int16 *)a4[-v13 + 4].var0;
  if (*(_WORD *)a4[-v13 + 4].var0)
  {
    v15 = *(unsigned int *)a4[v14].var0;
    v16 = &a4[v14 + v15];
  }
  else
  {
    v14 = 0;
    v16 = 0;
    v15 = *(unsigned int *)a4->var0;
  }
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v12, (uint64_t)&v16[4], *(unsigned int *)a4[v14 + v15].var0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [KVDatasetInfo alloc];
  v20 = objc_msgSend_initWithBuffer_error_(v18, v19, (uint64_t)v17, (uint64_t)a5);
  datasetInfo = v11->_datasetInfo;
  v11->_datasetInfo = (KVDatasetInfo *)v20;

  v22 = (KVEmbeddedDatasetReader *)v11->_datasetInfo;
  if (v22)
LABEL_6:
    v22 = v11;

  return v22;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  const char *v6;
  uint64_t (**v7)(id, void *);
  const Dataset *dataset;
  const Dataset *v9;
  uint64_t v10;
  uint64_t v11;
  const Dataset *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const Dataset *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  KVItem *v23;
  const char *v24;
  void *v25;
  BOOL v26;

  v7 = (uint64_t (**)(id, void *))a4;
  dataset = self->_dataset;
  v9 = &dataset[-*(int *)dataset->var0];
  if (*(unsigned __int16 *)v9->var0 >= 7u
    && (v10 = *(unsigned __int16 *)v9[6].var0) != 0
    && (v11 = *(unsigned int *)dataset[v10].var0,
        v12 = &dataset[v10 + v11],
        v13 = *(unsigned int *)v12->var0,
        (_DWORD)v13))
  {
    v14 = 0;
    v15 = 4 * v13;
    v16 = &dataset[v10 + v11];
    while (1)
    {
      v17 = *(unsigned int *)v12[v14 + 4].var0;
      v18 = *(int *)v12[v14 + 4 + v17].var0;
      v19 = *(unsigned __int16 *)v16[v14 + 8 + v17 - v18].var0;
      if (*(_WORD *)v16[v14 + 8 + v17 - v18].var0)
      {
        v20 = *(unsigned int *)v16[v14 + 4 + v17 + v19].var0;
        v21 = (uint64_t)&v16[v14 + 4 + v17 + v19 + v20];
      }
      else
      {
        v19 = 0;
        v21 = 0;
        v20 = *(unsigned int *)v12[v14 + 4 + v17].var0;
      }
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v6, v21 + 4, *(unsigned int *)v16[v17 + 4 + v19 + v20 + v14].var0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = [KVItem alloc];
      v25 = (void *)objc_msgSend_initWithBuffer_verify_copy_error_(v23, v24, (uint64_t)v22, 1, 0, a3);
      if (!v25 || (v7[2](v7, v25) & 1) == 0)
        break;

      v14 += 4;
      if (v15 == v14)
        goto LABEL_11;
    }

    v26 = 0;
  }
  else
  {
LABEL_11:
    v26 = 1;
  }

  return v26;
}

- (id)datasetInfo
{
  return self->_datasetInfo;
}

- (NSString)description
{
  uint64_t v2;
  void *v3;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("dataset format: %@ info: %@"), v2, CFSTR("Binary Embedded"), self->_datasetInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
