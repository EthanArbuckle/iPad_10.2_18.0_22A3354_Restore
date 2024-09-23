@implementation PFGarbageManager

uint64_t __49___PFGarbageManager__doCleanupForDir_exceptURLs___block_invoke(id *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v14 = 0;
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", a1[4], &v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_msgSend(a1[4], "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6));
        if ((objc_msgSend(a1[5], "containsObject:", v7) & 1) == 0)
        {
          v8 = a1[6];
          if (v8)
          {
            objc_sync_enter(a1[6]);
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v7, 0);
            objc_sync_exit(v8);
          }
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v4);
  }
  return objc_msgSend(v2, "drain");
}

@end
