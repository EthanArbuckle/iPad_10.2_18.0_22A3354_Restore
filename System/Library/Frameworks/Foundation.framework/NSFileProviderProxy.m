@implementation NSFileProviderProxy

- (void)provideLogicalURLForURL:(id)a3 completionHandler:(id)a4
{
  void *v6;
  NSURLPromisePair *v7;
  NSURLPromisePair *v8;

  if (_CFURLIsItemPromiseAtURL())
  {
    v6 = (void *)_CFURLCopyLogicalURLOfPromiseAtURL();
    if (!v6)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", v6);
  }
  else
  {
    v7 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", a3, 0);
  }
  v8 = v7;
LABEL_7:
  (*((void (**)(id, NSURLPromisePair *))a4 + 2))(a4, v8);
}

- (NSFileProviderProxy)initWithClient:(id)a3 remoteProvider:(id)a4 reactorID:(id)a5 secureID:(id)a6 uniqueID:(id)a7
{
  NSFileProviderProxy *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSFileProviderProxy;
  v10 = -[NSFileReactorProxy initWithClient:reactorID:](&v12, sel_initWithClient_reactorID_, a3, a5);
  if (v10)
  {
    v10->_remoteProvider = (NSFileProviderXPCInterface *)a4;
    v10->_uniqueID = (NSUUID *)objc_msgSend(a7, "copy");
    v10->_secureID = (NSString *)objc_msgSend(a6, "copy");
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderProxy;
  -[NSFileReactorProxy dealloc](&v3, sel_dealloc);
}

- (id)_clientProxy
{
  return self->_remoteProvider;
}

- (void)setItemLocation:(id)a3
{
  NSFileAccessNode *itemLocation;
  NSObject *v6;
  NSFileProviderProxy *v7;
  uint64_t v8;
  _QWORD v9[5];
  uint8_t buf[8];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  itemLocation = self->super._itemLocation;
  if (a3 && itemLocation)
  {
    v6 = _NSFCProviderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1817D9000, v6, OS_LOG_TYPE_DEFAULT, "[NSFileProviderProxy setItemLocation:] was invoked for a provider proxy that already has a location. Ignoring it.", buf, 2u);
    }
  }
  else
  {
    if (itemLocation)
      -[NSFileAccessNode forEachPresenterOfItemOrContainedItemPerformProcedure:](itemLocation, "forEachPresenterOfItemOrContainedItemPerformProcedure:", &__block_literal_global_186);
    v7 = self;
    -[NSFileAccessNode removeProvider:](self->super._itemLocation, "removeProvider:", self);
    if (objc_msgSend(a3, "setProvider:", self))
    {
      v8 = MEMORY[0x1E0C809B0];
      self->super._itemLocation = (NSFileAccessNode *)a3;
      v9[0] = v8;
      v9[1] = 3221225472;
      v9[2] = __39__NSFileProviderProxy_setItemLocation___block_invoke_2;
      v9[3] = &unk_1E0F540A0;
      v9[4] = self;
      objc_msgSend(a3, "forEachPresenterOfItemOrContainedItemPerformProcedure:", v9);
    }
    else
    {
      self->super._itemLocation = 0;
    }

  }
}

uint64_t __39__NSFileProviderProxy_setItemLocation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "observeNewProvider:", 0);
}

uint64_t __39__NSFileProviderProxy_setItemLocation___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "observePresentationChangeOfKind:withPresenter:url:newURL:", CFSTR("added"), a2, objc_msgSend((id)objc_msgSend(a2, "itemLocation"), "url"), 0);
  return objc_msgSend(a2, "observeNewProvider:", *(_QWORD *)(a1 + 32));
}

- (void)forwardUsingProxy:(id)a3
{
  NSFileProviderXPCMessenger *forwardedMessenger;

  forwardedMessenger = self->_forwardedMessenger;
  if (!forwardedMessenger)
  {
    forwardedMessenger = -[NSFileProviderXPCMessenger initWithFileProviderProxy:]([NSFileProviderXPCMessenger alloc], "initWithFileProviderProxy:", self);
    self->_forwardedMessenger = forwardedMessenger;
  }
  objc_msgSend(a3, "addProvider:withID:uniqueID:forProvidedItemsURL:options:withServer:reply:", forwardedMessenger, self->super._reactorID, self->_uniqueID, -[NSFileAccessNode url](self->super._itemLocation, "url"), 0, 0, &__block_literal_global_189);
}

