@implementation _ATXNotificationDuetEvent

- (_ATXNotificationDuetEvent)initWithBundleId:(id)a3 notificationId:(id)a4 eventTime:(id)a5 timeZone:(id)a6 eventType:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _ATXNotificationDuetEvent *v17;
  _ATXNotificationDuetEvent *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_ATXNotificationDuetEvent;
  v17 = -[_ATXNotificationDuetEvent init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleId, a3);
    objc_storeStrong((id *)&v18->_notificationId, a4);
    objc_storeStrong((id *)&v18->_eventTime, a5);
    objc_storeStrong((id *)&v18->_timeZone, a6);
    v18->_eventType = ATXNEventTypeFromString();
  }

  return v18;
}

- (id)prettyRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v4 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFormatFromTemplate:options:locale:", CFSTR("EMMMd HH:mm ss ZZZZ"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setDateFormat:", v6);
  objc_msgSend(v3, "stringFromDate:", self->_eventTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  ATXNEventTypeToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: (%@, %@, %@)"), v7, v9, self->_notificationId, self->_bundleId);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isReceiveEvent
{
  return self->_eventType == 0;
}

- (BOOL)isAcceptEvent
{
  return (self->_eventType < 0xCuLL) & (0xA86u >> self->_eventType);
}

- (BOOL)isRejectEvent
{
  return (self->_eventType < 0xBuLL) & (0x568u >> self->_eventType);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)notificationId
{
  return self->_notificationId;
}

- (NSDate)eventTime
{
  return self->_eventTime;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);
  objc_storeStrong((id *)&self->_notificationId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
