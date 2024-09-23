@implementation UIKeyboardArbiterDebug

void __36___UIKeyboardArbiterDebug_addEntry___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) += objc_msgSend(*(id *)(a1 + 40), "importance");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  while (1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(int *)(v2 + 16) < 601)
      break;
    objc_msgSend(*(id *)(v2 + 24), "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) -= objc_msgSend(v3, "importance");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", 0);
  }
  objc_sync_exit(obj);

}

void __47___UIKeyboardArbiterDebug_addAsynchronousData___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[_UIKeyboardArbiterDebugEntryDictionaries entryWithDictionaries:](_UIKeyboardArbiterDebugEntryDictionaries, "entryWithDictionaries:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntry:", v3);

}

void __41___UIKeyboardArbiterDebug_sharedInstance__block_invoke()
{
  _UIKeyboardArbiterDebug *v0;
  void *v1;

  v0 = objc_alloc_init(_UIKeyboardArbiterDebug);
  v1 = (void *)qword_253E78FD8;
  qword_253E78FD8 = (uint64_t)v0;

}

void __73___UIKeyboardArbiterDebug_getDebugInfoDictionariesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v10[0] = v6;
        v10[1] = 3221225472;
        v10[2] = __73___UIKeyboardArbiterDebug_getDebugInfoDictionariesWithCompletionHandler___block_invoke_2;
        v10[3] = &unk_24DAA0958;
        v11 = v2;
        objc_msgSend(v8, "enumerateContents:", v10);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_sync_exit(obj);

}

uint64_t __73___UIKeyboardArbiterDebug_getDebugInfoDictionariesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
