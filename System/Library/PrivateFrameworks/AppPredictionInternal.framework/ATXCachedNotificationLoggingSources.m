@implementation ATXCachedNotificationLoggingSources

- (ATXCachedNotificationLoggingSources)init
{
  ATXCachedNotificationLoggingSources *v2;
  ATXStableContactRepresentationDatastore *v3;
  void *v4;
  uint64_t v5;
  ATXStableContactRepresentationDatastore *contactRepresentationDatastore;
  uint64_t v7;
  ATXUserNotificationBiomeStream *userNotificationBiomeStream;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BMSource *notificationUsageSource;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ATXCachedNotificationLoggingSources;
  v2 = -[ATXCachedNotificationLoggingSources init](&v15, sel_init);
  if (v2)
  {
    v3 = [ATXStableContactRepresentationDatastore alloc];
    v4 = (void *)objc_opt_new();
    v5 = -[ATXStableContactRepresentationDatastore initWithContactStore:](v3, "initWithContactStore:", v4);
    contactRepresentationDatastore = v2->_contactRepresentationDatastore;
    v2->_contactRepresentationDatastore = (ATXStableContactRepresentationDatastore *)v5;

    v7 = objc_opt_new();
    userNotificationBiomeStream = v2->_userNotificationBiomeStream;
    v2->_userNotificationBiomeStream = (ATXUserNotificationBiomeStream *)v7;

    BiomeLibrary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "Notification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "Usage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "source");
    v12 = objc_claimAutoreleasedReturnValue();
    notificationUsageSource = v2->_notificationUsageSource;
    v2->_notificationUsageSource = (BMSource *)v12;

  }
  return v2;
}

- (ATXUserNotificationBiomeStream)userNotificationBiomeStream
{
  return (ATXUserNotificationBiomeStream *)objc_getProperty(self, a2, 8, 1);
}

- (BMSource)notificationUsageSource
{
  return (BMSource *)objc_getProperty(self, a2, 16, 1);
}

- (ATXStableContactRepresentationDatastore)contactRepresentationDatastore
{
  return (ATXStableContactRepresentationDatastore *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactRepresentationDatastore, 0);
  objc_storeStrong((id *)&self->_notificationUsageSource, 0);
  objc_storeStrong((id *)&self->_userNotificationBiomeStream, 0);
}

@end
