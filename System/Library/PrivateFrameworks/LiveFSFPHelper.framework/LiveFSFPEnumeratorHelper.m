@implementation LiveFSFPEnumeratorHelper

- (id)initForExtension:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  LiveFSFPEnumeratorHelper *v9;
  LiveFSFPEnumeratorHelper *v10;
  uint64_t v11;
  NSMutableSet *updatedItems;
  uint64_t v13;
  NSMutableSet *deletedItems;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)LiveFSFPEnumeratorHelper;
  v9 = -[LiveFSFPEnumeratorHelper init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->ext, a3);
    objc_storeStrong((id *)&v10->_enumeratedItem, a4);
    v10->_state = 0;
    *(_WORD *)&v10->historyReset = 0;
    v11 = objc_opt_new();
    updatedItems = v10->updatedItems;
    v10->updatedItems = (NSMutableSet *)v11;

    v13 = objc_opt_new();
    deletedItems = v10->deletedItems;
    v10->deletedItems = (NSMutableSet *)v13;

    v10->_addParent = -[LiveFSFPExtensionHelper fetchRoot](v10->ext, "fetchRoot");
  }

  return v10;
}

- (LiveFSFPEnumeratorHelper)initWithEnumeratedItem:(id)a3 container:(id)a4 extension:(id)a5
{
  id v8;
  id v9;
  LiveFSFPEnumeratorHelper *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  int v16;
  LiveFSFPEnumeratorHelper *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = -[LiveFSFPEnumeratorHelper initForExtension:item:](self, "initForExtension:item:", a5, v8);
  if (v10)
  {
    livefs_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218754;
      v17 = v10;
      v18 = 2112;
      v19 = v12;
      v20 = 2048;
      v21 = v8;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_DEFAULT, "enumerator helper[%p]: Creating enumerator for %@[%p] id %@", (uint8_t *)&v16, 0x2Au);

    }
    objc_storeStrong((id *)&v10->_dc, a4);
    v10->_hasPersistentIDs = -[LiveFSFPEnumeratorDataContainer hasPersistentIDs](v10->_dc, "hasPersistentIDs");
    v10->_isDir = -[LiveFSFPEnumeratorDataContainer isDir](v10->_dc, "isDir");
    v10->_isVolumeWide = -[LiveFSFPEnumeratorDataContainer isVolumeWide](v10->_dc, "isVolumeWide");
    if (-[LiveFSFPExtensionHelper fetchRoot](v10->ext, "fetchRoot"))
      v14 = 1;
    else
      v14 = objc_msgSend(v9, "addParent");
    v10->_addParent = v14;
    -[LiveFSFPEnumeratorDataContainer addEnumerator:](v10->_dc, "addEnumerator:", v10);
  }

  return v10;
}

