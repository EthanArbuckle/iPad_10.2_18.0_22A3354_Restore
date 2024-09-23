@implementation ASDJobManager

- (ASDJobManager)init
{
  ASDJobManagerOptions *v3;
  ASDJobManager *v4;

  v3 = objc_alloc_init(ASDJobManagerOptions);
  v4 = -[ASDJobManager initWithOptions:](self, "initWithOptions:", v3);

  return v4;
}

- (ASDJobManager)initWithOptions:(id)a3
{
  id v4;
  ASDJobManager *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *observerQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *xpcQueue;
  uint64_t v12;
  NSArray *jobs;
  uint64_t v14;
  ASDJobManagerOptions *options;
  __SecTask *v16;
  __SecTask *v17;
  CFTypeRef v18;
  CFTypeID v19;
  int Value;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  int *v24;
  NSObject *v25;
  _QWORD handler[4];
  id v28;
  _QWORD block[4];
  int *v30;
  objc_super v31;
  CFErrorRef error;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ASDJobManager;
  v5 = -[ASDJobManager init](&v31, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.appstoredaemon.ASDJobManager.access", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.appstoredaemon.ASDJobManager.observer", 0);
    observerQueue = v5->_observerQueue;
    v5->_observerQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.appstoredaemon.ASDJobManager.xpc", 0);
    xpcQueue = v5->_xpcQueue;
    v5->_xpcQueue = (OS_dispatch_queue *)v10;

    v12 = objc_opt_new();
    jobs = v5->_jobs;
    v5->_jobs = (NSArray *)v12;

    v14 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (ASDJobManagerOptions *)v14;

    v16 = SecTaskCreateFromSelf(0);
    if (v16)
    {
      v17 = v16;
      error = 0;
      v18 = SecTaskCopyValueForEntitlement(v16, CFSTR("com.apple.private.coreservices.canmaplsdatabase"), &error);
      if (error)
        CFRelease(error);
      if (v18)
      {
        v19 = CFGetTypeID(v18);
        if (v19 == CFBooleanGetTypeID())
        {
          Value = CFBooleanGetValue((CFBooleanRef)v18);
          CFRelease(v18);
          CFRelease(v17);
          v5->_useLaunchServicesProgress = Value != 0;
          if (Value)
          {
            objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObserver:", v5);

          }
          goto LABEL_12;
        }
        CFRelease(v18);
      }
      CFRelease(v17);
    }
    v5->_useLaunchServicesProgress = 0;
LABEL_12:
    v22 = v5->_accessQueue;
    v23 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__ASDJobManager_initWithOptions___block_invoke;
    block[3] = &unk_1E37BDD60;
    v24 = v5;
    v30 = v24;
    dispatch_async(v22, block);
    objc_initWeak((id *)&error, v24);
    v25 = v5->_accessQueue;
    handler[0] = v23;
    handler[1] = 3221225472;
    handler[2] = __33__ASDJobManager_initWithOptions___block_invoke_2;
    handler[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v28, (id *)&error);
    notify_register_dispatch("com.apple.appstored.daemon.launched", v24 + 8, v25, handler);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)&error);

  }
  return v5;
}

void __33__ASDJobManager_initWithOptions___block_invoke(uint64_t a1)
{
  -[ASDJobManager _connectToDaemon](*(_QWORD *)(a1 + 32));
}