- (void)invalidate
{
  -[NSFileProviderXPCMessenger invalidate](self->_forwardedMessenger, "invalidate");

  self->_forwardedMessenger = 0;
}

- (BOOL)allowedForURL:(id)a3
{
  id v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id reactorID;
  int v11;
  uint64_t v12;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  _BYTE buf[32];
  __int128 v18;
  __int128 v19;
  _BYTE v20[24];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isFileURL") & 1) != 0)
  {
    *(_QWORD *)v20 = 0;
    *(_QWORD *)&v20[8] = v20;
    *(_QWORD *)&v20[16] = 0x2020000000;
    v21 = 0;
    v18 = 0u;
    v19 = 0u;
    v5 = -[NSFileReactorProxy client](self, "client");
    if (v5)
    {
      objc_msgSend(v5, "auditToken");
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
    }
    v8 = +[NSFileAccessArbiter entitlementForConnection:key:](NSFileAccessArbiter, "entitlementForConnection:key:", -[NSFileReactorProxy client](self, "client"), CFSTR("application-identifier"));
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.bird")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.fileprovider.fileproviderd")) & 1) != 0
      || (*(_OWORD *)buf = v18, *(_OWORD *)&buf[16] = v19, !sandbox_check_by_audit_token()))
    {
      *(_BYTE *)(*(_QWORD *)&v20[8] + 24) = 1;
    }
    else
    {
      v14[1] = 3221225472;
      v15 = v18;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[2] = __37__NSFileProviderProxy_allowedForURL___block_invoke;
      v14[3] = &unk_1E0F547A0;
      v16 = v19;
      v14[4] = v20;
      +[NSFileReactorProxy _enumerateParentDirectoriesStartingAtURL:usingBlock:](NSFileReactorProxy, "_enumerateParentDirectoriesStartingAtURL:usingBlock:", a3, v14);
      if (!*(_BYTE *)(*(_QWORD *)&v20[8] + 24))
      {
        v9 = _NSFCPresenterLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          reactorID = self->super._reactorID;
          v11 = objc_msgSend(-[NSFileReactorProxy client](self, "client"), "processIdentifier");
          v12 = objc_msgSend(a3, "path");
          *(_DWORD *)buf = 138543875;
          *(_QWORD *)&buf[4] = reactorID;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v11;
          *(_WORD *)&buf[18] = 2113;
          *(_QWORD *)&buf[20] = v12;
          _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEFAULT, "Registering provider %{public}@ disallowed. Process %d is not allowed to access the requested path or any of its parent directories: %{private}@", buf, 0x1Cu);
        }
      }
    }
    v7 = *(_BYTE *)(*(_QWORD *)&v20[8] + 24) != 0;
    _Block_object_dispose(v20, 8);
  }
  else
  {
    v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v20 = 138543619;
      *(_QWORD *)&v20[4] = self;
      *(_WORD *)&v20[12] = 2113;
      *(_QWORD *)&v20[14] = a3;
      _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "Registering provider %{public}@ disallowed. Only file URLs are allowed, unlike this one: %{private}@", v20, 0x16u);
    }
    return 0;
  }
  return v7;
}

uint64_t __37__NSFileProviderProxy_allowedForURL___block_invoke(uint64_t a1, void *a2, char *a3)
{
  char v6;
  uint64_t result;
  uint64_t v8;

  v8 = objc_msgSend(a2, "fileSystemRepresentation");
  v6 = 1;
  result = sandbox_check_by_audit_token();
  if ((_DWORD)result)
  {
    result = objc_msgSend(a2, "checkResourceIsReachableAndReturnError:", 0, v8);
    v6 = result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  *a3 = v6;
  return result;
}

- (id)provideItemAtURL:(id)a3 withOptions:(unint64_t)a4 forAccessClaim:(id)a5 completionHandler:(id)a6
{
  uint64_t v11;
  void *v12;
  NSFileProvidingInfo *v13;
  NSObject *v14;
  uint64_t v15;
  id reactorID;
  NSFileProviderXPCInterface *remoteProvider;
  uint64_t v18;
  _QWORD v20[7];
  _QWORD v21[7];
  _QWORD v22[6];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  _OWORD v27[2];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a5, "claimID");
  v12 = (void *)objc_msgSend(a5, "client");
  if (v12)
    objc_msgSend(v12, "auditToken");
  else
    memset(v27, 0, sizeof(v27));
  v13 = +[NSFileProvidingInfo infoWithReaderID:options:auditToken:kernelMaterializationInfo:](NSFileProvidingInfo, "infoWithReaderID:options:auditToken:kernelMaterializationInfo:", v11, a4, v27, 0);
  v14 = _NSFCProviderLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(a5, "claimID");
    reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543618;
    v24 = v15;
    v25 = 2114;
    v26 = reactorID;
    _os_log_impl(&dword_1817D9000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ asking provider %{public}@ to provide", buf, 0x16u);
  }
  remoteProvider = self->_remoteProvider;
  v18 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke;
  v22[3] = &unk_1E0F54940;
  v22[4] = a3;
  v22[5] = a6;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_202;
  v21[3] = &unk_1E0F54968;
  v21[4] = self;
  v21[5] = a5;
  v21[6] = a6;
  objc_msgSend((id)-[NSFileProviderXPCInterface remoteObjectProxyWithErrorHandler:](remoteProvider, "remoteObjectProxyWithErrorHandler:", v22), "provideItemAtURL:withInfo:completionHandler:", a3, v13, v21);
  v20[0] = v18;
  v20[1] = 3221225472;
  v20[2] = __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_204;
  v20[3] = &unk_1E0F51588;
  v20[4] = a5;
  v20[5] = self;
  v20[6] = a3;
  return (id)objc_msgSend(v20, "copy");
}

