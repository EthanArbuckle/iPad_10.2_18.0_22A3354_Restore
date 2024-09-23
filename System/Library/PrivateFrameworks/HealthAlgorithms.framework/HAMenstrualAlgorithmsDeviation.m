@implementation HAMenstrualAlgorithmsDeviation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsDeviation)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsDeviation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *metricsForCoreAnalytics;
  HAMenstrualAlgorithmsDeviation *v14;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HAMenstrualAlgorithmsDeviation;
  v5 = -[HAMenstrualAlgorithmsDeviation init](&v16, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_julianDayOfWindowStart);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_julianDayOfAnalysisWindowStart = objc_msgSend(v4, "decodeInt32ForKey:", v6);

    NSStringFromSelector(sel_julianDayOfAnalysisWindowEnd);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_julianDayOfAnalysisWindowEnd = objc_msgSend(v4, "decodeInt32ForKey:", v7);

    v8 = (void *)MEMORY[0x24BDBCF20];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_metricsForCoreAnalytics);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    metricsForCoreAnalytics = v5->_metricsForCoreAnalytics;
    v5->_metricsForCoreAnalytics = (NSDictionary *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t julianDayOfAnalysisWindowStart;
  void *v5;
  uint64_t julianDayOfAnalysisWindowEnd;
  void *v7;
  NSDictionary *metricsForCoreAnalytics;
  void *v9;
  id v10;

  v10 = a3;
  julianDayOfAnalysisWindowStart = self->_julianDayOfAnalysisWindowStart;
  NSStringFromSelector(sel_julianDayOfWindowStart);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeInt32:forKey:", julianDayOfAnalysisWindowStart, v5);

  julianDayOfAnalysisWindowEnd = self->_julianDayOfAnalysisWindowEnd;
  NSStringFromSelector(sel_julianDayOfAnalysisWindowEnd);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeInt32:forKey:", julianDayOfAnalysisWindowEnd, v7);

  metricsForCoreAnalytics = self->_metricsForCoreAnalytics;
  NSStringFromSelector(sel_metricsForCoreAnalytics);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", metricsForCoreAnalytics, v9);

}

- (unsigned)julianDayOfAnalysisWindowStart
{
  return self->_julianDayOfAnalysisWindowStart;
}

- (void)setJulianDayOfAnalysisWindowStart:(unsigned int)a3
{
  self->_julianDayOfAnalysisWindowStart = a3;
}

- (unsigned)julianDayOfAnalysisWindowEnd
{
  return self->_julianDayOfAnalysisWindowEnd;
}

- (void)setJulianDayOfAnalysisWindowEnd:(unsigned int)a3
{
  self->_julianDayOfAnalysisWindowEnd = a3;
}

- (NSDictionary)metricsForCoreAnalytics
{
  return self->_metricsForCoreAnalytics;
}

- (void)setMetricsForCoreAnalytics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsForCoreAnalytics, 0);
}

@end
