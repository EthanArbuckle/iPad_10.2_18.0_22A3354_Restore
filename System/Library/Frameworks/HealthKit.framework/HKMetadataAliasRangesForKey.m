@implementation HKMetadataAliasRangesForKey

HKMetadataValueRange *__HKMetadataAliasRangesForKey_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  HKMetadataValueRange *v5;

  v2 = objc_msgSend(a2, "integerValue");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.0"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.0"), v2 + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKMetadataValueRange initWithMinValue:maxValue:]([HKMetadataValueRange alloc], "initWithMinValue:maxValue:", v3, v4);

  return v5;
}

@end
