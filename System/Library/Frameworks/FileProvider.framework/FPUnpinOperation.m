@implementation FPUnpinOperation

- (FPUnpinOperation)initWithItems:(id)a3
{
  id v5;
  FPUnpinOperation *v6;
  FPUnpinOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUnpinOperation;
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
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  FPUnpinOperation *v15;
  NSArray *obj;
  _QWORD block[5];
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  _QWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__26;
  v28[4] = __Block_byref_object_dispose__26;
  v29 = 0;
  v4 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = self;
  obj = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "downloadingProgress", v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "downloadingProgress");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "cancel");

        }
        dispatch_group_enter(v3);
        +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "itemID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __30__FPUnpinOperation_actionMain__block_invoke;
        v20[3] = &unk_1E444EE68;
        v23 = v28;
        v21 = v4;
        v22 = v3;
        objc_msgSend(v11, "unpinItemWithID:completionHandler:", v12, v20);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v5);
  }

  -[FPOperation callbackQueue](v15, "callbackQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__FPUnpinOperation_actionMain__block_invoke_2;
  block[3] = &unk_1E444EEB8;
  block[4] = v15;
  v18 = v4;
  v19 = v28;
  v14 = v4;
  dispatch_group_notify(v3, v13, block);

  _Block_object_dispose(v28, 8);
}

void __30__FPUnpinOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
      objc_storeStrong(v7, a3);
  }
  if (v10)
  {
    v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
    objc_sync_exit(v9);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __30__FPUnpinOperation_actionMain__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (void)presendNotifications
{
  void *v3;
  void *v4;
  id v5;

  -[FPActionOperation stitcher](self, "stitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[FPActionOperation stitcher](self, "stitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transformItems:handler:", self->_items, &__block_literal_global_302);

  -[FPActionOperation stitcher](self, "stitcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flush");

}

void __40__FPUnpinOperation_presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPinned:", 0);
  objc_msgSend(v2, "setInPinnedFolder:", 0);
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v2, "capabilities") & 0xFFFFFFFFF7FFFFFFLL);
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v2, "capabilities") | 0x10000000);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[FPActionOperation stitcher](self, "stitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithItems:error:", v7, v6);

  v9.receiver = self;
  v9.super_class = (Class)FPUnpinOperation;
  -[FPActionOperation finishWithResult:error:](&v9, sel_finishWithResult_error_, v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
