@implementation CAMNebulaKeepAliveController

- (CAMNebulaKeepAliveController)init
{
  CAMNebulaKeepAliveController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *syncQueue;
  NSObject *v6;
  CAMNebulaKeepAliveController *v7;
  CAMNebulaKeepAliveController *v8;
  _QWORD block[4];
  CAMNebulaKeepAliveController *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMNebulaKeepAliveController;
  v2 = -[CAMNebulaKeepAliveController init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.camera.nebula.keep-alive", v3);
    syncQueue = v2->__syncQueue;
    v2->__syncQueue = (OS_dispatch_queue *)v4;

    -[CAMNebulaKeepAliveController _syncQueue](v2, "_syncQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__CAMNebulaKeepAliveController_init__block_invoke;
    block[3] = &unk_1EA328868;
    v7 = v2;
    v11 = v7;
    dispatch_sync(v6, block);

    v8 = v7;
  }

  return v2;
}

void __36__CAMNebulaKeepAliveController_init__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = -1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (id)_keepAliveFilePath
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D73138], "nebuladkeepalivepath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CAMNebulaKeepAliveController _didCreateKeepAliveDirectory](self, "_didCreateKeepAliveDirectory"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

    -[CAMNebulaKeepAliveController _setDidCreateKeepAliveDirectory:](self, "_setDidCreateKeepAliveDirectory:", 1);
  }

  return v3;
}

- (void)startKeepAliveForIdentifier:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[CAMNebulaKeepAliveController _syncQueue](self, "_syncQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__CAMNebulaKeepAliveController_startKeepAliveForIdentifier___block_invoke;
    block[3] = &unk_1EA328A40;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

uint64_t __60__CAMNebulaKeepAliveController_startKeepAliveForIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  int *v5;
  char *v6;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_nebuladKeepAliveFileDescriptor") & 0x80000000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_keepAliveFilePath");
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v3 = open((const char *)objc_msgSend(v2, "fileSystemRepresentation"), 641, 438);
    if ((v3 & 0x80000000) != 0)
    {
      v4 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = __error();
        v6 = strerror(*v5);
        *(_DWORD *)buf = 138543618;
        v9 = v2;
        v10 = 2080;
        v11 = v6;
        _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Error opening keep alive file at path: %{public}@, error: %s", buf, 0x16u);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_setNebuladKeepAliveFileDescriptor:", v3);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)stopKeepAliveForIdentifier:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[CAMNebulaKeepAliveController _syncQueue](self, "_syncQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__CAMNebulaKeepAliveController_stopKeepAliveForIdentifier___block_invoke;
    block[3] = &unk_1EA328A40;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

void __59__CAMNebulaKeepAliveController_stopKeepAliveForIdentifier___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "_nebuladKeepAliveFileDescriptor");
    objc_msgSend(*(id *)(a1 + 32), "_setNebuladKeepAliveFileDescriptor:", 0xFFFFFFFFLL);
    objc_msgSend(*(id *)(a1 + 32), "_keepAliveFilePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    flock(v2, 8);
    close(v2);
    v4 = objc_retainAutorelease(v3);
    unlink((const char *)objc_msgSend(v4, "fileSystemRepresentation"));

  }
}

- (void)removeKeepAliveFileIfNotKeptForAnyIdentifiers
{
  NSObject *v3;
  _QWORD block[5];

  -[CAMNebulaKeepAliveController _syncQueue](self, "_syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CAMNebulaKeepAliveController_removeKeepAliveFileIfNotKeptForAnyIdentifiers__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __77__CAMNebulaKeepAliveController_removeKeepAliveFileIfNotKeptForAnyIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setNebuladKeepAliveFileDescriptor:", 0xFFFFFFFFLL);
    objc_msgSend(*(id *)(a1 + 32), "_keepAliveFilePath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      v6 = objc_msgSend(v5, "removeItemAtPath:error:", v2, &v9);
      v7 = v9;

      if ((v6 & 1) == 0)
      {
        v8 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v11 = v2;
          v12 = 2114;
          v13 = v7;
          _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Error removing keep alive file at path: %{public}@, error: %{public}@", buf, 0x16u);
        }

      }
    }

  }
}

- (OS_dispatch_queue)_syncQueue
{
  return self->__syncQueue;
}

- (int)_nebuladKeepAliveFileDescriptor
{
  return self->__nebuladKeepAliveFileDescriptor;
}

- (void)_setNebuladKeepAliveFileDescriptor:(int)a3
{
  self->__nebuladKeepAliveFileDescriptor = a3;
}

- (NSMutableSet)_nebuladKeepAliveIdentifiers
{
  return self->__nebuladKeepAliveIdentifiers;
}

- (BOOL)_didCreateKeepAliveDirectory
{
  return self->__didCreateKeepAliveDirectory;
}

- (void)_setDidCreateKeepAliveDirectory:(BOOL)a3
{
  self->__didCreateKeepAliveDirectory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__nebuladKeepAliveIdentifiers, 0);
  objc_storeStrong((id *)&self->__syncQueue, 0);
}

@end
