@implementation CalDAVCalendarPropertyRefreshOperation

- (CalDAVCalendarPropertyRefreshOperation)initWithPrincipal:(id)a3
{
  CalDAVCalendarPropertyRefreshOperation *v3;
  dispatch_group_t v4;
  OS_dispatch_group *outstandingTasksGroup;
  NSMutableSet *v6;
  NSMutableSet *updatedCalendars;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CalDAVCalendarPropertyRefreshOperation;
  v3 = -[CalDAVOperation initWithPrincipal:](&v9, sel_initWithPrincipal_, a3);
  if (v3)
  {
    v4 = dispatch_group_create();
    outstandingTasksGroup = v3->_outstandingTasksGroup;
    v3->_outstandingTasksGroup = (OS_dispatch_group *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    updatedCalendars = v3->_updatedCalendars;
    v3->_updatedCalendars = v6;

  }
  return v3;
}

- (void)_finishRefresh
{
  void *v4;
  NSString *v5;
  NSError *v6;
  NSString *v7;
  NSMutableDictionary *ctags;
  NSMutableDictionary *syncTokens;
  NSError *v10;
  NSString *calendarHomeSyncToken;
  NSError *savedError;
  void *v13;
  _QWORD v14[5];
  NSString *v15;

  -[CalDAVOperation principal](self, "principal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMergeSync") && self->_didMakeCalendars && !self->_isSecondRefresh)
  {
    savedError = self->_savedError;

    if (!savedError)
    {
      self->_isSecondRefresh = 1;
      -[CalDAVCalendarPropertyRefreshOperation refreshCalendarProperties](self, "refreshCalendarProperties");
      return;
    }
  }
  else
  {

  }
  if (self->_didFinish)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 81, CFSTR("We shouldn't have finished more than once!"));

  }
  self->_didFinish = 1;
  v5 = self->_calendarHomeSyncToken;
  if (self->_forceClearCalendarHomeSyncToken)
  {

    v5 = 0;
  }
  v6 = self->_savedError;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__CalDAVCalendarPropertyRefreshOperation__finishRefresh__block_invoke;
  v14[3] = &unk_24C1FB298;
  v14[4] = self;
  v15 = v5;
  v7 = v5;
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v6, v14);
  ctags = self->_ctags;
  self->_ctags = 0;

  syncTokens = self->_syncTokens;
  self->_syncTokens = 0;

  v10 = self->_savedError;
  self->_savedError = 0;

  calendarHomeSyncToken = self->_calendarHomeSyncToken;
  self->_calendarHomeSyncToken = 0;

}

void __56__CalDAVCalendarPropertyRefreshOperation__finishRefresh__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "principal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarRefreshForPrincipal:completedWithNewCTags:newSyncTokens:calendarHomeSyncToken:updatedCalendars:error:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));

}

- (void)_reallyRefreshCalendarProperties
{
  void *v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CalDAVCalendarInfoTaskGroup *v15;
  void *v16;
  void *v17;
  CalDAVCalendarInfoSyncTaskGroup *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _BOOL4 forceClearCalendarHomeSyncToken;
  CalDAVCalendarInfoSyncTaskGroup *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  id buf[2];

  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2096EB000, v5, OS_LOG_TYPE_INFO, "Refreshing calendar properties", (uint8_t *)buf, 2u);
  }

  v6 = (void *)MEMORY[0x24BDBCF20];
  -[CalDAVOperation principal](self, "principal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarHomeURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalDAVOperation principal](self, "principal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendarHomeSyncToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CalDAVCalendarPropertyRefreshOperation useCalendarHomeSyncReport](self, "useCalendarHomeSyncReport")
    || !objc_msgSend(v11, "length"))
  {
    goto LABEL_10;
  }
  -[CalDAVOperation principal](self, "principal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isMergeSync") & 1) != 0)
    goto LABEL_9;
  -[CalDAVOperation principal](self, "principal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "modifiedCalendars");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {

LABEL_9:
    goto LABEL_10;
  }
  forceClearCalendarHomeSyncToken = self->_forceClearCalendarHomeSyncToken;

  if (!forceClearCalendarHomeSyncToken)
  {
    v25 = [CalDAVCalendarInfoSyncTaskGroup alloc];
    -[CalDAVOperation principal](self, "principal");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "calendarHomeURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVOperation principal](self, "principal");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVTaskGroup taskManager](self, "taskManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CoreDAVContainerInfoSyncTaskGroup initWithContainerURL:previousSyncToken:accountInfoProvider:taskManager:](v25, "initWithContainerURL:previousSyncToken:accountInfoProvider:taskManager:", v27, v11, v28, v29);

    -[CalDAVOperation principal](self, "principal");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "account");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "serverVersion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarInfoSyncTaskGroup setFetchSharees:](v18, "setFetchSharees:", objc_msgSend(v32, "supportsSharing"));

    -[CoreDAVContainerInfoSyncTaskGroup setDelegate:](v18, "setDelegate:", self);
    -[CalDAVCalendarPropertyRefreshOperation _initializePrincipalCalendarCache](self, "_initializePrincipalCalendarCache");
    goto LABEL_11;
  }
LABEL_10:
  v15 = [CalDAVCalendarInfoTaskGroup alloc];
  -[CalDAVOperation principal](self, "principal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CalDAVCalendarInfoTaskGroup initWithAccountInfoProvider:containerURLs:taskManager:](v15, "initWithAccountInfoProvider:containerURLs:taskManager:", v16, v9, v17);

  -[CalDAVOperation principal](self, "principal");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "serverVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarInfoSyncTaskGroup setFetchSharees:](v18, "setFetchSharees:", objc_msgSend(v21, "supportsSharing"));

  -[CoreDAVContainerInfoSyncTaskGroup setDelegate:](v18, "setDelegate:", self);
LABEL_11:
  -[CalDAVCalendarPropertyRefreshOperation outstandingTasksGroup](self, "outstandingTasksGroup");
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v22);

  -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v18);

  objc_initWeak(buf, self);
  objc_initWeak(&location, v18);
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __74__CalDAVCalendarPropertyRefreshOperation__reallyRefreshCalendarProperties__block_invoke;
  v33[3] = &unk_24C1FB248;
  objc_copyWeak(&v34, buf);
  objc_copyWeak(&v35, &location);
  -[CoreDAVTaskGroup setCompletionBlock:](v18, "setCompletionBlock:", v33);
  -[CoreDAVContainerInfoSyncTaskGroup startTaskGroup](v18, "startTaskGroup");
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
  objc_destroyWeak(buf);

}

void __74__CalDAVCalendarPropertyRefreshOperation__reallyRefreshCalendarProperties__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "outstandingTaskGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "removeObject:", v3);

  objc_msgSend(WeakRetained, "outstandingTasksGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "outstandingTasksGroup");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v5);

  }
}

- (void)_sendDeletesForCalendars
{
  uint64_t v3;
  char *__ptr32 *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *outstandingTasksGroup;
  const char *v19;
  id obj;
  _QWORD block[6];
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDAC760];
  v4 = &off_209725000;
  if (!self->_isSecondRefresh)
  {
    v19 = a2;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[CalDAVOperation principal](self, "principal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deletedCalendarURLs");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
          objc_msgSend(v10, "logHandleForAccountInfoProvider:", WeakRetained);
          v12 = objc_claimAutoreleasedReturnValue();

          if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v9;
            _os_log_impl(&dword_2096EB000, v12, OS_LOG_TYPE_INFO, "Sending delete for calendar at %@", buf, 0xCu);
          }

          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AAE0]), "initWithURL:", v9);
          -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setAccountInfoProvider:", v14);

          -[CalDAVCalendarPropertyRefreshOperation outstandingTasksGroup](self, "outstandingTasksGroup");
          v15 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v15);

          objc_initWeak((id *)buf, self);
          objc_initWeak(&location, v13);
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __66__CalDAVCalendarPropertyRefreshOperation__sendDeletesForCalendars__block_invoke;
          v22[3] = &unk_24C1FB248;
          objc_copyWeak(&v23, (id *)buf);
          objc_copyWeak(&v24, &location);
          objc_msgSend(v13, "setCompletionBlock:", v22);
          -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v13);

          -[CoreDAVTaskGroup taskManager](self, "taskManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "submitQueuedCoreDAVTask:", v13);

          objc_destroyWeak(&v24);
          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v6);
    }

    a2 = v19;
    v3 = MEMORY[0x24BDAC760];
    v4 = &off_209725000;
  }
  outstandingTasksGroup = self->_outstandingTasksGroup;
  block[0] = v3;
  block[1] = *((_QWORD *)v4 + 498);
  block[2] = __66__CalDAVCalendarPropertyRefreshOperation__sendDeletesForCalendars__block_invoke_2;
  block[3] = &unk_24C1FB3E8;
  block[4] = self;
  block[5] = a2;
  dispatch_group_notify(outstandingTasksGroup, MEMORY[0x24BDAC9B8], block);
}

void __66__CalDAVCalendarPropertyRefreshOperation__sendDeletesForCalendars__block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id *)(a1 + 40);
  v3 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(WeakRetained, "setForceClearCalendarHomeSyncToken:", 1);
  objc_msgSend(WeakRetained, "outstandingTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "removeObject:", v6);

  objc_msgSend(WeakRetained, "outstandingTasksGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(WeakRetained, "outstandingTasksGroup");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v8);

  }
}

void *__66__CalDAVCalendarPropertyRefreshOperation__sendDeletesForCalendars__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *result;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "outstandingTasks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 160, CFSTR("All tasks should be complete when the outstanding task group is clear"));

  }
  objc_msgSend(*(id *)(a1 + 32), "outstandingTaskGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 161, CFSTR("All task groups should be complete when the outstanding task group is clear"));

  }
  result = *(void **)(a1 + 32);
  if (!*((_BYTE *)result + (int)*MEMORY[0x24BE1AC88]))
  {
    objc_msgSend(result, "_sendShareActionTasks");
    return (void *)objc_msgSend(*(id *)(a1 + 32), "_reallyRefreshCalendarProperties");
  }
  return result;
}

- (void)_sendAddsForCalendars
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t i;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *outstandingTasksGroup;
  const char *v22;
  id obj;
  _QWORD block[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!self->_isSecondRefresh)
  {
    -[CalDAVOperation principal](self, "principal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMergeSync");

    if ((v5 & 1) == 0)
    {
      v22 = a2;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[CalDAVOperation principal](self, "principal");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addedCalendars");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v7;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v26;
        v11 = (int *)MEMORY[0x24BE1AC80];
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v26 != v10)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + *v11));
            objc_msgSend(v14, "logHandleForAccountInfoProvider:", WeakRetained);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              v17 = v16;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v13, "calendarURL");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v30 = v18;
                _os_log_impl(&dword_2096EB000, v17, OS_LOG_TYPE_INFO, "Sending add for calendar at %@", buf, 0xCu);

              }
            }

            -[CalDAVCalendarPropertyRefreshOperation _getMkcalendarTaskGroupForCalendar:](self, "_getMkcalendarTaskGroupForCalendar:", v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v19);

            objc_msgSend(v19, "startTaskGroup");
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v9);
      }

      a2 = v22;
    }
  }
  outstandingTasksGroup = self->_outstandingTasksGroup;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__CalDAVCalendarPropertyRefreshOperation__sendAddsForCalendars__block_invoke;
  block[3] = &unk_24C1FB3E8;
  block[4] = self;
  block[5] = a2;
  dispatch_group_notify(outstandingTasksGroup, MEMORY[0x24BDAC9B8], block);
}

void __63__CalDAVCalendarPropertyRefreshOperation__sendAddsForCalendars__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "outstandingTasks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 182, CFSTR("All tasks should be complete when the outstanding task group is clear"));

  }
  objc_msgSend(*(id *)(a1 + 32), "outstandingTaskGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 183, CFSTR("All task groups should be complete when the outstanding task group is clear"));

  }
  v6 = *(void **)(a1 + 32);
  if (!*((_BYTE *)v6 + (int)*MEMORY[0x24BE1AC88]))
  {
    objc_msgSend(v6, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "calendarRefreshWillSendCalendarDeletes:", *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(*(id *)(a1 + 32), "_sendDeletesForCalendars");

  }
}

- (void)_handleCalendarPublish
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  _BOOL4 v8;
  CalDAVModifyCalendarSharingLevelTaskGroup *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  CalDAVModifyCalendarSharingLevelTaskGroup *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *outstandingTasksGroup;
  id obj;
  uint64_t v30;
  _QWORD block[6];
  _QWORD v32[6];
  id v33;
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const __CFString *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[CalDAVOperation principal](self, "principal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendars");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v4)
  {
    v30 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend(v6, "needsPublishUpdate"))
        {
          objc_msgSend(v6, "calendarURL");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7 == 0;

          objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
          v9 = (CalDAVModifyCalendarSharingLevelTaskGroup *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
          -[CalDAVModifyCalendarSharingLevelTaskGroup logHandleForAccountInfoProvider:](v9, "logHandleForAccountInfoProvider:", WeakRetained);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            if (v11)
            {
              v24 = v11;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v6, "title");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "guid");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v41 = v25;
                v42 = 2114;
                v43 = v26;
                _os_log_impl(&dword_2096EB000, v24, OS_LOG_TYPE_DEFAULT, "Calendar \"%@\" (%{public}@) doesn't have a URL, so we're not going to try to publish it", buf, 0x16u);

              }
            }

          }
          else
          {
            if (v11)
            {
              v12 = v11;
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v6, "title");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "guid");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v6, "isPublished");
                *(_DWORD *)buf = 138412802;
                v16 = CFSTR("un");
                if (v15)
                  v16 = &stru_24C1FD208;
                v41 = v13;
                v42 = 2114;
                v43 = v14;
                v44 = 2114;
                v45 = v16;
                _os_log_impl(&dword_2096EB000, v12, OS_LOG_TYPE_INFO, "Calendar \"%@\" (%{public}@) needs to be updated to be %{public}@published", buf, 0x20u);

              }
            }

            v17 = [CalDAVModifyCalendarSharingLevelTaskGroup alloc];
            v18 = objc_msgSend(v6, "isPublished");
            objc_msgSend(v6, "calendarURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTaskGroup taskManager](self, "taskManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = -[CalDAVModifyCalendarSharingLevelTaskGroup initWithSharingAction:atCalendarURL:accountInfoProvider:taskManager:](v17, "initWithSharingAction:atCalendarURL:accountInfoProvider:taskManager:", v18 ^ 1u, v19, v20, v21);

            objc_initWeak((id *)buf, self);
            objc_initWeak(&location, v9);
            -[CalDAVCalendarPropertyRefreshOperation outstandingTasksGroup](self, "outstandingTasksGroup");
            v22 = objc_claimAutoreleasedReturnValue();
            dispatch_group_enter(v22);

            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __64__CalDAVCalendarPropertyRefreshOperation__handleCalendarPublish__block_invoke;
            v32[3] = &unk_24C1FB410;
            objc_copyWeak(&v33, (id *)buf);
            v32[4] = self;
            v32[5] = v6;
            objc_copyWeak(&v34, &location);
            -[CoreDAVTaskGroup setCompletionBlock:](v9, "setCompletionBlock:", v32);
            -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v9);

            -[CalDAVModifyCalendarSharingLevelTaskGroup startTaskGroup](v9, "startTaskGroup");
            objc_destroyWeak(&v34);
            objc_destroyWeak(&v33);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v4);
  }

  outstandingTasksGroup = self->_outstandingTasksGroup;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CalDAVCalendarPropertyRefreshOperation__handleCalendarPublish__block_invoke_25;
  block[3] = &unk_24C1FB3E8;
  block[4] = self;
  block[5] = a2;
  dispatch_group_notify(outstandingTasksGroup, MEMORY[0x24BDAC9B8], block);
}

