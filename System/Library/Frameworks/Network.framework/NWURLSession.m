@implementation NWURLSession

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NWURLSession;
  if (-[NWURLSession isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (NWURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NWURLSession *v11;
  NWURLSession *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  _BOOL8 v15;
  OS_nw_context *context;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  NSURLSessionConfiguration *internalConfiguration;
  NWURLSessionDelegateWrapper *v24;
  OS_dispatch_queue *v25;
  NWURLSession *v26;
  OS_dispatch_queue *v27;
  id v28;
  id v29;
  NWURLSession *v30;
  NWURLSessionDelegateQueue *v31;
  id v32;
  id v33;
  id v34;
  NSObject *dispatchQueue;
  dispatch_queue_t v36;
  OS_dispatch_queue *v37;
  uint64_t v38;
  NWURLSessionDelegateQueue *delegateQueueWrapper;
  NWURLSessionDelegateWrapper *delegateWrapper;
  uint64_t v41;
  NSHashTable *weakUnresumedTasks;
  NSMutableSet *v43;
  NSMutableSet *runningTasks;
  NSMutableDictionary *v45;
  NSMutableDictionary *trustExceptions;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  objc_super v56;
  objc_super v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v55.receiver = self;
  v55.super_class = (Class)NWURLSession;
  v11 = -[NWURLSession init](&v55, sel_init);
  v12 = v11;
  if (v11)
  {
    uuid_generate_random(v11->uuid);
    v12->lock._os_unfair_lock_opaque = 0;
    v13 = dispatch_queue_create("com.apple.NWURLSession", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    v15 = -[NWConcrete_nw_context initWithIdentifier:]([NWConcrete_nw_context alloc], "NWURLSession");
    context = v12->_context;
    v12->_context = (OS_nw_context *)v15;

    nw_context_set_isolate_protocol_cache(v12->_context, 1);
    nw_context_set_privacy_level(v12->_context, objc_msgSend(v8, "_loggingPrivacyLevel"));
    nw_context_activate(v12->_context);
    nw_queue_context_target_dispatch_queue(v12->_context, v12->_queue);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v8, "_proxyConfigurations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(v17);
          nw_context_add_proxy(v12->_context, *(void **)(*((_QWORD *)&v51 + 1) + 8 * i));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      }
      while (v19);
    }

    v48 = v8;
    if (v8)
    {
      v22 = objc_msgSend(v8, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    internalConfiguration = v12->_internalConfiguration;
    v12->_internalConfiguration = (NSURLSessionConfiguration *)v22;

    v24 = [NWURLSessionDelegateWrapper alloc];
    v25 = v12->_queue;
    v26 = v12;
    v27 = v25;
    v50 = v9;
    v28 = v9;
    v49 = v10;
    v29 = v10;
    if (!v24)
      goto LABEL_22;
    v56.receiver = v24;
    v56.super_class = (Class)NWURLSessionDelegateWrapper;
    v30 = -[NWURLSession init](&v56, sel_init);
    v24 = (NWURLSessionDelegateWrapper *)v30;
    if (!v30)
      goto LABEL_22;
    *(_QWORD *)&v30->_nextTaskIdentifier = v26;
    objc_storeStrong((id *)&v30->_HTTPCookieStorage, v25);
    objc_storeStrong((id *)&v24->_wrappedDelegate, a4);
    v31 = [NWURLSessionDelegateQueue alloc];
    v32 = v29;
    if (v31)
    {
      v57.receiver = v31;
      v57.super_class = (Class)NWURLSessionDelegateQueue;
      v33 = -[NWURLSession init](&v57, sel_init);
      v31 = (NWURLSessionDelegateQueue *)v33;
      if (v33)
      {
        objc_storeStrong((id *)v33 + 2, a5);
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v34 = (id)objc_claimAutoreleasedReturnValue();

        if (v34 == v32)
        {
          getMainQueue();
          v38 = objc_claimAutoreleasedReturnValue();
          dispatchQueue = v31->__dispatchQueue;
          v31->__dispatchQueue = (OS_dispatch_queue *)v38;
          goto LABEL_20;
        }
        if (!v32)
        {
          dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          dispatchQueue = objc_claimAutoreleasedReturnValue();
          v36 = dispatch_queue_create("com.apple.NSURLSession-delegate", dispatchQueue);
          v37 = v31->__dispatchQueue;
          v31->__dispatchQueue = (OS_dispatch_queue *)v36;

LABEL_20:
        }
      }
    }

    delegateQueueWrapper = v24->_delegateQueueWrapper;
    v24->_delegateQueueWrapper = v31;

LABEL_22:
    delegateWrapper = v26->_delegateWrapper;
    v26->_delegateWrapper = v24;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v41 = objc_claimAutoreleasedReturnValue();
    weakUnresumedTasks = v26->_weakUnresumedTasks;
    v26->_weakUnresumedTasks = (NSHashTable *)v41;

    v43 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    runningTasks = v26->_runningTasks;
    v26->_runningTasks = v43;

    v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trustExceptions = v26->_trustExceptions;
    v26->_trustExceptions = v45;

    v10 = v49;
    v9 = v50;
    v8 = v48;
  }

  return v12;
}

- (NSURLSessionConfiguration)configuration
{
  if (self)
    self = (NWURLSession *)self->_internalConfiguration;
  return (NSURLSessionConfiguration *)(id)-[NWURLSession copy](self, "copy");
}

- (NSOperationQueue)delegateQueue
{
  NWURLSessionDelegateWrapper *delegateWrapper;
  os_unfair_lock_s *delegateQueueWrapper;
  const char *v4;
  _QWORD *v6;
  _QWORD v7[2];
  void (*v8)(uint64_t, const char *);
  void *v9;
  os_unfair_lock_s *v10;

  if (!self)
    return (NSOperationQueue *)self;
  delegateWrapper = self->_delegateWrapper;
  if (delegateWrapper)
  {
    delegateQueueWrapper = (os_unfair_lock_s *)delegateWrapper->_delegateQueueWrapper;
    if (delegateQueueWrapper)
    {
      if (!objc_getProperty(delegateWrapper->_delegateQueueWrapper, a2, 16, 1))
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v8 = __42__NWURLSessionDelegateQueue_delegateQueue__block_invoke;
        v9 = &unk_1E14ACFD0;
        v10 = delegateQueueWrapper;
        v6 = v7;
        os_unfair_lock_lock(delegateQueueWrapper + 2);
        ((void (*)(_QWORD *))v8)(v6);

        os_unfair_lock_unlock(delegateQueueWrapper + 2);
      }
      self = (NWURLSession *)objc_getProperty(delegateQueueWrapper, v4, 16, 1);
      return (NSOperationQueue *)self;
    }
  }
  return (NSOperationQueue *)0;
}

- (NSURLSessionDelegate)delegate
{
  NWURLSessionDelegateWrapper *delegateWrapper;

  if (self && (delegateWrapper = self->_delegateWrapper) != 0)
    return (NSURLSessionDelegate *)objc_getProperty(delegateWrapper, a2, 16, 1);
  else
    return 0;
}

- (void)finishTasksAndInvalidate
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  int v6;
  __int16 v7;
  unsigned __int8 *uuid;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v3 = (id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v6 = 16;
    v7 = 2098;
    uuid = self->uuid;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEFAULT, "Session <%{public,uuid_t}.16P> finish tasks and invalidate", buf, 0x12u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__NWURLSession_finishTasksAndInvalidate__block_invoke;
  v4[3] = &unk_1E14ACFD0;
  v4[4] = self;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v4);
}

- (void)invalidateAndCancel
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  int v6;
  __int16 v7;
  unsigned __int8 *uuid;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v3 = (id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v6 = 16;
    v7 = 2098;
    uuid = self->uuid;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEFAULT, "Session <%{public,uuid_t}.16P> invalidate and cancel", buf, 0x12u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__NWURLSession_invalidateAndCancel__block_invoke;
  v4[3] = &unk_1E14ACFD0;
  v4[4] = self;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v4);
}

- (void)resetWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  unsigned __int8 *uuid;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v5 = (id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v11 = 16;
    v12 = 2098;
    uuid = self->uuid;
    _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEFAULT, "Session <%{public,uuid_t}.16P> reset", buf, 0x12u);
  }

  if (self)
    self = (NWURLSession *)self->_delegateWrapper;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__NWURLSession_resetWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E14AC390;
  v9 = v4;
  v6 = v4;
  v7 = v6;
  if (self)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:]((_QWORD *)self->_URLCredentialStorage, v8);
    v7 = v9;
  }

}

