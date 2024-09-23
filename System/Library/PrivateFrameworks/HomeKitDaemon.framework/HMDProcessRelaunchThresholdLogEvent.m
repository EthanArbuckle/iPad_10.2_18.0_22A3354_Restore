@implementation HMDProcessRelaunchThresholdLogEvent

- (HMDProcessRelaunchThresholdLogEvent)initWithTimeSincePreviousLaunch:(id)a3
{
  id v5;
  HMDProcessRelaunchThresholdLogEvent *v6;
  HMDProcessRelaunchThresholdLogEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDProcessRelaunchThresholdLogEvent;
  v6 = -[HMMLogEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_timeIntervalSincePreviousProcessLaunch, a3);

  return v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.processLaunch.relaunchThresholdLogEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("timeIntervalSincePreviousProcessLaunch");
  +[HMDLogEventHistograms latencyHistogram](HMDLogEventHistograms, "latencyHistogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDProcessRelaunchThresholdLogEvent timeIntervalSincePreviousProcessLaunch](self, "timeIntervalSincePreviousProcessLaunch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intervalIndexForValue:", 1000 * objc_msgSend(v4, "unsignedIntegerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSNumber)timeIntervalSincePreviousProcessLaunch
{
  return self->_timeIntervalSincePreviousProcessLaunch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeIntervalSincePreviousProcessLaunch, 0);
}

@end