void __64__CalDAVCalendarPropertyRefreshOperation__handleCalendarPublish__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)*MEMORY[0x24BE1AC80];
  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + v4));
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 40), "isPublished");
      v11 = CFSTR("un");
      if (v10)
        v11 = &stru_24C1FD208;
      v21 = v11;
      v12 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v12, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v23 = v8;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v21;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_2096EB000, v7, OS_LOG_TYPE_INFO, "Calendar \"%@\" (%{public}@) was %{public}@published with error: %@", buf, 0x2Au);

    }
  }

  objc_msgSend(WeakRetained, "outstandingTaskGroups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v14, "removeObject:", v15);

  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + v4));
  objc_msgSend(v16, "logHandleForAccountInfoProvider:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2096EB000, v18, OS_LOG_TYPE_INFO, "Done updating publishing level on all calendars.", buf, 2u);
  }

  objc_msgSend(WeakRetained, "outstandingTasksGroup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(WeakRetained, "outstandingTasksGroup");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v20);

  }
}

void *__64__CalDAVCalendarPropertyRefreshOperation__handleCalendarPublish__block_invoke_25(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *result;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "outstandingTasks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 228, CFSTR("All tasks should be complete when the outstanding task group is clear"));

  }
  objc_msgSend(*(id *)(a1 + 32), "outstandingTaskGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 229, CFSTR("All task groups should be complete when the outstanding task group is clear"));

  }
  result = *(void **)(a1 + 32);
  if (!*((_BYTE *)result + (int)*MEMORY[0x24BE1AC88]))
    return (void *)objc_msgSend(result, "_sendAddsForCalendars");
  return result;
}

- (void)_prepareCalendarsBeforeRefresh
{
  void *v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[7];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  char v14;

  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2096EB000, v6, OS_LOG_TYPE_INFO, "Preparing our calendars before we refresh them from the server", buf, 2u);
  }

  -[CalDAVOperation principal](self, "principal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    v12 = buf;
    v13 = 0x2020000000;
    v14 = 0;
    -[CalDAVOperation principal](self, "principal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __72__CalDAVCalendarPropertyRefreshOperation__prepareCalendarsBeforeRefresh__block_invoke;
    v10[3] = &unk_24C1FB438;
    v10[5] = buf;
    v10[6] = a2;
    v10[4] = self;
    objc_msgSend(v9, "prepareCalendarsForSyncWithCompletionBlock:", v10);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[CalDAVCalendarPropertyRefreshOperation _handleCalendarPublish](self, "_handleCalendarPublish");
  }
}

uint64_t __72__CalDAVCalendarPropertyRefreshOperation__prepareCalendarsBeforeRefresh__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 240, CFSTR("prepareCalendarsForSyncWithCompletionBlock should only get called back once"));

    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v2 + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_handleCalendarPublish");
}

- (void)_sendShareActionTasks
{
  void *v2;
  void *v3;
  BOOL v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id WeakRetained;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  CalDAVModifyCalendarSharingLevelTaskGroup *v30;
  void *v31;
  void *v32;
  void *v33;
  CalDAVModifyCalendarSharingLevelTaskGroup *v34;
  NSObject *v35;
  void *v36;
  CalDAVModifySharedCalendarShareeListTaskGroup *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CalDAVModifySharedCalendarShareeListTaskGroup *v42;
  NSObject *v43;
  void *v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v50;
  _QWORD v51[6];
  id v52;
  id v53;
  id from;
  _QWORD v55[6];
  id v56;
  id v57;
  id location;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  id v76;
  __int16 v77;
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[CalDAVOperation principal](self, "principal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendars");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v64 != v46)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        if ((objc_msgSend(v50, "isEventContainer") & 1) != 0 || objc_msgSend(v50, "isTaskContainer"))
        {
          objc_msgSend(v50, "shareeActions");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v3, "count") == 0;

          if (!v4)
          {
            v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
            v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            objc_msgSend(v50, "shareeActions");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = 0;
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
            if (v9)
            {
              v10 = *(_QWORD *)v60;
              do
              {
                v11 = 0;
                do
                {
                  if (*(_QWORD *)v60 != v10)
                    objc_enumerationMutation(v7);
                  v12 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v11);
                  if (objc_msgSend(v12, "action") == 1 || !objc_msgSend(v12, "action"))
                  {
                    objc_msgSend(v12, "context");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "addObject:", v17);
                  }
                  else
                  {
                    if (objc_msgSend(v12, "action") != 2)
                      goto LABEL_22;
                    objc_msgSend(v12, "context");
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    isKindOfClass = objc_opt_isKindOfClass();

                    objc_msgSend(v12, "context");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    v16 = v15;
                    if ((isKindOfClass & 1) != 0)
                    {
                      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CalDAVRemoveShareeItemKey"));
                      v17 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v17)
                      {
                        objc_msgSend(v6, "addObject:", v17);
                        objc_msgSend(v12, "context");
                        v18 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend((id)v18, "objectForKeyedSubscript:", CFSTR("CalDAVRemoveShareeMuteKey"));
                        v19 = (void *)objc_claimAutoreleasedReturnValue();

                        LOBYTE(v18) = objc_msgSend(v19, "BOOLValue");
                        v8 |= v18;
                      }
                    }
                    else
                    {
                      objc_msgSend(v6, "addObject:", v15);
                      v17 = v16;
                    }
                  }

LABEL_22:
                  ++v11;
                }
                while (v9 != v11);
                v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
                v9 = v20;
              }
              while (v20);
            }

            objc_msgSend(v50, "sharees");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "count"))
              v22 = 2;
            else
              v22 = 3;

            objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
            objc_msgSend(v23, "logHandleForAccountInfoProvider:", WeakRetained);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              v26 = v25;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v50, "title");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "guid");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "calendarURL");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413570;
                v68 = v27;
                v69 = 2114;
                v70 = v28;
                v71 = 2112;
                v72 = v29;
                v73 = 1024;
                v74 = v22;
                v75 = 2112;
                v76 = v5;
                v77 = 2112;
                v78 = v6;
                _os_log_impl(&dword_2096EB000, v26, OS_LOG_TYPE_INFO, "Sending sharee modifications to the server for the calendar \"%@\" (%{public}@) at %@. Sharing action is %d. \n\tAdds/mods: %@\n\tDeletes: %@", buf, 0x3Au);

              }
            }

            v30 = [CalDAVModifyCalendarSharingLevelTaskGroup alloc];
            objc_msgSend(v50, "calendarURL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTaskGroup taskManager](self, "taskManager");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[CalDAVModifyCalendarSharingLevelTaskGroup initWithSharingAction:atCalendarURL:accountInfoProvider:taskManager:](v30, "initWithSharingAction:atCalendarURL:accountInfoProvider:taskManager:", v22, v31, v32, v33);

            objc_initWeak((id *)buf, self);
            objc_initWeak(&location, v34);
            -[CalDAVCalendarPropertyRefreshOperation outstandingTasksGroup](self, "outstandingTasksGroup");
            v35 = objc_claimAutoreleasedReturnValue();
            dispatch_group_enter(v35);

            v55[0] = MEMORY[0x24BDAC760];
            v55[1] = 3221225472;
            v55[2] = __63__CalDAVCalendarPropertyRefreshOperation__sendShareActionTasks__block_invoke;
            v55[3] = &unk_24C1FB410;
            objc_copyWeak(&v56, (id *)buf);
            v55[4] = self;
            v55[5] = v50;
            objc_copyWeak(&v57, &location);
            -[CoreDAVTaskGroup setCompletionBlock:](v34, "setCompletionBlock:", v55);
            -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v34);

            -[CalDAVModifyCalendarSharingLevelTaskGroup startTaskGroup](v34, "startTaskGroup");
            v37 = [CalDAVModifySharedCalendarShareeListTaskGroup alloc];
            objc_msgSend(v50, "title");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "calendarURL");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTaskGroup taskManager](self, "taskManager");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = -[CalDAVModifySharedCalendarShareeListTaskGroup initWithShareesToSet:shareesToRemove:muteNotifications:summary:atCalendarURL:accountInfoProvider:taskManager:](v37, "initWithShareesToSet:shareesToRemove:muteNotifications:summary:atCalendarURL:accountInfoProvider:taskManager:", v5, v6, v8 & 1, v38, v39, v40, v41);

            objc_initWeak(&from, v42);
            -[CalDAVCalendarPropertyRefreshOperation outstandingTasksGroup](self, "outstandingTasksGroup");
            v43 = objc_claimAutoreleasedReturnValue();
            dispatch_group_enter(v43);

            v51[0] = MEMORY[0x24BDAC760];
            v51[1] = 3221225472;
            v51[2] = __63__CalDAVCalendarPropertyRefreshOperation__sendShareActionTasks__block_invoke_33;
            v51[3] = &unk_24C1FB410;
            objc_copyWeak(&v52, (id *)buf);
            v51[4] = self;
            v51[5] = v50;
            objc_copyWeak(&v53, &from);
            -[CoreDAVTaskGroup setCompletionBlock:](v42, "setCompletionBlock:", v51);
            -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v42);

            -[CalDAVModifySharedCalendarShareeListTaskGroup startTaskGroup](v42, "startTaskGroup");
            objc_destroyWeak(&v53);
            objc_destroyWeak(&v52);
            objc_destroyWeak(&from);

            objc_destroyWeak(&v57);
            objc_destroyWeak(&v56);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);

          }
        }
      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
    }
    while (v47);
  }

}

void __63__CalDAVCalendarPropertyRefreshOperation__sendShareActionTasks__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)*MEMORY[0x24BE1AC80];
  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + v4));
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v9, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_2096EB000, v7, OS_LOG_TYPE_INFO, "Finished updating sharing level on \"%@\". Error was %@", (uint8_t *)&v18, 0x16u);

    }
  }

  objc_msgSend(WeakRetained, "outstandingTaskGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v11, "removeObject:", v12);

  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + v4));
  objc_msgSend(v13, "logHandleForAccountInfoProvider:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_2096EB000, v15, OS_LOG_TYPE_INFO, "Done updating sharing level on all calendars.", (uint8_t *)&v18, 2u);
  }

  objc_msgSend(WeakRetained, "outstandingTasksGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(WeakRetained, "outstandingTasksGroup");
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v17);

  }
}

void __63__CalDAVCalendarPropertyRefreshOperation__sendShareActionTasks__block_invoke_33(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)*MEMORY[0x24BE1AC80];
  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + v4));
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v10, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_2096EB000, v7, OS_LOG_TYPE_INFO, "Finished updating sharees on the Calendar \"%@\" (%{public}@). Error was %@", (uint8_t *)&v19, 0x20u);

    }
  }

  objc_msgSend(WeakRetained, "outstandingTaskGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v12, "removeObject:", v13);

  objc_msgSend(*(id *)(a1 + 40), "clearShareeActions");
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + v4));
  objc_msgSend(v14, "logHandleForAccountInfoProvider:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_2096EB000, v16, OS_LOG_TYPE_INFO, "Done updating sharees on all calendars. Refreshing calendar properties", (uint8_t *)&v19, 2u);
  }

  objc_msgSend(WeakRetained, "outstandingTasksGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(WeakRetained, "outstandingTasksGroup");
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v18);

  }
}

- (void)refreshCalendarProperties
{
  void *v4;
  void *v5;
  NSObject *outstandingTasksGroup;
  void *v7;
  id v8;
  _QWORD v9[6];
  _QWORD v10[5];
  id v11;

  -[CalDAVOperation principal](self, "principal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarHomeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    outstandingTasksGroup = self->_outstandingTasksGroup;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __67__CalDAVCalendarPropertyRefreshOperation_refreshCalendarProperties__block_invoke_2;
    v9[3] = &unk_24C1FB3E8;
    v9[4] = self;
    v9[5] = a2;
    dispatch_group_notify(outstandingTasksGroup, MEMORY[0x24BDAC9B8], v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE1AA68], 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __67__CalDAVCalendarPropertyRefreshOperation_refreshCalendarProperties__block_invoke;
    v10[3] = &unk_24C1FB298;
    v10[4] = self;
    v11 = v7;
    v8 = v7;
    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v8, v10);

  }
}

void __67__CalDAVCalendarPropertyRefreshOperation_refreshCalendarProperties__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "principal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarRefreshForPrincipal:completedWithNewCTags:newSyncTokens:calendarHomeSyncToken:updatedCalendars:error:", v2, 0, 0, 0, 0, *(_QWORD *)(a1 + 40));

}

void *__67__CalDAVCalendarPropertyRefreshOperation_refreshCalendarProperties__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *result;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "outstandingTasks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 333, CFSTR("All tasks should be complete when the outstanding task group is clear"));

  }
  objc_msgSend(*(id *)(a1 + 32), "outstandingTaskGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 334, CFSTR("All task groups should be complete when the outstanding task group is clear"));

  }
  result = *(void **)(a1 + 32);
  if (!*((_BYTE *)result + (int)*MEMORY[0x24BE1AC88]))
    return (void *)objc_msgSend(result, "_prepareCalendarsBeforeRefresh");
  return result;
}

