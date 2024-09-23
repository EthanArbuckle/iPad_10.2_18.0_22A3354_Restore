@implementation NSURL(SOAuthorizationExtras)

+ (uint64_t)_web_canPerformAuthorizationWithURL:()SOAuthorizationExtras
{
  return objc_msgSend((id)((uint64_t (*)(void))*MEMORY[0x1E0DCDFF8])(), "canPerformAuthorizationWithURL:responseCode:", a3, 0);
}

+ (uint64_t)_web_willPerformSOKerberosAuthorizationWithURL:()SOAuthorizationExtras
{
  return objc_msgSend((id)((uint64_t (*)(void))*MEMORY[0x1E0DCDFF8])(), "canPerformAuthorizationWithURL:responseCode:", a3, 401);
}

@end
