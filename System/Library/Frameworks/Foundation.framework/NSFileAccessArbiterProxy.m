@implementation NSFileAccessArbiterProxy

- (id)grantAccessClaim:(id)a3 synchronouslyIfPossible:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  NSObject *queue;
  _QWORD block[7];

  v4 = a4;
  block[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "prepareClaimForGrantingWithArbiterQueue:", self->_queue);
  if (v4)
    v7 = (void *)objc_msgSend(a3, "claimerWaiter");
  else
    v7 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__NSFileAccessArbiterProxy_grantAccessClaim_synchronouslyIfPossible___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = a3;
  block[5] = self;
  dispatch_async(queue, block);
  return v7;
}

- (void)revokeAccessClaimForID:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NSFileAccessArbiterProxy_revokeAccessClaimForID___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (id)idForFileReactor:(id)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__27;
  v11 = __Block_byref_object_dispose__27;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NSFileAccessArbiterProxy_idForFileReactor___block_invoke;
  block[3] = &unk_1E0F51708;
  block[4] = a3;
  block[5] = &v7;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSFileAccessArbiterProxy)initWithServer:(id)a3 queue:(id)a4
{
  NSFileAccessArbiterProxy *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  _QWORD v10[5];
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSFileAccessArbiterProxy;
  v6 = -[NSFileAccessArbiterProxy init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSXPCConnection *)a3;
    v8 = MEMORY[0x1E0C809B0];
    v6->_server = v7;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __49__NSFileAccessArbiterProxy_initWithServer_queue___block_invoke;
    v10[3] = &unk_1E0F4D2D8;
    v10[4] = v6;
    -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v10);
    -[NSXPCConnection setDelegate:](v6->_server, "setDelegate:", v6);
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }
  return v6;
}

uint64_t __69__NSFileAccessArbiterProxy_grantAccessClaim_synchronouslyIfPossible___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "forwardUsingConnection:crashHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), &__block_literal_global_307_0);
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

uint64_t __45__NSFileAccessArbiterProxy_addFilePresenter___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSNumber *v4;
  uint64_t v5;
  NSOperationQueue *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSFilePresenterXPCMessenger *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 40), v2);
  v3 = objc_msgSend(*(id *)(a1 + 40), "presentedItemURL");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "lastPresentedItemEventIdentifier"));
  else
    v4 = 0;
  v5 = (objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(*(id *)(a1 + 40), "presentedItemNeedsWatching");
  objc_lookUpClass("NSDocument");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 40), "usesMainThreadDuringPresentedItemRelinquishing") & 1) != 0
    || (v6 = (NSOperationQueue *)objc_msgSend(*(id *)(a1 + 40), "presentedItemOperationQueue"),
        v6 == +[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue")))
  {
    v5 |= 2uLL;
  }
  v7 = +[NSFileCoordinator _responsesForPresenter:](NSFileCoordinator, "_responsesForPresenter:", *(_QWORD *)(a1 + 40));
  if ((v7 & 0xFFFFFFFF80010000) == 0)
  {
    v8 = objc_msgSend(MEMORY[0x1E0C99E60], "set");
    goto LABEL_19;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "observedPresentedItemUbiquityAttributes");
LABEL_19:
    v9 = v8;
    goto LABEL_21;
  }
  v9 = 0;
LABEL_21:
  v10 = -[NSFilePresenterXPCMessenger initWithFilePresenter:queue:]([NSFilePresenterXPCMessenger alloc], "initWithFilePresenter:queue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v11)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_msgSend(v11, "setObject:forKey:", v10, v2);

  v12 = _NSFCPresenterLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    v15 = v2;
    v16 = 2113;
    v17 = v3;
    _os_log_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEFAULT, "Adding presenter %{public}@ for URL: %{private}@", buf, 0x16u);
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy"), "addPresenter:withID:fileURL:lastPresentedItemEventIdentifier:ubiquityAttributes:options:responses:", v10, v2, v3, v4, v9, v5, v7);
}

uint64_t __51__NSFileAccessArbiterProxy_revokeAccessClaimForID___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy"), "revokeAccessClaimForID:", *(_QWORD *)(a1 + 40));
}

