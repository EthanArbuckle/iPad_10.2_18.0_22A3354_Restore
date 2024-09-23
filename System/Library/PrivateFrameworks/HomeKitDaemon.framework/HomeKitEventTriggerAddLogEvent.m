@implementation HomeKitEventTriggerAddLogEvent

- (HomeKitEventTriggerAddLogEvent)initWithHomeUUID:(id)a3
{
  HomeKitEventTriggerAddLogEvent *v3;
  HMDAnalyticsAddEventTriggerData *v4;
  HMDAnalyticsAddEventTriggerData *analyticsData;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HomeKitEventTriggerAddLogEvent;
  v3 = -[HMMHomeLogEvent initWithHomeUUID:](&v7, sel_initWithHomeUUID_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(HMDAnalyticsAddEventTriggerData);
    analyticsData = v3->_analyticsData;
    v3->_analyticsData = v4;

    -[HMDAnalyticsAddEventTriggerData setTimestamp:](v3->_analyticsData, "setTimestamp:", 0);
  }
  return v3;
}

- (HMDAnalyticsAddEventTriggerData)analyticsData
{
  return self->_analyticsData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsData, 0);
}

@end