- (int)_sharingStatusForContainer:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isSharedOwner") & 1) != 0
    || (objc_msgSend(v3, "publishURL"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    v5 = 1;
  }
  else if (objc_msgSend(v3, "isShared"))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_getSetPropertyStringTask:(id)a3 forName:(id)a4 andNamespace:(id)a5 forCalendar:(id)a6 atURL:(id)a7
{
  return -[CalDAVCalendarPropertyRefreshOperation _getSetPropertyStringTask:forName:andNamespace:forCalendar:atURL:ignoreErrors:](self, "_getSetPropertyStringTask:forName:andNamespace:forCalendar:atURL:ignoreErrors:", a3, a4, a5, a6, a7, 0);
}

- (id)_getSetPropertyStringTask:(id)a3 forName:(id)a4 andNamespace:(id)a5 forCalendar:(id)a6 atURL:(id)a7 ignoreErrors:(BOOL)a8
{
  _BOOL8 v8;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v8 = a8;
  v14 = (objc_class *)MEMORY[0x24BE1AB18];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend([v14 alloc], "initWithNameSpace:andName:", v17, v18);

  objc_msgSend(v20, "setPayloadAsString:", v19);
  -[CalDAVCalendarPropertyRefreshOperation _getSetPropertyTaskWithCoreDAVItem:forCalendar:atURL:ignoreErrors:](self, "_getSetPropertyTaskWithCoreDAVItem:forCalendar:atURL:ignoreErrors:", v20, v16, v15, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_getIsAffectingAvailabilityCoreDAVItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  const __CFString **v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  id v18;
  int v19;
  void *v20;
  void *v21;

  v4 = a3;
  -[CalDAVOperation principal](self, "principal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsAutoSchedule");

  v9 = objc_alloc(MEMORY[0x24BE1AB18]);
  v10 = *MEMORY[0x24BE1ACF8];
  if (v8)
  {
    v11 = (void *)objc_msgSend(v9, "initWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AF30]);
    v12 = objc_alloc(MEMORY[0x24BE1AB18]);
    v13 = objc_msgSend(v4, "isAffectingAvailability");

    v14 = (const __CFString **)MEMORY[0x24BE1AEF0];
    if (!v13)
      v14 = (const __CFString **)MEMORY[0x24BE1AF78];
    v15 = *v14;
    v16 = v12;
    v17 = v10;
  }
  else
  {
    v11 = (void *)objc_msgSend(v9, "initWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AD20]);
    v18 = objc_alloc(MEMORY[0x24BE1AB18]);
    v19 = objc_msgSend(v4, "isAffectingAvailability");

    if (v19)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    v16 = v18;
    v17 = 0;
  }
  v20 = (void *)objc_msgSend(v16, "initWithNameSpace:andName:", v17, v15);
  objc_msgSend(v11, "extraChildItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v20);

  return v11;
}

- (id)_getSetIsAffectingAvailabilityTask:(BOOL)a3 forCalendar:(id)a4 atURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  -[CalDAVCalendarPropertyRefreshOperation _getIsAffectingAvailabilityCoreDAVItem:](self, "_getIsAffectingAvailabilityCoreDAVItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarPropertyRefreshOperation _getSetPropertyTaskWithCoreDAVItem:forCalendar:atURL:](self, "_getSetPropertyTaskWithCoreDAVItem:forCalendar:atURL:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_getSetPropertyTaskWithCoreDAVItem:(id)a3 forCalendar:(id)a4 atURL:(id)a5
{
  return -[CalDAVCalendarPropertyRefreshOperation _getSetPropertyTaskWithCoreDAVItem:forCalendar:atURL:ignoreErrors:](self, "_getSetPropertyTaskWithCoreDAVItem:forCalendar:atURL:ignoreErrors:", a3, a4, a5, 0);
}

- (id)_getSetPropertyTaskWithCoreDAVItem:(id)a3 forCalendar:(id)a4 atURL:(id)a5 ignoreErrors:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  id from;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc(MEMORY[0x24BE1ABA8]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithPropertiesToSet:andRemove:atURL:", v14, 0, v12);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccountInfoProvider:", v16);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v15);
  -[CalDAVCalendarPropertyRefreshOperation outstandingTasksGroup](self, "outstandingTasksGroup");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v17);

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __108__CalDAVCalendarPropertyRefreshOperation__getSetPropertyTaskWithCoreDAVItem_forCalendar_atURL_ignoreErrors___block_invoke;
  v21[3] = &unk_24C1FB460;
  objc_copyWeak(&v24, &location);
  objc_copyWeak(&v25, &from);
  v26 = a6;
  v21[4] = self;
  v18 = v10;
  v22 = v18;
  v19 = v11;
  v23 = v19;
  objc_msgSend(v15, "setCompletionBlock:", v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v15;
}

void __108__CalDAVCalendarPropertyRefreshOperation__getSetPropertyTaskWithCoreDAVItem_forCalendar_atURL_ignoreErrors___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = (id *)(a1 + 64);
  v4 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(unsigned __int8 *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 40), "nameSpace");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "error");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543874;
          v27 = v11;
          v28 = 2114;
          v29 = v12;
          v30 = 2112;
          v31 = v13;
          _os_log_impl(&dword_2096EB000, v10, OS_LOG_TYPE_ERROR, "Got error (that we are ignoring) when attempting to set property %{public}@::%{public}@ on server: %@", (uint8_t *)&v26, 0x20u);

        }
      }

    }
    else
    {
      if (v9)
      {
        v14 = v9;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 40), "nameSpace");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543874;
          v27 = v15;
          v28 = 2114;
          v29 = v16;
          v30 = 2112;
          v31 = v17;
          _os_log_impl(&dword_2096EB000, v14, OS_LOG_TYPE_ERROR, "Got error when attempting to set property %{public}@::%{public}@ on server: %@", (uint8_t *)&v26, 0x20u);

        }
      }

      objc_msgSend(WeakRetained, "setForceClearCalendarHomeSyncToken:", 1);
    }
  }
  if (!*(_BYTE *)(a1 + 72) || (objc_msgSend(v4, "error"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(WeakRetained, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0)
      goto LABEL_18;
    objc_msgSend(WeakRetained, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "calendarRefreshPropPatchFinishedWithError:forCalendar:", v21, *(_QWORD *)(a1 + 48));

  }
LABEL_18:
  objc_msgSend(*(id *)(a1 + 32), "outstandingTasks");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_loadWeakRetained(v3);
  objc_msgSend(v22, "removeObject:", v23);

  objc_msgSend(WeakRetained, "outstandingTasksGroup");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(WeakRetained, "outstandingTasksGroup");
    v25 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v25);

  }
}

- (id)_getSetPropertiesTaskWithItemsToSet:(id)a3 itemsToRemove:(id)a4 atURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id from;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1ABA8]), "initWithPropertiesToSet:andRemove:atURL:", v8, v9, v10);
  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccountInfoProvider:", v12);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  -[CalDAVCalendarPropertyRefreshOperation outstandingTasksGroup](self, "outstandingTasksGroup");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v13);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __98__CalDAVCalendarPropertyRefreshOperation__getSetPropertiesTaskWithItemsToSet_itemsToRemove_atURL___block_invoke;
  v15[3] = &unk_24C1FB488;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  v15[4] = self;
  objc_msgSend(v11, "setCompletionBlock:", v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v11;
}

void __98__CalDAVCalendarPropertyRefreshOperation__getSetPropertiesTaskWithItemsToSet_itemsToRemove_atURL___block_invoke(id *a1)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v2 = a1 + 6;
  v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(WeakRetained, "setForceClearCalendarHomeSyncToken:", 1);
  objc_msgSend(a1[4], "outstandingTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "removeObject:", v6);

  objc_msgSend(WeakRetained, "outstandingTasksGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(WeakRetained, "outstandingTasksGroup");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v8);

  }
}

- (id)_generateTimeZoneString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FA8]), "initWithYear:month:day:", objc_msgSend(v7, "year") - 1, objc_msgSend(v7, "month"), objc_msgSend(v7, "day"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FE0]), "initWithSystemTimeZone:fromDate:options:", v4, v8, 2);

  v10 = objc_alloc_init(MEMORY[0x24BEC6F80]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComponents:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FB8]), "initWithCalendar:", v10);
  objc_msgSend(v12, "ICSStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_getMkcalendarTaskGroupForCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CalDAVCalendarColorItem *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  id WeakRetained;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  BOOL v63;
  _QWORD *v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  CalDAVMkcalendarWithFallbackTaskGroup *v76;
  void *v77;
  void *v78;
  void *v79;
  CalDAVMkcalendarWithFallbackTaskGroup *v80;
  NSObject *v81;
  id v82;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  CalDAVCalendarColorItem *v94;
  _QWORD v95[4];
  id v96;
  CalDAVCalendarPropertyRefreshOperation *v97;
  id v98;
  id v99;
  id location;
  uint8_t buf[4];
  id v102;
  __int16 v103;
  unint64_t v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_didMakeCalendars = 1;
  objc_msgSend(v4, "calendarURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CalDAVOperation principal](self, "principal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendarHomeURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendSlashIfNeeded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCalendarURL:", v10);

  }
  v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v12 = objc_alloc(MEMORY[0x24BE1AB18]);
  v13 = *MEMORY[0x24BE1AE30];
  v93 = (void *)objc_msgSend(v12, "initWithNameSpace:andName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE38]);
  objc_msgSend(v4, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setPayloadAsString:", v14);

  objc_msgSend(v11, "addObject:", v93);
  v15 = objc_alloc(MEMORY[0x24BE1AB18]);
  v16 = *MEMORY[0x24BE1AF88];
  v92 = (void *)objc_msgSend(v15, "initWithNameSpace:andName:", *MEMORY[0x24BE1AF88], *MEMORY[0x24BE1AD28]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v4, "order"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setPayloadAsString:", v17);

  objc_msgSend(v11, "addObject:", v92);
  objc_msgSend(v4, "color");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v94 = 0;
    goto LABEL_7;
  }
  v94 = objc_alloc_init(CalDAVCalendarColorItem);
  objc_msgSend(v4, "color");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarColorItem setColorString:](v94, "setColorString:", v19);

  objc_msgSend(v4, "symbolicColorName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_7:
    v21 = 0;
    goto LABEL_8;
  }
  v21 = objc_alloc_init(CalDAVCalendarColorItem);
  objc_msgSend(v4, "color");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarColorItem setColorString:](v21, "setColorString:", v22);

  objc_msgSend(v4, "symbolicColorName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarColorItem setSymbolicColorName:](v21, "setSymbolicColorName:", v23);

LABEL_8:
  if (objc_msgSend(v4, "isSubscribed")
    && objc_msgSend(v4, "conformsToProtocol:", &unk_2545C11B0))
  {
    v24 = v4;
    v25 = objc_alloc(MEMORY[0x24BE1AB18]);
    v26 = (void *)objc_msgSend(v25, "initWithNameSpace:andName:", v13, *MEMORY[0x24BE1AF18]);
    v27 = objc_alloc(MEMORY[0x24BE1AB18]);
    v87 = (void *)objc_msgSend(v27, "initWithNameSpace:andName:", v13, *MEMORY[0x24BE1AE10]);
    v28 = objc_alloc(MEMORY[0x24BE1AB18]);
    v88 = *MEMORY[0x24BE1ADC8];
    v86 = (void *)objc_msgSend(v28, "initWithNameSpace:andName:");
    objc_msgSend(v26, "extraChildItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v87);

    objc_msgSend(v26, "extraChildItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v86);

    objc_msgSend(v11, "addObject:", v26);
    v31 = objc_alloc(MEMORY[0x24BE1AB18]);
    v90 = (void *)objc_msgSend(v31, "initWithNameSpace:andName:", v88, *MEMORY[0x24BE1AD98]);
    v32 = objc_alloc(MEMORY[0x24BE1AB18]);
    v91 = (void *)objc_msgSend(v32, "initWithNameSpace:andName:", v13, *MEMORY[0x24BE1AE70]);
    objc_msgSend(v24, "subscriptionURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "absoluteString");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v91, "setPayloadAsString:", v85);
    objc_msgSend(v90, "extraChildItems");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v91);

    objc_msgSend(v11, "addObject:", v90);
    v35 = objc_alloc(MEMORY[0x24BE1AB18]);
    v89 = (void *)objc_msgSend(v35, "initWithNameSpace:andName:", v16, *MEMORY[0x24BE1AF10]);
    objc_msgSend(v24, "refreshInterval");
    v37 = v36;
    objc_msgSend(v24, "refreshInterval");
    v39 = (uint64_t)v38;
    if ((uint64_t)v38 < 0)
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
      objc_msgSend(v40, "logHandleForAccountInfoProvider:", WeakRetained);
      v42 = objc_claimAutoreleasedReturnValue();

      if (v42 && os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v102 = v24;
        v103 = 2048;
        v104 = (unint64_t)v37;
        _os_log_impl(&dword_2096EB000, v42, OS_LOG_TYPE_ERROR, "The refresh interval specified for the [%@] calendar, which is about to be created, is too large.  It is currently: [%lu].  It will be set to 0.", buf, 0x16u);
      }

      v39 = 0;
    }
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FC0]), "initWithWeeks:days:hours:minutes:seconds:", 0, 0, 0, 0, v39);
    objc_msgSend(v43, "ICSStringWithOptions:", 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setPayloadAsString:", v84);
    objc_msgSend(v11, "addObject:", v89);
    if (objc_msgSend(v24, "hasAlarmFilter"))
    {
      v44 = objc_alloc(MEMORY[0x24BE1AB18]);
      v45 = (void *)objc_msgSend(v44, "initWithNameSpace:andName:", v88, *MEMORY[0x24BE1ADA0]);
      objc_msgSend(v11, "addObject:", v45);

    }
    if (objc_msgSend(v24, "hasAttachmentFilter"))
    {
      v46 = objc_alloc(MEMORY[0x24BE1AB18]);
      v47 = (void *)objc_msgSend(v46, "initWithNameSpace:andName:", v88, *MEMORY[0x24BE1ADA8]);
      objc_msgSend(v11, "addObject:", v47);

    }
    if (objc_msgSend(v24, "hasTaskFilter"))
    {
      v48 = objc_alloc(MEMORY[0x24BE1AB18]);
      v49 = (void *)objc_msgSend(v48, "initWithNameSpace:andName:", v88, *MEMORY[0x24BE1ADB0]);
      objc_msgSend(v11, "addObject:", v49);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v24, "autoprovisioned"))
    {
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB18]), "initWithNameSpace:andName:", v16, CFSTR("autoprovisioned"));
      objc_msgSend(v11, "addObject:", v50);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v24, "languageCode");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51 == 0;

      if (!v52)
      {
        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB18]), "initWithNameSpace:andName:", v16, CFSTR("language-code"));
        objc_msgSend(v24, "languageCode");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setPayloadAsString:", v54);

        objc_msgSend(v11, "addObject:", v53);
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v24, "locationCode");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55 == 0;

      if (!v56)
      {
        v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB18]), "initWithNameSpace:andName:", v16, CFSTR("location-code"));
        objc_msgSend(v24, "locationCode");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setPayloadAsString:", v58);

        objc_msgSend(v11, "addObject:", v57);
      }
    }

    goto LABEL_40;
  }
  if (objc_msgSend(v4, "isSubscribed"))
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v59, "logHandleForAccountInfoProvider:", v60);
    v61 = objc_claimAutoreleasedReturnValue();

    if (v61 && os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v102 = v4;
      _os_log_impl(&dword_2096EB000, v61, OS_LOG_TYPE_ERROR, "We have a calendar (%@) that claims to be a subscribed calendar, but doesn't implement CalDAVSubscribedCalendar.", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "notes");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "length") == 0;

  v64 = (_QWORD *)MEMORY[0x24BE1ACF8];
  if (!v63)
  {
    v65 = objc_alloc(MEMORY[0x24BE1AB18]);
    v66 = (void *)objc_msgSend(v65, "initWithNameSpace:andName:", *v64, *MEMORY[0x24BE1AD18]);
    objc_msgSend(v4, "notes");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setPayloadAsString:", v67);

    objc_msgSend(v11, "addObject:", v66);
  }
  -[CalDAVCalendarPropertyRefreshOperation _getIsAffectingAvailabilityCoreDAVItem:](self, "_getIsAffectingAvailabilityCoreDAVItem:", v4);
  v68 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v68);

  objc_msgSend(v4, "timeZone");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v68) = v69 == 0;

  if ((v68 & 1) == 0)
  {
    objc_msgSend(v4, "timeZone");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarPropertyRefreshOperation _generateTimeZoneString:](self, "_generateTimeZoneString:", v70);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v71 = objc_alloc(MEMORY[0x24BE1AB18]);
    v26 = (void *)objc_msgSend(v71, "initWithNameSpace:andName:", *v64, *MEMORY[0x24BE1ADD0]);
    objc_msgSend(v26, "setPayloadAsString:", v24);
    objc_msgSend(v11, "addObject:", v26);
