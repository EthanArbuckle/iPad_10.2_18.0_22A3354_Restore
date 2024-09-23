@implementation HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric

- (HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3
{
  HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric;
  result = -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric init](&v5, sel_init);
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
  return CFSTR("com.apple.health.walkingsteadiness.notification.interaction");
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric notificationClassification](self, "notificationClassification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("notificationClassification"));

  -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric notificationType](self, "notificationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("notificationType"));

  -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric age](self, "age");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMobilityAnalyticsUtilities payloadValueForAge:](HKMobilityAnalyticsUtilities, "payloadValueForAge:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("age"));

  -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric biologicalSex](self, "biologicalSex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMobilityAnalyticsUtilities payloadStringForBiologicalSex:](HKMobilityAnalyticsUtilities, "payloadStringForBiologicalSex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sex"));

  -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric notificationInteractionType](self, "notificationInteractionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("notificationInteractionType"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)notificationInteractionType
{
  return self->_notificationInteractionType;
}

- (void)setNotificationInteractionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_notificationInteractionType, 0);
  objc_storeStrong((id *)&self->_notificationType, 0);
  objc_storeStrong((id *)&self->_notificationClassification, 0);
}

@end
