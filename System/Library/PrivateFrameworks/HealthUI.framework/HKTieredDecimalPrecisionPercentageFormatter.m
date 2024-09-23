@implementation HKTieredDecimalPrecisionPercentageFormatter

void __62___HKTieredDecimalPrecisionPercentageFormatter_sharedInstance__block_invoke()
{
  _HKTieredDecimalPrecisionPercentageFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(_HKTieredDecimalPrecisionPercentageFormatter);
  v1 = (void *)sharedInstance_numberFormatter_256;
  sharedInstance_numberFormatter_256 = (uint64_t)v0;

}

@end
