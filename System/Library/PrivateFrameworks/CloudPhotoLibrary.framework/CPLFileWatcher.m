@implementation CPLFileWatcher

- (CPLFileWatcher)initWithFileURL:(id)a3 name:(id)a4 ownerIdentifier:(id)a5 delegate:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CPLFileWatcher *v17;
  uint64_t v18;
  NSURL *fileURL;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  NSString *ownerIdentifier;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CPLFileWatcher;
  v17 = -[CPLFileWatcher init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    fileURL = v17->_fileURL;
    v17->_fileURL = (NSURL *)v18;

    objc_storeWeak((id *)&v17->_delegate, v15);
    objc_storeStrong((id *)&v17->_queue, a7);
    v20 = objc_msgSend(v13, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    ownerIdentifier = v17->_ownerIdentifier;
    v17->_ownerIdentifier = (NSString *)v22;

  }
  return v17;
}

- (CPLFileWatcher)initWithFileURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  return -[CPLFileWatcher initWithFileURL:name:ownerIdentifier:delegate:queue:](self, "initWithFileURL:name:ownerIdentifier:delegate:queue:", a3, CFSTR("unknown"), CFSTR("unknown owner"), a4, a5);
}

- (id)_redactedPath
{
  int has_internal_content;
  NSURL *fileURL;
  void *v5;
  void *v6;

  has_internal_content = os_variant_has_internal_content();
  fileURL = self->_fileURL;
  if (has_internal_content)
  {
    -[NSURL path](fileURL, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAbbreviatingWithTildeInPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSURL lastPathComponent](fileURL, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_forceRefreshWatchingNode
{
  NSObject *v3;
  void *v4;
  id WeakRetained;
  id v6;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_nodeSource)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Node source should not be nil here", (uint8_t *)&v11, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLFileWatcher.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 52, CFSTR("Node source should not be nil here"));

    abort();
  }
  -[CPLFileWatcher _stopWatchingNode](self, "_stopWatchingNode");
  -[CPLFileWatcher _startWatchingNode](self, "_startWatchingNode");
  if (!self->_nodeSource)
  {
    if (!_CPLSilentLogging)
    {
      __CPLFileWatcherOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        -[NSURL path](self->_fileURL, "path");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v11 = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = WeakRetained;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "%@ has been deleted - informing %@", (uint8_t *)&v11, 0x16u);

      }
    }
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "fileWatcherFileDidDisappear:", self);

  }
}

- (void)_startWatchingNode
{
  int v3;
  unsigned int v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *nodeSource;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  unsigned int v15;
  _QWORD handler[5];
  stat v17;

  if (self->_nodeSource)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17.st_dev) = 0;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Node source should be nil here", (uint8_t *)&v17, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLFileWatcher.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 64, CFSTR("Node source should be nil here"));

    abort();
  }
  v3 = open(-[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation"), 0x8000);
  if ((v3 & 0x80000000) == 0)
  {
    v4 = v3;
    memset(&v17, 0, sizeof(v17));
    if (fstat(v3, &v17) == -1)
    {
      close(v4);
    }
    else
    {
      self->_nodeInode = v17.st_ino;
      v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DE8], v4, 1uLL, (dispatch_queue_t)self->_queue);
      nodeSource = self->_nodeSource;
      self->_nodeSource = v5;

      v7 = MEMORY[0x1E0C809B0];
      v8 = self->_nodeSource;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __36__CPLFileWatcher__startWatchingNode__block_invoke;
      handler[3] = &unk_1E60D65B8;
      handler[4] = self;
      dispatch_source_set_event_handler(v8, handler);
      v9 = self->_nodeSource;
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __36__CPLFileWatcher__startWatchingNode__block_invoke_11;
      v14[3] = &__block_descriptor_36_e5_v8__0l;
      v15 = v4;
      dispatch_source_set_cancel_handler(v9, v14);
      dispatch_resume((dispatch_object_t)self->_nodeSource);
    }
  }
}

