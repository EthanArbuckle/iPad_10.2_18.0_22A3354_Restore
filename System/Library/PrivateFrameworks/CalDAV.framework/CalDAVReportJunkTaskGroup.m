@implementation CalDAVReportJunkTaskGroup

- (CalDAVReportJunkTaskGroup)initWithReportJunkActions:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5
{
  id v9;
  CalDAVReportJunkTaskGroup *v10;
  CalDAVReportJunkTaskGroup *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CalDAVReportJunkTaskGroup;
  v10 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v13, sel_initWithAccountInfoProvider_taskManager_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_reportJunkActions, a3);

  return v11;
}

- (void)startTaskGroup
{
  dispatch_group_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CalDAVPostAuditFailureTask *v8;
  void *v9;
  CalDAVPostAuditFailureTask *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSArray *obj;
  _QWORD block[6];
  _QWORD v17[5];
  NSObject *v18;
  _QWORD *v19;
  id v20;
  id v21;
  id from;
  id location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  v29 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_reportJunkActions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
        v8 = [CalDAVPostAuditFailureTask alloc];
        objc_msgSend(v7, "resourceURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[CalDAVPostAuditFailureTask initWithResourceURL:reason:](v8, "initWithResourceURL:reason:", v9, 0);

        -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVPostAuditFailureTask setAccountInfoProvider:](v10, "setAccountInfoProvider:", v11);

        objc_initWeak(&location, self);
        objc_initWeak(&from, v10);
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __43__CalDAVReportJunkTaskGroup_startTaskGroup__block_invoke;
        v17[3] = &unk_24C1FB1D0;
        objc_copyWeak(&v20, &location);
        objc_copyWeak(&v21, &from);
        v19 = v28;
        v17[4] = v7;
        v12 = v3;
        v18 = v12;
        -[CalDAVPostAuditFailureTask setCompletionBlock:](v10, "setCompletionBlock:", v17);
        -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v10);

        dispatch_group_enter(v12);
        -[CoreDAVTaskGroup taskManager](self, "taskManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "submitQueuedCoreDAVTask:", v10);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v4);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__CalDAVReportJunkTaskGroup_startTaskGroup__block_invoke_2;
  block[3] = &unk_24C1FB1F8;
  block[4] = self;
  block[5] = v28;
  dispatch_group_notify(v3, MEMORY[0x24BDAC9B8], block);
  _Block_object_dispose(v28, 8);

}

void __43__CalDAVReportJunkTaskGroup_startTaskGroup__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "outstandingTasks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v2);

  }
  objc_msgSend(v2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "reportJunkAction:completedWithError:", *(_QWORD *)(a1 + 32), v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __43__CalDAVReportJunkTaskGroup_startTaskGroup__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportJunkActions, 0);
}

@end
