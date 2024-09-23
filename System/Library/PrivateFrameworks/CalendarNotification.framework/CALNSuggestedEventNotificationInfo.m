@implementation CALNSuggestedEventNotificationInfo

- (CALNSuggestedEventNotificationInfo)initWithSourceClientIdentifier:(id)a3 launchURL:(id)a4 expirationDate:(id)a5 suggestionNotification:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CALNSuggestedEventNotificationInfo *v14;
  uint64_t v15;
  NSString *sourceClientIdentifier;
  uint64_t v17;
  NSURL *launchURL;
  uint64_t v19;
  NSDate *expirationDate;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CALNSuggestedEventNotificationInfo;
  v14 = -[CALNSuggestedEventNotificationInfo init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    sourceClientIdentifier = v14->_sourceClientIdentifier;
    v14->_sourceClientIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    launchURL = v14->_launchURL;
    v14->_launchURL = (NSURL *)v17;

    v19 = objc_msgSend(v12, "copy");
    expirationDate = v14->_expirationDate;
    v14->_expirationDate = (NSDate *)v19;

    objc_storeStrong((id *)&v14->_suggestionNotification, a6);
  }

  return v14;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CALNSuggestedEventNotificationInfo sourceClientIdentifier](self, "sourceClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNSuggestedEventNotificationInfo suggestionNotification](self, "suggestionNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNSuggestedEventNotificationInfo expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNSuggestedEventNotificationInfo launchURL](self, "launchURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(sourceClientIdentifier = %@, suggestionNotification = %@, expirationDate = %@, launchURL = %@)"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

- (EKCalendarSuggestionNotification)suggestionNotification
{
  return self->_suggestionNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionNotification, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
}

@end
