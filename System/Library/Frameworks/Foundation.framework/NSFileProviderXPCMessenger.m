@implementation NSFileProviderXPCMessenger

- (NSFileProviderXPCMessenger)initWithFileProvider:(id)a3 queue:(id)a4
{
  NSFileProviderXPCMessenger *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSFileProviderXPCMessenger;
  v6 = -[NSFileProviderXPCMessenger init](&v8, sel_init);
  if (v6)
  {
    v6->_fileProvider = (NSFileProvider *)a3;
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }
  return v6;
}

- (NSFileProviderXPCMessenger)initWithFileProviderProxy:(id)a3
{
  NSFileProviderXPCMessenger *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFileProviderXPCMessenger;
  v4 = -[NSFileProviderXPCMessenger init](&v6, sel_init);
  if (v4)
    v4->_fileProviderProxy = (NSFileProviderProxy *)a3;
  return v4;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);

  v4.receiver = self;
  v4.super_class = (Class)NSFileProviderXPCMessenger;
  -[NSFileProviderXPCMessenger dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{

  self->_fileProvider = 0;
  self->_fileProviderProxy = 0;
}

- (void)checkInProviderWithReply:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)_makeProvider:(id)a3 provideItemAtURL:(id)a4 withInfo:(id)a5 completionHandler:(id)a6
{
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD v16[12];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:");
  v12 = objc_msgSend(a5, "readerID");
  v13 = _NSFCProviderLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543875;
    v18 = v11;
    v19 = 2113;
    v20 = objc_msgSend(a4, "path");
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1817D9000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ providing %{private}@ for claim %{public}@", buf, 0x20u);
  }
  v14 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Provide"));
  v15 = (void *)objc_msgSend(a3, "_providedItemsOperationQueue");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke;
  v16[3] = &unk_1E0F54620;
  v16[4] = v11;
  v16[5] = v14;
  v16[6] = a3;
  v16[7] = a4;
  v16[8] = a5;
  v16[9] = self;
  v16[10] = v12;
  v16[11] = a6;
  objc_msgSend(v15, "_fc_addUncancellableOperationForReactorID:block:", v11, v16);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v26 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ began providing", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "didBegin");
  v4 = objc_opt_respondsToSelector();
  v5 = *(void **)(a1 + 48);
  if ((v4 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_635;
    v19[3] = &unk_1E0F53D08;
    v20 = *(_OWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 88);
    v21 = *(_QWORD *)(a1 + 72);
    v22 = v8;
    return objc_msgSend(v5, "_provideItemAtURL:withInfo:completionHandler:", v6, v7, v19);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = *(void **)(a1 + 64);
    if (v10)
    {
      objc_msgSend(v10, "readerAuditToken");
      v11 = DWORD1(v24);
    }
    else
    {
      v11 = 0;
      v23 = 0u;
      v24 = 0u;
    }
    +[NSFileCoordinator _addProcessIdentifier:observedUbiquityAttributes:forID:](NSFileCoordinator, "_addProcessIdentifier:observedUbiquityAttributes:forID:", v11, 0, *(_QWORD *)(a1 + 80));
    +[NSFileCoordinator _setReadingOptions:](NSFileCoordinator, "_setReadingOptions:", objc_msgSend(*(id *)(a1 + 64), "readingOptions"));
    +[NSFileCoordinator _setKernelMaterializationInfo:](NSFileCoordinator, "_setKernelMaterializationInfo:", objc_msgSend(*(id *)(a1 + 64), "kernelMaterializationInfo"));
    objc_msgSend(*(id *)(a1 + 48), "_provideItemAtURL:toReaderWithID:completionHandler:", *(_QWORD *)(a1 + 56));
    +[NSFileCoordinator _setReadingOptions:](NSFileCoordinator, "_setReadingOptions:", 0);
    return +[NSFileCoordinator _setKernelMaterializationInfo:](NSFileCoordinator, "_setKernelMaterializationInfo:", 0);
  }
  else
  {
    v12 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_2_641;
    v15[3] = &unk_1E0F54418;
    v16 = *(_OWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 88);
    v17 = *(_QWORD *)(a1 + 72);
    v18 = v14;
    return objc_msgSend(v12, "_provideItemAtURL:completionHandler:", v13, v15);
  }
}