- (void)flushWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  unsigned __int8 *uuid;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v5 = (id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v11 = 16;
    v12 = 2098;
    uuid = self->uuid;
    _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEFAULT, "Session <%{public,uuid_t}.16P> flush", buf, 0x12u);
  }

  if (self)
    self = (NWURLSession *)self->_delegateWrapper;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__NWURLSession_flushWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E14AC390;
  v9 = v4;
  v6 = v4;
  v7 = v6;
  if (self)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:]((_QWORD *)self->_URLCredentialStorage, v8);
    v7 = v9;
  }

}

- (void)getTasksWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__NWURLSession_getTasksWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E14ACE18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v6);
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);

}

- (void)getAllTasksWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E14ACE18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v6);

}

- (id)dataTaskWithRequest:(id)a3
{
  return -[NWURLSession _dataTaskWithRequest:delegate:](self, "_dataTaskWithRequest:delegate:", a3, 0);
}

- (id)dataTaskWithURL:(id)a3
{
  return -[NWURLSession _dataTaskWithURL:delegate:](self, "_dataTaskWithURL:delegate:", a3, 0);
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  const char *v15;
  void *v16;
  id v17;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  NWURLSession *v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("URLSessionTask created with nil URL");
    goto LABEL_13;
  }
  if (!v7)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("URLSessionTask created with nil fileURL");
    goto LABEL_13;
  }
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("URLSessionTask created with invalid fileURL");
LABEL_13:
    objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__43487;
  v35 = __Block_byref_object_dispose__43488;
  v36 = 0;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __47__NWURLSession_uploadTaskWithRequest_fromFile___block_invoke;
  v26 = &unk_1E14A2198;
  v27 = self;
  v9 = v7;
  v28 = v9;
  v10 = v6;
  v29 = v10;
  v30 = &v31;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v23);
  v11 = v32[5];
  if (v11)
  {
    v12 = 240;
    if (!*(_QWORD *)(v11 + 240))
      v12 = 232;
    v13 = *(id *)(v11 + v12);
    if (v13)
    {
      v14 = (id)v32[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLSession:didCreateTask:", v13[4], v14, v23, v24, v25, v26, v27, v28);

    }
  }
  else
  {
    v13 = 0;
  }

  v17 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  const char *v15;
  void *v16;
  id v17;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  NWURLSession *v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("URLSessionTask created with nil URL");
    goto LABEL_11;
  }
  if (!v7)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("URLSessionTask created with nil bodyData");
LABEL_11:
    objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__43487;
  v35 = __Block_byref_object_dispose__43488;
  v36 = 0;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __47__NWURLSession_uploadTaskWithRequest_fromData___block_invoke;
  v26 = &unk_1E14A2198;
  v27 = self;
  v9 = v7;
  v28 = v9;
  v10 = v6;
  v29 = v10;
  v30 = &v31;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v23);
  v11 = v32[5];
  if (v11)
  {
    v12 = 240;
    if (!*(_QWORD *)(v11 + 240))
      v12 = 232;
    v13 = *(id *)(v11 + v12);
    if (v13)
    {
      v14 = (id)v32[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLSession:didCreateTask:", v13[4], v14, v23, v24, v25, v26, v27, v28);

    }
  }
  else
  {
    v13 = 0;
  }

  v17 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (id)uploadTaskWithStreamedRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionTask created with nil URL"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__43487;
  v23 = __Block_byref_object_dispose__43488;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__NWURLSession_uploadTaskWithStreamedRequest___block_invoke;
  v16[3] = &unk_1E14A2D98;
  v16[4] = self;
  v6 = v4;
  v17 = v6;
  v18 = &v19;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v16);
  v7 = v20[5];
  if (v7)
  {
    v8 = 240;
    if (!*(_QWORD *)(v7 + 240))
      v8 = 232;
    v9 = *(id *)(v7 + v8);
    if (v9)
    {
      v10 = (id)v20[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLSession:didCreateTask:", v9[4], v10);

    }
  }
  else
  {
    v9 = 0;
  }

  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)downloadTaskWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionTask created with nil URL"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__43487;
  v23 = __Block_byref_object_dispose__43488;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__NWURLSession_downloadTaskWithRequest___block_invoke;
  v16[3] = &unk_1E14A2D98;
  v16[4] = self;
  v6 = v4;
  v17 = v6;
  v18 = &v19;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v16);
  v7 = v20[5];
  if (v7)
  {
    v8 = 240;
    if (!*(_QWORD *)(v7 + 240))
      v8 = 232;
    v9 = *(id *)(v7 + v8);
    if (v9)
    {
      v10 = (id)v20[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLSession:didCreateTask:", v9[4], v10);

    }
  }
  else
  {
    v9 = 0;
  }

  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)downloadTaskWithURL:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionTask created with nil URL"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__43487;
  v22 = __Block_byref_object_dispose__43488;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __36__NWURLSession_downloadTaskWithURL___block_invoke;
  v15[3] = &unk_1E14A2D98;
  v15[4] = self;
  v5 = v4;
  v16 = v5;
  v17 = &v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v15);
  v6 = v19[5];
  if (v6)
  {
    v7 = 240;
    if (!*(_QWORD *)(v6 + 240))
      v7 = 232;
    v8 = *(id *)(v6 + v7);
    if (v8)
    {
      v9 = (id)v19[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLSession:didCreateTask:", v8[4], v9);

    }
  }
  else
  {
    v8 = 0;
  }

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)downloadTaskWithResumeData:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionDownloadTask created with nil resume data"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__43487;
  v22 = __Block_byref_object_dispose__43488;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__NWURLSession_downloadTaskWithResumeData___block_invoke;
  v15[3] = &unk_1E14A2D98;
  v15[4] = self;
  v5 = v4;
  v16 = v5;
  v17 = &v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v15);
  v6 = v19[5];
  if (v6)
  {
    v7 = 240;
    if (!*(_QWORD *)(v6 + 240))
      v7 = 232;
    v8 = *(id *)(v6 + v7);
    if (v8)
    {
      v9 = (id)v19[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLSession:didCreateTask:", v8[4], v9);

    }
  }
  else
  {
    v8 = 0;
  }

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)streamTaskWithHostName:(id)a3 port:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD *);
  void *v23;
  NWURLSession *v24;
  id v25;
  uint64_t *v26;
  int64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  if (!v6)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("URLSessionTask created with nil hostname");
    goto LABEL_11;
  }
  if ((unint64_t)(a4 - 0x10000) <= 0xFFFFFFFFFFFF0000)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("URLSessionTask created with invalid port");
LABEL_11:
    objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__43487;
  v32 = __Block_byref_object_dispose__43488;
  v33 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __44__NWURLSession_streamTaskWithHostName_port___block_invoke;
  v23 = &unk_1E14A2B60;
  v24 = self;
  v26 = &v28;
  v7 = v6;
  v25 = v7;
  v27 = a4;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v20);
  v8 = v29[5];
  if (v8)
  {
    v9 = 240;
    if (!*(_QWORD *)(v8 + 240))
      v9 = 232;
    v10 = *(id *)(v8 + v9);
    if (v10)
    {
      v11 = (id)v29[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLSession:didCreateTask:", v10[4], v11, v20, v21, v22, v23, v24);

    }
  }
  else
  {
    v10 = 0;
  }

  v14 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (id)streamTaskWithNetService:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("NetService is not supported by the new loader"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)webSocketTaskWithURL:(id)a3
{
  return -[NWURLSession webSocketTaskWithURL:protocols:](self, "webSocketTaskWithURL:protocols:", a3, MEMORY[0x1E0C9AA60]);
}

- (id)webSocketTaskWithURL:(id)a3 protocols:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  NWURLSession *v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("URLSessionTask created with nil URL");
    goto LABEL_14;
  }
  v8 = v7;
  objc_msgSend(v6, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("ws"))
    && objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("wss")))
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("URLSessionTask created with invalid URL scheme");
LABEL_14:
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  if (!v8)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("URLSessionTask created with nil protocols");
    goto LABEL_14;
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__43487;
  v36 = __Block_byref_object_dispose__43488;
  v37 = 0;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __47__NWURLSession_webSocketTaskWithURL_protocols___block_invoke;
  v27 = &unk_1E14A2198;
  v28 = self;
  v10 = v6;
  v29 = v10;
  v11 = v8;
  v30 = v11;
  v31 = &v32;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v24);
  v12 = v33[5];
  if (v12)
  {
    v13 = 240;
    if (!*(_QWORD *)(v12 + 240))
      v13 = 232;
    v14 = *(id *)(v12 + v13);
    if (v14)
    {
      v15 = (id)v33[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLSession:didCreateTask:", v14[4], v15, v24, v25, v26, v27, v28, v29);

    }
  }
  else
  {
    v14 = 0;
  }

  v18 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (id)webSocketTaskWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = CFSTR("URLSessionTask created with nil URL");
    goto LABEL_12;
  }
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("ws"))
    && objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("wss")))
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = CFSTR("URLSessionTask created with invalid URL scheme");
LABEL_12:
    objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v19, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__43487;
  v28 = __Block_byref_object_dispose__43488;
  v29 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __41__NWURLSession_webSocketTaskWithRequest___block_invoke;
  v21[3] = &unk_1E14A2D98;
  v21[4] = self;
  v8 = v4;
  v22 = v8;
  v23 = &v24;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v21);
  v9 = v25[5];
  if (v9)
  {
    v10 = 240;
    if (!*(_QWORD *)(v9 + 240))
      v10 = 232;
    v11 = *(id *)(v9 + v10);
    if (v11)
    {
      v12 = (id)v25[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLSession:didCreateTask:", v11[4], v12);

    }
  }
  else
  {
    v11 = 0;
  }

  v15 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v15;
}

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return -[NWURLSession _dataTaskWithRequest:delegate:completionHandler:](self, "_dataTaskWithRequest:delegate:completionHandler:", a3, 0, a4);
}

