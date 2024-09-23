@implementation BCSMegashardFetchMetric

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.businesschatd.megashardPrefetch");
}

- (NSDictionary)coreAnalyticsPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BCSMegashardFetchMetric type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("reason");
  NSStringFromBCSFetchReason(-[BCSMegashardFetchMetric reason](self, "reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BCSMegashardFetchMetric errorCode](self, "errorCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("isUsingCellular");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "isUsingExpensiveNetwork"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("timeSinceLastSuccess");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BCSMegashardFetchMetric hoursSinceLastSuccessfulFetch](self, "hoursSinceLastSuccessfulFetch"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

+ (id)metricForMegashardType:(int64_t)a3 postProcessingMetricHandlers:(id)a4
{
  id v5;
  BCSMegashardFetchMetric *v6;
  void *v7;
  id *v8;

  v5 = a4;
  v6 = [BCSMegashardFetchMetric alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)&v6->super.super.isa, (void *)9, v7, v5);

  return v8;
}

- (int64_t)type
{
  if (self)
    self = (BCSMegashardFetchMetric *)self->super._context;
  return -[BCSMegashardFetchMetric integerValue](self, "integerValue");
}

- (unint64_t)reason
{
  return self->reason;
}

- (void)setReason:(unint64_t)a3
{
  self->reason = a3;
}

- (int64_t)hoursSinceLastSuccessfulFetch
{
  return self->hoursSinceLastSuccessfulFetch;
}

- (void)setHoursSinceLastSuccessfulFetch:(int64_t)a3
{
  self->hoursSinceLastSuccessfulFetch = a3;
}

- (int64_t)errorCode
{
  return self->errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->errorCode = a3;
}

@end