- (void)_connectToDaemon
{
  BOOL v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id from;
  id location;
  __int128 buf;
  void *v34;
  void *v35;
  id v36;
  id v37[3];

  v37[1] = *(id *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = -[ASDBaseClient _clientHasEntitlement:](a1, CFSTR("com.apple.appstored.jobmanager"));
    v3 = MEMORY[0x1E0C809B0];
    if (v2)
      goto LABEL_6;
    ASDLogHandleForCategory(12);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
      v24 = *(id *)((char *)&buf + 4);
      _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Treating as legacy client", (uint8_t *)&buf, 0xCu);

    }
    if (-[ASDBaseClient _clientHasEntitlement:](a1, CFSTR("com.apple.itunesstored.private")))
    {
LABEL_6:
      v5 = *(void **)(a1 + 16);
      if (v5)
        objc_msgSend(v5, "invalidate");
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.appstored.xpc.jobmanager"), 0);
      v7 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v6;

      objc_msgSend(*(id *)(a1 + 16), "_setQueue:", *(_QWORD *)(a1 + 80));
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392850);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C99E60];
      v10 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getJobsUsingReplyBlock_, 0, 1);

      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_getJobsWithIDs_usingReplyBlock_, 0, 1);

      objc_msgSend(v8, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerJobManagerWithOptions_replyBlock_, 0, 0);
      objc_msgSend(*(id *)(a1 + 16), "setRemoteObjectInterface:", v8);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38A9B0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0C99E60];
      v17 = objc_opt_class();
      objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_didChangeJobs_, 0, 0);

      objc_msgSend(*(id *)(a1 + 16), "setExportedInterface:", v15);
      objc_msgSend(*(id *)(a1 + 16), "setExportedObject:", a1);
      objc_initWeak(&location, (id)a1);
      objc_initWeak(&from, *(id *)(a1 + 16));
      v19 = *(void **)(a1 + 16);
      *(_QWORD *)&buf = v3;
      *((_QWORD *)&buf + 1) = 3221225472;
      v34 = __33__ASDJobManager__setupConnection__block_invoke;
      v35 = &unk_1E37BFFE8;
      objc_copyWeak(&v36, &location);
      objc_copyWeak(v37, &from);
      objc_msgSend(v19, "setInvalidationHandler:", &buf);
      v20 = *(void **)(a1 + 16);
      v25 = v3;
      v26 = 3221225472;
      v27 = __33__ASDJobManager__setupConnection__block_invoke_123;
      v28 = &unk_1E37BFFE8;
      objc_copyWeak((id *)&v29, &location);
      objc_copyWeak(&v30, &from);
      objc_msgSend(v20, "setInterruptionHandler:", &v25);
      objc_msgSend(*(id *)(a1 + 16), "resume");
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)&v29);
      objc_destroyWeak(v37);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
    v21 = *(id *)(a1 + 56);
    v22 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)&buf = v3;
    *((_QWORD *)&buf + 1) = 3221225472;
    v34 = __45__ASDJobManager__registerManagerWithOptions___block_invoke;
    v35 = &unk_1E37BFF20;
    v23 = v21;
    v36 = v23;
    v37[0] = (id)a1;
    v25 = v3;
    v26 = 3221225472;
    v27 = __45__ASDJobManager__registerManagerWithOptions___block_invoke_35;
    v28 = &unk_1E37BDDB0;
    v29 = a1;
    objc_msgSend((id)a1, "_call:run:error:", v22, &buf, &v25);

  }
}

void __33__ASDJobManager_initWithOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[ASDJobManager _connectToDaemon]((uint64_t)WeakRetained);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_useLaunchServicesProgress)
  {
    objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  -[ASDJobManager _invalidate]((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)ASDJobManager;
  -[ASDJobManager dealloc](&v4, sel_dealloc);
}

- (void)_invalidate
{
  void *v2;
  void *v3;

  if (a1)
  {
    notify_cancel(*(_DWORD *)(a1 + 32));
    v2 = *(void **)(a1 + 16);
    if (v2)
    {
      objc_msgSend(v2, "invalidate");
      v3 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

    }
  }
}

- (void)addJobObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__ASDJobManager_addJobObserver___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __32__ASDJobManager_addJobObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)cancelJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: cancelJobsWithIDs: %{public}@", buf, 0x16u);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(accessQueue, block);

}

void __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v10[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_2;
  v10[3] = &unk_1E37BFF98;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = v2;
  v6 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_5;
  v8[3] = &unk_1E37BE250;
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v3, "_call:run:error:", v4, v10, v8);

}

void __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_3;
  v6[3] = &unk_1E37BE200;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "cancelJobsWithIDs:completionBlock:", v4, v6);

}

void __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_4;
    v5[3] = &unk_1E37BF808;
    v6 = v2;
    v7 = a2;
    dispatch_async(v4, v5);

  }
}

uint64_t __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_6;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)finishJobs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *accessQueue;
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "persistentID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__ASDJobManager_finishJobs___block_invoke;
    block[3] = &unk_1E37BDE50;
    block[4] = self;
    v14 = v6;
    v15 = v5;
    dispatch_async(accessQueue, block);

  }
}

