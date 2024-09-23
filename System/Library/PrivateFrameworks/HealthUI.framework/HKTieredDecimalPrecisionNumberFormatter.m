@implementation HKTieredDecimalPrecisionNumberFormatter

void __58___HKTieredDecimalPrecisionNumberFormatter_sharedInstance__block_invoke()
{
  _HKTieredDecimalPrecisionNumberFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(_HKTieredDecimalPrecisionNumberFormatter);
  v1 = (void *)sharedInstance_numberFormatter;
  sharedInstance_numberFormatter = (uint64_t)v0;

}

@end
