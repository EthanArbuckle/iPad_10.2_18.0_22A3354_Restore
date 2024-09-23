@implementation BCSShardResolutionMetric

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.businesschatd.shardResolution");
}

- (NSDictionary)coreAnalyticsPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("type");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[BCSShardResolutionMetric shardItemIdentifier](self, "shardItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = CFSTR("cacheHit");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[BCSShardResolutionMetric cacheHitMeasurement](self, "cacheHitMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "flag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  v16[2] = CFSTR("duration");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[BCSShardResolutionMetric timingMeasurement](self, "timingMeasurement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "duration");
  objc_msgSend(v9, "numberWithInteger:", (uint64_t)(v11 * 1000.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  v16[3] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BCSShardResolutionMetric errorCode](self, "errorCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v14;
}

+ (id)metricForShardIdentifier:(id)a3 postProcessingMetricHandlers:(id)a4
{
  id v5;
  id v6;
  id *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)[BCSShardResolutionMetric alloc], (void *)1, v6, v5);

  return v7;
}

- (BCSShardItemIdentifying)shardItemIdentifier
{
  if (self)
    self = (BCSShardResolutionMetric *)self->super._context;
  return (BCSShardItemIdentifying *)self;
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
