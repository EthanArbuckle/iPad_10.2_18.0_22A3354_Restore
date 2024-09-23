@implementation HKDistanceFormatter

void __HKDistanceFormatter_block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3760]);
  v1 = (void *)HKDistanceFormatter___distanceFormatter;
  HKDistanceFormatter___distanceFormatter = (uint64_t)v0;

  objc_msgSend((id)HKDistanceFormatter___distanceFormatter, "setUnitOptions:", 3);
  HKNumberFormatterWithDecimalPrecisionAndStyle(2, 1, 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)HKDistanceFormatter___distanceFormatter, "setNumberFormatter:", v2);

}

@end
