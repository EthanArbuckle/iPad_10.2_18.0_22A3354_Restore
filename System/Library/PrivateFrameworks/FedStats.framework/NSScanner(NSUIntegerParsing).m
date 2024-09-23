@implementation NSScanner(NSUIntegerParsing)

- (uint64_t)scanUnsignedInteger:()NSUIntegerParsing
{
  uint64_t result;
  uint64_t v5;

  v5 = 0;
  result = objc_msgSend(a1, "scanUnsignedLongLong:", &v5);
  if ((_DWORD)result)
    *a3 = v5;
  return result;
}

@end
