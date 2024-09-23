@implementation NSArray(FPAction)

- (uint64_t)fp_itemIdentifiers
{
  return objc_msgSend(a1, "fp_map:", &__block_literal_global_40);
}

- (uint64_t)fp_itemIDs
{
  return objc_msgSend(a1, "fp_map:", &__block_literal_global_41);
}

@end
