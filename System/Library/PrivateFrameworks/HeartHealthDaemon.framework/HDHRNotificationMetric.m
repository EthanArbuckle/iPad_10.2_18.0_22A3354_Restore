@implementation HDHRNotificationMetric

- (HDHRNotificationMetric)initWithNotificationType:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4
{
  id v6;
  HDHRNotificationMetric *v7;
  uint64_t v8;
  NSString *notificationType;
  NSNumber *doNotDisturbOn;
  NSNumber *notificationThreshold;
  NSString *cardioFitnessNotificationType;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDHRNotificationMetric;
  v7 = -[HDHRNotificationMetric init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    notificationType = v7->_notificationType;
    v7->_notificationType = (NSString *)v8;

    doNotDisturbOn = v7->_doNotDisturbOn;
    v7->_doNotDisturbOn = (NSNumber *)&unk_1E87FED68;

    notificationThreshold = v7->_notificationThreshold;
    v7->_notificationThreshold = (NSNumber *)&unk_1E87FED68;

    cardioFitnessNotificationType = v7->_cardioFitnessNotificationType;
    v7->_cardioFitnessNotificationType = (NSString *)CFSTR("-1");

    v7->_irregularRhythmNotificationsAlgorithmVersion = -1;
    v7->_areHealthNotificationsAuthorized = a4;
  }

  return v7;
}

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.heart.notifications");
}

- (id)eventPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_notificationType, CFSTR("notificationType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_doNotDisturbOn, CFSTR("isDoNotDisturbOn"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_notificationThreshold, CFSTR("notificationThreshold"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cardioFitnessNotificationType, CFSTR("cardioFitnessNotificationType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_irregularRhythmNotificationsAlgorithmVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("versionIRN"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_areHealthNotificationsAuthorized);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("areHealthNotificationsAuthorized"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (void)submit
{
  void *v3;
  id v4;

  if (HKImproveHealthAndActivityAnalyticsAllowed())
  {
    objc_msgSend((id)objc_opt_class(), "eventName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[HDHRNotificationMetric eventPayload](self, "eventPayload");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

- (NSString)notificationType
{
  return self->_notificationType;
}

- (NSNumber)isDoNotDisturbOn
{
  return self->_doNotDisturbOn;
}

- (void)setDoNotDisturbOn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)notificationThreshold
{
  return self->_notificationThreshold;
}

- (void)setNotificationThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)cardioFitnessNotificationType
{
  return self->_cardioFitnessNotificationType;
}

- (void)setCardioFitnessNotificationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)irregularRhythmNotificationsAlgorithmVersion
{
  return self->_irregularRhythmNotificationsAlgorithmVersion;
}

- (void)setIrregularRhythmNotificationsAlgorithmVersion:(int64_t)a3
{
  self->_irregularRhythmNotificationsAlgorithmVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardioFitnessNotificationType, 0);
  objc_storeStrong((id *)&self->_notificationThreshold, 0);
  objc_storeStrong((id *)&self->_doNotDisturbOn, 0);
  objc_storeStrong((id *)&self->_notificationType, 0);
}

@end