- (id)dataTaskWithURL:(id)a3 completionHandler:(id)a4
{
  return -[NWURLSession _dataTaskWithURL:delegate:completionHandler:](self, "_dataTaskWithURL:delegate:completionHandler:", a3, 0, a4);
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4 completionHandler:(id)a5
{
  return -[NWURLSession _uploadTaskWithRequest:fromFile:delegate:completionHandler:](self, "_uploadTaskWithRequest:fromFile:delegate:completionHandler:", a3, a4, 0, a5);
}

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4 completionHandler:(id)a5
{
  return -[NWURLSession _uploadTaskWithRequest:fromData:delegate:completionHandler:](self, "_uploadTaskWithRequest:fromData:delegate:completionHandler:", a3, a4, 0, a5);
}

- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return -[NWURLSession _downloadTaskWithRequest:delegate:completionHandler:](self, "_downloadTaskWithRequest:delegate:completionHandler:", a3, 0, a4);
}

- (id)downloadTaskWithURL:(id)a3 completionHandler:(id)a4
{
  return -[NWURLSession _downloadTaskWithURL:delegate:completionHandler:](self, "_downloadTaskWithURL:delegate:completionHandler:", a3, 0, a4);
}

- (id)downloadTaskWithResumeData:(id)a3 completionHandler:(id)a4
{
  return -[NWURLSession _downloadTaskWithResumeData:delegate:completionHandler:](self, "_downloadTaskWithResumeData:delegate:completionHandler:", a3, 0, a4);
}

- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  const char *v15;
  void *v16;
  id v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  NWURLSession *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionTask created with nil URL"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__43487;
  v32 = __Block_byref_object_dispose__43488;
  v33 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __46__NWURLSession__dataTaskWithRequest_delegate___block_invoke;
  v23 = &unk_1E14A2198;
  v24 = self;
  v9 = v6;
  v25 = v9;
  v27 = &v28;
  v10 = v7;
  v26 = v10;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v20);
  v11 = v29[5];
  if (v11)
  {
    v12 = 240;
    if (!*(_QWORD *)(v11 + 240))
      v12 = 232;
    v13 = *(id *)(v11 + v12);
    if (v13)
    {
      v14 = (id)v29[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLSession:didCreateTask:", v13[4], v14, v20, v21, v22, v23, v24, v25);

    }
  }
  else
  {
    v13 = 0;
  }

  v17 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v17;
}

- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  const char *v15;
  void *v16;
  id v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *);
  void *v23;
  NWURLSession *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionTask created with nil URL"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v8 = v7;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__43487;
  v32 = __Block_byref_object_dispose__43488;
  v33 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __42__NWURLSession__dataTaskWithURL_delegate___block_invoke;
  v23 = &unk_1E14A2198;
  v24 = self;
  v9 = v6;
  v25 = v9;
  v27 = &v28;
  v10 = v8;
  v26 = v10;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v20);
  v11 = v29[5];
  if (v11)
  {
    v12 = 240;
    if (!*(_QWORD *)(v11 + 240))
      v12 = 232;
    v13 = *(id *)(v11 + v12);
    if (v13)
    {
      v14 = (id)v29[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLSession:didCreateTask:", v13[4], v14, v20, v21, v22, v23, v24, v25);

    }
  }
  else
  {
    v13 = 0;
  }

  v17 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v17;
}

- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionTask created with nil URL"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__43487;
  v33 = __Block_byref_object_dispose__43488;
  v34 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__NWURLSession__dataTaskWithRequest_delegate_completionHandler___block_invoke;
  v24[3] = &unk_1E14A21E8;
  v24[4] = self;
  v12 = v8;
  v25 = v12;
  v28 = &v29;
  v13 = v10;
  v27 = v13;
  v14 = v9;
  v26 = v14;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v24);
  v15 = v30[5];
  if (v15)
  {
    v16 = 240;
    if (!*(_QWORD *)(v15 + 240))
      v16 = 232;
    v17 = *(id *)(v15 + v16);
    if (v17)
    {
      v18 = (id)v30[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLSession:didCreateTask:", v17[4], v18);

    }
  }
  else
  {
    v17 = 0;
  }

  v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionTask created with nil URL"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v11 = v10;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__43487;
  v33 = __Block_byref_object_dispose__43488;
  v34 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__NWURLSession__dataTaskWithURL_delegate_completionHandler___block_invoke;
  v24[3] = &unk_1E14A21E8;
  v24[4] = self;
  v12 = v8;
  v25 = v12;
  v28 = &v29;
  v13 = v11;
  v27 = v13;
  v14 = v9;
  v26 = v14;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v24);
  v15 = v30[5];
  if (v15)
  {
    v16 = 240;
    if (!*(_QWORD *)(v15 + 240))
      v16 = 232;
    v17 = *(id *)(v15 + v16);
    if (v17)
    {
      v18 = (id)v30[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLSession:didCreateTask:", v17[4], v18);

    }
  }
  else
  {
    v17 = 0;
  }

  v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (id)_uploadTaskWithRequest:(id)a3 fromFile:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  const char *v23;
  void *v24;
  id v25;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  NWURLSession *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v29 = CFSTR("URLSessionTask created with nil URL");
    goto LABEL_13;
  }
  if (!v11)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v29 = CFSTR("URLSessionTask created with nil fileURL");
    goto LABEL_13;
  }
  if ((objc_msgSend(v11, "isFileURL") & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v29 = CFSTR("URLSessionTask created with invalid fileURL");
LABEL_13:
    objc_msgSend(v27, "exceptionWithName:reason:userInfo:", v28, v29, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__43487;
  v45 = __Block_byref_object_dispose__43488;
  v46 = 0;
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __75__NWURLSession__uploadTaskWithRequest_fromFile_delegate_completionHandler___block_invoke;
  v34 = &unk_1E14A21C0;
  v35 = self;
  v15 = v11;
  v36 = v15;
  v16 = v10;
  v37 = v16;
  v40 = &v41;
  v17 = v13;
  v39 = v17;
  v18 = v12;
  v38 = v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v31);
  v19 = v42[5];
  if (v19)
  {
    v20 = 240;
    if (!*(_QWORD *)(v19 + 240))
      v20 = 232;
    v21 = *(id *)(v19 + v20);
    if (v21)
    {
      v22 = (id)v42[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v21, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "URLSession:didCreateTask:", v21[4], v22, v31, v32, v33, v34, v35, v36, v37);

    }
  }
  else
  {
    v21 = 0;
  }

  v25 = (id)v42[5];
  _Block_object_dispose(&v41, 8);

  return v25;
}

- (id)_uploadTaskWithRequest:(id)a3 fromData:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  const char *v23;
  void *v24;
  id v25;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  NWURLSession *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v29 = CFSTR("URLSessionTask created with nil URL");
    goto LABEL_11;
  }
  if (!v11)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v29 = CFSTR("URLSessionTask created with nil bodyData");
