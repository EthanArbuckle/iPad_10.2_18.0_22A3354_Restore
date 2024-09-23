@implementation HMDAggregateXPCMessageCountersLogEvent

- (NSString)peerInformation
{
  return self->_peerInformation;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_peerInformation, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsEventName, 0);
}

- (HMDAggregateXPCMessageCountersLogEvent)initWithEventName:(id)a3 peerInformation:(id)a4 messageName:(id)a5 primaryResidentDuration:(double)a6 count:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDAggregateXPCMessageCountersLogEvent *v17;
  HMDAggregateXPCMessageCountersLogEvent *v18;
  uint64_t v19;
  NSString *peerInformation;
  uint64_t v21;
  NSString *messageName;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HMDAggregateXPCMessageCountersLogEvent;
  v17 = -[HMMLogEvent init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_coreAnalyticsEventName, a3);
    v19 = objc_msgSend(v14, "copy");
    peerInformation = v18->_peerInformation;
    v18->_peerInformation = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    messageName = v18->_messageName;
    v18->_messageName = (NSString *)v21;

    v18->_primaryResidentDuration = a6;
    objc_storeStrong((id *)&v18->_count, a7);
  }

  return v18;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAggregateXPCMessageCountersLogEvent peerInformation](self, "peerInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("appIdentifier"));

  -[HMDAggregateXPCMessageCountersLogEvent messageName](self, "messageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("messageName"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[HMDAggregateXPCMessageCountersLogEvent primaryResidentDuration](self, "primaryResidentDuration");
  objc_msgSend(v6, "numberWithInteger:", (uint64_t)((v7 + 59.0) / 60.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("primaryResidentDurationMinutes"));

  -[HMDAggregateXPCMessageCountersLogEvent count](self, "count");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("counter"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v10;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)coreAnalyticsEventName
{
  return self->_coreAnalyticsEventName;
}

- (double)primaryResidentDuration
{
  return self->_primaryResidentDuration;
}

- (NSNumber)count
{
  return self->_count;
}

+ (id)xpcAcceptedCountersLogEventWithPeerInformation:(id)a3 messageName:(id)a4 primaryResidentDuration:(double)a5 count:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventName:peerInformation:messageName:primaryResidentDuration:count:", CFSTR("com.apple.HomeKit.xpc.requests.accepted"), v12, v11, v10, a5);

  return v13;
}

+ (id)xpcSentCountersLogEventWithPeerInformation:(id)a3 messageName:(id)a4 primaryResidentDuration:(double)a5 count:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventName:peerInformation:messageName:primaryResidentDuration:count:", CFSTR("com.apple.HomeKit.xpc.notifications.sent"), v12, v11, v10, a5);

  return v13;
}

@end
