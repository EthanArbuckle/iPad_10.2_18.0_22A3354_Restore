@implementation NSFilePresenterProxy

- (void)setUsesMainThreadDuringReliquishing:(BOOL)a3
{
  self->_usesMainThreadDuringRelinquishing = a3;
}

- (void)setObservedUbiquityAttributes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void)setFilePresenterResponses:(unint64_t)a3
{
  self->_filePresenterResponses = a3;
  objc_msgSend(self->_remotePresenter, "setFilePresenterResponses:");
}

- (NSFilePresenterProxy)initWithClient:(id)a3 remotePresenter:(id)a4 reactorID:(id)a5
{
  NSFilePresenterProxy *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSFilePresenterProxy;
  v6 = -[NSFileReactorProxy initWithClient:reactorID:](&v8, sel_initWithClient_reactorID_, a3, a5);
  if (v6)
    v6->_remotePresenter = -[NSFilePresenterManagedProxy initWithXPCProxy:]([NSFilePresenterManagedProxy alloc], "initWithXPCProxy:", a4);
  return v6;
}

- (void)startWatchingWithQueue:(id)a3 lastEventID:(id)a4 unannouncedMoveHandler:(id)a5
{
  NSFileWatcher *v9;
  NSXPCConnection *client;
  NSFileWatcher *v11;
  NSFileWatcher *watcher;
  _QWORD v13[8];
  _OWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_queue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  v9 = [NSFileWatcher alloc];
  client = self->super._client;
  if (client)
    -[NSXPCConnection auditToken](client, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  v11 = -[NSFileWatcher initWithQueue:auditToken:](v9, "initWithQueue:auditToken:", a3, v14);
  self->_watcher = v11;
  -[NSFileWatcher setURL:](v11, "setURL:", -[NSFileAccessNode url](self->super._itemLocation, "url"));
  if (a4)
    -[NSFileWatcher setLastObservedEventID:](self->_watcher, "setLastObservedEventID:", objc_msgSend(a4, "unsignedLongLongValue"));
  watcher = self->_watcher;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke;
  v13[3] = &unk_1E0F547F0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a5;
  -[NSFileWatcher setObserver:](watcher, "setObserver:", v13);
  -[NSFileWatcher start](self->_watcher, "start");
}

void __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke(uint64_t a1, uint64_t a2, __int16 a3, void *a4, uint64_t a5)
{
  char v6;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSURLPromisePair *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD block[5];
  uint8_t buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x100) != 0)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
    {
      v9 = _NSFCPresenterLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ detected non-coordinated event", buf, 0xCu);
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 125) = 1;
      v11 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_68;
      block[3] = &unk_1E0F4D2D8;
      v12 = *(NSObject **)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v11, v12, block);
    }
  }
  else
  {
    v6 = a3;
    if ((a3 & 0x200) != 0)
    {
      if (a5 != -1 && *(_QWORD *)(a1 + 48))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updateLastEventID:", a5);
    }
    else
    {
      if (!a2)
      {
        if ((a3 & 0x10) != 0)
        {
          v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "url");
          if (v14)
          {
            if ((objc_msgSend(a4, "isEqual:", v14) & 1) == 0)
            {
              *(_QWORD *)buf = 0;
              v19 = 0;
              _NSGetFSIDAndFileID(a4, buf, &v19);
              (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
            }
          }
        }
        if ((v6 & 2) != 0)
        {
          v15 = *(_QWORD *)(a1 + 32);
        }
        else
        {
          if ((v6 & 4) == 0)
            return;
          v15 = *(_QWORD *)(a1 + 32);
          if (*(_BYTE *)(v15 + 121))
            return;
        }
        if (!objc_msgSend((id)v15, "shouldSendObservationMessageWithPurposeID:", *(_QWORD *)(v15 + 80)))
          return;
        v18 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        v17 = 0;
        goto LABEL_26;
      }
      v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "itemProvider");
      if (v8)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_2;
        v20[3] = &unk_1E0F547C8;
        v20[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v8, "provideLogicalURLForURL:completionHandler:", a2, v20);
        return;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "shouldSendObservationMessageWithPurposeID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80)))
      {
        v16 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        v17 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", a2, 0);
        v18 = v16;
LABEL_26:
        objc_msgSend(v18, "observeChangeWithSubitemURL:", v17);
      }
    }
  }
}

