@implementation PFRequestExecutor

void __53___PFRequestExecutor_executeRequest_inContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator", 0), "persistentStores");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7), "isCloudKitEnabled"))
        {
          v8 = *(_QWORD *)(a1 + 40);
          if (v8)
            v9 = *(NSObject **)(v8 + 8);
          else
            v9 = 0;
          dispatch_group_enter(v9);
          ++v5;
        }
        ++v7;
      }
      while (v4 != v7);
      v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v4 = v10;
    }
    while (v10);
    if (v5
      && !objc_msgSend(*(id *)(a1 + 32), "executeRequest:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      v11 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      do
      {
        v12 = *(_QWORD *)(a1 + 40);
        if (v12)
          v13 = *(NSObject **)(v12 + 8);
        else
          v13 = 0;
        dispatch_group_leave(v13);
        --v5;
      }
      while (v5);
    }
  }
}

@end
