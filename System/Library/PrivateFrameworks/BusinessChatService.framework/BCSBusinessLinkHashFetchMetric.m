@implementation BCSBusinessLinkHashFetchMetric

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.businesschatd.linkHashFetch");
}

- (NSDictionary)coreAnalyticsPayload
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("duration");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[BCSBusinessLinkHashFetchMetric timingMeasurement](self, "timingMeasurement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  objc_msgSend(v3, "numberWithInteger:", (uint64_t)(v5 * 1000.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("errorCode");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BCSBusinessLinkHashFetchMetric errorCode](self, "errorCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

+ (id)metricWithPostProcessingMetricHandlers:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)[BCSBusinessLinkHashFetchMetric alloc], (void *)5, 0, v3);

  return v4;
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
