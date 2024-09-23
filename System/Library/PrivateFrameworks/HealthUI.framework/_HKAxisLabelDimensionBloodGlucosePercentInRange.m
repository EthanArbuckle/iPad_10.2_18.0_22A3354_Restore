@implementation _HKAxisLabelDimensionBloodGlucosePercentInRange

- (_HKAxisLabelDimensionBloodGlucosePercentInRange)init
{
  _HKAxisLabelDimensionBloodGlucosePercentInRange *v2;
  uint64_t v3;
  NSNumberFormatter *formatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKAxisLabelDimensionBloodGlucosePercentInRange;
  v2 = -[_HKAxisLabelDimensionBloodGlucosePercentInRange init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "hk_percentNumberFormatter");
    v3 = objc_claimAutoreleasedReturnValue();
    formatter = v2->_formatter;
    v2->_formatter = (NSNumberFormatter *)v3;

  }
  return v2;
}

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
  return -[NSNumberFormatter stringFromNumber:](self->_formatter, "stringFromNumber:", a3, a4);
}

- (NSNumberFormatter)formatter
{
  return self->_formatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