LABEL_11:
    objc_msgSend(v27, "exceptionWithName:reason:userInfo:", v28, v29, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__43487;
  v45 = __Block_byref_object_dispose__43488;
  v46 = 0;
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __75__NWURLSession__uploadTaskWithRequest_fromData_delegate_completionHandler___block_invoke;
  v34 = &unk_1E14A21C0;
  v35 = self;
  v15 = v11;
  v36 = v15;
  v16 = v10;
  v37 = v16;
  v40 = &v41;
  v17 = v13;
  v39 = v17;
  v18 = v12;
  v38 = v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v31);
  v19 = v42[5];
  if (v19)
  {
    v20 = 240;
    if (!*(_QWORD *)(v19 + 240))
      v20 = 232;
    v21 = *(id *)(v19 + v20);
    if (v21)
    {
      v22 = (id)v42[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v21, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "URLSession:didCreateTask:", v21[4], v22, v31, v32, v33, v34, v35, v36, v37);

    }
  }
  else
  {
    v21 = 0;
  }

  v25 = (id)v42[5];
  _Block_object_dispose(&v41, 8);

  return v25;
}

- (id)_downloadTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionTask created with nil URL"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__43487;
  v33 = __Block_byref_object_dispose__43488;
  v34 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __68__NWURLSession__downloadTaskWithRequest_delegate_completionHandler___block_invoke;
  v24[3] = &unk_1E14A21E8;
  v24[4] = self;
  v12 = v8;
  v25 = v12;
  v28 = &v29;
  v13 = v10;
  v27 = v13;
  v14 = v9;
  v26 = v14;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v24);
  v15 = v30[5];
  if (v15)
  {
    v16 = 240;
    if (!*(_QWORD *)(v15 + 240))
      v16 = 232;
    v17 = *(id *)(v15 + v16);
    if (v17)
    {
      v18 = (id)v30[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLSession:didCreateTask:", v17[4], v18);

    }
  }
  else
  {
    v17 = 0;
  }

  v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (id)_downloadTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionTask created with nil URL"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v11 = v10;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__43487;
  v33 = __Block_byref_object_dispose__43488;
  v34 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__NWURLSession__downloadTaskWithURL_delegate_completionHandler___block_invoke;
  v24[3] = &unk_1E14A21E8;
  v24[4] = self;
  v12 = v8;
  v25 = v12;
  v28 = &v29;
  v13 = v11;
  v27 = v13;
  v14 = v9;
  v26 = v14;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v24);
  v15 = v30[5];
  if (v15)
  {
    v16 = 240;
    if (!*(_QWORD *)(v15 + 240))
      v16 = 232;
    v17 = *(id *)(v15 + v16);
    if (v17)
    {
      v18 = (id)v30[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLSession:didCreateTask:", v17[4], v18);

    }
  }
  else
  {
    v17 = 0;
  }

  v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (id)_downloadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("URLSessionDownloadTask created with nil resume data"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v11 = v10;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__43487;
  v33 = __Block_byref_object_dispose__43488;
  v34 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __71__NWURLSession__downloadTaskWithResumeData_delegate_completionHandler___block_invoke;
  v24[3] = &unk_1E14A21E8;
  v24[4] = self;
  v12 = v8;
  v25 = v12;
  v13 = v11;
  v27 = v13;
  v28 = &v29;
  v14 = v9;
  v26 = v14;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v24);
  v15 = v30[5];
  if (v15)
  {
    v16 = 240;
    if (!*(_QWORD *)(v15 + 240))
      v16 = 232;
    v17 = *(id *)(v15 + v16);
    if (v17)
    {
      v18 = (id)v30[5];
      -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLSession:didCreateTask:", v17[4], v18);

    }
  }
  else
  {
    v17 = 0;
  }

  v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (OS_nw_context)_networkContext
{
  if (self)
    self = (NWURLSession *)self->_context;
  return (OS_nw_context *)self;
}

- (NSString)sessionDescription
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSessionDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trustExceptions, 0);
  objc_storeStrong((id *)&self->_runningTasks, 0);
  objc_storeStrong((id *)&self->_weakUnresumedTasks, 0);
  objc_storeStrong((id *)&self->_internalConfiguration, 0);
  objc_storeStrong((id *)&self->_sessionDescription, 0);
  objc_storeStrong((id *)&self->_connectionProxyArray, 0);
  objc_storeStrong((id *)&self->_altSvcStorage, 0);
  objc_storeStrong((id *)&self->_URLCredentialCache, 0);
  objc_storeStrong((id *)&self->_URLCredentialStorage, 0);
  objc_storeStrong((id *)&self->_HTTPCookieStorage, 0);
}

void __71__NWURLSession__downloadTaskWithResumeData_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  NWURLSessionResponseConsumerDownload *v4;
  id v5;
  id *v6;
  NWURLSessionDownloadTask *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  id *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id *v20;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionDownloadTask created on an invalidated session"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  +[NWURLSessionDownloadResumeInfo infoWithResumeData:]((uint64_t)NWURLSessionDownloadResumeInfo, *(void **)(a1 + 40));
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v20 = v3;
    v4 = [NWURLSessionResponseConsumerDownload alloc];
    v5 = v20[9];
    v6 = -[NWURLSessionResponseConsumerDownload initWithResumeInfo:completionHandler:]((id *)&v4->super.isa, v5, *(void **)(a1 + 56));

    v7 = [NWURLSessionDownloadTask alloc];
    v8 = objc_msgSend(v6, "countOfBytesReceived");
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v10 = *(_DWORD *)(v9 + 32) + 1;
      *(_DWORD *)(v9 + 32) = v10;
      v11 = *(void **)(a1 + 32);
    }
    else
    {
      v11 = 0;
      v10 = 1;
    }
    v12 = -[NWURLSessionDownloadTask initWithResumeInfo:fromOffset:identifier:session:]((id *)&v7->super.super.isa, v20, v8, v10, v11);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v15)
    {
      objc_storeStrong((id *)(v15 + 416), v6);
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v16, "setDelegate:", *(_QWORD *)(a1 + 48));
    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
      v18 = *(void **)(v17 + 96);
    else
      v18 = 0;
    objc_msgSend(v18, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

    v3 = v20;
  }

}

- (void)withLock:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v3;
  void (**v4)(void);

  v4 = a2;
  if (a1)
  {
    v3 = a1 + 6;
    os_unfair_lock_lock(v3);
    v4[2]();
    os_unfair_lock_unlock(v3);
  }

}

void __64__NWURLSession__downloadTaskWithURL_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NWURLSessionDownloadTask *v4;
  uint64_t v5;
  int v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  NWURLSessionResponseConsumerDownload *v11;
  id v12;
  void *v13;
  id completionHandler;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  objc_super v20;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [NWURLSessionDownloadTask alloc];
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = *(_DWORD *)(v5 + 32) + 1;
    *(_DWORD *)(v5 + 32) = v6;
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v7 = 0;
    v6 = 1;
  }
  v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v19, v6, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = [NWURLSessionResponseConsumerDownload alloc];
  v12 = *(id *)(a1 + 56);
  if (v11)
  {
    v20.receiver = v11;
    v20.super_class = (Class)NWURLSessionResponseConsumerDownload;
    v11 = (NWURLSessionResponseConsumerDownload *)objc_msgSendSuper2(&v20, sel_init);
    if (v11)
    {
      v13 = _Block_copy(v12);
      completionHandler = v11->_completionHandler;
      v11->_completionHandler = v13;

    }
  }

  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v15)
    objc_storeStrong((id *)(v15 + 416), v11);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPrefersIncrementalDelivery:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 48));
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    v17 = *(void **)(v16 + 96);
  else
    v17 = 0;
  objc_msgSend(v17, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

- (id)preparedRequestFromRequest:(void *)a3 bodyInfo:
{
  id v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[8];
  _QWORD v23[4];
  id v24;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = a1[11];
    objc_msgSend(v7, "HTTPAdditionalHeaders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __52__NWURLSession_preparedRequestFromRequest_bodyInfo___block_invoke;
    v23[3] = &unk_1E14A2210;
    v9 = v5;

    v24 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v23);

    objc_msgSend(v9, "valueForHTTPHeaderField:", CFSTR("Connection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "setValue:forHTTPHeaderField:", 0, CFSTR("Connection"));
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v11 = (id)gurlLogObj;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_182FBE000, v11, OS_LOG_TYPE_ERROR, "HTTP/1-only header field \"Connection\" should not be set on the request.", buf, 2u);
      }

    }
    objc_msgSend(v9, "valueForHTTPHeaderField:", CFSTR("Transfer-Encoding"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v9, "setValue:forHTTPHeaderField:", 0, CFSTR("Transfer-Encoding"));
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v13 = (id)gurlLogObj;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_182FBE000, v13, OS_LOG_TYPE_ERROR, "HTTP/1-only header field \"Transfer-Encoding\" should not be set on the request.", buf, 2u);
      }

    }
    if (!v6 || v6[1] != -1)
    {
      if (!v9)
        goto LABEL_28;
      objc_msgSend(v9, "HTTPMethod");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("GET"));

      if (v15)
      {
        objc_msgSend(v9, "HTTPMethod");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "caseInsensitiveCompare:", CFSTR("HEAD"));

        if (v18)
        {
LABEL_28:
          objc_msgSend(v9, "valueForHTTPHeaderField:", CFSTR("Content-Length"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            if (v6)
              v20 = v6[1];
            else
              v20 = 0;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setValue:forHTTPHeaderField:", v21, CFSTR("Content-Length"));

          }
        }
      }
    }
    a1 = (id *)v9;

  }
  return a1;
}

