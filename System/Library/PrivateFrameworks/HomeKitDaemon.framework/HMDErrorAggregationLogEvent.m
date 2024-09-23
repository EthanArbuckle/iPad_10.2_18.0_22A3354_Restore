@implementation HMDErrorAggregationLogEvent

- (HMDErrorAggregationLogEvent)initWithEventGroupName:(id)a3 errorString:(id)a4 errorCount:(id)a5 eventCount:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDErrorAggregationLogEvent *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *coreAnalyticsSerializedEvent;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDErrorAggregationLogEvent;
  v14 = -[HMMLogEvent init](&v20, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("errorString"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("eventGroupName"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("errorCount"));
    if (v13)
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("eventCount"));
      if ((int)objc_msgSend(v13, "intValue") >= 1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", ((int)(100 * (objc_msgSend(v13, "intValue") - objc_msgSend(v12, "intValue")))/ (int)objc_msgSend(v13, "intValue")));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("successRate"));

      }
    }
    v17 = objc_msgSend(v15, "copy");
    coreAnalyticsSerializedEvent = v14->_coreAnalyticsSerializedEvent;
    v14->_coreAnalyticsSerializedEvent = (NSDictionary *)v17;

  }
  return v14;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.dailyErrorAggregation");
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsSerializedEvent
{
  return self->_coreAnalyticsSerializedEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreAnalyticsSerializedEvent, 0);
}

+ (id)createSummaryEventForRequestGroup:(id)a3 totalErrorCount:(id)a4 totalEventCount:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDErrorAggregationLogEvent *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDErrorAggregationLogEvent initWithEventGroupName:errorString:errorCount:eventCount:]([HMDErrorAggregationLogEvent alloc], "initWithEventGroupName:errorString:errorCount:eventCount:", v9, CFSTR("Summary"), v8, v7);

  return v10;
}

+ (id)createErrorEventForRequestGroup:(id)a3 errorString:(id)a4 errorCount:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDErrorAggregationLogEvent *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDErrorAggregationLogEvent initWithEventGroupName:errorString:errorCount:eventCount:]([HMDErrorAggregationLogEvent alloc], "initWithEventGroupName:errorString:errorCount:eventCount:", v9, v8, v7, 0);

  return v10;
}

@end
