@implementation HKSleepStageDurationChartPoint

- (id)maxYValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxDurationValue);
}

- (id)allYValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_awakeValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_asleepRemValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_asleepDeepValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_asleepCoreValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HKSleepStageDurationChartPoint_chartPointsForSummaries_context___block_invoke;
  v9[3] = &unk_1E9C43158;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "hk_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

HKSleepStageDurationChartPoint *__66__HKSleepStageDurationChartPoint_chartPointsForSummaries_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKSleepStageDurationChartPoint *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  HKSleepChartPointUserInfo *v15;

  v3 = a2;
  v4 = objc_alloc_init(HKSleepStageDurationChartPoint);
  +[HKSleepUtilities sleepDaySummaryStandardXValue:](HKSleepUtilities, "sleepDaySummaryStandardXValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepDurationChartPoint setXValue:](v4, "setXValue:", v5);

  objc_msgSend(v3, "awakeDuration");
  -[HKSleepStageDurationChartPoint setAwakeValue:](v4, "setAwakeValue:");
  objc_msgSend(v3, "remSleepDuration");
  -[HKSleepStageDurationChartPoint setAsleepRemValue:](v4, "setAsleepRemValue:");
  objc_msgSend(v3, "deepSleepDuration");
  -[HKSleepStageDurationChartPoint setAsleepDeepValue:](v4, "setAsleepDeepValue:");
  objc_msgSend(v3, "coreSleepDuration");
  -[HKSleepStageDurationChartPoint setAsleepCoreValue:](v4, "setAsleepCoreValue:");
  -[HKSleepStageDurationChartPoint awakeValue](v4, "awakeValue");
  v7 = v6;
  -[HKSleepStageDurationChartPoint asleepRemValue](v4, "asleepRemValue");
  v9 = v7 + v8;
  -[HKSleepStageDurationChartPoint asleepDeepValue](v4, "asleepDeepValue");
  v11 = v9 + v10;
  -[HKSleepStageDurationChartPoint asleepCoreValue](v4, "asleepCoreValue");
  -[HKSleepStageDurationChartPoint setTotalDurationValue:](v4, "setTotalDurationValue:", v11 + v12);
  if (objc_msgSend(*(id *)(a1 + 32), "timeScope") == 6)
  {
    -[HKSleepStageDurationChartPoint allYValues](v4, "allYValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKeyPath:", CFSTR("@max.doubleValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    -[HKSleepStageDurationChartPoint setMaxDurationValue:](v4, "setMaxDurationValue:");

  }
  else
  {
    -[HKSleepStageDurationChartPoint totalDurationValue](v4, "totalDurationValue");
    -[HKSleepStageDurationChartPoint setMaxDurationValue:](v4, "setMaxDurationValue:");
  }
  v15 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", objc_msgSend(*(id *)(a1 + 32), "chartType"), v3);
  -[HKSleepChartPointUserInfo setCurrentValueViewOptions:](v15, "setCurrentValueViewOptions:", -[HKSleepChartPointUserInfo currentValueViewOptions](v15, "currentValueViewOptions") | 0x40);
  -[HKSleepDurationChartPoint setUserInfo:](v4, "setUserInfo:", v15);

  return v4;
}

- (double)awakeValue
{
  return self->_awakeValue;
}

- (void)setAwakeValue:(double)a3
{
  self->_awakeValue = a3;
}

- (double)asleepRemValue
{
  return self->_asleepRemValue;
}

- (void)setAsleepRemValue:(double)a3
{
  self->_asleepRemValue = a3;
}

- (double)asleepCoreValue
{
  return self->_asleepCoreValue;
}

- (void)setAsleepCoreValue:(double)a3
{
  self->_asleepCoreValue = a3;
}

- (double)asleepDeepValue
{
  return self->_asleepDeepValue;
}

- (void)setAsleepDeepValue:(double)a3
{
  self->_asleepDeepValue = a3;
}

- (double)totalDurationValue
{
  return self->_totalDurationValue;
}

- (void)setTotalDurationValue:(double)a3
{
  self->_totalDurationValue = a3;
}

- (double)maxDurationValue
{
  return self->_maxDurationValue;
}

- (void)setMaxDurationValue:(double)a3
{
  self->_maxDurationValue = a3;
}

@end
