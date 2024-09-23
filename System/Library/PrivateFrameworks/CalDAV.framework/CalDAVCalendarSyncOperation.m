@implementation CalDAVCalendarSyncOperation

- (CalDAVCalendarSyncOperation)initWithPrincipal:(id)a3 calendar:(id)a4 nextCtag:(id)a5 nextSyncToken:(id)a6
{
  id v11;
  id v12;
  id v13;
  CalDAVCalendarSyncOperation *v14;
  CalDAVCalendarSyncOperation *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CalDAVCalendarSyncOperation;
  v14 = -[CalDAVOperation initWithPrincipal:](&v17, sel_initWithPrincipal_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_calendar, a4);
    objc_storeStrong((id *)&v15->_nextCtag, a5);
    objc_storeStrong((id *)&v15->_nextSyncToken, a6);
  }

  return v15;
}

- (void)_finishWithError:(id)a3
{
  NSError *v4;
  NSError *v5;
  _QWORD v6[5];
  NSError *v7;

  v4 = (NSError *)a3;
  if (!v4)
    v4 = self->_reportJunkError;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CalDAVCalendar syncDidFinishWithError:](self->_calendar, "syncDidFinishWithError:", v4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__CalDAVCalendarSyncOperation__finishWithError___block_invoke;
  v6[3] = &unk_24C1FB298;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v5, v6);

}

void __48__CalDAVCalendarSyncOperation__finishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "principal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarSyncForPrincipal:calendar:completedWithError:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), *(_QWORD *)(a1 + 40));

}

- (id)_distantFutureEndDate
{
  if (_distantFutureEndDate_onceToken != -1)
    dispatch_once(&_distantFutureEndDate_onceToken, &__block_literal_global_3);
  return (id)_distantFutureEndDate_futureEndDate;
}

void __52__CalDAVCalendarSyncOperation__distantFutureEndDate__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x24BDBCE48]);
  v5 = (id)objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v1);

  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 252, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_distantFutureEndDate_futureEndDate;
  _distantFutureEndDate_futureEndDate = v3;

}

- (void)syncCalendar
{
  self->_currentStage = 1;
  -[CalDAVCalendarSyncOperation _performNextStage](self, "_performNextStage");
}

- (void)_advanceStage
{
  void *v3;
  id WeakRetained;
  NSObject *v5;
  unint64_t v6;
  uint8_t v7[16];

  switch(self->_currentStage)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
      objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
      v5 = objc_claimAutoreleasedReturnValue();

      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_2096EB000, v5, OS_LOG_TYPE_ERROR, "CalendarSyncOperationStageNone is terminal.  Why are we trying to transition out of it?", v7, 2u);
      }

      goto LABEL_6;
    case 1uLL:
      v6 = 2;
      break;
    case 2uLL:
      v6 = 3;
      break;
    case 3uLL:
      v6 = 4;
      break;
    default:
LABEL_6:
      v6 = 0;
      break;
  }
  self->_currentStage = v6;
}

- (void)_performNextStage
{
  void *v3;
  id WeakRetained;
  NSObject *v5;
  NSError *reportJunkError;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[16];

  -[CalDAVCalendarSyncOperation _advanceStage](self, "_advanceStage");
  switch(self->_currentStage)
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
      objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
      v5 = objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2096EB000, v5, OS_LOG_TYPE_ERROR, "CalendarSyncOperationStageBegin is not any stage's next stage.  How did we get here?", buf, 2u);
        }
      }

      break;
    case 2uLL:
      reportJunkError = self->_reportJunkError;
      self->_reportJunkError = 0;

      v7 = objc_opt_respondsToSelector();
      v8 = 0;
      if ((v7 & 1) != 0)
      {
        -[CalDAVCalendar reportJunkActions](self->_calendar, "reportJunkActions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v8;
      if (objc_msgSend(v8, "count"))
        -[CalDAVCalendarSyncOperation _reportJunk:](self, "_reportJunk:", v11);
      else
        -[CalDAVCalendarSyncOperation _performNextStage](self, "_performNextStage");

      break;
    case 3uLL:
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (-[CalDAVCalendar recurrenceSplitActions](self->_calendar, "recurrenceSplitActions"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "count"),
            v9,
            v10))
      {
        -[CalDAVCalendarSyncOperation _splitRecurrences](self, "_splitRecurrences");
      }
      else
      {
        -[CalDAVCalendarSyncOperation _performNextStage](self, "_performNextStage");
      }
      break;
    case 4uLL:
      -[CalDAVCalendarSyncOperation _syncCalendar](self, "_syncCalendar");
      break;
    default:
      return;
  }
}

