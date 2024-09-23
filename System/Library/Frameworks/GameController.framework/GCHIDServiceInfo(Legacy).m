@implementation GCHIDServiceInfo(Legacy)

- (uint64_t)name
{
  return objc_msgSend(a1, "stringPropertyForKey:", CFSTR("Product"));
}

@end