void __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_635(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished providing", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_636;
  block[3] = &unk_1E0F54378;
  block[1] = 3221225472;
  v8 = *(_QWORD *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_636(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  NSFileProvidingResponse *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished providing", buf, 0xCu);
  }
  +[NSFileCoordinator _removeInfoForID:](NSFileCoordinator, "_removeInfoForID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "willEnd");
  v6 = +[NSFileProvidingResponse responseWithError:](NSFileProvidingResponse, "responseWithError:", a2);
  -[NSFileProvidingResponse setProvidedItemRecursiveGenerationCount:](v6, "setProvidedItemRecursiveGenerationCount:", +[NSFileCoordinator _providedItemGenerationCount](NSFileCoordinator, "_providedItemGenerationCount"));
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_640;
  block[3] = &unk_1E0F54378;
  block[1] = 3221225472;
  v9 = *(_QWORD *)(a1 + 64);
  block[5] = v6;
  block[6] = v9;
  block[4] = v7;
  dispatch_async(v8, block);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_640(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_2_641(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished providing", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_642;
  block[3] = &unk_1E0F54378;
  block[1] = 3221225472;
  v8 = *(_QWORD *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_642(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(_QWORD, NSFileProvidingResponse *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), +[NSFileProvidingResponse responseWithError:](NSFileProvidingResponse, "responseWithError:", *(_QWORD *)(a1 + 40)));
}

- (void)provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  NSFileProvider *fileProvider;
  NSFileProviderProxy *fileProviderProxy;
  NSFileProviderXPCInterface *v10;
  _QWORD v11[5];
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  fileProvider = self->_fileProvider;
  if (fileProvider)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke;
    v12[3] = &unk_1E0F53D08;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    v12[7] = a5;
    -[NSFileProviderXPCMessenger _makeProvider:provideItemAtURL:withInfo:completionHandler:](self, "_makeProvider:provideItemAtURL:withInfo:completionHandler:", fileProvider, a3, a4, v12);
  }
  else
  {
    fileProviderProxy = self->_fileProviderProxy;
    if (fileProviderProxy)
    {
      v10 = -[NSFileProviderProxy remoteProvider](fileProviderProxy, "remoteProvider");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_3;
      v11[3] = &unk_1E0F4E088;
      v11[4] = a5;
      objc_msgSend((id)-[NSFileProviderXPCInterface remoteObjectProxyWithErrorHandler:](v10, "remoteObjectProxyWithErrorHandler:", v11), "provideItemAtURL:withInfo:completionHandler:", a3, a4, a5);
    }
    else
    {
      (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
    }
  }
}

uint64_t __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke(uint64_t a1, NSFileProvidingResponse *a2)
{
  objc_class *v4;
  char *v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  if (-[NSString hasSuffix:](NSStringFromClass(v4), "hasSuffix:", CFSTR("TiWorkFileProvider"))
    && !-[NSFileProvidingResponse error](a2, "error"))
  {
    v5 = (char *)objc_msgSend(*(id *)(a1 + 40), "fileSystemRepresentation");
    if (v5)
    {
      v8 = *(void **)(a1 + 48);
      if (v8)
      {
        objc_msgSend(v8, "readerAuditToken");
      }
      else
      {
        v11 = 0u;
        v12 = 0u;
      }
      v9 = sandbox_extension_issue_file_to_process();
      v5 = (char *)v9;
      if (a2 || !v9)
      {
        if (!v9)
          goto LABEL_4;
      }
      else
      {
        a2 = objc_alloc_init(NSFileProvidingResponse);
      }
      -[NSFileProvidingResponse setSandboxToken:](a2, "setSandboxToken:", -[NSFileManager stringWithFileSystemRepresentation:length:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "stringWithFileSystemRepresentation:length:", v5, strlen(v5)));
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_4:
  free(v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_2;
  v10[3] = &unk_1E0F4E060;
  v6 = *(_QWORD *)(a1 + 56);
  v10[4] = a2;
  v10[5] = v6;
  return +[NSFileCoordinator _performBarrierAsync:](NSFileCoordinator, "_performBarrierAsync:", v10);
}

uint64_t __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = CFSTR("provide");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(_QWORD, NSFileProvidingResponse *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSFileProvidingResponse responseWithError:](NSFileProvidingResponse, "responseWithError:", a2));
}

- (void)cancelProvidingItemAtURL:(id)a3 forClaimWithID:(id)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[8];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_fileProvider)
  {
    v7 = _NSFCProviderLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = a4;
      _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling providing for claim %{public}@", buf, 0xCu);
    }
    v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", self->_fileProvider, CFSTR("Provide"));
    v9 = (void *)-[NSFileProvider _providedItemsOperationQueue](self->_fileProvider, "_providedItemsOperationQueue");
    v10 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", self->_fileProvider);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__NSFileProviderXPCMessenger_cancelProvidingItemAtURL_forClaimWithID___block_invoke;
    v11[3] = &unk_1E0F54200;
    v11[4] = v8;
    v11[5] = self;
    v11[6] = a3;
    v11[7] = a4;
    objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v10, v11);
  }
}

uint64_t __70__NSFileProviderXPCMessenger_cancelProvidingItemAtURL_forClaimWithID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "_cancelProvidingItemAtURL:toReaderWithID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

- (void)providePhysicalItemForURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[8];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_fileProvider)
  {
    v7 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:");
    v8 = _NSFCProviderLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ providing physical URL", buf, 0xCu);
    }
    v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", self->_fileProvider, CFSTR("Provide Physical URL"));
    v10 = (void *)-[NSFileProvider _providedItemsOperationQueue](self->_fileProvider, "_providedItemsOperationQueue");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke;
    v11[3] = &unk_1E0F54648;
    v11[4] = v9;
    v11[5] = self;
    v11[6] = a3;
    v11[7] = a4;
    objc_msgSend(v10, "_fc_addUncancellableOperationForReactorID:block:", v7, v11);
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

