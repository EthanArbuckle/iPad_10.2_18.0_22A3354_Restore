@implementation CalDAVRecurrenceSplitTaskGroup

- (CalDAVRecurrenceSplitTaskGroup)initWithCalendar:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5
{
  id v8;
  CalDAVRecurrenceSplitTaskGroup *v9;
  uint64_t v10;
  NSURL *folderURL;
  uint64_t v12;
  NSArray *actions;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CalDAVRecurrenceSplitTaskGroup;
  v9 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v15, sel_initWithAccountInfoProvider_taskManager_, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "calendarURL");
    v10 = objc_claimAutoreleasedReturnValue();
    folderURL = v9->_folderURL;
    v9->_folderURL = (NSURL *)v10;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "recurrenceSplitActions");
      v12 = objc_claimAutoreleasedReturnValue();
      actions = v9->_actions;
      v9->_actions = (NSArray *)v12;

    }
  }

  return v9;
}

- (void)startTaskGroup
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  CalDAVPostCalendarItemRecurrenceSplitTask *v6;
  void *v7;
  void *v8;
  CalDAVPostCalendarItemRecurrenceSplitTask *v9;
  void *v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  void *v14;
  NSArray *obj;
  uint64_t v16;
  NSObject *group;
  uint64_t v18;
  _QWORD block[6];
  _QWORD v20[5];
  NSObject *v21;
  _QWORD *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id from;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  group = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__0;
  v33[4] = __Block_byref_object_dispose__0;
  v34 = 0;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_actions;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v3)
  {
    v16 = *(_QWORD *)v30;
    do
    {
      v18 = v3;
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v6 = [CalDAVPostCalendarItemRecurrenceSplitTask alloc];
        objc_msgSend(v5, "resourceURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "recurrenceDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[CalDAVPostCalendarItemRecurrenceSplitTask initWithResourceURL:recurrenceDate:floating:allday:](v6, "initWithResourceURL:recurrenceDate:floating:allday:", v7, v8, objc_msgSend(v5, "isFloating"), objc_msgSend(v5, "isAllDay"));

        objc_msgSend(v5, "uidForCreatedSeries");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVPostCalendarItemRecurrenceSplitTask setUidForCreatedSeries:](v9, "setUidForCreatedSeries:", v10);

        WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE1AC80]));
        -[CalDAVPostCalendarItemRecurrenceSplitTask setAccountInfoProvider:](v9, "setAccountInfoProvider:", WeakRetained);

        objc_initWeak(&location, self);
        objc_initWeak(&from, v9);
        objc_initWeak(&v26, v5);
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __48__CalDAVRecurrenceSplitTaskGroup_startTaskGroup__block_invoke;
        v20[3] = &unk_24C1FB320;
        objc_copyWeak(&v23, &location);
        objc_copyWeak(&v24, &from);
        objc_copyWeak(&v25, &v26);
        v22 = v33;
        v20[4] = self;
        v12 = group;
        v21 = v12;
        -[CalDAVPostCalendarItemRecurrenceSplitTask setCompletionBlock:](v9, "setCompletionBlock:", v20);
        -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v9);

        dispatch_group_enter(v12);
        -[CoreDAVTaskGroup taskManager](self, "taskManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "submitQueuedCoreDAVTask:", v9);

        objc_destroyWeak(&v25);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&v26);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);

      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v3);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CalDAVRecurrenceSplitTaskGroup_startTaskGroup__block_invoke_2;
  block[3] = &unk_24C1FB1F8;
  block[4] = self;
  block[5] = v33;
  dispatch_group_notify(group, MEMORY[0x24BDAC9B8], block);
  _Block_object_dispose(v33, 8);

}

void __48__CalDAVRecurrenceSplitTaskGroup_startTaskGroup__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "outstandingTasks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v2);

  }
  objc_msgSend(v2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
      objc_storeStrong(v7, v5);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recurrenceSplitAction:failedWithError:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
LABEL_10:

      goto LABEL_11;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updatedETag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updatedScheduleTag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createdURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createdETag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createdScheduleTag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recurrenceSplitAction:completedWithUpdatedETag:updatedScheduleTag:createdURL:createdETag:createdScheduleTag:", v3, v14, v15, v16, v17, v18);

    goto LABEL_10;
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __48__CalDAVRecurrenceSplitTaskGroup_startTaskGroup__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
}

@end