void __28__ASDJobManager_finishJobs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  _QWORD *v19;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v2)
  {
    v4 = *(void **)(v2 + 64);
    if (!v4)
    {
      v5 = objc_opt_new();
      v6 = *(void **)(v2 + 64);
      *(_QWORD *)(v2 + 64) = v5;

      v4 = *(void **)(v2 + 64);
    }
    objc_msgSend(v4, "addObjectsFromArray:", v3);
    v7 = (void *)objc_msgSend(*(id *)(v2 + 24), "mutableCopy");
    objc_msgSend(*(id *)(v2 + 64), "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectsInArray:", v8);

    v9 = objc_msgSend(v7, "copy");
    v10 = *(void **)(v2 + 24);
    *(_QWORD *)(v2 + 24) = v9;

  }
  v11 = *(_QWORD **)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v13 = v12;
  if (v11)
  {
    v14 = v11[2];
    v15 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __36__ASDJobManager__finishJobsWithIDs___block_invoke;
    v17[3] = &unk_1E37BFF20;
    v18 = v12;
    v19 = v11;
    v16[0] = v15;
    v16[1] = 3221225472;
    v16[2] = __36__ASDJobManager__finishJobsWithIDs___block_invoke_4;
    v16[3] = &unk_1E37BDDB0;
    v16[4] = v11;
    objc_msgSend(v11, "_call:run:error:", v14, v17, v16);

  }
}

- (void)getJobsUsingBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__ASDJobManager_getJobsUsingBlock___block_invoke;
  v7[3] = &unk_1E37BE278;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __35__ASDJobManager_getJobsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  id v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  uint64_t *v15;
  _QWORD v16[5];
  uint64_t *v17;

  v2 = MEMORY[0x1E0C809B0];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __35__ASDJobManager_getJobsUsingBlock___block_invoke_2;
  v11 = &unk_1E37BFE68;
  v3 = *(_QWORD **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v4;
  v5 = &v8;
  v6 = v5;
  if (v3)
  {
    v7 = v3[2];
    v16[0] = v2;
    v16[1] = 3221225472;
    v16[2] = __36__ASDJobManager__getJobsUsingBlock___block_invoke;
    v16[3] = &unk_1E37BFF48;
    v16[4] = v3;
    v17 = v5;
    v14[0] = v2;
    v14[1] = 3221225472;
    v14[2] = __36__ASDJobManager__getJobsUsingBlock___block_invoke_4;
    v14[3] = &unk_1E37BDEE8;
    v14[4] = v3;
    v15 = v17;
    objc_msgSend(v3, "_call:run:error:", v7, v16, v14, v8, v9, v10, v11);

  }
}

void __35__ASDJobManager_getJobsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__ASDJobManager_getJobsUsingBlock___block_invoke_3;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __35__ASDJobManager_getJobsUsingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getJobsWithIDs:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

void __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke_2;
  v5[3] = &unk_1E37BFE68;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  -[ASDJobManager _getJobsWithIDs:usingBlock:](v2, v3, v5);

}

void __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke_3;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_getJobsWithIDs:(void *)a3 usingBlock:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v8;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_19A03B000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Getting job(s) with IDs: %{public}@", buf, 0x16u);

    }
    v11 = a1[2];
    v12 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke;
    v15[3] = &unk_1E37BFF98;
    v16 = v5;
    v17 = a1;
    v18 = v6;
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_2_32;
    v13[3] = &unk_1E37BDEE8;
    v13[4] = a1;
    v14 = v18;
    objc_msgSend(a1, "_call:run:error:", v11, v15, v13);

  }
}

- (void)invalidate
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ASDJobManager_invalidate__block_invoke;
  block[3] = &unk_1E37BDD60;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

void __27__ASDJobManager_invalidate__block_invoke(uint64_t a1)
{
  -[ASDJobManager _invalidate](*(_QWORD *)(a1 + 32));
}

- (void)pauseJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: pauseJobsWithIDs: %{public}@", buf, 0x16u);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(accessQueue, block);

}

void __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v10[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_2;
  v10[3] = &unk_1E37BFF98;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = v2;
  v6 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_5;
  v8[3] = &unk_1E37BE250;
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v3, "_call:run:error:", v4, v10, v8);

}

void __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_3;
  v6[3] = &unk_1E37BE200;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "pauseJobsWithIDs:completionBlock:", v4, v6);

}

void __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_4;
    v5[3] = &unk_1E37BF808;
    v6 = v2;
    v7 = a2;
    dispatch_async(v4, v5);

  }
}

uint64_t __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_6;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)removeJobObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__ASDJobManager_removeJobObserver___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __35__ASDJobManager_removeJobObserver___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 48))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 48), "removeObject:", *(_QWORD *)(result + 40));
  return result;
}

- (void)resumeJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: resumeJobsWithIDs: %{public}@", buf, 0x16u);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(accessQueue, block);

}

