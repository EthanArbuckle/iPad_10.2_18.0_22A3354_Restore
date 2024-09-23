@implementation FPPinOperation

- (FPPinOperation)initWithItems:(id)a3
{
  id v5;
  FPPinOperation *v6;
  FPPinOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPPinOperation;
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
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSArray *obj;
  _QWORD block[4];
  id v19;
  FPPinOperation *v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  NSArray *v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v33;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v33 != v4)
          objc_enumerationMutation(v2);
        if (!FPPinningSupportedForItem(*(void **)(*((_QWORD *)&v32 + 1) + 8 * v5)))
        {
          FPNotSupportedError();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v15);

          goto LABEL_18;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v3)
        continue;
      break;
    }
  }

  v2 = (NSArray *)dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__26;
  v30[4] = __Block_byref_object_dispose__26;
  v31 = 0;
  v6 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_items;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        dispatch_group_enter(&v2->super);
        +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __28__FPPinOperation_actionMain__block_invoke;
        v22[3] = &unk_1E444EE68;
        v25 = v30;
        v23 = v6;
        v24 = v2;
        objc_msgSend(v11, "pinItemWithID:completionHandler:", v12, v22);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v7);
  }

  -[FPOperation callbackQueue](self, "callbackQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__FPPinOperation_actionMain__block_invoke_2;
  block[3] = &unk_1E444EEB8;
  v19 = v6;
  v20 = self;
  v21 = v30;
  v14 = v6;
  dispatch_group_notify(&v2->super, v13, block);

  _Block_object_dispose(v30, 8);
LABEL_18:

}

void __28__FPPinOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
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

void __28__FPPinOperation_actionMain__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  FPDownloadOperation *v7;
  void *v8;
  _QWORD v9[4];
  __int128 v10;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "isRecursivelyDownloaded"))
        {

          v7 = -[FPDownloadOperation initWithItems:]([FPDownloadOperation alloc], "initWithItems:", *(_QWORD *)(a1 + 32));
          -[FPDownloadOperation setRecursively:](v7, "setRecursively:", 1);
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __28__FPPinOperation_actionMain__block_invoke_3;
          v9[3] = &unk_1E444EE90;
          v10 = *(_OWORD *)(a1 + 40);
          -[FPDownloadOperation setDownloadCompletionBlock:](v7, "setDownloadCompletionBlock:", v9);
          +[FPItemManager defaultManager](FPItemManager, "defaultManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "scheduleAction:", v7);

          return;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

uint64_t __28__FPPinOperation_actionMain__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;

  v3 = a3;
  v5 = *(void **)(a1 + 32);
  if (!a3)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return objc_msgSend(v5, "completedWithResult:error:", a2, v3);
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
  objc_msgSend(v4, "transformItems:handler:", self->_items, &__block_literal_global_298);

  -[FPActionOperation stitcher](self, "stitcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flush");

}

void __38__FPPinOperation_presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPinned:", 1);
  objc_msgSend(v2, "setInPinnedFolder:", 1);
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v2, "capabilities") & 0xFFFFFFFFEFFFFFFFLL);
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v2, "capabilities") & 0xFFFFFFFFFFFFFFBFLL);
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v2, "capabilities") | 0x8000000);

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
  v9.super_class = (Class)FPPinOperation;
  -[FPActionOperation finishWithResult:error:](&v9, sel_finishWithResult_error_, v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