+ (id)newWithEnumeratedItem:(id)a3 extension:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  id *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v8 = a3;
  v9 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__3;
  v43 = __Block_byref_object_dispose__3;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  objc_msgSend(v9, "enumeratorHelperQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __66__LiveFSFPEnumeratorHelper_newWithEnumeratedItem_extension_error___block_invoke;
  v20 = &unk_24E46B9C0;
  v11 = v9;
  v21 = v11;
  v23 = &v39;
  v12 = v8;
  v22 = v12;
  v24 = &v33;
  v25 = &v27;
  v26 = a5;
  dispatch_sync(v10, &v17);

  v13 = (void *)v28[5];
  if (v13)
  {
    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }
  else
  {
    v15 = objc_alloc((Class)a1);
    v14 = (void *)objc_msgSend(v15, "initWithEnumeratedItem:container:extension:", v34[5], v40[5], v11, v17, v18, v19, v20, v21);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v14;
}

void __66__LiveFSFPEnumeratorHelper_newWithEnumeratedItem_extension_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  LiveFSFPEnumeratorDataContainer *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "getEnumeratorForContainer:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_sync_exit(v2);
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v6)
  {
    objc_msgSend(v6, "enumeratedItem");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "itemForIdentifier:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v13 && (objc_msgSend(v13, "ensureFileHandleOrError:", *(_QWORD *)(a1 + 72)) & 1) == 0)
    {
      v14 = *(id *)(a1 + 32);
      objc_sync_enter(v14);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "container");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        livefs_std_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          __66__LiveFSFPEnumeratorHelper_newWithEnumeratedItem_extension_error___block_invoke_cold_1((uint64_t *)(a1 + 40), v16);

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "container");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;

      }
      else
      {
        v20 = -[LiveFSFPEnumeratorDataContainer initWithEnumeratedItem:fileHandle:extension:]([LiveFSFPEnumeratorDataContainer alloc], "initWithEnumeratedItem:fileHandle:extension:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

      }
      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v23)
      {
        objc_msgSend(*(id *)(a1 + 32), "addDirContainer:forContainerID:", v23, *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAddedToExtension:", 1);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setEnumeratedItemID:", *(_QWORD *)(a1 + 40));
        livefs_std_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = *(_QWORD *)(a1 + 40);
          v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v29 = 138412546;
          v30 = v26;
          v31 = 2112;
          v32 = v25;
          _os_log_impl(&dword_21F8A5000, v24, OS_LOG_TYPE_INFO, "Added new dc %@ id %@", (uint8_t *)&v29, 0x16u);
        }
      }
      else
      {
        getNSErrorFromLiveFSErrno();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v24 = *(NSObject **)(v28 + 40);
        *(_QWORD *)(v28 + 40) = v27;
      }

      objc_sync_exit(v14);
    }
  }
}

- (void)invalidate
{
  NSObject *v3;
  LiveFSFPItemHelper *enumeratedItem;
  __CFString *v5;
  LiveFSFPEnumeratorHelper *v6;
  int v7;
  const char *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    enumeratedItem = self->_enumeratedItem;
    if (enumeratedItem)
    {
      -[LiveFSFPItemHelper filename](self->_enumeratedItem, "filename");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("<no_enumerated_item>");
    }
    v7 = 136315394;
    v8 = "-[LiveFSFPEnumeratorHelper invalidate]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_21F8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s: marking state as DEAD, name '%@'", (uint8_t *)&v7, 0x16u);
    if (enumeratedItem)

  }
  v6 = self;
  objc_sync_enter(v6);
  v6->_state = 3;
  -[LiveFSFPEnumeratorDataContainer dropEnumerator:](v6->_dc, "dropEnumerator:", v6);
  objc_sync_exit(v6);

}

- (id)ensureConnectedForUpdates
{
  return -[LiveFSFPEnumeratorDataContainer ensureConnectedForUpdates](self->_dc, "ensureConnectedForUpdates");
}

- (id)getDirContents
{
  _BOOL4 sortedByDate;
  LiveFSFPEnumeratorDataContainer *dc;

  sortedByDate = self->_sortedByDate;
  dc = self->_dc;
  if (sortedByDate)
    -[LiveFSFPEnumeratorDataContainer contentsSortedByDate](dc, "contentsSortedByDate");
  else
    -[LiveFSFPEnumeratorDataContainer contentsSortedByName](dc, "contentsSortedByName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getItemsFromTree:(id)a3 inRange:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  LiveFSFPExtensionHelper *v9;
  void *v10;
  _QWORD v12[5];

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = self->ext;
  objc_sync_enter(v9);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__LiveFSFPEnumeratorHelper_getItemsFromTree_inRange_error___block_invoke;
  v12[3] = &unk_24E46B9E8;
  v12[4] = self;
  objc_msgSend(v8, "extractItemsInRange:withBlock:", location, length, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v9);

  return v10;
}

id __59__LiveFSFPEnumeratorHelper_getItemsFromTree_inRange_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = *(unsigned int *)(a2 + 40);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2 + *(unsigned __int16 *)(a2 + 10));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getItemForParent:name:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (void *)objc_opt_class();
    if (*(unsigned __int16 *)(a2 + 10) >= 0xB8u)
      v8 = 184;
    else
      v8 = *(unsigned __int16 *)(a2 + 10);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a2 + 16, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "newItemForFH:withReference:name:parent:type:attrs:extension:", 0, 0, v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v4, v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  }
  objc_msgSend(v6, "prefetchXattrBasedValues");

  return v6;
}

