@implementation CALNEventInvitationNotificationInfo

- (CALNEventInvitationNotificationInfo)initWithSourceClientIdentifier:(id)a3 launchURL:(id)a4 expirationDate:(id)a5 conflictDetails:(id)a6 eventInvitationNotification:(id)a7 eventRepresentationDictionary:(id)a8 eventURI:(id)a9 isDelegate:(BOOL)a10 sourceTitle:(id)a11 sourceIdentifier:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CALNEventInvitationNotificationInfo *v24;
  uint64_t v25;
  NSString *sourceClientIdentifier;
  uint64_t v27;
  NSURL *launchURL;
  uint64_t v29;
  NSDate *expirationDate;
  uint64_t v31;
  NSDictionary *eventRepresentationDictionary;
  uint64_t v33;
  NSString *eventURI;
  uint64_t v35;
  NSString *sourceTitle;
  uint64_t v37;
  NSString *sourceIdentifier;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v42 = a3;
  v18 = a4;
  v19 = a5;
  v41 = a6;
  v40 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a11;
  v23 = a12;
  v43.receiver = self;
  v43.super_class = (Class)CALNEventInvitationNotificationInfo;
  v24 = -[CALNEventInvitationNotificationInfo init](&v43, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v42, "copy");
    sourceClientIdentifier = v24->_sourceClientIdentifier;
    v24->_sourceClientIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    launchURL = v24->_launchURL;
    v24->_launchURL = (NSURL *)v27;

    v29 = objc_msgSend(v19, "copy");
    expirationDate = v24->_expirationDate;
    v24->_expirationDate = (NSDate *)v29;

    objc_storeStrong((id *)&v24->_conflictDetails, a6);
    objc_storeStrong((id *)&v24->_eventInvitationNotification, a7);
    v31 = objc_msgSend(v20, "copy");
    eventRepresentationDictionary = v24->_eventRepresentationDictionary;
    v24->_eventRepresentationDictionary = (NSDictionary *)v31;

    v33 = objc_msgSend(v21, "copy");
    eventURI = v24->_eventURI;
    v24->_eventURI = (NSString *)v33;

    v24->_isDelegate = a10;
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
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;

  v15 = (void *)MEMORY[0x24BDD17C8];
  v14 = objc_opt_class();
  -[CALNEventInvitationNotificationInfo sourceClientIdentifier](self, "sourceClientIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationInfo launchURL](self, "launchURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationInfo expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationInfo conflictDetails](self, "conflictDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationInfo eventInvitationNotification](self, "eventInvitationNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationInfo eventURI](self, "eventURI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationInfo eventRepresentationDictionary](self, "eventRepresentationDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CALNEventInvitationNotificationInfo isDelegate](self, "isDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationInfo sourceTitle](self, "sourceTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationInfo sourceIdentifier](self, "sourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p>(sourceClientIdentifier = %@, launchURL = %@, expirationDate = %@, conflictDetails = %@, eventInvitationNotification = %@, eventURI = %@, eventRepresentationDictionary = %@, isDelegate = %@, sourceTitle = %@, sourceIdentifier = %@)"), v14, self, v16, v3, v4, v5, v6, v7, v8, v9, v10, v11);
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

- (EKConflictDetails)conflictDetails
{
  return self->_conflictDetails;
}

- (EKCalendarEventInvitationNotification)eventInvitationNotification
{
  return self->_eventInvitationNotification;
}

- (NSDictionary)eventRepresentationDictionary
{
  return self->_eventRepresentationDictionary;
}

- (NSString)eventURI
{
  return self->_eventURI;
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
  objc_storeStrong((id *)&self->_eventURI, 0);
  objc_storeStrong((id *)&self->_eventRepresentationDictionary, 0);
  objc_storeStrong((id *)&self->_eventInvitationNotification, 0);
  objc_storeStrong((id *)&self->_conflictDetails, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
}

@end
