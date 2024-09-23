@implementation NSSExternalAnalyticsRequestMetadata

- (NSSExternalAnalyticsRequestMetadata)initWithSession:(id)a3 eventIdentifier:(id)a4 externalAnalyticsIdentifier:(id)a5 contentViewedIdentifier:(id)a6 publisherIdentifier:(id)a7 eventType:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSSExternalAnalyticsRequestMetadata *v19;
  uint64_t v20;
  NTPBSession *session;
  uint64_t v22;
  NSString *eventIdentifier;
  uint64_t v24;
  NSString *externalAnalyticsIdentifier;
  uint64_t v26;
  NSString *contentViewedIdentifier;
  uint64_t v28;
  NSString *publisherIdentifier;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)NSSExternalAnalyticsRequestMetadata;
  v19 = -[NSSExternalAnalyticsRequestMetadata init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    session = v19->_session;
    v19->_session = (NTPBSession *)v20;

    v22 = objc_msgSend(v15, "copy");
    eventIdentifier = v19->_eventIdentifier;
    v19->_eventIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    externalAnalyticsIdentifier = v19->_externalAnalyticsIdentifier;
    v19->_externalAnalyticsIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    contentViewedIdentifier = v19->_contentViewedIdentifier;
    v19->_contentViewedIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    publisherIdentifier = v19->_publisherIdentifier;
    v19->_publisherIdentifier = (NSString *)v28;

    v19->_eventType = a8;
  }

  return v19;
}

- (NSSExternalAnalyticsRequestMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSExternalAnalyticsRequestMetadata *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("eventIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("externalAnalyticsIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("contentViewedIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("publisherIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("eventType"));

  v11 = -[NSSExternalAnalyticsRequestMetadata initWithSession:eventIdentifier:externalAnalyticsIdentifier:contentViewedIdentifier:publisherIdentifier:eventType:](self, "initWithSession:eventIdentifier:externalAnalyticsIdentifier:contentViewedIdentifier:publisherIdentifier:eventType:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NSSExternalAnalyticsRequestMetadata session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("session"));

  -[NSSExternalAnalyticsRequestMetadata eventIdentifier](self, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("eventIdentifier"));

  -[NSSExternalAnalyticsRequestMetadata externalAnalyticsIdentifier](self, "externalAnalyticsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("externalAnalyticsIdentifier"));

  -[NSSExternalAnalyticsRequestMetadata contentViewedIdentifier](self, "contentViewedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("contentViewedIdentifier"));

  -[NSSExternalAnalyticsRequestMetadata publisherIdentifier](self, "publisherIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("publisherIdentifier"));

  objc_msgSend(v9, "encodeInt32:forKey:", -[NSSExternalAnalyticsRequestMetadata eventType](self, "eventType"), CFSTR("eventType"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSString)externalAnalyticsIdentifier
{
  return self->_externalAnalyticsIdentifier;
}

- (NTPBSession)session
{
  return self->_session;
}

- (NSString)contentViewedIdentifier
{
  return self->_contentViewedIdentifier;
}

- (NSString)publisherIdentifier
{
  return self->_publisherIdentifier;
}

- (int)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherIdentifier, 0);
  objc_storeStrong((id *)&self->_contentViewedIdentifier, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_externalAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
