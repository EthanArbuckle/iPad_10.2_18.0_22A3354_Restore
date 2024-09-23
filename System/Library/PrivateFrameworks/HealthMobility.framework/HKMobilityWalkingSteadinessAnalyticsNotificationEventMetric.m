@implementation HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric

- (HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3
{
  HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric;
  result = -[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric init](&v5, sel_init);
  if (result)
    result->_improveHealthAndActivityAllowed = a3;
  return result;
}

+ (BOOL)requiresImproveHealthAndActivityAllowed
{
  return 1;
}

- (id)eventName
{
  return CFSTR("com.apple.health.walkingsteadiness.notifications");
}

- (id)eventPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric notificationClassification](self, "notificationClassification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("notificationClassification"));

  -[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric notificationType](self, "notificationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("notificationType"));

  -[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric age](self, "age");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMobilityAnalyticsUtilities payloadValueForAge:](HKMobilityAnalyticsUtilities, "payloadValueForAge:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("age"));

  -[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric biologicalSex](self, "biologicalSex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMobilityAnalyticsUtilities payloadStringForBiologicalSex:](HKMobilityAnalyticsUtilities, "payloadStringForBiologicalSex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sex"));

  -[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric daysSinceLastNotification](self, "daysSinceLastNotification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("daysSinceLastNotification"));

  -[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric areHealthNotificationsAuthorized](self, "areHealthNotificationsAuthorized");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("areHealthNotificationsAuthorized"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (BOOL)isImproveHealthAndActivityAllowed
{
  return self->_improveHealthAndActivityAllowed;
}

- (void)setImproveHealthAndActivityAllowed:(BOOL)a3
{
  self->_improveHealthAndActivityAllowed = a3;
}

- (NSString)notificationClassification
{
  return self->_notificationClassification;
}

- (void)setNotificationClassification:(id)a3
{
  objc_storeStrong((id *)&self->_notificationClassification, a3);
}

- (NSString)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(id)a3
{
  objc_storeStrong((id *)&self->_notificationType, a3);
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
  objc_storeStrong((id *)&self->_age, a3);
}

- (NSNumber)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(id)a3
{
  objc_storeStrong((id *)&self->_biologicalSex, a3);
}

- (NSNumber)daysSinceLastNotification
{
  return self->_daysSinceLastNotification;
}

- (void)setDaysSinceLastNotification:(id)a3
{
  objc_storeStrong((id *)&self->_daysSinceLastNotification, a3);
}

- (NSNumber)areHealthNotificationsAuthorized
{
  return self->_areHealthNotificationsAuthorized;
}

- (void)setAreHealthNotificationsAuthorized:(id)a3
{
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, 0);
  objc_storeStrong((id *)&self->_daysSinceLastNotification, 0);
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_notificationType, 0);
  objc_storeStrong((id *)&self->_notificationClassification, 0);
}

@end
