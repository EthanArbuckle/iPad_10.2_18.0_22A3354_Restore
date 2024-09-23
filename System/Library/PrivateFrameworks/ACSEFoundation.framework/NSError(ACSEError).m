@implementation NSError(ACSEError)

+ (uint64_t)forACSEError:()ACSEError
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ACSEFoundation"), 0, 0);
}

@end
