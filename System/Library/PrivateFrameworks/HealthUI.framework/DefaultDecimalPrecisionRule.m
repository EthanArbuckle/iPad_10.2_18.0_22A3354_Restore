@implementation DefaultDecimalPrecisionRule

void ___DefaultDecimalPrecisionRule_block_invoke()
{
  HKStaticDecimalPrecisionRule *v0;
  void *v1;

  v0 = -[HKStaticDecimalPrecisionRule initWithDecimalPrecision:]([HKStaticDecimalPrecisionRule alloc], "initWithDecimalPrecision:", 2);
  v1 = (void *)_DefaultDecimalPrecisionRule_defaultPrecisionRule;
  _DefaultDecimalPrecisionRule_defaultPrecisionRule = (uint64_t)v0;

}

@end
