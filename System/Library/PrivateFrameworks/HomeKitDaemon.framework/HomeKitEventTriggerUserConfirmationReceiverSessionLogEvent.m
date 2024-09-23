@implementation HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent

- (HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent)initWithSessionID:(id)a3
{
  id v4;
  HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent *v5;
  HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData *v6;
  HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData *analyticsData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent;
  v5 = -[HMMLogEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData);
    analyticsData = v5->_analyticsData;
    v5->_analyticsData = v6;

    -[HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData setTimestamp:](v5->_analyticsData, "setTimestamp:", 0);
    -[HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData setSessionID:](v5->_analyticsData, "setSessionID:", v4);
  }

  return v5;
}

- (HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData)analyticsData
{
  return self->_analyticsData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsData, 0);
}

@end
