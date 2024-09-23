@implementation NSNumberFormatter(HealthKit)

+ (id)hk_wholeNumberFormatter
{
  if (hk_wholeNumberFormatter_onceToken != -1)
    dispatch_once(&hk_wholeNumberFormatter_onceToken, &__block_literal_global_0);
  return (id)hk_wholeNumberFormatter__formatter;
}

+ (id)hk_percentNumberFormatter
{
  if (hk_percentNumberFormatter_onceToken != -1)
    dispatch_once(&hk_percentNumberFormatter_onceToken, &__block_literal_global_1);
  return (id)hk_percentNumberFormatter__formatter;
}

+ (id)hk_percentDecimalNumberFormatter
{
  if (hk_percentDecimalNumberFormatter_onceToken != -1)
    dispatch_once(&hk_percentDecimalNumberFormatter_onceToken, &__block_literal_global_2);
  return (id)hk_percentDecimalNumberFormatter__formatter;
}

@end