id __45__NSFileAccessArbiterProxy_idForFileReactor___block_invoke(uint64_t a1)
{
  id result;

  result = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)_idForReactor:(id)a3
{
  void *AssociatedObject;
  const __CFUUID *v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(a3, "_fileReactorID");
  AssociatedObject = objc_getAssociatedObject(a3, "NSFileReactorID");
  if (!AssociatedObject)
  {
    v6 = CFUUIDCreate(0);
    AssociatedObject = (void *)CFUUIDCreateString(0, v6);
    objc_setAssociatedObject(a3, "NSFileReactorID", AssociatedObject, (void *)0x301);

    CFRelease(v6);
  }
  return AssociatedObject;
}

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  void *v6;
  uint64_t v7;

  objc_opt_class();
  v6 = a5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = _secureCodingScreenedError((NSError *)a5);
  v7 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a5, "isMemberOfClass:", v7) & 1) == 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", objc_msgSend(a5, "absoluteString"));
  else
    return v6;
}

- (void)addFilePresenter:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NSFileAccessArbiterProxy_addFilePresenter___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

void __49__NSFileAccessArbiterProxy_initWithServer_queue___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint8_t v16[16];
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_onqueue_filePresenters");
  if (objc_msgSend(v2, "count"))
  {
    v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEFAULT, "Connection to filecoordinationd interrupted. Attempting to re-add presenters", v16, 2u);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(a1 + 32), "addFilePresenter:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        }
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      }
      while (v5);
    }
  }
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "_onqueue_fileProviders");
  if (objc_msgSend(v8, "count"))
  {
    v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
    v10 = _NSFCLog();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEFAULT, "Connection to filecoordinationd interrupted. Client has providers, but not re-adding them because _setAutomaticFileProviderReregistrationDisabled:YES was called.", v16, 2u);
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEFAULT, "Connection to filecoordinationd interrupted. Attempting to re-add providers", v16, 2u);
      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(a1 + 32), "addFileProvider:completionHandler:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), &__block_literal_global_303);
          }
          v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        }
        while (v13);
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  dispatch_release((dispatch_object_t)self->_queue);
  -[NSXPCConnection setDelegate:](self->_server, "setDelegate:", 0);
  -[NSXPCConnection invalidate](self->_server, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)NSFileAccessArbiterProxy;
  -[NSFileAccessArbiterProxy dealloc](&v3, sel_dealloc);
}

uint64_t __69__NSFileAccessArbiterProxy_grantAccessClaim_synchronouslyIfPossible___block_invoke_2()
{
  NSObject *v0;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = _NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1817D9000, v0, OS_LOG_TYPE_ERROR, "A process invoked one of the -[NSFileCoordinator coordinate...] methods but filecoordinationd crashed. Returning an error.", v2, 2u);
  }
  return 1;
}

- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__NSFileAccessArbiterProxy_grantSubarbitrationClaim_withServer___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = a3;
  v5[5] = self;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __64__NSFileAccessArbiterProxy_grantSubarbitrationClaim_withServer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "forwardUsingConnection:withServer:crashHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_QWORD *)(a1 + 48), &__block_literal_global_308);
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

uint64_t __64__NSFileAccessArbiterProxy_grantSubarbitrationClaim_withServer___block_invoke_2()
{
  NSObject *v0;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = _NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1817D9000, v0, OS_LOG_TYPE_ERROR, "A process invoked -[NSFileCoordinator prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAccessor:] but filecoordinationd crashed. Invoking the batchAccessor anyway.", v2, 2u);
  }
  return 0;
}

- (void)revokeSubarbitrationClaimForID:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__NSFileAccessArbiterProxy_revokeSubarbitrationClaimForID___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __59__NSFileAccessArbiterProxy_revokeSubarbitrationClaimForID___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy"), "revokeSubarbitrationClaimForID:", *(_QWORD *)(a1 + 40));
}

- (void)cancelAccessClaimForID:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NSFileAccessArbiterProxy_cancelAccessClaimForID___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __51__NSFileAccessArbiterProxy_cancelAccessClaimForID___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy"), "cancelAccessClaimForID:", *(_QWORD *)(a1 + 40));
}

