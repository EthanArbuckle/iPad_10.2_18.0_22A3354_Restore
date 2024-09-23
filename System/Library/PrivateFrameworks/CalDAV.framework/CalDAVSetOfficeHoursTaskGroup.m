@implementation CalDAVSetOfficeHoursTaskGroup

- (CalDAVSetOfficeHoursTaskGroup)initWithAccountInfoProvider:(id)a3 inboxURL:(id)a4 calendarAvailability:(id)a5 taskManager:(id)a6
{
  id v10;
  id v11;
  CalDAVSetOfficeHoursTaskGroup *v12;
  CalDAVSetOfficeHoursTaskGroup *v13;
  objc_super v15;

  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CalDAVSetOfficeHoursTaskGroup;
  v12 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v15, sel_initWithAccountInfoProvider_taskManager_, a3, a6);
  v13 = v12;
  if (v12)
  {
    -[CalDAVSetOfficeHoursTaskGroup setInboxURL:](v12, "setInboxURL:", v10);
    -[CalDAVSetOfficeHoursTaskGroup setCalendarAvailability:](v13, "setCalendarAvailability:", v11);
  }

  return v13;
}

- (void)startTaskGroup
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[CalDAVSetOfficeHoursTaskGroup calendarAvailability](self, "calendarAvailability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ICSStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BE1AB18]);
  v6 = (void *)objc_msgSend(v5, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("calendar-availability"));
  objc_msgSend(v6, "setPayload:", v14);
  v7 = objc_alloc(MEMORY[0x24BE1ABA8]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVSetOfficeHoursTaskGroup inboxURL](self, "inboxURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithPropertiesToSet:andRemove:atURL:", v8, 0, v9);

  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccountInfoProvider:", v12);

  objc_msgSend(v10, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitQueuedCoreDAVTask:", v10);

}

- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a5;
  v7 = a3;
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v9, 0);
}

- (NSURL)inboxURL
{
  return self->_inboxURL;
}

- (void)setInboxURL:(id)a3
{
  objc_storeStrong((id *)&self->_inboxURL, a3);
}

- (ICSDocument)calendarAvailability
{
  return self->_calendarAvailability;
}

- (void)setCalendarAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_calendarAvailability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarAvailability, 0);
  objc_storeStrong((id *)&self->_inboxURL, 0);
}

@end
