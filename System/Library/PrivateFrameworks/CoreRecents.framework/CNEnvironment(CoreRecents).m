@implementation CNEnvironment(CoreRecents)

- (uint64_t)coreRecentsLibrary
{
  return objc_msgSend(a1, "valueForKey:onCacheMiss:", CFSTR("core-recents-library"), &__block_literal_global_0);
}

@end