- (void)writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5
{
  NSObject *queue;
  uint64_t v10;
  _QWORD block[10];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v10 = 0;
  _NSGetFSIDAndFileID((void *)objc_msgSend(a5, "logicalURL"), v12, &v10);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NSFileAccessArbiterProxy_writerWithPurposeID_didMoveItemAtURL_toURL___block_invoke;
  block[3] = &unk_1E0F54758;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = v10;
  block[9] = v12[0];
  dispatch_async(queue, block);
}

uint64_t __71__NSFileAccessArbiterProxy_writerWithPurposeID_didMoveItemAtURL_toURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"), "writerWithPurposeID:didMoveItemAtURL:toURL:withFSID:andFileID:", a1[5], a1[6], a1[7], a1[9], a1[8]);
}

- (void)writerWithPurposeID:(id)a3 didDisconnectItemAtURL:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__NSFileAccessArbiterProxy_writerWithPurposeID_didDisconnectItemAtURL___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __71__NSFileAccessArbiterProxy_writerWithPurposeID_didDisconnectItemAtURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"), "writerWithPurposeID:didDisconnectItemAtURL:", a1[5], a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didReconnectItemAtURL:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__NSFileAccessArbiterProxy_writerWithPurposeID_didReconnectItemAtURL___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __70__NSFileAccessArbiterProxy_writerWithPurposeID_didReconnectItemAtURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"), "writerWithPurposeID:didReconnectItemAtURL:", a1[5], a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityOfItemAtURL:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __77__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"), "writerWithPurposeID:didChangeUbiquityOfItemAtURL:", a1[5], a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didChangeSharingOfItemAtURL:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __76__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"), "writerWithPurposeID:didChangeSharingOfItemAtURL:", a1[5], a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityAttributes:(id)a4 ofItemAtURL:(id)a5
{
  NSObject *queue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke;
  block[3] = &unk_1E0F54200;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  dispatch_async(queue, block);
}

uint64_t __88__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"), "writerWithPurposeID:didChangeUbiquityAttributes:ofItemAtURL:", a1[5], a1[6], a1[7]);
}

- (void)writerWithPurposeID:(id)a3 didMakeItemDisappearAtURL:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__NSFileAccessArbiterProxy_writerWithPurposeID_didMakeItemDisappearAtURL___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __74__NSFileAccessArbiterProxy_writerWithPurposeID_didMakeItemDisappearAtURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"), "writerWithPurposeID:didMakeItemDisappearAtURL:", a1[5], a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didChangeItemAtURL:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeItemAtURL___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __67__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeItemAtURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"), "writerWithPurposeID:didChangeItemAtURL:", a1[5], a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didVersionChangeOfKind:(id)a4 toItemAtURL:(id)a5 withClientID:(id)a6 name:(id)a7
{
  NSObject *queue;
  _QWORD block[11];

  block[10] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__NSFileAccessArbiterProxy_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke;
  block[3] = &unk_1E0F54228;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  block[9] = a7;
  dispatch_async(queue, block);
}

uint64_t __101__NSFileAccessArbiterProxy_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"), "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:", a1[5], a1[6], a1[7], a1[8], a1[9]);
}

- (void)tiePresenterForID:(id)a3 toItemAtURL:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__NSFileAccessArbiterProxy_tiePresenterForID_toItemAtURL___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __58__NSFileAccessArbiterProxy_tiePresenterForID_toItemAtURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"), "tiePresenterForID:toItemAtURL:", a1[5], a1[6]);
}

- (void)removeFilePresenter:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NSFileAccessArbiterProxy_removeFilePresenter___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

