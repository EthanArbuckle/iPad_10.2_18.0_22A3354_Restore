@implementation CalDAVDeleteCalendarItemTask

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)CalDAVDeleteCalendarItemTask;
  -[CoreDAVDeleteTask description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVDeleteCalendarItemTask previousScheduleTag](self, "previousScheduleTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@], previousScheduleTag: [%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)additionalHeaderValues
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalDAVDeleteCalendarItemTask;
  -[CoreDAVDeleteTask additionalHeaderValues](&v7, sel_additionalHeaderValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVDeleteCalendarItemTask previousScheduleTag](self, "previousScheduleTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CalDAVUtils headersFromHeaders:replacingPreconditionsWithScheduleTag:](CalDAVUtils, "headersFromHeaders:replacingPreconditionsWithScheduleTag:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)previousScheduleTag
{
  return self->_previousScheduleTag;
}

- (void)setPreviousScheduleTag:(id)a3
{
  objc_storeStrong((id *)&self->_previousScheduleTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousScheduleTag, 0);
}

@end
