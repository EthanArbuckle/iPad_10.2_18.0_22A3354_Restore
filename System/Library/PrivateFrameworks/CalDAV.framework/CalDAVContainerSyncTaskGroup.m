@implementation CalDAVContainerSyncTaskGroup

- (CalDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 accountInfoProvider:(id)a7 taskManager:(id)a8 appSpecificCalendarItemClass:(Class)a9
{
  CalDAVContainerSyncTaskGroup *v9;
  CalDAVContainerSyncTaskGroup *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CalDAVContainerSyncTaskGroup;
  v9 = -[CoreDAVContainerSyncTaskGroup initWithFolderURL:previousCTag:previousSyncToken:actions:syncItemOrder:context:accountInfoProvider:taskManager:](&v12, sel_initWithFolderURL_previousCTag_previousSyncToken_actions_syncItemOrder_context_accountInfoProvider_taskManager_, a3, a4, a5, a6, 0, 0, a7, a8);
  v10 = v9;
  if (v9)
  {
    -[CalDAVContainerSyncTaskGroup setSyncEvents:](v9, "setSyncEvents:", 1);
    -[CalDAVContainerSyncTaskGroup setSyncTodos:](v10, "setSyncTodos:", 1);
    *(_DWORD *)&v10->_getScheduleTags = 0;
    *(Class *)((char *)&v10->super.super.super.isa + (int)*MEMORY[0x24BE1AC18]) = a9;
  }
  return v10;
}

- (CalDAVContainerSyncTaskGroup)initWithCalendar:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CalDAVContainerSyncTaskGroup *v16;
  uint64_t v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(v8, "appSpecificCalendarItemClass");
  else
    v11 = 0;
  objc_msgSend(v8, "ctag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "needsResync"))
  {

    v12 = 0;
    v13 = 0;
  }
  objc_msgSend(v8, "calendarURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CalDAVContainerSyncTaskGroup initWithFolderURL:previousCTag:previousSyncToken:actions:accountInfoProvider:taskManager:appSpecificCalendarItemClass:](self, "initWithFolderURL:previousCTag:previousSyncToken:actions:accountInfoProvider:taskManager:appSpecificCalendarItemClass:", v14, v12, v13, v15, v10, v9, v11);

  if (v16)
  {
    -[CalDAVContainerSyncTaskGroup setCalendar:](v16, "setCalendar:", v8);
    if ((objc_msgSend(v8, "isScheduleInbox") & 1) != 0)
      v17 = 0;
    else
      v17 = objc_msgSend(v8, "isNotification") ^ 1;
    -[CalDAVContainerSyncTaskGroup setGetScheduleTags:](v16, "setGetScheduleTags:", v17);
    -[CalDAVContainerSyncTaskGroup setGetScheduleChanges:](v16, "setGetScheduleChanges:", objc_msgSend(v8, "isScheduleInbox"));
    if (objc_msgSend(v8, "isNotification"))
      -[CoreDAVContainerSyncTaskGroup setUseMultiGet:](v16, "setUseMultiGet:", 0);
  }

  return v16;
}

- (id)copyMultiGetTaskWithURLs:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__CalDAVContainerSyncTaskGroup_copyMultiGetTaskWithURLs___block_invoke;
  v15[3] = &unk_24C1FB0B0;
  v15[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD12C84](v15);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __57__CalDAVContainerSyncTaskGroup_copyMultiGetTaskWithURLs___block_invoke_2;
  v13[3] = &unk_24C1FB0D8;
  objc_copyWeak(&v14, &location);
  v7 = (void *)MEMORY[0x20BD12C84](v13);
  if (*(&self->_fallbackOnMultiGetError + 4))
  {
    v8 = objc_alloc(MEMORY[0x24BE1AB68]);
    -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVTaskGroup taskManager](self, "taskManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithURLs:multiGetBlock:getBlock:accountInfoProvider:taskManager:", v4, v6, v7, v9, v10);

  }
  else
  {
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

CalDAVContainerMultiGetTask *__57__CalDAVContainerSyncTaskGroup_copyMultiGetTaskWithURLs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CalDAVContainerMultiGetTask *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CalDAVContainerMultiGetTask *v9;

  v3 = a2;
  v4 = [CalDAVContainerMultiGetTask alloc];
  v5 = *(char **)(a1 + 32);
  v6 = *(_QWORD *)&v5[*MEMORY[0x24BE1AC28]];
  v7 = objc_msgSend(v5, "getScheduleTags");
  v8 = objc_msgSend(*(id *)(a1 + 32), "getScheduleChanges");
  v9 = -[CalDAVContainerMultiGetTask initWithURLs:atContainerURL:getScheduleTags:getScheduleChanges:appSpecificCalendarItemClass:](v4, "initWithURLs:atContainerURL:getScheduleTags:getScheduleChanges:appSpecificCalendarItemClass:", v3, v6, v7, v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE1AC18]));

  return v9;
}