- (void)startObservingApplicationStateWithQueue:(id)a3
{
  NSFileAccessProcessManager *processManager;
  NSFileAccessProcessManager *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!self->_inSubarbiter)
  {
    processManager = self->_processManager;
    if (processManager)
    {
      -[NSFileAccessProcessManager invalidate](processManager, "invalidate");

    }
    v6 = -[NSFileAccessProcessManager initWithClient:queue:]([NSFileAccessProcessManager alloc], "initWithClient:queue:", objc_msgSend(-[NSFileReactorProxy client](self, "client"), "_xpcConnection"), a3);
    self->_processManager = v6;
    if ((self->_filePresenterResponses & 0xFFFFFFFF8000020FLL) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __64__NSFilePresenterProxy_startObservingApplicationStateWithQueue___block_invoke;
      v9[3] = &unk_1E0F54818;
      v9[4] = self;
      -[NSFileAccessProcessManager setSuspensionHandler:](v6, "setSuspensionHandler:", v9);
    }
    v7 = -[NSFileAccessNode url](self->super._itemLocation, "url");
    if (v7)
    {
      v10[0] = v7;
      v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    }
    else
    {
      v8 = 0;
    }
    -[NSFileAccessProcessManager setURLs:](self->_processManager, "setURLs:", v8);
    objc_msgSend(self->_remotePresenter, "setProcessManager:", self->_processManager);
  }
}

