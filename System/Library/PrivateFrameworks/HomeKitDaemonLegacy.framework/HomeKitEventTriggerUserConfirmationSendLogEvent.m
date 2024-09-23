@implementation HomeKitEventTriggerUserConfirmationSendLogEvent

- (HomeKitEventTriggerUserConfirmationSendLogEvent)initWithSessionID:(id)a3
{
  id v4;
  HomeKitEventTriggerUserConfirmationSendLogEvent *v5;
  HMDAnalyticsEventTriggerUserConfirmationSendData *v6;
  HMDAnalyticsEventTriggerUserConfirmationSendData *analyticsData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HomeKitEventTriggerUserConfirmationSendLogEvent;
  v5 = -[HMMLogEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(HMDAnalyticsEventTriggerUserConfirmationSendData);
    analyticsData = v5->_analyticsData;
    v5->_analyticsData = v6;

    -[HMDAnalyticsEventTriggerUserConfirmationSendData setTimestamp:](v5->_analyticsData, "setTimestamp:", 0);
    -[HMDAnalyticsEventTriggerUserConfirmationSendData setSessionID:](v5->_analyticsData, "setSessionID:", v4);
  }

  return v5;
}

- (HMDAnalyticsEventTriggerUserConfirmationSendData)analyticsData
{
  return self->_analyticsData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsData, 0);
}

@end
