@implementation NSData(DataWithIntegerAddition)

+ (id)dataWithInteger:()DataWithIntegerAddition
{
  uint64_t v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v4, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
