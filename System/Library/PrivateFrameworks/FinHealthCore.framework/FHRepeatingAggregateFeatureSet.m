@implementation FHRepeatingAggregateFeatureSet

void __FHRepeatingAggregateFeatureSet_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("FHSmartFeatureAggregateTypeRecurring"), CFSTR("FHSmartFeatureAggregateTypeRegular"), CFSTR("FHSmartFeatureAggregateTypeIrregular"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FHRepeatingAggregateFeatureSet__fhSmartFeatures;
  FHRepeatingAggregateFeatureSet__fhSmartFeatures = v0;

}

@end