- (void)enumerateFileItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v6;
  id v7;
  int state;
  void *v9;
  NSObject *v10;
  void *v11;
  LiveFSFPEnumeratorDataContainer *dc;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  state = self->_state;
  if (state)
  {
    if (state == 3)
    {
      +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 89);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      livefs_std_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[LiveFSFPEnumeratorHelper enumerateFileItemsForObserver:startingAtPage:].cold.2();
LABEL_13:

      objc_msgSend(v6, "finishEnumeratingWithError:", v9);
      goto LABEL_14;
    }
  }
  else
  {
    self->_state = 2;
  }
  if (!self->_enumeratedItem)
  {
    dc = self->_dc;
    if (dc)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      -[LiveFSFPEnumeratorDataContainer containerID](dc, "containerID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileProviderErrorForNonExistentItemWithIdentifier:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    livefs_std_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPEnumeratorHelper enumerateFileItemsForObserver:startingAtPage:].cold.1();
    goto LABEL_13;
  }
  v15[0] = self->_enumeratedItem;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didEnumerateItems:", v11);

  objc_msgSend(v6, "finishEnumeratingUpToPage:", 0);
LABEL_14:

}

- (void)reallyEnumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  LiveFSFPEnumeratorHelper *v9;
  int state;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  int v30;
  uint8_t buf[4];
  LiveFSFPEnumeratorHelper *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30 = 0;
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPEnumeratorHelper reallyEnumerateItemsForObserver:startingAtPage:].cold.3();

  if (!self->_state)
  {
    -[LiveFSFPEnumeratorDataContainer ensureConnectedForUpdates](self->_dc, "ensureConnectedForUpdates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v6, "finishEnumeratingWithError:", v14);

      goto LABEL_48;
    }
  }
  if (!self->_isDir)
  {
    -[LiveFSFPEnumeratorHelper enumerateFileItemsForObserver:startingAtPage:](self, "enumerateFileItemsForObserver:startingAtPage:", v6, v7);
    goto LABEL_48;
  }
  v9 = self;
  objc_sync_enter(v9);
  state = self->_state;
  if (state)
  {
    if (state == 3)
    {
      +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 89);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      livefs_std_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[LiveFSFPEnumeratorHelper enumerateFileItemsForObserver:startingAtPage:].cold.2();

      objc_msgSend(v6, "finishEnumeratingWithError:", v11);
LABEL_10:
      v13 = 0;
LABEL_47:
      objc_sync_exit(v9);

      goto LABEL_48;
    }
  }
  else if (objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDC81E8]))
  {
    self->_state = 1;
  }
  else if (objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDC81E0]))
  {
    self->_state = 1;
    v9->_sortedByDate = 1;
  }
  else if (!self->_state)
  {
    livefs_std_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPEnumeratorHelper reallyEnumerateItemsForObserver:startingAtPage:].cold.2();

    self->_state = 3;
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishEnumeratingWithError:", v11);
    goto LABEL_10;
  }
  -[LiveFSFPEnumeratorHelper getDirContents](v9, "getDirContents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v15 = -[LiveFSFPEnumeratorDataContainer loadContents](v9->_dc, "loadContents");
    -[LiveFSFPEnumeratorHelper getDirContents](v9, "getDirContents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  livefs_std_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v32 = v9;
    v33 = 2112;
    v34 = (unint64_t)v13;
    v35 = 2048;
    v36[0] = objc_msgSend(v13, "count");
    _os_log_debug_impl(&dword_21F8A5000, v16, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: dirContent: %@, count: %lu", buf, 0x20u);
  }

  if ((objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDC81E8]) & 1) != 0
    || objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDC81E0]))
  {
    LODWORD(v17) = 0;
    v30 = 0;
  }
  else if (objc_msgSend(v7, "length") != 4
         || (v17 = *(unsigned int *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), v30 = v17, (v17 & 0x3F) != 0)
         || objc_msgSend(v13, "count") <= v17)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishEnumeratingWithError:", v11);
    goto LABEL_47;
  }
  v18 = objc_msgSend(v13, "count");
  v19 = (v17 + 64);
  if (v18 <= v19)
    v20 = objc_msgSend(v13, "count") - v17;
  else
    v20 = 64;
  livefs_std_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v32 = v9;
    v33 = 2048;
    v34 = v17;
    v35 = 2048;
    v36[0] = v20;
    _os_log_debug_impl(&dword_21F8A5000, v21, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: range: %lu -> %lu", buf, 0x20u);
  }

  v29 = 0;
  -[LiveFSFPEnumeratorHelper getItemsFromTree:inRange:error:](v9, "getItemsFromTree:inRange:error:", v13, v17, v20, &v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v29;
  if (!v22)
  {
    objc_msgSend(v6, "finishEnumeratingWithError:", v11);
    goto LABEL_47;
  }
  if (-[LiveFSFPEnumeratorDataContainer addParent](v9->_dc, "addParent"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v9->_enumeratedItem);
    v24 = v23;

    -[LiveFSFPEnumeratorDataContainer setAddParent:](v9->_dc, "setAddParent:", 0);
  }
  else
  {
    v24 = v22;
  }
  objc_msgSend(v6, "didEnumerateItems:", v24);
  if (v18 <= v19)
  {
    objc_msgSend(v6, "finishEnumeratingUpToPage:", 0);
    v26 = 1;
  }
  else
  {
    v30 = v19;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v30, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishEnumeratingUpToPage:", v25);

    v26 = 0;
  }
  objc_sync_exit(v9);

  livefs_std_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218754;
    v32 = v9;
    v33 = 2080;
    v34 = (unint64_t)"-[LiveFSFPEnumeratorHelper reallyEnumerateItemsForObserver:startingAtPage:]";
    v35 = 1024;
    LODWORD(v36[0]) = v30;
    WORD2(v36[0]) = 1024;
    *(_DWORD *)((char *)v36 + 6) = v26;
    _os_log_impl(&dword_21F8A5000, v27, OS_LOG_TYPE_INFO, "enumerator helper[%p]: %s ending, start: %d, lastPage: %d", buf, 0x22u);
  }

