@implementation NSMutableData(AppendWithSize)

- (void)appendDataAndSize:()AppendWithSize
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = bswap32(objc_msgSend(v4, "length")) >> 16;
  objc_msgSend(a1, "appendBytes:length:", &v5, 2);
  objc_msgSend(a1, "appendData:", v4);

}

@end