void __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v10[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_2;
  v10[3] = &unk_1E37BFF98;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = v2;
  v6 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_5;
  v8[3] = &unk_1E37BE250;
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v3, "_call:run:error:", v4, v10, v8);

}

void __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_3;
  v6[3] = &unk_1E37BE200;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "resumeJobsWithIDs:completionBlock:", v4, v6);

}

void __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_4;
    block[3] = &unk_1E37BDF60;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_6;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)didChangeJobs:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__ASDJobManager_didChangeJobs___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __31__ASDJobManager_didChangeJobs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v3;
    v24 = 2114;
    v25 = v4;
    v5 = v3;
    _os_log_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: didChangeJobs: %{public}@", buf, 0x16u);

  }
  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "mutableCopy");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", v12, (_QWORD)v17) & 1) == 0)
        {
          v13 = objc_msgSend(v6, "indexOfObject:", v12);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v6, "addObject:", v12);
          else
            objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v13, v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v14 = objc_msgSend(v6, "copy");
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 24);
  *(_QWORD *)(v15 + 24) = v14;

  -[ASDJobManager _sendJobsChanged:](*(_QWORD *)(a1 + 32), v6);
}

- (void)_sendJobsChanged:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 48), "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__ASDJobManager__sendJobsChanged___block_invoke;
    block[3] = &unk_1E37BDE50;
    v8 = v4;
    v9 = a1;
    v10 = v3;
    v6 = v4;
    dispatch_async(v5, block);

  }
}

- (void)didCompleteJobs:(id)a3 finalPhases:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ASDJobManager_didCompleteJobs_finalPhases___block_invoke;
  block[3] = &unk_1E37BDE50;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

void __45__ASDJobManager_didCompleteJobs_finalPhases___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(void **)(a1 + 40);
    v5 = v3;
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v3;
    v31 = 2114;
    v32 = v6;
    _os_log_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: didCompleteJobs: %{public}@", buf, 0x16u);

  }
  -[ASDJobManager _mapAllJobsToIDs](*(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "mutableCopy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = *(id *)(a1 + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v9, "removeObject:", v16);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", v16);
          objc_msgSend(v8, "addObject:", v16);
          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
            objc_msgSend(v16, "setPhase:", objc_msgSend(v17, "integerValue"));

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  v19 = objc_msgSend(v9, "copy");
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 24);
  *(_QWORD *)(v20 + 24) = v19;

  v22 = *(_QWORD *)(a1 + 32);
  v23 = (void *)objc_msgSend(v8, "copy");
  -[ASDJobManager _sendJobsCompleted:](v22, v23);

}

- (id)_mapAllJobsToIDs
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = *(id *)(a1 + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = *(id *)(a1 + 24);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v15, "persistentID", (_QWORD)v18));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

  return v2;
}

- (void)_sendJobsCompleted:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 48), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__ASDJobManager__sendJobsCompleted___block_invoke;
    block[3] = &unk_1E37BDE50;
    v9 = v5;
    v10 = a1;
    v11 = v4;
    v7 = v5;
    dispatch_async(v6, block);

  }
}

- (void)didUpdateProgress:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__ASDJobManager_didUpdateProgress___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __35__ASDJobManager_didUpdateProgress___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 72);
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v10 = v8;
      _os_log_debug_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@]: didUpdateProgress, but using LaunchServices: %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v6 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      v7 = v5;
      _os_log_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: didUpdateProgress: %{public}@", (uint8_t *)&v11, 0x16u);

    }
    -[ASDJobManager _applyUpdates:usingBlock:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), &__block_literal_global_28);
  }
}

void __35__ASDJobManager_didUpdateProgress___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v4, "setPercentComplete:");

}

- (void)_applyUpdates:(void *)a3 usingBlock:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = *(id *)(a1 + 24);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "persistentID", v27));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v12, v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v9);
    }

    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __42__ASDJobManager__applyUpdates_usingBlock___block_invoke;
    v29[3] = &unk_1E37BFED0;
    v17 = v6;
    v30 = v17;
    v33 = v5;
    v18 = v14;
    v31 = v18;
    v19 = v15;
    v32 = v19;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v29);
    if (objc_msgSend(v19, "count"))
    {
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __42__ASDJobManager__applyUpdates_usingBlock___block_invoke_2;
      v28[3] = &unk_1E37BFEF8;
      v28[4] = a1;
      -[ASDJobManager _getJobsWithIDs:usingBlock:]((_QWORD *)a1, v19, v28);
    }
    ASDLogHandleForCategory(12);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v39 = v21;
      v40 = 2114;
      v41 = v18;
      v22 = v21;
      _os_log_impl(&dword_19A03B000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Sending updated jobs: %{public}@", buf, 0x16u);

    }
    ASDLogHandleForCategory(12);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_opt_class();
      v25 = *(void **)(a1 + 24);
      *(_DWORD *)buf = 138543618;
      v39 = v24;
      v40 = 2114;
      v41 = v25;
      v26 = v24;
      _os_log_impl(&dword_19A03B000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Our jobs are: %{public}@", buf, 0x16u);

    }
    -[ASDJobManager _sendProgressUpdated:](a1, v18);

  }
}

