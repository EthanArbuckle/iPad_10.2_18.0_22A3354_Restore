@implementation BLSHDurationCalculator

- (BLSHDurationCalculator)initWithDuration:(double)a3
{
  BLSHDurationCalculator *v4;
  BLSHDurationCalculator *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BLSHDurationCalculator;
  v4 = -[BLSHDurationCalculator init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_duration = a3;
    BSContinuousMachTimeNow();
    v5->_start = v6;
  }
  return v5;
}

- (double)remainingDuration
{
  double result;
  double v4;

  result = 1.79769313e308;
  if (self->_duration != 1.79769313e308)
  {
    BSContinuousMachTimeNow();
    return self->_duration - (v4 - self->_start);
  }
  return result;
}

@end
