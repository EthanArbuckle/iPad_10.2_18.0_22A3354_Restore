@implementation UIControl(MKCrossPlatformOperations)

- (uint64_t)_mapkit_setTarget:()MKCrossPlatformOperations action:
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:", a3, a4, 0x2000);
}

@end
