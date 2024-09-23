@implementation HMMCounterStatistics

- (HMMCounterStatistics)initWithMinValue:(int64_t)a3 maxValue:(int64_t)a4 sumOfValues:(int64_t)a5 valueCount:(int64_t)a6
{
  HMMCounterStatistics *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMMCounterStatistics;
  result = -[HMMCounterStatistics init](&v11, sel_init);
  if (result)
  {
    result->_sumOfValues = a5;
    result->_minValue = a3;
    result->_maxValue = a4;
    result->_valueCount = a6;
  }
  return result;
}

- (int64_t)averageValue
{
  return self->_sumOfValues / self->_valueCount;
}

- (int64_t)minValue
{
  return self->_minValue;
}

- (int64_t)maxValue
{
  return self->_maxValue;
}

- (int64_t)valueCount
{
  return self->_valueCount;
}

@end
