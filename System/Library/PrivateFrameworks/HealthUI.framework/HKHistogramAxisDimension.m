@implementation HKHistogramAxisDimension

- (double)niceStepSizeLargerThan:(double)a3
{
  return 1.0;
}

- (double)ticksPerStepSize:(double)a3
{
  return 0.0;
}

- (id)formatterForLabelStepSize:(double)a3
{
  return 0;
}

- (id)endingLabelsFactorOverride
{
  return 0;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HKHistogramAxisDimension dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForLocation:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HKHistogramAxisDimensionDataSource)dataSource
{
  return (HKHistogramAxisDimensionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
