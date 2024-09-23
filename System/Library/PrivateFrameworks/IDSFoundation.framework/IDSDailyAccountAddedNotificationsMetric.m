@implementation IDSDailyAccountAddedNotificationsMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSDailyAccountNotificationPosted");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSNumber *dailyNotificationsPosted;
  NSNumber *dailyDuplicateNotificationsPosted;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  dailyNotificationsPosted = self->_dailyNotificationsPosted;
  if (dailyNotificationsPosted)
    CFDictionarySetValue(v3, CFSTR("daily_notifications_posted"), dailyNotificationsPosted);
  dailyDuplicateNotificationsPosted = self->_dailyDuplicateNotificationsPosted;
  if (dailyDuplicateNotificationsPosted)
    CFDictionarySetValue(v4, CFSTR("daily_duplicate_notifications_posted"), dailyDuplicateNotificationsPosted);
  return (NSDictionary *)v4;
}

- (IDSDailyAccountAddedNotificationsMetric)initWithNotificationsPostedToday:(id)a3 duplicateNotificationPostedToday:(id)a4
{
  id v7;
  id v8;
  IDSDailyAccountAddedNotificationsMetric *v9;
  IDSDailyAccountAddedNotificationsMetric *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSDailyAccountAddedNotificationsMetric;
  v9 = -[IDSDailyAccountAddedNotificationsMetric init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dailyNotificationsPosted, a3);
    objc_storeStrong((id *)&v10->_dailyDuplicateNotificationsPosted, a4);
  }

  return v10;
}

- (NSNumber)dailyNotificationsPosted
{
  return self->_dailyNotificationsPosted;
}

- (NSNumber)dailyDuplicateNotificationsPosted
{
  return self->_dailyDuplicateNotificationsPosted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyDuplicateNotificationsPosted, 0);
  objc_storeStrong((id *)&self->_dailyNotificationsPosted, 0);
}

@end