- (void)_stopWatchingNode
{
  NSObject *nodeSource;
  OS_dispatch_source *v4;

  nodeSource = self->_nodeSource;
  if (nodeSource)
  {
    dispatch_source_cancel(nodeSource);
    v4 = self->_nodeSource;
    self->_nodeSource = 0;

  }
}

- (void)_updateWatchingNode
{
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSString *ownerIdentifier;
  void *v9;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  stat v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_nodeSource)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v16.st_dev) = 0;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Node source should not be nil here", (uint8_t *)&v16, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLFileWatcher.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 102, CFSTR("Node source should not be nil here"));

    abort();
  }
  v3 = open(-[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation"), 0x8000);
  if (v3 == -1)
  {
    -[CPLFileWatcher _forceRefreshWatchingNode](self, "_forceRefreshWatchingNode");
    if (self->_nodeSource && !_CPLSilentLogging)
    {
      __CPLFileWatcherOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        ownerIdentifier = self->_ownerIdentifier;
        -[CPLFileWatcher _redactedPath](self, "_redactedPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16.st_dev = 138543618;
        *(_QWORD *)&v16.st_mode = ownerIdentifier;
        WORD2(v16.st_ino) = 2114;
        *(__darwin_ino64_t *)((char *)&v16.st_ino + 6) = (__darwin_ino64_t)v9;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ has been deleted but immediately recreated", (uint8_t *)&v16, 0x16u);

      }
    }
  }
  else
  {
    v4 = v3;
    memset(&v16, 0, sizeof(v16));
    if (fstat(v3, &v16) == -1 || v16.st_ino != self->_nodeInode)
    {
      if (!_CPLSilentLogging)
      {
        __CPLFileWatcherOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          -[NSURL path](self->_fileURL, "path");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412290;
          v15 = v6;
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "%@ has changed", (uint8_t *)&v14, 0xCu);

        }
      }
      -[CPLFileWatcher _forceRefreshWatchingNode](self, "_forceRefreshWatchingNode");
    }
    close(v4);
  }
}

- (void)_startWatchingParent
{
  id v3;
  unsigned int v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *parentSource;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  unsigned int v15;
  _QWORD handler[5];
  uint8_t buf[16];

  if (self->_parentSource)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Parent source should be nil here", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLFileWatcher.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 122, CFSTR("Parent source should be nil here"));

    abort();
  }
  -[NSURL URLByDeletingLastPathComponent](self->_fileURL, "URLByDeletingLastPathComponent");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0x8000);

  if ((v4 & 0x80000000) == 0)
  {
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DE8], v4, 2uLL, (dispatch_queue_t)self->_queue);
    parentSource = self->_parentSource;
    self->_parentSource = v5;

    v7 = MEMORY[0x1E0C809B0];
    v8 = self->_parentSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __38__CPLFileWatcher__startWatchingParent__block_invoke;
    handler[3] = &unk_1E60D65B8;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    v9 = self->_parentSource;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __38__CPLFileWatcher__startWatchingParent__block_invoke_14;
    v14[3] = &__block_descriptor_36_e5_v8__0l;
    v15 = v4;
    dispatch_source_set_cancel_handler(v9, v14);
    dispatch_resume((dispatch_object_t)self->_parentSource);
  }
}

- (void)_stopWatchingParent
{
  NSObject *parentSource;
  OS_dispatch_source *v4;

  parentSource = self->_parentSource;
  if (parentSource)
  {
    dispatch_source_cancel(parentSource);
    v4 = self->_parentSource;
    self->_parentSource = 0;

  }
}

