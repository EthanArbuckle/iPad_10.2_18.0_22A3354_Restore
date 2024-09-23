@implementation NSData(socketExtension)

+ (uint64_t)dataWithSockAddr:()socketExtension
{
  int v3;

  v3 = *(unsigned __int8 *)(a3 + 1);
  if (v3 == 2 || v3 == 30)
    return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
  else
    return 0;
}

@end
