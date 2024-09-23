@implementation NSNull(CMSCoding)

+ (uint64_t)instanceFromCMSCoded:()CMSCoding
{
  return objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

@end
