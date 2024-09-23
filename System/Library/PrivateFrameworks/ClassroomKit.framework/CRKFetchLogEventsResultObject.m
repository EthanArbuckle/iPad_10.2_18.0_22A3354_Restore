@implementation CRKFetchLogEventsResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchLogEventsResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchLogEventsResultObject *v5;
  void *v6;
  uint64_t v7;
  CRKEventLog *eventLog;
  void *v9;
  uint64_t v10;
  NSDate *currentDate;
  void *v12;
  uint64_t v13;
  NSString *sessionToken;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKFetchLogEventsResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("eventLog"));
    v7 = objc_claimAutoreleasedReturnValue();
    eventLog = v5->_eventLog;
    v5->_eventLog = (CRKEventLog *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("currentDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentDate = v5->_currentDate;
    v5->_currentDate = (NSDate *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("sessionToken"));
    v13 = objc_claimAutoreleasedReturnValue();
    sessionToken = v5->_sessionToken;
    v5->_sessionToken = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKFetchLogEventsResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CRKFetchLogEventsResultObject eventLog](self, "eventLog", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eventLog"));

  -[CRKFetchLogEventsResultObject currentDate](self, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("currentDate"));

  -[CRKFetchLogEventsResultObject sessionToken](self, "sessionToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sessionToken"));

}

- (CRKEventLog)eventLog
{
  return self->_eventLog;
}

- (void)setEventLog:(id)a3
{
  objc_storeStrong((id *)&self->_eventLog, a3);
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (void)setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_eventLog, 0);
}

@end