LABEL_40:

  }
  v72 = v11;
  v73 = v72;
  if (!v21)
  {
    if (!v94)
    {
      v75 = 0;
      v74 = v72;
      goto LABEL_48;
    }
    objc_msgSend(v72, "setByAddingObject:");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_46;
  }
  objc_msgSend(v72, "setByAddingObject:", v21);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v94)
  {
LABEL_46:
    v75 = 0;
    goto LABEL_48;
  }
  objc_msgSend(v73, "setByAddingObject:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_48:
  v76 = [CalDAVMkcalendarWithFallbackTaskGroup alloc];
  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarURL");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = -[CalDAVMkcalendarWithFallbackTaskGroup initWithAccountInfoProvider:taskManager:primaryPropertiesToSet:fallbackPropertiesToSet:atURL:](v76, "initWithAccountInfoProvider:taskManager:primaryPropertiesToSet:fallbackPropertiesToSet:atURL:", v77, v78, v74, v75, v79);

  -[CalDAVMkcalendarWithFallbackTaskGroup setShouldSupportVEVENT:](v80, "setShouldSupportVEVENT:", objc_msgSend(v4, "isEventContainer"));
  -[CalDAVMkcalendarWithFallbackTaskGroup setShouldSupportVTODO:](v80, "setShouldSupportVTODO:", objc_msgSend(v4, "isTaskContainer"));
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v80);
  -[CalDAVCalendarPropertyRefreshOperation outstandingTasksGroup](self, "outstandingTasksGroup");
  v81 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v81);

  v95[0] = MEMORY[0x24BDAC760];
  v95[1] = 3221225472;
  v95[2] = __77__CalDAVCalendarPropertyRefreshOperation__getMkcalendarTaskGroupForCalendar___block_invoke;
  v95[3] = &unk_24C1FB4B0;
  objc_copyWeak(&v98, (id *)buf);
  objc_copyWeak(&v99, &location);
  v82 = v4;
  v96 = v82;
  v97 = self;
  -[CoreDAVTaskGroup setCompletionBlock:](v80, "setCompletionBlock:", v95);

  objc_destroyWeak(&v99);
  objc_destroyWeak(&v98);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v80;
}

void __77__CalDAVCalendarPropertyRefreshOperation__getMkcalendarTaskGroupForCalendar___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (objc_msgSend(WeakRetained, "_handleMkCalTaskGroupError:forCalendar:", v2, *(_QWORD *)(a1 + 32)))
      objc_msgSend(WeakRetained, "_retryMkCalForCalendar:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "principal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "calendarRefreshMkCalendarSucceededForPrincipal:calendar:", v7, *(_QWORD *)(a1 + 32));

    }
  }
  objc_msgSend(WeakRetained, "outstandingTaskGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v2);

  objc_msgSend(WeakRetained, "outstandingTasksGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(WeakRetained, "outstandingTasksGroup");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v10);

  }
}

- (BOOL)_handleMkCalTaskGroupError:(id)a3 forCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v9, "logHandleForAccountInfoProvider:", WeakRetained);
  v11 = objc_claimAutoreleasedReturnValue();

  if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v16 = 138412802;
    v17 = v8;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2096EB000, v11, OS_LOG_TYPE_ERROR, "Encountered an error while creating a calendar. error = %@; failing calendar = %@; failing task group = %@",
      (uint8_t *)&v16,
      0x20u);
  }

  -[CoreDAVTaskGroup delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CalDAVOperation principal](self, "principal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "calendarRefreshShouldRetryMkCalendarForPrincipal:calendar:error:", v13, v7, v8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_retryMkCalForCalendar:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v5, "logHandleForAccountInfoProvider:", WeakRetained);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_2096EB000, v7, OS_LOG_TYPE_DEFAULT, "Retrying mkcalendar for calendar %@", (uint8_t *)&v10, 0xCu);
  }

  -[CalDAVCalendarPropertyRefreshOperation _getMkcalendarTaskGroupForCalendar:](self, "_getMkcalendarTaskGroupForCalendar:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  objc_msgSend(v8, "startTaskGroup");
}

- (void)_initializePrincipalCalendarCache
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *pathToLocalCalendar;
  NSMutableSet *v7;
  NSMutableSet *localCalendarsWithNoPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int nextCalendarOrder;
  int v15;
  int v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *ctags;
  NSMutableDictionary *v24;
  NSMutableDictionary *syncTokens;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[CalDAVOperation principal](self, "principal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendars");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  pathToLocalCalendar = self->_pathToLocalCalendar;
  self->_pathToLocalCalendar = v5;

  v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  localCalendarsWithNoPath = self->_localCalendarsWithNoPath;
  self->_localCalendarsWithNoPath = v7;

  self->_nextCalendarOrder = -1;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        nextCalendarOrder = self->_nextCalendarOrder;
        v15 = objc_msgSend(v13, "order");
        if (nextCalendarOrder <= v15)
          v16 = v15;
        else
          v16 = nextCalendarOrder;
        self->_nextCalendarOrder = v16;
        objc_msgSend(v13, "calendarURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = self->_pathToLocalCalendar;
          objc_msgSend(v13, "calendarURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "absoluteString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "appendSlashIfNeeded");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v13, v21);

        }
        else
        {
          -[NSMutableSet addObject:](self->_localCalendarsWithNoPath, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  ++self->_nextCalendarOrder;
  v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  ctags = self->_ctags;
  self->_ctags = v22;

  v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  syncTokens = self->_syncTokens;
  self->_syncTokens = v24;

}

- (BOOL)_handleUpdateForCalendar:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSMutableDictionary *ctags;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *syncTokens;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  int v24;
  NSMutableDictionary *pathToLocalCalendar;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSMutableSet *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSMutableSet *v53;
  void *v54;
  id v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSMutableSet *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  id v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  char v74;
  id v75;
  void *v76;
  NSObject *v77;
  void *v78;
  id WeakRetained;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  NSObject *v84;
  void *v85;
  NSMutableSet *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  NSObject *v91;
  void *v92;
  NSMutableSet *localCalendarsWithNoPath;
  void *v94;
  const __CFUUID *v95;
  __CFString *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  char v101;
  void *v102;
  int v103;
  BOOL v104;
  void *v105;
  id v106;
  void *v107;
  NSObject *v108;
  uint64_t v109;
  id v110;
  id v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  id v125;
  void *v126;
  void *v127;
  int v128;
  id v129;
  void *v130;
  void *v131;
  int v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  int v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  int v147;
  id v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  int v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  BOOL v159;
  void *v160;
  double v161;
  double v162;
  double v163;
  char v164;
  id v165;
  void *v166;
  id v167;
  double v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  int v175;
  uint64_t v176;
  int v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  int v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  char v187;
  int v188;
  int v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  char v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  char v199;
  char v200;
  unsigned int v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  _BOOL8 v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  int v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  int v218;
  int v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  unsigned int v230;
  void *v231;
  uint64_t v232;
  char v233;
  void *v234;
  void *v235;
  unsigned int v236;
  int v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  int v242;
  void *v243;
  void *v244;
  _BOOL4 v245;
  void *v246;
  void *v247;
  id v248;
  void *v249;
  NSObject *v250;
  void *v251;
  int v252;
  _BOOL8 v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  char v264;
  void *v265;
  void *v266;
  int v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  int v272;
  void *v273;
  int v274;
  CalDAVGetPrincipalEmailDetailsTaskGroup *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  char v280;
  CalDAVGetPrincipalEmailDetailsTaskGroup *v281;
  void *v282;
  void *v283;
  void *v284;
  NSObject *v285;
  void *v286;
  int v287;
  int v288;
  int v289;
  int v290;
  uint64_t v291;
  int v292;
  void *v294;
  CalDAVCalendarColorItem *v295;
  void *v296;
  void *v297;
  void *v298;
  CalDAVCalendarColorItem *v299;
  void *v300;
  void *v301;
  CalDAVPropPatchWithFallbackTaskGroup *v302;
  void *v303;
  void *v304;
  void *v305;
  CalDAVPropPatchWithFallbackTaskGroup *v306;
  NSObject *v307;
  void *v308;
  unsigned int v309;
  unsigned int v310;
  unsigned int v311;
  void *v312;
  uint64_t v313;
  void *v314;
  CalDAVCalendarPropertyRefreshOperation *val;
  id *location;
  _QWORD v317[4];
  NSObject *v318;
  id v319;
  id v320;
  _QWORD v321[4];
  NSObject *v322;
  id v323;
  id v324;
  id from;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  uint8_t buf[4];
  uint64_t v331;
  __int16 v332;
  NSMutableSet *v333;
  _BYTE v334[128];
  uint64_t v335;

  v335 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  val = self;
  -[CalDAVOperation principal](self, "principal");
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isScheduleInbox") & 1) != 0
    || (objc_msgSend(v4, "isScheduleOutbox") & 1) != 0
    || (objc_msgSend(v4, "isNotification") & 1) != 0
    || (objc_msgSend(v4, "isSubscribed") & 1) != 0
    || objc_msgSend(v4, "isPollContainer"))
  {
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[CoreDAVTaskGroup delegate](val, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "calendarRefreshFoundUpdatedSpecialContainer:", v4);

    }
    objc_msgSend(v4, "isCalendar");
  }
  else if ((objc_msgSend(v4, "isCalendar") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v312, "logHandleForAccountInfoProvider:", WeakRetained);
    v29 = objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v29 = v29;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "url");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v331 = (uint64_t)v80;
        _os_log_impl(&dword_2096EB000, v29, OS_LOG_TYPE_DEBUG, "Skipping special non-calendar container at %@", buf, 0xCu);

      }
    }
    goto LABEL_127;
  }
  objc_msgSend(v4, "ctag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    ctags = val->_ctags;
    objc_msgSend(v4, "ctag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendSlashIfNeeded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](ctags, "setObject:forKey:", v10, v13);

  }
  objc_msgSend(v4, "syncToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    syncTokens = val->_syncTokens;
    objc_msgSend(v4, "syncToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendSlashIfNeeded");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](syncTokens, "setObject:forKey:", v16, v19);

  }
  objc_msgSend(v4, "privileges");
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  if (v312)
  {
    v20 = objc_msgSend(v4, "hasWriteContentPrivileges");
    v21 = objc_msgSend(v4, "hasWritePropertiesPrivileges");
  }
  else
  {
    v20 = objc_msgSend(v314, "isWritable");
    v21 = objc_msgSend(v314, "isWritable");
  }
  v22 = v21;
  if ((objc_msgSend(v4, "isScheduleInbox") & 1) != 0
    || (objc_msgSend(v4, "isScheduleOutbox") & 1) != 0
    || (objc_msgSend(v4, "isNotification") & 1) != 0
    || (v311 = v22, objc_msgSend(v4, "isPollContainer")))
  {
    v311 = 0;
  }
  if (objc_msgSend(v4, "isEventContainer"))
    v23 = objc_msgSend(v4, "isTaskContainer") ^ 1;
  else
    v23 = 0;
  if ((objc_msgSend(v4, "isEventContainer") & 1) != 0)
  {
    v24 = 0;
    if (!v23)
      goto LABEL_29;
  }
  else
  {
    v24 = objc_msgSend(v4, "isTaskContainer");
    if (!v23)
      goto LABEL_29;
  }
  if ((objc_msgSend(v314, "isEnabledForEvents") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_loadWeakRetained((id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v61, "logHandleForAccountInfoProvider:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      v64 = v63;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "url");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v331 = (uint64_t)v65;
        _os_log_impl(&dword_2096EB000, v64, OS_LOG_TYPE_DEBUG, "Skipping event-only container at %@", buf, 0xCu);

      }
    }

    -[CoreDAVTaskGroup delegate](val, "delegate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_opt_respondsToSelector();

    if ((v67 & 1) == 0)
      goto LABEL_121;
    goto LABEL_77;
  }
LABEL_29:
  if (v24 && (objc_msgSend(v314, "isEnabledForTodos") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_loadWeakRetained((id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v68, "logHandleForAccountInfoProvider:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      v71 = v70;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "url");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v331 = (uint64_t)v72;
        _os_log_impl(&dword_2096EB000, v71, OS_LOG_TYPE_DEBUG, "Skipping todo-only container at %@", buf, 0xCu);

      }
    }

    -[CoreDAVTaskGroup delegate](val, "delegate");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_opt_respondsToSelector();

    if ((v74 & 1) == 0)
      goto LABEL_121;
LABEL_77:
    -[CoreDAVTaskGroup delegate](val, "delegate");
    v29 = objc_claimAutoreleasedReturnValue();
    -[NSObject calendarRefreshFoundUpdatedContainerWithIgnoredEntityType:](v29, "calendarRefreshFoundUpdatedContainerWithIgnoredEntityType:", v4);
LABEL_127:
    v104 = 0;
    goto LABEL_325;
  }
  if (objc_msgSend(v4, "isJournalContainer")
    && (objc_msgSend(v4, "isEventContainer") & 1) == 0
    && (objc_msgSend(v4, "isTaskContainer") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v29 = objc_claimAutoreleasedReturnValue();
    v75 = objc_loadWeakRetained((id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    -[NSObject logHandleForAccountInfoProvider:](v29, "logHandleForAccountInfoProvider:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76)
    {
      v77 = v76;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "url");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v331 = (uint64_t)v78;
        _os_log_impl(&dword_2096EB000, v77, OS_LOG_TYPE_DEBUG, "Skipping over VJOURNAL-only container at %@", buf, 0xCu);

      }
    }

    goto LABEL_127;
  }
  v309 = v22;
  v310 = v20;
  pathToLocalCalendar = val->_pathToLocalCalendar;
  objc_msgSend(v4, "url");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "absoluteString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "appendSlashIfNeeded");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pathToLocalCalendar, "objectForKey:", v28);
  v29 = objc_claimAutoreleasedReturnValue();

  if (v29)
    goto LABEL_115;
  if (!objc_msgSend(v314, "isMergeSync"))
    goto LABEL_70;
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]);
  v31 = objc_loadWeakRetained(location);
  objc_msgSend(v30, "logHandleForAccountInfoProvider:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = v32;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "containerTitle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v331 = (uint64_t)v34;
      _os_log_impl(&dword_2096EB000, v33, OS_LOG_TYPE_INFO, "This is a merge sync, so we'll try to identity match this calendar: %@", buf, 0xCu);

    }
  }

  v328 = 0u;
  v329 = 0u;
  v327 = 0u;
  v326 = 0u;
  v35 = val->_localCalendarsWithNoPath;
  v36 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v326, v334, 16);
  if (!v36)
  {
LABEL_64:

    goto LABEL_65;
  }
  v37 = *(_QWORD *)v327;
  v313 = 138412546;
LABEL_42:
  v38 = 0;
  while (1)
  {
    if (*(_QWORD *)v327 != v37)
      objc_enumerationMutation(v35);
    v39 = *(void **)(*((_QWORD *)&v326 + 1) + 8 * v38);
    objc_msgSend(v4, "containerTitle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v40, "length"))
      goto LABEL_61;
    objc_msgSend(v4, "containerTitle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "title");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "caseInsensitiveCompare:", v42) == 0;

    if (v43)
      break;
LABEL_62:
    if (v36 == ++v38)
    {
      v36 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v326, v334, 16);
      if (v36)
        goto LABEL_42;
      goto LABEL_64;
    }
  }
  v44 = objc_msgSend(v39, "isEventContainer");
  if (v44 != objc_msgSend(v4, "isEventContainer") && !objc_msgSend(v4, "isEventContainer")
    || (v45 = objc_msgSend(v39, "isTaskContainer"), v45 != objc_msgSend(v4, "isTaskContainer"))
    && !objc_msgSend(v4, "isTaskContainer")
    || (v46 = objc_msgSend(v39, "isScheduleInbox"), v46 != objc_msgSend(v4, "isScheduleInbox"))
    || (v47 = objc_msgSend(v39, "isNotification"), v47 != objc_msgSend(v4, "isNotification"))
    || (v48 = objc_msgSend(v39, "isSubscribed"), v48 != objc_msgSend(v4, "isSubscribed"))
    || (objc_msgSend(v4, "isScheduleOutbox") & 1) != 0
    || (objc_msgSend(v4, "isSubscribed") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_loadWeakRetained(location);
    objc_msgSend(v40, "logHandleForAccountInfoProvider:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = v50;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v39, "title");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "containerTitle");
        v53 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v331 = (uint64_t)v52;
        v332 = 2112;
        v333 = v53;
        _os_log_impl(&dword_2096EB000, v51, OS_LOG_TYPE_INFO, "Found a calendar that matches based on title, but it doesn't support the same types. %@/%@", buf, 0x16u);

      }
    }

LABEL_61:
    goto LABEL_62;
  }
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_loadWeakRetained(location);
  objc_msgSend(v81, "logHandleForAccountInfoProvider:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    v84 = v83;
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v39, "title");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "containerTitle");
      v86 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v331 = (uint64_t)v85;
      v332 = 2112;
      v333 = v86;
      _os_log_impl(&dword_2096EB000, v84, OS_LOG_TYPE_INFO, "Merged local calendar %@ with remote calendar %@", buf, 0x16u);

    }
  }

  v29 = v39;
  -[NSObject setIsEventContainer:](v29, "setIsEventContainer:", objc_msgSend(v4, "isEventContainer"));
  -[NSObject setIsTaskContainer:](v29, "setIsTaskContainer:", objc_msgSend(v4, "isTaskContainer"));
  objc_msgSend(v4, "url");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setCalendarURL:](v29, "setCalendarURL:", v87);

  if (v29)
  {
    -[NSMutableSet removeObject:](val->_localCalendarsWithNoPath, "removeObject:", v29);
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_loadWeakRetained(location);
    objc_msgSend(v88, "logHandleForAccountInfoProvider:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      v91 = v90;
      if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "url");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        localCalendarsWithNoPath = val->_localCalendarsWithNoPath;
        *(_DWORD *)buf = 138412546;
        v331 = (uint64_t)v92;
        v332 = 2112;
        v333 = localCalendarsWithNoPath;
        _os_log_impl(&dword_2096EB000, v91, OS_LOG_TYPE_INFO, "Merged container at %@. The following calendars haven't matched yet: %@", buf, 0x16u);

      }
    }

    goto LABEL_115;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_loadWeakRetained(location);
  objc_msgSend(v54, "logHandleForAccountInfoProvider:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    v57 = v56;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "url");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = val->_localCalendarsWithNoPath;
      *(_DWORD *)buf = 138412546;
      v331 = (uint64_t)v58;
      v332 = 2112;
      v333 = v59;
      _os_log_impl(&dword_2096EB000, v57, OS_LOG_TYPE_INFO, "Didn't merge the container at %@. The following calendars haven't matched yet: %@", buf, 0x16u);

    }
  }