- (void)didUpdateStates:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__ASDJobManager_didUpdateStates___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __33__ASDJobManager_didUpdateStates___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    v5 = v3;
    _os_log_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: didUpdateStates: %{public}@", (uint8_t *)&v6, 0x16u);

  }
  -[ASDJobManager _applyUpdates:usingBlock:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), &__block_literal_global_22);
}

void __33__ASDJobManager_didUpdateStates___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setPhase:", objc_msgSend(a3, "integerValue"));

}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ASDJobManager *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ASDJobManager_applicationInstallsDidChange___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __46__ASDJobManager_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  double v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v28 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
        v8 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v6, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("bundleID"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "installProgress");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fractionCompleted");
        v14 = v13;

        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v15 = v11;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v24 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v20, "percentComplete");
              if (v14 > v21)
                objc_msgSend(v20, "setPercentComplete:", v14);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v17);
        }

        -[ASDJobManager _sendProgressUpdated:](*(_QWORD *)(a1 + 40), v15);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v3);
  }

}

- (void)_sendProgressUpdated:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 48), "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__ASDJobManager__sendProgressUpdated___block_invoke;
    block[3] = &unk_1E37BDE50;
    v8 = v4;
    v9 = a1;
    v10 = v3;
    v6 = v4;
    dispatch_async(v5, block);

  }
}

void __42__ASDJobManager__applyUpdates_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v7 = *(void **)(a1 + 40);
    v8 = v6;
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    v8 = v9;
  }
  objc_msgSend(v7, "addObject:", v8);

}

void __42__ASDJobManager__applyUpdates_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__ASDJobManager__applyUpdates_usingBlock___block_invoke_3;
  v7[3] = &unk_1E37BDC98;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __42__ASDJobManager__applyUpdates_usingBlock___block_invoke_3(uint64_t a1)
{
  -[ASDJobManager _sendJobsChanged:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __36__ASDJobManager__finishJobsWithIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__ASDJobManager__finishJobsWithIDs___block_invoke_2;
  v4[3] = &unk_1E37BDD60;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "finishJobsWithIDs:replyBlock:", v2, v4);
}

void __36__ASDJobManager__finishJobsWithIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ASDJobManager__finishJobsWithIDs___block_invoke_3;
  block[3] = &unk_1E37BDD60;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __36__ASDJobManager__finishJobsWithIDs___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = 0;

}

void __36__ASDJobManager__finishJobsWithIDs___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ASDJobManager__finishJobsWithIDs___block_invoke_5;
  block[3] = &unk_1E37BDD60;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __36__ASDJobManager__finishJobsWithIDs___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = 0;

}

void __36__ASDJobManager__getJobsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__ASDJobManager__getJobsUsingBlock___block_invoke_2;
  v4[3] = &unk_1E37BEEC8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "getJobsUsingReplyBlock:", v4);

}

void __36__ASDJobManager__getJobsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ASDJobManager__getJobsUsingBlock___block_invoke_3;
  block[3] = &unk_1E37BE3D8;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __36__ASDJobManager__getJobsUsingBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsInArray:", v2);

  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __36__ASDJobManager__getJobsUsingBlock___block_invoke_4(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ASDJobManager__getJobsUsingBlock___block_invoke_5;
  block[3] = &unk_1E37BF108;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __36__ASDJobManager__getJobsUsingBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_2;
  v4[3] = &unk_1E37BEEC8;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "getJobsWithIDs:usingReplyBlock:", v3, v4);

}

void __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_3;
  block[3] = &unk_1E37BE3D8;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v28 = v3;
    v29 = 2114;
    v30 = v4;
    v5 = v3;
    _os_log_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Additional jobs arrived: %{public}@", buf, 0x16u);

  }
  v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_30;
  v25[3] = &unk_1E37BFF70;
  v25[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsAtIndexes:", v7);
  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "mutableCopy");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = objc_msgSend(v8, "indexOfObject:", v14, (_QWORD)v21);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v8, "addObject:", v14);
        else
          objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v15, v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend(v8, "copy");
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 24);
  *(_QWORD *)(v17 + 24) = v16;

  v19 = *(_QWORD *)(a1 + 48);
  v20 = (void *)objc_msgSend(v9, "copy");
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

}