- (void)_reportJunk:(id)a3
{
  id v4;
  CalDAVReportJunkTaskGroup *v5;
  id WeakRetained;
  id v7;
  CalDAVReportJunkTaskGroup *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id from;
  id location;

  v4 = a3;
  v5 = [CalDAVReportJunkTaskGroup alloc];
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  v7 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC98]));
  v8 = -[CalDAVReportJunkTaskGroup initWithReportJunkActions:accountInfoProvider:taskManager:](v5, "initWithReportJunkActions:accountInfoProvider:taskManager:", v4, WeakRetained, v7);

  -[CoreDAVTaskGroup setDelegate:](v8, "setDelegate:", self);
  -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __43__CalDAVCalendarSyncOperation__reportJunk___block_invoke;
  v13 = &unk_24C1FB248;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  -[CoreDAVTaskGroup setCompletionBlock:](v8, "setCompletionBlock:", &v10);
  -[CalDAVReportJunkTaskGroup startTaskGroup](v8, "startTaskGroup", v10, v11, v12, v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __43__CalDAVCalendarSyncOperation__reportJunk___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v2, "error");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)WeakRetained[18];
    WeakRetained[18] = v3;

    objc_msgSend(WeakRetained, "outstandingTaskGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v2);

    objc_msgSend(WeakRetained, "_performNextStage");
  }

}

- (void)_splitRecurrences
{
  CalDAVRecurrenceSplitTaskGroup *v3;
  CalDAVCalendar *calendar;
  id WeakRetained;
  id v6;
  CalDAVRecurrenceSplitTaskGroup *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id from;
  id location;

  v3 = [CalDAVRecurrenceSplitTaskGroup alloc];
  calendar = self->_calendar;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  v6 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC98]));
  v7 = -[CalDAVRecurrenceSplitTaskGroup initWithCalendar:accountInfoProvider:taskManager:](v3, "initWithCalendar:accountInfoProvider:taskManager:", calendar, WeakRetained, v6);

  -[CoreDAVTaskGroup setDelegate:](v7, "setDelegate:", self);
  -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__CalDAVCalendarSyncOperation__splitRecurrences__block_invoke;
  v9[3] = &unk_24C1FB488;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  v9[4] = self;
  -[CoreDAVTaskGroup setCompletionBlock:](v7, "setCompletionBlock:", v9);
  -[CalDAVRecurrenceSplitTaskGroup startTaskGroup](v7, "startTaskGroup");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __48__CalDAVCalendarSyncOperation__splitRecurrences__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "outstandingTaskGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v2);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (void *)WeakRetained[17];
      objc_msgSend(v2, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recurrenceSplitActionsCompletedWithError:", v5);

    }
    objc_msgSend(v2, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v2, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_finishWithError:", v8);

    }
    else
    {
      objc_msgSend(WeakRetained, "_performNextStage");
    }
  }

}

