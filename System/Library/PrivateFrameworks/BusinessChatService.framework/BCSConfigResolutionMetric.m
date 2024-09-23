@implementation BCSConfigResolutionMetric

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.businesschatd.configResolution");
}

- (NSDictionary)coreAnalyticsPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BCSConfigResolutionMetric type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("cacheHit");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[BCSConfigResolutionMetric cacheHitMeasurement](self, "cacheHitMeasurement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "flag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("duration");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[BCSConfigResolutionMetric timingMeasurement](self, "timingMeasurement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duration");
  objc_msgSend(v7, "numberWithInteger:", (uint64_t)(v9 * 1000.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  v14[3] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BCSConfigResolutionMetric errorCode](self, "errorCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

+ (id)metricForConfigType:(int64_t)a3 postProcessingMetricHandlers:(id)a4
{
  id v5;
  BCSConfigResolutionMetric *v6;
  void *v7;
  id *v8;

  v5 = a4;
  v6 = [BCSConfigResolutionMetric alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)&v6->super.super.isa, 0, v7, v5);

  return v8;
}

- (int64_t)type
{
  if (self)
    self = (BCSConfigResolutionMetric *)self->super._context;
  return -[BCSConfigResolutionMetric integerValue](self, "integerValue");
}

- (BCSFlagMeasurement)cacheHitMeasurement
{
  return self->cacheHitMeasurement;
}

- (void)setCacheHitMeasurement:(id)a3
{
  objc_storeStrong((id *)&self->cacheHitMeasurement, a3);
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
  objc_storeStrong((id *)&self->cacheHitMeasurement, 0);
}

@end