void __52__NWURLSession_preparedRequestFromRequest_bodyInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForHTTPHeaderField:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v5, v7);

}

void __68__NWURLSession__downloadTaskWithRequest_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NWURLSessionRequestBodyInfo *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  NWURLSessionDownloadTask *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NWURLSessionResponseConsumerDownload *v17;
  id v18;
  void *v19;
  id completionHandler;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id obj;
  objc_super v26;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 120);
  else
    v5 = 0;
  obj = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, *(void **)(a1 + 40), v5);
  v6 = *(id **)(a1 + 32);
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [NWURLSessionDownloadTask alloc];
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    v12 = *(void **)(a1 + 32);
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.isa, v8, v11, v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v16)
    objc_storeStrong((id *)(v16 + 408), obj);
  v17 = [NWURLSessionResponseConsumerDownload alloc];
  v18 = *(id *)(a1 + 56);
  if (v17)
  {
    v26.receiver = v17;
    v26.super_class = (Class)NWURLSessionResponseConsumerDownload;
    v17 = (NWURLSessionResponseConsumerDownload *)objc_msgSendSuper2(&v26, sel_init);
    if (v17)
    {
      v19 = _Block_copy(v18);
      completionHandler = v17->_completionHandler;
      v17->_completionHandler = v19;

    }
  }

  v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v21)
    objc_storeStrong((id *)(v21 + 416), v17);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPrefersIncrementalDelivery:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 48));
  v22 = *(_QWORD *)(a1 + 32);
  if (v22)
    v23 = *(void **)(v22 + 96);
  else
    v23 = 0;
  objc_msgSend(v23, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

void __75__NWURLSession__uploadTaskWithRequest_fromData_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NWURLSessionRequestBodyInfo *v3;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  NWURLSessionUploadTask *v11;
  uint64_t v12;
  int v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD *obj;
  objc_super v25;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  v4 = *(id *)(a1 + 40);
  if (v3
    && (v25.receiver = v3,
        v25.super_class = (Class)NWURLSessionRequestBodyInfo,
        (v5 = objc_msgSendSuper2(&v25, sel_init)) != 0))
  {
    obj = v5;
    v6 = objc_msgSend(v4, "_createDispatchData");
    v7 = (void *)obj[2];
    obj[2] = v6;

    obj[1] = objc_msgSend(v4, "length");
  }
  else
  {
    obj = 0;
  }

  v8 = *(id **)(a1 + 32);
  v9 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v8, v9, obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [NWURLSessionUploadTask alloc];
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    v13 = *(_DWORD *)(v12 + 32) + 1;
    *(_DWORD *)(v12 + 32) = v13;
    v14 = *(void **)(a1 + 32);
  }
  else
  {
    v14 = 0;
    v13 = 1;
  }
  v15 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v11->super.super.super.isa, v10, v13, v14);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v18)
    objc_storeStrong((id *)(v18 + 408), obj);
  v19 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]((id *)[NWURLSessionResponseConsumerDataCompletionHandler alloc], *(void **)(a1 + 64));
  v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v20)
    objc_storeStrong((id *)(v20 + 416), v19);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPrefersIncrementalDelivery:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 56));
  v21 = *(_QWORD *)(a1 + 32);
  if (v21)
    v22 = *(void **)(v21 + 96);
  else
    v22 = 0;
  objc_msgSend(v22, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

}

void __75__NWURLSession__uploadTaskWithRequest_fromFile_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NWURLSessionRequestBodyInfo *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  NWURLSessionUploadTask *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id *obj;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 120);
  else
    v5 = 0;
  obj = -[NWURLSessionRequestBodyInfo initWithFileURL:queue:]((id *)&v3->super.isa, *(void **)(a1 + 40), v5);
  v6 = *(id **)(a1 + 32);
  v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [NWURLSessionUploadTask alloc];
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    v12 = *(void **)(a1 + 32);
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.super.isa, v8, v11, v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v16)
    objc_storeStrong((id *)(v16 + 408), obj);
  v17 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]((id *)[NWURLSessionResponseConsumerDataCompletionHandler alloc], *(void **)(a1 + 64));
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v18)
    objc_storeStrong((id *)(v18 + 416), v17);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPrefersIncrementalDelivery:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 56));
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    v20 = *(void **)(v19 + 96);
  else
    v20 = 0;
  objc_msgSend(v20, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

}

void __60__NWURLSession__dataTaskWithURL_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NWURLSessionDataTask *v4;
  uint64_t v5;
  int v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [NWURLSessionDataTask alloc];
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = *(_DWORD *)(v5 + 32) + 1;
    *(_DWORD *)(v5 + 32) = v6;
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v7 = 0;
    v6 = 1;
  }
  v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v16, v6, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]((id *)[NWURLSessionResponseConsumerDataCompletionHandler alloc], *(void **)(a1 + 56));
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v12)
    objc_storeStrong((id *)(v12 + 416), v11);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPrefersIncrementalDelivery:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 48));
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    v14 = *(void **)(v13 + 96);
  else
    v14 = 0;
  objc_msgSend(v14, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

void __64__NWURLSession__dataTaskWithRequest_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NWURLSessionRequestBodyInfo *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  NWURLSessionDataTask *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 120);
  else
    v5 = 0;
  obj = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, *(void **)(a1 + 40), v5);
  v6 = *(id **)(a1 + 32);
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [NWURLSessionDataTask alloc];
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    v12 = *(void **)(a1 + 32);
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.isa, v8, v11, v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v16)
    objc_storeStrong((id *)(v16 + 408), obj);
  v17 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]((id *)[NWURLSessionResponseConsumerDataCompletionHandler alloc], *(void **)(a1 + 56));
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v18)
    objc_storeStrong((id *)(v18 + 416), v17);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPrefersIncrementalDelivery:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 48));
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    v20 = *(void **)(v19 + 96);
  else
    v20 = 0;
  objc_msgSend(v20, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

void __42__NWURLSession__dataTaskWithURL_delegate___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NWURLSessionDataTask *v4;
  uint64_t v5;
  int v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  NWURLSessionResponseConsumerDataDelegate *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v2 = a1[4];
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [NWURLSessionDataTask alloc];
  v5 = a1[4];
  if (v5)
  {
    v6 = *(_DWORD *)(v5 + 32) + 1;
    *(_DWORD *)(v5 + 32) = v6;
    v7 = (void *)a1[4];
  }
  else
  {
    v7 = 0;
    v6 = 1;
  }
  v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v16, v6, v7);
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = objc_alloc_init(NWURLSessionResponseConsumerDataDelegate);
  v12 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v12)
    objc_storeStrong((id *)(v12 + 416), v11);

  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setDelegate:", a1[6]);
  v13 = a1[4];
  if (v13)
    v14 = *(void **)(v13 + 96);
  else
    v14 = 0;
  objc_msgSend(v14, "addObject:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

}