id __57__CalDAVContainerSyncTaskGroup_copyMultiGetTaskWithURLs___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(WeakRetained, "copyGetTaskWithURL:", v3);

  return v5;
}

- (id)copyGetTaskWithURL:(id)a3
{
  CalDAVCalendar *calendar;
  id v4;
  int v5;
  __objc2_class **v6;
  void *v7;

  calendar = self->_calendar;
  v4 = a3;
  v5 = -[CalDAVCalendar isNotification](calendar, "isNotification");
  v6 = off_24C1FA230;
  if (!v5)
    v6 = off_24C1FA220;
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithURL:", v4);

  return v7;
}

- (id)copyPutTaskWithPayloadItem:(id)a3 forAction:(id)a4
{
  id v6;
  id v7;
  CalDAVPutCalendarItemTask *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  CalDAVPutCalendarItemTask *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = [CalDAVPutCalendarItemTask alloc];
  objc_msgSend(v6, "dataPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainerSyncTaskGroup dataContentType](self, "dataContentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "action");

  if (v12)
  {
    objc_msgSend(v6, "syncKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CoreDAVPostOrPutTask initWithDataPayload:dataContentType:atURL:previousETag:](v8, "initWithDataPayload:dataContentType:atURL:previousETag:", v9, v10, v11, v13);

  }
  else
  {
    v14 = -[CoreDAVPostOrPutTask initWithDataPayload:dataContentType:atURL:previousETag:](v8, "initWithDataPayload:dataContentType:atURL:previousETag:", v9, v10, v11, 0);
  }

  objc_msgSend(v6, "scheduleTag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPutCalendarItemTask setPreviousScheduleTag:](v14, "setPreviousScheduleTag:", v15);

  return v14;
}

- (void)applyAdditionalPropertiesFromPutTask:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CoreDAVTaskGroup delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v10, "responseHeaders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CDVObjectForKeyCaseInsensitive:", CFSTR("Schedule-Tag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CoreDAVTaskGroup delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocalScheduleTag:forItemWithURL:inFolderWithURL:", v7, v9, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC28]));

  }
}

- (void)applyAdditionalPropertiesFromPostTask:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CoreDAVTaskGroup delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v10, "responseHeaders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CDVObjectForKeyCaseInsensitive:", CFSTR("Schedule-Tag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CoreDAVTaskGroup delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocalScheduleTag:forItemWithURL:inFolderWithURL:", v7, v9, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC28]));

  }
}

- (BOOL)shouldFetchMoreETags
{
  return *(_DWORD *)&self->_getScheduleTags == 3 && -[CalDAVContainerSyncTaskGroup syncTodos](self, "syncTodos");
}

- (BOOL)_shouldFetchEventsForState:(int)a3
{
  BOOL result;

  result = -[CalDAVContainerSyncTaskGroup syncEvents](self, "syncEvents");
  if ((a3 & 0xFFFFFFFE) != 2)
    return 0;
  return result;
}

