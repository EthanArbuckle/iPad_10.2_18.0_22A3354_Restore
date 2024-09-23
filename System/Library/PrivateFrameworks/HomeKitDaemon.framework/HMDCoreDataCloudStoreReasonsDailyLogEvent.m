@implementation HMDCoreDataCloudStoreReasonsDailyLogEvent

- (HMDCoreDataCloudStoreReasonsDailyLogEvent)initWithReason:(id)a3 reasonCount:(unint64_t)a4
{
  id v7;
  HMDCoreDataCloudStoreReasonsDailyLogEvent *v8;
  HMDCoreDataCloudStoreReasonsDailyLogEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCoreDataCloudStoreReasonsDailyLogEvent;
  v8 = -[HMMLogEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_reason, a3);
    v9->_reasonCount = a4;
  }

  return v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homed.daemon.cloudStoreReasonsDailyTotal");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("changeReason");
  -[HMDCoreDataCloudStoreReasonsDailyLogEvent reason](self, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("reasonCount");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDCoreDataCloudStoreReasonsDailyLogEvent reasonCount](self, "reasonCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)reasonCount
{
  return self->_reasonCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