- (void)_syncCalendar
{
  uint64_t v3;
  NSUInteger v4;
  NSString *nextCtag;
  int v6;
  BOOL v7;
  NSString *nextSyncToken;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CalDAVContainerSyncTaskGroup *v15;
  CalDAVCalendar *calendar;
  void *v17;
  CalDAVContainerSyncTaskGroup *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  void *v26;
  id WeakRetained;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id from;
  _BYTE location[12];
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = 120;
  v4 = -[NSString length](self->_nextCtag, "length");
  if (v4)
  {
    nextCtag = self->_nextCtag;
    -[CalDAVCalendar ctag](self->_calendar, "ctag");
    v3 = objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](nextCtag, "isEqualToString:", v3))
    {
      v6 = 1;
      goto LABEL_6;
    }
  }
  if (!-[NSString length](self->_nextSyncToken, "length"))
  {
    v6 = 0;
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = v4 == 0;
  nextSyncToken = self->_nextSyncToken;
  -[CalDAVCalendar syncToken](self->_calendar, "syncToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSString isEqualToString:](nextSyncToken, "isEqualToString:", v9);

  if (!v7)
LABEL_6:

LABEL_7:
  if ((-[CalDAVCalendar needsResync](self->_calendar, "needsResync") & 1) != 0
    || !v6
    || (-[CalDAVCalendar syncActions](self->_calendar, "syncActions"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11))
  {
    -[CalDAVOperation principal](self, "principal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEnabledForEvents"))
      v13 = -[CalDAVCalendar isEventContainer](self->_calendar, "isEventContainer");
    else
      v13 = 0;
    if (objc_msgSend(v12, "isEnabledForTodos"))
      v14 = -[CalDAVCalendar isTaskContainer](self->_calendar, "isTaskContainer");
    else
      v14 = 0;
    if (((v13 | v14) & 1) != 0)
    {
      v15 = [CalDAVContainerSyncTaskGroup alloc];
      calendar = self->_calendar;
      -[CoreDAVTaskGroup taskManager](self, "taskManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[CalDAVContainerSyncTaskGroup initWithCalendar:accountInfoProvider:taskManager:](v15, "initWithCalendar:accountInfoProvider:taskManager:", calendar, v12, v17);

      -[CoreDAVTaskGroup setDelegate:](v18, "setDelegate:", self);
      -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v18);

      objc_initWeak((id *)location, v18);
      objc_initWeak(&from, self);
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __44__CalDAVCalendarSyncOperation__syncCalendar__block_invoke;
      v38[3] = &unk_24C1FB248;
      objc_copyWeak(&v39, &from);
      objc_copyWeak(&v40, (id *)location);
      -[CoreDAVTaskGroup setCompletionBlock:](v18, "setCompletionBlock:", v38);
      -[CalDAVContainerSyncTaskGroup setSyncEvents:](v18, "setSyncEvents:", v13);
      -[CalDAVContainerSyncTaskGroup setSyncTodos:](v18, "setSyncTodos:", v14);
      -[CalDAVContainerSyncTaskGroup setSupportsExtendedCalendarQuery:](v18, "setSupportsExtendedCalendarQuery:", objc_msgSend(v12, "supportsExtendedCalendarQuery"));
      objc_msgSend(v12, "account");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "serverVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "supportsTimeRangeFilter")
        && (!-[CalDAVCalendar isScheduleInbox](self->_calendar, "isScheduleInbox")
         || (objc_msgSend(v21, "supportsTimeRangeFilterOnInbox") & 1) == 0))
      {
        objc_msgSend(v12, "eventFilterStartDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVContainerSyncTaskGroup setEventFilterStartDate:](v18, "setEventFilterStartDate:", v22);

        objc_msgSend(v12, "eventFilterEndDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v21, "supportsTimeRangeFilterWithoutEndDate");
        if (v23)
          v25 = 1;
        else
          v25 = v24;
        if ((v25 & 1) == 0)
        {
          -[CalDAVCalendarSyncOperation _distantFutureEndDate](self, "_distantFutureEndDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[CalDAVContainerSyncTaskGroup setEventFilterEndDate:](v18, "setEventFilterEndDate:", v23);

      }
      -[CoreDAVContainerSyncTaskGroup startTaskGroup](v18, "startTaskGroup");

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
      objc_msgSend(v26, "logHandleForAccountInfoProvider:", WeakRetained);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = v28;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          -[CalDAVCalendar title](self->_calendar, "title");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138412290;
          *(_QWORD *)&location[4] = v30;
          _os_log_impl(&dword_2096EB000, v29, OS_LOG_TYPE_DEFAULT, "Skipping refresh of calendar \"%@\" because it isn't enabled to sync either events or todos", location, 0xCu);

        }
      }

      -[CalDAVCalendarSyncOperation _finishWithError:](self, "_finishWithError:", 0);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
    objc_msgSend(v31, "logHandleForAccountInfoProvider:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = v33;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        -[CalDAVCalendar title](self->_calendar, "title");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVCalendar ctag](self->_calendar, "ctag");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVCalendar syncToken](self->_calendar, "syncToken");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138412802;
        *(_QWORD *)&location[4] = v35;
        v43 = 2114;
        v44 = v36;
        v45 = 2114;
        v46 = v37;
        _os_log_impl(&dword_2096EB000, v34, OS_LOG_TYPE_INFO, "Skipping refresh of calendar \"%@\" because the ctag matches and we have no local changes (ctag: %{public}@, syncToken: %{public}@)", location, 0x20u);

      }
    }

    -[CalDAVCalendarSyncOperation _finishWithError:](self, "_finishWithError:", 0);
  }
}

void __44__CalDAVCalendarSyncOperation__syncCalendar__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "outstandingTaskGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v2);

    objc_msgSend(WeakRetained, "_performNextStage");
  }

}

