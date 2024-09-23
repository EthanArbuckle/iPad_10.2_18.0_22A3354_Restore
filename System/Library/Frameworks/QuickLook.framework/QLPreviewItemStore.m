@implementation QLPreviewItemStore

- (QLPreviewItemStore)init
{
  QLPreviewItemStore *v2;
  QLPreviewItemStore *v3;
  QLPreviewItemStore *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLPreviewItemStore;
  v2 = -[QLPreviewItemStore init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (QLPreviewItemStore)initWithPreviewItems:(id)a3
{
  id v4;
  QLPreviewItemStore *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  QLDataSource *v13;
  QLDataSource *internalItemProvider;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)QLPreviewItemStore;
  v5 = -[QLPreviewItemStore init](&v20, sel_init);
  v6 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x24BE7BF88], "itemWithPreviewItem:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11), (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

  v13 = -[QLDataSource initWithPreviewItems:]([QLDataSource alloc], "initWithPreviewItems:", v6);
  internalItemProvider = v5->_internalItemProvider;
  v5->_internalItemProvider = v13;

  -[QLPreviewItemStore setItemProvider:](v5, "setItemProvider:", v5->_internalItemProvider);
  -[QLPreviewItemStore reloadWithNumberOfPreviewItems:](v5, "reloadWithNumberOfPreviewItems:", objc_msgSend(v7, "count"));

  return v5;
}

- (QLPreviewItemStore)initWithItemsOfDirectoryAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  QLPreviewItemStore *v18;
  int v20;
  void *v21;
  QLPreviewItemStore *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QLPreviewItemStore;
  v22 = -[QLPreviewItemStore init](&v30, sel_init);
  v23 = v4;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v7, 22, &__block_literal_global_4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x212BA3DF4](v5);
        if (v14)
          MEMORY[0x212BA3DE8](v13, v14);
        objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithSecurityScopedURL:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BF88]), "initWithURLSandboxWrapper:", v15);
        objc_msgSend(v13, "relativePath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setRelativePath:", v17);

        if (+[QLPreviewController canPreviewItem:](QLPreviewController, "canPreviewItem:", v16))
          objc_msgSend(v24, "addObject:", v16);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  if (v20)
    objc_msgSend(v5, "stopAccessingSecurityScopedResource");
  objc_msgSend(v24, "sortUsingComparator:", &__block_literal_global_36);
  v22->_isArchive = 1;
  v18 = -[QLPreviewItemStore initWithPreviewItems:](v22, "initWithPreviewItems:", v24);

  return v18;
}

uint64_t __52__QLPreviewItemStore_initWithItemsOfDirectoryAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject **v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = (NSObject **)MEMORY[0x24BE7BF48];
  v7 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_ERROR, "Error while enumerating directory containing unarchived entries at URL: %@ #PreviewItemStore", (uint8_t *)&v9, 0xCu);
  }

  return 1;
}

uint64_t __52__QLPreviewItemStore_initWithItemsOfDirectoryAtURL___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "previewItemTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewItemTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)reloadWithNumberOfPreviewItems:(unint64_t)a3
{
  self->_possibleRange.location = 0;
  self->_possibleRange.length = a3;
  -[QLPreviewItemStore clearCache](self, "clearCache");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)QLPreviewItemStore;
  -[QLPreviewItemStore dealloc](&v4, sel_dealloc);
}

- (void)clearItems
{
  NSPointerArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_cache;
  v3 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setItem:", 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)clearCache
{
  id WeakRetained;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSPointerArray *v9;
  NSPointerArray *cache;
  NSPointerArray *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_possibleRange.length
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider), WeakRetained, WeakRetained))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_cache;
    v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "invalidate", (_QWORD)v12);
        }
        while (v6 != v8);
        v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x24BDD1748], "strongObjectsPointerArray");
    v9 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    cache = self->_cache;
    self->_cache = v9;

    -[NSPointerArray setCount:](self->_cache, "setCount:", -[QLPreviewItemStore numberOfItems](self, "numberOfItems"));
  }
  else
  {
    v11 = self->_cache;
    self->_cache = 0;

  }
}

- (unint64_t)numberOfItems
{
  unint64_t v2;

  -[QLPreviewItemStore possibleRange](self, "possibleRange");
  return v2;
}