- (BOOL)_shouldFetchTodosForState:(int)a3
{
  _BOOL4 v4;
  BOOL v6;

  v4 = -[CalDAVContainerSyncTaskGroup syncTodos](self, "syncTodos");
  v6 = a3 == 2 || a3 == 4;
  return v4 && v6;
}

- (id)copyGetEtagTaskWithPropertiesToFind:(id)a3
{
  id v5;
  CalDAVCalendar *calendar;
  char v7;
  char v8;
  char v9;
  int *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  id v17;
  CalDAVCalendarQueryTask *v18;
  _BOOL4 v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  id WeakRetained;
  NSObject *v26;
  int v27;
  CalDAVCalendarQueryTask *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[16];

  v5 = a3;
  calendar = self->_calendar;
  if (calendar)
  {
    v7 = -[CalDAVCalendar isEventContainer](calendar, "isEventContainer");
    v8 = v7 ^ -[CalDAVCalendar isTaskContainer](self->_calendar, "isTaskContainer");
    calendar = self->_calendar;
  }
  else
  {
    v8 = 0;
  }
  v9 = -[CalDAVCalendar isNotification](calendar, "isNotification");
  v10 = (int *)MEMORY[0x24BE1AC58];
  if ((v9 & 1) != 0)
    goto LABEL_8;
  if (-[CalDAVCalendar isScheduleInbox](self->_calendar, "isScheduleInbox"))
  {
    -[CalDAVCalendar principal](self->_calendar, "principal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "supportsTimeRangeFilterOnInbox");

    if (!v14)
      goto LABEL_8;
  }
  if (*((_BYTE *)&self->super.super.super.isa + *v10))
    goto LABEL_8;
  if ((v8 & 1) == 0)
  {
    v20 = -[CalDAVContainerSyncTaskGroup syncEvents](self, "syncEvents");
    if (v20 != -[CalDAVContainerSyncTaskGroup syncTodos](self, "syncTodos"))
    {
LABEL_19:
      if (-[CalDAVContainerSyncTaskGroup syncEvents](self, "syncEvents")
        && -[CalDAVContainerSyncTaskGroup syncTodos](self, "syncTodos"))
      {
        v23 = *(_DWORD *)&self->_getScheduleTags;
        if (v23 == 1)
        {
          objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
          objc_msgSend(v24, "logHandleForAccountInfoProvider:", WeakRetained);
          v26 = objc_claimAutoreleasedReturnValue();

          if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2096EB000, v26, OS_LOG_TYPE_DEFAULT, "<rdar://problem/11466753> Was asked for an etag task while our state is CalDAVContainerFetchingETagPropfindAll", buf, 2u);
          }

          v23 = *(_DWORD *)&self->_getScheduleTags;
        }
        if (v23 >= 2)
        {
          if (v23 != 3)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVContainerSyncTaskGroup.m"), 188, CFSTR("Unexpected state (%d) when fetching etags"), *(unsigned int *)&self->_getScheduleTags);

            goto LABEL_37;
          }
          v27 = 4;
        }
        else if (-[CalDAVContainerSyncTaskGroup supportsExtendedCalendarQuery](self, "supportsExtendedCalendarQuery"))
        {
          v27 = 2;
        }
        else
        {
          v27 = 3;
        }
      }
      else
      {
        if (!-[CalDAVContainerSyncTaskGroup syncEvents](self, "syncEvents")
          && !-[CalDAVContainerSyncTaskGroup syncTodos](self, "syncTodos"))
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVContainerSyncTaskGroup.m"), 192, CFSTR("Attempted to sync neither Todos nor Events in a CalDAV container"));

        }
        if (-[CalDAVContainerSyncTaskGroup syncEvents](self, "syncEvents"))
          v27 = 3;
        else
          v27 = 4;
      }
      *(_DWORD *)&self->_getScheduleTags = v27;