- (void)setItemLocation:(id)a3
{
  NSFileAccessNode *itemLocation;
  id v6;
  void *v7;
  char HasPresentersExcludingPresenter;
  id v9;
  id v10;
  id v11;
  NSFileWatcher *watcher;
  NSFileAccessNode *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  itemLocation = self->super._itemLocation;
  if (itemLocation == a3)
    goto LABEL_11;
  v6 = -[NSFileAccessNode itemProvider](itemLocation, "itemProvider");
  v7 = (void *)_nearestPresenterInterestedInSubitemPresenters(self->super._itemLocation);
  HasPresentersExcludingPresenter = _nodeHasPresentersExcludingPresenter(self->super._itemLocation, (uint64_t)self);
  v9 = -[NSFileAccessNode url](self->super._itemLocation, "url");
  -[NSFileAccessNode removePresenter:](self->super._itemLocation, "removePresenter:", self);
  self->super._itemLocation = (NSFileAccessNode *)a3;
  objc_msgSend(a3, "addPresenter:", self);
  v10 = -[NSFileAccessNode itemProvider](self->super._itemLocation, "itemProvider");
  v11 = -[NSFileAccessNode url](self->super._itemLocation, "url");
  if (v6 != v10)
  {
    if (v6)
      objc_msgSend(v6, "observePresentationChangeOfKind:withPresenter:url:newURL:", CFSTR("removed"), self, v9, 0);
    if (v10)
      objc_msgSend(v10, "observePresentationChangeOfKind:withPresenter:url:newURL:", CFSTR("added"), self, v11, 0);
    -[NSFilePresenterProxy observeNewProvider:](self, "observeNewProvider:", v10);
    if ((HasPresentersExcludingPresenter & 1) != 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v6, "observePresentationChangeOfKind:withPresenter:url:newURL:", CFSTR("itemMoved"), self, v9, v11);
  if ((HasPresentersExcludingPresenter & 1) == 0)
LABEL_8:
    objc_msgSend(v7, "observePresenterChange:atSubitemURL:", 0, v9);
LABEL_9:
  if ((_nodeHasPresentersExcludingPresenter(self->super._itemLocation, (uint64_t)self) & 1) == 0)
    objc_msgSend((id)_nearestPresenterInterestedInSubitemPresenters(self->super._itemLocation), "observePresenterChange:atSubitemURL:", 1, v11);
LABEL_11:
  watcher = self->_watcher;
  if (watcher)
  {
    v13 = self->super._itemLocation;
    if (v13)
    {
      -[NSFileWatcher setURL:](watcher, "setURL:", -[NSFileAccessNode url](v13, "url"));
    }
    else
    {
      -[NSFileWatcher stop](self->_watcher, "stop");
      -[NSFileWatcher setObserver:](self->_watcher, "setObserver:", 0);
    }
  }
  if (self->_processManager)
  {
    v14 = -[NSFileAccessNode url](self->super._itemLocation, "url");
    if (v14)
    {
      v16[0] = v14;
      v15 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    }
    else
    {
      v15 = 0;
    }
    -[NSFileAccessProcessManager setURLs:](self->_processManager, "setURLs:", v15);
  }
}

- (BOOL)inSubarbiter
{
  return self->_inSubarbiter;
}

- (BOOL)allowedForURL:(id)a3
{
  id v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  id reactorID;
  int v10;
  uint64_t v11;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  _BYTE buf[32];
  __int128 v17;
  __int128 v18;
  _BYTE v19[24];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isFileURL") & 1) != 0)
  {
    *(_QWORD *)v19 = 0;
    *(_QWORD *)&v19[8] = v19;
    *(_QWORD *)&v19[16] = 0x2020000000;
    v20 = 0;
    v17 = 0u;
    v18 = 0u;
    v5 = -[NSFileReactorProxy client](self, "client");
    if (v5)
    {
      objc_msgSend(v5, "auditToken");
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
    }
    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v18;
    if (sandbox_check_by_audit_token()
      && !objc_msgSend((id)objc_msgSend(a3, "path"), "containsString:", CFSTR("/NanoPreferencesSync/NanoDomains/")))
    {
      v13[1] = 3221225472;
      v14 = v17;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[2] = __38__NSFilePresenterProxy_allowedForURL___block_invoke;
      v13[3] = &unk_1E0F547A0;
      v15 = v18;
      v13[4] = v19;
      +[NSFileReactorProxy _enumerateParentDirectoriesStartingAtURL:usingBlock:](NSFileReactorProxy, "_enumerateParentDirectoriesStartingAtURL:usingBlock:", a3, v13);
      if (!*(_BYTE *)(*(_QWORD *)&v19[8] + 24))
      {
        v8 = _NSFCPresenterLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          reactorID = self->super._reactorID;
          v10 = objc_msgSend(-[NSFileReactorProxy client](self, "client"), "processIdentifier");
          v11 = objc_msgSend(a3, "path");
          *(_DWORD *)buf = 138543875;
          *(_QWORD *)&buf[4] = reactorID;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v10;
          *(_WORD *)&buf[18] = 2113;
          *(_QWORD *)&buf[20] = v11;
          _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEFAULT, "Registering presenter %{public}@ disallowed. Process %d is not allowed to access the requested path or any of its parent directories: %{private}@", buf, 0x1Cu);
        }
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)&v19[8] + 24) = 1;
    }
    v7 = *(_BYTE *)(*(_QWORD *)&v19[8] + 24) != 0;
    _Block_object_dispose(v19, 8);
  }
  else
  {
    v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 138543619;
      *(_QWORD *)&v19[4] = self;
      *(_WORD *)&v19[12] = 2113;
      *(_QWORD *)&v19[14] = a3;
      _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "Registering presenter %{public}@ disallowed. Only file URLs are allowed, unlike this one: %{private}@", v19, 0x16u);
    }
    return 0;
  }
  return v7;
}

uint64_t __38__NSFilePresenterProxy_allowedForURL___block_invoke(uint64_t a1, void *a2, char *a3)
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

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  -[NSFileAccessProcessManager invalidate](self->_processManager, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)NSFilePresenterProxy;
  -[NSFileReactorProxy dealloc](&v4, sel_dealloc);
}

- (id)_clientProxy
{
  return self->_remotePresenter;
}

- (BOOL)shouldSendObservationMessageWithPurposeID:(id)a3
{
  return !objc_msgSend(a3, "isEqual:", self->super._reactorID) || self->_inSubarbiter;
}

- (void)forwardUsingProxy:(id)a3
{
  NSFilePresenterXPCMessenger *forwardedMessenger;

  forwardedMessenger = self->_forwardedMessenger;
  if (!forwardedMessenger)
  {
    forwardedMessenger = -[NSFilePresenterXPCMessenger initWithFilePresenterProxy:]([NSFilePresenterXPCMessenger alloc], "initWithFilePresenterProxy:", self);
    self->_forwardedMessenger = forwardedMessenger;
  }
  objc_msgSend(a3, "addPresenter:withID:fileURL:lastPresentedItemEventIdentifier:ubiquityAttributes:options:responses:", forwardedMessenger, self->super._reactorID, -[NSFileAccessNode url](self->super._itemLocation, "url"), 0, self->_observedUbiquityAttributes, 2 * self->_usesMainThreadDuringRelinquishing, self->_filePresenterResponses);
}