void __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[7];
  uint64_t block;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_2;
  v8[3] = &unk_1E0F53640;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[4] = v3;
  v8[5] = v4;
  v5 = *(_QWORD *)(a1 + 56);
  v8[6] = v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "_physicalURLForURL:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "willEnd");
    v7 = *(NSObject **)(v4 + 16);
    block = v2;
    v10 = 3221225472;
    v11 = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_3;
    v12 = &unk_1E0F54378;
    v14 = v6;
    v15 = v5;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "_getPhysicalURLForURL:completionHandler:", *(_QWORD *)(a1 + 48), v8);
      return;
    }
    objc_msgSend(v3, "willEnd");
    v7 = *(NSObject **)(v4 + 16);
    block = v2;
    v10 = 3221225472;
    v11 = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_3;
    v12 = &unk_1E0F54378;
    v14 = 0;
    v15 = v5;
  }
  v13 = v3;
  dispatch_async(v7, &block);
}

void __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "willEnd");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_3;
  v7[3] = &unk_1E0F54378;
  v7[1] = 3221225472;
  v6 = *(_QWORD *)(a1 + 48);
  v7[5] = a2;
  v7[6] = v6;
  v7[4] = v4;
  dispatch_async(v5, v7);
}

uint64_t __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_3(uint64_t a1)
{
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_4;
  v3[3] = &unk_1E0F4E060;
  v4 = *(_OWORD *)(a1 + 40);
  return +[NSFileCoordinator _performBarrierAsync:](NSFileCoordinator, "_performBarrierAsync:", v3);
}

uint64_t __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)observePresentationChangeOfKind:(id)a3 forPresenterOfURL:(id)a4 withInfo:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[11];

  v13[10] = *MEMORY[0x1E0C80C00];
  if (self->_fileProvider)
  {
    v9 = -[NSProcessInfo beginActivityWithOptions:reason:](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "beginActivityWithOptions:reason:", 0x80000000000, CFSTR("Sending an NSFileProvider an observePresentationChangeOfKind: message"));
    v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", self->_fileProvider, CFSTR("Observe Presentation Change"));
    v11 = (void *)-[NSFileProvider _providedItemsOperationQueue](self->_fileProvider, "_providedItemsOperationQueue");
    v12 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", self->_fileProvider);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke;
    v13[3] = &unk_1E0F54228;
    v13[4] = v10;
    v13[5] = a3;
    v13[6] = self;
    v13[7] = a4;
    v13[8] = a5;
    v13[9] = v9;
    objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v12, v13);
  }
}

void __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[6];
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("added")))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "_providedItemAtURL:didGainPresenterWithInfo:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = *(void **)(a1 + 64);
      if (v2)
      {
        objc_msgSend(v2, "presenterAuditToken");
        v3 = DWORD1(v8);
        v2 = *(void **)(a1 + 64);
      }
      else
      {
        v3 = 0;
        v7 = 0u;
        v8 = 0u;
      }
      +[NSFileCoordinator _addProcessIdentifier:observedUbiquityAttributes:forID:](NSFileCoordinator, "_addProcessIdentifier:observedUbiquityAttributes:forID:", v3, objc_msgSend(v2, "observedUbiquityAttributes"), objc_msgSend(*(id *)(a1 + 64), "presenterID"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "_providedItemAtURL:didGainPresenterWithID:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 64), "presenterID"));
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("removed")))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "_providedItemAtURL:didLosePresenterWithID:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 64), "presenterID"));
    +[NSFileCoordinator _removeInfoForID:](NSFileCoordinator, "_removeInfoForID:", objc_msgSend(*(id *)(a1 + 64), "presenterID"));
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("itemMoved"))
         && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "_providedItemAtURL:withPresenterWithID:didMoveToURL:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 64), "presenterID"), objc_msgSend(*(id *)(a1 + 64), "changedURL"));
  }
  objc_msgSend(*(id *)(a1 + 32), "willEnd");
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke_2;
  v6[3] = &unk_1E0F4C650;
  v5 = *(_QWORD *)(a1 + 72);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v5;
  dispatch_async(v4, v6);
}

