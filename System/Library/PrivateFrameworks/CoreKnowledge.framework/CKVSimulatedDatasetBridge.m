@implementation CKVSimulatedDatasetBridge

- (CKVSimulatedDatasetBridge)initWithDataset:(id)a3
{
  id v4;
  CKVSimulatedDatasetBridge *v5;
  uint64_t v6;
  KVDatasetInfo *datasetInfo;
  CKVSimulatedDatasetBridge *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKVSimulatedDatasetBridge;
  v5 = -[CKVSimulatedDatasetBridge init](&v10, sel_init);
  if (v5
    && (objc_msgSend(v4, "datasetInfo"),
        v6 = objc_claimAutoreleasedReturnValue(),
        datasetInfo = v5->_datasetInfo,
        v5->_datasetInfo = (KVDatasetInfo *)v6,
        datasetInfo,
        !-[CKVSimulatedDatasetBridge _processDataset:](v5, "_processDataset:", v4)))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (CKVSimulatedDatasetBridge)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-init not available"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_processDataset:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  NSArray **p_items;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  KVDatasetInfo *datasetInfo;
  KVDatasetInfo *v20;
  NSArray *v21;
  NSObject *v22;
  KVDatasetInfo *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  KVDatasetInfo *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCapacity:", -[KVDatasetInfo itemCount](self->_datasetInfo, "itemCount"));
  v27 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __45__CKVSimulatedDatasetBridge__processDataset___block_invoke;
  v25[3] = &unk_1E4D28D00;
  v7 = v6;
  v26 = v7;
  objc_msgSend(v5, "enumerateItemsWithError:usingBlock:", &v27, v25);

  v8 = v27;
  if (v8)
  {
    v9 = v8;
    v10 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      datasetInfo = self->_datasetInfo;
      *(_DWORD *)buf = 136315650;
      v29 = "-[CKVSimulatedDatasetBridge _processDataset:]";
      v30 = 2112;
      v31 = datasetInfo;
      v32 = 2112;
      v33 = v9;
      _os_log_error_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to enumerate dataset: %@ error: %@", buf, 0x20u);
    }
LABEL_4:
    v11 = 0;
    goto LABEL_14;
  }
  p_items = &self->_items;
  objc_storeStrong((id *)&self->_items, v6);
  if (!-[NSArray count](self->_items, "count"))
  {
    v16 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_datasetInfo;
      *(_DWORD *)buf = 136315394;
      v29 = "-[CKVSimulatedDatasetBridge _processDataset:]";
      v30 = 2112;
      v31 = v20;
      _os_log_error_impl(&dword_1A48B3000, v16, OS_LOG_TYPE_ERROR, "%s Unable to resolve Cascade item for empty dataset: %@", buf, 0x16u);
    }
    v9 = 0;
    goto LABEL_4;
  }
  -[NSArray firstObject](*p_items, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v13, "toCascadeItem:", &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;

  v11 = v14 != 0;
  if (v14)
  {
    objc_msgSend(v14, "content");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cascadeItemType = objc_msgSend((id)objc_opt_class(), "itemType");

  }
  else
  {
    v17 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v21 = *p_items;
      v22 = v17;
      -[NSArray firstObject](v21, "firstObject");
      v23 = (KVDatasetInfo *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v29 = "-[CKVSimulatedDatasetBridge _processDataset:]";
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v9;
      _os_log_error_impl(&dword_1A48B3000, v22, OS_LOG_TYPE_ERROR, "%s Failed to convert first item: %@ error: %@", buf, 0x20u);

    }
  }

LABEL_14:
  return v11;
}

- (unsigned)cascadeItemType
{
  return self->_cascadeItemType;
}

- (id)originAppId
{
  return (id)-[KVDatasetInfo originAppId](self->_datasetInfo, "originAppId");
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v5;
  NSArray *items;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  items = self->_items;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__CKVSimulatedDatasetBridge_enumerateItemsWithError_usingBlock___block_invoke;
  v9[3] = &unk_1E4D28D28;
  v7 = v5;
  v10 = v7;
  v11 = &v12;
  -[NSArray enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v9);
  LOBYTE(items) = *((_BYTE *)v13 + 24) == 0;

  _Block_object_dispose(&v12, 8);
  return (char)items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_datasetInfo, 0);
}

uint64_t __64__CKVSimulatedDatasetBridge_enumerateItemsWithError_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __45__CKVSimulatedDatasetBridge__processDataset___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

@end