- (void)invalidate
{
  -[NSFilePresenterXPCMessenger invalidate](self->_forwardedMessenger, "invalidate");

  self->_forwardedMessenger = 0;
  -[NSFilePresenterProxy setFilePresenterResponses:](self, "setFilePresenterResponses:", 0);
}

- (void)_settleNonCoordinatedChanges
{
  NSObject *v3;
  id reactorID;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_didObserveNonCoordinatedChanges)
  {
    v3 = _NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      reactorID = self->super._reactorID;
      v5 = 138543362;
      v6 = reactorID;
      _os_log_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ settling non-coordinated events", (uint8_t *)&v5, 0xCu);
    }
    if (self->_didObserveMovingByWriter)
      -[NSFileWatcher setURL:](self->_watcher, "setURL:", -[NSFileAccessNode url](self->super._itemLocation, "url"));
    -[NSFileWatcher settle](self->_watcher, "settle");
    self->_didObserveMovingByWriter = 0;
    self->_didObserveNonCoordinatedChanges = 0;
  }
}

uint64_t __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_settleNonCoordinatedChanges");
}

uint64_t __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 32), "shouldSendObservationMessageWithPurposeID:", *(_QWORD *)(*(_QWORD *)(result + 32) + 80));
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(*(_QWORD *)(v3 + 32) + 40), "observeChangeWithSubitemURL:", a2);
  }
  return result;
}

uint64_t __64__NSFilePresenterProxy_startObservingApplicationStateWithQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "logSuspensionWarning");
}

- (void)stopObservingApplicationState
{
  -[NSFileAccessProcessManager invalidate](self->_processManager, "invalidate");

  self->_processManager = 0;
  objc_msgSend(self->_remotePresenter, "setProcessManager:", 0);
}

- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 resultHandler:(id)a6
{
  -[NSFilePresenterProxy forwardRelinquishmentForWritingClaim:withID:purposeID:subitemURL:options:completionHandler:](self, "forwardRelinquishmentForWritingClaim:withID:purposeID:subitemURL:options:completionHandler:", 0, a3, a5, 0, a4, a6);
}

+ (id)urlWithItemURL:(id)a3 subitemPath:(id)a4
{
  id result;
  uint64_t v7;

  result = (id)objc_msgSend(a4, "count");
  if (result)
  {
    v7 = objc_msgSend((id)objc_msgSend(a3, "path"), "stringByAppendingPathComponent:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", a4));
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  }
  return result;
}

- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemPath:(id)a6 resultHandler:(id)a7
{
  -[NSFilePresenterProxy forwardRelinquishmentForWritingClaim:withID:purposeID:subitemURL:options:completionHandler:](self, "forwardRelinquishmentForWritingClaim:withID:purposeID:subitemURL:options:completionHandler:", 1, a3, a5, +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", +[NSFilePresenterProxy urlWithItemURL:subitemPath:](NSFilePresenterProxy, "urlWithItemURL:subitemPath:", -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"), a6), 0), a4, a7);
}

- (void)saveChangesWithCompletionHandler:(id)a3
{
  id remotePresenter;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  remotePresenter = self->_remotePresenter;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E0F4E088;
  v5[4] = a3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke_79;
  v4[3] = &unk_1E0F4E088;
  v4[4] = a3;
  objc_msgSend((id)objc_msgSend(remotePresenter, "remoteObjectProxyWithErrorHandler:", v5), "saveChangesWithCompletionHandler:", v4);
}

uint64_t __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
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
    v7 = CFSTR("saveChanges");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)accommodateDeletionWithSubitemPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id remotePresenter;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v6 = +[NSFilePresenterProxy urlWithItemURL:subitemPath:](NSFilePresenterProxy, "urlWithItemURL:subitemPath:", -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"), a3);
  remotePresenter = self->_remotePresenter;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke;
  v9[3] = &unk_1E0F4E088;
  v9[4] = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke_82;
  v8[3] = &unk_1E0F4E088;
  v8[4] = a4;
  objc_msgSend((id)objc_msgSend(remotePresenter, "remoteObjectProxyWithErrorHandler:", v9), "accommodateDeletionOfSubitemAtURL:completionHandler:", +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", v6, 0), v8);
}

uint64_t __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
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
    v7 = CFSTR("accommodateDeletion");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeMoveByWriterWithPurposeID:(id)a3 withPhysicalDestinationURL:(id)a4 withFSID:(fsid)a5 andFileID:(unint64_t)a6
{
  NSURLPromisePair *v10;

  self->_didObserveMovingByWriter = 1;
  v10 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"), a4);
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:](self, "shouldSendObservationMessageWithPurposeID:", a3))
  {
    objc_msgSend(self->_remotePresenter, "observeMoveToURL:withSubitemURL:byWriterWithPurposeID:withFSID:andFileID:", v10, 0, a3, a5, a6);
  }
}