LABEL_70:
  if ((objc_msgSend(v4, "isSubscribed") & 1) != 0)
  {
    v60 = 4;
  }
  else if ((objc_msgSend(v4, "isScheduleInbox") & 1) != 0)
  {
    v60 = 1;
  }
  else if ((objc_msgSend(v4, "isScheduleOutbox") & 1) != 0)
  {
    v60 = 2;
  }
  else if ((objc_msgSend(v4, "isNotification") & 1) != 0)
  {
    v60 = 3;
  }
  else if (objc_msgSend(v4, "isPollContainer"))
  {
    v60 = 5;
  }
  else
  {
    v60 = 0;
  }
  objc_msgSend(v4, "url");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v314, "calendarOfType:atURL:withOptions:", v60, v94, 0);
  v29 = objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
LABEL_121:
    v104 = 0;
    goto LABEL_326;
  }
  v95 = CFUUIDCreate(0);
  v96 = (__CFString *)CFUUIDCreateString(0, v95);
  -[NSObject setGuid:](v29, "setGuid:", v96);

  CFRelease(v95);
  objc_msgSend(v4, "url");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setCalendarURL:](v29, "setCalendarURL:", v97);

  -[NSObject setIsEnabled:](v29, "setIsEnabled:", objc_msgSend(v314, "isEnabled"));
  -[NSObject setIsEditable:](v29, "setIsEditable:", v310 & ~objc_msgSend(v4, "isSubscribed"));
  -[NSObject setIsRenameable:](v29, "setIsRenameable:", v309);
  -[NSObject setIsEventContainer:](v29, "setIsEventContainer:", objc_msgSend(v4, "isEventContainer"));
  -[NSObject setIsTaskContainer:](v29, "setIsTaskContainer:", objc_msgSend(v4, "isTaskContainer"));
  -[NSObject setIsSubscribed:](v29, "setIsSubscribed:", objc_msgSend(v4, "isSubscribed"));
  -[NSObject setIsScheduleInbox:](v29, "setIsScheduleInbox:", objc_msgSend(v4, "isScheduleInbox"));
  -[NSObject setIsScheduleOutbox:](v29, "setIsScheduleOutbox:", objc_msgSend(v4, "isScheduleOutbox"));
  -[NSObject setIsPoll:](v29, "setIsPoll:", objc_msgSend(v4, "isPollContainer"));
  -[NSObject setIsNotification:](v29, "setIsNotification:", objc_msgSend(v4, "isNotification"));
  objc_msgSend(v4, "publishURL");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setPublishURL:](v29, "setPublishURL:", v98);

  objc_msgSend(v4, "prePublishURL");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setPrePublishURL:](v29, "setPrePublishURL:", v99);

  -[NSObject setSharingStatus:](v29, "setSharingStatus:", -[CalDAVCalendarPropertyRefreshOperation _sharingStatusForContainer:](val, "_sharingStatusForContainer:", v4));
LABEL_115:
  -[CoreDAVTaskGroup delegate](val, "delegate");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_opt_respondsToSelector();

  if ((v101 & 1) != 0)
  {
    -[CoreDAVTaskGroup delegate](val, "delegate");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "calendarRefreshWillRefreshCalendar:", v29);

  }
  if (!objc_msgSend(v4, "isSubscribed"))
    goto LABEL_185;
  if ((-[NSObject conformsToProtocol:](v29, "conformsToProtocol:", &unk_2545C11B0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_loadWeakRetained((id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v105, "logHandleForAccountInfoProvider:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    if (v107)
    {
      v108 = v107;
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        v109 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v331 = v109;
        _os_log_impl(&dword_2096EB000, v108, OS_LOG_TYPE_ERROR, "Expected a subscribed calendar, but this doesn't look like one: %{public}@", buf, 0xCu);
      }

    }
    -[NSObject setIsSubscribed:](v29, "setIsSubscribed:", 1);
    goto LABEL_127;
  }
  if (v311)
    v103 = -[NSObject wasModifiedLocally](v29, "wasModifiedLocally");
  else
    v103 = 0;
  v110 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v111 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v112 = v29;
  -[NSObject subscriptionURL](v112, "subscriptionURL");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v113)
    goto LABEL_132;
  -[NSObject subscriptionURL](v112, "subscriptionURL");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v114, "isEqual:", v115);

  if ((v103 & ~v116) != 0)
  {
    v117 = objc_alloc(MEMORY[0x24BE1AB18]);
    v118 = (void *)objc_msgSend(v117, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1AD98]);
    v119 = objc_alloc(MEMORY[0x24BE1AB18]);
    v120 = (void *)objc_msgSend(v119, "initWithNameSpace:andName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE70]);
    -[NSObject subscriptionURL](v112, "subscriptionURL");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "absoluteString");
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v120, "setPayloadAsString:", v122);
    objc_msgSend(v118, "extraChildItems");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "addObject:", v120);

    objc_msgSend(v110, "addObject:", v118);
  }
  else
  {
LABEL_132:
    objc_msgSend(v4, "source");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSubscriptionURL:](v112, "setSubscriptionURL:", v118);
  }

  v124 = -[NSObject hasAlarmFilter](v112, "hasAlarmFilter");
  if (((v124 ^ objc_msgSend(v4, "subscribedStripAlarms")) & v103) == 1)
  {
    v125 = objc_alloc(MEMORY[0x24BE1AB18]);
    v126 = (void *)objc_msgSend(v125, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1ADA0]);
    if (-[NSObject hasAlarmFilter](v112, "hasAlarmFilter"))
      v127 = v110;
    else
      v127 = v111;
    objc_msgSend(v127, "addObject:", v126);

  }
  else
  {
    -[NSObject setHasAlarmFilter:](v112, "setHasAlarmFilter:", objc_msgSend(v4, "subscribedStripAlarms"));
  }
  v128 = -[NSObject hasAttachmentFilter](v112, "hasAttachmentFilter");
  if (((v128 ^ objc_msgSend(v4, "subscribedStripAttachments")) & v103) == 1)
  {
    v129 = objc_alloc(MEMORY[0x24BE1AB18]);
    v130 = (void *)objc_msgSend(v129, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1ADA8]);
    if (-[NSObject hasAttachmentFilter](v112, "hasAttachmentFilter"))
      v131 = v110;
    else
      v131 = v111;
    objc_msgSend(v131, "addObject:", v130);

  }
  else
  {
    -[NSObject setHasAttachmentFilter:](v112, "setHasAttachmentFilter:", objc_msgSend(v4, "subscribedStripAttachments"));
  }
  v132 = -[NSObject hasTaskFilter](v112, "hasTaskFilter");
  if (((v132 ^ objc_msgSend(v4, "subscribedStripTodos")) & v103) == 1)
  {
    v133 = objc_alloc(MEMORY[0x24BE1AB18]);
    v134 = (void *)objc_msgSend(v133, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1ADB0]);
    if (-[NSObject hasTaskFilter](v112, "hasTaskFilter"))
      v135 = v110;
    else
      v135 = v111;
    objc_msgSend(v135, "addObject:", v134);
    -[NSObject subscriptionURL](v112, "subscriptionURL");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "absoluteString");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "setPayloadAsString:", v137);

  }
  else
  {
    -[NSObject setHasTaskFilter:](v112, "setHasTaskFilter:", objc_msgSend(v4, "subscribedStripTodos"));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (v138 = -[NSObject autoprovisioned](v112, "autoprovisioned"),
        ((v138 ^ objc_msgSend(v4, "autoprovisioned")) & v103) == 1))
  {
    v139 = objc_alloc(MEMORY[0x24BE1AB18]);
    v140 = (void *)objc_msgSend(v139, "initWithNameSpace:andName:", *MEMORY[0x24BE1AF88], CFSTR("autoprovisioned"));
    if (-[NSObject autoprovisioned](v112, "autoprovisioned"))
      v141 = v110;
    else
      v141 = v111;
    objc_msgSend(v141, "addObject:", v140);
    -[NSObject subscriptionURL](v112, "subscriptionURL");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "absoluteString");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "setPayloadAsString:", v143);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSObject setAutoprovisioned:](v112, "setAutoprovisioned:", objc_msgSend(v4, "autoprovisioned"));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSObject locationCode](v112, "locationCode");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    if (v144)
    {
      -[NSObject locationCode](v112, "locationCode");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationCode");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = objc_msgSend(v145, "isEqualToString:", v146);

      if ((v103 & ~v147) != 0)
      {
        v148 = objc_alloc(MEMORY[0x24BE1AB18]);
        v149 = (void *)objc_msgSend(v148, "initWithNameSpace:andName:", *MEMORY[0x24BE1AF88], CFSTR("location-code"));
        -[NSObject locationCode](v112, "locationCode");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "setPayloadAsString:", v150);

        objc_msgSend(v110, "addObject:", v149);
        goto LABEL_165;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "locationCode");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLocationCode:](v112, "setLocationCode:", v149);
LABEL_165:

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSObject languageCode](v112, "languageCode");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    if (v151)
    {
      -[NSObject languageCode](v112, "languageCode");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "languageCode");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = objc_msgSend(v152, "isEqualToString:", v153);

      if ((v103 & ~v154) != 0)
      {
        v155 = objc_alloc(MEMORY[0x24BE1AB18]);
        v156 = (void *)objc_msgSend(v155, "initWithNameSpace:andName:", *MEMORY[0x24BE1AF88], CFSTR("language-code"));
        -[NSObject languageCode](v112, "languageCode");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "setPayloadAsString:", v157);

        objc_msgSend(v110, "addObject:", v156);
        goto LABEL_172;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "languageCode");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLanguageCode:](v112, "setLanguageCode:", v156);
LABEL_172:

  }
  objc_msgSend(v4, "subscribedRefreshRate");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v158 == 0;

  if (v159)
  {
    if (!v103)
      goto LABEL_181;
LABEL_180:
    v165 = objc_alloc(MEMORY[0x24BE1AB18]);
    v166 = (void *)objc_msgSend(v165, "initWithNameSpace:andName:", *MEMORY[0x24BE1AF88], *MEMORY[0x24BE1AF10]);
    v167 = objc_alloc(MEMORY[0x24BEC6FC0]);
    -[NSObject refreshInterval](v112, "refreshInterval");
    v169 = (void *)objc_msgSend(v167, "initWithWeeks:days:hours:minutes:seconds:", 0, 0, 0, 0, (uint64_t)v168);
    objc_msgSend(v169, "ICSStringWithOptions:", 0);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "setPayloadAsString:", v170);
    objc_msgSend(v110, "addObject:", v166);

    goto LABEL_181;
  }
  objc_msgSend(v4, "subscribedRefreshRate");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "timeInterval");
  v162 = v161;

  -[NSObject refreshInterval](v112, "refreshInterval");
  if (v163 == v162)
    v164 = 0;
  else
    v164 = v103;
  if ((v164 & 1) != 0)
    goto LABEL_180;
  -[NSObject setRefreshInterval:](v112, "setRefreshInterval:", v162);
