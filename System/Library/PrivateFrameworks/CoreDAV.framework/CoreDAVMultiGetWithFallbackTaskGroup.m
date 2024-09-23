@implementation CoreDAVMultiGetWithFallbackTaskGroup

- (CoreDAVMultiGetWithFallbackTaskGroup)initWithURLs:(id)a3 multiGetBlock:(id)a4 getBlock:(id)a5 accountInfoProvider:(id)a6 taskManager:(id)a7
{
  id v12;
  void (**v13)(id, id);
  id v14;
  CoreDAVMultiGetWithFallbackTaskGroup *v15;
  uint64_t v16;
  CoreDAVContainerMultiGetTask *multiGetTask;
  uint64_t v18;
  NSMutableSet *urls;
  uint64_t v20;
  id getBlock;
  objc_super v23;

  v12 = a3;
  v13 = (void (**)(id, id))a4;
  v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CoreDAVMultiGetWithFallbackTaskGroup;
  v15 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v23, sel_initWithAccountInfoProvider_taskManager_, a6, a7);
  if (v15)
  {
    v13[2](v13, v12);
    v16 = objc_claimAutoreleasedReturnValue();
    multiGetTask = v15->_multiGetTask;
    v15->_multiGetTask = (CoreDAVContainerMultiGetTask *)v16;

    v18 = objc_msgSend(v12, "mutableCopy");
    urls = v15->_urls;
    v15->_urls = (NSMutableSet *)v18;

    v20 = objc_msgSend(v14, "copy");
    getBlock = v15->_getBlock;
    v15->_getBlock = (id)v20;

    v15->_usingMultiGet = 1;
  }

  return v15;
}

- (void)_configureAndSubmitTask:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountInfoProvider:", v5);

  -[CoreDAVTaskGroup timeoutInterval](self, "timeoutInterval");
  objc_msgSend(v4, "setTimeoutInterval:");
  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v4);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitWithTaskManager:", v6);

}

- (void)_switchToSingleGetMode
{
  NSMutableSet *v3;
  NSMutableSet *parsedContents;

  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  parsedContents = self->_parsedContents;
  self->_parsedContents = v3;

  self->_usingMultiGet = 0;
}

- (void)_fetchOneItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  CoreDAVMultiGetWithFallbackTaskGroup *v9;
  id v10;
  id v11;
  id location;

  -[NSMutableSet anyObject](self->_urls, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableSet removeObject:](self->_urls, "removeObject:", v3);
    (*((void (**)(void))self->_getBlock + 2))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __53__CoreDAVMultiGetWithFallbackTaskGroup__fetchOneItem__block_invoke;
    v8 = &unk_24C1D9B30;
    objc_copyWeak(&v11, &location);
    v9 = self;
    v10 = v3;
    objc_msgSend(v4, "setCompletionBlock:", &v5);
    -[CoreDAVMultiGetWithFallbackTaskGroup _configureAndSubmitTask:](self, "_configureAndSubmitTask:", v4, v5, v6, v7, v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CoreDAVMultiGetWithFallbackTaskGroup error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v4, 0);
  }

}

void __53__CoreDAVMultiGetWithFallbackTaskGroup__fetchOneItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", WeakRetained);
    objc_msgSend(WeakRetained, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("CoreDAVErrorDomain")))
      {
        v6 = objc_msgSend(v4, "code");

        if (v6 == 1)
          goto LABEL_17;
      }
      else
      {

      }
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(v9, "logHandleForAccountInfoProvider:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 40);
          objc_msgSend(WeakRetained, "error");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412546;
          v17 = v13;
          v18 = 2112;
          v19 = v14;
          _os_log_impl(&dword_209602000, v12, OS_LOG_TYPE_DEFAULT, "CoreDAVMultiGetWithFallbackTaskGroup: encountered error in single-item fetch at %@, error: %@", (uint8_t *)&v16, 0x16u);

        }
      }

      v8 = *(_BYTE **)(a1 + 32);
      if (!v8[88])
      {
        objc_msgSend(WeakRetained, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v15, 0);

        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "appSpecificDataItemResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addObject:", v7);

      v8 = *(_BYTE **)(a1 + 32);
    }
    objc_msgSend(v8, "_fetchOneItem");
LABEL_17:

  }
}

- (void)startTaskGroup
{
  CoreDAVContainerMultiGetTask *multiGetTask;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;
  id from;
  id location;

  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_multiGetTask);
  multiGetTask = self->_multiGetTask;
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __54__CoreDAVMultiGetWithFallbackTaskGroup_startTaskGroup__block_invoke;
  v7 = &unk_24C1DAA70;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  -[CoreDAVTask setCompletionBlock:](multiGetTask, "setCompletionBlock:", &v4);
  -[CoreDAVMultiGetWithFallbackTaskGroup _configureAndSubmitTask:](self, "_configureAndSubmitTask:", self->_multiGetTask, v4, v5, v6, v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __54__CoreDAVMultiGetWithFallbackTaskGroup_startTaskGroup__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2 && WeakRetained)
  {
    objc_msgSend(WeakRetained[4], "removeObject:", v2);
    objc_msgSend(v2, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3
      || (objc_msgSend(WeakRetained, "error"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
    {
      objc_msgSend(WeakRetained, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v5, 0);

LABEL_6:
      goto LABEL_7;
    }
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("CoreDAVErrorDomain")))
    {
      v7 = objc_msgSend(v3, "code");

      if (v7 == 1)
        goto LABEL_6;
    }
    else
    {

    }
    objc_msgSend(WeakRetained, "_switchToSingleGetMode");
    objc_msgSend(WeakRetained, "_fetchOneItem");
    goto LABEL_6;
  }
LABEL_7:

}

- (NSError)error
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  -[CoreDAVTask error](self->_multiGetTask, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain"));

  if (v4 && objc_msgSend(v2, "code") >= 500 && objc_msgSend(v2, "code") <= 599)
    v5 = v2;
  else
    v5 = 0;

  return (NSError *)v5;
}

- (NSSet)missingURLs
{
  void *v3;
  void *v4;

  -[CoreDAVMultiGetWithFallbackTaskGroup error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[CoreDAVContainerMultiGetTask missingURLs](self->_multiGetTask, "missingURLs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v4;
}

- (NSSet)deletedURLs
{
  void *v3;
  void *v4;

  -[CoreDAVMultiGetWithFallbackTaskGroup error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[CoreDAVContainerMultiGetTask deletedURLs](self->_multiGetTask, "deletedURLs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v4;
}

- (NSSet)parsedContents
{
  NSMutableSet *v2;

  if (self->_usingMultiGet)
  {
    -[CoreDAVContainerMultiGetTask parsedContents](self->_multiGetTask, "parsedContents");
    v2 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_parsedContents;
  }
  return (NSSet *)v2;
}

- (BOOL)shouldIgnoreResponseErrors
{
  return self->_shouldIgnoreResponseErrors;
}

- (void)setShouldIgnoreResponseErrors:(BOOL)a3
{
  self->_shouldIgnoreResponseErrors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedContents, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong(&self->_getBlock, 0);
  objc_storeStrong((id *)&self->_multiGetTask, 0);
}

@end
