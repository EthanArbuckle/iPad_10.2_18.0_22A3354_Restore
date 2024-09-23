@implementation NSSet(HFMediaProfileContainer)

- (uint64_t)hf_appleTVMediaProfiles
{
  return objc_msgSend(a1, "na_filter:", &__block_literal_global_403);
}

- (uint64_t)hf_homePodMediaProfiles
{
  return objc_msgSend(a1, "na_filter:", &__block_literal_global_405);
}

@end
