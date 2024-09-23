@implementation MXAssetStorage

void __45___MXAssetStorage_loadAssetForKey_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
    dispatch_get_global_queue(21, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 48));

  }
}

uint64_t __35___MXAssetStorage_setAsset_forKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 16);
  if (v2)
    objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
  else
    objc_msgSend(v3, "removeObjectForKey:", a1[6]);
  objc_msgSend(*(id *)(a1[5] + 24), "removeObject:", a1[6]);
  objc_msgSend(*(id *)(a1[5] + 32), "objectForKey:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return objc_msgSend(*(id *)(a1[5] + 32), "removeObjectForKey:", a1[6]);
}

void __35___MXAssetStorage_setAsset_forKey___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __47___MXAssetStorage_fetchAssetForKey_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKey:");
    }
    v5 = (void *)MEMORY[0x18D778DB8](a1[6]);
    objc_msgSend(v6, "addObject:", v5);

  }
}

@end
