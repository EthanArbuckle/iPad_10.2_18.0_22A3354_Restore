@implementation BCSBusinessCallerFetchMetric

+ (id)metricWithPostProcessingMetricHandlers:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)[BCSBusinessCallerFetchMetric alloc], (void *)8, 0, v3);

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
