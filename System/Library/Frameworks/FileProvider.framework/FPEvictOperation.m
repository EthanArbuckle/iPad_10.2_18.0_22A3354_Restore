@implementation FPEvictOperation

- (FPEvictOperation)initWithItems:(id)a3
{
  id v5;
  FPEvictOperation *v6;
  FPEvictOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPEvictOperation;
  v6 = -[FPActionOperation initWithProvider:action:](&v9, sel_initWithProvider_action_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_items, a3);
    -[FPActionOperation setSourceItemsToPreflight:](v7, "setSourceItemsToPreflight:", v5);
  }

  return v7;
}

- (void)actionMain
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSArray *obj;
  _QWORD block[6];
  _QWORD v13[4];
  NSObject *v14;
  _QWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_group_create();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__26;
  v20[4] = __Block_byref_object_dispose__26;
  v21 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_items;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        dispatch_group_enter(v3);
        +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "itemID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __30__FPEvictOperation_actionMain__block_invoke;
        v13[3] = &unk_1E444D698;
        v15 = v20;
        v14 = v3;
        objc_msgSend(v8, "evictItemWithID:evictionReason:completionHandler:", v9, 2, v13);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v4);
  }

  -[FPOperation callbackQueue](self, "callbackQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__FPEvictOperation_actionMain__block_invoke_2;
  block[3] = &unk_1E444B900;
  block[4] = self;
  block[5] = v20;
  dispatch_group_notify(v3, v10, block);

  _Block_object_dispose(v20, 8);
}

void __30__FPEvictOperation_actionMain__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __30__FPEvictOperation_actionMain__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