LABEL_48:
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  LiveFSFPEnumeratorDataContainer *dc;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  LiveFSFPEnumeratorHelper *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[LiveFSFPEnumeratorHelper enumerateItemsForObserver:startingAtPage:]";
    v17 = 2048;
    v18 = self;
    _os_log_impl(&dword_21F8A5000, v8, OS_LOG_TYPE_INFO, "%s: starting on %p", buf, 0x16u);
  }

  dc = self->_dc;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__LiveFSFPEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke;
  v12[3] = &unk_24E46B220;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[LiveFSFPEnumeratorDataContainer dispatchOntoUpdateQueue:](dc, "dispatchOntoUpdateQueue:", v12);

}

uint64_t __69__LiveFSFPEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reallyEnumerateItemsForObserver:startingAtPage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)currentSyncAnchorWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  LiveFSFPEnumeratorHelper *v6;
  void *v7;

  v4 = (void (**)(id, _QWORD))a3;
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPEnumeratorHelper currentSyncAnchorWithCompletionHandler:].cold.1((uint64_t)self, v5);

  v6 = self;
  objc_sync_enter(v6);
  if (v6->_state == 3)
  {
    v4[2](v4, 0);
  }
  else
  {
    currentAnchor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v7);

  }
  objc_sync_exit(v6);

}