- (void)observeMoveOfSubitemAtURL:(id)a3 toURL:(id)a4 byWriterWithPurposeID:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7
{
  if (!a3)
    self->_didObserveMovingByWriter = 1;
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:](self, "shouldSendObservationMessageWithPurposeID:", a5))
  {
    objc_msgSend(self->_remotePresenter, "observeMoveToURL:withSubitemURL:byWriterWithPurposeID:withFSID:andFileID:", a4, a3, a5, a6, a7);
  }
}

- (void)observeDisconnectionByWriterWithPurposeID:(id)a3
{
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:](self, "shouldSendObservationMessageWithPurposeID:", a3))
  {
    objc_msgSend(self->_remotePresenter, "observeDisconnection");
  }
  -[NSFileWatcher stop](self->_watcher, "stop");
  -[NSFilePresenterProxy disconnect](self, "disconnect");
}

- (void)observeReconnectionByWriterWithPurposeID:(id)a3
{
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:](self, "shouldSendObservationMessageWithPurposeID:", a3))
  {
    objc_msgSend(self->_remotePresenter, "observeReconnection");
  }
}

- (void)observeUbiquityChangeAtSubitemPath:(id)a3 withPhysicalURL:(id)a4
{
  NSURLPromisePair *v5;

  v5 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", +[NSFilePresenterProxy urlWithItemURL:subitemPath:](NSFilePresenterProxy, "urlWithItemURL:subitemPath:", -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"), a3), a4);
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:](self, "shouldSendObservationMessageWithPurposeID:", self->_currentWriterPurposeID))
  {
    objc_msgSend(self->_remotePresenter, "observeUbiquityChangeWithSubitemURL:", v5);
  }
}

- (void)observeSharingChangeAtSubitemPath:(id)a3 withPhysicalURL:(id)a4
{
  NSURLPromisePair *v5;

  v5 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", +[NSFilePresenterProxy urlWithItemURL:subitemPath:](NSFilePresenterProxy, "urlWithItemURL:subitemPath:", -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"), a3), a4);
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:](self, "shouldSendObservationMessageWithPurposeID:", self->_currentWriterPurposeID))
  {
    objc_msgSend(self->_remotePresenter, "observeSharingChangeWithSubitemURL:", v5);
  }
}

- (void)observeChangeOfUbiquityAttributes:(id)a3
{
  NSSet *observedUbiquityAttributes;
  void *v6;

  observedUbiquityAttributes = self->_observedUbiquityAttributes;
  if (!observedUbiquityAttributes
    || -[NSSet count](observedUbiquityAttributes, "count")
    && (v6 = (void *)objc_msgSend(a3, "mutableCopy"),
        objc_msgSend(v6, "intersectSet:", self->_observedUbiquityAttributes),
        a3 = v6,
        objc_msgSend(a3, "count")))
  {
    if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:](self, "shouldSendObservationMessageWithPurposeID:", self->_currentWriterPurposeID))
    {
      objc_msgSend(self->_remotePresenter, "observeChangeOfUbiquityAttributes:", a3);
    }
  }
}

- (void)observeDisappearanceAtSubitemPath:(id)a3
{
  id v5;

  if (objc_msgSend(a3, "count"))
  {
    v5 = +[NSFilePresenterProxy urlWithItemURL:subitemPath:](NSFilePresenterProxy, "urlWithItemURL:subitemPath:", -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"), a3);
    if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:](self, "shouldSendObservationMessageWithPurposeID:", self->_currentWriterPurposeID))
    {
      objc_msgSend(self->_remotePresenter, "observeChangeWithSubitemURL:", +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", v5, 0));
    }
  }
}