uint64_t __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  NSFileProvidingResponse *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543618;
    v9 = CFSTR("provide");
    v10 = 2114;
    v11 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = +[NSFileProvidingResponse responseWithError:](NSFileProvidingResponse, "responseWithError:", _NSErrorWithFilePath(256, *(_QWORD *)(a1 + 32)));
  return (*(uint64_t (**)(uint64_t, NSFileProvidingResponse *))(v5 + 16))(v5, v6);
}

uint64_t __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_202(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v4 = objc_msgSend(*(id *)(a1 + 40), "claimID");
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ finished providing for %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_204(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "claimID");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled providing by %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "cancelProvidingItemAtURL:forClaimWithID:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "claimID"));
}

- (id)provideItemForKernelRequestWithInfo:(id)a3 atURL:(id)a4 forProcess:(id *)a5 withOptions:(unint64_t)a6 completionHandler:(id)a7
{
  NSString *v13;
  __int128 v14;
  NSFileProvidingInfo *v15;
  NSObject *v16;
  id reactorID;
  NSFileProviderXPCInterface *remoteProvider;
  uint64_t v19;
  _QWORD v21[7];
  _QWORD v22[6];
  _QWORD v23[5];
  _BYTE buf[32];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v13 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v14 = *(_OWORD *)&a5->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a5->var0;
  *(_OWORD *)&buf[16] = v14;
  v15 = +[NSFileProvidingInfo infoWithReaderID:options:auditToken:kernelMaterializationInfo:](NSFileProvidingInfo, "infoWithReaderID:options:auditToken:kernelMaterializationInfo:", v13, a6, buf, a3);
  v16 = _NSFCProviderLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543619;
    *(_QWORD *)&buf[4] = reactorID;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = a4;
    _os_log_impl(&dword_1817D9000, v16, OS_LOG_TYPE_DEFAULT, "Kernel asking provider %{public}@ to provide %{private}@", buf, 0x16u);
  }
  remoteProvider = self->_remoteProvider;
  v19 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke;
  v23[3] = &unk_1E0F4E088;
  v23[4] = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_206;
  v22[3] = &unk_1E0F54990;
  v22[4] = self;
  v22[5] = a7;
  objc_msgSend((id)-[NSFileProviderXPCInterface remoteObjectProxyWithErrorHandler:](remoteProvider, "remoteObjectProxyWithErrorHandler:", v23), "provideItemAtURL:withInfo:completionHandler:", a4, v15, v22);
  v21[0] = v19;
  v21[1] = 3221225472;
  v21[2] = __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_207;
  v21[3] = &unk_1E0F51588;
  v21[4] = v13;
  v21[5] = self;
  v21[6] = a4;
  return (id)objc_msgSend(v21, "copy");
}

uint64_t __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
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

uint64_t __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_206(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ finished providing for kernel", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_207(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = *(_QWORD *)(a1[5] + 16);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled providing by %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(a1[5] + 56), "cancelProvidingItemAtURL:forClaimWithID:", a1[6], a1[4]);
}

