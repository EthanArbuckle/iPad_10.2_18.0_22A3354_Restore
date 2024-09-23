@implementation CKDCancelTokenGroup

- (CKDCancelTokenGroup)init
{
  CKDCancelTokenGroup *v2;
  NSMutableArray *v3;
  NSMutableArray *cancelTokens;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDCancelTokenGroup;
  v2 = -[CKDCancelTokenGroup init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    cancelTokens = v2->_cancelTokens;
    v2->_cancelTokens = v3;

  }
  return v2;
}

- (void)addCancelToken:(id)a3 withOperation:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v8 = a4;
  if (v18)
  {
    if ((objc_msgSend_isCancelled(v8, v6, v7) & 1) != 0)
      goto LABEL_4;
    objc_msgSend_cancelTokens(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v11);
    objc_msgSend_cancelTokens(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v14, v15, (uint64_t)v18);

    objc_sync_exit(v11);
    if ((objc_msgSend_isCancelled(v8, v16, v17) & 1) != 0)
LABEL_4:
      objc_msgSend_cancel(v18, v9, v10);
  }

}

- (void)removeCancelToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    objc_msgSend_cancelTokens(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    objc_msgSend_cancelTokens(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v10, v11, (uint64_t)v12);

    objc_sync_exit(v7);
    v4 = v12;
  }

}

- (void)removeAllCancelTokens
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id obj;

  objc_msgSend_cancelTokens(self, a2, v2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend_cancelTokens(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v6, v7, v8);

  objc_sync_exit(obj);
}

- (void)cancel
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend_cancelTokens(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_cancelTokens(self, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend_cancel(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v13++), v9, v10);
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, v23, 16);
    }
    while (v11);
  }

  objc_msgSend_cancelTokens(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v16, v17, v18);

  objc_sync_exit(v4);
}

- (NSMutableArray)cancelTokens
{
  return self->_cancelTokens;
}

- (void)setCancelTokens:(id)a3
{
  objc_storeStrong((id *)&self->_cancelTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTokens, 0);
}

@end