- (void)observeChangeAtSubitemPath:(id)a3
{
  id v4;

  v4 = +[NSFilePresenterProxy urlWithItemURL:subitemPath:](NSFilePresenterProxy, "urlWithItemURL:subitemPath:", -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"), a3);
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:](self, "shouldSendObservationMessageWithPurposeID:", self->_currentWriterPurposeID))
  {
    objc_msgSend(self->_remotePresenter, "observeChangeWithSubitemURL:", +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", v4, 0));
  }
}

- (void)observeVersionChangeOfKind:(id)a3 withClientID:(id)a4 name:(id)a5 subitemPath:(id)a6
{
  self->_didObserveVersionChangingByWriter = 1;
  objc_msgSend(self->_remotePresenter, "observeVersionChangeOfKind:toItemAtURL:withClientID:name:", a3, +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", +[NSFilePresenterProxy urlWithItemURL:subitemPath:](NSFilePresenterProxy, "urlWithItemURL:subitemPath:", -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"), a6), 0), a4, a5);
}

- (void)observePresenterChange:(BOOL)a3 atSubitemURL:(id)a4
{
  if (!self->_inSubarbiter)
    objc_msgSend(self->_remotePresenter, "observePresenterChange:forSubitemAtURL:", a3, +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", a4, 0));
}

- (void)observeNewProvider:(id)a3
{
  if (!self->_inSubarbiter)
    objc_msgSend(self->_remotePresenter, "setProviderPurposeIdentifier:", objc_msgSend(a3, "reactorID"));
}

- (void)forwardRelinquishmentForWritingClaim:(BOOL)a3 withID:(id)a4 purposeID:(id)a5 subitemURL:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  unint64_t v9;
  id v10;
  _BOOL4 v13;
  uint64_t v15;
  id currentWriterPurposeID;
  NSMutableArray *previousWriterPurposeIDs;
  _QWORD *v18;
  id remotePresenter;
  void *v20;
  NSObject *v21;
  id reactorID;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[8];
  BOOL v30;
  _QWORD v31[5];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v9 = a7;
  v10 = a6;
  v13 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v15 = MEMORY[0x1E0C809B0];
  if (a3 && self->_watcher)
  {
    -[NSFilePresenterProxy _settleNonCoordinatedChanges](self, "_settleNonCoordinatedChanges");
    currentWriterPurposeID = self->_currentWriterPurposeID;
    self->_currentWriterPurposeID = (id)objc_msgSend(a5, "copy");
    ++self->_writingRelinquishmentCount;
    if (currentWriterPurposeID)
    {
      previousWriterPurposeIDs = self->_previousWriterPurposeIDs;
      if (!previousWriterPurposeIDs)
      {
        previousWriterPurposeIDs = (NSMutableArray *)objc_opt_new();
        self->_previousWriterPurposeIDs = previousWriterPurposeIDs;
      }
      -[NSMutableArray addObject:](previousWriterPurposeIDs, "addObject:", currentWriterPurposeID);
    }
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2;
    v31[3] = &unk_1E0F53578;
    v31[4] = self;
    v18 = v31;
    v10 = a6;
    v9 = a7;
  }
  else
  {
    v18 = &__block_literal_global_77;
  }
  if (objc_msgSend(a5, "isEqual:", self->super._reactorID) && !self->_inSubarbiter)
  {
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_3;
    v25[3] = &unk_1E0F548D8;
    v25[4] = v18;
    (*((void (**)(id, uint64_t, _QWORD, _QWORD *))a8 + 2))(a8, 1, 0, v25);
  }
  else
  {
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_86;
    v29[3] = &unk_1E0F548B0;
    v29[4] = self;
    v29[5] = a4;
    v29[6] = a8;
    v29[7] = v18;
    v30 = v13;
    remotePresenter = self->_remotePresenter;
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_94;
    v28[3] = &unk_1E0F4E088;
    v28[4] = v29;
    v20 = (void *)objc_msgSend(remotePresenter, "remoteObjectProxyWithErrorHandler:", v28);
    v21 = _NSFCPresenterLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      reactorID = self->super._reactorID;
      *(_DWORD *)buf = 138543618;
      v33 = reactorID;
      v34 = 2114;
      v35 = a4;
      _os_log_impl(&dword_1817D9000, v21, OS_LOG_TYPE_DEFAULT, "Asking presenter %{public}@ to relinquish to claim %{public}@", buf, 0x16u);
    }
    if (v13)
    {
      v27[0] = v15;
      v27[1] = 3221225472;
      v27[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_97;
      v27[3] = &unk_1E0F4E088;
      v27[4] = v29;
      objc_msgSend(v20, "relinquishToWritingClaimWithID:options:purposeID:subitemURL:completionHandler:", a4, v9, a5, v10, v27);
    }
    else
    {
      v26[0] = v15;
      v26[1] = 3221225472;
      v26[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_98;
      v26[3] = &unk_1E0F4E088;
      v26[4] = v29;
      objc_msgSend(v20, "relinquishToReadingClaimWithID:options:purposeID:completionHandler:", a4, v9, a5, v26);
    }
  }
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v4 = _NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "A file presenter is being asked to reacquire from a writer more times than it's been asked to relinquish", buf, 2u);
    }
  }
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 72))
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "lastObject");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeLastObject");
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  }
  else
  {
    v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1817D9000, v6, OS_LOG_TYPE_INFO, "Deferring presenter %{public}@ reaquistion for .5 seconds", buf, 0xCu);
    }
    v8 = dispatch_time(0, 500000000);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 56);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_85;
    v11[3] = &unk_1E0F50148;
    v11[4] = v9;
    v11[5] = a2;
    dispatch_after(v8, v10, v11);
  }
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_85(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 120))
  {
    objc_msgSend(*(id *)(v2 + 64), "setURL:", objc_msgSend(*(id *)(v2 + 24), "url"));
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 64), "settle");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_86(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];
  __int128 v16;
  uint64_t v17;
  char v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = _NSFCPresenterLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543618;
    v21 = v12;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_1817D9000, v6, OS_LOG_TYPE_DEFAULT, "Received relinquishment reply for presenter %{public}@ to claim %{public}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_87;
  v15[3] = &unk_1E0F54888;
  v13 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v18 = a2;
  v16 = *(_OWORD *)(a1 + 32);
  v19 = *(_BYTE *)(a1 + 64);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16))(v13, a2, a3, v15, v7, v8, v9, v10);
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_87(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_88;
  v4[3] = &unk_1E0F54860;
  v7 = *(_WORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = a2;
  return (*(uint64_t (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v4);
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_88(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 56))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543618;
    v15 = v4;
    v16 = 2114;
    v17 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Telling presenter %{public}@ to reacquire after claim %{public}@", buf, 0x16u);
  }
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (*(_BYTE *)(a1 + 57))
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_89;
    v13[3] = &unk_1E0F4E088;
    v13[4] = *(_QWORD *)(a1 + 48);
    v7 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_92;
    v12[3] = &unk_1E0F53270;
    v12[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(v7, "reacquireFromWritingClaimForID:completionHandler:", *(_QWORD *)(a1 + 40), v12);
  }
  else
  {
    objc_msgSend(v5, "reacquireFromReadingClaimForID:", *(_QWORD *)(a1 + 40));
    v9 = _NSFCPresenterLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_INFO, "Not waiting for reacquisition reply for presenter %{public}@ after claim %{public}@", buf, 0x16u);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_89(uint64_t a1, uint64_t a2)
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
    v7 = CFSTR("reacquire");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_92(_QWORD *a1)
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
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[5];
    v4 = *(_QWORD *)(a1[4] + 16);
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Received reacquisition reply for presenter %{public}@ after claim %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_94(uint64_t a1, uint64_t a2)
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
    v7 = CFSTR("relinquish");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_4;
  v8[3] = &unk_1E0F4E870;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v8, a3, a4, a5, a6);
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disconnect
{
  self->_disconnected = 1;
}

- (BOOL)disconnected
{
  return self->_disconnected;
}

- (void)promisedFileWasFulfilled
{
  -[NSFileWatcher start](self->_watcher, "start");
}

- (void)localFileWasEvicted
{
  -[NSFileWatcher stop](self->_watcher, "stop");
}

- (void)setInSubarbiter:(BOOL)a3
{
  self->_inSubarbiter = a3;
}

- (BOOL)usesMainThreadDuringReliquishing
{
  return self->_usesMainThreadDuringRelinquishing;
}

- (NSSet)observedUbiquityAttributes
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (unint64_t)filePresenterResponses
{
  return self->_filePresenterResponses;
}

@end
