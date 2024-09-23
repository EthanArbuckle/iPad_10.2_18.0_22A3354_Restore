@implementation HMDAggregateRemoteMessageCountersLogEvent

- (HMDAggregateRemoteMessageCountersLogEvent)initWithMessageName:(id)a3 deviceType:(id)a4 transportType:(id)a5 direction:(id)a6 primaryResidentDuration:(double)a7 count:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMDAggregateRemoteMessageCountersLogEvent *v19;
  HMDAggregateRemoteMessageCountersLogEvent *v20;
  id v22;
  objc_super v23;

  v22 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDAggregateRemoteMessageCountersLogEvent;
  v19 = -[HMMLogEvent init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_messageName, a3);
    objc_storeStrong((id *)&v20->_deviceType, a4);
    objc_storeStrong((id *)&v20->_transportType, a5);
    objc_storeStrong((id *)&v20->_direction, a6);
    v20->_primaryResidentDuration = a7;
    objc_storeStrong((id *)&v20->_count, a8);
  }

  return v20;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.periodicAggregationReport.remote-message");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAggregateRemoteMessageCountersLogEvent deviceType](self, "deviceType");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E89C3E38;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("destinationDeviceType"));

  -[HMDAggregateRemoteMessageCountersLogEvent messageName](self, "messageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("remoteMessageName"));

  -[HMDAggregateRemoteMessageCountersLogEvent transportType](self, "transportType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("transportType"));

  -[HMDAggregateRemoteMessageCountersLogEvent direction](self, "direction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("remoteMessageDirection"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAggregateRemoteMessageCountersLogEvent primaryResidentDuration](self, "primaryResidentDuration");
  objc_msgSend(v10, "numberWithInteger:", llround((v11 + 59.0) / 60.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("primaryResidentDurationMinutes"));

  -[HMDAggregateRemoteMessageCountersLogEvent count](self, "count");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("aggregateCount"));

  v14 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v14;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)transportType
{
  return self->_transportType;
}

- (NSString)direction
{
  return self->_direction;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (double)primaryResidentDuration
{
  return self->_primaryResidentDuration;
}

- (NSNumber)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_direction, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
}

+ (id)aggregateRemoteCountersLogEventWithMessageName:(id)a3 deviceType:(id)a4 transportType:(id)a5 direction:(id)a6 primaryResidentDuration:(double)a7 count:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageName:deviceType:transportType:direction:primaryResidentDuration:count:", v18, v17, v16, v15, v14, a7);

  return v19;
}

@end
