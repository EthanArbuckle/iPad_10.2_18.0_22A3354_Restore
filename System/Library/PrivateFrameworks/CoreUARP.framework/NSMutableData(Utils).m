@implementation NSMutableData(Utils)

- (uint64_t)appendByte:()Utils
{
  char v4;

  v4 = a3;
  return objc_msgSend(a1, "appendBytes:length:", &v4, 1);
}

- (uint64_t)appendLittleInt16:()Utils
{
  __int16 v4;

  v4 = a3;
  return objc_msgSend(a1, "appendBytes:length:", &v4, 2);
}

- (uint64_t)appendLittleInt32:()Utils
{
  int v4;

  v4 = a3;
  return objc_msgSend(a1, "appendBytes:length:", &v4, 4);
}

@end
