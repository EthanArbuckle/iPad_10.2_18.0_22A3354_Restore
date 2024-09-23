@implementation NSNull(NUDigest)

- (uint64_t)nu_updateDigest:()NUDigest
{
  return objc_msgSend(a3, "addCString:", "<NSNull>");
}

@end
