@implementation ABBurdenResult

- (ABBurdenResult)init
{
  ABBurdenResult *v2;
  ABBurdenResult *v3;
  NSDictionary *metricsForCoreAnalytics;
  ABBurdenResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABBurdenResult;
  v2 = -[ABBurdenResult init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    metricsForCoreAnalytics = v2->_metricsForCoreAnalytics;
    v2->_metricsForCoreAnalytics = (NSDictionary *)MEMORY[0x24BDBD1B8];

    v5 = v3;
  }

  return v3;
}

- (NSNumber)burdenPercentage
{
  return self->_burdenPercentage;
}

- (void)setBurdenPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_burdenPercentage, a3);
}

- (unint64_t)unavailabilityReason
{
  return self->_unavailabilityReason;
}

- (void)setUnavailabilityReason:(unint64_t)a3
{
  self->_unavailabilityReason = a3;
}

- (NSDictionary)metricsForCoreAnalytics
{
  return self->_metricsForCoreAnalytics;
}

- (void)setMetricsForCoreAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_metricsForCoreAnalytics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsForCoreAnalytics, 0);
  objc_storeStrong((id *)&self->_burdenPercentage, 0);
}

@end