void __46__NWURLSession__dataTaskWithRequest_delegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NWURLSessionRequestBodyInfo *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  NWURLSessionDataTask *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NWURLSessionResponseConsumerDataDelegate *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 120);
  else
    v5 = 0;
  obj = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, *(void **)(a1 + 40), v5);
  v6 = *(id **)(a1 + 32);
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [NWURLSessionDataTask alloc];
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    v12 = *(void **)(a1 + 32);
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.isa, v8, v11, v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v16)
    objc_storeStrong((id *)(v16 + 408), obj);
  v17 = objc_alloc_init(NWURLSessionResponseConsumerDataDelegate);
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v18)
    objc_storeStrong((id *)(v18 + 416), v17);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 48));
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    v20 = *(void **)(v19 + 96);
  else
    v20 = 0;
  objc_msgSend(v20, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

void __41__NWURLSession_webSocketTaskWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  NWURLSessionWebSocketTask *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  id *v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (*(_BYTE *)(v2 + 28))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v20);
    }
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v4 = (id *)v2;
  }
  else
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v4 = 0;
  }
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v4, v3, 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  +[NWURLSessionWebSocketTask addWebSocketHeadersToRequest:]((uint64_t)NWURLSessionWebSocketTask, v21);
  v5 = [NWURLSessionWebSocketTask alloc];
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = *(_DWORD *)(v6 + 32) + 1;
    *(_DWORD *)(v6 + 32) = v7;
    v8 = *(void **)(a1 + 32);
    v9 = v21;
    if (v5)
      goto LABEL_6;
LABEL_14:
    v11 = 0;
    goto LABEL_8;
  }
  v8 = 0;
  v7 = 1;
  v9 = v21;
  if (!v5)
    goto LABEL_14;
LABEL_6:
  v10 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v5->super.super.isa, v9, v7, v8);
  v11 = v10;
  if (v10)
  {
    v10[58] = (id)0x100000;
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = v11[63];
    v11[63] = v12;

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = v11[65];
    v11[65] = v14;

  }
LABEL_8:
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v11;

  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    v19 = *(void **)(v18 + 96);
  else
    v19 = 0;
  objc_msgSend(v19, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void __47__NWURLSession_webSocketTaskWithURL_protocols___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NWURLSessionWebSocketTask *v5;
  uint64_t v6;
  int v7;
  void *v8;
  id *v9;
  id *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", *(_QWORD *)(a1 + 40));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(", "));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addValue:forHTTPHeaderField:", v3, CFSTR("Sec-WebSocket-Protocol"));

  }
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](*(id **)(a1 + 32), v20, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NWURLSessionWebSocketTask addWebSocketHeadersToRequest:]((uint64_t)NWURLSessionWebSocketTask, v4);
  v5 = [NWURLSessionWebSocketTask alloc];
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = *(_DWORD *)(v6 + 32) + 1;
    *(_DWORD *)(v6 + 32) = v7;
    v8 = *(void **)(a1 + 32);
    if (v5)
      goto LABEL_7;
LABEL_14:
    v10 = 0;
    goto LABEL_9;
  }
  v8 = 0;
  v7 = 1;
  if (!v5)
    goto LABEL_14;
LABEL_7:
  v9 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v5->super.super.isa, v4, v7, v8);
  v10 = v9;
  if (v9)
  {
    v9[58] = (id)0x100000;
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = v10[63];
    v10[63] = v11;

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = v10[65];
    v10[65] = v13;

  }
LABEL_9:
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v10;

  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    v18 = *(void **)(v17 + 96);
  else
    v18 = 0;
  objc_msgSend(v18, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

uint64_t __44__NWURLSession_streamTaskWithHostName_port___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NWURLSessionStreamTask *v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  NWURLSessionTaskConfiguration *v18;
  id *v19;
  id *v20;
  id v21;
  id *v22;
  id v23;
  NWURLLoaderTCP *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id *v31;
  NWURLLoaderTCP *v32;
  NSMutableArray *v33;
  NSMutableArray *pendingWork;
  id v35;
  id *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v42;
  int64_t v43;
  id v44;
  id v45;
  id obj;
  objc_super v47;

  v2 = a1[4];
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v42);
  }
  v3 = [NWURLSessionStreamTask alloc];
  v4 = a1[7];
  v5 = a1[4];
  v6 = (void *)a1[5];
  if (v5)
  {
    v7 = *(_DWORD *)(v5 + 32) + 1;
    *(_DWORD *)(v5 + 32) = v7;
    v8 = (void *)a1[4];
  }
  else
  {
    v8 = 0;
    v7 = 1;
  }
  obj = v6;
  v9 = v6;
  if (v3)
  {
    v10 = (objc_class *)MEMORY[0x1E0CB3998];
    v11 = v8;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v12, "setScheme:", CFSTR("tcp"));
    objc_msgSend(v12, "setHost:", v9);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPort:", v13);

    v14 = (void *)MEMORY[0x1E0C92C80];
    objc_msgSend(v12, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestWithURL:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v3->super.super.isa, v16, v7, v11);
    if (v17)
    {
      v18 = [NWURLSessionTaskConfiguration alloc];
      v19 = (id *)v17[49];
      v20 = v19;
      v43 = v4;
      if (v19)
        v21 = v19[11];
      else
        v21 = 0;
      v22 = -[NWURLSessionTaskConfiguration initWithConfiguration:task:request:]((id *)&v18->super.isa, v21, v17, 0);
      v23 = v17[50];
      v17[50] = v22;

      v24 = [NWURLLoaderTCP alloc];
      v25 = v17[50];
      v26 = v17[28];
      v27 = v26;
      v28 = v25;
      v45 = v9;
      v44 = v9;
      v29 = v28;
      v30 = v27;
      v31 = v17;
      if (v24)
      {
        v47.receiver = v24;
        v47.super_class = (Class)NWURLLoaderTCP;
        v32 = (NWURLLoaderTCP *)objc_msgSendSuper2(&v47, sel_init);
        v24 = v32;
        if (v32)
        {
          objc_storeStrong((id *)&v32->_hostname, obj);
          v24->_port = v43;
          objc_storeStrong((id *)&v24->_configuration, v25);
          objc_storeStrong((id *)&v24->_client, v17);
          objc_storeStrong((id *)&v24->_queue, v26);
          v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          pendingWork = v24->_pendingWork;
          v24->_pendingWork = v33;

        }
      }

      v35 = v31[32];
      v31[32] = v24;

      v9 = v45;
    }
    v36 = v17;

  }
  else
  {
    v36 = 0;
  }

  v37 = *(_QWORD *)(a1[6] + 8);
  v38 = *(void **)(v37 + 40);
  *(_QWORD *)(v37 + 40) = v36;

  v39 = a1[4];
  if (v39)
    v40 = *(void **)(v39 + 96);
  else
    v40 = 0;
  return objc_msgSend(v40, "addObject:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __43__NWURLSession_downloadTaskWithResumeData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  NWURLSessionResponseConsumerDownload *v4;
  id v5;
  id *v6;
  NWURLSessionDownloadTask *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  id *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id *v19;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionDownloadTask created on an invalidated session"), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  +[NWURLSessionDownloadResumeInfo infoWithResumeData:]((uint64_t)NWURLSessionDownloadResumeInfo, *(void **)(a1 + 40));
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v19 = v3;
    v4 = [NWURLSessionResponseConsumerDownload alloc];
    v5 = v19[9];
    v6 = -[NWURLSessionResponseConsumerDownload initWithResumeInfo:completionHandler:]((id *)&v4->super.isa, v5, 0);

    v7 = [NWURLSessionDownloadTask alloc];
    v8 = objc_msgSend(v6, "countOfBytesReceived");
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v10 = *(_DWORD *)(v9 + 32) + 1;
      *(_DWORD *)(v9 + 32) = v10;
      v11 = *(void **)(a1 + 32);
    }
    else
    {
      v11 = 0;
      v10 = 1;
    }
    v12 = -[NWURLSessionDownloadTask initWithResumeInfo:fromOffset:identifier:session:]((id *)&v7->super.super.isa, v19, v8, v10, v11);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v15)
      objc_storeStrong((id *)(v15 + 416), v6);
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      v17 = *(void **)(v16 + 96);
    else
      v17 = 0;
    objc_msgSend(v17, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    v3 = v19;
  }

}