- (BOOL)hasLoadedItemsMatching:(id)a3
{
  uint64_t (**v4)(id, void *);
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;

  v4 = (uint64_t (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);

  if (WeakRetained && -[QLPreviewItemStore numberOfItems](self, "numberOfItems"))
  {
    v6 = 0;
    while (1)
    {
      v7 = (void *)MEMORY[0x212BA40A0]();
      -[NSPointerArray pointerAtIndex:](self->_cache, "pointerAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "item");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v4[2](v4, v10);

        if (v11)
          break;
      }

      objc_autoreleasePoolPop(v7);
      if (-[QLPreviewItemStore numberOfItems](self, "numberOfItems") <= ++v6)
        goto LABEL_7;
    }

    objc_autoreleasePoolPop(v7);
    v12 = 1;
  }
  else
  {
LABEL_7:
    v12 = 0;
  }

  return v12;
}

- (id)loadedItemsMatching:(id)a3
{
  uint64_t (**v4)(id, void *);
  id WeakRetained;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v4 = (uint64_t (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);

  if (WeakRetained)
  {
    v6 = (void *)objc_opt_new();
    if (-[QLPreviewItemStore numberOfItems](self, "numberOfItems"))
    {
      v7 = 0;
      do
      {
        v8 = (void *)MEMORY[0x212BA40A0]();
        -[NSPointerArray pointerAtIndex:](self->_cache, "pointerAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "item");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v4[2](v4, v11);

          if (v12)
          {
            objc_msgSend(v10, "item");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }

        objc_autoreleasePoolPop(v8);
        ++v7;
      }
      while (-[QLPreviewItemStore numberOfItems](self, "numberOfItems") > v7);
    }
    v14 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v14;
}

- (void)previewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);
  if (WeakRetained
    && (v8 = WeakRetained,
        v9 = -[QLPreviewItemStore possibleRange](self, "possibleRange"),
        v11 = v10,
        v8,
        a3 >= v9)
    && a3 - v9 < v11)
  {
    v12 = v6;
    QLRunInMainThread();

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __63__QLPreviewItemStore_previewItemAtIndex_withCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1[4] + 8), "pointerAtIndex:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "addCompletionHandler:", a1[5]);
  }
  else
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "addCompletionHandler:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 8), "replacePointerAtIndex:withPointer:", a1[6], v4);
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
    v6 = a1[6];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63__QLPreviewItemStore_previewItemAtIndex_withCompletionHandler___block_invoke_2;
    v7[3] = &unk_24C725008;
    v7[4] = a1[4];
    v3 = v4;
    v8 = v3;
    objc_msgSend(WeakRetained, "previewItemAtIndex:withCompletionHandler:", v6, v7);

  }
}

void __63__QLPreviewItemStore_previewItemAtIndex_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 40);
  v6 = v8;
  v7 = v5;
  QLRunInMainThread();

}

uint64_t __63__QLPreviewItemStore_previewItemAtIndex_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  uint64_t v22;
  void *v23;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCanBeEdited:", objc_msgSend(v4, "itemStore:canEditItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)));

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setEditingMode:", objc_msgSend(v7, "itemStore:editingModeForPreviewItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)));

  }
  if (!objc_msgSend(*(id *)(a1 + 40), "editingMode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setEditedFileBehavior:", objc_msgSend(v10, "itemStore:editedFileBehaviorForItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setShouldPreventMachineReadableCodeDetection:", objc_msgSend(v13, "itemStore:canMachineReadableCodeBeDetectedInPreviewItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) ^ 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCanHandleEditedCopy:", objc_msgSend(v16, "itemStore:canHandleEditedCopyOfPreviewItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)));

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCanBeShared:", objc_msgSend(v19, "itemStore:canShareItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)));

  }
  objc_msgSend(*(id *)(a1 + 40), "fetcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v22 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "fetcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setUrlProvider:", v22);

  }
  return objc_msgSend(*(id *)(a1 + 56), "setItem:", *(_QWORD *)(a1 + 40));
}

- (void)resolvedPreviewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__QLPreviewItemStore_resolvedPreviewItemAtIndex_withCompletionHandler___block_invoke;
  v8[3] = &unk_24C725A20;
  v9 = v6;
  v7 = v6;
  -[QLPreviewItemStore previewItemAtIndex:withCompletionHandler:](self, "previewItemAtIndex:withCompletionHandler:", a3, v8);

}

void __71__QLPreviewItemStore_resolvedPreviewItemAtIndex_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "fetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __71__QLPreviewItemStore_resolvedPreviewItemAtIndex_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_24C7259F8;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v7, "fetchContentWithAllowedOutputClasses:inQueue:updateBlock:completionBlock:", v6, v8, 0, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __71__QLPreviewItemStore_resolvedPreviewItemAtIndex_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc(MEMORY[0x24BDE5F10]);
    v4 = (void *)objc_msgSend(v3, "initWithURL:sandboxType:", v5, *MEMORY[0x24BDAC000]);
    objc_msgSend(*(id *)(a1 + 32), "setGeneratedURLHandler:", v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (int64_t)indexOfPreviewItem:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  int v7;

  v4 = a3;
  if (-[QLPreviewItemStore numberOfItems](self, "numberOfItems"))
  {
    v5 = 0;
    while (1)
    {
      objc_msgSend(-[NSPointerArray pointerAtIndex:](self->_cache, "pointerAtIndex:", v5), "item");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "isEqual:", v6);

      if (v7)
        break;
      if (-[QLPreviewItemStore numberOfItems](self, "numberOfItems") <= ++v5)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__QLPreviewItemStore_previewController_previewItemAtIndex___block_invoke;
  v12[3] = &unk_24C725A48;
  v14 = &v15;
  v8 = v7;
  v13 = v8;
  -[QLPreviewItemStore previewItemAtIndex:withCompletionHandler:](self, "previewItemAtIndex:withCompletionHandler:", a4, v12);
  v9 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v8, v9);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __59__QLPreviewItemStore_previewController_previewItemAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (QLPreviewItemProvider)itemProvider
{
  return (QLPreviewItemProvider *)objc_loadWeakRetained((id *)&self->_itemProvider);
}

- (void)setItemProvider:(id)a3
{
  objc_storeWeak((id *)&self->_itemProvider, a3);
}

- (_NSRange)possibleRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_possibleRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (QLPreviewItemStoreDelegate)delegate
{
  return (QLPreviewItemStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isArchive
{
  return self->_isArchive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalItemProvider, 0);
  objc_destroyWeak((id *)&self->_itemProvider);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
