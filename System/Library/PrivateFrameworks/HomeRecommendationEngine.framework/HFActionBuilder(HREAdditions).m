@implementation HFActionBuilder(HREAdditions)

- (id)recommendableObjectsInvolved
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a1, "containedAccessoryRepresentables");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)hre_sortActionBuilders:()HREAdditions
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_71_0);
}

@end