- (void)_processAddedOrModified:(id)a3 removed:(id)a4
{
  CalDAVCalendar *calendar;
  id v7;

  calendar = self->_calendar;
  v7 = a4;
  -[CalDAVCalendar updateResourcesFromServer:](calendar, "updateResourcesFromServer:", a3);
  -[CalDAVCalendar deleteResourcesAtURLs:](self->_calendar, "deleteResourcesAtURLs:", v7);

}

- (void)_syncEventsForMerge
{
  CalDAVMergeUploadTaskGroup *v3;
  CalDAVCalendar *calendar;
  void *v5;
  void *v6;
  void *v7;
  CalDAVMergeUploadTaskGroup *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id location;

  v3 = [CalDAVMergeUploadTaskGroup alloc];
  calendar = self->_calendar;
  -[CalDAVOperation principal](self, "principal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVOperation principal](self, "principal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CalDAVMergeUploadTaskGroup initWithCalendar:principal:accountInfoProvider:taskManager:](v3, "initWithCalendar:principal:accountInfoProvider:taskManager:", calendar, v5, v6, v7);

  objc_initWeak(&location, v8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__CalDAVCalendarSyncOperation__syncEventsForMerge__block_invoke;
  v10[3] = &unk_24C1FB638;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  -[CoreDAVTaskGroup setCompletionBlock:](v8, "setCompletionBlock:", v10);
  -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  -[CalDAVMergeUploadTaskGroup startTaskGroup](v8, "startTaskGroup");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __50__CalDAVCalendarSyncOperation__syncEventsForMerge__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_finishWithError:", v5);

  objc_msgSend(*(id *)(a1 + 32), "outstandingTaskGroups");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "removeObject:", v6);

}

- (id)copyLocalETagsForURLs:(id)a3 inFolderWithURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "CDVIsEqualToURL:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVCalendarSyncOperation.m"), 293, CFSTR("We were asked about a folder URL that is different than the calendar we are refreshing: %@ (our calendar is at %@)"), v8, v14);

  }
  -[CalDAVCalendar etagsForItemURLs:](self->_calendar, "etagsForItemURLs:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyAllLocalURLsInFolderWithURL:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v10;
  void *v11;

  v5 = a3;
  -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "CDVIsEqualToURL:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVCalendarSyncOperation.m"), 299, CFSTR("We were asked about a folder URL that is different than the calendar we are refreshing: %@ (our calendar is at %@)"), v5, v11);

  }
  -[CalDAVCalendar allItemURLs](self->_calendar, "allItemURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)setLocalETag:(id)a3 forItemWithURL:(id)a4 inFolderWithURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  char v14;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "CDVIsEqualToURL:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVCalendarSyncOperation.m"), 305, CFSTR("We were asked about a folder URL that is different than the calendar we are refreshing: %@ (our calendar is at %@)"), v11, v17);

  }
  v14 = -[CalDAVCalendar setEtag:forItemAtURL:](self->_calendar, "setEtag:forItemAtURL:", v9, v10);

  return v14;
}

