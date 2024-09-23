@implementation HMDHAPMetricsStateNumberChangeEvent

- (HMDHAPMetricsStateNumberChangeEvent)initWithAccessory:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDHAPMetricsStateNumberChangeEvent;
  return -[HMDHAPMetrics initWithHMDAccessory:](&v4, sel_initWithHMDAccessory_, a3);
}

- (id)coreAnalyticsEventName
{
  return CFSTR("com.apple.HomeKit.daemon.reachability.state.number.change");
}

- (id)coreAnalyticsEventDictionary
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
