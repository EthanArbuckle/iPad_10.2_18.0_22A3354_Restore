@implementation HAPMetricsBonjourIncorrrectStateLogEvent

- (HAPMetricsBonjourIncorrrectStateLogEvent)initWithDeviceID:(id)a3
{
  id v5;
  HAPMetricsBonjourIncorrrectStateLogEvent *v6;
  HAPMetricsBonjourIncorrrectStateLogEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPMetricsBonjourIncorrrectStateLogEvent;
  v6 = -[HMMLogEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deviceID, a3);

  return v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.bonjourIncorrectState");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("accessoryID_STRING");
  -[HAPMetricsBonjourIncorrrectStateLogEvent deviceID](self, "deviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
