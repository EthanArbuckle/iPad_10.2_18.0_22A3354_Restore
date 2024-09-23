@implementation NSString(NUDigest)

- (uint64_t)nu_updateDigest:()NUDigest
{
  return objc_msgSend(a3, "addString:", a1);
}

@end
