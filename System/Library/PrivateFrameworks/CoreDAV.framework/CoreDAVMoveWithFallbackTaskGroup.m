@implementation CoreDAVMoveWithFallbackTaskGroup

- (CoreDAVMoveWithFallbackTaskGroup)initWithSourceURL:(id)a3 destinationURL:(id)a4 AccountInfoProvider:(id)a5 taskManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CoreDAVMoveWithFallbackTaskGroup *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  id v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CoreDAVMoveWithFallbackTaskGroup;
  v15 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v25, sel_initWithAccountInfoProvider_taskManager_, v13, v14);
  if (v15)
  {
    if (v11
      && (objc_msgSend(v11, "CDVRawPath"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "length"),
          v16,
          v17))
    {
      if (v12
        && (objc_msgSend(v12, "CDVRawPath"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "length"),
            v18,
            v19))
      {
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          objc_storeStrong((id *)&v15->_sourceURL, a3);
          objc_storeStrong((id *)&v15->_destinationURL, a4);
          goto LABEL_8;
        }
        v21 = (void *)MEMORY[0x24BDBCE88];
        v22 = *MEMORY[0x24BDBCAB8];
        v23 = CFSTR("The value for sourceURL and the value for destinationURL must not be the same.");
      }
      else
      {
        v21 = (void *)MEMORY[0x24BDBCE88];
        v22 = *MEMORY[0x24BDBCAB8];
        v23 = CFSTR("Non-nil and non-zero length destinationURL required.");
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x24BDBCE88];
      v22 = *MEMORY[0x24BDBCAB8];
      v23 = CFSTR("Non-nil and non-zero length sourceURL required.");
    }
    objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
LABEL_8:

  return v15;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("CoreDAVMoveWithFallbackTaskGroup:"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tSource url: %@"), self->_sourceURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tDestination url: %@"), self->_destinationURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tPrevious Etag: %@"), self->_previousETag);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tOverwrite: %i"), self->_overwrite);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tUseFallback: %i"), self->_useFallback);
  return v3;
}

- (void)startTaskGroup
{
  void *v3;
  id WeakRetained;
  NSObject *v5;
  CoreDAVMoveTask *v6;
  void *v7;
  void *v8;
  CoreDAVMoveTask *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  CoreDAVMoveWithFallbackTaskGroup *v16;
  id v17;
  id buf[2];

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_209602000, v5, OS_LOG_TYPE_INFO, "[move] Move task group starting with move", (uint8_t *)buf, 2u);
  }

  v6 = [CoreDAVMoveTask alloc];
  -[CoreDAVMoveWithFallbackTaskGroup sourceURL](self, "sourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVMoveWithFallbackTaskGroup destinationURL](self, "destinationURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CoreDAVCopyOrMoveTask initWithSourceURL:destinationURL:andOverwrite:](v6, "initWithSourceURL:destinationURL:andOverwrite:", v7, v8, -[CoreDAVMoveWithFallbackTaskGroup overwrite](self, "overwrite"));

  -[CoreDAVMoveTask setPreviousETag:](v9, "setPreviousETag:", self->_previousETag);
  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTask setAccountInfoProvider:](v9, "setAccountInfoProvider:", v10);

  -[CoreDAVTask setTimeoutInterval:](v9, "setTimeoutInterval:", self->super._timeoutInterval);
  objc_initWeak(buf, v9);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __50__CoreDAVMoveWithFallbackTaskGroup_startTaskGroup__block_invoke;
  v15 = &unk_24C1D9A90;
  objc_copyWeak(&v17, buf);
  v16 = self;
  -[CoreDAVTask setCompletionBlock:](v9, "setCompletionBlock:", &v12);
  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v9, v12, v13, v14, v15);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitQueuedCoreDAVTask:", v9);

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);

}

void __50__CoreDAVMoveWithFallbackTaskGroup_startTaskGroup__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", WeakRetained);
    objc_msgSend(*(id *)(a1 + 32), "_completedMoveTask:", v3);
    WeakRetained = v3;
  }

}

- (void)_completedMoveTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *v9;
  NSDictionary *responseHeaders;
  CoreDAVPutTask *v11;
  id WeakRetained;
  NSObject *v13;
  const char *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  CoreDAVMoveWithFallbackTaskGroup *v25;
  id v26;
  id buf[2];

  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(v4, "responseHeaders");
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    responseHeaders = self->_responseHeaders;
    self->_responseHeaders = v9;

    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, 0);
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v11 = (CoreDAVPutTask *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    -[CoreDAVPutTask logHandleForAccountInfoProvider:](v11, "logHandleForAccountInfoProvider:", WeakRetained);
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v13 || !os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    LOWORD(buf[0]) = 0;
    v14 = "[move] Move succeded";
    goto LABEL_18;
  }
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")))
    v8 = objc_msgSend(v6, "code");
  else
    v8 = 0;

  if (!self->_useFallback || (unint64_t)(v8 - 403) >= 3 && v8 != 501)
  {
    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v6, 0);
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v11 = (CoreDAVPutTask *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    -[CoreDAVPutTask logHandleForAccountInfoProvider:](v11, "logHandleForAccountInfoProvider:", v20);
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v13 || !os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    LOWORD(buf[0]) = 0;
    v14 = "[move] Move failed";
LABEL_18:
    _os_log_impl(&dword_209602000, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)buf, 2u);
