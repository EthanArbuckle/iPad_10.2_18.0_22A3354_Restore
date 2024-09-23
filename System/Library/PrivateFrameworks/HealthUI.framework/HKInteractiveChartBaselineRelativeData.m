@implementation HKInteractiveChartBaselineRelativeData

- (HKInteractiveChartBaselineRelativeData)init
{
  HKInteractiveChartBaselineRelativeData *v2;
  HKInteractiveChartBaselineRelativeData *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartBaselineRelativeData;
  v2 = -[HKInteractiveChartBaselineRelativeData init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HKInteractiveChartBaselineRelativeData setRelativeValueState:](v2, "setRelativeValueState:", 0);
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)HKInteractiveChartBaselineRelativeData;
  -[HKInteractiveChartSinglePointData description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (relative)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSNumber)relativeValueState
{
  return self->_relativeValueState;
}

- (void)setRelativeValueState:(id)a3
{
  self->_relativeValueState = (NSNumber *)a3;
}

@end
