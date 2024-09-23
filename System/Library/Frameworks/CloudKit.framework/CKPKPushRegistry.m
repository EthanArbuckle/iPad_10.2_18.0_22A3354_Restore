@implementation CKPKPushRegistry

- (id)initInternal
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CKPKPushRegistry *v5;
  uint64_t v6;
  NSHashTable *delegates;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  PKPushRegistry *pushRegistry;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKPKPushRegistry;
  v5 = -[CKPKPushRegistry init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    delegates = v5->_delegates;
    v5->_delegates = (NSHashTable *)v6;

    v8 = objc_alloc(MEMORY[0x1E0CD22F0]);
    CKGetGlobalQueue(-1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_initWithQueue_(v8, v10, (uint64_t)v9, v11);
    pushRegistry = v5->_pushRegistry;
    v5->_pushRegistry = (PKPushRegistry *)v12;

    objc_msgSend_setDelegate_(v5->_pushRegistry, v14, (uint64_t)v5, v15);
    objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], v16, *MEMORY[0x1E0CD2308], v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDesiredPushTypes_(v5->_pushRegistry, v19, (uint64_t)v18, v20);

  }
  return v5;
}

+ (id)sharedPushRegistry
{
  if (qword_1ECD96C40 != -1)
    dispatch_once(&qword_1ECD96C40, &unk_1E1F58618);
  return (id)qword_1ECD96C48;
}

- (void)addDelegate:(id)a3
{
  CKPKPushRegistry *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_delegates(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v9, (uint64_t)v11, v10);

  objc_sync_exit(v4);
}

- (void)removeDelegate:(id)a3
{
  CKPKPushRegistry *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_delegates(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v8, v9, (uint64_t)v11, v10);

  objc_sync_exit(v4);
}

- (void)pushRegistry:(id)a3 didReceiveIncomingPushWithPayload:(id)a4 forType:(id)a5 withCompletionHandler:(id)a6
{
  CKPKPushRegistry *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  void (**v36)(void);
  id v37;
  _QWORD block[4];
  void (**v39)(void);
  _QWORD v40[4];
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v37 = a4;
  v35 = a5;
  v36 = (void (**)(void))a6;
  v10 = self;
  objc_sync_enter(v10);
  objc_msgSend_delegates(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v10);
  if (objc_msgSend_count(v18, v19, v20, v21))
  {
    v22 = dispatch_group_create();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v33 = v18;
    v23 = v18;
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v42, (uint64_t)v46, 16);
    v26 = MEMORY[0x1E0C809B0];
    if (v25)
    {
      v27 = *(_QWORD *)v43;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v28);
          dispatch_group_enter(v22);
          v40[0] = v26;
          v40[1] = 3221225472;
          v40[2] = sub_18A745734;
          v40[3] = &unk_1E1F5FAA8;
          v41 = v22;
          objc_msgSend_didReceiveIncomingPushWithPayload_withCompletionHandler_(v29, v30, (uint64_t)v37, (uint64_t)v40);

          ++v28;
        }
        while (v25 != v28);
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v31, (uint64_t)&v42, (uint64_t)v46, 16);
      }
      while (v25);
    }

    CKGetGlobalQueue(-1);
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = v26;
    block[1] = 3221225472;
    block[2] = sub_18A74573C;
    block[3] = &unk_1E1F61CC8;
    v39 = v36;
    dispatch_group_notify(v22, v32, block);

    v18 = v33;
  }
  else if (v36)
  {
    v36[2]();
  }

}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (PKPushRegistry)pushRegistry
{
  return self->_pushRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushRegistry, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end
