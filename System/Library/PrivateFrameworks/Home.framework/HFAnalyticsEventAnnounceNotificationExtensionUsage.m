@implementation HFAnalyticsEventAnnounceNotificationExtensionUsage

- (HFAnalyticsEventAnnounceNotificationExtensionUsage)initWithData:(id)a3
{
  void *v4;
  HFAnalyticsEventAnnounceNotificationExtensionUsage *v5;
  HFAnalyticsEventAnnounceNotificationExtensionUsage *v6;
  objc_super v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("notificationExtensionUsageDuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    NSLog(CFSTR("HFAnalyticsAnnounceNotificationExtensionUsageDurationKey is nil"));
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEventAnnounceNotificationExtensionUsage;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v8, sel_initWithEventType_, 19);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_notificationUsageDuration, v4);

  return v6;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEventAnnounceNotificationExtensionUsage;
  -[HFAnalyticsEvent payload](&v7, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsEventAnnounceNotificationExtensionUsage notificationUsageDuration](self, "notificationUsageDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("notificationExtensionUsageDuration"));

  return v4;
}

- (NSNumber)notificationUsageDuration
{
  return self->_notificationUsageDuration;
}

- (void)setNotificationUsageDuration:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUsageDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationUsageDuration, 0);
}

@end
