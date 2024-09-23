@implementation NSMutableData(KAESGCM)

- (uint64_t)replaceTrailingWith7LSB:()KAESGCM
{
  unint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4 = bswap64(a3);
  return objc_msgSend(a1, "replaceBytesInRange:withBytes:", objc_msgSend(a1, "length", v4, v5) - 7, 7, (char *)&v4 + 1);
}

@end
