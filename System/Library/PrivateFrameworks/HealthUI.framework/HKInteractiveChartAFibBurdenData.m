@implementation HKInteractiveChartAFibBurdenData

- (HKInteractiveChartAFibBurdenData)init
{
  HKInteractiveChartAFibBurdenData *v2;
  HKInteractiveChartAFibBurdenData *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartAFibBurdenData;
  v2 = -[HKInteractiveChartAFibBurdenData init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HKInteractiveChartAFibBurdenData setClampsLowerData:](v2, "setClampsLowerData:", 0);
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
  v6.super_class = (Class)HKInteractiveChartAFibBurdenData;
  -[HKInteractiveChartSinglePointData description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, AFib Burden"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)clampsLowerData
{
  return self->_clampsLowerData;
}

- (void)setClampsLowerData:(BOOL)a3
{
  self->_clampsLowerData = a3;
}

@end
