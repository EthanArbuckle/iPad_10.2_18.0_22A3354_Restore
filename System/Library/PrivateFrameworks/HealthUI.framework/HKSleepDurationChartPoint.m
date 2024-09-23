@implementation HKSleepDurationChartPoint

- (id)xValueAsGenericType
{
  return self->_xValue;
}

- (id)minXValueAsGenericType
{
  return self->_xValue;
}

- (id)maxXValueAsGenericType
{
  return self->_xValue;
}

- (id)minYValue
{
  return &unk_1E9CEC7D0;
}

- (id)maxYValue
{
  double asleepValue;
  NSNumber *goalValue;
  void *v4;
  double v5;

  if (self->_asleepValue >= self->_inBedValue)
    asleepValue = self->_asleepValue;
  else
    asleepValue = self->_inBedValue;
  goalValue = self->_goalValue;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  if (goalValue)
  {
    -[NSNumber doubleValue](goalValue, "doubleValue");
    if (asleepValue < v5)
      asleepValue = v5;
  }
  objc_msgSend(v4, "numberWithDouble:", asleepValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)yValue
{
  return 0;
}

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)allYValues
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_asleepValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_inBedValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  v9[2] = __61__HKSleepDurationChartPoint_chartPointsForSummaries_context___block_invoke;
  v9[3] = &unk_1E9C43158;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "hk_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

HKSleepDurationChartPoint *__61__HKSleepDurationChartPoint_chartPointsForSummaries_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKSleepDurationChartPoint *v4;
  void *v5;
  void *v6;
  HKSleepChartPointUserInfo *v7;

  v3 = a2;
  v4 = objc_alloc_init(HKSleepDurationChartPoint);
  +[HKSleepUtilities sleepDaySummaryStandardXValue:](HKSleepUtilities, "sleepDaySummaryStandardXValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepDurationChartPoint setXValue:](v4, "setXValue:", v5);

  objc_msgSend(v3, "sleepDuration");
  -[HKSleepDurationChartPoint setAsleepValue:](v4, "setAsleepValue:");
  objc_msgSend(v3, "inBedDuration");
  -[HKSleepDurationChartPoint setInBedValue:](v4, "setInBedValue:");
  objc_msgSend(v3, "hk_sleepDurationGoalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepDurationChartPoint setGoalValue:](v4, "setGoalValue:", v6);

  v7 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", objc_msgSend(*(id *)(a1 + 32), "chartType"), v3);
  -[HKSleepDurationChartPoint setUserInfo:](v4, "setUserInfo:", v7);

  return v4;
}

- (double)inBedValue
{
  return self->_inBedValue;
}

- (void)setInBedValue:(double)a3
{
  self->_inBedValue = a3;
}

- (double)asleepValue
{
  return self->_asleepValue;
}

- (void)setAsleepValue:(double)a3
{
  self->_asleepValue = a3;
}

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)goalValue
{
  return self->_goalValue;
}

- (void)setGoalValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (HKSleepChartPointUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_goalValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