void __36__NWURLSession_downloadTaskWithURL___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NWURLSessionDownloadTask *v4;
  uint64_t v5;
  int v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  NWURLSessionResponseConsumerDownload *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v2 = a1[4];
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [NWURLSessionDownloadTask alloc];
  v5 = a1[4];
  if (v5)
  {
    v6 = *(_DWORD *)(v5 + 32) + 1;
    *(_DWORD *)(v5 + 32) = v6;
    v7 = (void *)a1[4];
  }
  else
  {
    v7 = 0;
    v6 = 1;
  }
  v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v16, v6, v7);
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setPrefersIncrementalDelivery:", 0);
  v11 = objc_alloc_init(NWURLSessionResponseConsumerDownload);
  v12 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v12)
    objc_storeStrong((id *)(v12 + 416), v11);

  v13 = a1[4];
  if (v13)
    v14 = *(void **)(v13 + 96);
  else
    v14 = 0;
  objc_msgSend(v14, "addObject:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

}

void __40__NWURLSession_downloadTaskWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NWURLSessionRequestBodyInfo *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  NWURLSessionDownloadTask *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NWURLSessionResponseConsumerDownload *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 120);
  else
    v5 = 0;
  obj = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, *(void **)(a1 + 40), v5);
  v6 = *(id **)(a1 + 32);
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [NWURLSessionDownloadTask alloc];
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    v12 = *(void **)(a1 + 32);
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.isa, v8, v11, v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPrefersIncrementalDelivery:", 0);
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v16)
    objc_storeStrong((id *)(v16 + 408), obj);
  v17 = objc_alloc_init(NWURLSessionResponseConsumerDownload);
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v18)
    objc_storeStrong((id *)(v18 + 416), v17);

  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    v20 = *(void **)(v19 + 96);
  else
    v20 = 0;
  objc_msgSend(v20, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void __46__NWURLSession_uploadTaskWithStreamedRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NWURLSessionRequestBodyInfo *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id *v7;
  id *v8;
  void *v9;
  void *v10;
  NWURLSessionUploadTask *v11;
  uint64_t v12;
  int v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NWURLSessionResponseConsumerDataDelegate *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id *obj;
  objc_super v25;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 120);
  else
    v5 = 0;
  v6 = v5;
  if (v3
    && (v25.receiver = v3,
        v25.super_class = (Class)NWURLSessionRequestBodyInfo,
        (v7 = (id *)objc_msgSendSuper2(&v25, sel_init)) != 0))
  {
    obj = v7;
    objc_storeStrong(v7 + 4, 0);
    obj[1] = (id)-1;
    objc_storeStrong(obj + 5, v5);
  }
  else
  {
    obj = 0;
  }

  v8 = *(id **)(a1 + 32);
  v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v8, v9, obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [NWURLSessionUploadTask alloc];
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    v13 = *(_DWORD *)(v12 + 32) + 1;
    *(_DWORD *)(v12 + 32) = v13;
    v14 = *(void **)(a1 + 32);
  }
  else
  {
    v14 = 0;
    v13 = 1;
  }
  v15 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v11->super.super.super.isa, v10, v13, v14);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v18)
    objc_storeStrong((id *)(v18 + 408), obj);
  v19 = objc_alloc_init(NWURLSessionResponseConsumerDataDelegate);
  v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v20)
    objc_storeStrong((id *)(v20 + 416), v19);

  v21 = *(_QWORD *)(a1 + 32);
  if (v21)
    v22 = *(void **)(v21 + 96);
  else
    v22 = 0;
  objc_msgSend(v22, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void __47__NWURLSession_uploadTaskWithRequest_fromData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NWURLSessionRequestBodyInfo *v3;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  NWURLSessionUploadTask *v11;
  uint64_t v12;
  int v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NWURLSessionResponseConsumerDataDelegate *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD *obj;
  objc_super v25;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  v4 = *(id *)(a1 + 40);
  if (v3
    && (v25.receiver = v3,
        v25.super_class = (Class)NWURLSessionRequestBodyInfo,
        (v5 = objc_msgSendSuper2(&v25, sel_init)) != 0))
  {
    obj = v5;
    v6 = objc_msgSend(v4, "_createDispatchData");
    v7 = (void *)obj[2];
    obj[2] = v6;

    obj[1] = objc_msgSend(v4, "length");
  }
  else
  {
    obj = 0;
  }

  v8 = *(id **)(a1 + 32);
  v9 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v8, v9, obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [NWURLSessionUploadTask alloc];
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    v13 = *(_DWORD *)(v12 + 32) + 1;
    *(_DWORD *)(v12 + 32) = v13;
    v14 = *(void **)(a1 + 32);
  }
  else
  {
    v14 = 0;
    v13 = 1;
  }
  v15 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v11->super.super.super.isa, v10, v13, v14);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v18)
    objc_storeStrong((id *)(v18 + 408), obj);
  v19 = objc_alloc_init(NWURLSessionResponseConsumerDataDelegate);
  v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v20)
    objc_storeStrong((id *)(v20 + 416), v19);

  v21 = *(_QWORD *)(a1 + 32);
  if (v21)
    v22 = *(void **)(v21 + 96);
  else
    v22 = 0;
  objc_msgSend(v22, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

void __47__NWURLSession_uploadTaskWithRequest_fromFile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NWURLSessionRequestBodyInfo *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  NWURLSessionUploadTask *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NWURLSessionResponseConsumerDataDelegate *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id *obj;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("URLSessionTask created on an invalidated session"), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v3 = [NWURLSessionRequestBodyInfo alloc];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 120);
  else
    v5 = 0;
  obj = -[NWURLSessionRequestBodyInfo initWithFileURL:queue:]((id *)&v3->super.isa, *(void **)(a1 + 40), v5);
  v6 = *(id **)(a1 + 32);
  v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v6, v7, obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [NWURLSessionUploadTask alloc];
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = *(_DWORD *)(v10 + 32) + 1;
    *(_DWORD *)(v10 + 32) = v11;
    v12 = *(void **)(a1 + 32);
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  v13 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v9->super.super.super.isa, v8, v11, v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v16)
    objc_storeStrong((id *)(v16 + 408), obj);
  v17 = objc_alloc_init(NWURLSessionResponseConsumerDataDelegate);
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v18)
    objc_storeStrong((id *)(v18 + 416), v17);

  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    v20 = *(void **)(v19 + 96);
  else
    v20 = 0;
  objc_msgSend(v20, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

void __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  void *v15;
  id v16;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[13];
  v3 = v2;
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[12];
  v6 = v5;
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(_QWORD *)(v9 + 128);
  else
    v10 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E14ACE18;
  v11 = *(id *)(a1 + 40);
  v15 = v8;
  v16 = v11;
  v12 = v8;
  v13 = v12;
  if (v10)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(_QWORD **)(v10 + 48), v14);
    v13 = v15;
  }

}

uint64_t __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __46__NWURLSession_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  char v14;
  char v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void *v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v34 = a1;
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[12];
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v10);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v13 = v4;
        if ((isKindOfClass & 1) != 0
          || (objc_opt_class(), v14 = objc_opt_isKindOfClass(), v13 = v3, (v14 & 1) != 0)
          || (objc_opt_class(), v15 = objc_opt_isKindOfClass(), v13 = v2, (v15 & 1) != 0))
        {
          objc_msgSend(v13, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v8);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = *(_QWORD **)(v34 + 32);
  if (v16)
    v16 = (_QWORD *)v16[13];
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v21);
        objc_opt_class();
        v23 = objc_opt_isKindOfClass();
        v24 = v4;
        if ((v23 & 1) != 0
          || (objc_opt_class(), v25 = objc_opt_isKindOfClass(), v24 = v3, (v25 & 1) != 0)
          || (objc_opt_class(), v26 = objc_opt_isKindOfClass(), v24 = v2, (v26 & 1) != 0))
        {
          objc_msgSend(v24, "addObject:", v22);
        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v19);
  }

  v27 = *(_QWORD *)(v34 + 32);
  if (v27)
    v28 = *(_QWORD *)(v27 + 128);
  else
    v28 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __46__NWURLSession_getTasksWithCompletionHandler___block_invoke_2;
  v35[3] = &unk_1E14AAE78;
  v29 = *(id *)(v34 + 40);
  v36 = v2;
  v37 = v3;
  v38 = v4;
  v39 = v29;
  v30 = v4;
  v31 = v3;
  v32 = v2;
  v33 = v30;
  if (v28)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(_QWORD **)(v28 + 48), v35);
    v33 = v38;
  }

}

void __46__NWURLSession_getTasksWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 56);
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);

}

