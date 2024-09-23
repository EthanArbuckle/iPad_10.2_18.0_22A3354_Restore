@implementation HKMedicationNotificationMetric

- (HKMedicationNotificationMetric)initWithType:(int64_t)a3 areHealthNotificationsAuthorized:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  HKMedicationNotificationMetric *v11;
  HKMedicationNotificationMetric *v12;
  HKMedicationAnalyticsGenericFieldsProvider *v13;
  HKMedicationAnalyticsGenericFieldsProvider *genericDataProvider;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationNotificationMetric;
  v11 = -[HKMedicationNotificationMetric init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_areHealthNotificationsAuthorized, a4);
    v12->_interactionType = 0;
    v13 = -[HKMedicationAnalyticsGenericFieldsProvider initWithDataSource:]([HKMedicationAnalyticsGenericFieldsProvider alloc], "initWithDataSource:", v10);
    genericDataProvider = v12->_genericDataProvider;
    v12->_genericDataProvider = v13;

  }
  return v12;
}

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.HealthRecords.MedsReminderNotifications");
}

- (id)typeValue
{
  if (self->_type == 1)
    return CFSTR("NotificationSent");
  else
    return CFSTR("NotificationInteractedWith");
}

- (id)interactionTypeValue
{
  unint64_t interactionType;
  void *v6;

  interactionType = self->_interactionType;
  if (interactionType < 7)
    return (id)qword_1E6CD5D08[interactionType];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationNotificationMetric.m"), 63, CFSTR("Unexpected Interaction Type %ld"), self->_interactionType);

  return 0;
}

- (NSDictionary)eventPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKMedicationAnalyticsGenericFieldsProvider *genericDataProvider;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HKMedicationNotificationMetric typeValue](self, "typeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  -[HKMedicationNotificationMetric areHealthNotificationsAuthorized](self, "areHealthNotificationsAuthorized");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HKMedicationNotificationMetric areHealthNotificationsAuthorized](self, "areHealthNotificationsAuthorized");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("areHealthNotificationsAuthorized"));

  }
  -[HKMedicationAnalyticsGenericFieldsProvider biologicalSex](self->_genericDataProvider, "biologicalSex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationAnalyticsGenericFieldsProvider activePairedWatchProductType](self->_genericDataProvider, "activePairedWatchProductType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("biologicalSex"));
  genericDataProvider = self->_genericDataProvider;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationAnalyticsGenericFieldsProvider bucketedUserAgeForCurrentDate:](genericDataProvider, "bucketedUserAgeForCurrentDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("age"));

  if (v8)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("activePairedWatchProductType"));
  -[HKMedicationNotificationMetric interactionTypeValue](self, "interactionTypeValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HKMedicationNotificationMetric interactionTypeValue](self, "interactionTypeValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("action"));

  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKMedicationNotificationMetric eventPayload](self, "eventPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p payload: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setEventPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)type
{
  return self->_type;
}

- (NSNumber)areHealthNotificationsAuthorized
{
  return self->_areHealthNotificationsAuthorized;
}

- (int64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(int64_t)a3
{
  self->_interactionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPayload, 0);
  objc_storeStrong((id *)&self->_genericDataProvider, 0);
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, 0);
}

@end
