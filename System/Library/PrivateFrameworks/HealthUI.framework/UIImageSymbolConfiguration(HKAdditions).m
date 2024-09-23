@implementation UIImageSymbolConfiguration(HKAdditions)

+ (uint64_t)hk_prefersMultiColorConfiguration
{
  return objc_msgSend(MEMORY[0x1E0DC3888], "configurationPreferringMulticolor");
}

+ (id)hk_medicationTrackingSymbolConfiguration
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_medicationTrackingKeyColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "configurationWithHierarchicalColor:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
