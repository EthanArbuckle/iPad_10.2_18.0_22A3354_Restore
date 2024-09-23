@implementation NSData(MNExtras)

- (uint64_t)_navigation_unsignedIntegerValue
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(a1, "getBytes:length:", &v2, 8);
  return v2;
}

@end
