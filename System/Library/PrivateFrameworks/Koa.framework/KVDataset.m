@implementation KVDataset

- (BOOL)enumerateCascadeItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v6)(id, uint64_t, void *);
  id v7;
  id v8;
  const char *v9;
  char v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  BOOL v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, uint64_t, void *))a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_1B70F0D30;
  v45 = sub_1B70F0D40;
  v46 = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39 = &v41;
  v40 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1B70F16C8;
  v37[3] = &unk_1E6B7AD20;
  v8 = v7;
  v38 = v8;
  v10 = objc_msgSend_enumerateItemsWithError_usingBlock_(self, v9, (uint64_t)&v40, (uint64_t)v37);
  v11 = v40;
  v32 = v11;
  if ((v10 & 1) != 0)
  {

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend_allKeys(v8, v12, v13, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v33, (uint64_t)v47, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x1BCCA2B38]();
          v25 = objc_msgSend_unsignedShortValue(v20, v22, v23, v24);
          objc_msgSend_objectForKey_(v8, v26, (uint64_t)v20, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v20) = v6[2](v6, v25, v28);

          objc_autoreleasePoolPop(v21);
          if (!(_DWORD)v20)
          {
            v30 = 0;
            goto LABEL_19;
          }
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v29, (uint64_t)&v33, (uint64_t)v47, 16);
        v30 = 1;
        if (v17)
          continue;
        break;
      }
    }
    else
    {
      v30 = 1;
    }
  }
  else
  {
    if (v42[5])
      v11 = (id)v42[5];
    if (a3 && v11)
      *a3 = objc_retainAutorelease(v11);
    v30 = 0;
    v15 = v38;
  }
LABEL_19:

  _Block_object_dispose(&v41, 8);
  return v30;
}

- (KVDataset)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KVDataset)initWithReader:(id)a3
{
  id v5;
  KVDataset *v6;
  KVDataset *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVDataset;
  v6 = -[KVDataset init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_datasetReader, a3);

  return v7;
}

- (id)datasetInfo
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_datasetInfo(self->_datasetReader, a2, v2, v3);
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateItemsWithError_usingBlock_(self->_datasetReader, a2, (uint64_t)a3, (uint64_t)a4);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_description(self->_datasetReader, a2, v2, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetReader, 0);
}

@end