uint64_t __48__NSFileAccessArbiterProxy_removeFilePresenter___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", v2);
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", v2), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObjectForKey:", v2);
  objc_msgSend(objc_getAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterReadRelinquishment"), "removeAllBlockingAccessClaimIDs");
  objc_msgSend(objc_getAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterWriteRelinquishment"), "removeAllBlockingAccessClaimIDs");
  objc_setAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterReadRelinquishment", 0, (void *)0x301);
  objc_setAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterWriteRelinquishment", 0, (void *)0x301);
  v3 = _NSFCPresenterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v2;
    _os_log_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEFAULT, "Removing presenter %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "remoteObjectProxy"), "removePresenterWithID:", v2);
}

- (id)_onqueue_filePresenters
{
  return (id)-[NSMutableDictionary allValues](self->_presentersByID, "allValues");
}

- (id)filePresenters
{
  NSObject *queue;
  void *v3;
  id v4;
  void *v5;
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__27;
  v12 = __Block_byref_object_dispose__27;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NSFileAccessArbiterProxy_filePresenters__block_invoke;
  block[3] = &unk_1E0F51708;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(queue, block);
  v3 = (void *)v9[5];
  if (v3)
    v4 = v3;
  else
    v4 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __42__NSFileAccessArbiterProxy_filePresenters__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_onqueue_filePresenters");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)addFileProvider:(id)a3 completionHandler:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke;
  v5[3] = &unk_1E0F53270;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  NSFileProviderXPCMessenger *v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSUUID *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v2 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  v3 = -[NSFileProviderXPCMessenger initWithFileProvider:queue:]([NSFileProviderXPCMessenger alloc], "initWithFileProvider:queue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v4)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = +[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable");
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

  v5 = objc_opt_respondsToSelector();
  v6 = objc_msgSend(*(id *)(a1 + 40), "_providedItemsURL");
  v7 = _NSFCProviderLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    v16 = v2;
    v17 = 2113;
    v18 = v6;
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEFAULT, "Adding provider %{public}@ for URL: %{private}@", buf, 0x16u);
  }
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_329;
  v14[3] = &unk_1E0F4E088;
  v14[4] = *(_QWORD *)(a1 + 48);
  v10 = (void *)objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v14);
  v11 = _uniqueFileProviderID(*(void **)(a1 + 40));
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_332;
  v13[3] = &unk_1E0F53E70;
  v13[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v10, "addProvider:withID:uniqueID:forProvidedItemsURL:options:withServer:reply:", v3, v2, v11, v6, v5 & 1, 0, v13);
}

uint64_t __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_329(uint64_t a1, uint64_t a2)
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
    v7 = CFSTR("addProvider");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_332(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeFileProvider:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NSFileAccessArbiterProxy_removeFileProvider___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = a3;
  block[5] = self;
  dispatch_async(queue, block);
}

uint64_t __47__NSFileAccessArbiterProxy_removeFileProvider___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKey:", *(_QWORD *)(a1 + 32)), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  v3 = _NSFCProviderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v2;
    _os_log_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEFAULT, "Removing provider %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "remoteObjectProxy"), "removeProviderWithID:uniqueID:", v2, _uniqueFileProviderID(*(void **)(a1 + 32)));
}

- (id)_onqueue_fileProviders
{
  return (id)-[NSMutableSet allObjects](self->_providers, "allObjects");
}

- (id)fileProviders
{
  NSObject *queue;
  void *v3;
  id v4;
  void *v5;
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__27;
  v12 = __Block_byref_object_dispose__27;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NSFileAccessArbiterProxy_fileProviders__block_invoke;
  block[3] = &unk_1E0F51708;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(queue, block);
  v3 = (void *)v9[5];
  if (v3)
    v4 = v3;
  else
    v4 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __41__NSFileAccessArbiterProxy_fileProviders__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_onqueue_fileProviders");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)getDebugInfoWithCompletionHandler:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke;
  block[3] = &unk_1E0F50148;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = +[NSFileAccessArbiterProxy _fileReactorDebuggingInformation](NSFileAccessArbiterProxy, "_fileReactorDebuggingInformation");
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E0F4E088;
  v9[4] = v4;
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_335;
  v8[3] = &unk_1E0F54290;
  v8[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v6, "provideDebugInfoWithLocalInfo:completionHandler:", v2, v8);
}

uint64_t __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
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
    v7 = CFSTR("provideDebugInfo");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_335(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a3)
  {
    v4 = _NSOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "This process is unable to access File Coordination's debug information due to insufficient permissions.", v5, 2u);
    }
  }
}