- (void)synchronizedEnumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  LiveFSFPEnumeratorHelper *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSMutableSet *updatedItems;
  NSMutableSet *deletedItems;
  int v16;
  char *v17;
  void *v18;
  void *v19;
  char *v20;
  NSObject *v21;
  void *v22;
  BOOL hasPersistentIDs;
  LiveFSFPItemHelper *v24;
  void *v25;
  char v26;
  id v27;
  LiveFSFPItemHelper *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[4];
  LiveFSFPItemHelper *v33;
  id v34;
  BOOL v35;
  char v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPEnumeratorHelper synchronizedEnumerateChangesForObserver:fromSyncAnchor:].cold.1((uint64_t)self, v8);

  v9 = (void *)objc_opt_new();
  v10 = self;
  objc_sync_enter(v10);
  if ((*((_BYTE *)v10 + 40) & 2) != 0)
  {
    if (-[NSMutableSet count](v10->deletedItems, "count"))
    {
      -[NSMutableSet allObjects](v10->deletedItems, "allObjects");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = &unk_24E470B80;
    }
    v18 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileProviderErrorForNonExistentItemWithIdentifier:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "finishEnumeratingWithError:", v11);
    goto LABEL_18;
  }
  if (v10->historyReset)
  {
    v10->historyReset = 0;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC81B0], -1002, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishEnumeratingWithError:", v11);
    v12 = 0;
LABEL_18:

LABEL_19:
    objc_sync_exit(v10);
    goto LABEL_20;
  }
  if (!-[NSMutableSet count](v10->deletedItems, "count")
    && !-[NSMutableSet count](v10->updatedItems, "count")
    && (*((_BYTE *)v10 + 40) & 1) == 0
    && !v10->_addParent)
  {
    livefs_std_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F8A5000, v30, OS_LOG_TYPE_DEFAULT, "exiting after seeing 0 changes", buf, 2u);
    }

    objc_msgSend(v6, "finishEnumeratingChangesUpToSyncAnchor:moreComing:", v7, 0);
    v12 = 0;
    goto LABEL_19;
  }
  livefs_std_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    deletedItems = v10->deletedItems;
    updatedItems = v10->updatedItems;
    v16 = -(*((_BYTE *)v10 + 40) & 1);
    *(_DWORD *)buf = 138412802;
    v40 = (const char *)updatedItems;
    v41 = 2112;
    v42 = (char *)deletedItems;
    v43 = 1024;
    LODWORD(v44) = v16;
    _os_log_impl(&dword_21F8A5000, v13, OS_LOG_TYPE_DEFAULT, "updateds: %@ deleteds %@ self upd %u", buf, 0x1Cu);
  }

  if (-[NSMutableSet count](v10->updatedItems, "count"))
  {
    -[NSMutableSet allObjects](v10->updatedItems, "allObjects");
    v17 = (char *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (char *)MEMORY[0x24BDBD1A8];
  }
  if (-[NSMutableSet count](v10->deletedItems, "count"))
  {
    -[NSMutableSet allObjects](v10->deletedItems, "allObjects");
    v20 = (char *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = (char *)MEMORY[0x24BDBD1A8];
  }
  currentAnchor();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeAllObjects](v10->updatedItems, "removeAllObjects");
  -[NSMutableSet removeAllObjects](v10->deletedItems, "removeAllObjects");
  if ((*((_BYTE *)v10 + 40) & 1) != 0)
  {
    *((_BYTE *)v10 + 40) &= ~1u;
    objc_msgSend(v9, "addObject:", v10->_enumeratedItem);
  }
  if (v10->_addParent)
    objc_msgSend(v9, "addObject:", v10->_enumeratedItem);
  objc_sync_exit(v10);

  livefs_std_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v40 = v17;
    v41 = 2112;
    v42 = v20;
    _os_log_impl(&dword_21F8A5000, v21, OS_LOG_TYPE_DEFAULT, "About to walk %@ and %@", buf, 0x16u);
  }

  if (v10->_isDir)
  {
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke;
    v37[3] = &unk_24E46BA10;
    v37[4] = v10;
    v38 = v9;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v37);
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      hasPersistentIDs = v10->_hasPersistentIDs;
      v24 = v10->_enumeratedItem;
      -[LiveFSFPItemHelper itemIdentifier](v10->_enumeratedItem, "itemIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BDC8228]);

      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke_146;
      v32[3] = &unk_24E46BA38;
      v35 = hasPersistentIDs;
      v33 = v24;
      v36 = v26;
      v27 = v22;
      v34 = v27;
      v28 = v24;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v32);
      v12 = v27;

    }
    else
    {
      v12 = v20;
    }

  }
  else
  {
    v12 = v20;
  }
  livefs_std_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v40 = "-[LiveFSFPEnumeratorHelper synchronizedEnumerateChangesForObserver:fromSyncAnchor:]";
    v41 = 2112;
    v42 = v17;
    v43 = 2112;
    v44 = v12;
    v45 = 2112;
    v46 = v9;
    _os_log_impl(&dword_21F8A5000, v29, OS_LOG_TYPE_DEFAULT, "%s: exiting with updateIDs %@, tombstones %@, newItems %@", buf, 0x2Au);
  }

  objc_msgSend(v6, "didDeleteItemsWithIdentifiers:", v12);
  objc_msgSend(v6, "didUpdateItems:", v9);
  objc_msgSend(v6, "finishEnumeratingChangesUpToSyncAnchor:moreComing:", v31, 0);

  v10 = (LiveFSFPEnumeratorHelper *)v17;