- (BOOL)setLocalScheduleTag:(id)a3 forItemWithURL:(id)a4 inFolderWithURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  char v14;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "CDVIsEqualToURL:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVCalendarSyncOperation.m"), 311, CFSTR("We were asked about a folder URL that is different than the calendar we are refreshing: %@ (our calendar is at %@)"), v11, v17);

  }
  v14 = -[CalDAVCalendar setScheduleTag:forItemAtURL:](self->_calendar, "setScheduleTag:forItemAtURL:", v9, v10);

  return v14;
}

- (BOOL)syncPutTask:(id)a3 completedWithNewETag:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  CalDAVCalendar *calendar;
  void *v10;

  v7 = a3;
  v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    calendar = self->_calendar;
    objc_msgSend(v7, "backingAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendar putAction:completedWithError:](calendar, "putAction:completedWithError:", v10, v8);

  }
  return v8 == 0;
}

- (BOOL)syncDeleteTask:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  CalDAVCalendar *calendar;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    calendar = self->_calendar;
    objc_msgSend(v6, "backingAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendar deleteAction:completedWithError:](calendar, "deleteAction:completedWithError:", v9, v7);

  }
  return v7 == 0;
}

- (void)containerSyncTask:(id)a3 retrievedAddedOrModifiedActions:(id)a4 removed:(id)a5
{
  -[CalDAVCalendarSyncOperation _processAddedOrModified:removed:](self, "_processAddedOrModified:removed:", a4, a5);
}

- (void)containerSyncTask:(id)a3 completedWithNewCTag:(id)a4 newSyncToken:(id)a5 addedOrModified:(id)a6 removed:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id *v18;
  id WeakRetained;
  void *v20;
  NSObject *v21;
  void *v22;
  __CFString *v23;
  const __CFString *v24;
  NSString *nextCtag;
  NSString *nextSyncToken;
  void *v27;
  char v28;
  void *v29;
  id v30;
  NSObject *v31;
  CalDAVCalendar *calendar;
  SEL v33;
  id v34;
  void *v35;
  NSString *v36;
  NSString *v37;
  _QWORD v38[7];
  _BYTE buf[24];
  __CFString *v40;
  uint64_t v41;

  v33 = a2;
  v41 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v36 = (NSString *)a4;
  v37 = (NSString *)a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v35 = v14;
  -[CalDAVCalendarSyncOperation _processAddedOrModified:removed:](self, "_processAddedOrModified:removed:", v14, v15);
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]);
  WeakRetained = objc_loadWeakRetained(v18);
  objc_msgSend(v17, "logHandleForAccountInfoProvider:", WeakRetained);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = v20;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      -[CalDAVCalendar title](self->_calendar, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = &stru_24C1FD208;
      if (v16)
        v24 = CFSTR(" Error was: ");
      else
        v24 = &stru_24C1FD208;
      if (v16)
      {
        objc_msgSend(v16, "description");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2112;
      v40 = v23;
      _os_log_impl(&dword_2096EB000, v21, OS_LOG_TYPE_INFO, "Finished syncing container \"%@\".%@%@", buf, 0x20u);
      if (v16)

    }
  }

  if (v16)
    goto LABEL_23;
  nextCtag = v36;
  if (!v36)
    nextCtag = self->_nextCtag;
  -[CalDAVCalendar setCtag:](self->_calendar, "setCtag:", nextCtag, v33, v34);
  nextSyncToken = v37;
  if (!v37)
    nextSyncToken = self->_nextSyncToken;
  -[CalDAVCalendar setSyncToken:](self->_calendar, "setSyncToken:", nextSyncToken);
  -[CalDAVOperation principal](self, "principal");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "isMergeSync")
    || (-[CalDAVCalendar isNotification](self->_calendar, "isNotification") & 1) != 0
    || (-[CalDAVCalendar isSubscribed](self->_calendar, "isSubscribed") & 1) != 0
    || (-[CalDAVCalendar isScheduleInbox](self->_calendar, "isScheduleInbox") & 1) != 0
    || -[CalDAVCalendar isScheduleOutbox](self->_calendar, "isScheduleOutbox"))
  {

LABEL_23:
    -[CalDAVCalendarSyncOperation _finishWithError:](self, "_finishWithError:", v16, v33);
    goto LABEL_24;
  }
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) == 0)
    goto LABEL_23;
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_loadWeakRetained(v18);
  objc_msgSend(v29, "logHandleForAccountInfoProvider:", v30);
  v31 = objc_claimAutoreleasedReturnValue();

  if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2096EB000, v31, OS_LOG_TYPE_INFO, "This is a merge sync. Collecting merge actions from calendar and beginning upload", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v40) = 0;
  calendar = self->_calendar;
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __113__CalDAVCalendarSyncOperation_containerSyncTask_completedWithNewCTag_newSyncToken_addedOrModified_removed_error___block_invoke;
  v38[3] = &unk_24C1FB660;
  v38[4] = self;
  v38[5] = buf;
  v38[6] = v33;
  -[CalDAVCalendar prepareMergeSyncActionsWithCompletionBlock:](calendar, "prepareMergeSyncActionsWithCompletionBlock:", v38);
  _Block_object_dispose(buf, 8);
