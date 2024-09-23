@implementation HMMMutableCounterStatistics

- (void)addValue:(int64_t)a3
{
  int64_t valueCount;

  valueCount = self->_valueCount;
  if (valueCount)
  {
    if (self->_minValue > a3)
      self->_minValue = a3;
    if (self->_maxValue < a3)
      self->_maxValue = a3;
    self->_sumOfValues += a3;
  }
  else
  {
    self->_minValue = a3;
    self->_maxValue = a3;
    self->_sumOfValues = a3;
  }
  self->_valueCount = valueCount + 1;
}

- (HMMCounterStatistics)statistics
{
  HMMCounterStatistics *v2;

  if (self->_valueCount)
    v2 = -[HMMCounterStatistics initWithMinValue:maxValue:sumOfValues:valueCount:]([HMMCounterStatistics alloc], "initWithMinValue:maxValue:sumOfValues:valueCount:", self->_minValue, self->_maxValue, self->_sumOfValues, self->_valueCount);
  else
    v2 = 0;
  return v2;
}

@end
