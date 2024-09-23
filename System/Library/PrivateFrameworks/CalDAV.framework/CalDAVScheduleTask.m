@implementation CalDAVScheduleTask

- (CalDAVScheduleTask)initWithOriginator:(id)a3 attendees:(id)a4 outboxURL:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  CalDAVScheduleTask *v12;
  CalDAVScheduleTask *v13;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CalDAVScheduleTask;
  v12 = -[CoreDAVPostTask initWithDataPayload:dataContentType:atURL:previousETag:](&v15, sel_initWithDataPayload_dataContentType_atURL_previousETag_, a6, CFSTR("text/calendar"), a5, 0);
  v13 = v12;
  if (v12)
  {
    -[CalDAVScheduleTask setOriginator:](v12, "setOriginator:", v10);
    -[CalDAVScheduleTask setAttendees:](v13, "setAttendees:", v11);
  }

  return v13;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = objc_alloc(MEMORY[0x24BE1ABE0]);
  v5 = *MEMORY[0x24BE1ACF8];
  v6 = objc_opt_class();
  -[CalDAVScheduleTask url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithRootElementNameSpace:name:parseClass:baseURL:", v5, CFSTR("schedule-response"), v6, v7);

  return v8;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE1AC70]));
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == 1)
    {
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v18 = (id)objc_opt_class();
          v11 = v18;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          v14 = OS_LOG_TYPE_INFO;
          v15 = 12;
LABEL_10:
          _os_log_impl(&dword_2096EB000, v13, v14, v12, buf, v15);

          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v18 = (id)objc_opt_class();
        v19 = 2112;
        v20 = v5;
        v11 = v18;
        v12 = "%{public}@ failed: %@";
        v13 = v10;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = 22;
        goto LABEL_10;
      }
LABEL_11:

    }
  }
  else
  {
    -[CalDAVScheduleTask responseBodyParser](self, "responseBodyParser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVScheduleTask setScheduleResponse:](self, "setScheduleResponse:", v9);
  }

  v16.receiver = self;
  v16.super_class = (Class)CalDAVScheduleTask;
  -[CoreDAVPostTask finishCoreDAVTaskWithError:](&v16, sel_finishCoreDAVTaskWithError_, v5);

}

- (NSArray)attendees
{
  return self->_attendees;
}

- (void)setAttendees:(id)a3
{
  objc_storeStrong((id *)&self->_attendees, a3);
}

- (CalDAVScheduleResponseItem)scheduleResponse
{
  return self->_scheduleResponse;
}

- (void)setScheduleResponse:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleResponse, a3);
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_originator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_scheduleResponse, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
}

@end
