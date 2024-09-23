@implementation HKStaticDecimalPrecisionRule

- (id)numberFormatter
{
  return +[_HKStaticDecimalPrecisionNumberFormatter formatterWithDecimalPrecision:](_HKStaticDecimalPrecisionNumberFormatter, "formatterWithDecimalPrecision:", self->_decimalPrecision);
}

- (HKStaticDecimalPrecisionRule)initWithDecimalPrecision:(int64_t)a3
{
  HKStaticDecimalPrecisionRule *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKStaticDecimalPrecisionRule;
  result = -[HKStaticDecimalPrecisionRule init](&v5, sel_init);
  if (result)
    result->_decimalPrecision = a3;
  return result;
}

- (int64_t)minimumDecimalPrecision
{
  return self->_decimalPrecision;
}

- (int64_t)maximumDecimalPrecision
{
  return self->_decimalPrecision;
}

- (int64_t)decimalPrecisionForValue:(double)a3
{
  return self->_decimalPrecision;
}

- (int64_t)decimalPrecision
{
  return self->_decimalPrecision;
}

- (void)setDecimalPrecision:(int64_t)a3
{
  self->_decimalPrecision = a3;
}

@end
