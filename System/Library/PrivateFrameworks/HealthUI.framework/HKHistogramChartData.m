@implementation HKHistogramChartData

- (HKHistogramChartData)initWithXValue:(double)a3 yValue:(double)a4
{
  HKHistogramChartData *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKHistogramChartData;
  result = -[HKHistogramChartData init](&v7, sel_init);
  if (result)
  {
    result->_xValue = a3;
    result->_yValue = a4;
  }
  return result;
}

- (double)xValue
{
  return self->_xValue;
}

- (double)yValue
{
  return self->_yValue;
}

@end
