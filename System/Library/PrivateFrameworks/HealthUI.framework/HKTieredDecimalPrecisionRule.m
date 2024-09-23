@implementation HKTieredDecimalPrecisionRule

+ (id)percentageFormatter
{
  return +[_HKTieredDecimalPrecisionPercentageFormatter sharedInstance](_HKTieredDecimalPrecisionPercentageFormatter, "sharedInstance");
}

+ (id)numberFormatter
{
  return +[_HKTieredDecimalPrecisionNumberFormatter sharedInstance](_HKTieredDecimalPrecisionNumberFormatter, "sharedInstance");
}

- (int64_t)minimumDecimalPrecision
{
  return 0;
}

- (int64_t)maximumDecimalPrecision
{
  return 2;
}

- (int64_t)decimalPrecisionForValue:(double)a3
{
  if (a3 >= 1.0)
    return a3 < 100.0;
  else
    return 2;
}

- (id)numberFormatter
{
  return (id)objc_msgSend((id)objc_opt_class(), "numberFormatter");
}

@end
