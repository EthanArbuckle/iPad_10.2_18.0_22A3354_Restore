@implementation CNEnvironmentTestDouble(CoreRecents)

- (uint64_t)setCoreRecentsLibrary:()CoreRecents
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("core-recents-library"));
}

@end