LABEL_24:

}

uint64_t __113__CalDAVCalendarSyncOperation_containerSyncTask_completedWithNewCTag_newSyncToken_addedOrModified_removed_error___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  void *v7;
  uint8_t v8[16];

  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v2, "logHandleForAccountInfoProvider:", WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2096EB000, v4, OS_LOG_TYPE_INFO, "Sync action completion block was called", v8, 2u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("CalDAVCalendarSyncOperation.m"), 365, CFSTR("The sync action completion block should only be called once"));

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_syncEventsForMerge");
}

- (void)reportJunkAction:(id)a3 completedWithError:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CalDAVCalendar reportJunkAction:completedWithError:](self->_calendar, "reportJunkAction:completedWithError:", v7, v6);

}

- (void)recurrenceSplitAction:(id)a3 completedWithUpdatedETag:(id)a4 updatedScheduleTag:(id)a5 createdURL:(id)a6 createdETag:(id)a7 createdScheduleTag:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v19 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CalDAVCalendar recurrenceSplitAction:completedWithUpdatedETag:updatedScheduleTag:createdURL:createdETag:createdScheduleTag:](self->_calendar, "recurrenceSplitAction:completedWithUpdatedETag:updatedScheduleTag:createdURL:createdETag:createdScheduleTag:", v19, v14, v15, v16, v17, v18);

}

- (void)recurrenceSplitAction:(id)a3 failedWithError:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CalDAVCalendar recurrenceSplitAction:failedWithError:](self->_calendar, "recurrenceSplitAction:failedWithError:", v7, v6);

}

- (BOOL)getScheduleTags
{
  return self->_getScheduleTags;
}

- (void)setGetScheduleTags:(BOOL)a3
{
  self->_getScheduleTags = a3;
}

- (BOOL)getScheduleChanges
{
  return self->_getScheduleChanges;
}

- (void)setGetScheduleChanges:(BOOL)a3
{
  self->_getScheduleChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportJunkError, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_nextSyncToken, 0);
  objc_storeStrong((id *)&self->_nextCtag, 0);
  objc_storeStrong((id *)&self->_savedError, 0);
}

@end
