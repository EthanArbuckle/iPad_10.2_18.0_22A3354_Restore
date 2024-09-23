@implementation CalDAVMkcalendarWithFallbackTaskGroup

- (CalDAVMkcalendarWithFallbackTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 primaryPropertiesToSet:(id)a5 fallbackPropertiesToSet:(id)a6 atURL:(id)a7
{
  id v13;
  id v14;
  id v15;
  CalDAVMkcalendarWithFallbackTaskGroup *v16;
  CalDAVMkcalendarWithFallbackTaskGroup *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CalDAVMkcalendarWithFallbackTaskGroup;
  v16 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v19, sel_initWithAccountInfoProvider_taskManager_, a3, a4);
  v17 = v16;
  if (v16)
  {
    v16->_shouldSupportVEVENT = 1;
    v16->_shouldSupportVTODO = 0;
    objc_storeStrong((id *)&v16->_primaryElements, a5);
    objc_storeStrong((id *)&v17->_fallbackElements, a6);
    objc_storeStrong((id *)&v17->_url, a7);
  }

  return v17;
}

- (void)_mkcalendarAfterFailureCount:(unint64_t)a3
{
  int *v5;
  CalDAVMkcalendarTask *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19[2];
  id from;
  id location;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a3)
    v5 = &OBJC_IVAR___CalDAVMkcalendarWithFallbackTaskGroup__fallbackElements;
  else
    v5 = &OBJC_IVAR___CalDAVMkcalendarWithFallbackTaskGroup__primaryElements;
  v16 = *(id *)((char *)&self->super.super.isa + *v5);
  v6 = -[CalDAVMkcalendarTask initWithPropertiesToSet:atURL:]([CalDAVMkcalendarTask alloc], "initWithPropertiesToSet:atURL:", v16, self->_url);
  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVMkcalendarTask setAccountInfoProvider:](v6, "setAccountInfoProvider:", v7);

  -[CalDAVMkcalendarTask setSupportForEvents:tasks:](v6, "setSupportForEvents:tasks:", self->_shouldSupportVEVENT, self->_shouldSupportVTODO);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CalDAVMkcalendarWithFallbackTaskGroup headersToOverride](self, "headersToOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[CalDAVMkcalendarWithFallbackTaskGroup headersToOverride](self, "headersToOverride");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "valueForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVMkcalendarTask overrideRequestHeader:withValue:](v6, "overrideRequestHeader:withValue:", v12, v14);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __70__CalDAVMkcalendarWithFallbackTaskGroup__mkcalendarAfterFailureCount___block_invoke;
  v17[3] = &unk_24C1FACE8;
  objc_copyWeak(&v18, &from);
  v19[1] = (id)a3;
  objc_copyWeak(v19, &location);
  -[CalDAVMkcalendarTask setCompletionBlock:](v6, "setCompletionBlock:", v17);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "submitQueuedCoreDAVTask:", v6);

  objc_destroyWeak(v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __70__CalDAVMkcalendarWithFallbackTaskGroup__mkcalendarAfterFailureCount___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !*(_QWORD *)(a1 + 48))
  {
    v12 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v12, "fallbackElements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v15, "_mkcalendarAfterFailureCount:", *(_QWORD *)(a1 + 48) + 1);
      goto LABEL_5;
    }
  }
  else
  {

  }
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "responseHeaders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)(a1 + 40);
  v9 = objc_loadWeakRetained(v8);
  objc_msgSend(v9, "setResponseHeaders:", v7);

  v15 = objc_loadWeakRetained(v8);
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v11, 0);

LABEL_5:
}

- (void)startTaskGroup
{
  -[CalDAVMkcalendarWithFallbackTaskGroup _mkcalendarAfterFailureCount:](self, "_mkcalendarAfterFailureCount:", 0);
}

- (BOOL)shouldSupportVEVENT
{
  return self->_shouldSupportVEVENT;
}

- (void)setShouldSupportVEVENT:(BOOL)a3
{
  self->_shouldSupportVEVENT = a3;
}

- (BOOL)shouldSupportVTODO
{
  return self->_shouldSupportVTODO;
}

- (void)setShouldSupportVTODO:(BOOL)a3
{
  self->_shouldSupportVTODO = a3;
}

- (NSDictionary)headersToOverride
{
  return self->_headersToOverride;
}

- (void)setHeadersToOverride:(id)a3
{
  objc_storeStrong((id *)&self->_headersToOverride, a3);
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_responseHeaders, a3);
}

- (NSSet)fallbackElements
{
  return self->_fallbackElements;
}

- (void)setFallbackElements:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackElements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackElements, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_headersToOverride, 0);
  objc_storeStrong((id *)&self->_primaryElements, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
