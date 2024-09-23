@implementation GSStagingPrefix

- (GSStagingPrefix)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  _NSMethodExceptionProem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@: cannot use -init for initialization"), v5);

  return 0;
}

- (GSStagingPrefix)initWithDocumentID:(id)a3
{
  char *v4;
  char *v5;
  GSStagingPrefix *v6;
  objc_super v8;

  v4 = (char *)a3;
  v8.receiver = self;
  v8.super_class = (Class)GSStagingPrefix;
  v5 = -[GSStagingPrefix init](&v8, sel_init);
  v6 = (GSStagingPrefix *)v5;
  if (v5)
  {
    *((_QWORD *)v5 + 7) = -1;
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *((_DWORD *)v5 + 6) = *((_DWORD *)v4 + 8);
  }

  return v6;
}

- (BOOL)_refreshWithError:(id *)a3
{
  GSStagingPrefix *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t deviceID;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, void *);
  void *v15;
  GSStagingPrefix *v16;
  id v17;

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_sandboxHandle < 0)
  {
    +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v4->_volumeUUID);
    deviceID = v4->_deviceID;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __37__GSStagingPrefix__refreshWithError___block_invoke;
    v15 = &unk_1E9771B88;
    v16 = v4;
    v9 = v6;
    v17 = v9;
    objc_msgSend(v9, "stagingPrefixForDevice:volumeUUID:reply:", deviceID, v7, &v12);
    objc_msgSend(v9, "result", v12, v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      objc_msgSend(v9, "error");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v10, "BOOLValue");

  }
  else
  {
    v5 = 1;
  }
  objc_sync_exit(v4);

  return v5;
}

void __37__GSStagingPrefix__refreshWithError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v8)
  {
    v11 = a1 + 32;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
    objc_msgSend(v8, "pathComponents");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    *(_QWORD *)(*(_QWORD *)v11 + 40) = v12;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "bytes");
    *(_QWORD *)(*(_QWORD *)v11 + 56) = sandbox_extension_consume();
    if ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) & 0x8000000000000000) != 0)
    {
      gs_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
        __37__GSStagingPrefix__refreshWithError___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "handleBoolResult:error:", v8 != 0, v10);

}

- (void)_invalidate:(BOOL)a3
{
  _BOOL4 v3;
  GSStagingPrefix *v4;
  NSString *path;
  NSString *v6;
  NSObject *v7;
  NSString *v8;
  NSString *v9;
  NSArray *pathComponents;
  NSData *extension;
  _QWORD block[4];
  NSString *v13;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    path = v4->_path;
    if (path)
    {
      v6 = path;
      if (_invalidate__onceToken != -1)
        dispatch_once(&_invalidate__onceToken, &__block_literal_global_1);
      v7 = _invalidate__invalidationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__GSStagingPrefix__invalidate___block_invoke_2;
      block[3] = &unk_1E9771BB0;
      v13 = v6;
      v8 = v6;
      dispatch_async(v7, block);

    }
  }
  if ((v4->_sandboxHandle & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
    v4->_sandboxHandle = -1;
  }
  v9 = v4->_path;
  v4->_path = 0;

  pathComponents = v4->_pathComponents;
  v4->_pathComponents = 0;

  extension = v4->_extension;
  v4->_extension = 0;

  objc_sync_exit(v4);
}

void __31__GSStagingPrefix__invalidate___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.genstore.invalidation-queue", v2);
  v1 = (void *)_invalidate__invalidationQueue;
  _invalidate__invalidationQueue = (uint64_t)v0;

}

void __31__GSStagingPrefix__invalidate___block_invoke_2(uint64_t a1)
{
  id v2;

  GSDaemonProxy(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stagingPrefixRelinquish:", *(_QWORD *)(a1 + 32));

}

- (void)_connectionWithDaemonWasLost
{
  -[GSStagingPrefix _invalidate:](self, "_invalidate:", 0);
}

- (void)finalize
{
  objc_super v3;

  -[GSStagingPrefix _invalidate:](self, "_invalidate:", 1);
  v3.receiver = self;
  v3.super_class = (Class)GSStagingPrefix;
  -[GSStagingPrefix finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[GSStagingPrefix _invalidate:](self, "_invalidate:", 1);
  v3.receiver = self;
  v3.super_class = (Class)GSStagingPrefix;
  -[GSStagingPrefix dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<GSStagingPath %p %@>"), self, self->_path);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_path, "hash");
}

- (BOOL)isEqual:(id)a3
{
  GSStagingPrefix *v4;
  BOOL v5;

  v4 = (GSStagingPrefix *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NSString isEqualToString:](self->_path, "isEqualToString:", v4->_path);
  }

  return v5;
}

- (id)stagingPathforCreatingAdditionWithError:(id *)a3
{
  void *v5;
  NSString *path;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_sandboxHandle < 0 && !-[GSStagingPrefix _refreshWithError:](self, "_refreshWithError:", a3))
  {
    v10 = 0;
    v9 = 0;
  }
  else
  {
    path = self->_path;
    v12 = 0;
    objc_msgSend(v5, "gs_createTemporarySubdirectoryOfItem:withTemplate:error:", path, CFSTR("XXXXXXXX"), &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    v9 = v8;
    if (!v7)
    {
      if (objc_msgSend(v8, "code") == 642)
      {
        v7 = 0;
        if (a3)
          *a3 = objc_retainAutorelease(v9);
      }
      else
      {
        -[GSStagingPrefix _invalidate:](self, "_invalidate:", 1);
        if (!-[GSStagingPrefix _refreshWithError:](self, "_refreshWithError:", a3))
        {
          v10 = 0;
          goto LABEL_12;
        }
        objc_msgSend(v5, "gs_createTemporarySubdirectoryOfItem:withTemplate:error:", self->_path, CFSTR("XXXXXXXX"), a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v10 = v7;
  }
LABEL_12:

  return v10;
}

- (BOOL)isStagedPath:(id)a3
{
  void *v3;
  BOOL v4;

  GSStagingContainer(self->_path, self->_pathComponents, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)cleanupStagingPath:(id)a3
{
  void *v3;
  id v4;

  GSStagingContainer(self->_path, self->_pathComponents, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    _RemoveTree((char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"), 0, 0);
    v3 = v4;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_pathComponents, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

void __37__GSStagingPrefix__refreshWithError___block_invoke_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_1D414C000, v1, v2, "[ERROR] Failed consuming extension - %@; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
  OUTLINED_FUNCTION_3();
}

@end