uint64_t __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_30(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", a2);
}

void __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_2_32(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_3_33;
  block[3] = &unk_1E37BF108;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_3_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__ASDJobManager__handleInterruptedConnection___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 24), "count");
    if (result)
      return -[ASDJobManager _connectToDaemon](*(_QWORD *)(v2 + 32));
  }
  return result;
}

void __46__ASDJobManager__handleInvalidatedConnection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  if (v3 == v2)
  {
    *(_QWORD *)(v1 + 16) = 0;

  }
}

uint64_t __45__ASDJobManager__registerManagerWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__ASDJobManager__registerManagerWithOptions___block_invoke_2;
  v4[3] = &unk_1E37BFFC0;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "registerJobManagerWithOptions:replyBlock:", v2, v4);
}

void __45__ASDJobManager__registerManagerWithOptions___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _BYTE v16[24];
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  ASDLogHandleForCategory(12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v16 = 138543362;
      *(_QWORD *)&v16[4] = objc_opt_class();
      v11 = *(id *)&v16[4];
      _os_log_impl(&dword_19A03B000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Registration completed successfully", v16, 0xCu);

    }
    v12 = *(_QWORD *)(a1 + 32);
    v13 = v8;
    v10 = v13;
    if (v12)
    {
      v14 = *(NSObject **)(v12 + 8);
      *(_QWORD *)v16 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v16[8] = 3221225472;
      *(_QWORD *)&v16[16] = __34__ASDJobManager__updateActiveIDs___block_invoke;
      v17 = &unk_1E37BDC98;
      v18 = v12;
      v19 = v13;
      dispatch_async(v14, v16);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v16 = 138543618;
    *(_QWORD *)&v16[4] = objc_opt_class();
    *(_WORD *)&v16[12] = 2114;
    *(_QWORD *)&v16[14] = v7;
    v15 = *(id *)&v16[4];
    _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "[%{public}@]: Registration failed with error: %{public}@", v16, 0x16u);

  }
}

void __45__ASDJobManager__registerManagerWithOptions___block_invoke_35(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2114;
    v8 = v2;
    v4 = v6;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: Registration failed with connection error: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

void __34__ASDJobManager__sendJobsChanged___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "jobManager:changedJobs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __36__ASDJobManager__sendJobsCompleted___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "jobManager:completedJobs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __38__ASDJobManager__sendProgressUpdated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "jobManager:updatedProgressOfJobs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __33__ASDJobManager__setupConnection__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEFAULT, "[ASDJobManager]: Server connection was invalidated", (uint8_t *)v8, 2u);
  }

  v5 = v3;
  v6 = v5;
  if (WeakRetained)
  {
    v7 = WeakRetained[1];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__ASDJobManager__handleInvalidatedConnection___block_invoke;
    v8[3] = &unk_1E37BDC98;
    v8[4] = WeakRetained;
    v9 = v5;
    dispatch_async(v7, v8);

  }
}

void __33__ASDJobManager__setupConnection__block_invoke_123(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEFAULT, "[ASDJobManager]: Server connection was interrupted", (uint8_t *)v6, 2u);
  }

  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__ASDJobManager__handleInterruptedConnection___block_invoke;
    v6[3] = &unk_1E37BDD60;
    v6[4] = WeakRetained;
    dispatch_async(v5, v6);
  }

}

void __34__ASDJobManager__updateActiveIDs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(void **)(a1 + 40);
    v5 = v3;
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v3;
    v32 = 2114;
    v33 = v6;
    _os_log_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: updateActiveIDs: %{public}@", buf, 0x16u);

  }
  -[ASDJobManager _mapAllJobsToIDs](*(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "mutableCopy");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18), (_QWORD)v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v13, "removeObject:", v19);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", v19);
          objc_msgSend(v12, "addObject:", v19);
          objc_msgSend(v19, "setPhase:", 4);
        }

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v20 = objc_msgSend(v13, "copy");
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 24);
  *(_QWORD *)(v21 + 24) = v20;

  v23 = *(_QWORD *)(a1 + 32);
  v24 = (void *)objc_msgSend(v12, "copy");
  -[ASDJobManager _sendJobsCompleted:](v23, v24);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_removedJobs, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_jobs, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