uint64_t __43__NWURLSession_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__NWURLSession_resetWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __35__NWURLSession_invalidateAndCancel__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = v2;
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_8:
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v9 = *(NSObject **)(v8 + 120);
    else
      v9 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__NWURLSession_invalidateAndCancel__block_invoke_2;
    block[3] = &unk_1E14ACFD0;
    block[4] = v8;
    dispatch_async(v9, block);
    goto LABEL_11;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 104);
  else
    v6 = 0;
  v7 = objc_msgSend(v6, "count");

  if (v7)
    goto LABEL_8;
LABEL_11:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    if (*(_BYTE *)(v10 + 28))
      return;
    *(_BYTE *)(v10 + 28) = 1;
    v11 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v11 = 0;
  }
  -[NWURLSession checkForCompletion](v11);
}

void __35__NWURLSession_invalidateAndCancel__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *v1;
  _QWORD v2[5];

  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__NWURLSession_invalidateAndCancel__block_invoke_3;
  v2[3] = &unk_1E14ACFD0;
  v2[4] = v1;
  -[NWURLSession withLock:](v1, v2);
}

- (void)checkForCompletion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 24));
    if (*(_BYTE *)(a1 + 28))
    {
      v14 = *(id *)(a1 + 96);
      objc_msgSend(v14, "anyObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {

      }
      else
      {
        v3 = objc_msgSend(*(id *)(a1 + 104), "count");

        if (!v3)
        {
          v4 = MEMORY[0x1E0C809B0];
          v5 = *(void **)(a1 + 136);
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __34__NWURLSession_checkForCompletion__block_invoke;
          v15[3] = &unk_1E14ACFD0;
          v15[4] = a1;
          nw_queue_context_async_if_needed(v5, v15);
          v7 = *(_QWORD *)(a1 + 128);
          if (v7)
          {
            -[NWURLSessionDelegateWrapper delegateFor_sessionDidBecomeInvalidWithError](*(_BYTE **)(a1 + 128), v6);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              v10 = *(id *)(v7 + 32);
              v16[0] = v4;
              v16[1] = 3221225472;
              v16[2] = __57__NWURLSessionDelegateWrapper_didBecomeInvalidWithError___block_invoke;
              v16[3] = &unk_1E14AB4D8;
              v17 = v9;
              v18 = v10;
              v19 = 0;
              v20 = v7;
              v11 = *(_QWORD **)(v7 + 48);
              v12 = v10;
              -[NWURLSessionDelegateQueue runDelegateBlock:](v11, v16);

            }
            else
            {
              objc_setProperty_atomic((id)v7, v8, 0, 16);
            }

          }
          v13 = *(void **)(a1 + 128);
          if (v13)
            objc_setProperty_atomic(v13, v6, 0, 16);
        }
      }
    }
  }
}

void __34__NWURLSession_checkForCompletion__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 136);
  else
    v2 = 0;
  v3 = nw_context_copy_cache_context(v2);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (nw_protocol_http_messaging_identifier::onceToken[0] != -1)
    dispatch_once(nw_protocol_http_messaging_identifier::onceToken, &__block_literal_global_75867);
  v5 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __34__NWURLSession_checkForCompletion__block_invoke_2;
  v32[3] = &unk_1E14A2238;
  v6 = (id)v3;
  v33 = v6;
  v7 = v4;
  v34 = v7;
  nw_protocol_enumerate_instances(nw_protocol_http_messaging_identifier::protocol_identifier, (uint64_t)v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        nw_protocol_http_messaging_teardown(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedIntegerValue"), 0);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v10);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (nw_protocol_http_client_bottom_identifier::onceToken[0] != -1)
    dispatch_once(nw_protocol_http_client_bottom_identifier::onceToken, &__block_literal_global_22197);
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __34__NWURLSession_checkForCompletion__block_invoke_3;
  v25[3] = &unk_1E14A2238;
  v14 = v6;
  v26 = v14;
  v15 = v13;
  v27 = v15;
  nw_protocol_enumerate_instances(&nw_protocol_http_client_bottom_identifier::protocol_identifier, (uint64_t)v25);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        nw_protocol_http_client_bottom_teardown(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "unsignedIntegerValue", (_QWORD)v21));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
    }
    while (v18);
  }

}

void __34__NWURLSession_checkForCompletion__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  nw_protocol_get_parameters(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = nw_parameters_copy_context(v8);
  v5 = *(id *)(a1 + 32);

  if (v4 == v5)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __34__NWURLSession_checkForCompletion__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  nw_protocol_get_parameters(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = nw_parameters_copy_context(v8);
  v5 = *(id *)(a1 + 32);

  if (v4 == v5)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __35__NWURLSession_invalidateAndCancel__block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
    v8 = (_QWORD *)v8[13];
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "cancel", (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

void __40__NWURLSession_finishTasksAndInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (!*(_BYTE *)(v1 + 28))
    {
      *(_BYTE *)(v1 + 28) = 1;
      -[NWURLSession checkForCompletion](*(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    -[NWURLSession checkForCompletion](0);
  }
}

+ (void)initialize
{
  if (initialize_onceToken[0] != -1)
    dispatch_once(initialize_onceToken, &__block_literal_global_43564);
}

+ (void)_strictTrustEvaluate:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, id, _QWORD))a5 + 2))(a5, a3, 0);
}

void __26__NWURLSession_initialize__block_invoke()
{
  objc_class *v0;
  Method *v1;
  unint64_t i;
  void (*Implementation)(void);
  char *v4;
  char *v5;
  const char *Name;
  const char *TypeEncoding;
  objc_class *v8;
  objc_class *v9;
  Method *v10;
  unint64_t j;
  void (*v12)(void);
  char *v13;
  char *v14;
  const char *v15;
  const char *v16;
  objc_class *v17;
  unsigned int outCount;

  outCount = 0;
  v0 = (objc_class *)objc_opt_class();
  v1 = class_copyMethodList(v0, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      if ((+[NWURLSession instancesRespondToSelector:](NWURLSession, "instancesRespondToSelector:", method_getName(v1[i])) & 1) == 0)
      {
        Implementation = method_getImplementation(v1[i]);
        v4 = (char *)dyld_image_path_containing_address();
        if (v4)
        {
          v5 = v4;
          if (!strstr(v4, "CFNetwork.framework") && !strstr(v5, "FoundationNetworking.framework"))
          {
            Name = method_getName(v1[i]);
            TypeEncoding = method_getTypeEncoding(v1[i]);
            v8 = (objc_class *)objc_opt_class();
            class_addMethod(v8, Name, Implementation, TypeEncoding);
          }
        }
      }
    }
  }
  free(v1);
  v9 = (objc_class *)objc_opt_class();
  v10 = class_copyMethodList(v9, &outCount);
  if (outCount)
  {
    for (j = 0; j < outCount; ++j)
    {
      if ((+[NWURLSessionTask instancesRespondToSelector:](NWURLSessionTask, "instancesRespondToSelector:", method_getName(v10[j])) & 1) == 0)
      {
        v12 = method_getImplementation(v10[j]);
        v13 = (char *)dyld_image_path_containing_address();
        if (v13)
        {
          v14 = v13;
          if (!strstr(v13, "CFNetwork.framework") && !strstr(v14, "FoundationNetworking.framework"))
          {
            v15 = method_getName(v10[j]);
            v16 = method_getTypeEncoding(v10[j]);
            v17 = (objc_class *)objc_opt_class();
            class_addMethod(v17, v15, v12, v16);
          }
        }
      }
    }
  }
  free(v10);
}

- (void)taskStarted:(os_unfair_lock_s *)a1
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (a1)
  {
    v5[1] = 3221225472;
    v5[2] = __28__NWURLSession_taskStarted___block_invoke;
    v5[3] = &unk_1E14ACE68;
    v5[4] = a1;
    v4 = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    v6 = v3;
    -[NWURLSession withLock:](a1, v5);

    v3 = v4;
  }

}

uint64_t __28__NWURLSession_taskStarted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 104);
  else
    v5 = 0;
  return objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)taskCompleted:(os_unfair_lock_s *)a1
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (a1)
  {
    v5[1] = 3221225472;
    v5[2] = __30__NWURLSession_taskCompleted___block_invoke;
    v5[3] = &unk_1E14ACE68;
    v5[4] = a1;
    v4 = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    v6 = v3;
    -[NWURLSession withLock:](a1, v5);

    v3 = v4;
  }

}

void __30__NWURLSession_taskCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 104);
  else
    v5 = 0;
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));
  -[NWURLSession checkForCompletion](*(_QWORD *)(a1 + 32));
}

@end
