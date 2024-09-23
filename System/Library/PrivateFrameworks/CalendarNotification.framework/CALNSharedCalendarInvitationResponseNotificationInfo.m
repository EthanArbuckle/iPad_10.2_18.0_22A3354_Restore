@implementation CALNSharedCalendarInvitationResponseNotificationInfo

- (CALNSharedCalendarInvitationResponseNotificationInfo)initWithSourceClientIdentifier:(id)a3 calendarNotification:(id)a4 isDelegate:(BOOL)a5 sourceTitle:(id)a6 sourceIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CALNSharedCalendarInvitationResponseNotificationInfo *v16;
  uint64_t v17;
  NSString *sourceClientIdentifier;
  uint64_t v19;
  NSString *sourceTitle;
  uint64_t v21;
  NSString *sourceIdentifier;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CALNSharedCalendarInvitationResponseNotificationInfo;
  v16 = -[CALNSharedCalendarInvitationResponseNotificationInfo init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    sourceClientIdentifier = v16->_sourceClientIdentifier;
    v16->_sourceClientIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v16->_calendarNotification, a4);
    v16->_isDelegate = a5;
    v19 = objc_msgSend(v14, "copy");
    sourceTitle = v16->_sourceTitle;
    v16->_sourceTitle = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    sourceIdentifier = v16->_sourceIdentifier;
    v16->_sourceIdentifier = (NSString *)v21;

  }
  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CALNSharedCalendarInvitationResponseNotificationInfo sourceClientIdentifier](self, "sourceClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNSharedCalendarInvitationResponseNotificationInfo calendarNotification](self, "calendarNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CALNSharedCalendarInvitationResponseNotificationInfo isDelegate](self, "isDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNSharedCalendarInvitationResponseNotificationInfo sourceTitle](self, "sourceTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNSharedCalendarInvitationResponseNotificationInfo sourceIdentifier](self, "sourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(sourceClientIdentifier = %@, calendarNotification = %@, isDelegate = %@, sourceTitle = %@, sourceIdentifier = %@)"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (EKCalendarNotification)calendarNotification
{
  return self->_calendarNotification;
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
  objc_storeStrong((id *)&self->_calendarNotification, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
}

@end