LABEL_37:
      v28 = [CalDAVCalendarQueryTask alloc];
      v18 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:](v28, "initWithPropertiesToFind:atURL:withDepth:", v5, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC28]), 3);
      -[CalDAVCalendarQueryTask setSyncEvents:](v18, "setSyncEvents:", -[CalDAVContainerSyncTaskGroup _shouldFetchEventsForState:](self, "_shouldFetchEventsForState:", *(unsigned int *)&self->_getScheduleTags));
      -[CalDAVCalendarQueryTask setSyncTodos:](v18, "setSyncTodos:", -[CalDAVContainerSyncTaskGroup _shouldFetchTodosForState:](self, "_shouldFetchTodosForState:", *(unsigned int *)&self->_getScheduleTags));
      -[CalDAVContainerSyncTaskGroup eventFilterStartDate](self, "eventFilterStartDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVCalendarQueryTask setEventFilterStartDate:](v18, "setEventFilterStartDate:", v29);

      -[CalDAVContainerSyncTaskGroup eventFilterEndDate](self, "eventFilterEndDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVCalendarQueryTask setEventFilterEndDate:](v18, "setEventFilterEndDate:", v30);

      goto LABEL_12;
    }
  }
  if (-[CalDAVContainerSyncTaskGroup syncEvents](self, "syncEvents"))
  {
    -[CalDAVContainerSyncTaskGroup eventFilterStartDate](self, "eventFilterStartDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {

      goto LABEL_19;
    }
    -[CalDAVContainerSyncTaskGroup eventFilterEndDate](self, "eventFilterEndDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      goto LABEL_19;
  }
LABEL_8:
  *(_DWORD *)&self->_getScheduleTags = 1;
  if (*((_BYTE *)&self->super.super.super.isa + *v10))
  {
    v15 = objc_alloc(MEMORY[0x24BE1ABC8]);
    v16 = objc_msgSend(v15, "initWithPropertiesToFind:atURL:withDepth:previousSyncToken:", v5, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC28]), 3, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC48]));
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x24BE1ABA0]);
    v16 = objc_msgSend(v17, "initWithPropertiesToFind:atURL:withDepth:", v5, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC28]), 3);
  }
  v18 = (CalDAVCalendarQueryTask *)v16;
LABEL_12:

  return v18;
}

- (id)dataContentType
{
  return CFSTR("text/calendar; charset=utf-8");
}

