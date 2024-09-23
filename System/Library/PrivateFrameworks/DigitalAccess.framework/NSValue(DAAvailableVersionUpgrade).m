@implementation NSValue(DAAvailableVersionUpgrade)

+ (uint64_t)valueWithDAAvailableVersionUpgrade:()DAAvailableVersionUpgrade
{
  return objc_msgSend(a1, "valueWithBytes:objCType:", a3, "{_DAVersionUpgrade=QBQQ}");
}

- (uint64_t)availableVersionUpgradeValue
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return objc_msgSend(a1, "getValue:size:", x8_0, 32);
}

@end
