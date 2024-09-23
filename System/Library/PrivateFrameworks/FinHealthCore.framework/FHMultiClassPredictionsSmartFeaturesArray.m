@implementation FHMultiClassPredictionsSmartFeaturesArray

void __FHMultiClassPredictionsSmartFeaturesArray_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("FHSmartFeatureAggregateTypeRecurring"), CFSTR("FHSmartFeatureAggregateTypeRegular"), CFSTR("FHSmartFeatureAggregateTypeIrregular"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FHMultiClassPredictionsSmartFeaturesArray__fhSmartFeatures;
  FHMultiClassPredictionsSmartFeaturesArray__fhSmartFeatures = v0;

}

@end
