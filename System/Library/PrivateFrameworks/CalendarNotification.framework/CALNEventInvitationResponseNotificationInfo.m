@implementation CALNEventInvitationResponseNotificationInfo

- (CALNEventInvitationResponseNotificationInfo)initWithSourceClientIdentifier:(id)a3 launchURL:(id)a4 expirationDate:(id)a5 eventInvitationNotification:(id)a6 eventRepresentationDictionary:(id)a7 isDelegate:(BOOL)a8 sourceTitle:(id)a9 sourceIdentifier:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CALNEventInvitationResponseNotificationInfo *v23;
  uint64_t v24;
  NSString *sourceClientIdentifier;
  uint64_t v26;
  NSURL *launchURL;
  uint64_t v28;
  NSDate *expirationDate;
  uint64_t v30;
  NSDictionary *eventRepresentationDictionary;
  uint64_t v32;
  NSString *sourceTitle;
  uint64_t v34;
  NSString *sourceIdentifier;
  objc_super v37;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)CALNEventInvitationResponseNotificationInfo;
  v23 = -[CALNEventInvitationResponseNotificationInfo init](&v37, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    sourceClientIdentifier = v23->_sourceClientIdentifier;
    v23->_sourceClientIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    launchURL = v23->_launchURL;
    v23->_launchURL = (NSURL *)v26;

    v28 = objc_msgSend(v18, "copy");
    expirationDate = v23->_expirationDate;
    v23->_expirationDate = (NSDate *)v28;

    objc_storeStrong((id *)&v23->_eventInvitationNotification, a6);
    v30 = objc_msgSend(v20, "copy");
    eventRepresentationDictionary = v23->_eventRepresentationDictionary;
    v23->_eventRepresentationDictionary = (NSDictionary *)v30;

    v23->_isDelegate = a8;
    v32 = objc_msgSend(v21, "copy");
    sourceTitle = v23->_sourceTitle;
    v23->_sourceTitle = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    sourceIdentifier = v23->_sourceIdentifier;
    v23->_sourceIdentifier = (NSString *)v34;

  }
  return v23;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  -[CALNEventInvitationResponseNotificationInfo sourceClientIdentifier](self, "sourceClientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationResponseNotificationInfo launchURL](self, "launchURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationResponseNotificationInfo expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationResponseNotificationInfo eventInvitationNotification](self, "eventInvitationNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationResponseNotificationInfo eventRepresentationDictionary](self, "eventRepresentationDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CALNEventInvitationResponseNotificationInfo isDelegate](self, "isDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationResponseNotificationInfo sourceTitle](self, "sourceTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationResponseNotificationInfo sourceIdentifier](self, "sourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>(sourceClientIdentifier = %@, launchURL = %@, expirationDate = %@, eventInvitationNotification = %@, eventRepresentationDictionary = %@, isDelegate = %@, sourceTitle = %@, sourceIdentifier = %@)"), v3, self, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (EKCalendarEventInvitationNotification)eventInvitationNotification
{
  return self->_eventInvitationNotification;
}

- (NSDictionary)eventRepresentationDictionary
{
  return self->_eventRepresentationDictionary;
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
  objc_storeStrong((id *)&self->_eventRepresentationDictionary, 0);
  objc_storeStrong((id *)&self->_eventInvitationNotification, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
}

@end