- (void)providePhysicalURLForURL:(id)a3 completionHandler:(id)a4
{
  NSObject *v7;
  id reactorID;
  NSFileProviderXPCInterface *remoteProvider;
  _QWORD v10[6];
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCProviderLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543362;
    v13 = reactorID;
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEFAULT, "Asking provider %{public}@ to provide physical URL", buf, 0xCu);
  }
  remoteProvider = self->_remoteProvider;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke;
  v11[3] = &unk_1E0F4E088;
  v11[4] = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke_210;
  v10[3] = &unk_1E0F535A0;
  v10[4] = self;
  v10[5] = a4;
  objc_msgSend((id)-[NSFileProviderXPCInterface remoteObjectProxyWithErrorHandler:](remoteProvider, "remoteObjectProxyWithErrorHandler:", v11), "providePhysicalItemForURL:completionHandler:", a3, v10);
}

uint64_t __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
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
    v7 = CFSTR("providePhysical");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke_210(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ finished providing physical URL", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)observePresentationChangeOfKind:(id)a3 withPresenter:(id)a4 url:(id)a5 newURL:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSFileProviderPresenterInfo *v14;
  NSFileProviderPresenterInfo *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("added")))
    v11 = objc_msgSend(a4, "observedUbiquityAttributes");
  else
    v11 = 0;
  v12 = objc_msgSend(a4, "reactorID");
  v13 = (void *)objc_msgSend(a4, "client");
  if (v13)
  {
    objc_msgSend(v13, "auditToken");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  v14 = +[NSFileProviderPresenterInfo infoWithPresenterID:auditToken:observedUbiquityAttributes:](NSFileProviderPresenterInfo, "infoWithPresenterID:auditToken:observedUbiquityAttributes:", v12, &v16, v11);
  v15 = v14;
  if (a6)
    -[NSFileProviderPresenterInfo setChangedURL:](v14, "setChangedURL:", a6);
  -[NSFileProviderXPCInterface observePresentationChangeOfKind:forPresenterOfURL:withInfo:](self->_remoteProvider, "observePresentationChangeOfKind:forPresenterOfURL:withInfo:", a3, a5, v15, v16, v17);
}

- (void)observeEndOfWriteAtLocation:(id)a3 forAccessClaim:(id)a4
{
  if (self->_wantsWriteNotifications
    && (objc_msgSend((id)objc_msgSend(a4, "purposeID"), "isEqual:", self->super._reactorID) & 1) == 0)
  {
    -[NSFileProviderXPCInterface observeEndOfWriteAtURL:forClaimWithID:fromProcessWithIdentifier:](self->_remoteProvider, "observeEndOfWriteAtURL:forClaimWithID:fromProcessWithIdentifier:", objc_msgSend(a3, "standardizedURL"), objc_msgSend(a4, "claimID"), objc_msgSend(a4, "clientProcessIdentifier"));
  }
}

- (void)movingItemAtURL:(id)a3 requiresProvidingWithDestinationDirectoryURL:(id)a4 newFileName:(id)a5 completionHandler:(id)a6
{
  NSFileProviderMovingInfo *v10;
  NSObject *v11;
  id reactorID;
  NSFileProviderXPCInterface *remoteProvider;
  _QWORD v14[6];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = +[NSFileProviderMovingInfo infoWithDestinationDirectoryURL:](NSFileProviderMovingInfo, "infoWithDestinationDirectoryURL:", a4);
  v11 = _NSFCProviderLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543362;
    v16 = reactorID;
    _os_log_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEFAULT, "Asking provider %{public}@ if moving item within its container requires providing", buf, 0xCu);
  }
  remoteProvider = self->_remoteProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __114__NSFileProviderProxy_movingItemAtURL_requiresProvidingWithDestinationDirectoryURL_newFileName_completionHandler___block_invoke;
  v14[3] = &unk_1E0F549B8;
  v14[4] = self;
  v14[5] = a6;
  -[NSFileProviderXPCInterface movingItemAtURL:withInfo:fileName:completionHandler:](remoteProvider, "movingItemAtURL:withInfo:fileName:completionHandler:", a3, v10, a5, v14);
}

uint64_t __114__NSFileProviderProxy_movingItemAtURL_requiresProvidingWithDestinationDirectoryURL_newFileName_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = a2;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ responded to moving check: %@", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSString)secureID
{
  return self->_secureID;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSFileProviderXPCInterface)remoteProvider
{
  return self->_remoteProvider;
}

- (BOOL)wantsWriteNotifications
{
  return self->_wantsWriteNotifications;
}

- (void)setWantsWriteNotifications:(BOOL)a3
{
  self->_wantsWriteNotifications = a3;
}

@end
