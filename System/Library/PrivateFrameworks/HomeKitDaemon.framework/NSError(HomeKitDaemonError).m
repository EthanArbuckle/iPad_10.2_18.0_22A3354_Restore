@implementation NSError(HomeKitDaemonError)

+ (uint64_t)hmdErrorWithCode:()HomeKitDaemonError
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDErrorDomain"), a3, 0);
}

@end
