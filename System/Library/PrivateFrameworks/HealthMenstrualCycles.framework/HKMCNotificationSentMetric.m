@implementation HKMCNotificationSentMetric

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.menstrual-cycles.NotificationSent");
}

- (HKMCNotificationSentMetric)initWithCategory:(id)a3 areHealthNotificationsAuthorized:(id)a4
{
  id v7;
  id v8;
  HKMCNotificationSentMetric *v9;
  HKMCNotificationSentMetric *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMCNotificationSentMetric;
  v9 = -[HKMCNotificationSentMetric init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    objc_storeStrong((id *)&v10->_areHealthNotificationsAuthorized, a4);
  }

  return v10;
}

- (NSDictionary)eventPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HKMCNotificationSentMetric category](self, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("category"));

  -[HKMCNotificationSentMetric areHealthNotificationsAuthorized](self, "areHealthNotificationsAuthorized");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("areHealthNotificationsAuthorized"));

  -[HKMCNotificationSentMetric numberOfDaysShiftedForFertileWindow](self, "numberOfDaysShiftedForFertileWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("numberOfDaysShiftedForFertileWindow"));

  -[HKMCNotificationSentMetric numberOfDaysOffsetFromFertileWindowEnd](self, "numberOfDaysOffsetFromFertileWindowEnd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numberOfDaysOffsetFromFertileWindowEnd"));

  -[HKMCNotificationSentMetric numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification](self, "numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification"));

  -[HKMCNotificationSentMetric internalLiveOnCycleFactorOverrideEnabled](self, "internalLiveOnCycleFactorOverrideEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("internalLiveOnCycleFactorOverride"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v10;
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
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HKMCNotificationSentMetric category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCNotificationSentMetric areHealthNotificationsAuthorized](self, "areHealthNotificationsAuthorized");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCNotificationSentMetric numberOfDaysShiftedForFertileWindow](self, "numberOfDaysShiftedForFertileWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCNotificationSentMetric numberOfDaysOffsetFromFertileWindowEnd](self, "numberOfDaysOffsetFromFertileWindowEnd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCNotificationSentMetric numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification](self, "numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCNotificationSentMetric internalLiveOnCycleFactorOverrideEnabled](self, "internalLiveOnCycleFactorOverrideEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p category:%@ areHealthNotificationsAuthorized:%@ numberOfDaysShiftedForFertileWindow:%@ numberOfDaysOffsetFromFertileWindowEnd:%@ numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:%@ internalLiveOnCycleFactorOverrideEnabled:%@>"), v4, self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setEventPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (NSNumber)areHealthNotificationsAuthorized
{
  return self->_areHealthNotificationsAuthorized;
}

- (void)setAreHealthNotificationsAuthorized:(id)a3
{
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, a3);
}

- (NSNumber)numberOfDaysShiftedForFertileWindow
{
  return self->_numberOfDaysShiftedForFertileWindow;
}

- (void)setNumberOfDaysShiftedForFertileWindow:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfDaysShiftedForFertileWindow, a3);
}

- (NSNumber)numberOfDaysOffsetFromFertileWindowEnd
{
  return self->_numberOfDaysOffsetFromFertileWindowEnd;
}

- (void)setNumberOfDaysOffsetFromFertileWindowEnd:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfDaysOffsetFromFertileWindowEnd, a3);
}

- (NSNumber)numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification
{
  return self->_numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification;
}

- (void)setNumberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification, a3);
}

- (NSNumber)internalLiveOnCycleFactorOverrideEnabled
{
  return self->_internalLiveOnCycleFactorOverrideEnabled;
}

- (void)setInternalLiveOnCycleFactorOverrideEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_internalLiveOnCycleFactorOverrideEnabled, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalLiveOnCycleFactorOverrideEnabled, 0);
  objc_storeStrong((id *)&self->_numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification, 0);
  objc_storeStrong((id *)&self->_numberOfDaysOffsetFromFertileWindowEnd, 0);
  objc_storeStrong((id *)&self->_numberOfDaysShiftedForFertileWindow, 0);
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end