LABEL_19:

    goto LABEL_20;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v15, "logHandleForAccountInfoProvider:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_209602000, v17, OS_LOG_TYPE_INFO, "[move] Move failed, trying a PUT", (uint8_t *)buf, 2u);
  }

  v11 = -[CoreDAVPostOrPutTask initWithDataPayload:dataContentType:atURL:previousETag:]([CoreDAVPutTask alloc], "initWithDataPayload:dataContentType:atURL:previousETag:", self->_dataPayload, self->_dataContentType, self->_destinationURL, 0);
  v18 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  -[CoreDAVTask setAccountInfoProvider:](v11, "setAccountInfoProvider:", v18);

  objc_initWeak(buf, v11);
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __55__CoreDAVMoveWithFallbackTaskGroup__completedMoveTask___block_invoke;
  v24 = &unk_24C1D9A90;
  objc_copyWeak(&v26, buf);
  v25 = self;
  -[CoreDAVTask setCompletionBlock:](v11, "setCompletionBlock:", &v21);
  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v11, v21, v22, v23, v24);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "submitQueuedCoreDAVTask:", v11);

  objc_destroyWeak(&v26);
  objc_destroyWeak(buf);
LABEL_20:

}

void __55__CoreDAVMoveWithFallbackTaskGroup__completedMoveTask___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", WeakRetained);
    objc_msgSend(*(id *)(a1 + 32), "_completedPutTask:", v3);
    WeakRetained = v3;
  }

}

- (void)_completedPutTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSString *v14;
  NSString *nextETag;
  CoreDAVDeleteTask *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  CoreDAVMoveWithFallbackTaskGroup *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v6, "logHandleForAccountInfoProvider:", WeakRetained);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209602000, v8, OS_LOG_TYPE_INFO, "[move] Move PUT failed", buf, 2u);
    }

    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v5, 0);
  }
  else
  {
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209602000, v8, OS_LOG_TYPE_INFO, "[move] PUT succeded, doing a DELETE now", buf, 2u);
    }

    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v9, "logHandleForAccountInfoProvider:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "responseHeaders");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v13;
        _os_log_impl(&dword_209602000, v12, OS_LOG_TYPE_INFO, "[move] PUT Responses are: %@", buf, 0xCu);

      }
    }

    objc_msgSend(v4, "nextETag");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    nextETag = self->_nextETag;
    self->_nextETag = v14;

    v16 = -[CoreDAVTask initWithURL:]([CoreDAVDeleteTask alloc], "initWithURL:", self->_sourceURL);
    v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    -[CoreDAVTask setAccountInfoProvider:](v16, "setAccountInfoProvider:", v17);

    objc_initWeak((id *)buf, v16);
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __54__CoreDAVMoveWithFallbackTaskGroup__completedPutTask___block_invoke;
    v22 = &unk_24C1D9A90;
    objc_copyWeak(&v24, (id *)buf);
    v23 = self;
    -[CoreDAVTask setCompletionBlock:](v16, "setCompletionBlock:", &v19);
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v16, v19, v20, v21, v22);
    -[CoreDAVTaskGroup taskManager](self, "taskManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "submitQueuedCoreDAVTask:", v16);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);

  }
}

void __54__CoreDAVMoveWithFallbackTaskGroup__completedPutTask___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v3, "logHandleForAccountInfoProvider:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(WeakRetained, "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_INFO, "[move] DELETE completed with error: %@", (uint8_t *)&v10, 0xCu);

      }
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", WeakRetained);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v9, 0);

  }
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (int)overwrite
{
  return self->_overwrite;
}

- (void)setOverwrite:(int)a3
{
  self->_overwrite = a3;
}

- (BOOL)useFallback
{
  return self->_useFallback;
}

- (void)setUseFallback:(BOOL)a3
{
  self->_useFallback = a3;
}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
  objc_storeStrong((id *)&self->_previousETag, a3);
}

- (NSData)dataPayload
{
  return self->_dataPayload;
}

- (void)setDataPayload:(id)a3
{
  objc_storeStrong((id *)&self->_dataPayload, a3);
}

- (NSString)dataContentType
{
  return self->_dataContentType;
}

- (void)setDataContentType:(id)a3
{
  objc_storeStrong((id *)&self->_dataContentType, a3);
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (NSString)nextETag
{
  return self->_nextETag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextETag, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_dataContentType, 0);
  objc_storeStrong((id *)&self->_dataPayload, 0);
  objc_storeStrong((id *)&self->_previousETag, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end
