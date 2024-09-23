@implementation NSArray(AXMVisionEngineLookupConvenience)

- (uint64_t)axm_featuresSortedByConfidence
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_310);
}

- (id)axm_featureWithHighestConfidence
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "axm_featuresSortedByConfidence");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
