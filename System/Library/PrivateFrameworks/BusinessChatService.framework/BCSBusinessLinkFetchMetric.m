@implementation BCSBusinessLinkFetchMetric

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.businesschatd.linkURLFetch");
}

- (NSDictionary)coreAnalyticsPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("choppingEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[BCSBusinessLinkFetchMetric isChoppingEnabled](self, "isChoppingEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("successfulChop");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BCSBusinessLinkFetchMetric successfulChop](self, "successfulChop"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("duration");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[BCSBusinessLinkFetchMetric timingMeasurement](self, "timingMeasurement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "duration");
  objc_msgSend(v5, "numberWithInteger:", (uint64_t)(v7 * 1000.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  v12[3] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BCSBusinessLinkFetchMetric errorCode](self, "errorCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

+ (id)metricWithPostProcessingMetricHandlers:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)[BCSBusinessLinkFetchMetric alloc], (void *)4, 0, v3);

  return v4;
}

- (BOOL)isChoppingEnabled
{
  return self->choppingEnabled;
}

- (void)setChoppingEnabled:(BOOL)a3
{
  self->choppingEnabled = a3;
}

- (int64_t)successfulChop
{
  return self->successfulChop;
}

- (void)setSuccessfulChop:(int64_t)a3
{
  self->successfulChop = a3;
}

- (BCSTimingMeasurement)timingMeasurement
{
  return self->timingMeasurement;
}

- (void)setTimingMeasurement:(id)a3
{
  objc_storeStrong((id *)&self->timingMeasurement, a3);
}

- (int64_t)errorCode
{
  return self->errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->errorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timingMeasurement, 0);
}

@end