LABEL_181:
  if (objc_msgSend(v110, "count") || objc_msgSend(v111, "count"))
  {
    objc_msgSend(v4, "url");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarPropertyRefreshOperation _getSetPropertiesTaskWithItemsToSet:itemsToRemove:atURL:](val, "_getSetPropertiesTaskWithItemsToSet:itemsToRemove:atURL:", v110, v111, v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();

    -[CoreDAVTaskGroup outstandingTasks](val, "outstandingTasks");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "addObject:", v172);

    -[CoreDAVTaskGroup taskManager](val, "taskManager");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "submitQueuedCoreDAVTask:", v172);

  }
LABEL_185:
  v175 = objc_msgSend(v4, "isScheduleTransparent");
  v176 = -[NSObject isAffectingAvailability](v29, "isAffectingAvailability");
  if (v175 == (_DWORD)v176)
  {
    v177 = -[NSObject wasModifiedLocally](v29, "wasModifiedLocally");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (v311 & v177 & -[NSObject needsIsAffectingAvailabilityUpdate](v29, "needsIsAffectingAvailabilityUpdate")) == 1)
    {
      objc_msgSend(v4, "url");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVCalendarPropertyRefreshOperation _getSetIsAffectingAvailabilityTask:forCalendar:atURL:](val, "_getSetIsAffectingAvailabilityTask:forCalendar:atURL:", v176, v29, v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();

      -[CoreDAVTaskGroup outstandingTasks](val, "outstandingTasks");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "addObject:", v179);

      -[CoreDAVTaskGroup taskManager](val, "taskManager");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "submitQueuedCoreDAVTask:", v179);

    }
    else
    {
      -[NSObject setIsAffectingAvailability:](v29, "setIsAffectingAvailability:", v175 ^ 1u);
    }
  }
  v182 = -[NSObject isManagedByServer](v29, "isManagedByServer");
  if (v182 != objc_msgSend(v4, "isCalendar"))
    -[NSObject setIsManagedByServer:](v29, "setIsManagedByServer:", objc_msgSend(v4, "isCalendar"));
  objc_msgSend(v4, "pushKey");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject pushKey](v29, "pushKey");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  if (v183 == v184)
  {

LABEL_196:
  }
  else
  {
    objc_msgSend(v4, "pushKey");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject pushKey](v29, "pushKey");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v185, "isEqualToString:", v186);

    if ((v187 & 1) == 0)
    {
      objc_msgSend(v4, "pushKey");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPushKey:](v29, "setPushKey:", v183);
      goto LABEL_196;
    }
  }
  v188 = objc_msgSend(v4, "isEventContainer");
  if (v188 != -[NSObject isEventContainer](v29, "isEventContainer"))
    -[NSObject setIsEventContainer:](v29, "setIsEventContainer:", objc_msgSend(v4, "isEventContainer"));
  v189 = objc_msgSend(v4, "isTaskContainer");
  if (v189 != -[NSObject isTaskContainer](v29, "isTaskContainer"))
    -[NSObject setIsTaskContainer:](v29, "setIsTaskContainer:", objc_msgSend(v4, "isTaskContainer"));
  if (v310 != -[NSObject isEditable](v29, "isEditable") && (objc_msgSend(v4, "isSubscribed") & 1) == 0)
    -[NSObject setIsEditable:](v29, "setIsEditable:", v310);
  if (v309 != -[NSObject isRenameable](v29, "isRenameable"))
    -[NSObject setIsRenameable:](v29, "setIsRenameable:");
  -[NSObject bulkRequests](v29, "bulkRequests");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bulkRequests");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (v190 == v191)
  {

LABEL_210:
  }
  else
  {
    -[NSObject bulkRequests](v29, "bulkRequests");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bulkRequests");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v194 = objc_msgSend(v192, "isEqualToDictionary:", v193);

    if ((v194 & 1) == 0)
    {
      objc_msgSend(v4, "bulkRequests");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setBulkRequests:](v29, "setBulkRequests:", v190);
      goto LABEL_210;
    }
  }
  objc_msgSend(v4, "containerTitle");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v195, "length"))
  {

    goto LABEL_216;
  }
  objc_msgSend(v4, "containerTitle");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject title](v29, "title");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  if (v191 == v196)
  {

LABEL_230:
    goto LABEL_231;
  }
  objc_msgSend(v4, "containerTitle");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject title](v29, "title");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v199 = objc_msgSend(v197, "isEqualToString:", v198);

  if ((v199 & 1) == 0)
  {
LABEL_216:
    v200 = -[NSObject wasModifiedLocally](v29, "wasModifiedLocally");
    if ((v200 & 1) == 0)
    {
      objc_msgSend(v4, "containerTitle");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v191, "length"))
      {

LABEL_229:
        objc_msgSend(v4, "containerTitle");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setTitle:](v29, "setTitle:", v195);
        goto LABEL_230;
      }
    }
    if (v311 && (objc_msgSend(v4, "isCalendar") & 1) == 0)
    {
      v201 = objc_msgSend(v4, "isSubscribed");
      if ((v200 & 1) != 0)
      {
LABEL_222:
        if (!v201)
          goto LABEL_229;
LABEL_223:
        -[NSObject title](v29, "title");
        v202 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v202)
        {
          objc_msgSend(v4, "url");
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v203, "lastPathComponent");
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "stringByURLUnquoting");
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setTitle:](v29, "setTitle:", v205);

        }
        v206 = v202 == 0;
        -[NSObject title](v29, "title");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "url");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVCalendarPropertyRefreshOperation _getSetPropertyStringTask:forName:andNamespace:forCalendar:atURL:ignoreErrors:](val, "_getSetPropertyStringTask:forName:andNamespace:forCalendar:atURL:ignoreErrors:", v207, *MEMORY[0x24BE1AE38], *MEMORY[0x24BE1AE30], v29, v208, v206);
        v195 = (void *)objc_claimAutoreleasedReturnValue();

        -[CoreDAVTaskGroup outstandingTasks](val, "outstandingTasks");
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "addObject:", v195);

        -[CoreDAVTaskGroup taskManager](val, "taskManager");
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v210, "submitQueuedCoreDAVTask:", v195);

        goto LABEL_230;
      }
    }
    else
    {
      v201 = v311;
      if ((v200 & 1) != 0)
        goto LABEL_222;
    }

    if ((v201 & 1) == 0)
      goto LABEL_229;
    goto LABEL_223;
  }
LABEL_231:
  objc_msgSend(v4, "calendarDescription");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = objc_msgSend(v211, "length");
  if (v212)
  {
    v213 = 0;
    goto LABEL_233;
  }
  -[NSObject notes](v29, "notes");
  location = (id *)objc_claimAutoreleasedReturnValue();
  if (location)
  {
    -[NSObject notes](v29, "notes");
    v313 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v313, "length"))
    {

      goto LABEL_245;
    }
    v213 = 1;
  }
  else
  {
    location = 0;
    v213 = 0;
  }
LABEL_233:
  objc_msgSend(v4, "calendarDescription");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject notes](v29, "notes");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  if (v214 == v215)
  {
    v219 = 0;
  }
  else
  {
    objc_msgSend(v4, "calendarDescription");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject notes](v29, "notes");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v218 = objc_msgSend(v216, "isEqualToString:", v217);

    v219 = v218 ^ 1;
  }

  if (v213)
  {

    if (!v212)
      goto LABEL_241;
LABEL_244:

    if (v219)
      goto LABEL_245;
  }
  else
  {
    if (v212)
      goto LABEL_244;
LABEL_241:

    if ((v219 & 1) != 0)
    {
LABEL_245:
      if ((-[NSObject wasModifiedLocally](v29, "wasModifiedLocally") & v311) == 1)
      {
        -[NSObject notes](v29, "notes");
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "url");
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVCalendarPropertyRefreshOperation _getSetPropertyStringTask:forName:andNamespace:forCalendar:atURL:](val, "_getSetPropertyStringTask:forName:andNamespace:forCalendar:atURL:", v220, *MEMORY[0x24BE1AD18], *MEMORY[0x24BE1ACF8], v29, v221);
        v222 = (void *)objc_claimAutoreleasedReturnValue();

        -[CoreDAVTaskGroup outstandingTasks](val, "outstandingTasks");
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v223, "addObject:", v222);

        -[CoreDAVTaskGroup taskManager](val, "taskManager");
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v224, "submitQueuedCoreDAVTask:", v222);

      }
      else
      {
        objc_msgSend(v4, "calendarDescription");
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setNotes:](v29, "setNotes:", v222);
      }

    }
  }
  v225 = (void *)MEMORY[0x24BEC6F88];
  -[NSObject color](v29, "color");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarColor");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject symbolicColorName](v29, "symbolicColorName");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolicColorName");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = objc_msgSend(v225, "colorDetailsAreEffectivelyDifferentFirstColor:secondColor:firstSymbolicName:secondSymbolicName:", v226, v227, v228, v229);

  objc_msgSend(v4, "calendarColor");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v231, "length"))
    v232 = v230;
  else
    v232 = 1;

  if (!(_DWORD)v232)
    goto LABEL_265;
  v233 = -[NSObject wasModifiedLocally](v29, "wasModifiedLocally");
  if ((v233 & 1) == 0)
  {
    objc_msgSend(v4, "calendarColor");
    v232 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v232, "length"))
      goto LABEL_262;
  }
  -[NSObject color](v29, "color");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v235 = v234;
  if (v234)
    v236 = v311;
  else
    v236 = 0;
  if (v236 != 1)
  {

    if ((v233 & 1) != 0)
      goto LABEL_263;
LABEL_262:

    goto LABEL_263;
  }
  if ((objc_msgSend(v4, "isCalendar") & 1) != 0)
    v237 = 1;
  else
    v237 = objc_msgSend(v4, "isSubscribed");

  if ((v233 & 1) == 0)
  {

    if ((v237 & 1) != 0)
      goto LABEL_333;
    goto LABEL_263;
  }
  if (!v237)
  {
LABEL_263:
    objc_msgSend(v4, "calendarColor");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setColor:](v29, "setColor:", v238);

    objc_msgSend(v4, "symbolicColorName");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSymbolicColorName:](v29, "setSymbolicColorName:", v239);
    goto LABEL_264;
  }
LABEL_333:
  -[NSObject color](v29, "color");
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  if (v294)
  {
    v295 = objc_alloc_init(CalDAVCalendarColorItem);
    -[NSObject color](v29, "color");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarColorItem setColorString:](v295, "setColorString:", v296);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v295);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject symbolicColorName](v29, "symbolicColorName");
    v297 = (void *)objc_claimAutoreleasedReturnValue();

    if (v297)
    {
      -[NSObject symbolicColorName](v29, "symbolicColorName");
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVCalendarColorItem setSymbolicColorName:](v295, "setSymbolicColorName:", v298);

      v299 = objc_alloc_init(CalDAVCalendarColorItem);
      -[NSObject color](v29, "color");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVCalendarColorItem setColorString:](v299, "setColorString:", v300);

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v299);
      v301 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v301 = 0;
    }

  }
  else
  {
    v239 = 0;
    v301 = 0;
  }
  v302 = [CalDAVPropPatchWithFallbackTaskGroup alloc];
  -[CoreDAVTaskGroup accountInfoProvider](val, "accountInfoProvider");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTaskGroup taskManager](val, "taskManager");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  v306 = -[CalDAVPropPatchWithFallbackTaskGroup initWithAccountInfoProvider:taskManager:primaryPropertiesToSet:fallbackPropertiesToSet:atURL:](v302, "initWithAccountInfoProvider:taskManager:primaryPropertiesToSet:fallbackPropertiesToSet:atURL:", v303, v304, v239, v301, v305);

  objc_initWeak((id *)buf, val);
  objc_initWeak(&from, v306);
  -[CalDAVCalendarPropertyRefreshOperation outstandingTasksGroup](val, "outstandingTasksGroup");
  v307 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v307);

  v321[0] = MEMORY[0x24BDAC760];
  v321[1] = 3221225472;
  v321[2] = __67__CalDAVCalendarPropertyRefreshOperation__handleUpdateForCalendar___block_invoke;
  v321[3] = &unk_24C1FB488;
  objc_copyWeak(&v323, (id *)buf);
  objc_copyWeak(&v324, &from);
  v322 = v29;
  -[CoreDAVTaskGroup setCompletionBlock:](v306, "setCompletionBlock:", v321);
  -[CalDAVOperation outstandingTaskGroups](val, "outstandingTaskGroups");
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v308, "addObject:", v306);

  -[CalDAVPropPatchWithFallbackTaskGroup startTaskGroup](v306, "startTaskGroup");
  objc_destroyWeak(&v324);
  objc_destroyWeak(&v323);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)buf);

LABEL_264:
LABEL_265:
  objc_msgSend(v4, "calendarOrder");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  if (v240)
  {
    objc_msgSend(v4, "calendarOrder");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = objc_msgSend(v241, "intValue");

  }
  else
  {
    v242 = -1;
  }

  if (v242 != -[NSObject order](v29, "order"))
  {
    if ((-[NSObject wasModifiedLocally](v29, "wasModifiedLocally") & 1) != 0)
    {
      if (!v311)
        goto LABEL_287;
LABEL_276:
      if ((-[NSObject order](v29, "order") & 0x80000000) != 0
        || !-[NSObject order](v29, "order")
        && (objc_msgSend(v4, "calendarOrder"),
            v244 = (void *)objc_claimAutoreleasedReturnValue(),
            v245 = v244 == 0,
            v244,
            v245))
      {
        ++val->_nextCalendarOrder;
        -[NSObject setOrder:](v29, "setOrder:");
      }
      objc_msgSend(v4, "calendarOrder");
      v246 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v246)
      {
        objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        v248 = objc_loadWeakRetained((id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
        objc_msgSend(v247, "logHandleForAccountInfoProvider:", v248);
        v249 = (void *)objc_claimAutoreleasedReturnValue();

        if (v249)
        {
          v250 = v249;
          if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
          {
            -[NSObject title](v29, "title");
            v251 = (void *)objc_claimAutoreleasedReturnValue();
            v252 = -[NSObject order](v29, "order");
            *(_DWORD *)buf = 138412546;
            v331 = (uint64_t)v251;
            v332 = 1024;
            LODWORD(v333) = v252;
            _os_log_impl(&dword_2096EB000, v250, OS_LOG_TYPE_ERROR, "Calendar \"%@\" did not have a calendar-order set so we will try to set it to %d", buf, 0x12u);

          }
        }

      }
      v253 = v246 == 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), -[NSObject order](v29, "order"));
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "url");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVCalendarPropertyRefreshOperation _getSetPropertyStringTask:forName:andNamespace:forCalendar:atURL:ignoreErrors:](val, "_getSetPropertyStringTask:forName:andNamespace:forCalendar:atURL:ignoreErrors:", v254, *MEMORY[0x24BE1AD28], *MEMORY[0x24BE1AF88], v29, v255, v253);
      v256 = (void *)objc_claimAutoreleasedReturnValue();

      -[CoreDAVTaskGroup outstandingTasks](val, "outstandingTasks");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "addObject:", v256);

      -[CoreDAVTaskGroup taskManager](val, "taskManager");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v258, "submitQueuedCoreDAVTask:", v256);

