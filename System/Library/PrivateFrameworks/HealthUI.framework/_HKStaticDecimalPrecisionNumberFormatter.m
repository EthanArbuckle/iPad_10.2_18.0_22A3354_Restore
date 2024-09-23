@implementation _HKStaticDecimalPrecisionNumberFormatter

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  int64_t decimalPrecision;
  id v7;
  void *v8;
  void *v9;

  decimalPrecision = self->_decimalPrecision;
  v7 = a3;
  HKNumberFormatterWithDecimalPrecision(decimalPrecision, objc_msgSend(a4, "roundingMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromNumber:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)formatterWithDecimalPrecision:(int64_t)a3
{
  _HKStaticDecimalPrecisionNumberFormatter *v4;

  v4 = objc_alloc_init(_HKStaticDecimalPrecisionNumberFormatter);
  -[_HKStaticDecimalPrecisionNumberFormatter setDecimalPrecision:](v4, "setDecimalPrecision:", a3);
  return v4;
}

- (void)setDecimalPrecision:(int64_t)a3
{
  self->_decimalPrecision = a3;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (int64_t)decimalPrecision
{
  return self->_decimalPrecision;
}

@end
