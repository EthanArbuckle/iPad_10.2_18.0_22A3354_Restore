@implementation MBDLHandleForLibrary

dispatch_queue_t ___MBDLHandleForLibrary_block_invoke()
{
  dispatch_queue_t result;

  _MBDLHandleForLibrary_handles = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, 0);
  result = dispatch_queue_create("MBDYLDLoaderQueue", 0);
  _MBDLHandleForLibrary_queue = (uint64_t)result;
  return result;
}

void ___MBDLHandleForLibrary_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  const void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(v2, "pathExtension");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("framework")))
  {
    if (_MBFrameworkSearchPaths_onceToken != -1)
      dispatch_once(&_MBFrameworkSearchPaths_onceToken, &__block_literal_global_17);
    v5 = (void *)_MBFrameworkSearchPaths_paths;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend((id)_MBFrameworkSearchPaths_paths, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "stringByAppendingPathComponent:", v2);
          if ((objc_msgSend(v4, "fileExistsAtPath:", v10) & 1) != 0)
          {
            v2 = (void *)objc_msgSend(v10, "stringByAppendingPathComponent:", objc_msgSend(v2, "stringByDeletingPathExtension"));
            goto LABEL_29;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v7)
          continue;
        break;
      }
    }
    goto LABEL_27;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("dylib")))
  {
    if (_MBLibrarySearchPaths_onceToken != -1)
      dispatch_once(&_MBLibrarySearchPaths_onceToken, &__block_literal_global_23_1);
    v11 = (void *)_MBLibrarySearchPaths_paths;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = objc_msgSend((id)_MBLibrarySearchPaths_paths, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      while (2)
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "stringByAppendingPathComponent:", v2);
          if ((objc_msgSend(v4, "fileExistsAtPath:", v16) & 1) != 0)
          {
            v2 = (void *)v16;
            goto LABEL_29;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          continue;
        break;
      }
    }
    goto LABEL_27;
  }
  if ((objc_msgSend(v3, "isEqualToString:", &stru_1E995F798) & 1) == 0)
LABEL_27:
    v2 = 0;
LABEL_29:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)_MBDLHandleForLibrary_handles, *(const void **)(a1 + 32));
  v17 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!v17)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = dlopen((const char *)objc_msgSend(v2, "fileSystemRepresentation"), 5);
    NSLog(CFSTR("Opened %@"), v2);
    v17 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (!v17)
    {
      v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *_MBDLHandleForLibrary(NSString *)_block_invoke_2"), CFSTR("MBWeakLinking.m"), 82, CFSTR("Unable to open framework at %@: %s"), v2, dlerror());
      v17 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
  }
  CFDictionarySetValue((CFMutableDictionaryRef)_MBDLHandleForLibrary_handles, v2, v17);
}

@end
