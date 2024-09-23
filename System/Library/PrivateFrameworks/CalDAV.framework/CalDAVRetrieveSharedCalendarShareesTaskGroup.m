@implementation CalDAVRetrieveSharedCalendarShareesTaskGroup

- (CalDAVRetrieveSharedCalendarShareesTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Initializing this class instance with an inherited initializer not allowed."), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (CalDAVRetrieveSharedCalendarShareesTaskGroup)initWithCalendarURL:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5
{
  id v8;
  CalDAVRetrieveSharedCalendarShareesTaskGroup *v9;
  CalDAVRetrieveSharedCalendarShareesTaskGroup *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CalDAVRetrieveSharedCalendarShareesTaskGroup;
  v9 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v12, sel_initWithAccountInfoProvider_taskManager_, a4, a5);
  v10 = v9;
  if (v9)
  {
    -[CalDAVRetrieveSharedCalendarShareesTaskGroup setUrl:](v9, "setUrl:", v8);
    -[CalDAVRetrieveSharedCalendarShareesTaskGroup setSharees:](v10, "setSharees:", 0);
  }

  return v10;
}

- (void)startTaskGroup
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x24BE1AB20]);
  v10 = (id)objc_msgSend(v3, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ADC8], CFSTR("invite"), objc_opt_class());
  v4 = objc_alloc(MEMORY[0x24BE1ABA0]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVRetrieveSharedCalendarShareesTaskGroup url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithPropertiesToFind:atURL:withDepth:", v5, v6, 2);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountInfoProvider:", v8);

  objc_msgSend(v7, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitQueuedCoreDAVTask:", v7);

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(a3, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1ADC8], CFSTR("invite"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVRetrieveSharedCalendarShareesTaskGroup setSharees:](self, "setSharees:", v8);

    v6 = 0;
  }
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v6, 0);

}

- (NSSet)sharees
{
  return self->_sharees;
}

- (void)setSharees:(id)a3
{
  objc_storeStrong((id *)&self->_sharees, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sharees, 0);
}

@end
