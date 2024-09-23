@implementation SUUISoftwareLibraryInterface

- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  dispatch_semaphore_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  dispatch_semaphore_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "storeItemIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
  v16 = dispatch_semaphore_create(0);
  v17 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __74__SUUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke;
  v25[3] = &unk_2511F6D38;
  v18 = v14;
  v26 = v18;
  v27 = v16;
  v19 = v16;
  objc_msgSend(v15, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v7, v25);
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __74__SUUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke_2;
  v22[3] = &unk_2511F6D60;
  v23 = v18;
  v24 = v6;
  v20 = v6;
  v21 = v18;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v22);

}

void __74__SUUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  SUUILibraryItemState *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v16 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = *MEMORY[0x24BEB2A80];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x2426A2860]();
        objc_msgSend(v12, "valueForProperty:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && (objc_msgSend(v12, "isPlaceholder") & 1) == 0)
        {
          v15 = -[SUUILibraryItemState initWithApplication:]([SUUILibraryItemState alloc], "initWithApplication:", v12);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v15, v14);

        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __74__SUUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  SUUILibraryItemState *v6;
  id v7;

  v7 = a2;
  v3 = (void *)MEMORY[0x2426A2860]();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v7, "storeItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (SUUILibraryItemState *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = objc_alloc_init(SUUILibraryItemState);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v3);
}

- (id)exposedPlatformItemKinds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("iosSoftware"));
}

- (BOOL)performActionForLibraryItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SUUISoftwareLibraryInterface stateForLibraryItem:](self, "stateForLibraryItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    SUUIMetricsLaunchApplicationWithIdentifier((uint64_t)v6, 0);
    CFRelease(v6);
  }

  return v5 != 0;
}

- (id)stateForLibraryItem:(id)a3
{
  id v3;
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__20;
  v18 = __Block_byref_object_dispose__20;
  v19 = 0;
  v4 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
  v5 = dispatch_semaphore_create(0);
  objc_msgSend(v3, "storeItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__SUUISoftwareLibraryInterface_stateForLibraryItem___block_invoke;
  v11[3] = &unk_2511F6D88;
  v13 = &v14;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v4, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v7, v11);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __52__SUUISoftwareLibraryInterface_stateForLibraryItem___block_invoke(uint64_t a1, void *a2)
{
  SUUILibraryItemState *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_msgSend(v6, "isPlaceholder") & 1) == 0)
  {
    v3 = -[SUUILibraryItemState initWithApplication:]([SUUILibraryItemState alloc], "initWithApplication:", v6);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
