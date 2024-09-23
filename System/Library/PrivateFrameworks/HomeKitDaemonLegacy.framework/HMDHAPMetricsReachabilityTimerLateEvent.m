@implementation HMDHAPMetricsReachabilityTimerLateEvent

- (HMDHAPMetricsReachabilityTimerLateEvent)initWithAccessory:(id)a3 actualDuration:(id)a4 expectedDuration:(id)a5
{
  id v9;
  id v10;
  HMDHAPMetricsReachabilityTimerLateEvent *v11;
  HMDHAPMetricsReachabilityTimerLateEvent *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDHAPMetricsReachabilityTimerLateEvent;
  v11 = -[HMDHAPMetrics initWithHMDAccessory:](&v14, sel_initWithHMDAccessory_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actualDuration, a4);
    objc_storeStrong((id *)&v12->_expectedDuration, a5);
  }

  return v12;
}

- (id)coreAnalyticsEventName
{
  return CFSTR("com.apple.HomeKit.daemon.reachability.timerlate");
}

- (id)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetricsReachabilityTimerLateEvent actualDuration](self, "actualDuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDHAPMetricsReachabilityTimerLateEvent actualDuration](self, "actualDuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  }
  -[HMDHAPMetricsReachabilityTimerLateEvent expectedDuration](self, "expectedDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("expectedDuration"));

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

- (NSNumber)actualDuration
{
  return self->_actualDuration;
}

- (NSNumber)expectedDuration
{
  return self->_expectedDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedDuration, 0);
  objc_storeStrong((id *)&self->_actualDuration, 0);
}

@end
