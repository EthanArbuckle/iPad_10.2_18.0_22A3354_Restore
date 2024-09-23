@implementation NSUUID(HomeHub)

- (uint64_t)an_isLocalDevice
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("00000000-0000-0000-0000-000000000000"));

  return v2;
}

@end
