@implementation NSError(DeviceCheck)

+ (uint64_t)dc_errorWithCode:()DeviceCheck
{
  return objc_msgSend(a1, "dc_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)dc_errorWithCode:()DeviceCheck userInfo:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error"), a3, a4);
}

@end