LABEL_289:
    }
    else
    {
      objc_msgSend(v4, "calendarOrder");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      if (v243)
      {

        goto LABEL_287;
      }
      if ((v311 & 1) != 0)
        goto LABEL_276;
LABEL_287:
      if ((-[NSObject isScheduleInbox](v29, "isScheduleInbox") & 1) == 0)
      {
        objc_msgSend(v4, "calendarOrder");
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setOrder:](v29, "setOrder:", objc_msgSend(v254, "intValue"));
        goto LABEL_289;
      }
    }
  }
  -[NSObject setSharingStatus:](v29, "setSharingStatus:", -[CalDAVCalendarPropertyRefreshOperation _sharingStatusForContainer:](val, "_sharingStatusForContainer:", v4));
  objc_msgSend(v4, "sharees");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setSharees:](v29, "setSharees:", v259);

  objc_msgSend(v4, "publishURL");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject publishURL](v29, "publishURL");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  if (v260 == v261)
  {

LABEL_294:
  }
  else
  {
    objc_msgSend(v4, "publishURL");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject publishURL](v29, "publishURL");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    v264 = objc_msgSend(v262, "absoluteURLisEqual:", v263);

    if ((v264 & 1) == 0)
    {
      objc_msgSend(v4, "publishURL");
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPublishURL:](v29, "setPublishURL:", v260);
      goto LABEL_294;
    }
  }
  objc_msgSend(v4, "publishURL");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setIsPublished:](v29, "setIsPublished:", v265 != 0);

  objc_msgSend(v4, "prePublishURL");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setPrePublishURL:](v29, "setPrePublishURL:", v266);

  v267 = objc_msgSend(v314, "isMergeSync");
  objc_msgSend(v4, "owner");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject owner](v29, "owner");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  if (v268 == v269)
  {
    v272 = 0;
  }
  else
  {
    objc_msgSend(v4, "owner");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject owner](v29, "owner");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v270, "absoluteURLisEqual:", v271) & 1) != 0)
    {
      v272 = 0;
    }
    else
    {
      objc_msgSend(v4, "owner");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      v274 = -[NSObject hasCalendarUserAddressEquivalentToURL:](v29, "hasCalendarUserAddressEquivalentToURL:", v273);

      v272 = v274 ^ 1;
    }

  }
  if ((v272 | v267) == 1)
  {
    objc_msgSend(v4, "owner");
    v275 = (CalDAVGetPrincipalEmailDetailsTaskGroup *)objc_claimAutoreleasedReturnValue();
    if (v275)
    {
      objc_msgSend(v4, "owner");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v314, "principalURL");
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      if (v276 == v277)
      {

LABEL_307:
      }
      else
      {
        objc_msgSend(v4, "owner");
        v278 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v314, "principalURL");
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        v280 = objc_msgSend(v278, "absoluteURLisEqual:", v279);

        if ((v280 & 1) == 0)
        {
          v281 = [CalDAVGetPrincipalEmailDetailsTaskGroup alloc];
          -[CoreDAVTaskGroup accountInfoProvider](val, "accountInfoProvider");
          v282 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "owner");
          v283 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTaskGroup taskManager](val, "taskManager");
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          v275 = -[CalDAVGetPrincipalEmailDetailsTaskGroup initWithAccountInfoProvider:principalURL:taskManager:](v281, "initWithAccountInfoProvider:principalURL:taskManager:", v282, v283, v284);

          -[CoreDAVTaskGroup setDelegate:](v275, "setDelegate:", val);
          objc_initWeak((id *)buf, val);
          objc_initWeak(&from, v275);
          -[CalDAVCalendarPropertyRefreshOperation outstandingTasksGroup](val, "outstandingTasksGroup");
          v285 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v285);

          v317[0] = MEMORY[0x24BDAC760];
          v317[1] = 3221225472;
          v317[2] = __67__CalDAVCalendarPropertyRefreshOperation__handleUpdateForCalendar___block_invoke_363;
          v317[3] = &unk_24C1FB488;
          objc_copyWeak(&v319, (id *)buf);
          objc_copyWeak(&v320, &from);
          v318 = v29;
          -[CoreDAVTaskGroup setCompletionBlock:](v275, "setCompletionBlock:", v317);
          -[CalDAVOperation outstandingTaskGroups](val, "outstandingTaskGroups");
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v286, "addObject:", v275);

          -[CalDAVGetPrincipalEmailDetailsTaskGroup startTaskGroup](v275, "startTaskGroup");
          objc_destroyWeak(&v320);
          objc_destroyWeak(&v319);
          objc_destroyWeak(&from);
          objc_destroyWeak((id *)buf);
          goto LABEL_307;
        }
      }
    }
  }
  v287 = objc_msgSend(v4, "canBePublished");
  if (v287 != -[NSObject canBePublished](v29, "canBePublished"))
    -[NSObject setCanBePublished:](v29, "setCanBePublished:", objc_msgSend(v4, "canBePublished"));
  v288 = objc_msgSend(v4, "canBeShared");
  if (v288 != -[NSObject canBeShared](v29, "canBeShared"))
    -[NSObject setCanBeShared:](v29, "setCanBeShared:", objc_msgSend(v4, "canBeShared"));
  v289 = objc_msgSend(v4, "isFamilyCalendar");
  if (v289 != -[NSObject isFamilyCalendar](v29, "isFamilyCalendar"))
    -[NSObject setIsFamilyCalendar:](v29, "setIsFamilyCalendar:", objc_msgSend(v4, "isFamilyCalendar"));
  v290 = objc_msgSend(v4, "isMarkedUndeletable");
  if (v290 != -[NSObject isMarkedUndeletable](v29, "isMarkedUndeletable"))
    -[NSObject setIsMarkedUndeletable:](v29, "setIsMarkedUndeletable:", objc_msgSend(v4, "isMarkedUndeletable"));
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v291 = objc_msgSend(v4, "maxAttendees");
    if (v291 != -[NSObject maxAttendees](v29, "maxAttendees"))
      -[NSObject setMaxAttendees:](v29, "setMaxAttendees:", objc_msgSend(v4, "maxAttendees"));
  }
  v292 = objc_msgSend(v4, "isMarkedImmutableSharees");
  if (v292 != -[NSObject isMarkedImmutableSharees](v29, "isMarkedImmutableSharees"))
    -[NSObject setIsMarkedImmutableSharees:](v29, "setIsMarkedImmutableSharees:", objc_msgSend(v4, "isMarkedImmutableSharees"));
  if (-[NSObject isScheduleInbox](v29, "isScheduleInbox"))
    -[CalDAVCalendarPropertyRefreshOperation _updateDefaultSchedulingCalendarIfNeededForInboxCalendar:withContainer:](val, "_updateDefaultSchedulingCalendarIfNeededForInboxCalendar:withContainer:", v29, v4);
  -[NSMutableSet addObject:](val->_updatedCalendars, "addObject:", v29);
  v104 = 1;
LABEL_325:

LABEL_326:
  return v104;
}

void __67__CalDAVCalendarPropertyRefreshOperation__handleUpdateForCalendar___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (id *)(a1 + 48);
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(WeakRetained, "setForceClearCalendarHomeSyncToken:", 1);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarRefreshPropPatchFinishedWithError:forCalendar:", v8, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(WeakRetained, "outstandingTaskGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "removeObject:", v10);

  objc_msgSend(WeakRetained, "outstandingTasksGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(WeakRetained, "outstandingTasksGroup");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v12);

  }
}

void __67__CalDAVCalendarPropertyRefreshOperation__handleUpdateForCalendar___block_invoke_363(id *a1)
{
  char *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v22[16];

  WeakRetained = (char *)objc_loadWeakRetained(a1 + 5);
  if (!WeakRetained)
    goto LABEL_13;
  v3 = objc_loadWeakRetained(a1 + 6);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_loadWeakRetained((id *)&WeakRetained[*MEMORY[0x24BE1AC80]]);
      objc_msgSend(v6, "logHandleForAccountInfoProvider:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_2096EB000, v8, OS_LOG_TYPE_INFO, "principalEmailDetailsTask encountered an error; not saving details to calendar",
          v22,
          2u);
      }

      goto LABEL_9;
    }
  }
  v9 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setOwnerDisplayName:", v10);

  v11 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v11, "principalResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setPreferredCalendarUserAddresses:", v13);

  v14 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v14, "principalResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredAddresses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CalDAVCalendarUserAddress preferredAddress:](CalDAVCalendarUserAddress, "preferredAddress:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setOwner:", v18);

  if (v4)
  {
LABEL_9:
    objc_msgSend(WeakRetained, "outstandingTaskGroups");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v4);

  }
  objc_msgSend(WeakRetained, "outstandingTasksGroup");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(WeakRetained, "outstandingTasksGroup");
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v21);

  }
LABEL_13:

}

- (void)_updateDefaultSchedulingCalendarIfNeededForInboxCalendar:(id)a3 withContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v6, "principal", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendars");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isScheduleInbox") & 1) == 0
          && (objc_msgSend(v14, "isScheduleOutbox") & 1) == 0
          && (objc_msgSend(v14, "isNotification") & 1) == 0
          && (objc_msgSend(v14, "isSubscribed") & 1) == 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v14, "becameDefaultSchedulingCalendar"))
        {
          objc_msgSend(v14, "calendarURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "relativePath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "CDVStringByAppendingSlashIfNeeded");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v18 = objc_alloc(MEMORY[0x24BE1AB18]);
            v19 = (void *)objc_msgSend(v18, "initWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AF38]);
            v20 = objc_alloc(MEMORY[0x24BE1AB18]);
            v21 = (void *)objc_msgSend(v20, "initWithNameSpace:andName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE70]);
            objc_msgSend(v21, "setPayloadAsString:", v17);
            objc_msgSend(v19, "extraChildItems");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v21);

            objc_msgSend(v7, "url");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CalDAVCalendarPropertyRefreshOperation _getSetPropertyTaskWithCoreDAVItem:forCalendar:atURL:](self, "_getSetPropertyTaskWithCoreDAVItem:forCalendar:atURL:", v19, v6, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v24);

            -[CoreDAVTaskGroup taskManager](self, "taskManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "submitQueuedCoreDAVTask:", v24);

            objc_msgSend(v6, "principal");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setDefaultCalendarURL:", v15);

          }
          goto LABEL_18;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_18:

}

- (void)_continueHandleContainerInfoTask:(id)a3 completedWithContainers:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  NSObject *v12;
  NSMutableDictionary *pathToLocalCalendar;
  NSMutableSet *localCalendarsWithNoPath;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  NSMutableSet *v44;
  NSMutableSet *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  id v55;
  NSObject *v56;
  NSMutableDictionary *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  void *v64;
  void *v65;
  NSMutableDictionary *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t m;
  id v71;
  id *location;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  uint64_t v100;
  __int16 v101;
  NSMutableSet *v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[CalDAVOperation principal](self, "principal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarPropertyRefreshOperation _initializePrincipalCalendarCache](self, "_initializePrincipalCalendarCache");
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]);
  WeakRetained = objc_loadWeakRetained(location);
  objc_msgSend(v10, "logHandleForAccountInfoProvider:", WeakRetained);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    pathToLocalCalendar = self->_pathToLocalCalendar;
    localCalendarsWithNoPath = self->_localCalendarsWithNoPath;
    *(_DWORD *)buf = 138412546;
    v100 = (uint64_t)pathToLocalCalendar;
    v101 = 2112;
    v102 = localCalendarsWithNoPath;
    _os_log_impl(&dword_2096EB000, v12, OS_LOG_TYPE_INFO, "Syncing calendar collections. Local calendars are: %@. Local calendars with no paths are: %@", buf, 0x16u);
  }

  objc_msgSend(v9, "inboxURL");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = 0;
  if (objc_msgSend(v9, "isWritable"))
  {
    if (v15)
    {
      objc_msgSend(v7, "containerForURL:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scheduleDefaultCalendarURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v16, "scheduleDefaultCalendarURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setDefaultCalendarURL:", v18);

      }
    }
  }
  v75 = v16;
  v76 = (void *)v15;
  objc_msgSend(v9, "outboxURL");
  v77 = v7;
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerForURL:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v9;
  objc_msgSend(v9, "setSupportsFreebusy:", objc_msgSend(v73, "supportsFreebusy"));
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVOperation principal](self, "principal");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deletedCalendarURLs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unionSet:", v21);

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v22 = v8;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v92;
    do
    {
      v26 = v22;
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v92 != v25)
          objc_enumerationMutation(v26);
        v28 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        objc_msgSend(v28, "url");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "absoluteString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v19, "containsObject:", v30);

        if ((v31 & 1) == 0)
        {
          objc_msgSend(v28, "url");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "absoluteString");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v33);

          if (-[CalDAVCalendarPropertyRefreshOperation _handleUpdateForCalendar:](self, "_handleUpdateForCalendar:", v28))
          {
            v34 = self->_pathToLocalCalendar;
            objc_msgSend(v28, "url");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "absoluteString");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "appendSlashIfNeeded");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](v34, "removeObjectForKey:", v37);

          }
        }
      }
      v22 = v26;
      v24 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
    }
    while (v24);
  }

  v38 = v78;
  if (!self->_isSecondRefresh)
  {
    if (-[NSMutableSet count](self->_localCalendarsWithNoPath, "count"))
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_loadWeakRetained(location);
      objc_msgSend(v39, "logHandleForAccountInfoProvider:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        v42 = v41;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = -[NSMutableSet count](self->_localCalendarsWithNoPath, "count");
          v44 = self->_localCalendarsWithNoPath;
          *(_DWORD *)buf = 134218242;
          v100 = v43;
          v101 = 2112;
          v102 = v44;
          _os_log_impl(&dword_2096EB000, v42, OS_LOG_TYPE_INFO, "Found %lu calendars with no paths. Sending these calendars to the server: %@", buf, 0x16u);
        }

      }
    }
    v71 = v22;
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v45 = self->_localCalendarsWithNoPath;
    v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v88 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
          if ((objc_msgSend(v50, "order", v71) & 0x80000000) != 0)
          {
            ++self->_nextCalendarOrder;
            objc_msgSend(v50, "setOrder:");
          }
          -[CalDAVCalendarPropertyRefreshOperation _getMkcalendarTaskGroupForCalendar:](self, "_getMkcalendarTaskGroupForCalendar:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v51);

          objc_msgSend(v51, "startTaskGroup");
        }
        v47 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
      }
      while (v47);
    }

    v38 = v78;
    v53 = objc_msgSend(v78, "isMergeSync");
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_loadWeakRetained(location);
    objc_msgSend(v54, "logHandleForAccountInfoProvider:", v55);
    v56 = objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      if (v56 && os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        v57 = self->_pathToLocalCalendar;
        *(_DWORD *)buf = 138412290;
        v100 = (uint64_t)v57;
        _os_log_impl(&dword_2096EB000, v56, OS_LOG_TYPE_INFO, "Since this is a merge sync, we're going to upload all the calendars that didn't exist on the server: %@", buf, 0xCu);
      }

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      -[NSMutableDictionary allValues](self->_pathToLocalCalendar, "allValues");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
      v22 = v71;
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v84;
        do
        {
          for (k = 0; k != v60; ++k)
          {
            if (*(_QWORD *)v84 != v61)
              objc_enumerationMutation(v58);
            v63 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
            if ((objc_msgSend(v63, "order", v71) & 0x80000000) != 0)
            {
              ++self->_nextCalendarOrder;
              objc_msgSend(v63, "setOrder:");
            }
            -[CalDAVCalendarPropertyRefreshOperation _getMkcalendarTaskGroupForCalendar:](self, "_getMkcalendarTaskGroupForCalendar:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "addObject:", v64);

            objc_msgSend(v64, "startTaskGroup");
          }
          v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
        }
        while (v60);
        v38 = v78;
      }
    }
    else
    {
      if (v56 && os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        v66 = self->_pathToLocalCalendar;
        *(_DWORD *)buf = 138412290;
        v100 = (uint64_t)v66;
        _os_log_impl(&dword_2096EB000, v56, OS_LOG_TYPE_INFO, "Deleting calendars that no longer appear on the server: %@", buf, 0xCu);
      }

      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      -[NSMutableDictionary allValues](self->_pathToLocalCalendar, "allValues");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
      v22 = v71;
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v80;
        do
        {
          for (m = 0; m != v68; ++m)
          {
            if (*(_QWORD *)v80 != v69)
              objc_enumerationMutation(v58);
            objc_msgSend(v78, "removeCalendar:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * m), v71);
          }
          v68 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
        }
        while (v68);
      }
    }

    -[CalDAVCalendarPropertyRefreshOperation _getDefaultCalendarsTasksIfNeededForPrincipal:](self, "_getDefaultCalendarsTasksIfNeededForPrincipal:", v38);
  }

}

