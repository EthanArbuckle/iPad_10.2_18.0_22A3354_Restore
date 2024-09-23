@implementation _PFGarbageManager

+ (id)defaultInstance
{
  return (id)_NSTheOneGarbageManager;
}

- (void)temporaryLinksDirectoryForStore:(id *)a1
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *global_queue;
  uint64_t v12;
  _QWORD block[7];

  if (!a1)
    return 0;
  objc_sync_enter(a1);
  v4 = (void *)objc_msgSend(a2, "externalDataReferencesDirectory");
  v5 = (NSString *)objc_msgSend(a1[1], "objectForKey:", v4);
  if (!v5)
  {
    v5 = NSTemporaryDirectory();
    if (!v5)
      v5 = (NSString *)objc_msgSend(v4, "stringByDeletingLastPathComponent");
    objc_msgSend(a1[1], "setObject:forKey:", v5, v4);
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", CFSTR(".LINKS")), "stringByAppendingPathComponent:", +[_PFRoutines _getUUID]()), 1);
  if (!v6)
    goto LABEL_11;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", 0), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v12) & 1) == 0)
  {
    objc_sync_exit(a1);
    return 0;
  }
  v7 = objc_msgSend((id)objc_msgSend(v6, "path"), "stringByDeletingLastPathComponent");
  v8 = a1[2];
  objc_sync_enter(v8);
  objc_msgSend(a1[2], "addObject:", objc_msgSend(v6, "path"));
  v9 = (void *)objc_msgSend(a1[2], "copy");
  objc_sync_exit(v8);
  if (v9)
  {
    global_queue = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49___PFGarbageManager__doCleanupForDir_exceptURLs___block_invoke;
    block[3] = &unk_1E1EDD790;
    block[4] = v7;
    block[5] = v9;
    block[6] = a1;
    dispatch_async(global_queue, block);
  }

LABEL_11:
  objc_sync_exit(a1);
  return v6;
}

+ (void)initialize
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  objc_super v6;

  objc_opt_self();
  if (!_NSTheOneGarbageManager)
  {
    v3 = NSAllocateObject((Class)a1, 0, 0);
    _NSTheOneGarbageManager = (uint64_t)v3;
    if (v3)
    {
      v6.receiver = v3;
      v6.super_class = (Class)_PFGarbageManager;
      v4 = objc_msgSendSuper2(&v6, sel_init);
      if (v4)
      {
        v5 = v4;
        v4[2] = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v5[1] = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
    }
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)_NSTheOneGarbageManager;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (uint64_t)doCleanupForURL:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (result && a2)
  {
    v2 = result;
    v3 = (void *)objc_msgSend(a2, "path");
    v4 = *(void **)(v2 + 16);
    objc_sync_enter(v4);
    if (objc_msgSend(*(id *)(v2 + 16), "containsObject:", v3))
    {
      objc_msgSend(*(id *)(v2 + 16), "removeObject:", v3);
      v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      objc_msgSend(v5, "removeItemAtPath:error:", v3, 0);
      v6 = (void *)objc_msgSend(v3, "stringByDeletingLastPathComponent");
      if (objc_msgSend((id)objc_msgSend(v6, "lastPathComponent"), "isEqualToString:", CFSTR(".LINKS")))
      {
        v7 = (void *)objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v6, 0);
        if (v7)
        {
          if (!objc_msgSend(v7, "count"))
            objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);
        }
      }
    }
    return objc_sync_exit(v4);
  }
  return result;
}

@end