uint64_t __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return -[NSProcessInfo endActivity:](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "endActivity:", *(_QWORD *)(a1 + 40));
}

- (void)observeEndOfWriteAtURL:(id)a3 forClaimWithID:(id)a4 fromProcessWithIdentifier:(int)a5
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[8];
  int v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_fileProvider)
  {
    v9 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:");
    v10 = _NSFCProviderLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = v9;
      v17 = 2114;
      v18 = a4;
      _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ observing end of writing claim %{public}@", buf, 0x16u);
    }
    v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", self->_fileProvider, CFSTR("Observe End Of Write"));
    v12 = (void *)-[NSFileProvider _providedItemsOperationQueue](self->_fileProvider, "_providedItemsOperationQueue");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __94__NSFileProviderXPCMessenger_observeEndOfWriteAtURL_forClaimWithID_fromProcessWithIdentifier___block_invoke;
    v13[3] = &unk_1E0F54670;
    v13[4] = v11;
    v13[5] = self;
    v14 = a5;
    v13[6] = a4;
    v13[7] = a3;
    objc_msgSend(v12, "_fc_addUncancellableOperationForReactorID:block:", v9, v13);
  }
}

uint64_t __94__NSFileProviderXPCMessenger_observeEndOfWriteAtURL_forClaimWithID_fromProcessWithIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[NSFileCoordinator _addProcessIdentifier:observedUbiquityAttributes:forID:](NSFileCoordinator, "_addProcessIdentifier:observedUbiquityAttributes:forID:", *(unsigned int *)(a1 + 64), 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "_writerWithID:didFinishWritingForURL:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    +[NSFileCoordinator _removeInfoForID:](NSFileCoordinator, "_removeInfoForID:", *(_QWORD *)(a1 + 48));
  }
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 fileName:(id)a5 completionHandler:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[11];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_fileProvider)
  {
    v11 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:");
    v12 = _NSFCProviderLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ checking if moving an item within its container requires providing", buf, 0xCu);
    }
    v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", self->_fileProvider, CFSTR("Check Moving Requires Providing"));
    v14 = (void *)-[NSFileProvider _providedItemsOperationQueue](self->_fileProvider, "_providedItemsOperationQueue");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke;
    v15[3] = &unk_1E0F546C0;
    v15[4] = v13;
    v15[5] = v11;
    v15[9] = a5;
    v15[10] = a6;
    v15[6] = self;
    v15[7] = a3;
    v15[8] = a4;
    objc_msgSend(v14, "_fc_addUncancellableOperationForReactorID:block:", v11, v15);
  }
  else
  {
    (*((void (**)(id, id))a6 + 2))(a6, +[NSFileProviderMovingResponse providingNotRequiredResponseWithSyncRootID:](NSFileProviderMovingResponse, "providingNotRequiredResponseWithSyncRootID:", 0, a4, a5));
  }
}

void __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[4];
  int8x16_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2;
  v8[3] = &unk_1E0F54698;
  v9 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v3 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "_movingItemAtURL:withInfo:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v8);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
    v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "destinationDirectoryURL"), "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(a1 + 72), 0);
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2_679;
    v7[3] = &unk_1E0F53E70;
    v7[4] = v8;
    objc_msgSend(v5, "_movingItemAtURL:requiresProvidingWithDestinationURL:completionHandler:", v4, v6, v7);
  }
  else
  {
    __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2((uint64_t)v8, (uint64_t)+[NSFileProviderMovingResponse providingNotRequiredResponseWithSyncRootID:](NSFileProviderMovingResponse, "providingNotRequiredResponseWithSyncRootID:", 0));
  }
}

void __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = a2;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ responded to moving check with: %@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_674;
  block[3] = &unk_1E0F4DF70;
  block[1] = 3221225472;
  v8 = *(_QWORD *)(a1 + 56);
  block[5] = v6;
  block[6] = v8;
  block[4] = a2;
  dispatch_async(v7, block);
}

uint64_t __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_674(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "didEnd");
}

uint64_t __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2_679(uint64_t a1, int a2)
{
  if (a2)
    +[NSFileProviderMovingResponse providingRequiredResponse](NSFileProviderMovingResponse, "providingRequiredResponse");
  else
    +[NSFileProviderMovingResponse providingNotRequiredResponseWithSyncRootID:](NSFileProviderMovingResponse, "providingNotRequiredResponseWithSyncRootID:", -1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)collectDebuggingInformationWithCompletionHandler:(id)a3
{
  (*((void (**)(id, id))a3 + 2))(a3, +[NSFileAccessArbiterProxy _fileReactorDebuggingInformation](NSFileAccessArbiterProxy, "_fileReactorDebuggingInformation"));
}

@end
