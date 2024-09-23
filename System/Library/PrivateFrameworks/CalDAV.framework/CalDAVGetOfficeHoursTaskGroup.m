@implementation CalDAVGetOfficeHoursTaskGroup

- (CalDAVGetOfficeHoursTaskGroup)initWithAccountInfoProvider:(id)a3 inboxURL:(id)a4 taskManager:(id)a5
{
  id v8;
  CalDAVGetOfficeHoursTaskGroup *v9;
  CalDAVGetOfficeHoursTaskGroup *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalDAVGetOfficeHoursTaskGroup;
  v9 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v12, sel_initWithAccountInfoProvider_taskManager_, a3, a5);
  v10 = v9;
  if (v9)
  {
    -[CalDAVGetOfficeHoursTaskGroup setInboxURL:](v9, "setInboxURL:", v8);
    -[CalDAVGetOfficeHoursTaskGroup setCalendarAvailability:](v10, "setCalendarAvailability:", 0);
    -[CalDAVGetOfficeHoursTaskGroup setFetchTask:](v10, "setFetchTask:", 0);
  }

  return v10;
}

- (void)startTaskGroup
{
  id v3;
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
  void *v14;
  id v15;

  v3 = objc_alloc(MEMORY[0x24BE1AB20]);
  v15 = (id)objc_msgSend(v3, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ADC8], CFSTR("calendar-availability"), objc_opt_class());
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE1ABA0]);
  -[CalDAVGetOfficeHoursTaskGroup inboxURL](self, "inboxURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPropertiesToFind:atURL:withDepth:", v4, v6, 2);

  -[CalDAVGetOfficeHoursTaskGroup setFetchTask:](self, "setFetchTask:", v7);
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetOfficeHoursTaskGroup fetchTask](self, "fetchTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetOfficeHoursTaskGroup fetchTask](self, "fetchTask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccountInfoProvider:", v10);

  -[CalDAVGetOfficeHoursTaskGroup fetchTask](self, "fetchTask");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetOfficeHoursTaskGroup fetchTask](self, "fetchTask");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitQueuedCoreDAVTask:", v14);

}

- (void)_finishWithError:(id)a3
{
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", a3, 0);
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a5;
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetOfficeHoursTaskGroup fetchTask](self, "fetchTask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

  if (!v6)
  {
    -[CalDAVGetOfficeHoursTaskGroup fetchTask](self, "fetchTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1ADC8], CFSTR("calendar-availability"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "payload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v13 = 0;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FB8]), "initWithData:options:error:", v11, 0, &v13);
        v6 = v13;
        -[CalDAVGetOfficeHoursTaskGroup setCalendarAvailability:](self, "setCalendarAvailability:", v12);

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  -[CalDAVGetOfficeHoursTaskGroup _finishWithError:](self, "_finishWithError:", v6);

}

- (ICSDocument)calendarAvailability
{
  return self->_calendarAvailability;
}

- (void)setCalendarAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_calendarAvailability, a3);
}

- (NSURL)inboxURL
{
  return self->_inboxURL;
}

- (void)setInboxURL:(id)a3
{
  objc_storeStrong((id *)&self->_inboxURL, a3);
}

- (CoreDAVPropFindTask)fetchTask
{
  return self->_fetchTask;
}

- (void)setFetchTask:(id)a3
{
  objc_storeStrong((id *)&self->_fetchTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchTask, 0);
  objc_storeStrong((id *)&self->_inboxURL, 0);
  objc_storeStrong((id *)&self->_calendarAvailability, 0);
}

@end