- (id)_getDefaultMkCalendarForPrincipalTaskGroup:(id)a3 isEventCalendar:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const __CFUUID *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id WeakRetained;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  int v22;
  const __CFString *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = CFUUIDCreate(0);
  v8 = (__CFString *)CFUUIDCreateString(0, v7);
  objc_msgSend(v6, "calendarHomeURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString appendSlashIfNeeded](v8, "appendSlashIfNeeded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "calendarOfType:atURL:withOptions:", 0, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setGuid:", v8);
    if (v4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "defaultEventCalendarTitle");
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v20 = (void *)v14;
        objc_msgSend(v13, "setTitle:", v14);

      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "defaultTodoCalendarTitle");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(v13, "setCalendarURL:", v11);
    objc_msgSend(v13, "setIsEnabled:", objc_msgSend(v6, "isEnabled"));
    objc_msgSend(v13, "setIsEventContainer:", v4);
    objc_msgSend(v13, "setIsTaskContainer:", v4 ^ 1);
    ++self->_nextCalendarOrder;
    objc_msgSend(v13, "setOrder:");
    -[CalDAVCalendarPropertyRefreshOperation _getMkcalendarTaskGroupForCalendar:](self, "_getMkcalendarTaskGroupForCalendar:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v15, "logHandleForAccountInfoProvider:", WeakRetained);
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = CFSTR("todo");
    if (v4)
      v18 = CFSTR("event");
    v22 = 138412290;
    v23 = v18;
    _os_log_impl(&dword_2096EB000, v17, OS_LOG_TYPE_DEFAULT, "Couldn't create a default %@ calendar", (uint8_t *)&v22, 0xCu);
  }

  v19 = 0;
LABEL_15:
  CFRelease(v7);

  return v19;
}

- (void)_getDefaultCalendarsTasksIfNeededForPrincipal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(v4, "calendars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__CalDAVCalendarPropertyRefreshOperation__getDefaultCalendarsTasksIfNeededForPrincipal___block_invoke;
  v17[3] = &unk_24C1FB4D8;
  v17[4] = &v22;
  v17[5] = &v18;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);

  if (objc_msgSend(v4, "isEnabledForEvents") && !*((_BYTE *)v23 + 24))
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v6, "logHandleForAccountInfoProvider:", WeakRetained);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2096EB000, v8, OS_LOG_TYPE_DEFAULT, "This account is enabled for events, but has no event calendar. We're going to create a default one", v16, 2u);
    }

    -[CalDAVCalendarPropertyRefreshOperation _getDefaultMkCalendarForPrincipalTaskGroup:isEventCalendar:](self, "_getDefaultMkCalendarForPrincipalTaskGroup:isEventCalendar:", v4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v9);

    objc_msgSend(v9, "startTaskGroup");
  }
  if (objc_msgSend(v4, "isEnabledForTodos") && !*((_BYTE *)v19 + 24))
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v11, "logHandleForAccountInfoProvider:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2096EB000, v13, OS_LOG_TYPE_DEFAULT, "This account is enabled for tasks, but has no task calendar. We're going to create a default one", v16, 2u);
    }

    -[CalDAVCalendarPropertyRefreshOperation _getDefaultMkCalendarForPrincipalTaskGroup:isEventCalendar:](self, "_getDefaultMkCalendarForPrincipalTaskGroup:isEventCalendar:", v4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v14);

    objc_msgSend(v14, "startTaskGroup");
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

void __88__CalDAVCalendarPropertyRefreshOperation__getDefaultCalendarsTasksIfNeededForPrincipal___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  char v5;
  void *v6;
  char v7;
  char v8;
  char v9;
  char v10;
  id v11;

  v11 = a2;
  v5 = objc_msgSend(v11, "isSubscribed");
  v6 = v11;
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v11, "isScheduleInbox");
    v6 = v11;
    if ((v7 & 1) == 0)
    {
      v8 = objc_msgSend(v11, "isScheduleOutbox");
      v6 = v11;
      if ((v8 & 1) == 0)
      {
        v9 = objc_msgSend(v11, "isNotification");
        v6 = v11;
        if ((v9 & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= objc_msgSend(v11, "isEventContainer");
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v11, "isTaskContainer");
          v10 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          if (v10)
            v10 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
          *a3 = v10;
          v6 = v11;
        }
      }
    }
  }

}

- (void)containerInfoTask:(id)a3 completedWithContainers:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  NSObject *v17;
  NSObject *outstandingTasksGroup;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _QWORD block[6];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  -[CalDAVOperation principal](self, "principal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11)
  {
    objc_storeStrong((id *)&self->_savedError, a5);
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v15, "logHandleForAccountInfoProvider:", WeakRetained);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v11;
      _os_log_impl(&dword_2096EB000, v17, OS_LOG_TYPE_ERROR, "Encountered an error while getting calendar info: %@", buf, 0xCu);
    }

  }
  else
  {
    if (self->_isSecondRefresh)
    {
      -[CalDAVCalendarPropertyRefreshOperation _continueHandleContainerInfoTask:completedWithContainers:error:](self, "_continueHandleContainerInfoTask:completedWithContainers:error:", v12, v10, 0);
      goto LABEL_9;
    }
    objc_msgSend(v13, "calendarHomeURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "containerForURL:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "pushTransports");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPushTransports:", v20);

      objc_msgSend(v15, "pushKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCalendarHomePushKey:", v21);

      v22 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v15, "quotaAvailable");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "numberWithInteger:", (int)objc_msgSend(v23, "intValue"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setQuotaFreeBytes:", v24);

      objc_msgSend(v15, "privileges");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "count"))
        v26 = objc_msgSend(v15, "hasBindPrivileges");
      else
        v26 = 1;
      objc_msgSend(v14, "setCanCreateCalendars:", v26);

      objc_msgSend(v15, "syncToken");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVCalendarPropertyRefreshOperation setCalendarHomeSyncToken:](self, "setCalendarHomeSyncToken:", v31);

      objc_msgSend(v15, "supportedCalendarComponentSets");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSupportedCalendarComponentSets:", v27);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
      objc_msgSend(v27, "logHandleForAccountInfoProvider:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v30 = v29;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "calendarHomeURL");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = v32;
          _os_log_impl(&dword_2096EB000, v30, OS_LOG_TYPE_DEFAULT, "Didn't find a home container for the principal at %@", buf, 0xCu);

        }
      }

    }
    -[CalDAVCalendarPropertyRefreshOperation _continueHandleContainerInfoTask:completedWithContainers:error:](self, "_continueHandleContainerInfoTask:completedWithContainers:error:", v12, v10, 0);
  }

LABEL_9:
  outstandingTasksGroup = self->_outstandingTasksGroup;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__CalDAVCalendarPropertyRefreshOperation_containerInfoTask_completedWithContainers_error___block_invoke;
  block[3] = &unk_24C1FB3E8;
  block[4] = self;
  block[5] = a2;
  dispatch_group_notify(outstandingTasksGroup, MEMORY[0x24BDAC9B8], block);

}

void *__90__CalDAVCalendarPropertyRefreshOperation_containerInfoTask_completedWithContainers_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *result;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "outstandingTasks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 1399, CFSTR("All tasks should be complete when the outstanding task group is clear"));

  }
  objc_msgSend(*(id *)(a1 + 32), "outstandingTaskGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarPropertyRefreshOperation.m"), 1400, CFSTR("All task groups should be complete when the outstanding task group is clear"));

  }
  result = *(void **)(a1 + 32);
  if (!*((_BYTE *)result + (int)*MEMORY[0x24BE1AC88]))
    return (void *)objc_msgSend(result, "_finishRefresh");
  return result;
}

- (void)containerInfoSyncTask:(id)a3 retrievedAddedOrModifiedContainers:(id)a4 removedContainerURLs:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  id WeakRetained;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id obj;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v42 = a5;
  -[CalDAVOperation principal](self, "principal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarHomeURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendSlashIfNeeded");
  v11 = objc_claimAutoreleasedReturnValue();

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v7;
  v44 = (void *)v11;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v46)
  {
    v12 = *(_QWORD *)v52;
    v43 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v14, "url");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "absoluteString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendSlashIfNeeded");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "isEqualToString:", v11))
        {
          objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]);
          WeakRetained = objc_loadWeakRetained(v19);
          objc_msgSend(v18, "logHandleForAccountInfoProvider:", WeakRetained);
          v21 = objc_claimAutoreleasedReturnValue();

          if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v17;
            _os_log_impl(&dword_2096EB000, v21, OS_LOG_TYPE_INFO, "Modified Calendar Found in Report Is 'Calendar Home Collection' : %@", buf, 0xCu);
          }

          objc_msgSend(v14, "pushTransports");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_loadWeakRetained(v19);
            objc_msgSend(v23, "logHandleForAccountInfoProvider:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              v26 = v25;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                -[CalDAVOperation principal](self, "principal");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "pushTransports");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "pushTransports");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v57 = v28;
                v58 = 2112;
                v59 = v29;
                _os_log_impl(&dword_2096EB000, v26, OS_LOG_TYPE_INFO, "Updating Push-transports for 'Calendar Home Collection' From {\n%@\n} To: {\n%@\n}", buf, 0x16u);

              }
            }

            objc_msgSend(v14, "pushTransports");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[CalDAVOperation principal](self, "principal");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setPushTransports:", v30);

            v12 = v43;
            v11 = (uint64_t)v44;
          }
        }
        -[CalDAVCalendarPropertyRefreshOperation _handleUpdateForCalendar:](self, "_handleUpdateForCalendar:", v14);

      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v46);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v32 = v42;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v48 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
        -[CoreDAVTaskGroup delegate](self, "delegate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_opt_respondsToSelector();

        if ((v39 & 1) != 0)
        {
          -[CoreDAVTaskGroup delegate](self, "delegate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "calendarRefreshFoundDeletedContainerURL:", v37);

        }
        -[CalDAVOperation principal](self, "principal");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "removecalendarWithURL:", v37);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v34);
  }

}

- (void)containerInfoSyncTask:(id)a3 completedWithNewSyncToken:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *outstandingTasksGroup;
  NSObject *v19;
  _QWORD *v20;
  _QWORD v21[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10 || !objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v11, "logHandleForAccountInfoProvider:", WeakRetained);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[CalDAVOperation principal](self, "principal");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "calendarHomeURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v16;
        v25 = 2112;
        v26 = v9;
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_2096EB000, v14, OS_LOG_TYPE_DEFAULT, "Sync report against %@ failed with error %@ or no sync token %@. Retrying sync with a PROPFIND", buf, 0x20u);

      }
    }

    -[CalDAVOperation principal](self, "principal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCalendarHomeSyncToken:", 0);

    outstandingTasksGroup = self->_outstandingTasksGroup;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __96__CalDAVCalendarPropertyRefreshOperation_containerInfoSyncTask_completedWithNewSyncToken_error___block_invoke_381;
    v21[3] = &unk_24C1FB270;
    v21[4] = self;
    v19 = MEMORY[0x24BDAC9B8];
    v20 = v21;
  }
  else
  {
    -[CalDAVCalendarPropertyRefreshOperation setCalendarHomeSyncToken:](self, "setCalendarHomeSyncToken:", v9);
    outstandingTasksGroup = self->_outstandingTasksGroup;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__CalDAVCalendarPropertyRefreshOperation_containerInfoSyncTask_completedWithNewSyncToken_error___block_invoke;
    block[3] = &unk_24C1FB270;
    block[4] = self;
    v19 = MEMORY[0x24BDAC9B8];
    v20 = block;
  }
  dispatch_group_notify(outstandingTasksGroup, v19, v20);

}

void *__96__CalDAVCalendarPropertyRefreshOperation_containerInfoSyncTask_completedWithNewSyncToken_error___block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (!*((_BYTE *)result + (int)*MEMORY[0x24BE1AC88]))
    return (void *)objc_msgSend(result, "_finishRefresh");
  return result;
}

void *__96__CalDAVCalendarPropertyRefreshOperation_containerInfoSyncTask_completedWithNewSyncToken_error___block_invoke_381(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (!*((_BYTE *)result + (int)*MEMORY[0x24BE1AC88]))
    return (void *)objc_msgSend(result, "_reallyRefreshCalendarProperties");
  return result;
}

- (BOOL)useCalendarHomeSyncReport
{
  return self->_useCalendarHomeSyncReport;
}

- (void)setUseCalendarHomeSyncReport:(BOOL)a3
{
  self->_useCalendarHomeSyncReport = a3;
}

- (NSString)calendarHomeSyncToken
{
  return self->_calendarHomeSyncToken;
}

- (void)setCalendarHomeSyncToken:(id)a3
{
  objc_storeStrong((id *)&self->_calendarHomeSyncToken, a3);
}

- (OS_dispatch_group)outstandingTasksGroup
{
  return self->_outstandingTasksGroup;
}

- (void)setOutstandingTasksGroup:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingTasksGroup, a3);
}

- (BOOL)forceClearCalendarHomeSyncToken
{
  return self->_forceClearCalendarHomeSyncToken;
}

- (void)setForceClearCalendarHomeSyncToken:(BOOL)a3
{
  self->_forceClearCalendarHomeSyncToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingTasksGroup, 0);
  objc_storeStrong((id *)&self->_calendarHomeSyncToken, 0);
  objc_storeStrong((id *)&self->_updatedCalendars, 0);
  objc_storeStrong((id *)&self->_localCalendarsWithNoPath, 0);
  objc_storeStrong((id *)&self->_pathToLocalCalendar, 0);
  objc_storeStrong((id *)&self->_syncTokens, 0);
  objc_storeStrong((id *)&self->_ctags, 0);
  objc_storeStrong((id *)&self->_savedError, 0);
}

@end
