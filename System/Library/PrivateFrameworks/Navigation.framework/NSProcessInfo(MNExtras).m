@implementation NSProcessInfo(MNExtras)

- (uint64_t)_navigation_isNavd
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("navd"));

  return v2;
}

@end
