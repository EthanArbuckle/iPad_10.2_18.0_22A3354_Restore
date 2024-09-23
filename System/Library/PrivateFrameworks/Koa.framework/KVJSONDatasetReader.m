@implementation KVJSONDatasetReader

- (KVJSONDatasetReader)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  KVJSONDatasetReader *v9;
  void *v10;
  KVDatasetInfo *v11;
  const char *v12;
  uint64_t v13;
  KVDatasetInfo *datasetInfo;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *items;
  KVJSONDatasetReader *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  id v30;
  void *v32;
  void *v33;
  objc_class *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  objc_super v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)KVJSONDatasetReader;
  v9 = -[KVJSONDatasetReader init](&v39, sel_init);
  if (!v9)
    goto LABEL_7;
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("datasetInfo"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v21, v24, (uint64_t)CFSTR("Unexpected DatasetInfo dictionary class: %@"), v25, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v26;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)v43, (uint64_t)&v42, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v20, v29, (uint64_t)CFSTR("com.apple.koa.profile"), 10, v28);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v11 = [KVDatasetInfo alloc];
  v13 = objc_msgSend_initFromDictionary_error_(v11, v12, (uint64_t)v10, (uint64_t)a4);
  datasetInfo = v9->_datasetInfo;
  v9->_datasetInfo = (KVDatasetInfo *)v13;

  if (!v9->_datasetInfo)
  {
LABEL_13:

    v19 = 0;
    goto LABEL_14;
  }
  objc_msgSend_objectForKey_(v6, v15, (uint64_t)CFSTR("items"), v16);
  v17 = objc_claimAutoreleasedReturnValue();
  items = v9->_items;
  v9->_items = (NSArray *)v17;

  if (v9->_items)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D50];
      v33 = (void *)MEMORY[0x1E0CB3940];
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v33, v35, (uint64_t)CFSTR("Unexpected items array class: %@"), v36, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)&v41, (uint64_t)&v40, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v32, v38, (uint64_t)CFSTR("com.apple.koa.profile"), 10, v28);
      v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      if (a4 && v30)
      {
        v30 = objc_retainAutorelease(v30);
        *a4 = v30;
      }

      goto LABEL_13;
    }
  }

LABEL_7:
  v19 = v9;
LABEL_14:

  return v19;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v6)(id, void *);
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  KVItem *v17;
  const char *v18;
  void *v19;
  const char *v20;
  BOOL v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  id v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  NSArray *obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *))a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_items;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v34, (uint64_t)v42, 16);
  if (!v8)
  {
    v21 = 1;
    goto LABEL_23;
  }
  v9 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v35 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v40 = *MEMORY[0x1E0CB2D50];
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("Unexpected item outer dictionary: %@"), v13, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v14;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)&v41, (uint64_t)&v40, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v22, v24, (uint64_t)CFSTR("com.apple.koa.profile"), 10, v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (a3 && v25)
        {
          v26 = objc_retainAutorelease(v25);
          *a3 = v26;
        }
        goto LABEL_21;
      }
      objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("item"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v38 = *MEMORY[0x1E0CB2D50];
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("Unexpected item inner dictionary: %@"), v16, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v19;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v28, (uint64_t)&v39, (uint64_t)&v38, 1);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v27, v29, (uint64_t)CFSTR("com.apple.koa.profile"), 10, v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (a3 && v30)
          *a3 = objc_retainAutorelease(v30);

LABEL_21:
LABEL_22:

        v21 = 0;
        goto LABEL_23;
      }
      v17 = [KVItem alloc];
      v19 = (void *)objc_msgSend_initFromDictionary_error_(v17, v18, (uint64_t)v14, (uint64_t)a3);
      if (!v19 || (v6[2](v6, v19) & 1) == 0)
        goto LABEL_22;

    }
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v34, (uint64_t)v42, 16);
    v21 = 1;
    if (v8)
      continue;
    break;
  }
LABEL_23:

  return v21;
}

- (id)datasetInfo
{
  return self->_datasetInfo;
}

- (NSString)description
{
  uint64_t v2;
  void *v3;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("dataset format: %@ info: %@"), v2, CFSTR("JSON"), self->_datasetInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_datasetInfo, 0);
}

@end