LABEL_20:

}

void __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  v4 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "itemAtPath:parent:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
  else
  {
    livefs_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke_cold_1((uint64_t)v3, v4, v6);

  }
}

void __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke_146(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BE60438], "identifierForItem:name:parentID:", 0, v3, objc_msgSend(*(id *)(a1 + 32), "inodeNum"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*(_BYTE *)(a1 + 49))
    {
      objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v4 = v3;
  }
  v5 = v4;
LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  LiveFSFPExtensionHelper *ext;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  LiveFSFPEnumeratorHelper *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[LiveFSFPEnumeratorHelper enumerateChangesForObserver:fromSyncAnchor:]";
    v17 = 2048;
    v18 = self;
    _os_log_impl(&dword_21F8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s: starting on %p", buf, 0x16u);
  }

  ext = self->ext;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__LiveFSFPEnumeratorHelper_enumerateChangesForObserver_fromSyncAnchor___block_invoke;
  v12[3] = &unk_24E46B220;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[LiveFSFPExtensionHelper dispatchOntoRenameQueue:](ext, "dispatchOntoRenameQueue:", v12);

}

uint64_t __71__LiveFSFPEnumeratorHelper_enumerateChangesForObserver_fromSyncAnchor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronizedEnumerateChangesForObserver:fromSyncAnchor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)addInterestedItem:(id)a3 newName:(id)a4 forSelf:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  LiveFSFPEnumeratorHelper *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (v5)
  {
    *((_BYTE *)v9 + 40) |= 1u;
  }
  else
  {
    -[NSMutableSet removeObject:](v9->deletedItems, "removeObject:", v10);
    -[NSMutableSet addObject:](v9->updatedItems, "addObject:", v8);
  }
  objc_sync_exit(v9);

}

- (void)applyDelete:(id)a3 newTombstone:(id)a4 toSelf:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  LiveFSFPEnumeratorHelper *v10;
  id *p_deletedItems;
  NSMutableSet *updatedItems;
  NSObject *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  if (v5)
  {
    *((_BYTE *)v10 + 40) |= 2u;
    -[NSMutableSet removeAllObjects](v10->updatedItems, "removeAllObjects");
    p_deletedItems = (id *)&v10->deletedItems;
    -[NSMutableSet removeAllObjects](v10->deletedItems, "removeAllObjects");
LABEL_6:
    objc_msgSend(*p_deletedItems, "addObject:", v9);
    goto LABEL_10;
  }
  updatedItems = v10->updatedItems;
  if (updatedItems)
  {
    p_deletedItems = (id *)&v10->deletedItems;
    if (v10->deletedItems)
    {
      -[NSMutableSet removeObject:](updatedItems, "removeObject:", v8);
      goto LABEL_6;
    }
  }
  livefs_std_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[LiveFSFPEnumeratorHelper applyDelete:newTombstone:toSelf:].cold.1((uint64_t *)&v10->updatedItems);

LABEL_10:
  objc_sync_exit(v10);

}

- (void)resetHistory
{
  LiveFSFPEnumeratorHelper *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->historyReset = 1;
  objc_sync_exit(obj);

}