- (BOOL)itemHasPresentersAtURL:(id)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD block[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke;
  block[3] = &unk_1E0F542B8;
  block[4] = self;
  block[5] = v5;
  block[6] = a3;
  block[7] = &v9;
  dispatch_async(queue, block);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)a3;
}

uint64_t __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[6];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v10[2] = __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_2;
  v10[3] = &unk_1E0F4E178;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[4] = v2;
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v10);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_338;
  v9[3] = &unk_1E0F53130;
  v6 = a1[6];
  v7 = a1[7];
  v9[4] = a1[5];
  v9[5] = v7;
  return objc_msgSend(v5, "getItemHasPresentersAtURL:completionHandler:", v6, v9);
}

intptr_t __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_2(uint64_t a1, uint64_t a2)
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
    v7 = CFSTR("getItemHasPresenters");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_338(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setAutomaticFileProviderReregistrationDisabled:(BOOL)a3
{
  self->_disableFileProviderReregistration = a3;
}

+ (void)_accessPresenterOperationRecordsUsingBlock:(id)a3
{
  os_unfair_lock_lock(&stru_1ECD0943C);
  if (!qword_1ECD09450)
    qword_1ECD09450 = objc_opt_new();
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_unlock(&stru_1ECD0943C);
}

+ (id)_willBeginOperationForReactor:(id)a3 withDescription:(id)a4
{
  NSFilePresenterOperationRecord *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v4 = +[NSFilePresenterOperationRecord operationRecordWithDescription:reactor:](NSFilePresenterOperationRecord, "operationRecordWithDescription:reactor:", a4, a3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__NSFileAccessArbiterProxy__willBeginOperationForReactor_withDescription___block_invoke;
  v6[3] = &unk_1E0F542E0;
  v6[4] = v4;
  +[NSFileAccessArbiterProxy _accessPresenterOperationRecordsUsingBlock:](NSFileAccessArbiterProxy, "_accessPresenterOperationRecordsUsingBlock:", v6);
  return v4;
}

uint64_t __74__NSFileAccessArbiterProxy__willBeginOperationForReactor_withDescription___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

+ (id)_fileReactorDebuggingInformation
{
  NSString *v3;
  Class v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id obj;
  _QWORD v13[5];
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = +[NSString string](NSMutableString, "string");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__NSFileAccessArbiterProxy__fileReactorDebuggingInformation__block_invoke;
  v13[3] = &unk_1E0F542E0;
  v13[4] = v3;
  objc_msgSend(a1, "_accessPresenterOperationRecordsUsingBlock:", v13);
  v4 = objc_lookUpClass("NSDocument");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[objc_class _debuggingInformationForFileCoordination](v4, sel__debuggingInformationForFileCoordination);
  else
    v5 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(obj);
        -[NSString appendFormat:](v3, "appendFormat:", CFSTR("[%i]: Presenter ID: %@ -- %@\n"), v8 + v10, objc_msgSend(a1, "_idForReactor:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "objectForKey:", CFSTR("document"))), objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "objectForKey:", CFSTR("stateString")));
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      v8 = (v8 + v10);
    }
    while (v7);
  }
  if (!-[NSString length](v3, "length"))
    -[NSString appendString:](v3, "appendString:", CFSTR("Nothing\n"));
  return v3;
}

uint64_t __60__NSFileAccessArbiterProxy__fileReactorDebuggingInformation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(a2);
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)performBarrier
{
  NSObject *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__NSFileAccessArbiterProxy_performBarrier__block_invoke;
  v4[3] = &unk_1E0F4D2D8;
  v4[4] = v3;
  -[NSFileAccessArbiterProxy performBarrierAsync:](self, "performBarrierAsync:", v4);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
}

intptr_t __42__NSFileAccessArbiterProxy_performBarrier__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performBarrierAsync:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke;
  block[3] = &unk_1E0F50148;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke_2;
  v5[3] = &unk_1E0F4E088;
  v5[1] = 3221225472;
  v5[4] = v2;
  return objc_msgSend((id)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5), "performBarrierWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke_2(uint64_t a1, uint64_t a2)
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
    v7 = CFSTR("barrier");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleCanceledServer
{
  dispatch_async((dispatch_queue_t)self->_queue, &__block_literal_global_355);
}

@end