- (void)startWatching
{
  NSObject *v3;
  NSString *ownerIdentifier;
  void *v5;
  NSString *name;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLFileWatcherOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      ownerIdentifier = self->_ownerIdentifier;
      -[CPLFileWatcher _redactedPath](self, "_redactedPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      *(_DWORD *)buf = 138412802;
      v10 = ownerIdentifier;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = name;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "%@: Starting watching %@ (%@)", buf, 0x20u);

    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CPLFileWatcher_startWatching__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopWatching
{
  NSObject *v3;
  NSString *ownerIdentifier;
  void *v5;
  NSString *name;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLFileWatcherOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      ownerIdentifier = self->_ownerIdentifier;
      -[CPLFileWatcher _redactedPath](self, "_redactedPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      *(_DWORD *)buf = 138412802;
      v10 = ownerIdentifier;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = name;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "%@: Stopping watching %@ (%@)", buf, 0x20u);

    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CPLFileWatcher_stopWatching__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSURL path](self->_fileURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAbbreviatingWithTildeInPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ '%@' for %@>"), v5, self->_name, self->_ownerIdentifier);

  return v6;
}

- (id)redactedDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CPLFileWatcher _redactedPath](self, "_redactedPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ '%@' for %@>"), v4, self->_name, self->_ownerIdentifier);

  return v5;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (CPLFileWatcherDelegate)delegate
{
  return (CPLFileWatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_parentSource, 0);
  objc_storeStrong((id *)&self->_nodeSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

_QWORD *__30__CPLFileWatcher_stopWatching__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    objc_msgSend(result, "_stopWatchingNode");
    result = *(_QWORD **)(a1 + 32);
  }
  if (result[3])
    return (_QWORD *)objc_msgSend(result, "_stopWatchingParent");
  return result;
}

void __31__CPLFileWatcher_startWatching__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[3] && !v2[2])
  {
    objc_msgSend(v2, "_startWatchingParent");
    objc_msgSend(*(id *)(a1 + 32), "_startWatchingNode");
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v3 + 16))
    {
      if (!_CPLSilentLogging)
      {
        __CPLFileWatcherOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "path");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
          *(_DWORD *)buf = 138412546;
          v10 = v5;
          v11 = 2112;
          v12 = WeakRetained;
          _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "%@ exists at launch time - informing %@", buf, 0x16u);

        }
        v3 = *(_QWORD *)(a1 + 32);
      }
      v7 = objc_loadWeakRetained((id *)(v3 + 64));
      objc_msgSend(v7, "fileWatcherFileDidAppear:", *(_QWORD *)(a1 + 32));

    }
    else
    {
      v8 = objc_loadWeakRetained((id *)(v3 + 64));
      objc_msgSend(v8, "fileWatcherFileDidDisappear:", *(_QWORD *)(a1 + 32));

    }
  }
}

void __38__CPLFileWatcher__startWatchingParent__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[3])
  {
    if (v2[2])
    {
      objc_msgSend(v2, "_updateWatchingNode");
    }
    else
    {
      objc_msgSend(v2, "_startWatchingNode");
      v3 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v3 + 16))
      {
        if (!_CPLSilentLogging)
        {
          __CPLFileWatcherOSLogDomain();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            v5 = *(_QWORD **)(a1 + 32);
            v6 = v5[7];
            objc_msgSend(v5, "_redactedPath");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
            v10 = 138543874;
            v11 = v6;
            v12 = 2114;
            v13 = v7;
            v14 = 2112;
            v15 = WeakRetained;
            _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ exists now - informing %@", (uint8_t *)&v10, 0x20u);

          }
          v3 = *(_QWORD *)(a1 + 32);
        }
        v9 = objc_loadWeakRetained((id *)(v3 + 64));
        objc_msgSend(v9, "fileWatcherFileDidAppear:", *(_QWORD *)(a1 + 32));

      }
    }
  }
}

uint64_t __38__CPLFileWatcher__startWatchingParent__block_invoke_14(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __36__CPLFileWatcher__startWatchingNode__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
  {
    objc_msgSend(v2, "_forceRefreshWatchingNode");
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) && _CPLSilentLogging == 0)
    {
      __CPLFileWatcherOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD **)(a1 + 32);
        v6 = v5[7];
        objc_msgSend(v5, "_redactedPath");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543618;
        v9 = v6;
        v10 = 2114;
        v11 = v7;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ has been deleted but immediately recreated", (uint8_t *)&v8, 0x16u);

      }
    }
  }
}

uint64_t __36__CPLFileWatcher__startWatchingNode__block_invoke_11(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

@end
