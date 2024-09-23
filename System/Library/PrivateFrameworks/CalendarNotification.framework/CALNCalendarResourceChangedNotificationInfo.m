@implementation CALNCalendarResourceChangedNotificationInfo

- (CALNCalendarResourceChangedNotificationInfo)initWithSourceClientIdentifier:(id)a3 calendarNotification:(id)a4 changeType:(unsigned int)a5 date:(id)a6 allDay:(BOOL)a7 timeZone:(id)a8 expirationDate:(id)a9 launchURL:(id)a10 isDelegate:(BOOL)a11 sourceTitle:(id)a12 sourceIdentifier:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CALNCalendarResourceChangedNotificationInfo *v24;
  uint64_t v25;
  NSString *sourceClientIdentifier;
  uint64_t v27;
  NSDate *date;
  uint64_t v29;
  NSTimeZone *timeZone;
  uint64_t v31;
  NSDate *expirationDate;
  uint64_t v33;
  NSURL *launchURL;
  uint64_t v35;
  NSString *sourceTitle;
  uint64_t v37;
  NSString *sourceIdentifier;
  id v41;
  id v42;
  objc_super v43;

  v42 = a3;
  v41 = a4;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a12;
  v23 = a13;
  v43.receiver = self;
  v43.super_class = (Class)CALNCalendarResourceChangedNotificationInfo;
  v24 = -[CALNCalendarResourceChangedNotificationInfo init](&v43, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v42, "copy");
    sourceClientIdentifier = v24->_sourceClientIdentifier;
    v24->_sourceClientIdentifier = (NSString *)v25;

    objc_storeStrong((id *)&v24->_calendarNotification, a4);
    v24->_changeType = a5;
    v27 = objc_msgSend(v18, "copy");
    date = v24->_date;
    v24->_date = (NSDate *)v27;

    v24->_allDay = a7;
    v29 = objc_msgSend(v19, "copy");
    timeZone = v24->_timeZone;
    v24->_timeZone = (NSTimeZone *)v29;

    v31 = objc_msgSend(v20, "copy");
    expirationDate = v24->_expirationDate;
    v24->_expirationDate = (NSDate *)v31;

    v33 = objc_msgSend(v21, "copy");
    launchURL = v24->_launchURL;
    v24->_launchURL = (NSURL *)v33;

    v24->_isDelegate = a11;
    v35 = objc_msgSend(v22, "copy");
    sourceTitle = v24->_sourceTitle;
    v24->_sourceTitle = (NSString *)v35;

    v37 = objc_msgSend(v23, "copy");
    sourceIdentifier = v24->_sourceIdentifier;
    v24->_sourceIdentifier = (NSString *)v37;

  }
  return v24;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v16 = objc_opt_class();
  -[CALNCalendarResourceChangedNotificationInfo sourceClientIdentifier](self, "sourceClientIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNCalendarResourceChangedNotificationInfo calendarNotification](self, "calendarNotification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CALNCalendarResourceChangedNotificationInfo changeType](self, "changeType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNCalendarResourceChangedNotificationInfo date](self, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CALNCalendarResourceChangedNotificationInfo allDay](self, "allDay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNCalendarResourceChangedNotificationInfo timeZone](self, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNCalendarResourceChangedNotificationInfo expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNCalendarResourceChangedNotificationInfo launchURL](self, "launchURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CALNCalendarResourceChangedNotificationInfo isDelegate](self, "isDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNCalendarResourceChangedNotificationInfo sourceTitle](self, "sourceTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNCalendarResourceChangedNotificationInfo sourceIdentifier](self, "sourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>(sourceClientIdentifier = %@, calendarNotification = %@, changeType = %@, date = %@, allDay = %@, timeZone = %@, expirationDate = %@, launchURL = %@, isDelegate = %@, sourceTitle = %@, sourceIdentifier = %@)"), v16, self, v15, v14, v13, v12, v3, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (EKCalendarResourceChangeNotification)calendarNotification
{
  return self->_calendarNotification;
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (BOOL)isDelegate
{
  return self->_isDelegate;
}

- (NSString)sourceTitle
{
  return self->_sourceTitle;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceTitle, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_calendarNotification, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
}

@end
