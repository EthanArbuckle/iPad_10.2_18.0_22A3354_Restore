@implementation HomeKitEventTriggerUpdateLogEvent

- (HomeKitEventTriggerUpdateLogEvent)init
{
  HomeKitEventTriggerUpdateLogEvent *v2;
  HMDAnalyticsUpdateEventTriggerData *v3;
  HMDAnalyticsUpdateEventTriggerData *analyticsData;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HomeKitEventTriggerUpdateLogEvent;
  v2 = -[HMMLogEvent init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HMDAnalyticsUpdateEventTriggerData);
    analyticsData = v2->_analyticsData;
    v2->_analyticsData = v3;

    -[HMDAnalyticsUpdateEventTriggerData setTimestamp:](v2->_analyticsData, "setTimestamp:", 0);
  }
  return v2;
}

- (HMDAnalyticsUpdateEventTriggerData)analyticsData
{
  return self->_analyticsData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsData, 0);
}

@end