- (void)signalEnumeratedItemChanged
{
  -[LiveFSFPEnumeratorDataContainer handleEnumeratedItemChanged](self->_dc, "handleEnumeratedItemChanged");
}

+ (void)applyParentUpdateAcrossEnumerators:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "applyParentUpdateAcrossEnumerators");
  objc_msgSend(v3, "handleEnumeratedItemChanged");

}

- (BOOL)hasPersistentIDs
{
  return self->_hasPersistentIDs;
}

- (BOOL)addParent
{
  return self->_addParent;
}

- (void)setAddParent:(BOOL)a3
{
  self->_addParent = a3;
}

- (BOOL)isDir
{
  return self->_isDir;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)isVolumeWide
{
  return self->_isVolumeWide;
}

- (LiveFSFPItemHelper)enumeratedItem
{
  return self->_enumeratedItem;
}

- (LiveFSFPEnumeratorDataContainer)dc
{
  return (LiveFSFPEnumeratorDataContainer *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dc, 0);
  objc_storeStrong((id *)&self->_enumeratedItem, 0);
  objc_storeStrong((id *)&self->updatedItems, 0);
  objc_storeStrong((id *)&self->deletedItems, 0);
  objc_storeStrong((id *)&self->ext, 0);
}

void __66__LiveFSFPEnumeratorHelper_newWithEnumeratedItem_extension_error___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_21F8A5000, a2, OS_LOG_TYPE_FAULT, "Found an item with a dc which isn't indexed for it. item %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)enumerateFileItemsForObserver:startingAtPage:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1();
  v3 = v0;
  _os_log_debug_impl(&dword_21F8A5000, v1, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: returning %@", v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)enumerateFileItemsForObserver:startingAtPage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_21F8A5000, v0, v1, "enumerator helper[%p]: returning ECANCELED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)reallyEnumerateItemsForObserver:startingAtPage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_21F8A5000, v0, v1, "enumerator helper[%p]: no sorting order provided, returning EINVAL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)reallyEnumerateItemsForObserver:startingAtPage:.cold.3()
{
  int v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v4 = 2080;
  v5 = "-[LiveFSFPEnumeratorHelper reallyEnumerateItemsForObserver:startingAtPage:]";
  v6 = 1024;
  v7 = v0;
  OUTLINED_FUNCTION_16_0(&dword_21F8A5000, v1, v2, "enumerator helper[%p]: %s starting, state %d", v3);
}

- (void)currentSyncAnchorWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 48);
  v3 = 136315394;
  v4 = "-[LiveFSFPEnumeratorHelper currentSyncAnchorWithCompletionHandler:]";
  v5 = 1024;
  v6 = v2;
  _os_log_debug_impl(&dword_21F8A5000, a2, OS_LOG_TYPE_DEBUG, "%s: starting state %d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)synchronizedEnumerateChangesForObserver:(uint64_t)a1 fromSyncAnchor:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 48);
  v3 = *(unsigned __int8 *)(a1 + 40) << 30 >> 31;
  v4 = 136315650;
  v5 = "-[LiveFSFPEnumeratorHelper synchronizedEnumerateChangesForObserver:fromSyncAnchor:]";
  v6 = 1024;
  v7 = v2;
  v8 = 1024;
  v9 = v3;
  _os_log_debug_impl(&dword_21F8A5000, a2, OS_LOG_TYPE_DEBUG, "%s: starting state %d deleted %u", (uint8_t *)&v4, 0x18u);
  OUTLINED_FUNCTION_0();
}

void __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)a2 + 56), "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_5_1();
  v10 = v6;
  OUTLINED_FUNCTION_2(&dword_21F8A5000, a3, v7, "Error finding item %@ in enumerator %@", (uint8_t *)&v8);

}

- (void)applyDelete:(uint64_t *)a1 newTombstone:toSelf:.cold.1(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v4 = 138412546;
  v5 = v1;
  OUTLINED_FUNCTION_5_1();
  v6 = v2;
  OUTLINED_FUNCTION_2(&dword_21F8A5000, v3, (uint64_t)v3, "bad updateds: %@ deleteds %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_0();
}

@end
