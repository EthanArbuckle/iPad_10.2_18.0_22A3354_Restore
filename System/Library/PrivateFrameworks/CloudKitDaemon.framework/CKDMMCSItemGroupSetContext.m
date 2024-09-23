@implementation CKDMMCSItemGroupSetContext

- (CKDMMCSItemGroupSetContext)initWithItemGroupSet:(id)a3 itemGroupSetCompletionBlock:(id)a4
{
  id v7;
  id v8;
  CKDMMCSItemGroupSetContext *v9;
  CKDMMCSItemGroupSetContext *v10;
  uint64_t v11;
  NSMutableArray *itemGroupContexts;
  void *v13;
  id itemGroupSetCompletionBlock;
  dispatch_group_t v15;
  OS_dispatch_group *itemGroupSetCompletionGroup;
  void *v17;
  id itemGroupCompletionBlock;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CKDMMCSItemGroupSetContext;
  v9 = -[CKDMMCSItemGroupSetContext init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemGroupSet, a3);
    v11 = objc_opt_new();
    itemGroupContexts = v10->_itemGroupContexts;
    v10->_itemGroupContexts = (NSMutableArray *)v11;

    v13 = _Block_copy(v8);
    itemGroupSetCompletionBlock = v10->_itemGroupSetCompletionBlock;
    v10->_itemGroupSetCompletionBlock = v13;

    v15 = dispatch_group_create();
    itemGroupSetCompletionGroup = v10->_itemGroupSetCompletionGroup;
    v10->_itemGroupSetCompletionGroup = (OS_dispatch_group *)v15;

    objc_initWeak(&location, v10);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1BEA0FCD4;
    v20[3] = &unk_1E782EA18;
    objc_copyWeak(&v21, &location);
    v17 = _Block_copy(v20);
    itemGroupCompletionBlock = v10->_itemGroupCompletionBlock;
    v10->_itemGroupCompletionBlock = v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)cancel
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend_itemGroupContexts(self, a2, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v11, v15, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v3);
        objc_msgSend_cancel(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v10++), v6, v7);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v11, v15, 16);
    }
    while (v8);
  }

}

- (void)addItemGroupContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v4 = a3;
  v7 = objc_msgSend_mmcsOperationType(self, v5, v6);
  objc_msgSend_setMmcsOperationType_(v4, v8, v7);
  objc_msgSend_itemGroupContexts(self, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v11, (uint64_t)v4);

}

- (void)start
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD block[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend_itemGroupContexts(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v21, v25, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        objc_msgSend_itemGroupSetCompletionGroup(self, v7, v8);
        v13 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v13);

        objc_msgSend_start(v12, v14, v15);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v21, v25, 16);
    }
    while (v9);
  }

  objc_msgSend_itemGroupSetCompletionGroup(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  CKGetGlobalQueue();
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA0FFDC;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_group_notify(v18, v19, block);

}

- (CKDMMCSItemGroupSet)itemGroupSet
{
  return self->_itemGroupSet;
}

- (void)setItemGroupSet:(id)a3
{
  objc_storeStrong((id *)&self->_itemGroupSet, a3);
}

- (CKDOperation)operation
{
  return (CKDOperation *)objc_loadWeakRetained((id *)&self->_operation);
}

- (void)setOperation:(id)a3
{
  objc_storeWeak((id *)&self->_operation, a3);
}

- (NSMutableArray)itemGroupContexts
{
  return self->_itemGroupContexts;
}

- (void)setItemGroupContexts:(id)a3
{
  objc_storeStrong((id *)&self->_itemGroupContexts, a3);
}

- (id)itemGroupCompletionBlock
{
  return self->_itemGroupCompletionBlock;
}

- (void)setItemGroupCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)itemGroupSetCompletionBlock
{
  return self->_itemGroupSetCompletionBlock;
}

- (void)setItemGroupSetCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_group)itemGroupSetCompletionGroup
{
  return self->_itemGroupSetCompletionGroup;
}

- (void)setItemGroupSetCompletionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_itemGroupSetCompletionGroup, a3);
}

- (int64_t)mmcsOperationType
{
  return self->_mmcsOperationType;
}

- (void)setMmcsOperationType:(int64_t)a3
{
  self->_mmcsOperationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemGroupSetCompletionGroup, 0);
  objc_storeStrong(&self->_itemGroupSetCompletionBlock, 0);
  objc_storeStrong(&self->_itemGroupCompletionBlock, 0);
  objc_storeStrong((id *)&self->_itemGroupContexts, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_itemGroupSet, 0);
}

@end