- (BOOL)shouldFetchResourceWithEtag:(id)a3 propertiesToValues:(id)a4
{
  CalDAVCalendar *calendar;
  id v5;
  void *v6;
  char v7;
  void *v8;

  calendar = self->_calendar;
  v5 = a4;
  if (-[CalDAVCalendar isNotification](calendar, "isNotification"))
  {
    objc_msgSend(v5, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("notificationtype"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isInviteNotification") & 1) != 0 || (objc_msgSend(v6, "isInviteReply") & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v6, "isResourceChanged");
  }
  else
  {
    objc_msgSend(v5, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE50]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "payloadAsString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("text/calendar")) != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)copyAdditionalResourcePropertiesToFetch
{
  void *v3;
  int v4;
  uint64_t *v5;
  uint64_t v6;
  __CFString **v7;

  v3 = (void *)objc_opt_new();
  v4 = -[CalDAVCalendar isNotification](self->_calendar, "isNotification");
  v5 = (uint64_t *)MEMORY[0x24BE1ADC8];
  if (!v4)
    v5 = (uint64_t *)MEMORY[0x24BE1AE30];
  v6 = *v5;
  v7 = cdXMLCalendarServerNotificationType;
  if (!v4)
    v7 = (__CFString **)MEMORY[0x24BE1AE50];
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v6, *v7, objc_opt_class());
  return v3;
}

- (CalDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 getScheduleTags:(BOOL)a7 getScheduleChanges:(BOOL)a8 accountInfoProvider:(id)a9 taskManager:(id)a10 appSpecificCalendarItemClass:(Class)a11
{
  _BOOL8 v11;
  _BOOL8 v12;
  CalDAVContainerSyncTaskGroup *v13;

  v11 = a8;
  v12 = a7;
  v13 = -[CalDAVContainerSyncTaskGroup initWithFolderURL:previousCTag:previousSyncToken:actions:accountInfoProvider:taskManager:appSpecificCalendarItemClass:](self, "initWithFolderURL:previousCTag:previousSyncToken:actions:accountInfoProvider:taskManager:appSpecificCalendarItemClass:", a3, a4, a5, a6, a9, a10, a11);
  -[CalDAVContainerSyncTaskGroup setGetScheduleTags:](v13, "setGetScheduleTags:", v12);
  -[CalDAVContainerSyncTaskGroup setGetScheduleChanges:](v13, "setGetScheduleChanges:", v11);
  return v13;
}

- (CalDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 getScheduleTags:(BOOL)a6 getScheduleChanges:(BOOL)a7 accountInfoProvider:(id)a8 taskManager:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  CalDAVContainerSyncTaskGroup *v11;

  v9 = a7;
  v10 = a6;
  v11 = -[CalDAVContainerSyncTaskGroup initWithFolderURL:previousCTag:previousSyncToken:actions:accountInfoProvider:taskManager:appSpecificCalendarItemClass:](self, "initWithFolderURL:previousCTag:previousSyncToken:actions:accountInfoProvider:taskManager:appSpecificCalendarItemClass:", a3, a4, a5, 0, a8, a9, 0);
  -[CalDAVContainerSyncTaskGroup setGetScheduleTags:](v11, "setGetScheduleTags:", v10);
  -[CalDAVContainerSyncTaskGroup setGetScheduleChanges:](v11, "setGetScheduleChanges:", v9);
  return v11;
}

- (CalDAVCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (BOOL)getScheduleTags
{
  return self->_supportsExtendedCalendarQuery;
}

- (void)setGetScheduleTags:(BOOL)a3
{
  self->_supportsExtendedCalendarQuery = a3;
}

- (BOOL)getScheduleChanges
{
  return self->_fallbackOnMultiGetError;
}

- (void)setGetScheduleChanges:(BOOL)a3
{
  self->_fallbackOnMultiGetError = a3;
}

- (BOOL)syncEvents
{
  return *(&self->_fallbackOnMultiGetError + 1);
}

- (void)setSyncEvents:(BOOL)a3
{
  *(&self->_fallbackOnMultiGetError + 1) = a3;
}

- (BOOL)syncTodos
{
  return *(&self->_fallbackOnMultiGetError + 2);
}

- (void)setSyncTodos:(BOOL)a3
{
  *(&self->_fallbackOnMultiGetError + 2) = a3;
}

- (BOOL)supportsExtendedCalendarQuery
{
  return *(&self->_fallbackOnMultiGetError + 3);
}

- (void)setSupportsExtendedCalendarQuery:(BOOL)a3
{
  *(&self->_fallbackOnMultiGetError + 3) = a3;
}

- (BOOL)fallbackOnMultiGetError
{
  return *(&self->_fallbackOnMultiGetError + 4);
}

- (void)setFallbackOnMultiGetError:(BOOL)a3
{
  *(&self->_fallbackOnMultiGetError + 4) = a3;
}

- (NSDateComponents)eventFilterStartDate
{
  return self->_eventFilterStartDate;
}

- (void)setEventFilterStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_eventFilterStartDate, a3);
}

- (NSDateComponents)eventFilterEndDate
{
  return self->_eventFilterEndDate;
}

- (void)setEventFilterEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_eventFilterEndDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventFilterEndDate, 0);
  objc_storeStrong((id *)&self->_eventFilterStartDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
