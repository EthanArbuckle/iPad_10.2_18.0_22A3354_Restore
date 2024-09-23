@implementation HMCoreAnalyticsTimedMetricEvent

- (void)start
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMCoreAnalyticsTimedMetricEvent setStartedDate:](self, "setStartedDate:", v3);

}

- (void)finish
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMCoreAnalyticsTimedMetricEvent setFinishedDate:](self, "setFinishedDate:", v3);

}

- (id)eventPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[HMCoreAnalyticsTimedMetricEvent durationData](self, "durationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)HMCoreAnalyticsTimedMetricEvent;
  -[HMCoreAnalyticsMetricEvent eventPayload](&v11, sel_eventPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  objc_msgSend(v3, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
}

- (NSNumber)duration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  -[HMCoreAnalyticsTimedMetricEvent startedDate](self, "startedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCoreAnalyticsTimedMetricEvent finishedDate](self, "finishedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(v7 * 1000.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSNumber *)v6;
}

- (id)durationData
{
  void *v2;
  HMCoreAnalyticsIntegerFieldData *v3;
  HMCoreAnalyticsIntegerFieldData *v4;

  -[HMCoreAnalyticsTimedMetricEvent duration](self, "duration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[HMCoreAnalyticsIntegerFieldData initWithName:integerValue:]([HMCoreAnalyticsIntegerFieldData alloc], "initWithName:integerValue:", CFSTR("eventDuration"), objc_msgSend(v2, "integerValue"));
  else
    v3 = -[HMCoreAnalyticsFieldData initWithName:]([HMCoreAnalyticsFieldData alloc], "initWithName:", CFSTR("eventDuration"));
  v4 = v3;

  return v4;
}

- (NSDate)startedDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStartedDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDate)finishedDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFinishedDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedDate, 0);
  objc_storeStrong((id *)&self->_startedDate, 0);
}

@end
