@implementation HomeKitEventTriggerExecutionSessionLogEvent

- (HomeKitEventTriggerExecutionSessionLogEvent)initWithStartTime:(double)a3 sessionID:(id)a4
{
  id v6;
  HomeKitEventTriggerExecutionSessionLogEvent *v7;
  HMDAnalyticsEventTriggerExecutionSessionData *v8;
  HMDAnalyticsEventTriggerExecutionSessionData *analyticsData;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HomeKitEventTriggerExecutionSessionLogEvent;
  v7 = -[HMMLogEvent initWithStartTime:](&v13, sel_initWithStartTime_, a3);
  if (v7)
  {
    v8 = objc_alloc_init(HMDAnalyticsEventTriggerExecutionSessionData);
    analyticsData = v7->_analyticsData;
    v7->_analyticsData = v8;

    -[HomeKitEventTriggerExecutionSessionLogEvent analyticsData](v7, "analyticsData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimestamp:", 0);

    -[HomeKitEventTriggerExecutionSessionLogEvent analyticsData](v7, "analyticsData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSessionID:", v6);

  }
  return v7;
}

- (HMDAnalyticsEventTriggerExecutionSessionData)analyticsData
{
  return self->_analyticsData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsData, 0);
}

@end
